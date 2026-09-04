-- Idstring:t() gives the original text back when the hashlist knows it.
local function _resmod_name(v)
	local ok, s = pcall(function() return v:t() end)
	return ok and s or tostring(v)
end

-- HuskCopInventory:add_unit_by_name
--
-- The local CopInventory version (sc/units/enemies/copinventory.lua) already
-- dyn-loads the weapon before spawning it. HuskCopInventory is a separate class
-- with its own copy of the function, and it never got the same treatment, so on
-- a CLIENT the vanilla path runs:
--
--     local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())
--     ...
--     new_unit:base():setup(setup_data)
--
-- World:spawn_unit returns nothing for a weapon this client has not loaded, and
-- new_unit:base() then dereferences null. That is an access violation, not a Lua
-- error, so nothing catches it - the game dies the moment the enemy spawns. It
-- only ever happens to clients, which is why hosting or testing in singleplayer
-- will never reproduce it.
--
-- Same load the host does, plus two guards the host version could also use:
-- never hand dyn_resource a dbpath the DB does not know (that faults inside
-- load_temp_resource), and never dereference the spawn result blind.
function HuskCopInventory:add_unit_by_name(new_unit_name, equip)
	local ids_unit = Idstring("unit")

	if not PackageManager:has(ids_unit, new_unit_name) then
		if DB:has(ids_unit, new_unit_name) then
			managers.dyn_resource:load(ids_unit, new_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
		else
			log("[RestorationMod] HuskCopInventory: weapon '" .. _resmod_name(new_unit_name) ..
				"' has no DB entry on this client - skipping it rather than crashing in World:spawn_unit." ..
				" Register it in superblt/*.xml and list it in lua/sc/superblt_units.lua.")

			return
		end
	end

	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())

	if not alive(new_unit) then
		log("[RestorationMod] HuskCopInventory: World:spawn_unit returned nothing for '" ..
			_resmod_name(new_unit_name) ..
			"' - the enemy will spawn unarmed instead of taking the game down.")

		return
	end

	managers.mutators:modify_value("CopInventory:add_unit_by_name", self)
	CopInventory._chk_spawn_shield(self, new_unit)

	local ignore_units = {
		self._unit,
		new_unit
	}

	if self._ignore_units then
		for idx, ig_unit in pairs(self._ignore_units) do
			table.insert(ignore_units, ig_unit)
		end
	end

	local setup_data = {}

	setup_data.user_unit = self._unit
	setup_data.ignore_units = ignore_units
	setup_data.expend_ammo = false
	setup_data.hit_slotmask = managers.slot:get_mask("bullet_impact_targets_no_AI")
	setup_data.hit_player = true
	setup_data.user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice

	new_unit:base():setup(setup_data)

	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun(new_unit_name)
	end

	CopInventory.add_unit(self, new_unit, equip)
end
