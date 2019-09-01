if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	function CopDamage:damage_fire(attack_data)	
		if self._dead or self._invulnerable then
			return
		end
		
        if not (attack_data and attack_data.attacker_unit) or not managers.criminals:character_peer_id_by_unit(attack_data.attacker_unit) then 
        -- no friendly fire >:(
            return
        end			

		local result = nil
		local damage = attack_data.damage
		local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)

		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		local headshot_multiplier = 1

		damage = damage * (self._char_tweak.damage.fire_damage_mul or 1)
		if attack_data.attacker_unit == managers.player:player_unit() then
			local critical_hit, crit_damage = self:roll_critical_hit(attack_data)

			if critical_hit then
				damage = crit_damage
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
			if self._char_tweak.headshot_dmg_mul then
				damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
			else
				damage = self._health * 10
			end
		end		
		
		if self._unit:base()._tweak_table == "autumn" then
			local recloak_roll = math.rand(1, 100)
			local chance_recloak = 75	
			if recloak_roll <= chance_recloak then
				self._unit:damage():run_sequence_simple("cloak_engaged")
			end			
		end
		
		if self._unit:base()._tweak_table == "spooc_titan" then
			local recloak_roll = math.rand(1, 100)
			local chance_recloak = 75	
			if recloak_roll <= chance_recloak then
				self._unit:damage():run_sequence_simple("cloak_engaged")
			end			
		end		

		local helmet_pop_roll = math.rand(1, 100)
		local chance_pop = 5
		if helmet_pop_roll <= chance_pop then
			if head then
				if self._unit:base()._tweak_table == "boom" then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				else	
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
				end
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

		if self._health <= damage then
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
			slot8 = self._unit:body(self._head_body_name)
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
			
			if data.name == "boom" then
				if data.head_shot then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				end
			end				
			
			if data.head_shot then
				self:_spawn_head_gadget({
					position = attack_data.col_ray.body:position(),
					rotation = attack_data.col_ray.body:rotation(),
					dir = attack_data.col_ray.ray
				})
			end			

			if data.name == "swat_titan" then
				if not data.head_shot then
					managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, nil, 7.5)
				end
			end	

			if not attack_data.is_fire_dot_damage or data.is_molotov then
				managers.statistics:killed_by_anyone(data)
			end

			if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attacker_unit == managers.player:player_unit() and alive(attack_data.weapon_unit) and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base().is_category and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
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
			local flammable = nil
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

			if flammable and not attack_data.is_fire_dot_damage and distance < fire_dot_max_distance and start_dot_damage_roll <= fire_dot_trigger_chance then
				managers.fire:add_doted_enemy(self._unit, TimerManager:game():time(), attack_data.weapon_unit, fire_dot_data.dot_length, fire_dot_data.dot_damage, attack_data.attacker_unit, attack_data.is_molotov)

				start_dot_dance_antimation = true
			end

			if fire_dot_data then
				fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
				attack_data.fire_dot_data = fire_dot_data
			end
		end

		self:_send_fire_attack_result(attack_data, attacker, damage_percent, attack_data.is_fire_dot_damage, attack_data.col_ray.ray, attack_data.result.type == "healed")
		self:_on_damage_received(attack_data)

		if not is_civilian and attack_data.attacker_unit and alive(attack_data.attacker_unit) then
			managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
		end
	end
	
	function CopDamage:damage_bullet(attack_data)
		if self._dead or self._invulnerable then
			return
		end
		if self._unit:in_slot(22) then	
			if attack_data.attacker_unit:in_slot(16) then
				return
			end
		end
		if self:is_friendly_fire(attack_data.attacker_unit) then
			return "friendly_fire"
		end
		local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
		--local ap_skill = self._is_team_ai and managers.player:has_category_upgrade("team", "crew_ai_ap_ammo")
		local ap_skill = managers.player:has_category_upgrade("team", "crew_ai_ap_ammo")

		if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name and not attack_data.armor_piercing and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit and attack_data.weapon_unit:base().is_category and not attack_data.weapon_unit:base():is_category("bow", "crossbow", "saw") then
			local armor_pierce_roll = math.rand(1)
			local armor_pierce_value = 0
			if attack_data.attacker_unit:in_slot(16) then
				if ap_skill then
					armor_pierce_value = 1
				end
			end				
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
			local critical_hit, crit_damage = self:roll_critical_hit(attack_data)
			if critical_hit then
				managers.hud:on_crit_confirmed()
				damage = crit_damage
				attack_data.critical_hit = true
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
		if not self._char_tweak.ignore_headshot and not self._damage_reduction_multiplier and head then
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
			local tweak_headshot_mul = math.max(0, self._char_tweak.headshot_dmg_mul - 1)
			local mul = tweak_headshot_mul * attack_data.add_head_shot_mul + 1
			damage = damage * mul
		end
		
		if self._unit:base()._tweak_table == "autumn" then
		    if not attack_data.attacker_unit:in_slot(16) then
			    local recloak_roll = math.rand(1, 100)
			    local chance_recloak = 75	
			    if recloak_roll <= chance_recloak then
			    	self._unit:damage():run_sequence_simple("cloak_engaged")
			    end	
			end	

			--Just so he's not instagibbed by bots
			if attack_data.attacker_unit:in_slot(16) then
				damage = damage * 0.1
			end			
		end
				
		if self._unit:base()._tweak_table == "spooc_titan" then
		    if not attack_data.attacker_unit:in_slot(16) then
			    local recloak_roll = math.rand(1, 100)
			    local chance_recloak = 75	
			    if recloak_roll <= chance_recloak then
			    	self._unit:damage():run_sequence_simple("cloak_engaged")
			    end	
			end					
		end		
		
		if attack_data.weapon_unit and attack_data.weapon_unit:base().is_category and attack_data.weapon_unit:base():is_category("saw") then
			managers.groupai:state():_voice_saw() --THAT MADMAN HAS A FUCKIN' SAW
		end
		
		if attack_data.attacker_unit:base().sentry_gun and not self:is_friendly_fire(attack_data.attacker_unit) then
			managers.groupai:state():_voice_sentry() --FUCKING SCI-FI ROBOT GUNS
		end		
		
		local helmet_pop_roll = math.rand(1, 100)
		local chance_pop = 5
		if helmet_pop_roll <= chance_pop then
			if head then
				if self._unit:base()._tweak_table == "boom" then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				else	
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
				end
			end	
		end
				
		damage = self:_apply_damage_reduction(damage)
		attack_data.raw_damage = damage
		attack_data.headshot = head
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
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
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
			
			if data.head_shot and data.name == "boom" then
				self._unit:damage():run_sequence_simple("grenadier_glass_break")
			end			

			if data.name == "swat_titan" then
				if not data.head_shot then
					managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, nil, 7.5)
				end
			end			

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
			weapon_unit:base():add_damage_result(self._unit, result.type == "death", attacker, damage_percent)
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
		
		if not is_civilian then
			managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
		end

		result.attack_data = attack_data
		
		return result
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
		local is_civlian = CopDamage.is_civilian(self._unit:base()._tweak_table)
		local is_gangster = CopDamage.is_gangster(self._unit:base()._tweak_table)
		local is_cop = not is_civlian and not is_gangster		
		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		local damage = attack_data.damage
		if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
			local critical_hit, crit_damage = self:roll_critical_hit(attack_data)
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
		
		local helmet_pop_roll = math.rand(1, 100)
		local chance_pop = 5
		if helmet_pop_roll <= chance_pop then
			if head then
				if self._unit:base()._tweak_table == "boom" then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				else	
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
				end
			end	
		end				
		
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

			if data.name == "boom" then
				if data.head_shot then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				end
			end				
			
			if data.head_shot then
				self:_spawn_head_gadget({
					position = attack_data.col_ray.body:position(),
					rotation = attack_data.col_ray.body:rotation(),
					dir = attack_data.col_ray.ray
				})
			end			
			
			managers.statistics:killed_by_anyone(data)
			if attack_data.attacker_unit == managers.player:player_unit() then
				self:_comment_death(attack_data.attacker_unit, self._unit)
				self:_show_death_hint(self._unit:base()._tweak_table)
				managers.statistics:killed(data)
				if not is_civlian and managers.groupai:state():whisper_mode() and managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.cant_hear_you_scream.mask then
					managers.achievment:award_progress(tweak_data.achievement.cant_hear_you_scream.stat)
				end
				mvector3.set(mvec_1, self._unit:position())
				mvector3.subtract(mvec_1, attack_data.attacker_unit:position())
				mvector3.normalize(mvec_1)
				mvector3.set(mvec_2, self._unit:rotation():y())
				local from_behind = mvector3.dot(mvec_1, mvec_2) >= 0
								
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
		
		if tweak_data.blackmarket.melee_weapons[attack_data.name_id] then
			local achievements = tweak_data.achievement.enemy_melee_hit_achievements or {}
			local melee_type = tweak_data.blackmarket.melee_weapons[attack_data.name_id].type
			local enemy_base = self._unit:base()
			local enemy_movement = self._unit:movement()
			local enemy_type = enemy_base._tweak_table
			local unit_weapon = enemy_base._default_weapon_id
			local health_ratio = managers.player:player_unit():character_damage():health_ratio() * 100
			local melee_pass, melee_weapons_pass, type_pass, enemy_pass, enemy_weapon_pass, diff_pass, health_pass, level_pass, job_pass, jobs_pass, enemy_count_pass, tags_all_pass, tags_any_pass, all_pass, cop_pass, gangster_pass, civilian_pass, stealth_pass, on_fire_pass, behind_pass, result_pass, mutators_pass, critical_pass, action_pass = nil

			for achievement, achievement_data in pairs(achievements) do
				melee_pass = not achievement_data.melee_id or achievement_data.melee_id == attack_data.name_id
				melee_weapons_pass = not achievement_data.melee_weapons or table.contains(achievement_data.melee_weapons, attack_data.name_id)
				type_pass = not achievement_data.melee_type or melee_type == achievement_data.melee_type
				result_pass = not achievement_data.result or attack_data.result.type == achievement_data.result
				enemy_pass = not achievement_data.enemy or enemy_type == achievement_data.enemy
				enemy_weapon_pass = not achievement_data.enemy_weapon or unit_weapon == achievement_data.enemy_weapon
				behind_pass = not achievement_data.from_behind or from_behind
				diff_pass = not achievement_data.difficulty or table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
				health_pass = not achievement_data.health or health_ratio <= achievement_data.health
				level_pass = not achievement_data.level_id or (managers.job:current_level_id() or "") == achievement_data.level_id
				job_pass = not achievement_data.job or managers.job:current_real_job_id() == achievement_data.job
				jobs_pass = not achievement_data.jobs or table.contains(achievement_data.jobs, managers.job:current_real_job_id())
				enemy_count_pass = not achievement_data.enemy_kills or achievement_data.enemy_kills.count <= managers.statistics:session_enemy_killed_by_type(achievement_data.enemy_kills.enemy, "melee")
				tags_all_pass = not achievement_data.enemy_tags_all or enemy_base:has_all_tags(achievement_data.enemy_tags_all)
				tags_any_pass = not achievement_data.enemy_tags_any or enemy_base:has_any_tag(achievement_data.enemy_tags_any)
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

							break
						end
					end
				end

				mutators_pass = managers.mutators:check_achievements(achievement_data)
				critical_pass = not achievement_data.critical

				if achievement_data.critical then
					critical_pass = attack_data.critical_hit
				end

				action_pass = true

				if achievement_data.action then
					local action = enemy_movement:get_action(achievement_data.action.body_part)
					local action_type = action and action:type()
					action_pass = action_type == achievement_data.action.type
				end

				all_pass = melee_pass and melee_weapons_pass and type_pass and enemy_pass and enemy_weapon_pass and behind_pass and diff_pass and health_pass and level_pass and job_pass and jobs_pass and cop_pass and gangster_pass and civilian_pass and stealth_pass and on_fire_pass and enemy_count_pass and tags_all_pass and tags_any_pass and result_pass and mutators_pass and critical_pass and action_pass

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
	
end

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local old_death = CopDamage.die
	function CopDamage:die(attack_data)
		local attacker_unit = attack_data.attacker_unit
		local roll = math.rand(1, 100)
		local no_ammo_chance = 80
		local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
		if attacker_unit then
			if attacker_unit:in_slot(16) then
				if not char_tweak.always_drop then
					if roll <= no_ammo_chance then
						self:set_pickup(nil)
					end
				end
			end
		end		
	
		old_death(self, attack_data)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)	

		
		if self._unit:interaction().tweak_data == "hostage_convert" then
			self._unit:interaction():set_active(false, true, false)
		end
		
		if char_tweak.ends_assault_on_death then
			managers.groupai:state():force_end_assault_phase()
			managers.hud:set_buff_enabled("vip", false)
		end
		if self._unit:contour() then
			self._unit:contour():remove("omnia_heal", false)
			self._unit:contour():remove("medic_show", false)
			self._unit:contour():remove("medic_buff", false)
		end
		if self._unit:base()._tweak_table == "spooc" then
			self._unit:damage():run_sequence_simple("kill_spook_lights")
		end 
		if char_tweak.failure_on_death then
			if managers.platform:presence() == "Playing" then 
				managers.network:session():send_to_peers( "mission_ended", false ) 
				game_state_machine:change_state_by_name( "gameoverscreen" ) 
			end
		end 		 
		
		if char_tweak.do_autumn_blackout then --clear all equipment and re-enable them when autumn dies
			managers.enemy:end_autumn_blackout()
		end
		
		if self._unit:base():has_tag("tank_titan") or self._unit:base():has_tag("shield_titan") or self._unit:base():has_tag("captain") or self._unit:base():has_tag("lpf") then
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
		end		
		--big fuck off death line unit check	
		--blues and omnia shield
		if self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") or self._unit:name() == Idstring("units/payday2/characters/ene_swat_2/ene_swat_2") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield") then	        
			self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
		--nypd and lapd blues	
		elseif self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_1/ene_lapd_light_1") or self._unit:name() == Idstring("units/pd2_mod_lapd/characters/ene_lapd_light_2/ene_lapd_light_2") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1") or self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2") then	        
			self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
		--welcome to city swat hell lol
		--scripted softcap dude with no mask, murky elite shotgunner and elite reapers
		elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump") then	        
			self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_4, nil, true)	
		--lots of murkies	
		elseif self._unit:name() == Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump") or self._unit:name() == Idstring("units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1") or self._unit:name() == Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2") or self._unit:name() == Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1") or self._unit:name() == Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2") then	       			
		   self._unit:sound_source(source):stop()
		   self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_3, nil, true)		
		--omnia	
		elseif self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2") or self._unit:name() == Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3") then	       
		   self._unit:sound_source(source):stop()
		   self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)		
		--fbi ready teams
		elseif self._unit:name() == Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1") or self._unit:name() == Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2") then	       
		   self._unit:sound_source(source):stop()
		   self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)	
		--gensec
	    elseif self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc") or self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1") or self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2") or self._unit:name() == Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3") then		        	
		    self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)
		--zeal zombies
		elseif self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3") then	        		
		    self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_4, nil, true)			
		--gensec zombies
	    elseif  self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2") or self._unit:name() == Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3") then		  
			self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_4, nil, true)
		--zeal
		elseif self._unit:name() == Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1") or self._unit:name() == Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2") or self._unit:name() == Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3") then		
		    self._unit:sound_source(source):stop()
			self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, true)		          		
		elseif self._unit:base():has_tag("city_swat") then
		    self._unit:sound():say("", true)
		else
	    	self._unit:sound():say(self._unit:base():char_tweak().die_sound_event or "x02a_any_3p", true)
	    end		
	end
	
	function CopDamage:heal_unit(unit, override_cooldown)
		local t = Application:time()
		local my_tweak_table = self._unit:base()._tweak_table
		local cooldown = tweak_data.medic.cooldown
		cooldown = managers.modifiers:modify_value("MedicDamage:CooldownTime", cooldown)
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
		if my_tweak_table.custom_voicework then
			local voicelines = _G.restoration.BufferedSounds[my_tweak_table.custom_voicework]
			if voicelines["heal"] then
				local line_to_use = voicelines.heal[math.random(#voicelines.heal)]
				self._unit:base():play_voiceline(line_to_use)
			end
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

		managers.network:session():send_to_peers("sync_medic_heal", self._unit)
		return true
	end
	
	function CopDamage:stun_hit(attack_data)
		if self._dead or self._invulnerable or self._unit:in_slot(16, 21, 22) then
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
		
	function CopDamage:damage_explosion(attack_data)
		if attack_data and attack_data.weapon_unit then
			if attack_data.weapon_unit:base()._variant == "explosion" and not attack_data.weapon_unit:base()._thrower_unit then
				-- no friendly fire >:(
				return
			end
		end
	
		if self._dead or self._invulnerable then
			return
		end
		local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)

		local result
		local damage = attack_data.damage
		damage = managers.modifiers:modify_value("CopDamage:DamageExplosion", damage, self._unit:base()._tweak_table)
		if self._unit:base():char_tweak().DAMAGE_CLAMP_EXPLOSION then
			damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_EXPLOSION)
		end
		damage = damage * (self._char_tweak.damage.explosion_damage_mul or 1)
		damage = damage * (self._marked_dmg_mul or 1)
		if attack_data.attacker_unit == managers.player:player_unit() then
			if attack_data.weapon_unit and attack_data.variant ~= "stun" then
				managers.hud:on_hit_confirmed()
			end
		end
		
		if self._unit:base()._tweak_table == "boom" then
			self._unit:damage():run_sequence_simple("grenadier_glass_break")
		end				

		if self._unit:base()._tweak_table == "autumn" then
			local recloak_roll = math.rand(1, 100)
			local chance_recloak = 75	
			if recloak_roll <= chance_recloak then
				self._unit:damage():run_sequence_simple("cloak_engaged")
			end			
		end		
		
		if self._unit:base()._tweak_table == "spooc_titan" then
			local recloak_roll = math.rand(1, 100)
			local chance_recloak = 75	
			if recloak_roll <= chance_recloak then
				self._unit:damage():run_sequence_simple("cloak_engaged")
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
							
			if data.name == "swat_titan" then
				if not data.head_shot then
					managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, nil, 7.5)
				end
			end				
			
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
			weapon_unit:base():add_damage_result(self._unit, result.type == "death", attacker, damage_percent)
		end
		if not self._no_blood then
			managers.game_play_central:sync_play_impact_flesh(attack_data.pos, attack_data.col_ray.ray)
		end
		self:_send_explosion_attack_result(attack_data, attacker, damage_percent, self:_get_attack_variant_index(attack_data.result.variant), attack_data.col_ray.ray)
		self:_on_damage_received(attack_data)
		
		if not is_civilian and attack_data.attacker_unit and alive(attack_data.attacker_unit) then
			managers.player:send_message(Message.OnEnemyShot, nil, attack_data.attacker_unit, self._unit, "explosion")
		end		
		
		return result
	end
	
	function CopDamage:damage_simple(attack_data)
		if self._dead or self._invulnerable or self._unit:in_slot(16, 21, 22) then
			return
		end
		
		local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
		local result = nil
		local damage = attack_data.damage

		if self._unit:base():char_tweak().DAMAGE_CLAMP_SHOCK then
			damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_SHOCK)
		end

		damage = math.clamp(damage, 0, self._HEALTH_INIT)
		local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
		damage = damage_percent * self._HEALTH_INIT_PRECENT
		damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

		if self._immortal then
			damage = math.min(damage, self._health - 1)
		end

		if self._health <= damage then
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
			local result_type = self:get_damage_type(damage_percent)
			result = {
				type = result_type,
				variant = attack_data.variant
			}

			self:_apply_damage_to_health(damage)
		end

		attack_data.result = result
		local attacker = attack_data.attacker_unit

		if not attacker or attacker:id() == -1 then
			attacker = self._unit
		end

		if result.type == "death" then
			local data = {
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				owner = attack_data.owner,
				weapon_unit = attack_data.weapon_unit,
				variant = attack_data.variant
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

			self:chk_killshot(attacker_unit, "shock")

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

		if not self._no_blood then
			managers.game_play_central:sync_play_impact_flesh(attack_data.pos, attack_data.attack_dir)
		end

		local i_result = ({
			healed = 3,
			knock_down = 1,
			stagger = 2
		})[result.type] or 0

		self:_send_simple_attack_result(attacker, damage_percent, self:_get_attack_variant_index(attack_data.result.variant), i_result)
		self:_on_damage_received(attack_data)

		if not is_civilian and attack_data.attacker_unit and alive(attack_data.attacker_unit) then
			managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
		end

		return result
	end
		
	function CopDamage:damage_mission(attack_data)
		local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
		if self._dead or (self._invulnerable or self._immortal) and not attack_data.forced then
			return
		end

		if self.immortal and self.is_escort then
			if attack_data.backup_so then
				attack_data.backup_so:on_executed(self._unit)
			end

			return
		end
		
		if char_tweak.no_damage_mission then
			return
		end

		local result = nil
		local damage_percent = self._HEALTH_GRANULARITY
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}

		self:die(attack_data)

		attack_data.result = result
		attack_data.attack_dir = self._unit:rotation():y()
		attack_data.pos = self._unit:position()

		if attack_data.attacker_unit == managers.player:local_player() and CopDamage.is_civilian(self._unit:base()._tweak_table) then
			managers.money:civilian_killed()
		end

		self:_send_explosion_attack_result(attack_data, self._unit, damage_percent, self:_get_attack_variant_index("explosion"), attack_data.col_ray and attack_data.col_ray.ray)
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

		if self._char_tweak and self._char_tweak.do_autumn_blackout then --clear all equipment and re-enable them when autumn dies
			managers.enemy:end_autumn_blackout()
		end

		if self._unit:unit_data().is_convert and SC._converts then
			for i, unit in pairs(SC._converts) do
				if unit == self._unit then
					table.remove(SC._converts, i)
				end
			end
		end
		
	end)

	function CopDamage.is_hrt(type)
		return type == "swat" or type == "fbi" or type == "cop" or type == "security"
	end

end
