function WeaponLionGadget1:_is_deployable()
	if tweak_data.weapon[managers.blackmarket:equipped_primary().weapon_id].use_bipod_anywhere == true then
		return true
	end

	if self._is_npc or (not self:_get_bipod_obj() and not tweak_data.weapon[managers.blackmarket:equipped_primary().weapon_id].custom_bipod) then
		return false
	end
	if self:_is_in_blocked_deployable_state() then
		return false
	end

	local bipod_rays = self:_shoot_bipod_rays2()
	if not bipod_rays then
		return false
	end

	if bipod_rays.forward then
		return false
	end

	if bipod_rays.center then
		return true
	end
	return false
end

function WeaponLionGadget1:_shoot_bipod_rays2(debug_draw)
	local camera_pos = managers.player:player_unit():camera():position()
	local wpn_rot = managers.player:equipped_weapon_unit():rotation()

	local forward_vec = Vector3(0, 150, 0)
	mvector3.rotate_with(forward_vec, wpn_rot)
	if math.abs(forward_vec:to_polar().pitch) > 60 then
		return nil
	end
	local bipod_pos = Vector3()
	mvector3.set(bipod_pos, camera_pos)
	mvector3.add(bipod_pos, forward_vec)

	local result = {}
	local forwardtest = self._unit:raycast(camera_pos, bipod_pos)
	if forwardtest then
		result.forward = true
	end

	local forward_values = {80, 100, 120}
	for a, b in ipairs(forward_values) do
		local forward_vec = Vector3(0, b, 0)
		mvector3.rotate_with(forward_vec, wpn_rot)
		local bipod_forward_pos = Vector3()
		mvector3.set(bipod_forward_pos, camera_pos)
		mvector3.add(bipod_forward_pos, forward_vec)

		local forward_down_vec = Vector3(0, b, -93)
		mvector3.rotate_with(forward_down_vec, wpn_rot)
		local bipod_down_pos = Vector3()
		mvector3.set(bipod_down_pos, camera_pos)
		mvector3.add(bipod_down_pos, forward_down_vec)

		local forward_gravity_vec = Vector3(0, b, 0)
		mvector3.rotate_with(forward_gravity_vec, wpn_rot)
		local bipod_gravity_pos = Vector3()
		mvector3.set(bipod_gravity_pos, camera_pos)
		mvector3.add(bipod_gravity_pos, forward_gravity_vec)
		mvector3.add(bipod_gravity_pos, Vector3(0, 0, -90))

		local surface_resting_test = self._unit:raycast(bipod_forward_pos, bipod_down_pos)
		local angle_test = self._unit:raycast(bipod_forward_pos, bipod_gravity_pos)
		if surface_resting_test and angle_test then
			result.down = true
		end
	end

	return {forward = result.forward or nil, center = result.down or nil}
end