--Gets any animation weights from attachments (vertical grip, drum mag, etc)
function WeaponFactoryManager:get_animation_weights_from_weapon(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local t = {}

	for _, id in ipairs(self:get_assembled_blueprint(factory_id, blueprint)) do
		local part = self:_part_data(id, factory_id)

		if part.fps_animation_weight then
			t[id] = part.fps_animation_weight
		end
	end

	return t
end

function WeaponFactoryManager:get_weapon_id_by_factory_id(factory_id)
	local factory = tweak_data.weapon.factory
	local real_factory_id = factory[factory_id] and factory[factory_id].real_factory_id

	local upgrade = managers.upgrades:weapon_upgrade_by_factory_id(real_factory_id or factory_id)


	if not upgrade then
		Application:error("[WeaponFactoryManager:get_weapon_id_by_factory_id] Found no upgrade for factory id", factory_id)

		return
	end

	return upgrade.weapon_id
end

--Debug stuff
--[[
function WeaponFactoryManager:unpack_blueprint_from_string(factory_id, blueprint_string)
	local factory = tweak_data.weapon.factory
	local index_table = string.split(blueprint_string, " ")
	local blueprint = {}
	local part_id = nil

	--log(tostring(factory_id) .. " contains: ")
	for _, part_index in ipairs(index_table) do
		part_id = factory[factory_id].uses_parts[tonumber(part_index)]

		if part_id then
			table.insert(blueprint, part_id)
			--log("    " .. tostring(part_id))
		end
	end
	return blueprint
end
--]]