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
		BTN_GADGET = (restoration.Options:GetValue("WEAPONS/WEAPONINPUTS/SecondSightSprint") and is_second_sight and managers.localization:btn_macro("run", true)) or managers.localization:btn_macro("weapon_gadget", true),
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

WeaponFactoryManager._override_parts_cache = WeaponFactoryManager._override_parts_cache or {}
WeaponFactoryManager._forbidden_parts_cache = WeaponFactoryManager._forbidden_parts_cache or {}

--bumming a vanilla func to generate a unique key for a given blueprint
--UPDATE: originally bummed off and modified a vanilla func, decided to make it a new one instead in the event vanilla calls for "blueprint_to_string" leads to issues due to the added sanity checks that might prevent returning an expected result
function WeaponFactoryManager:blueprint_to_key(factory_id, blueprint)
	local blueprint_string = ""
	local index_table = {}
	local factory = tweak_data.weapon.factory[factory_id] or {}

 	--safety check as some weapons can just not have this (underbarrels)
	if factory and factory.uses_parts then
		for i, part_id in ipairs(factory.uses_parts) do
			index_table[part_id] = i
		end
	end

	--safety check 2 electirc boogaloo (I *think* "blueprint" is only ever sent as a table)
	--don't bother with the loop if its empty
	if blueprint and #blueprint ~= 0 then
		for _, part_id in ipairs(blueprint) do
			if index_table[part_id] then
				blueprint_string = blueprint_string .. tostring(index_table[part_id]) .. " "
			else
				Application:error("[WeaponFactoryManager:blueprint_to_key] Part do not exist in weapon's uses_parts!", "factory_id", factory_id, "part_id", part_id)
			end
		end
	end

	return blueprint_string
end

--Determined that both "_get_override_parts" and "_get_forbidden_parts" should to get cached after neutering the giant fuck-off for loops in them massively reduced the amount/length of hitching
--Cache the override data of a given blueprint as to not recreate it each time this gets called i.e. when connected clients swap weapons, switching to and from an underbarrel
local _orig_override_parts = WeaponFactoryManager._get_override_parts
function WeaponFactoryManager:_get_override_parts(factory_id, blueprint)
	local key = self:blueprint_to_key(factory_id, blueprint) --generate a unique key off the blueprint string
	local cache = self._override_parts_cache[key]

	if cache then
		return cache
	end

	local overrides = _orig_override_parts(self, factory_id, blueprint)
	self._override_parts_cache[key] = overrides --cache the override table

	return overrides
end

--Ditto but for forbid data
local _orig_forbid_parts = WeaponFactoryManager._get_forbidden_parts
function WeaponFactoryManager:_get_forbidden_parts(factory_id, blueprint)
	local key = self:blueprint_to_key(factory_id, blueprint)
	local cache = self._forbidden_parts_cache[key]

	if cache then
		return cache
	end

	local forbidden = _orig_forbid_parts(self, factory_id, blueprint)
	self._forbidden_parts_cache[key] = forbidden --cache the forbid table

	return forbidden
end

--Call to nuke the cache if a blueprint change occurs - old data bad
function WeaponFactoryManager:_clear_parts_cache()
	self._override_parts_cache = {}
	self._forbidden_parts_cache = {}
end

--AFAIK finalized changes to blueprints are only carried out by these functions
local _orig_change_part = WeaponFactoryManager.change_part
function WeaponFactoryManager:change_part(...)
	self:_clear_parts_cache()
	return _orig_change_part(self, ...)
end
local _orig_remove_part = WeaponFactoryManager.remove_part
function WeaponFactoryManager:remove_part(...)
	self:_clear_parts_cache()
	return _orig_remove_part(self, ...)
end
local _orig_remove_part_by_type = WeaponFactoryManager.remove_part_by_type
function WeaponFactoryManager:remove_part_by_type(...)
	self:_clear_parts_cache()
	return _orig_remove_part_by_type(self, ...)
end
local _orig_change_blueprint = WeaponFactoryManager.change_blueprint
function WeaponFactoryManager:change_blueprint(...)
	self:_clear_parts_cache()
	return _orig_change_blueprint(self, ...)
end
local _orig_disassemble = WeaponFactoryManager.disassemble
function WeaponFactoryManager:disassemble(...)
	self:_clear_parts_cache()
	return _orig_disassemble(self, ...)
end
