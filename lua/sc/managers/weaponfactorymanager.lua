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
WeaponFactoryManager._override_parts_cache_npc = WeaponFactoryManager._override_parts_cache_npc or {}
WeaponFactoryManager._forbidden_parts_cache = WeaponFactoryManager._forbidden_parts_cache or {}
WeaponFactoryManager._forbidden_parts_cache_npc = WeaponFactoryManager._forbidden_parts_cache_npc or {}

--bumming a vanilla func to generate a unique key for a given blueprint
--UPDATE: originally bummed off and modified a vanilla func, decided to make it a new one instead in the event vanilla calls for "blueprint_to_string" leads to issues due to the added sanity checks that might prevent returning an expected result
function WeaponFactoryManager:blueprint_to_key(factory_id, blueprint, npc)
	local blueprint_string = npc and "npc_" or ""
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


function WeaponFactoryManager:_assemble(factory_id, p_unit, blueprint, third_person, npc, done_cb, skip_queue)
	if not npc then
		self:_clear_parts_cache()
	end
	if not done_cb then
		Application:error("-----------------------------")
		Application:stack_dump()
	end

	local factory = tweak_data.weapon.factory
	local factory_weapon = factory[factory_id]
	local forbidden = self:_get_forbidden_parts(factory_id, blueprint, npc)

	return self:_add_parts(p_unit, factory_id, factory_weapon, blueprint, forbidden, third_person, npc, done_cb, skip_queue)
end

--Determined that both "_get_override_parts" and "_get_forbidden_parts" should to get cached after neutering the giant fuck-off for loops in them massively reduced the amount/length of hitching
--Cache the override data of a given blueprint as to not recreate it each time this gets called i.e. when connected clients swap weapons, switching to and from an underbarrel
local _orig_override_parts = WeaponFactoryManager._get_override_parts
function WeaponFactoryManager:_get_override_parts(factory_id, blueprint, npc)
	local key = self:blueprint_to_key(factory_id, blueprint, npc) --generate a unique key off the blueprint string
	local cache = npc and self._override_parts_cache_npc[key] or self._override_parts_cache[key]

	if cache then
		return cache
	end

	local overrides = _orig_override_parts(self, factory_id, blueprint)
	if npc then
		self._override_parts_cache_npc[key] = overrides
	else
		self._override_parts_cache[key] = overrides --cache the override table
	end

	return overrides
end

--Ditto but for forbid data
local _orig_forbid_parts = WeaponFactoryManager._get_forbidden_parts
function WeaponFactoryManager:_get_forbidden_parts(factory_id, blueprint, npc)
	local key = self:blueprint_to_key(factory_id, blueprint, npc)
	local cache = npc and self._forbidden_parts_cache_npc[key] or self._forbidden_parts_cache[key]

	if cache then
		return cache
	end

	local forbidden = _orig_forbid_parts(self, factory_id, blueprint)
	if npc then
		self._forbidden_parts_cache_npc[key] = forbidden
	else
		self._forbidden_parts_cache[key] = forbidden --cache the override table
	end

	return forbidden
end

--Call to nuke the cache if a blueprint change occurs - old data bad
function WeaponFactoryManager:_clear_parts_cache()
	self._override_parts_cache = {}
	self._override_parts_cache_npc = {}
	self._forbidden_parts_cache = {}
	self._forbidden_parts_cache_npc = {}
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

--Stance mod stuff really doesn't like the cache stuff so associated functions get a vanilla version of functions specifically for  them until I figure out why this happens
function WeaponFactoryManager:get_assembled_blueprint_stance_mod(factory_id, blueprint)
	local assembled_blueprint = {}
	local factory = tweak_data.weapon.factory
	local forbidden = self:_get_forbidden_parts_stance_mod(factory_id, blueprint)
	local override = self:_get_override_parts_stance_mod(factory_id, blueprint)

	for _, part_id in ipairs(blueprint) do
		if not forbidden[part_id] then
			local part = self:_part_data_stance_mod(part_id, factory_id, override)
			local original_part = factory.parts[part_id] or part

			if factory[factory_id].adds and factory[factory_id].adds[part_id] then
				local add_blueprint = self:get_assembled_blueprint_stance_mod(factory_id, factory[factory_id].adds[part_id]) or {}

				for i, d in ipairs(add_blueprint) do
					table.insert(assembled_blueprint, d)
				end
			end

			if part.adds_type then
				for _, add_type in ipairs(part.adds_type) do
					local add_id = factory[factory_id][add_type]

					table.insert(assembled_blueprint, add_id)
				end
			end

			if part.adds then
				for _, add_id in ipairs(part.adds) do
					table.insert(assembled_blueprint, add_id)
				end
			end

			table.insert(assembled_blueprint, part_id)
		end
	end

	return assembled_blueprint
end

function WeaponFactoryManager:get_stance_mod(factory_id, blueprint, using_second_sight)
	local factory = tweak_data.weapon.factory
	local assembled_blueprint = self:get_assembled_blueprint_stance_mod(factory_id, blueprint)
	local forbidden = self:_get_forbidden_parts_stance_mod(factory_id, assembled_blueprint)
	local override = self:_get_override_parts_stance_mod(factory_id, assembled_blueprint)
	local part = nil
	local translation = Vector3()
	local rotation = Rotation()
	local is_not_sight_type, is_weapon_sight, is_second_sight = nil
	local second_sight_id = using_second_sight

	for _, part_id in ipairs(assembled_blueprint) do
		if not forbidden[part_id] then
			part = self:_part_data_stance_mod(part_id, factory_id, override)

			if part.stance_mod then
				is_not_sight_type = part.type ~= "sight" and part.type ~= "second_sight" and part.sub_type ~= "second_sight" or false
				is_weapon_sight = not second_sight_id and part.type == "sight" or false
				is_second_sight = second_sight_id and part_id == second_sight_id or false

				if (is_not_sight_type or is_weapon_sight or is_second_sight) and part.stance_mod[factory_id] then
					local part_translation = part.stance_mod[factory_id].translation

					if part_translation then
						mvector3.add(translation, part_translation)
					end

					local part_rotation = part.stance_mod[factory_id].rotation

					if part_rotation then
						mrotation.multiply(rotation, part_rotation)
					end
				end
			end
		end
	end

	return {
		translation = translation,
		rotation = rotation
	}
end

function WeaponFactoryManager:_get_override_parts_stance_mod(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local overridden = {}
	local override_override = {}

	for _, part_id in ipairs(blueprint) do
		local part = self:_part_data_stance_mod(part_id, factory_id)

		if part and part.override then
			for override_id, override_data in pairs(part.override) do
				if override_data.override then
					override_override[override_id] = override_data
				end
			end
		end
	end

	if factory[factory_id] and factory[factory_id].merge_overrides then
		for _, part_id in ipairs(blueprint) do
			local part = self:_part_data_stance_mod(part_id, factory_id, override_override)

			if part and part.override then
				for override_id, override_data in pairs(part.override) do
					overridden[override_id] = overridden[override_id] or {}

					for id, data in pairs(override_data) do
						overridden[override_id][id] = data
					end
				end
			end
		end

		return overridden
	end

	for _, part_id in ipairs(blueprint) do
		local part = self:_part_data_stance_mod(part_id, factory_id, override_override)

		if part and part.override then
			for override_id, override_data in pairs(part.override) do
				overridden[override_id] = override_data
			end
		end
	end

	return overridden
end

function WeaponFactoryManager:_get_forbidden_parts_stance_mod(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local forbidden = {}
	local override = self:_get_override_parts_stance_mod(factory_id, blueprint)

	for _, part_id in ipairs(blueprint) do
		if self:is_part_valid(part_id) then
			local part = self:_part_data_stance_mod(part_id, factory_id, override)

			if part.depends_on then
				local part_forbidden = true

				for _, other_part_id in ipairs(blueprint) do
					local other_part = self:_part_data_stance_mod(other_part_id, factory_id, override)

					if part.depends_on == other_part.type then
						part_forbidden = false

						break
					end
				end

				if part_forbidden then
					forbidden[part_id] = part.depends_on
				end
			end

			if part.forbids then
				for _, forbidden_id in ipairs(part.forbids) do
					forbidden[forbidden_id] = part_id
				end
			end

			if part.adds then
				local add_forbidden = self:_get_forbidden_parts_stance_mod(factory_id, part.adds)

				for forbidden_id, part_id in pairs(add_forbidden) do
					forbidden[forbidden_id] = part_id
				end
			end
		else
			Application:error("[WeaponFactoryManager:_get_forbidden_parts] Part do not exist!", part_id, "factory_id", factory_id)

			forbidden[part_id] = part_id
		end
	end

	return forbidden
end

function WeaponFactoryManager:_part_data_stance_mod(part_id, factory_id, override)
	local factory = tweak_data.weapon.factory

	if not self:is_part_valid(part_id) then
		Application:error("[WeaponFactoryManager:_part_data] Part do not exist!", part_id, "factory_id", factory_id)

		return {}
	end

	local part = deep_clone(factory.parts[part_id])

	if factory[factory_id].override and factory[factory_id].override[part_id] then
		for d, v in pairs(factory[factory_id].override[part_id]) do
			part[d] = type(v) == "table" and deep_clone(v) or v
		end
	end

	if override and override[part_id] then
		for d, v in pairs(override[part_id]) do
			part[d] = type(v) == "table" and deep_clone(v) or v
		end
	end

	return part
end