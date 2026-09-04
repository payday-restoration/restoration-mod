-- Idstring:t() gives the original text back when the hashlist knows it.
local function _resmod_name(v)
	local ok, s = pcall(function() return v:t() end)
	return ok and s or tostring(v)
end

function CopInventory:add_unit_by_name(new_unit_name, equip)
	-- Handing dyn_resource a dbpath the DB does not know faults inside
	-- load_temp_resource, and World:spawn_unit returns nothing for a unit that
	-- never loaded - dereferencing that is an access violation, not a Lua error.
	local ids_unit = Idstring("unit")

	if not PackageManager:has(ids_unit, new_unit_name) then
		if DB:has(ids_unit, new_unit_name) then
			managers.dyn_resource:load(ids_unit, new_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
		else
			log("[RestorationMod] CopInventory: weapon '" .. _resmod_name(new_unit_name) ..
				"' has no DB entry - skipping it rather than crashing in World:spawn_unit.")

			return
		end
	end

	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())

	if not alive(new_unit) then
		log("[RestorationMod] CopInventory: World:spawn_unit returned nothing for '" ..
			_resmod_name(new_unit_name) .. "'")

		return
	end

	managers.mutators:modify_value("CopInventory:add_unit_by_name", self)
	self:_chk_spawn_shield(new_unit)

	local ignore_units = {
		self._unit,
		new_unit
	}

	if self._ignore_units then
		for idx, ig_unit in pairs(self._ignore_units) do
			table.insert(ignore_units, ig_unit)
		end
	end

	local setup_data = {
		user_unit = self._unit,
		ignore_units = ignore_units,
		expend_ammo = false,
		hit_slotmask = managers.slot:get_mask("bullet_impact_targets"),
		hit_player = true,
		user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice,
		alert_AI = true,
		alert_filter = self._unit:brain():SO_access()
	}

	new_unit:base():setup(setup_data)

	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun(new_unit_name)
	end

	self:add_unit(new_unit, equip)	
end

-- Add left hand align place for akimbo weapons
Hooks:PostHook(CopInventory, "init", "sh_init", function (self)
	self._align_places.left_hand = self._align_places.left_hand or {
		on_body = true,
		obj3d_name = Idstring("a_weapon_left_front")
	}
end)