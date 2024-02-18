local mvec3_set = mvector3.set
local mvec3_dir = mvector3.direction
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_add = mvector3.add
local mvec3_copy = mvector3.copy
local tmp_pos = Vector3()
local math_min = math.min
local math_max = math.max
local math_round = math.round
local math_ceil = math.ceil
local table_insert = table.insert
local table_remove = table.remove
local world_g = World

local draw_explosion_sphere = nil
local draw_sync_explosion_sphere = nil
local draw_splinters = nil
local draw_obstructed_splinters = nil
local draw_splinter_hits = nil
local debug_draw_duration = 3

--[[
function FireManager:update(t, dt)
	for index = #self._doted_enemies, 1, -1 do
		local dot_info = self._doted_enemies[index]

		--no grace period means that DoT ticks will consistently trigger as long as the enemy is "doted"
		--instead of resetting the timer each time a new DoT instance is applied, correctly allowing players
		--to dose enemies continuously to maximize damage, as the latest update to flamethrower stats intended

		--Molotovs/ground fires are the exception, as otherwise they'd just melt anything caught by them
		--instead of continuosly dealing damage at a steady pace to whoever stands on them
		if dot_info.fire_dot_counter >= 0.5 then
			self:_damage_fire_dot(dot_info)

			dot_info.fire_dot_counter = 0
		end

		if t > dot_info.fire_damage_received_time + dot_info.dot_length then
			if dot_info.fire_effects then
				for _, fire_effect_id in ipairs(dot_info.fire_effects) do
					world_g:effect_manager():fade_kill(fire_effect_id)
				end
			end

			--unless intended for optimization, this just ends up confusing people as ALL fire effects are removed
			--if it was done for that reason, please consider another method, having fire vanish for no reason
			--is bad, as you won't know if the enemy you just flamed will keep taking fire DoT damage or not

			--self:_remove_flame_effects_from_doted_unit(dot_info.enemy_unit)

			if dot_info.sound_source then
				self:_stop_burn_body_sound(dot_info.sound_source)
			end

			table_remove(self._doted_enemies, index)

			if dot_info.enemy_unit and alive(dot_info.enemy_unit) then
				self._dozers_on_fire[dot_info.enemy_unit:id()] = nil
			end
		else
			dot_info.fire_dot_counter = dot_info.fire_dot_counter + dt
		end
	end
end

function FireManager:check_achievemnts(unit, t)
	if not unit and not alive(unit) then
		return
	end

	if not unit:base() or not unit:base()._tweak_table then
		return
	end

	if CopDamage.is_civilian(unit:base()._tweak_table) then
		return
	end

	--grant achievements only for the local player when they're the attackers
	if self._doted_enemies then
		for _, dot_info in ipairs(self._doted_enemies) do
			if not dot_info.user_unit or dot_info.user_unit ~= managers.player:player_unit() then
				return
			end
		end
	else
		return
	end

	for i = #self._enemies_on_fire, 1, -1 do
		local data = self._enemies_on_fire[i]

		if t - data.t > 5 or data.unit == unit then
			table_remove(self._enemies_on_fire, i)
		end
	end

	table_insert(self._enemies_on_fire, {
		unit = unit,
		t = t
	})

	if tweak_data.achievement.disco_inferno then
		local count = #self._enemies_on_fire

		if count >= 10 then
			managers.achievment:award(tweak_data.achievement.disco_inferno)
		end
	end

	--proper Dozer check
	if unit:base().has_tag and unit:base():has_tag("tank") then
		local unit_id = unit:id()

		self._dozers_on_fire[unit_id] = self._dozers_on_fire[unit_id] or {
			t = t,
			unit = unit
		}
	end

	if tweak_data.achievement.overgrill then
		for dozer_id, dozer_info in pairs(self._dozers_on_fire) do
			if t - dozer_info.t >= 10 then
				managers.achievment:award(tweak_data.achievement.overgrill)
			end
		end
	end
end

function FireManager:add_doted_enemy(enemy_unit, fire_damage_received_time, weapon_unit, dot_length, dot_damage, user_unit, is_molotov)
	local dot_info = self:_add_doted_enemy(enemy_unit, fire_damage_received_time, weapon_unit, dot_length, dot_damage, user_unit, is_molotov)

	managers.network:session():send_to_peers_synched("sync_add_doted_enemy", enemy_unit, 0, weapon_unit, dot_length, dot_damage, user_unit, is_molotov)
end

function FireManager:_add_doted_enemy(enemy_unit, fire_damage_received_time, weapon_unit, dot_length, dot_damage, user_unit, is_molotov)
	if not self._doted_enemies then
		return
	end

	local dot_info = nil

	for _, cur_dot_info in ipairs(self._doted_enemies) do
		if cur_dot_info.enemy_unit == enemy_unit then
			--instead of always updating fire_damage_received_time, only do so (plus update the dot length) if the new length
			--is longer than the remaining DoT time (DoT damage also gets replaced as it's pretty much a new DoT instance)
			if cur_dot_info.fire_damage_received_time + cur_dot_info.dot_length < fire_damage_received_time + dot_length then
				cur_dot_info.fire_damage_received_time = fire_damage_received_time
				cur_dot_info.dot_length = dot_length
				cur_dot_info.dot_damage = dot_damage
			else
				--to avoid a higher damage DoT from not applying, or applying with a longer timer
				if cur_dot_info.dot_damage < dot_damage then
					cur_dot_info.fire_damage_received_time = fire_damage_received_time
					cur_dot_info.dot_length = dot_length
					cur_dot_info.dot_damage = dot_damage
				end
			end

			--always override the attacker and weapons used so that the latest attacker gets credited properly
			cur_dot_info.weapon_unit = weapon_unit
			cur_dot_info.user_unit = user_unit
			cur_dot_info.is_molotov = is_molotov

			dot_info = cur_dot_info

			break
		end
	end

	if dot_info then
		dot_info.fire_damage_received_time = fire_damage_received_time
		dot_info.weapon_unit = weapon_unit
		dot_info.user_unit = user_unit
		dot_info.is_molotov = is_molotov
		dot_info.dot_damage = dot_damage
		dot_info.dot_length = dot_length

	else
		dot_info = {
			fire_dot_counter = 0,
			enemy_unit = enemy_unit,
			fire_damage_received_time = fire_damage_received_time,
			weapon_unit = weapon_unit,
			dot_length = dot_length,
			dot_damage = dot_damage,
			user_unit = user_unit,
			is_molotov = is_molotov
		}

		table.insert(self._doted_enemies, dot_info)

		local has_delayed_info = false

		for index, delayed_dot in pairs(self.predicted_dot_info) do
			if enemy_unit == delayed_dot.enemy_unit then
				dot_info.sound_source = delayed_dot.sound_source
				dot_info.fire_effects = delayed_dot.fire_effects

				table.remove(self.predicted_dot_info, index)

				has_delayed_info = true
			end
		end

		if not has_delayed_info then
			self:_start_enemy_fire_effect(dot_info)
			self:start_burn_body_sound(dot_info)
		end
	end

	self:check_achievemnts(enemy_unit, fire_damage_received_time)
end

function FireManager:detect_and_give_dmg(params)
	local hit_pos = params.hit_pos
	local slotmask = params.collision_slotmask
	local user_unit = params.user
	local dmg = params.damage
	local player_dmg = params.player_damage or dmg
	local range = params.range
	local ignore_unit = params.ignore_unit
	local curve_pow = params.curve_pow
	local col_ray = params.col_ray
	local owner = params.owner
	local fire_dot_data = params.fire_dot_data
	local is_molotov = params.is_molotov
	local push_units = true

	if params.push_units ~= nil then
		push_units = params.push_units
	end

	if draw_explosion_sphere or draw_splinters or draw_obstructed_splinters or draw_splinter_hits then
		if owner and owner:base() and owner:base().get_name_id and owner:base():get_name_id() == "environment_fire" then
			debug_draw_duration = 0.1
		end
	end

	if player_dmg ~= 0 then
		local player = managers.player:player_unit()

		if player then
			player:character_damage():damage_fire({
				variant = "fire",
				position = hit_pos,
				range = range,
				damage = player_dmg,
				ignite_character = params.ignite_character
			})
		end
	end

	if draw_explosion_sphere then
		local new_brush = Draw:brush(Color.red:with_alpha(0.5), debug_draw_duration)
		new_brush:sphere(hit_pos, range)
	end

	local bodies = nil

	if ignore_unit then
		bodies = world_g:find_bodies(ignore_unit, "intersect", "sphere", hit_pos, range, slotmask)
	else
		bodies = world_g:find_bodies("intersect", "sphere", hit_pos, range, slotmask)
	end

	local splinters = {
		mvec3_copy(hit_pos)
	}
	local dirs = {
		Vector3(range, 0, 0),
		Vector3(-range, 0, 0),
		Vector3(0, range, 0),
		Vector3(0, -range, 0),
		Vector3(0, 0, range),
		Vector3(0, 0, -range)
	}

	local geometry_mask = managers.slot:get_mask("world_geometry")

	for _, dir in ipairs(dirs) do
		mvec3_set(tmp_pos, dir)
		mvec3_add(tmp_pos, hit_pos)

		local splinter_ray = world_g:raycast("ray", hit_pos, tmp_pos, "slot_mask", geometry_mask)

		if splinter_ray then
			tmp_pos = splinter_ray.position - dir:normalized() * math_min(splinter_ray.distance, 10)
		end

		if draw_splinters then
			local new_brush = Draw:brush(Color.white:with_alpha(0.5), debug_draw_duration)
			new_brush:cylinder(hit_pos, tmp_pos, 0.5)
		end

		local near_splinter = false

		for _, s_pos in ipairs(splinters) do
			if mvec3_dis_sq(tmp_pos, s_pos) < 900 then
				near_splinter = true

				break
			end
		end

		if not near_splinter then
			table_insert(splinters, mvec3_copy(tmp_pos))
		end
	end

	local count_cops, count_gangsters, count_civilians, count_cop_kills, count_gangster_kills, count_civilian_kills = 0, 0, 0, 0, 0, 0
	local units_to_hit, hit_units = {}, {}
	local units_to_push, tweak_name = nil

	if push_units and push_units == true then
		units_to_push = {}
	end

	for _, hit_body in ipairs(bodies) do
		if alive(hit_body) then
			local hit_unit = hit_body:unit()
			local hit_unit_key = hit_unit:key()

			if units_to_push then
				units_to_push[hit_unit_key] = hit_unit
			end

			local character = hit_unit:character_damage() and hit_unit:character_damage().damage_fire and not hit_unit:character_damage():dead()
			local apply_dmg = hit_body:extension() and hit_body:extension().damage
			local dir, damage, ray_hit, damage_character = nil

			if character then
				if not units_to_hit[hit_unit_key] then
					if params.no_raycast_check_characters then
						ray_hit = true
						units_to_hit[hit_unit_key] = true
						damage_character = true
					else
						for i_splinter, s_pos in ipairs(splinters) do
							ray_hit = not world_g:raycast("ray", s_pos, hit_body:center_of_mass(), "slot_mask", geometry_mask, "report")

							if ray_hit then
								units_to_hit[hit_unit_key] = true
								damage_character = true

								if draw_splinter_hits then
									local new_brush = Draw:brush(Color.green:with_alpha(0.5), debug_draw_duration)
									new_brush:cylinder(s_pos, hit_body:center_of_mass(), 0.5)
								end

								break
							else
								if draw_obstructed_splinters then
									local new_brush = Draw:brush(Color.yellow:with_alpha(0.5), debug_draw_duration)
									new_brush:cylinder(s_pos, hit_body:center_of_mass(), 0.5)
								end
							end
						end
					end

					if owner and ray_hit then
						if hit_unit:base() and hit_unit:base()._tweak_table and not hit_unit:character_damage():dead() then
							tweak_name = hit_unit:base()._tweak_table

							if CopDamage.is_civilian(tweak_name) then
								count_civilians = count_civilians + 1
							elseif CopDamage.is_gangster(tweak_name) then
								count_gangsters = count_gangsters + 1
							elseif hit_unit:base().has_tag and hit_unit:base():has_tag("law") then
								count_cops = count_cops + 1
							end
						end
					end
				end
			elseif apply_dmg or hit_body:dynamic() then
				if not units_to_hit[hit_unit_key] then
					ray_hit = true
					units_to_hit[hit_unit_key] = true
				end
			end

			if not ray_hit and units_to_hit[hit_unit_key] and apply_dmg and hit_unit:character_damage() and hit_unit:character_damage().damage_fire then
				if params.no_raycast_check_characters then
					ray_hit = true
				else
					for i_splinter, s_pos in ipairs(splinters) do
						ray_hit = not world_g:raycast("ray", s_pos, hit_body:center_of_mass(), "slot_mask", geometry_mask, "report")

						if ray_hit then
							break
						end
					end
				end
			end

			if ray_hit then
				hit_units[hit_unit_key] = hit_unit
				dir = hit_body:center_of_mass()
				mvec3_dir(dir, hit_pos, dir)
				damage = dmg

				if apply_dmg then
					self:_apply_body_damage(true, hit_body, user_unit, dir, damage)
				end

				damage = math_max(damage, 1)

				if character and damage_character then
					local dead_before = hit_unit:character_damage():dead()
					local action_data = {
						variant = "fire",
						damage = damage,
						attacker_unit = user_unit,
						weapon_unit = owner,
						ignite_character = params.ignite_character,
						col_ray = self._col_ray or {
							position = hit_body:position(),
							ray = dir
						},
						is_fire_dot_damage = false,
						fire_dot_data = fire_dot_data,
						is_molotov = is_molotov
					}

					hit_unit:character_damage():damage_fire(action_data)

					if owner and not dead_before and hit_unit:base() and hit_unit:base()._tweak_table and hit_unit:character_damage():dead() then
						tweak_name = hit_unit:base()._tweak_table

						if CopDamage.is_civilian(tweak_name) then
							count_civilian_kills = count_civilian_kills + 1
						elseif CopDamage.is_gangster(tweak_name) then
							count_gangster_kills = count_gangster_kills + 1
						elseif hit_unit:base().has_tag and hit_unit:base():has_tag("law") then
							count_cop_kills = count_cop_kills + 1
						end
					end
				end
			end
		end
	end

	if units_to_push then
		managers.explosion:units_to_push(units_to_push, params.hit_pos, params.range)
	end

	local alert_radius = params.alert_radius or 3000
	local alert_filter = params.alert_filter or managers.groupai:state():get_unit_type_filter("civilians_enemies")
	local alert_unit = user_unit

	if alive(alert_unit) and alert_unit:base() and alert_unit:base().thrower_unit then
		alert_unit = alert_unit:base():thrower_unit()
	end

	managers.groupai:state():propagate_alert({
		"fire",
		params.hit_pos,
		alert_radius,
		alert_filter,
		alert_unit
	})

	local results = {}

	if owner then
		results.count_cops = count_cops
		results.count_gangsters = count_gangsters
		results.count_civilians = count_civilians
		results.count_cop_kills = count_cop_kills
		results.count_gangster_kills = count_gangster_kills
		results.count_civilian_kills = count_civilian_kills
	end

	return hit_units, splinters, results
end

function FireManager:_apply_body_damage(is_server, hit_body, user_unit, dir, damage)
	local hit_unit = hit_body:unit()
	local local_damage = is_server or hit_unit:id() == -1
	local sync_damage = is_server and hit_unit:id() ~= -1

	if not local_damage and not sync_damage then
		return
	end

	local normal = dir
	local prop_damage = math_min(damage, 200)

	if prop_damage < 0.25 then
		prop_damage = math_round(prop_damage, 0.25)
	end

	if prop_damage > 0 then
		local network_damage = math_ceil(prop_damage * 163.84)
		prop_damage = network_damage / 163.84

		if local_damage then
			hit_body:extension().damage:damage_fire(user_unit, normal, hit_body:position(), dir, prop_damage)
			hit_body:extension().damage:damage_damage(user_unit, normal, hit_body:position(), dir, prop_damage)
		end

		if sync_damage and managers.network:session() then
			if alive(user_unit) then
				managers.network:session():send_to_peers_synched("sync_body_damage_fire", hit_body, user_unit, normal, hit_body:position(), dir, math_min(32768, network_damage))
			else
				managers.network:session():send_to_peers_synched("sync_body_damage_fire_no_attacker", hit_body, normal, hit_body:position(), dir, math_min(32768, network_damage))
			end
		end
	end
end

function FireManager:client_damage_and_push(from_pos, normal, user_unit, dmg, range, curve_pow)
	if draw_sync_explosion_sphere then
		local draw_duration = 3
		local new_brush = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
		new_brush:sphere(from_pos, range)
	end

	local bodies = world_g:find_bodies("intersect", "sphere", from_pos, range, managers.slot:get_mask("explosion_targets"))
	local units_to_push = {}

	for _, hit_body in ipairs(bodies) do
		if alive(hit_body) then
			local hit_unit = hit_body:unit()
			units_to_push[hit_unit:key()] = hit_unit

			local apply_dmg = hit_body:extension() and hit_body:extension().damage and hit_unit:id() == -1
			local dir, damage = nil

			if apply_dmg then
				dir = hit_body:center_of_mass()
				mvec3_dir(dir, from_pos, dir)
				damage = dmg

				self:_apply_body_damage(false, hit_body, user_unit, dir, damage)
			end
		end
	end

	managers.explosion:units_to_push(units_to_push, from_pos, range)
end
--]]

function FireManager:give_local_player_dmg(pos, range, damage, user_unit)
	local player = managers.player:player_unit()

	if player then
		player:character_damage():damage_fire({
			variant = "fire",
			position = pos,
			range = range,
			damage = damage,
			attacker_unit = user_unit
		})
	end
end 