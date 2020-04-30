function VehicleDrivingExt:_detect_npc_collisions()
	local vel = self._vehicle:velocity()
	if vel:length() < 150 then
		return
	end
	local oobb = self._unit:oobb()
	local slotmask = managers.slot:get_mask("flesh")
	local units = World:find_units("intersect", "obb", oobb:center(), oobb:x(), oobb:y(), oobb:z(), slotmask)
	for _, unit in pairs(units) do
		local unit_is_criminal = unit:in_slot(managers.slot:get_mask("all_criminals"))
		local unit_name = unit:base()._tweak_table
		if unit_is_criminal then
		elseif unit_name == "spring" or unit_name == "summers" or unit_name == "phalanx_vip" then
		elseif unit:character_damage() and not unit:character_damage():dead() then
			self._hit_soundsource:set_position(unit:position())
			self._hit_soundsource:set_rtpc("car_hit_vel", math.clamp(vel:length() / 100 * 2, 0, 100))
			self._hit_soundsource:post_event("car_hit_body_01")
			local damage_ext = unit:character_damage()
			local attack_data = {
				damage = damage_ext._HEALTH_INIT or 1000,
				variant = "explosion"
			}
			if self._seats.driver.occupant == managers.player:local_player() then
				attack_data.attacker_unit = managers.player:local_player()
			end
			damage_ext:damage_mission(attack_data)
			if unit:movement()._active_actions[1] and unit:movement()._active_actions[1]:type() == "hurt" then
				unit:movement()._active_actions[1]:force_ragdoll()
			end
			local nr_u_bodies = unit:num_bodies()
			local i_u_body = 0
			while nr_u_bodies > i_u_body do
				local u_body = unit:body(i_u_body)
				if u_body:enabled() and u_body:dynamic() then
					local body_mass = u_body:mass()
					u_body:push_at(body_mass / math.random(2), vel * 2.5, u_body:position())
				end
				i_u_body = i_u_body + 1
			end
		end
	end
end