local Net = _G.LuaNetworking

function PlayerEquipment:valid_shape_placement(equipment_id, equipment_data)
	local from = self._unit:movement():m_head_pos()
	local to = from + self._unit:movement():m_head_rot():y() * 220
	local ray = self._unit:raycast("ray", from, to, "slot_mask", managers.slot:get_mask("trip_mine_placeables"), "ignore_unit", {})
	local valid = ray and true or false
	if ray then
		local pos = ray.position
		local rot = self._unit:movement():m_head_rot()
		rot = Rotation(rot:yaw(), 0, 0)

		if equipment_id == "armor_kit" then				
			rot = Rotation(rot:yaw()+180, 0, 0)
		elseif equipment_id == "bodybags_bag" then 
			rot = Rotation(rot:yaw()-90, 0, 0)
		end
		
		if not alive(self._dummy_unit) then
			self._dummy_unit = World:spawn_unit(Idstring(equipment_data.dummy_unit), pos, rot)
			self:_disable_contour(self._dummy_unit)
		end
		self._dummy_unit:set_position(pos)
		self._dummy_unit:set_rotation(rot)
		valid = valid and math.dot(ray.normal, math.UP) > 0.25
		local find_start_pos, find_end_pos, find_radius
		if equipment_id == "ammo_bag" then
			find_start_pos = pos + math.UP * 20
			find_end_pos = pos + math.UP * 21
			find_radius = 12
		elseif equipment_id == "doctor_bag" then
			find_start_pos = pos + math.UP * 22
			find_end_pos = pos + math.UP * 28
			find_radius = 15
		else
			find_start_pos = pos + math.UP * 30
			find_end_pos = pos + math.UP * 40
			find_radius = 17
		end
		local bodies = self._dummy_unit:find_bodies("intersect", "capsule", find_start_pos, find_end_pos, find_radius, managers.slot:get_mask("trip_mine_placeables") + 14 + 25)
		for _, body in ipairs(bodies) do
			if body:unit() ~= self._dummy_unit and body:has_ray_type(Idstring("body")) then
				valid = false
			else
			end
		end
	end
	if alive(self._dummy_unit) then
		self._dummy_unit:set_enabled(valid)
	end
	return valid and ray
end

--Armour Bag
function PlayerEquipment:use_armor_kit()
	local ray = self:valid_shape_placement("grenade_crate")
	if ray then
		local pos = ray.position
		local rot = self._unit:movement():m_head_rot()
		rot = Rotation(rot:yaw()+180, 0, 0)
		PlayerStandard.say_line(self, "s01x_plu")
		managers.statistics:use_armor_bag()
		local amount_upgrade_lvl = 0
		if Network:is_client() then
			Net:SendToPeer(1, "PlaceGrenadeCrate", tostring(pos).."|"..tostring(rot).."|"..tostring(amount_upgrade_lvl))
		else
			local unit = GrenadeCrateBase.spawn(pos, rot, amount_upgrade_lvl, managers.network:session():local_peer():id())
		end
		return true
	end
	return false
end