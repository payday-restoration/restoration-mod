if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then
	
	function CopDamage:_spawn_head_gadget(params)
		if not self._head_gear then
			return
		end

		if self._head_gear_object then
			if self._nr_head_gear_objects then
				for i = 1, self._nr_head_gear_objects, 1 do
					local head_gear_obj_name = self._head_gear_object .. tostring(i)

					self._unit:get_object(Idstring(head_gear_obj_name)):set_visibility(false)
				end
			else
				self._unit:get_object(Idstring(self._head_gear_object)):set_visibility(false)
			end

			if self._head_gear_decal_mesh then
				local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)

				self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("flesh"))
			end
		end

		local unit = World:spawn_unit(Idstring(self._head_gear), params.position, params.rotation)

		if not params.skip_push then
			local true_dir = params.dir
			local spread = math.random(6, 9)
			mvector3.spread(true_dir, spread)
			local dir = math.UP + true_dir
			local body = unit:body(0)

			body:push_at(body:mass(), dir * math.lerp(450, 650, math.random()), unit:position() + Vector3(math.rand(1), math.rand(1), math.rand(1)))
		end

		self._head_gear = false
	end
	
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
				managers.player:on_headshot_dealt(self._unit, attack_data)
			end
		end

		if not self._damage_reduction_multiplier and head then
			if self._char_tweak.headshot_dmg_mul then
				damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
			else
				damage = self._health * 10
			end
		end		

		if Network:is_server() then
			if self._unit:base()._tweak_table == "autumn" or self._unit:base()._tweak_table == "spooc_titan" then
				if self._unit:movement():is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
					local recloak_roll = math.rand(1, 100)
					local chance_recloak = 75

					if recloak_roll <= chance_recloak then
						self._unit:damage():run_sequence_simple("cloak_engaged")

						local weapon_unit = self._unit:inventory():equipped_unit()

						if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
							weapon_unit:damage():run_sequence_simple("cloak_engaged")
						end

						self._unit:movement():set_uncloaked(false)
					end
				end	
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
	
	function CopDamage:sync_damage_fire(attacker_unit, damage_percent, start_dot_dance_antimation, death, direction, weapon_type, weapon_id, healed)
		if self._dead then
			return
		end

		if Network:is_server() then
			if self._unit:base()._tweak_table == "autumn" or self._unit:base()._tweak_table == "spooc_titan" then
				if self._unit:movement():is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
					local recloak_roll = math.rand(1, 100)
					local chance_recloak = 75

					if recloak_roll <= chance_recloak then
						self._unit:damage():run_sequence_simple("cloak_engaged")

						local weapon_unit = self._unit:inventory():equipped_unit()

						if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
							weapon_unit:damage():run_sequence_simple("cloak_engaged")
						end

						self._unit:movement():set_uncloaked(false)
					end
				end	
			end
		end

		local variant = "fire"
		local damage = damage_percent * self._HEALTH_INIT_PRECENT
		local is_fire_dot_damage = false
		local attack_data = {
			variant = variant,
			attacker_unit = attacker_unit
		}
		local result = nil

		if weapon_type then
			local fire_dot = nil

			if weapon_type == CopDamage.WEAPON_TYPE_GRANADE then
				fire_dot = tweak_data.projectiles[weapon_id].fire_dot_data
			elseif weapon_type == CopDamage.WEAPON_TYPE_BULLET then
				if tweak_data.weapon.factory.parts[weapon_id].custom_stats then
					fire_dot = tweak_data.weapon.factory.parts[weapon_id].custom_stats.fire_dot_data
				end
			elseif weapon_type == CopDamage.WEAPON_TYPE_FLAMER and tweak_data.weapon[weapon_id].fire_dot_data then
				fire_dot = tweak_data.weapon[weapon_id].fire_dot_data
			end

			attack_data.fire_dot_data = fire_dot

			if attack_data.fire_dot_data then
				attack_data.fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
			end
		end

		if death then
			result = {
				type = "death",
				variant = variant
			}

			self:die(attack_data)
			self:chk_killshot(attacker_unit, "fire")

			local data = {
				variant = "fire",
				head_shot = false,
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
				is_molotov = weapon_id == "molotov"
			}

			managers.statistics:killed_by_anyone(data)
		else
			local result_type = variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "fire")

			if healed then
				result_type = "healed"
			end

			result = {
				variant = "bullet",
				type = result_type
			}

			if result_type ~= "healed" then
				self:_apply_damage_to_health(damage)
			end
		end

		attack_data.result = result
		attack_data.damage = damage
		attack_data.ignite_character = true
		attack_data.is_fire_dot_damage = is_fire_dot_damage
		attack_data.is_synced = true
		local attack_dir = nil

		if direction then
			attack_dir = direction
		elseif attacker_unit then
			attack_dir = self._unit:position() - attacker_unit:position()

			mvector3.normalize(attack_dir)
		else
			attack_dir = self._unit:rotation():y()
		end

		attack_data.attack_dir = attack_dir

		if self._head_body_name then
			local body = self._unit:body(self._head_body_name)

			self:_spawn_head_gadget({
				skip_push = true,
				position = body:position(),
				rotation = body:rotation(),
				dir = Vector3()
			})
		end

		if result.type == "death" then
			local data = {
				variant = "fire",
				head_shot = false,
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit()
			}
			local attacker_unit = attack_data.attacker_unit

			if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
				data.weapon_unit = attack_data.attacker_unit
			end

			if attacker_unit == managers.player:player_unit() then
				if alive(attacker_unit) then
					self:_comment_death(attacker_unit, self._unit)
				end

				self:_show_death_hint(self._unit:base()._tweak_table)
				managers.statistics:killed(data)

				if CopDamage.is_civilian(self._unit:base()._tweak_table) then
					managers.money:civilian_killed()
				end
			end
		end

		local weapon_unit = attack_data.weapon_unit

		if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
			weapon_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
		end

		attack_data.pos = self._unit:position()

		mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)
		self:_send_sync_fire_attack_result(attack_data)
		self:_on_damage_received(attack_data)
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
		
		if alive(attack_data.attacker_unit) and attack_data.attacker_unit:in_slot(16) then
			local has_surrendered = self._unit:brain().surrendered and self._unit:brain():surrendered() or self._unit:anim_data().surrender or self._unit:anim_data().hands_back or self._unit:anim_data().hands_tied

			if has_surrendered then
				return
			end
		end
			
		local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)

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
			attack_data.backstab = self:check_backstab(attack_data)
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
				managers.player:on_headshot_dealt(self._unit, attack_data)
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
		
		if Network:is_server() then
			if self._unit:base()._tweak_table == "autumn" or self._unit:base()._tweak_table == "spooc_titan" then
				if self._unit:movement():is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
					local recloak_roll = math.rand(1, 100)
					local chance_recloak = 75

					if recloak_roll <= chance_recloak then
						self._unit:damage():run_sequence_simple("cloak_engaged")

						local weapon_unit = self._unit:inventory():equipped_unit()

						if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
							weapon_unit:damage():run_sequence_simple("cloak_engaged")
						end

						self._unit:movement():set_uncloaked(false)
					end
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
				if attack_data.backstab then
					managers.player:add_backstab_dodge()
				end
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
	
	local tmp_vec_1 = Vector3()
	function CopDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, variant, death)
		if self._dead then
			return
		end

		if Network:is_server() then
			if self._unit:base()._tweak_table == "autumn" or self._unit:base()._tweak_table == "spooc_titan" then
				if self._unit:movement():is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
					local recloak_roll = math.rand(1, 100)
					local chance_recloak = 75

					if recloak_roll <= chance_recloak then
						self._unit:damage():run_sequence_simple("cloak_engaged")

						local weapon_unit = self._unit:inventory():equipped_unit()

						if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
							weapon_unit:damage():run_sequence_simple("cloak_engaged")
						end

						self._unit:movement():set_uncloaked(false)
					end
				end	
			end
		end

		local body = self._unit:body(i_body)
		local head = self._head_body_name and not self._unit:in_slot(16) and not self._char_tweak.ignore_headshot and body and body:name() == self._ids_head_body_name
		local damage = damage_percent * self._HEALTH_INIT_PRECENT
		local attack_data = {}
		local hit_pos = mvector3.copy(body:center_of_mass())

		attack_data.pos = hit_pos
		attack_data.attacker_unit = attacker_unit
		attack_data.variant = "bullet"
		local attack_dir, distance = nil

		if attacker_unit then
			local from_pos = attacker_unit:movement().m_detect_pos and attacker_unit:movement():m_detect_pos() or attacker_unit:movement():m_head_pos()

			attack_dir = tmp_vec_1
			distance = mvector3.direction(attack_dir, from_pos, hit_pos)
			mvector3.normalize(attack_dir)
		else
			attack_dir = self._unit:rotation():y()
		end

		attack_data.attack_dir = attack_dir
		local result, shotgun_push = nil

		if death then
			if head then
				self:_spawn_head_gadget({
					position = body:position(),
					rotation = body:rotation(),
					dir = attack_dir
				})
			end

			result = {
				variant = "bullet",
				type = "death"
			}

			self:die(attack_data)
			self:chk_killshot(attacker_unit, "bullet")

			local data = {
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				head_shot = head,
				weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
				variant = attack_data.variant
			}

			if data.weapon_unit then
				self:_check_special_death_conditions("bullet", body, attacker_unit, data.weapon_unit)
				managers.statistics:killed_by_anyone(data)

				if distance and managers.enemy:is_corpse_disposal_enabled() and not data.weapon_unit:base().thrower_unit and data.weapon_unit:base().is_category and data.weapon_unit:base():is_category("shotgun") then
					local negate_push = nil

					if data.weapon_unit:base()._parts then
						for part_id, part in pairs(data.weapon_unit:base()._parts) do
							if tweak_data.weapon.factory.parts[part_id].custom_stats and tweak_data.weapon.factory.parts[part_id].custom_stats.rays == 1 then
								negate_push = true

								break
							end
						end
					end

					if not negate_push then
						local max_distance = 500

						if attacker_unit:base() then
							if attacker_unit:base().is_husk_player or managers.groupai:state():is_unit_team_AI(attacker_unit) then
								max_distance = managers.game_play_central:get_shotgun_push_range()
							end
						end

						if distance < max_distance then
							shotgun_push = true
						end
					end
				end
			end
		else
			local result_type = variant == 1 and "knock_down" or variant == 2 and "stagger" or self:get_damage_type(damage_percent, "bullet")

			if variant == 3 then
				result_type = "healed"
			end

			result = {
				variant = "bullet",
				type = result_type
			}

			if result_type ~= "healed" then
				self:_apply_damage_to_health(damage)
			end
		end

		attack_data.variant = "bullet"
		attack_data.attacker_unit = attacker_unit
		attack_data.result = result
		attack_data.damage = damage
		attack_data.is_synced = true

		if not self._no_blood and damage > 0 then
			managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
		end

		self:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
		self:_on_damage_received(attack_data)

		if shotgun_push then
			local push_dir = attack_dir
			local push_hit_pos = hit_pos

			if attacker_unit and alive(attacker_unit) then
				if attacker_unit:movement() and attacker_unit:movement().detect_look_dir then
					push_dir = attacker_unit:movement():detect_look_dir()
				end

				local from_pos = attacker_unit:movement().m_detect_pos and attacker_unit:movement():m_detect_pos() or attacker_unit:movement():m_head_pos()
				local hit_ray = World:raycast("ray", from_pos, body:center_of_mass(), "target_body", body)

				if hit_ray then
					push_hit_pos = hit_ray.position
				end
			end

			managers.game_play_central:_do_shotgun_push(self._unit, push_hit_pos, push_dir, distance, attacker_unit)
		end
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
		local damage_effect = attack_data.damage_effect
		if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
			attack_data.backstab = self:check_backstab(attack_data)
			if attack_data.backstab and attack_data.backstab_multiplier then
				damage = damage * attack_data.backstab_multiplier
			end
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
		if self._marked_dmg_mul then
			damage = damage * self._marked_dmg_mul
		end
		local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
		local headshot_multiplier = 1
		if attack_data.attacker_unit == managers.player:player_unit() then
			headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
			if self._char_tweak and self._char_tweak.priority_shout then
				damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
			end
			if head then
				managers.player:on_headshot_dealt(self._unit, attack_data)
			end
		end
		
		if head and not self._damage_reduction_multiplier then
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
		damage_effect = self:_apply_damage_reduction(damage_effect) 
		
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
				if attack_data.backstab then
					managers.player:add_backstab_dodge()
				end
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
			if attack_data.attacker_unit == managers.player:player_unit() and self:_dismember_condition(attack_data) then
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
				local job = Global.level_data and Global.level_data.level_id
				local roll_security = math.rand(1, 100)
				if is_civlian then
					managers.money:civilian_killed()
				elseif managers.player:upgrade_value("player", "melee_kill_snatch_pager_chance", 0) > math.rand(1) then
					if job == "short1_stage1" or job == "short1_stage2" then 
					else
						if self._unit:movement():cool() then 
							snatch_pager = true
							self._unit:unit_data().has_alarm_pager = false
						elseif (not not_cool_t or t - not_cool_t < 1.5) then 
							snatch_pager = true
							self._unit:unit_data().has_alarm_pager = false	
						else
						end	
					end
				end
			elseif managers.groupai:state():is_unit_team_AI(attack_data.attacker_unit) then
				self:_AI_comment_death(attack_data.attacker_unit, self._unit)
			end
		end
		
		if attack_data.attacker_unit == managers.player:player_unit() and alive(attack_data.attacker_unit) and tweak_data.blackmarket.melee_weapons[attack_data.name_id] then
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

		local attacker = attack_data.attacker_unit

		if not attacker or attacker and alive(attacker) and attacker:id() == -1 then
			attack_data.attacker_unit = self._unit
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
	
	function CopDamage:sync_damage_melee(attacker_unit, damage_percent, damage_effect_percent, i_body, hit_offset_height, variant, death)
		if self._dead then
			return
		end

		local attack_data = {
			variant = "melee",
			attacker_unit = attacker_unit
		}
		local body = self._unit:body(i_body)
		local damage = damage_percent * self._HEALTH_INIT_PRECENT
		local result = nil

		if death then
			if variant == 6 and self:_sync_dismember(attacker_unit) then
				attack_data.body_name = body:name()

				self:_dismember_body_part(attack_data)
			end

			result = {
				variant = "melee",
				type = "death"
			}

			self:die(attack_data)
			self:chk_killshot(attacker_unit, "melee")

			local data = {
				variant = "melee",
				head_shot = false,
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name
			}

			managers.statistics:killed_by_anyone(data)
		else
			local result_type = variant == 1 and "shield_knock" or variant == 2 and "counter_tased" or variant == 5 and "taser_tased" or variant == 4 and "expl_hurt" or self:get_damage_type(damage_effect_percent, "bullet") or "fire_hurt"
			result = {
				variant = "melee",
				type = result_type
			}

			self:_apply_damage_to_health(damage)

			attack_data.variant = result_type
		end

		attack_data.result = result
		attack_data.damage = damage
		attack_data.is_synced = true
		local attack_dir = nil

		if attacker_unit then
			attack_dir = self._unit:position() - attacker_unit:position()

			mvector3.normalize(attack_dir)
		else
			attack_dir = -self._unit:rotation():y()
		end

		attack_data.attack_dir = attack_dir

		if variant == 3 then
			self._unit:unit_data().has_alarm_pager = false
		end

		attack_data.pos = self._unit:position()

		mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)

		if not self._no_blood and damage > 0 then
			managers.game_play_central:sync_play_impact_flesh(self._unit:movement():m_pos() + Vector3(0, 0, hit_offset_height), attack_dir)
		end

		self:_send_sync_melee_attack_result(attack_data, hit_offset_height)
		self:_on_damage_received(attack_data)
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

		if Network:is_server() then
			if self._unit:base()._tweak_table == "autumn" or self._unit:base()._tweak_table == "spooc_titan" then
				if self._unit:movement():is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
					local recloak_roll = math.rand(1, 100)
					local chance_recloak = 75

					if recloak_roll <= chance_recloak then
						self._unit:damage():run_sequence_simple("cloak_engaged")

						local weapon_unit = self._unit:inventory():equipped_unit()

						if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
							weapon_unit:damage():run_sequence_simple("cloak_engaged")
						end

						self._unit:movement():set_uncloaked(false)
					end
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
	
	function CopDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, direction, weapon_unit)
		if self._dead then
			return
		end

		if Network:is_server() then
			if self._unit:base()._tweak_table == "autumn" or self._unit:base()._tweak_table == "spooc_titan" then
				if self._unit:movement():is_uncloaked() and self._unit:damage() and self._unit:damage():has_sequence("cloak_engaged") then
					local recloak_roll = math.rand(1, 100)
					local chance_recloak = 75

					if recloak_roll <= chance_recloak then
						self._unit:damage():run_sequence_simple("cloak_engaged")

						local weapon_unit = self._unit:inventory():equipped_unit()

						if weapon_unit and weapon_unit:damage() and weapon_unit:damage():has_sequence("cloak_engaged") then
							weapon_unit:damage():run_sequence_simple("cloak_engaged")
						end

						self._unit:movement():set_uncloaked(false)
					end
				end	
			end
		end

		local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
		local damage = damage_percent * self._HEALTH_INIT_PRECENT
		local attack_data = {
			variant = variant,
			attacker_unit = attacker_unit
		}
		local result = nil

		if death then
			result = {
				type = "death",
				variant = variant
			}

			self:die(attack_data)

			local data = {
				variant = "explosion",
				head_shot = false,
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				weapon_unit = weapon_unit or attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit()
			}

			managers.statistics:killed_by_anyone(data)
		else
			local result_type = variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "explosion")
			result = {
				type = result_type,
				variant = variant
			}

			self:_apply_damage_to_health(damage)
		end

		attack_data.result = result
		attack_data.damage = damage
		attack_data.is_synced = true
		local attack_dir = nil

		if direction then
			attack_dir = direction
		elseif attacker_unit then
			attack_dir = self._unit:position() - attacker_unit:position()

			mvector3.normalize(attack_dir)
		else
			attack_dir = self._unit:rotation():y()
		end

		attack_data.attack_dir = attack_dir

		if self._head_body_name then
			local body = self._unit:body(self._head_body_name)

			self:_spawn_head_gadget({
				skip_push = true,
				position = body:position(),
				rotation = body:rotation(),
				dir = Vector3()
			})
		end

		if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
			managers.hud:on_hit_confirmed()
			managers.statistics:shot_fired({
				hit = true,
				weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit()
			})
		end

		if result.type == "death" then
			local data = {
				variant = "explosion",
				head_shot = false,
				name = self._unit:base()._tweak_table,
				stats_name = self._unit:base()._stats_name,
				weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit()
			}
			local attacker_unit = attack_data.attacker_unit

			if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
				data.weapon_unit = attack_data.attacker_unit
			end

			self:chk_killshot(attacker_unit, "explosion")

			if attacker_unit == managers.player:player_unit() then
				if alive(attacker_unit) then
					self:_comment_death(attacker_unit, self._unit)
				end

				self:_show_death_hint(self._unit:base()._tweak_table)
				managers.statistics:killed(data)

				if CopDamage.is_civilian(self._unit:base()._tweak_table) then
					managers.money:civilian_killed()
				end
			end
		end

		if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
			weapon_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
		end

		if not self._no_blood then
			local hit_pos = mvector3.copy(self._unit:movement():m_pos())

			mvector3.set_z(hit_pos, hit_pos.z + 100)
			managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
		end

		attack_data.pos = self._unit:position()

		mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)
		self:_send_sync_explosion_attack_result(attack_data)
		self:_on_damage_received(attack_data)
	end
	
	function CopDamage:damage_simple(attack_data)
		if self._dead or self._invulnerable then
			return
		end
		
		if self._unit:in_slot(16, 21, 22) then
			return
		end		
		
		if attack_data.variant == "graze" then
			local has_surrendered = self._unit:brain().surrendered and self._unit:brain():surrendered() or self._unit:anim_data().surrender or self._unit:anim_data().hands_back or self._unit:anim_data().hands_tied

			if has_surrendered then
				return
			end
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
		
	local _on_damage_received_original = CopDamage._on_damage_received
	function CopDamage:_on_damage_received(damage_info)
		_on_damage_received_original(self, damage_info)
		
		local dmg_chk = not self._dead and not self._unit:base():has_tag("special") and self._health > 0
	
		local t = TimerManager:game():time()
		
		local speech_allowed = not self._next_allowed_hurt_t or self._next_allowed_hurt_t and self._next_allowed_hurt_t < t
		
		if damage_info.damage and damage_info.damage > 0.01 and self._health > damage_info.damage and dmg_chk and speech_allowed then
			if not damage_info.result_type or damage_info.result_type ~= "healed" or damage_info.variant == "hurt_sick" and damage_info.result_type ~= "death" then
				if damage_info.is_fire_dot_damage or damage_info.variant == "fire" then
					if self._next_allowed_burnhurt_t and self._next_allowed_burnhurt_t < t or not self._next_allowed_burnhurt_t then
						self._unit:sound():say("burnhurt", nil, nil, nil, nil)
						self._next_allowed_burnhurt_t = t + 8
						self._next_allowed_hurt_t = t + math.random(1, 1.28)
					end
				else
					self._unit:sound():say("x01a_any_3p", nil, nil, nil, nil)
				end
			end
		end
		
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

	function CopDamage:roll_critical_hit(attack_data)
		local damage = attack_data.damage

		if not self:can_be_critical(attack_data) then
			return false, damage
		end

		local critical_hits = self._char_tweak.critical_hits or {}
		local critical_hit = false
		local critical_value = (critical_hits.base_chance or 0) + managers.player:critical_hit_chance() * (critical_hits.player_chance_multiplier or 1)

		if attack_data.backstab then
			critical_value = critical_value + managers.player:upgrade_value("player", "backstab_crits", 0)
		end

		if critical_value > 0 then
			local critical_roll = math.rand(1)
			critical_hit = critical_roll < critical_value
		end

		if critical_hit then
			local critical_damage_mul = critical_hits.damage_mul or self._char_tweak.headshot_dmg_mul

			if critical_damage_mul then
				damage = damage * critical_damage_mul
			else
				damage = self._health * 10
			end
		end

		return critical_hit, damage
	end

	function CopDamage:check_backstab(attack_data)
		if self._unit.movement and self._unit:movement().m_rot then
			local fwd_vec = mvector3.dot(self._unit:movement():m_rot():y(), managers.player:player_unit():movement():m_head_rot():y())
			if fwd_vec > 0.2 then
				return true
			end
		end

		return false
	end
end
