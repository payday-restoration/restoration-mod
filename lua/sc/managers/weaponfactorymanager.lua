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

function WeaponFactoryManager:get_part_desc_by_part_id_from_weapon(part_id, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local override = self:_get_override_parts(factory_id, blueprint)
	local part = self:_part_data(part_id, factory_id, override)
	local desc_id = part.desc_id or tweak_data.blackmarket.weapon_mods[part_id].desc_id
	local is_second_sight = part and ( part.has_second_sight or part.sub_type == "second_sight" or ( part.perks and table.contains(part.perks, "second_sight") ) )
	local params = {
		BTN_GADGET = (restoration.Options:GetValue("OTHER/WeaponHandling/SecondSightSprint") and is_second_sight and managers.localization:btn_macro("run", true)) or managers.localization:btn_macro("weapon_gadget", true),
		BTN_BIPOD = managers.localization:btn_macro("deploy_bipod", true)
	}

	if managers.menu:is_pc_controller() and managers.localization:exists(desc_id .. "_pc") then
		return managers.localization:text(desc_id .. "_pc", params)
	elseif managers.localization:exists(desc_id) then
		return managers.localization:text(desc_id, params)
	end

	return Application:production_build() and managers.localization:text(desc_id) or ""
end

--[[ --trying to make sound_switch stuff respect override tables (to no avail currently)
function WeaponFactoryManager:get_sound_switch(switch_group, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local forbidden = self:_get_forbidden_parts(factory_id, blueprint)
	local override = self:_get_override_parts(factory_id, blueprint)
	local part = self:_part_data(part_id, factory_id, override)
	local t = {}

	--for _, part_id in ipairs(self:get_assembled_blueprint(factory_id, blueprint)) do

	--end

	for _, part_id in ipairs(blueprint) do
		if not forbidden[part_id] and factory.parts[part_id].sound_switch and factory.parts[part_id].sound_switch[switch_group] and not table.contains(t, part_id) then
			table.insert(t, part_id)
		end
	end

	if #t > 0 then
		if #t > 1 then
			local part_x, part_y = nil

			table.sort(t, function (x, y)
				part_x = factory.parts[x]
				part_y = factory.parts[y]

				if part_x.sub_type == "silencer" then
					return true
				end

				if part_y.sub_type == "silencer" then
					return false
				end

				return x < y
			end)
		end

		return factory.parts[ t[1] ].sound_switch[switch_group]
	end

	return nil
end
--]]

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