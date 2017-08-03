if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function CopDamage:die(attack_data)
		local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
		if self._immortal then
			debug_pause("Immortal character died!")
		end
		local variant = attack_data.variant
		self:_check_friend_4(attack_data)
		CopDamage.MAD_3_ACHIEVEMENT(attack_data)
		self:_remove_debug_gui()
		self._unit:base():set_slot(self._unit, 17)
		if alive(managers.interaction:active_unit()) then
			managers.interaction:active_unit():interaction():selected()
		end
		if char_tweak.ends_assault_on_death then
			--GroupAIStateBesiege:set_assault_endless(false)
			managers.groupai:state():force_end_assault_phase()
			managers.hud:set_buff_enabled("vip", false)
		end
		self:drop_pickup()
		self._unit:inventory():drop_shield()
		if self._unit:unit_data().mission_element then
			self._unit:unit_data().mission_element:event("death", self._unit)
			if not self._unit:unit_data().alerted_event_called then
				self._unit:unit_data().alerted_event_called = true
				self._unit:unit_data().mission_element:event("alerted", self._unit)
			end
		end
		if self._unit:movement() then
			self._unit:movement():remove_giveaway()
		end
		variant = variant or "bullet"
		self._health = 0
		self._health_ratio = 0
		self._dead = true
		self:set_mover_collision_state(false)
		if self._death_sequence then
			if self._unit:damage() and self._unit:damage():has_sequence(self._death_sequence) then
				self._unit:damage():run_sequence_simple(self._death_sequence)
			else
				debug_pause_unit(self._unit, "[CopDamage:die] does not have death sequence", self._death_sequence, self._unit)
			end
		end
		if self._unit:base():char_tweak().die_sound_event then
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event, nil, nil)
		end
		self:_on_death()
		managers.mutators:notify(Message.OnCopDamageDeath, self, attack_data)
	end

function CopDamage:heal_unit(unit, override_cooldown)
	local t = Application:time()
	local my_tweak_table = self._unit:base()._tweak_table
	local cooldown = tweak_data.medic.cooldown
	cooldown = managers.crime_spree:modify_value("MedicDamage:CooldownTime", cooldown)
	if my_tweak_table == "medic_summers" then
		cooldown = 0
	end
	if my_tweak_table == "medic" then
		if t < self._heal_cooldown_t + cooldown and not override_cooldown then
			return false
		end
	end
	if self._unit:anim_data() and self._unit:anim_data().act then
		return false
	end
	if my_tweak_table == "medic" then
		local tweak_table = unit:base()._tweak_table
		if table.contains(tweak_data.medic.disabled_units, tweak_table) then
			return false
		end
		if unit:brain() and unit:brain()._logic_data then
			local team = unit:brain()._logic_data.team
			if team and team.id ~= "law1" and (not team.friends or not team.friends.law1) then
				return false
			end
		end
		if unit:brain() and unit:brain()._logic_data and unit:brain()._logic_data.is_converted then
			return false
		end
	else
		local tweak_table = unit:base()._tweak_table
		if not table.contains(tweak_data.medic.whitelisted_units, tweak_table) then
			return false
		end
		if unit:brain() and unit:brain()._logic_data then
			local team = unit:brain()._logic_data.team
			if team and team.id ~= "law1" and (not team.friends or not team.friends.law1) then
				return false
			end
		end
	end
	local cop_dmg = unit:character_damage()
	cop_dmg._health = cop_dmg._HEALTH_INIT
	cop_dmg._health_ratio = 1
	cop_dmg:_update_debug_ws()
	self._heal_cooldown_t = t
	if not self._unit:character_damage():dead() then
		local action_data = {
			type = "heal",
			body_part = 3,
			client_interrupt = Network:is_client() and true or false
		}
		self._unit:movement():action_request(action_data)
	end
	managers.crime_spree:run_func("OnEnemyHealed", self._unit, unit)
	managers.network:session():send_to_peers("sync_medic_heal", self._unit)
	return true
end

function CopDamage:stun_hit(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	local result = {
		type = "concussion",
		variant = attack_data.variant
	}
	if self._char_tweak.tank_concussion then
		result = {
			type = "expl_hurt",
			variant = attack_data.variant
		}		
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local damage_percent = 0
	local attacker = attack_data.attacker_unit
	self:_send_stun_attack_result(attacker, damage_percent, self:_get_attack_variant_index(attack_data.result.variant), attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)
	self:_create_stun_exit_clbk()
end
	
function CopDamage:damage_fire(attack_data)
	self._attack_data = attack_data
	if self._dead or self._invulnerable then
		return
	end
	local was_alive = not self._dead
	local result
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage
	local headshot_multiplier = 1
	damage = damage * (self._char_tweak.damage.fire_damage_mul or 1)
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
		end
	end
	if not self._damage_reduction_multiplier and head then
		if self._char_tweak and self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end
	damage = self:_apply_damage_reduction(damage)
	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
	if self._immortal then		
		damage = math.min(damage, self._health - 1)		
	end
	if damage >= self._health then
		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
		else
			attack_data.damage = self._health
			result = {
				type = "death",
				variant = attack_data.variant
			}
			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "fire")
		end
	else
		attack_data.damage = damage
		local result_type = attack_data.variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "fire")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self:_apply_damage_to_health(damage)
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	if self._head_body_name and attack_data.variant ~= "stun" then
		head = attack_data.col_ray.body and self._head_body_key and attack_data.col_ray.body:key() == self._head_body_key
		local body = self._unit:body(self._head_body_name)
	end
	local attacker = attack_data.attacker_unit
	if not attacker or attacker and alive(attacker) and attacker:id() == -1 then
		attacker = self._unit
	end
	local attacker_unit = attack_data.attacker_unit
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant,
			head_shot = head,
			is_molotov = attack_data.is_molotov
		}
		if not attack_data.is_fire_dot_damage or data.is_molotov then
			managers.statistics:killed_by_anyone(data)
		end
		if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attacker_unit == managers.player:player_unit() and alive(attack_data.weapon_unit) and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
			managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
		end
		if attacker_unit and alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			if not attack_data.is_fire_dot_damage or data.is_molotov then
				managers.statistics:killed(data)
			end
			if is_civilian then
				managers.money:civilian_killed()
			end
			self:_check_damage_achievements(attack_data, false)
		end
	end
	local weapon_unit = attack_data.weapon_unit or attacker
	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end
	if not attack_data.is_fire_dot_damage then
		local fire_dot_data = attack_data.fire_dot_data
		local flammable
		local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
		if char_tweak.flammable == nil then
			flammable = true
		else
			flammable = char_tweak.flammable
		end
		local distance = 1000
		local hit_loc = attack_data.col_ray.hit_position
		if hit_loc and attacker_unit and attacker_unit.position then
			distance = mvector3.distance(hit_loc, attacker_unit:position())
		end
		local fire_dot_max_distance = 3000
		local fire_dot_trigger_chance = 30
		if fire_dot_data then
			fire_dot_max_distance = tonumber(fire_dot_data.dot_trigger_max_distance)
			fire_dot_trigger_chance = tonumber(fire_dot_data.dot_trigger_chance)
		end
		local start_dot_damage_roll = math.random(1, 100)
		local start_dot_dance_antimation = false
		if flammable and not attack_data.is_fire_dot_damage and distance < fire_dot_max_distance and fire_dot_trigger_chance >= start_dot_damage_roll then
			managers.fire:add_doted_enemy(self._unit, TimerManager:game():time(), attack_data.weapon_unit, fire_dot_data.dot_length, fire_dot_data.dot_damage, attack_data.attacker_unit, attack_data.is_molotov)
			start_dot_dance_antimation = true
		end
		if fire_dot_data then
			fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
			attack_data.fire_dot_data = fire_dot_data
		end
	else
	end
	self:_send_fire_attack_result(attack_data, attacker, damage_percent, attack_data.is_fire_dot_damage, attack_data.col_ray.ray, attack_data.result.type == "healed")
	self:_on_damage_received(attack_data)
end

	local mvec_1 = Vector3()
	local mvec_2 = Vector3()
	function CopDamage:damage_melee(attack_data)
		if self._dead or self._invulnerable then
			return
		end
		if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
			return "friendly_fire"
		end
		local result
		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		local damage = attack_data.damage
		if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
			local critical_hit, crit_damage = self:roll_critical_hit(damage)
			if critical_hit then
				managers.hud:on_crit_confirmed()
				damage = crit_damage
			else
				managers.hud:on_hit_confirmed()
			end
			if tweak_data.achievement.cavity.melee_type == attack_data.name_id and not CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.achievment:award(tweak_data.achievement.cavity.award)
			end
		end
		damage = damage * (self._marked_dmg_mul or 1)
		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		local damage = attack_data.damage
		local damage_effect = attack_data.damage_effect
		local headshot_multiplier = 1
		if attack_data.attacker_unit == managers.player:player_unit() then
			headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
			if self._char_tweak and self._char_tweak.priority_shout then
				damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
			end
			if head then
				managers.player:on_headshot_dealt()
			end
		end
		if self._damage_reduction_multiplier then
			damage = damage * self._damage_reduction_multiplier
			damage_effect = damage_effect * self._damage_reduction_multiplier
		elseif head then
			if self._char_tweak and self._char_tweak.headshot_dmg_mul then
				damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
				damage_effect = damage_effect * self._char_tweak.headshot_dmg_mul * headshot_multiplier
			else
				damage = self._health * 10
				damage_effect = self._health * 10
			end
		end
		local damage_effect = attack_data.damage_effect
		local damage_effect_percent
		damage = self:_apply_damage_reduction(damage)
		damage = math.clamp(damage, self._HEALTH_INIT_PRECENT, self._HEALTH_INIT)
		local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
		damage = damage_percent * self._HEALTH_INIT_PRECENT
		damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
		if self._immortal then
			damage = math.min(damage, self._health - 1)
		end
		if damage >= self._health then
			local medic = managers.enemy:get_nearby_medic(self._unit)
			if medic and medic:character_damage():heal_unit(self._unit) then
				result = {
					type = "healed",
					variant = attack_data.variant
				}
			else
				damage_effect_percent = 1
				attack_data.damage = self._health
				result = {
					type = "death",
					variant = attack_data.variant
				}
				self:die(attack_data)
				self:chk_killshot(attack_data.attacker_unit, "melee")
			end
		else
			attack_data.damage = damage
			damage_effect = math.clamp(damage_effect, self._HEALTH_INIT_PRECENT, self._HEALTH_INIT)
			damage_effect_percent = math.ceil(damage_effect / self._HEALTH_INIT_PRECENT)
			damage_effect_percent = math.clamp(damage_effect_percent, 1, self._HEALTH_GRANULARITY)
			local result_type = attack_data.shield_knock and self._char_tweak.damage.shield_knocked and "shield_knock" or attack_data.variant == "counter_tased" and "counter_tased" or attack_data.variant == "taser_tased" and "taser_tased" or attack_data.variant == "counter_spooc" and "expl_hurt" or self:get_damage_type(damage_effect_percent, "melee") or "fire_hurt"
			result = {
				type = result_type,
				variant = attack_data.variant
			}
			self:_apply_damage_to_health(damage)
		end
		attack_data.result = result
		attack_data.pos = attack_data.col_ray.position
		local dismember_victim = false
		local snatch_pager = false
		if result.type == "death" then
			if self:_dismember_condition(attack_data) then
				self:_dismember_body_part(attack_data)
				dismember_victim = true
			end
			local data = {
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				head_shot = head,
				weapon_unit = attack_data.weapon_unit,
				name_id = attack_data.name_id,
				variant = attack_data.variant
			}
			managers.statistics:killed_by_anyone(data)
			if attack_data.attacker_unit == managers.player:player_unit() then
				self:_comment_death(attack_data.attacker_unit, self._unit)
				self:_show_death_hint(self._unit:base()._tweak_table)
				managers.statistics:killed(data)
				local is_civlian = CopDamage.is_civilian(self._unit:base()._tweak_table)
				local is_gangster = CopDamage.is_gangster(self._unit:base()._tweak_table)
				local is_cop = not is_civlian and not is_gangster
				if not is_civlian and managers.groupai:state():whisper_mode() and managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.cant_hear_you_scream.mask then
					managers.achievment:award_progress(tweak_data.achievement.cant_hear_you_scream.stat)
				end
				mvector3.set(mvec_1, self._unit:position())
				mvector3.subtract(mvec_1, attack_data.attacker_unit:position())
				mvector3.normalize(mvec_1)
				mvector3.set(mvec_2, self._unit:rotation():y())
				local from_behind = mvector3.dot(mvec_1, mvec_2) >= 0
					if tweak_data.blackmarket.melee_weapons[attack_data.name_id] then
						local achievements = tweak_data.achievement.enemy_melee_kill_achievements or {}
						local melee_type = tweak_data.blackmarket.melee_weapons[attack_data.name_id].type
						local enemy_type = self._unit:base()._tweak_table
						local unit_weapon = self._unit:base()._default_weapon_id
						local health_ratio = managers.player:player_unit():character_damage():health_ratio() * 100
						local melee_pass, melee_weapons_pass, type_pass, enemy_pass, enemy_weapon_pass, diff_pass, health_pass, level_pass, job_pass, jobs_pass, enemy_count_pass, all_pass, cop_pass, gangster_pass, civilian_pass, stealth_pass, on_fire_pass, behind_pass
						for achievement, achievement_data in pairs(achievements) do
						melee_pass = not achievement_data.melee_id or achievement_data.melee_id == attack_data.name_id
						melee_weapons_pass = not achievement_data.melee_weapons or table.contains(achievement_data.melee_weapons, attack_data.name_id)
						type_pass = not achievement_data.melee_type or melee_type == achievement_data.melee_type
						enemy_pass = not achievement_data.enemy or enemy_type == achievement_data.enemy
						enemy_weapon_pass = not achievement_data.enemy_weapon or unit_weapon == achievement_data.enemy_weapon
						behind_pass = not achievement_data.from_behind or from_behind
						diff_pass = not achievement_data.difficulty or table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
						health_pass = not achievement_data.health or health_ratio <= achievement_data.health
						if achievement_data.level_id then
							level_pass = (managers.job:current_level_id() or "") == achievement_data.level_id
						end
						job_pass = not achievement_data.job or managers.job:current_real_job_id() == achievement_data.job
						jobs_pass = not achievement_data.jobs or table.contains(achievement_data.jobs, managers.job:current_real_job_id())
						enemy_count_pass = not achievement_data.enemy_kills or managers.statistics:session_enemy_killed_by_type(achievement_data.enemy_kills.enemy, "melee") >= achievement_data.enemy_kills.count
						cop_pass = not achievement_data.is_cop or is_cop
						gangster_pass = not achievement_data.is_gangster or is_gangster
						civilian_pass = not achievement_data.is_not_civilian or not is_civlian
						stealth_pass = not achievement_data.is_stealth or managers.groupai:state():whisper_mode()
						on_fire_pass = not achievement_data.is_on_fire or managers.fire:is_set_on_fire(self._unit)
						if achievement_data.enemies then
							enemy_pass = false
							for _, enemy in pairs(achievement_data.enemies) do
								if enemy == enemy_type then
									enemy_pass = true
								else
								end
							end
						end
						all_pass = melee_pass and melee_weapons_pass and type_pass and enemy_pass and enemy_weapon_pass and behind_pass and diff_pass and health_pass and level_pass and job_pass and jobs_pass and cop_pass and gangster_pass and civilian_pass and stealth_pass and on_fire_pass and enemy_count_pass
						if all_pass then
							if achievement_data.stat then
								managers.achievment:award_progress(achievement_data.stat)
							elseif achievement_data.award then
								managers.achievment:award(achievement_data.award)
							elseif achievement_data.challenge_stat then
								managers.challenge:award_progress(achievement_data.challenge_stat)
							elseif achievement_data.trophy_stat then
								managers.custom_safehouse:award(achievement_data.trophy_stat)
							elseif achievement_data.challenge_award then
								managers.challenge:award(achievement_data.challenge_award)
							end
						end
					end
				end
				if is_cop and Global.game_settings.level_id == "nightclub" and attack_data.name_id and attack_data.name_id == "fists" then
					managers.achievment:award_progress(tweak_data.achievement.final_rule.stat)
				end
				local not_cool_t = self._unit:movement():not_cool_t()
				local t = TimerManager:game():time()
				local roll_security = math.rand(1, 100)
				if is_civlian then
					managers.money:civilian_killed()
				elseif managers.player:upgrade_value("player", "melee_kill_snatch_pager_chance", 0) > math.rand(1) then
					if self._unit:movement():cool() then 
						snatch_pager = true
						self._unit:unit_data().has_alarm_pager = false
						if roll_security <= 25 then
							managers.player:local_player():sound():say( "Play_pln_spawn_01", false, false )
						end
					elseif (not not_cool_t or t - not_cool_t < 1) then 
						snatch_pager = true
						self._unit:unit_data().has_alarm_pager = false	
						if roll_security <= 25 then
							managers.player:local_player():sound():say( "Play_pln_spawn_01", false, false )
						end
					else
					end	
				end
			end
		end
		local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
		local variant
		if result.type == "shield_knock" then
			variant = 1
		elseif result.type == "counter_tased" then
			variant = 2
		elseif result.type == "expl_hurt" then
			variant = 4
		elseif snatch_pager then
			variant = 3
		elseif result.type == "taser_tased" then
			variant = 5
		elseif dismember_victim then
			variant = 6
		elseif result.type == "healed" then
			variant = 7
		else
			variant = 0
		end
		local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
		self:_send_melee_attack_result(attack_data, damage_percent, damage_effect_percent, hit_offset_height, variant, body_index)
		self:_on_damage_received(attack_data)
		return result
	end

function CopDamage:damage_bullet(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	if self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end
	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	if not is_civilian then
		managers.player:send_message(Message.OnEnemyShot, nil, attack_data.attacker_unit, self._unit, attack_data and attack_data.variant or "bullet")
	end
	if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name and not attack_data.armor_piercing and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit and attack_data.weapon_unit:base().is_category and not attack_data.weapon_unit:base():is_category("bow", "crossbow", "saw") then
		local armor_pierce_roll = math.rand(1)
		local armor_pierce_value = 0
		if attack_data.attacker_unit == managers.player:player_unit() and not attack_data.weapon_unit:base().thrower_unit then
			armor_pierce_value = armor_pierce_value + attack_data.weapon_unit:base():armor_piercing_chance()
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("player", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_2", 0)
			if attack_data.weapon_unit:base():got_silencer() then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_silencer", 0)
			end
			if attack_data.weapon_unit:base():is_category("saw") then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("saw", "armor_piercing_chance", 0)
			end
			if attack_data.attacker_unit == managers.player:player_unit() and attack_data.weapon_unit:base().thrower_unit then
				armor_pierce_value = 1
			end
		elseif attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
			local owner = attack_data.attacker_unit:base():get_owner()
			if alive(owner) then
				if owner == managers.player:player_unit() then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance", 0)
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance_2", 0)
				else
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance") or 0)
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance_2") or 0)
				end
			end
		end
		if armor_pierce_roll >= armor_pierce_value then
			return
		end
	end
	local result
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage
	if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
	end
	damage = damage * (self._char_tweak.damage.bullet_damage_mul or 1)
	local roll = math.rand(1, 100)
	local dodge_chance = self._char_tweak.damage.bullet_dodge_chance or 0
	if attack_data.attacker_unit == managers.player:player_unit() and attack_data.weapon_unit:base().thrower_unit then
		dodge_chance = 0
	end
	if roll <= dodge_chance and self._char_tweak.damage.bullet_dodge_chance then
		self._unit:sound():play("pickup_fak_skill", nil, nil)
		return
	end
	damage = damage * (self._marked_dmg_mul or 1)
	if self._marked_dmg_mul and self._marked_dmg_dist_mul then
		local dst = mvector3.distance(attack_data.origin, self._unit:position())
		local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]
		if dst > spott_dst[1] then
			damage = damage * spott_dst[2]
		end
	end
	local headshot = false
	local headshot_multiplier = 1
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
			headshot = true
		end
	end
	if not self._damage_reduction_multiplier and head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end
	if attack_data.weapon_unit and attack_data.weapon_unit:base().is_category and attack_data.weapon_unit:base():is_category("smg", "lmg", "assault_rifle", "minigun") and managers.player:has_category_upgrade("weapon", "automatic_head_shot_add") then
		attack_data.add_head_shot_mul = managers.player:upgrade_value("weapon", "automatic_head_shot_add", nil)
	end
	if not head and attack_data.add_head_shot_mul and self._char_tweak and not self._char_tweak.must_headshot then
		local mul = self._char_tweak.headshot_dmg_mul * attack_data.add_head_shot_mul + 1
		damage = damage * mul
	end
	damage = self:_apply_damage_reduction(damage)
	attack_data.raw_damage = damage
	local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end
	if damage >= self._health then
		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
		else
			if head then
				managers.player:on_lethal_headshot_dealt(attack_data.attacker_unit, attack_data)
				if damage > math.random(10) then
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
				end
			end
			attack_data.damage = self._health
			result = {
				type = "death",
				variant = attack_data.variant
			}
			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "bullet", headshot)
		end
	else
		attack_data.damage = damage
		local result_type = not self._char_tweak.immune_to_knock_down and (attack_data.knock_down and "knock_down" or attack_data.stagger and not self._has_been_staggered and "stagger") or self:get_damage_type(damage_percent, "bullet")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self:_apply_damage_to_health(damage)
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}
		if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
			managers.statistics:killed_by_anyone(data)
		end
		if attack_data.attacker_unit == managers.player:player_unit() then
			local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)
			self:_comment_death(attack_data.attacker_unit, self._unit, special_comment)
			self:_show_death_hint(self._unit:base()._tweak_table)
			local attacker_state = managers.player:current_state()
			data.attacker_state = attacker_state
			managers.statistics:killed(data)
			self:_check_damage_achievements(attack_data, head)
			if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
				managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
			end
			if is_civilian then
				managers.money:civilian_killed()
			end
		elseif attack_data.attacker_unit:in_slot(managers.slot:get_mask("criminals_no_deployables")) then
			self:_AI_comment_death(attack_data.attacker_unit, self._unit)
		elseif attack_data.attacker_unit:base().sentry_gun then
			if Network:is_server() then
				local server_info = attack_data.weapon_unit:base():server_information()
				if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
					local owner_peer = managers.network:session():peer(server_info.owner_peer_id)
					if owner_peer then
						owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant, data.stats_name)
					end
				else
					data.attacker_state = managers.player:current_state()
					managers.statistics:killed(data)
				end
			end
			local sentry_attack_data = deep_clone(attack_data)
			sentry_attack_data.attacker_unit = attack_data.attacker_unit:base():get_owner()
			if sentry_attack_data.attacker_unit == managers.player:player_unit() then
				self:_check_damage_achievements(sentry_attack_data, head)
			else
				self._unit:network():send("sync_damage_achievements", sentry_attack_data.weapon_unit, sentry_attack_data.attacker_unit, sentry_attack_data.damage, sentry_attack_data.col_ray and sentry_attack_data.col_ray.distance, head)
			end
		end
	end
	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local attacker = attack_data.attacker_unit
	if attacker:id() == -1 then
		attacker = self._unit
	end
	local weapon_unit = attack_data.weapon_unit
	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, attacker, result.type == "death", damage_percent)
	end
	local variant
	if result.type == "knock_down" then
		variant = 1
	elseif result.type == "stagger" then
		variant = 2
		self._has_been_staggered = true
	elseif result.type == "healed" then
		variant = 3
	else
		variant = 0
	end
	self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height, variant)
	self:_on_damage_received(attack_data)
	return result
end

function CopDamage:damage_explosion(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	if not is_civilian and attack_data.attacker_unit and alive(attack_data.attacker_unit) then
		managers.player:send_message(Message.OnEnemyShot, nil, attack_data.attacker_unit, self._unit, "explosion")
	end
	local result
	local damage = attack_data.damage
	damage = managers.crime_spree:modify_value("CopDamage:DamageExplosion", damage, self._unit:base()._tweak_table)
	if self._unit:base():char_tweak().DAMAGE_CLAMP_EXPLOSION then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_EXPLOSION)
	end
	damage = damage * (self._char_tweak.damage.explosion_damage_mul or 1)
	damage = damage * (self._marked_dmg_mul or 1)
	damage = self:_apply_damage_reduction(damage)
	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end
	if damage >= self._health then
		if self:check_medic_heal() then
			attack_data.variant = "healed"
			result = {
				type = "healed",
				variant = attack_data.variant
			}
		else
			attack_data.damage = self._health
			result = {
				type = "death",
				variant = attack_data.variant
			}
			self:die(attack_data)
		end
	else
		attack_data.damage = damage
		local result_type = attack_data.variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "explosion")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self:_apply_damage_to_health(damage)
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local head
	if self._head_body_name and attack_data.variant ~= "stun" then
		head = attack_data.col_ray.body and self._head_body_key and attack_data.col_ray.body:key() == self._head_body_key
		local body = self._unit:body(self._head_body_name)
		self:_spawn_head_gadget({
			position = body:position(),
			rotation = body:rotation(),
			dir = -attack_data.col_ray.ray
		})
	end
	local attacker = attack_data.attacker_unit
	if not attacker or attacker:id() == -1 then
		attacker = self._unit
	end
	result.ignite_character = attack_data.ignite_character
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant,
			head_shot = head
		}
		managers.statistics:killed_by_anyone(data)
		local attacker_unit = attack_data.attacker_unit
		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attacker_unit == managers.player:player_unit() and attack_data.weapon_unit and attack_data.weapon_unit:base().weapon_tweak_data and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
			managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
		end
		self:chk_killshot(attacker_unit, "explosion")
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)
			if is_civilian then
				managers.money:civilian_killed()
			end
			self:_check_damage_achievements(attack_data, false)
		end
	end
	local weapon_unit = attack_data.weapon_unit
	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, attacker, result.type == "death", damage_percent)
	end
	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(attack_data.pos, attack_data.col_ray.ray)
	end
	self:_send_explosion_attack_result(attack_data, attacker, damage_percent, self:_get_attack_variant_index(attack_data.result.variant), attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)
	return result
end

function CopDamage:_apply_min_health_limit(damage, damage_percent)
	local lower_health_percentage_limit = self._unit:base():char_tweak().LOWER_HEALTH_PERCENTAGE_LIMIT
	if lower_health_percentage_limit then
		local real_damage_percent = damage_percent / self._HEALTH_GRANULARITY
		local new_health_ratio = self._health_ratio - real_damage_percent
		if lower_health_percentage_limit > new_health_ratio then
			real_damage_percent = self._health_ratio - lower_health_percentage_limit
			damage_percent = real_damage_percent * self._HEALTH_GRANULARITY
			damage = damage_percent * self._HEALTH_INIT_PRECENT
		end
	end
	return damage, damage_percent
end

function CopDamage:_comment_death(attacker, killed_unit, special_comment)
	local victim_base = killed_unit:base()
	if special_comment then
		PlayerStandard.say_line(attacker:sound(), special_comment)
	elseif victim_base:has_tag("tank") then
		PlayerStandard.say_line(attacker:sound(), "g30x_any")
	elseif victim_base:has_tag("spooc") then
		PlayerStandard.say_line(attacker:sound(), "g33x_any")
	elseif victim_base:has_tag("taser") then
		PlayerStandard.say_line(attacker:sound(), "g32x_any")
	elseif victim_base:has_tag("shield") then
		PlayerStandard.say_line(attacker:sound(), "g31x_any")
	elseif victim_base:has_tag("sniper") then
		PlayerStandard.say_line(attacker:sound(), "g35x_any")
	elseif victim_base:has_tag("medic") then
		PlayerStandard.say_line(attacker:sound(), "g36x_any")
	elseif victim_base:has_tag("custom") then
		PlayerStandard.say_line(attacker:sound(), "g92")
	end
end
function CopDamage:_AI_comment_death(unit, killed_unit)
	local victim_base = killed_unit:base()
	if victim_base:has_tag("tank") then
		unit:sound():say("g30x_any", true)
	elseif victim_base:has_tag("spooc") then
		unit:sound():say("g33x_any", true)
	elseif victim_base:has_tag("taser") then
		unit:sound():say("g32x_any", true)
	elseif victim_base:has_tag("shield") then
		unit:sound():say("g31x_any", true)
	elseif victim_base:has_tag("sniper") then
		unit:sound():say("g35x_any", true)
	elseif victim_base:has_tag("medic") then
		unit:sound():say("g36x_any", true)
	elseif victim_base:has_tag("custom") then
		unit:sound():say("g92", true)
	end
end

Hooks:PostHook(CopDamage, "_on_death", "SCRemoveJoker", function(self)
    
    if self._unit:unit_data().is_convert and SC._converts then
        for i, unit in pairs(SC._converts) do
            if unit == self._unit then
                table.remove(SC._converts, i)
            end
        end
    end
    
end)

--stealth BS, making it so cuffed guard's pagers WILL NOT go off--
    origCopDamageDie = origCopDamageDie or CopDamage.die
    function CopDamage:die(...)
        origCopDamageDie(self, ...)
        io.stderr:write(self._unit:interaction().tweak_data .."\n")
        if self._unit:interaction().tweak_data == "hostage_convert" then
            self._unit:interaction():set_active(false, true, false)
        end
    end

function CopDamage.is_hrt(type)
    return type == "swat" or type == "fbi" or type == "cop" or type == "security"
end

end