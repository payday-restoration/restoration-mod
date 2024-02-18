local orig_raycast = TripMineBase._raycast
function TripMineBase:_raycast(...)
	if self.blackout_active then 
		return {}
	end
	return orig_raycast(self,...)
end

Hooks:PostHook(TripMineBase, "init", "RR_init", function(self)
	self.is_tripmine = true -- used in vanilla code too but isn't actually set (as far as i can tell at least)
end)

function TripMineBase:_sensor(t)
	local ray = self:_raycast()

	if ray and ray.unit and not tweak_data.character[ray.unit:base()._tweak_table].is_escort then
		self._sensor_units_detected = self._sensor_units_detected or {}

		if not self._sensor_units_detected[ray.unit:key()] then
			self._sensor_units_detected[ray.unit:key()] = true

			if managers.player:has_category_upgrade("trip_mine", "sensor_highlight") then
				if (managers.groupai:state():whisper_mode() and tweak_data.character[ray.unit:base()._tweak_table].silent_priority_shout or tweak_data.character[ray.unit:base()._tweak_table].priority_shout) then
					managers.game_play_central:auto_highlight_enemy(ray.unit, true)
				end
				self:_emit_sensor_sound_and_effect()

				if managers.network:session() then
					managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", TripMineBase.EVENT_IDS.sensor_beep)
				end
			end

			self._sensor_last_unit_time = t + 5
		end
	end
end

local mvec3_set = mvector3.set
local mvec3_mul = mvector3.multiply
local mvec3_dir = mvector3.direction
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_add = mvector3.add
local mvec3_copy = mvector3.copy
local mvec3_not_equal = mvector3.not_equal
local mrot_equal = mrotation.equal
local tmp_hit_pos = Vector3()
local tmp_pos = Vector3()
local math_min = math.min
local math_ceil = math.ceil
local table_insert = table.insert
local world_g = World

local draw_explosion_sphere = nil
local draw_sync_explosion_sphere = nil
local draw_vanilla_explosion_cylinder = nil
local draw_splinters = nil
local draw_obstructed_splinters = nil
local draw_splinter_hits = nil

function TripMineBase:_check_body()
	if not self._attached_data then
		return
	end

	if self._attached_data.index == 1 then
		if not alive(self._attached_data.body) or not self._attached_data.body:enabled() then
			self:explode()
		end
	elseif self._attached_data.index == 2 then
		if not alive(self._attached_data.body) or not mrot_equal(self._attached_data.rotation, self._attached_data.body:rotation()) then
			self:explode()
		end
	elseif self._attached_data.index == 3 then
		if not alive(self._attached_data.body) or mvec3_not_equal(self._attached_data.position, self._attached_data.body:position()) then
			self:explode()
		end
	end

	if self._attached_data.index < self._attached_data.max_index then
		self._attached_data.index = self._attached_data.index + 1
	else
		self._attached_data.index = 1
	end
end

function TripMineBase:_explode(col_ray)
	if not managers.network:session() then
		return
	end

	local damage_size = tweak_data.weapon.trip_mines.damage_size * managers.player:upgrade_value("trip_mine", "explosion_size_multiplier_1", 1) * managers.player:upgrade_value("trip_mine", "damage_multiplier", 1)
	local player = managers.player:player_unit()
	local my_pos = self._ray_from_pos
	local my_fwd = self._forward

	if draw_explosion_sphere then
		local draw_duration = 3
		local new_brush = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
		new_brush:sphere(my_pos, damage_size)
	end

	if draw_vanilla_explosion_cylinder then
		local draw_duration = 3
		local new_brush = Draw:brush(Color.blue:with_alpha(0.5), draw_duration)
		new_brush:cylinder(my_pos, self._ray_to_pos, damage_size)
	end

	managers.explosion:give_local_player_dmg(my_pos, damage_size, tweak_data.weapon.trip_mines.player_damage, player)
	self:_play_sound_and_effects(damage_size)

	self._unit:set_extension_update_enabled(Idstring("base"), false)
	self._deactive_timer = 5

	mvec3_set(tmp_hit_pos, my_fwd)
	mvec3_mul(tmp_hit_pos, 5)
	mvec3_add(tmp_hit_pos, my_pos)

	local slotmask = managers.slot:get_mask("explosion_targets")
	local bodies = world_g:find_bodies(self._unit, "intersect", "sphere", tmp_hit_pos, damage_size, slotmask)
	local splinters = {
		mvec3_copy(tmp_hit_pos)
	}
	local dirs = {
		Vector3(damage_size, 0, 0),
		Vector3(-damage_size, 0, 0),
		Vector3(0, damage_size, 0),
		Vector3(0, -damage_size, 0),
		Vector3(0, 0, damage_size),
		Vector3(0, 0, -damage_size)
	}

	for _, dir in ipairs(dirs) do
		mvec3_set(tmp_pos, dir)
		mvec3_add(tmp_pos, tmp_hit_pos)

		local splinter_ray = world_g:raycast("ray", tmp_hit_pos, tmp_pos, "slot_mask", managers.slot:get_mask("world_geometry"))

		if splinter_ray then
			tmp_pos = splinter_ray.position - dir:normalized() * math_min(splinter_ray.distance, 10)
		end

		if draw_splinters then
			local draw_duration = 3
			local new_brush = Draw:brush(Color.white:with_alpha(0.5), draw_duration)
			new_brush:cylinder(tmp_hit_pos, tmp_pos, 0.5)
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

	local units_to_hit, units_to_push = {}, {}
	local damage = tweak_data.weapon.trip_mines.damage * managers.player:upgrade_value("trip_mine", "damage_multiplier", 1)

	for _, hit_body in ipairs(bodies) do
		if alive(hit_body) then
			local hit_unit = hit_body:unit()
			local hit_unit_key = hit_unit:key()
			units_to_push[hit_unit_key] = hit_unit

			local character = hit_unit:character_damage() and hit_unit:character_damage().damage_explosion and not hit_unit:character_damage():dead()
			local apply_dmg = hit_body:extension() and hit_body:extension().damage
			local dir, ray_hit, damage_character = nil
			local dmg = damage

			if character then
				if not units_to_hit[hit_unit_key] then
					for i_splinter, s_pos in ipairs(splinters) do
						ray_hit = not world_g:raycast("ray", s_pos, hit_body:center_of_mass(), "slot_mask", managers.slot:get_mask("world_geometry"), "report")

						if ray_hit then
							units_to_hit[hit_unit_key] = true
							damage_character = true

							if draw_splinter_hits then
								local draw_duration = 3
								local new_brush = Draw:brush(Color.green:with_alpha(0.5), draw_duration)
								new_brush:cylinder(s_pos, hit_body:center_of_mass(), 0.5)
							end

							break
						else
							if draw_obstructed_splinters then
								local draw_duration = 3
								local new_brush = Draw:brush(Color.yellow:with_alpha(0.5), draw_duration)
								new_brush:cylinder(s_pos, hit_body:center_of_mass(), 0.5)
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

			if not ray_hit and apply_dmg and units_to_hit[hit_unit_key] and hit_unit:character_damage() and hit_unit:character_damage().damage_explosion then
				for i_splinter, s_pos in ipairs(splinters) do
					ray_hit = not world_g:raycast("ray", s_pos, hit_body:center_of_mass(), "slot_mask", managers.slot:get_mask("world_geometry"), "report")

					if ray_hit then
						break
					end
				end
			end

			if ray_hit then
				dir = hit_body:center_of_mass()
				mvec3_dir(dir, tmp_hit_pos, dir)

				if apply_dmg then
					local normal = dir
					local prop_damage = math_min(dmg, 200)
					local network_damage = math_ceil(prop_damage * 163.84)
					prop_damage = network_damage / 163.84

					hit_body:extension().damage:damage_explosion(player, normal, hit_body:position(), dir, prop_damage)
					hit_body:extension().damage:damage_damage(player, normal, hit_body:position(), dir, prop_damage)

					if hit_unit:id() ~= -1 then
						if player then
							managers.network:session():send_to_peers_synched("sync_body_damage_explosion", hit_body, player, normal, hit_body:position(), dir, math_min(32768, network_damage))
						else
							managers.network:session():send_to_peers_synched("sync_body_damage_explosion_no_attacker", hit_body, normal, hit_body:position(), dir, math_min(32768, network_damage))
						end
					end
				end

				if character and damage_character then
					if hit_unit:base() and hit_unit:base().has_tag and hit_unit:base():has_tag("tank") then
						dmg = dmg * 7
					end

					self:_give_explosion_damage(col_ray, hit_unit, dmg)
				end
			end
		end
	end

	if managers.network:session() then
		if managers.player:has_category_upgrade("trip_mine", "fire_trap") then
			local fire_trap_data = managers.player:upgrade_value("trip_mine", "fire_trap", nil)

			if fire_trap_data then
				managers.network:session():send_to_peers_synched("sync_trip_mine_explode_spawn_fire", self._unit, player, self._ray_from_pos, self._forward, damage_size, damage, fire_trap_data[1], fire_trap_data[2])
				self:_spawn_environment_fire(player, fire_trap_data[1], fire_trap_data[2])
			end
		elseif player then
			managers.network:session():send_to_peers_synched("sync_trip_mine_explode", self._unit, player, self._ray_from_pos, self._forward, damage_size, damage)
		else
			managers.network:session():send_to_peers_synched("sync_trip_mine_explode_no_user", self._unit, self._ray_from_pos, self._forward, damage_size, damage)
		end
	end

	local det_pos = self._ray_from_pos

	managers.explosion:units_to_push(units_to_push, det_pos, 300)

	if Network:is_server() then
		local alert_radius = tweak_data.weapon.trip_mines.alert_radius
		local alert_filter = self._alert_filter or managers.groupai:state():get_unit_type_filter("civilians_enemies")
		local alert_unit = player or self._unit
		local alert_event = {
			"explosion",
			det_pos,
			alert_radius,
			alert_filter,
			alert_unit
		}

		managers.groupai:state():propagate_alert(alert_event)
		managers.mission:call_global_event("tripmine_exploded")
		--Application:error("TRIPMINE EXPLODED")
	end

	self._unit:set_slot(0)
end

function TripMineBase:sync_trip_mine_explode(user_unit, ray_from, ray_to, damage_size, damage)
	local range = damage_size
	local my_pos = ray_from
	local my_fwd = ray_to

	managers.explosion:give_local_player_dmg(my_pos, range, tweak_data.weapon.trip_mines.player_damage, user_unit)
	self:_play_sound_and_effects(range)

	if draw_sync_explosion_sphere then
		local draw_duration = 3
		local new_brush = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
		new_brush:sphere(my_pos, range)
	end

	mvec3_set(tmp_hit_pos, my_fwd)
	mvec3_mul(tmp_hit_pos, 5)
	mvec3_add(tmp_hit_pos, my_pos)

	local slotmask = managers.slot:get_mask("explosion_targets")
	local bodies = world_g:find_bodies(self._unit, "intersect", "sphere", tmp_hit_pos, range, slotmask)
	local units_to_push = {}

	for _, hit_body in ipairs(bodies) do
		if alive(hit_body) then
			local hit_unit = hit_body:unit()
			units_to_push[hit_unit:key()] = hit_unit

			local apply_dmg = hit_body:extension() and hit_body:extension().damage and hit_unit:id() == -1

			if apply_dmg then
				local dir = hit_body:center_of_mass()
				mvec3_dir(dir, tmp_hit_pos, dir)

				local normal = dir
				local prop_damage = math_min(damage, 200)

				hit_body:extension().damage:damage_explosion(user_unit, normal, hit_body:position(), dir, prop_damage)
				hit_body:extension().damage:damage_damage(user_unit, normal, hit_body:position(), dir, prop_damage)
			end
		end
	end

	local det_pos = ray_from

	managers.explosion:units_to_push(units_to_push, det_pos, 300)

	if Network:is_server() then
		local alert_radius = tweak_data.weapon.trip_mines.alert_radius
		local alert_filter = self._alert_filter or managers.groupai:state():get_unit_type_filter("civilians_enemies")
		local alert_unit = managers.player:player_unit() or self._unit
		local alert_event = {
			"explosion",
			det_pos,
			alert_radius,
			alert_filter,
			alert_unit
		}

		managers.groupai:state():propagate_alert(alert_event)
		managers.mission:call_global_event("tripmine_exploded")
		--Application:error("TRIPMINE EXPLODED")
	end

	self._unit:set_slot(0)
end

function TripMineBase:_play_sound_and_effects(range)
	local custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		sound_event = "trip_mine_explode",
		effect = "effects/payday2/particles/explosions/grenade_explosion",
		feedback_range = range * 2,
		on_unit = true
	}

	managers.explosion:play_sound_and_effects(self._position, self._unit:rotation():y(), range, custom_params)
end
--[[
Hooks:PostHook(TripMineBase, "setup", "setup_no_outlines", function(self,sensor_upgrade)
	local upgrade = managers.player:has_category_upgrade("trip_mine", "can_switch_on_off") or managers.player:has_category_upgrade("trip_mine", "sensor_toggle")
	local disable_outlines = managers.mutators:modify_value("TripMineBase:DisableOutlines", false)
	if disable_outlines then
		self._unit:contour():remove(upgrade and "deployable_interactable" or "deployable_active")
	end
end)

Hooks:PostHook(TripMineBase, "contour_selected", "contour_selected_no_outlines", function(self)
	local disable_outlines = managers.mutators:modify_value("TripMineBase:DisableOutlines", false)
	if disable_outlines then
		self._unit:contour():remove("deployable_selected")
	end
end)
--]]