-- Restoration loader v3.5: dependency discovery and native residency checks.
-- Install as mods/restoration-mod/supermod.lua and FULLY RESTART PAYDAY 2.
-- This cannot be hot-loaded over v3.1/v3.2: their native request and wrappers
-- may still be active. Restarting removes that pending state without altering it.
-- Setup.exec and Setup.block_exec are left untouched.
-- Asset registration remains early and deduplicated. Enemy resource loading
-- runs after GameSetup.init_managers, using the original nil-callback path.
-- Shared/faction lists and registered client debris resources remain intact.
-- Missing list entries with no mod declaration are warned and skipped, matching
-- the original supplied loader. They are NOT marked loaded or aliased to another
-- unit. Any live sequence reference to an absent unit still needs asset repair.
-- References acquired here are retained for the process; this patch does not
-- introduce resource unloading or pretend to fix the original native DiskError.
-- Dependency plans are cached; literal unit references are preloaded explicitly.
-- Object/model/material/texture edges are checked in DB; the engine loads them.
-- Native I/O cannot be validated in this environment.
RestorationSuperMod = RestorationSuperMod or {}
local R = RestorationSuperMod
R.mod_instance = R.mod_instance or ModInstance
R.supermod = R.supermod or (R.mod_instance and R.mod_instance.supermod)
R.asset_loader = R.asset_loader or (R.supermod and R.supermod:GetAssetLoader())
R.loaded_units = R.loaded_units or {}
R.pending_groups = R.pending_groups or {}
R.blocked_units = R.blocked_units or {}
R.revision = "3.5"

function R:ModPath()
    return self.mod_instance and self.mod_instance:GetPath() or "mods/restoration-mod/"
end

function R:UnitLists()
    if not self._unit_lists then
        local path = self:ModPath() .. "lua/sc/superblt_units.lua"
        local reader = blt and blt.vm and blt.vm.dofile or dofile
        local value = reader(path)
        assert(type(value) == "table", "[RestorationMod] Invalid unit list: " .. path)
        self._unit_lists = value
    end
    return self._unit_lists
end

function R:_Ownership()
    Global.restoration_preload_v3 = Global.restoration_preload_v3 or {}
    return Global.restoration_preload_v3
end

function R:_Entry(dres, path, extension)
    local key = dres._get_resource_key(Idstring(extension), Idstring(path), dres.DYN_RESOURCES_PACKAGE)
    return dres._dyn_resources[key], key
end

function R:_Owned(dres, path, extension)
    local key = extension .. "|" .. path
    local saved = self:_Ownership()[key]
    local entry = self:_Entry(dres, path, extension)
    -- A boolean from an earlier setup is insufficient: verify the actual entry.
    return saved and saved == entry and entry.ready and entry.ref_c > 0
        and PackageManager:has(Idstring(extension), Idstring(path))
end

function R:_Fail(reason)
    if not self.failure then
        self.failure = tostring(reason)
        log("[RestorationMod] Preload stopped: " .. self.failure)
    end
    return false, self.failure
end

-- Use the supplied loader's nil-callback path after the new game managers
-- exist. A pre-existing pending entry is an error, never resubmitted or forced
-- ready. Only claim ownership after the native call returns and availability
-- checks succeed; a Lua ready flag alone is not proof of resource availability.
function R:LoadUnitList(name)
    local list = self:UnitLists()[name]
    if not list then return nil, nil, "Unknown unit list: " .. tostring(name) end
    if self.dependency_audit then
        local plan = self.dependency_audit:plan(name, list)
        local valid, why = self.dependency_audit:validate(plan)
        if not valid then return nil, nil, why end
        list = plan.loads
    end
    local dres = managers and managers.dyn_resource
    if not dres then return nil, nil, "DynamicResourceManager is unavailable" end
    local loaded, skipped, missing = 0, 0, 0
    self.missing_list_warnings = self.missing_list_warnings or {}
    for _, item in ipairs(list) do
        local path, extension = item[1], item[2]
        local key = extension .. "|" .. path
        if self:_Owned(dres, path, extension) then
            skipped = skipped + 1
        else
            local ext, id = Idstring(extension), Idstring(path)
            if self.blocked_units[key] then
                return nil, nil, "Resource explicitly blocked: " .. key
            elseif not DB:has(ext, id) then
                if self._declared_asset_keys and self._declared_asset_keys[key] then
                    return nil, nil, "Declared asset has no DB entry after registration: " .. key
                end
                -- The original generated list includes absent base-game/legacy
                -- paths. List membership alone does not make them available.
                -- Do not submit an invalid path or invent a replacement unit.
                missing = missing + 1
                if not self.missing_list_warnings[key] then
                    self.missing_list_warnings[key] = true
                    log("[RestorationMod] Skipping absent, undeclared preload entry: " .. key)
                end
            else
                local entry, resource_key = self:_Entry(dres, path, extension)
                local unloading = dres._to_unload and dres._to_unload[resource_key]
                if (entry and not entry.ready) or (unloading and not unloading.ready) then
                    return nil, nil, "Resource still pending at world creation: " .. key
                end
                -- A ready Lua entry can outlive native residency. Rehydrate it
                -- only at this synchronous setup boundary; preserve all owners.
                -- Pending requests above are never modified or resubmitted.
                local tracked = entry or unloading
                if tracked and tracked.ready and not PackageManager:has(ext, id) then
                    local ok, why = pcall(function()
                        PackageManager:package(dres.DYN_RESOURCES_PACKAGE):load_temp_resource(ext, id, nil, true)
                    end)
                    if not ok then return nil, nil, tostring(why) end
                    if not PackageManager:has(ext, id) then
                        return nil, nil, "Native residency could not be restored: " .. key
                    end
                    log("[RestorationMod] Restored stale native residency: " .. key)
                end
                -- A successful repair of our existing entry retains our ref.
                if self:_Owned(dres, path, extension) then
                    skipped = skipped + 1
                else
                    local ok, reason = pcall(dres.load, dres, ext, id, dres.DYN_RESOURCES_PACKAGE, nil)
                    if not ok then return nil, nil, tostring(reason) end
                    entry = self:_Entry(dres, path, extension)
                    if not entry or not entry.ready or not PackageManager:has(ext, id) then
                        return nil, nil, "Synchronous load did not make resource available: " .. key
                end
                self:_Ownership()[key] = entry
                self.loaded_units[key] = true
                loaded = loaded + 1
                end
            end
        end
    end
    return loaded, skipped, missing
end

function R:LoadAssetGroup(name)
    if not self:UnitLists()[name] then return false, "Unknown unit list: " .. tostring(name) end
    self.pending_groups[name] = true
    -- Package loading precedes manager creation. Never load through the old manager.
    if self.game_managers_ready then return self:FlushPending() end
    return true
end

function R:BeginSetup()
    self.game_managers_ready = false
    self.active_groups = {}
    return self:PrepareAssetEntries()
end

function R:FlushPending()
    local ready, reason = self:PrepareAssetEntries()
    if not ready then return false, reason end
    -- Require-time and menu constructor calls register only; no enemy preloading.
    if not self.game_managers_ready then return true end
    if self.failure then return false, self.failure end
    local names = {"_always"}
    self.active_groups = self.active_groups or {}
    for name in pairs(self.pending_groups) do self.active_groups[name] = true end
    for name in pairs(self.active_groups) do
        if name ~= "_always" then names[#names + 1] = name end
    end
    table.sort(names)
    for _, name in ipairs(names) do
        local count, _, why = self:LoadUnitList(name)
        if not count then return self:_Fail(why) end
        self.pending_groups[name] = nil
        if count > 0 or why > 0 then
            log(string.format("[RestorationMod] Post-manager preload '%s': %d loaded; %d absent undeclared entries skipped", name, count, why))
        end
    end
    return true
end

function R:OnManagersReady()
    self.game_managers_ready = true
    log("[RestorationMod] Loader v3.5: loading required units after game manager initialization")
    return self:FlushPending()
end

function RestorationSuperMod:PrepareAssetEntries()
	local loader = self.asset_loader
	local specs = loader and loader.asset_specs
	if type(specs) ~= "table" or not next(specs) then
		return false, "asset specifications are not available yet"
	end
	if self._prepared_asset_specs == specs and self._prepared_asset_count == #specs then
		return true
	end
	if not (DB and Idstring and BLT and BLT.AssetManager and blt) then
		return false, "asset registration API is not available yet"
	end

	local groups, ordered = {}, {}
	-- Validate every source before creating any database entries. A duplicate
	-- path is allowed only when it describes the very same physical resource.
	for _, spec in ipairs(specs) do
		local key = spec.extension .. "|" .. spec.dbpath
		local group = groups[key]
		local convert = spec.xml_convert
		local signature = spec.file
		if convert then
			signature = signature .. "|" .. convert.path .. "|" .. convert.from_type .. "|" .. convert.to_type
		end
		if group then
			assert(group.signature == signature, "[RestorationMod] Conflicting asset providers: " .. key)
		else
			group = {spec = spec, signature = signature, aliases = {}}
			groups[key] = group
			ordered[#ordered + 1] = group
		end
		group.aliases[#group.aliases + 1] = spec
		group.registered = group.registered or spec._entry_created
		if convert and convert._done then group.converted = true end
	end
	for _, group in ipairs(ordered) do
		local spec = group.spec
		local convert = spec.xml_convert
		local source = convert and convert.path or spec.file
		assert(io.file_is_readable(source), "[RestorationMod] Unreadable asset source: " .. source)
		if convert and not group.converted then
			assert(ScriptSerializer and type(ScriptSerializer["from_" .. convert.from_type]) == "function",
				"[RestorationMod] Missing XML reader: " .. convert.from_type)
			assert(type(ScriptSerializer["to_" .. convert.to_type]) == "function",
				"[RestorationMod] Missing XML writer: " .. convert.to_type)
		end
	end

	-- Complete conversion before publishing resources. Propagate _done to all
	-- aliases: otherwise SuperBLT rewrites the same generated file in its flush.
	for _, group in ipairs(ordered) do
		local convert = group.spec.xml_convert
		if convert then
			if not group.converted then
				local input = assert(io.open(convert.path, "rb"))
				local bytes, read_error = input:read("*a")
				input:close()
				assert(bytes, read_error)
				local data = ScriptSerializer["from_" .. convert.from_type](ScriptSerializer, bytes)
				local binary = assert(ScriptSerializer["to_" .. convert.to_type](ScriptSerializer, data))
				local output = assert(io.open(convert.built_path, "wb"))
				local written, write_error = output:write(binary)
				local closed, close_error = output:close()
				assert(written, write_error)
				assert(closed, close_error)
			end
			for _, alias in ipairs(group.aliases) do alias.xml_convert._done = true end
		end
	end

	local created = 0
	for _, group in ipairs(ordered) do
		local spec = group.spec
		if not group.registered then
			local name, ext = Idstring(spec.dbpath), Idstring(spec.extension)
			blt.ignoretweak(name, ext)
			BLT.AssetManager:CreateEntry(name, ext, spec.file)
			created = created + 1
		end
		for _, alias in ipairs(group.aliases) do alias._entry_created = true end
	end
	self._declared_asset_keys = {}
	for key in pairs(groups) do self._declared_asset_keys[key] = true end
    local reader = blt and blt.vm and blt.vm.dofile or dofile
    local Dependencies = reader(self:ModPath() .. "lua/sc/core/asset_dependencies.lua")
    self.dependency_audit = Dependencies.new(specs)
	self._prepared_asset_specs = specs
	self._prepared_asset_count = #specs
	log(string.format("[RestorationMod] Asset registration: %d declarations, %d unique, %d created; repeat registrations suppressed",
		#specs, #ordered, created))
	return true
end


function R:InstallSetupHooks()
    if GameSetup and not GameSetup._restoration_loader_v35_game then
        GameSetup._restoration_loader_v35_game = true
        local original_packages = GameSetup.load_packages
        function GameSetup:load_packages(...)
            local loader = RestorationSuperMod
            local ok, reason = loader:BeginSetup()
            assert(ok, "[RestorationMod] Asset registration failed: " .. tostring(reason))
            return original_packages(self, ...)
        end
        local original_managers = GameSetup.init_managers
        function GameSetup:init_managers(...)
            local result = original_managers(self, ...)
            local ok, reason = RestorationSuperMod:OnManagersReady()
            assert(ok, "[RestorationMod] Required preload failed: " .. tostring(reason))
            return result
        end
        local original_game = GameSetup.init_game
        function GameSetup:init_game(...)
            local loader = RestorationSuperMod
            assert(loader.game_managers_ready and not loader.failure,
                "[RestorationMod] Cannot create world before required assets are available: " .. tostring(loader.failure))
            local ok, reason = loader:FlushPending()
            assert(ok, "[RestorationMod] Dependency verification before world creation failed: " .. tostring(reason))
            return original_game(self, ...)
        end
    end
end

R:InstallSetupHooks()
-- Early DB registration stays enabled, but require-time enemy loading is removed.
local ready, reason = R:PrepareAssetEntries()
if not ready then log("[RestorationMod] Asset registration deferred: " .. tostring(reason)) end

-- Diagnostic: resolve an @ID<hex>@ from a crash back to a unit path, and say whether it
-- is loaded. Diesel prints the bare hash when it cannot resolve the Idstring, but every
-- unit in tweak_data.group_ai still holds the original string, so the game can do the
-- lookup itself - no need to know the hash algorithm.
--
--   RestorationSuperMod:ReportSpawnUnits()                  -- list everything not loaded
--   RestorationSuperMod:ReportSpawnUnits("d869c48034b2ebd0") -- identify one hash
function RestorationSuperMod:ReportSpawnUnits(target_key)
	local group_ai = tweak_data and tweak_data.group_ai
	if not group_ai or not group_ai.unit_categories then
		log("[RestorationMod] ReportSpawnUnits: tweak_data.group_ai is not built yet")
		return
	end

	local unit_ext = Idstring("unit")
	local seen, found, missing, total = {}, 0, 0, 0

	if target_key then
		target_key = target_key:gsub("^@ID", ""):gsub("@$", ""):lower()
	end

	for cat_name, cat in pairs(group_ai.unit_categories) do
		for faction, list in pairs(cat.unit_types or {}) do
			for _, u in ipairs(list) do
				local key = u:key()
				if not seen[key] then
					seen[key] = true
					total = total + 1

					-- :t() gives the original string back; DB:has says whether the file
					-- is even registered, PackageManager:has whether it is loaded now.
					local ok_name, name = pcall(function() return u:t() end)
					name = ok_name and name or ("@ID" .. key .. "@")

					local registered = DB:has(unit_ext, u)
					local ok_loaded, loaded = pcall(function()
						return PackageManager:has(unit_ext, u)
					end)
					loaded = ok_loaded and loaded or false

					if target_key then
						if key == target_key then
							found = found + 1
							log(string.format(
								"[RestorationMod] @ID%s@ = %s   category=%s faction=%s   registered=%s loaded=%s",
								key, name, tostring(cat_name), tostring(faction),
								tostring(registered), tostring(loaded)))
						end
					elseif not loaded then
						missing = missing + 1
						log(string.format(
							"[RestorationMod] NOT LOADED  %s   (@ID%s@)  category=%s faction=%s registered=%s",
							name, key, tostring(cat_name), tostring(faction), tostring(registered)))
					end
				end
			end
		end
	end

	if target_key then
		log(string.format("[RestorationMod] ReportSpawnUnits: %d match(es) for '%s' out of %d spawn units",
			found, target_key, total))
	else
		log(string.format("[RestorationMod] ReportSpawnUnits: %d of %d spawn units are not loaded",
			missing, total))
	end
end


-- ---------------------------------------------------------------------------
-- Material hash resolver.
--
-- The .model files store material names as 64-bit Idstrings, not text. A model
-- that references a hash no .material_config produces is a hard CTD on spawn.
-- The engine is the only thing that can hash a name, so ask it:
--
--   RestorationSuperMod:ReportMaterials()
--
-- prints  name -> key  for every known material name, then lists every hash the
-- swat/tazer models actually reference and whether a name accounts for it.
-- ---------------------------------------------------------------------------
-- Material hash resolver. In game console / chat:  RestorationSuperMod:ReportMaterials()
RestorationSuperMod._hash_names = {
	"Head",
	"Hips",
	"LeftArm",
	"LeftForeArm",
	"LeftLeg",
	"LeftUpLeg",
	"Neck",
	"RightArm",
	"RightForeArm",
	"RightLeg",
	"RightUpLeg",
	"Spine",
	"Spine1",
	"Spine2",
	"a_holster_left",
	"a_holster_right",
	"c_capsule_LeftArm",
	"c_capsule_LeftForeArm",
	"c_capsule_LeftLeg",
	"c_capsule_LeftUpLeg",
	"c_capsule_RightArm",
	"c_capsule_RightForeArm",
	"c_capsule_RightLeg",
	"c_capsule_RightUpLeg",
	"c_capsule_body_new",
	"c_capsule_mover_blocker",
	"c_explosion",
	"c_explosion_gren",
	"c_glass",
	"c_mask",
	"c_sphere_Hips",
	"c_sphere_Spine",
	"c_sphere_Spine1",
	"c_sphere_Spine2",
	"c_sphere_head",
	"c_sphere_head_ragdoll",
	"g_body",
	"g_body_b",
	"g_body_b_lod1",
	"g_body_b_short",
	"g_body_b_short_lod1",
	"g_body_heavy",
	"g_body_lod1",
	"g_body_short",
	"g_body_short_lod1",
	"g_explosivebag",
	"g_explosivebag_lod1",
	"g_explosivebag_taser",
	"g_face_a",
	"g_face_a_lod1",
	"g_face_b",
	"g_face_b_lod1",
	"g_face_c",
	"g_face_c_lod1",
	"g_face_d",
	"g_face_d_lod1",
	"g_face_e",
	"g_face_e_lod1",
	"g_face_f",
	"g_face_f_lod1",
	"g_face_g",
	"g_face_g_lod1",
	"g_face_h",
	"g_face_h_lod1",
	"g_face_i",
	"g_face_i_lod1",
	"g_face_j",
	"g_face_j_lod1",
	"g_face_k",
	"g_face_k_lod1",
	"g_face_l",
	"g_face_l_lod1",
	"g_face_m",
	"g_face_m_lod1",
	"g_face_n",
	"g_face_n_lod1",
	"g_face_o",
	"g_face_o_lod1",
	"g_glass",
	"g_glass_crk",
	"g_glass_gasmask",
	"g_glass_lod",
	"g_gloves",
	"g_gloves_lod1",
	"g_goggles_a",
	"g_goggles_a_lod1",
	"g_goggles_c",
	"g_goggles_c_lod1",
	"g_helmet_swat_lod1",
	"g_helmet_swat_lod10",
	"g_helmet_swat_lod11",
	"g_helmet_swat_lod12",
	"g_helmet_swat_lod2",
	"g_helmet_swat_lod3",
	"g_helmet_swat_lod4",
	"g_helmet_swat_lod5",
	"g_helmet_swat_lod6",
	"g_helmet_swat_lod7",
	"g_helmet_swat_lod8",
	"g_helmet_swat_lod9",
	"g_helmet_tazer_lod1",
	"g_helmet_tazer_lod2",
	"g_holster_l",
	"g_holster_l_lod1",
	"g_holster_r",
	"g_holster_r_lod1",
	"g_hood",
	"g_hood_lod1",
	"g_mask_gren",
	"g_mask_gren_lod1",
	"g_shades",
	"g_shades_glass",
	"g_shades_lod1",
	"g_sniper",
	"g_sniper_lod1",
	"g_swat_ar",
	"g_swat_ar_lod1",
	"g_swat_heavy_Taser",
	"g_swat_heavy_Taser_lod1",
	"g_swat_heavy_ar",
	"g_swat_heavy_ar_lod1",
	"g_swat_heavy_gren",
	"g_swat_heavy_gren_lod1",
	"g_swat_heavy_sg",
	"g_swat_heavy_sg_lod1",
	"g_swat_heavy_shield",
	"g_swat_heavy_shield_lod1",
	"g_swat_sg",
	"g_swat_sg_lod1",
	"g_swat_smg",
	"g_swat_smg_lod1",
	"mtr_body",
	"mtr_equipment",
	"mtr_gasmask",
	"mtr_glass",
	"mtr_glass_lod",
	"mtr_grenadier",
	"mtr_head",
	"mtr_helmet",
	"mtr_swat",
	"mtr_swat_lod1",
	"mtr_swat_lod2",
	"mtr_swat_static",
	"mtr_swat_static_lod1",
	"mtr_swat_static_lod2",
	"mtr_swat_taser",
	"pivot_holster_left",
	"pivot_holster_right",
	"root_point",
	"s_body",
	"shadow_caster",
}
RestorationSuperMod._hash_wanted = {
	"13fb4cacd5853ddb",
	"d4ac6e6710d36ac0",
	"bd70ac7ed58cfd7a",
	"a3fd501309a5e45d",
	"3525eff77fd47dbb",
	"089cd507635e65ea",
	"7e243c9bffda2d2a",
	"832d9468b628ebd5",
	"2674619597c90bbc",
	"c03a5aa9a8563eea",
	"be37e8b0a020c626",
	"3f82172615cbdaa2",
	"b6c22346a8c4c064",
	"d3001f6f2073d709",
	"776d625fefe2e8d7",
	"b349d8afaea1bbfa",
	"2edf5d01c677bde1",
	"f3f0dbbda036255e",
	"503ffe69b376401f",
	"eee5e91b7dfa8789",
	"baca46451578143d",
	"a06feb5f3e7be38a",
	"65de04893fd1e6ac",
	"0dda088ba39c2598",
	"3b2f3b92d4b779c3",
	"813354fdb8dab058",
	"639eeba388bee19a",
	"5aad17ffdbd2fb7a",
	"a5a71df63c656eed",
	"e45280d1e36792f6",
	"d6177076d64a9a24",
	"f2ff1a6d8fcd9fb8",
	"47fe0c510f695b69",
	"7c9285b6a175d638",
	"dd16d4c78afd0e3d",
	"e038a7aa6887a412",
	"efab8e4268a2f09f",
	"3bfb3a75b35facb0",
	"3d34c61cc496d57f",
	"b433e74ca8dff501",
	"d1dc66eb7de22a48",
	"4d66a4b1fe947996",
	"fc9b6a918fedb7e3",
	"59128c203bd02d52",
	"263d39c7dc74085e",
	"77b65c343281d3a8",
	"cc764297d3da1e9e",
	"d6072918ba34db83",
	"2773f32cc561517e",
	"b5294f46766547ee",
	"cd1f8908d82823f6",
	"8df6526f110fb768",
	"a5b77c25221f6b0b",
	"d16a2b3ff05c4a18",
	"4de175465deebde2",
	"29cdaf031646e70d",
	"1f1384d80059d80a",
	"d0cb7c525c5f84d3",
	"f508bee684e2951c",
	"0d54094a6448704d",
	"66d969116be45f73",
	"3eaae98f85162ae1",
	"4cb637eb8f63705c",
	"3eeeb0a4c29ee086",
	"f835600f0312c96c",
	"247e5eaa35d49a55",
	"ad298e65f6e26255",
	"8d855bf35451cb22",
	"bd8b7b817ce72e5b",
	"a980a4ee7fa0c418",
	"eb352a6fe2779b69",
	"5c1b2664a0040661",
	"dc4322dbb2f573a4",
	"6fae548e75dd100f",
	"b6cf8e405a092b09",
	"fdc97803a5ee3507",
	"ced1b4a785b1d8a8",
	"4852c7b2e83b8243",
	"be4810867aade602",
	"5391dae9e9eb7496",
	"3d33ac6758d46e49",
	"ac026243b0844593",
	"106e6b662f53546f",
	"2276dd2deb1ac35a",
	"f4ea5071bffa8b99",
	"2b3b4edd181f8503",
	"8e0de84d9b62845e",
	"bfd0bcf4867230c6",
	"4b356feab308fbf7",
	"d938ee55132a1f0a",
	"d5249e081ef93994",
	"dde82849d4137b8a",
	"2165ae860b0524f1",
	"8a520da5e5991463",
	"26ec4dfe30393079",
	"2f29e1499930a04a",
	"bddd869ce4f17883",
	"80d16638c2d7983b",
	"dc989acc045b6081",
	"f3569a9064749802",
	"089bbc2693e75dfc",
	"50eb16ca5037c88c",
	"cfd5665b46b6810e",
	"6709d33967aedc83",
	"b64a77993d268b53",
	"e019970d0734806b",
	"684e92be6cc7d6f1",
	"2d2f55a9a18c5f7b",
	"23a5751322efedb9",
	"359841c1020e8f8f",
	"26dcac22b75c6ccd",
	"87522c22c8a89202",
	"2504b9e386a3cb7b",
	"35d774cf8799f8af",
	"428f51177e339285",
	"9914cf9843729cde",
	"127e72de8d1ec31c",
	"5d9beaea0c6a6653",
	"60cfbe0f9ca54c40",
	"edcdc7d3d0c25792",
	"d4abdea2f335cc17",
	"56b63451e752c6a6",
	"eca58030bf36c35e",
	"f22ae2a2795b995c",
	"13387d5fc70523e1",
	"ff375d711dcac334",
	"9612b1b59170a27d",
	"091e863b2d1cddfa",
	"34efa10dafad796f",
	"1bb22345258a1ecd",
	"92fbe00bc399cb7b",
	"ed31b15879c6ed87",
	"ff29cf7cd79234e4",
	"7711bb1e536be94e",
	"f52bee2c80d5d40a",
	"a449a5b4c42c8d6a",
	"d988d04a145544ca",
	"3a3390feca949f5f",
	"38429021b34126e4",
	"b93bb26320d1334e",
	"0b2e359d393b66df",
	"8ec48d01d29f3b40",
	"5a81a7bb79b4cbd7",
	"57cd44212e457572",
	"47cb54b5bd7c1321",
	"9365c0769f30401a",
	"14013d717ab555fe",
	"aaf7523d2286628c",
	"ed81e395540ed5aa",
	"13fed649b10c926e",
	"d71ac36ea8bf5b24",
	"bc54979e8db90d74",
	"84ea363244e1050b",
	"8255340a328a92aa",
	"c0fdeaff309a8e1b",
	"0a5d0e86e2142e3f",
	"f0bf2c4e1caeefb2",
	"5923d466352fbca4",
	"b05b43f4a43eb860",
	"a4b7fdf986c23fc0",
	"7307544769c2c9fc",
	"613d877d3949f6ec",
	"4e4a7247fc15064a",
	"97baf97aab288af6",
	"99575a963fd016d5",
	"cfd01dc6303f6b97",
	"44497cdb4f63e405",
	"e5a69fbe6bcdd4dd",
	"4aa754e98d83df6b",
	"7af4f8457f68ec75",
	"75aedab8b256b12d",
	"4678a92fe558828b",
	"14320e2189b01971",
	"4b9e034526d43588",
	"aa94b0756d5ee636",
	"4df294961477b8a3",
	"fa3f7d4d6d25af03",
	"da1f5060d8584bce",
	"bd69ddbc9a4eb3b3",
	"8790d46313bbc058",
	"8c6b8b108480d8e1",
	"27c647af37d957f3",
	"d59e5cf12a0d3d53",
	"920175351f98fcdd",
	"95b82bb07e5de352",
	"1edc09f9e4d1de9c",
	"288f21ee2786c0d7",
	"577fd1943047430a",
	"9ff02330d477a51c",
	"1939b8beaa8c13f4",
	"129f9887648ca2b7",
	"e41ffecb722e469c",
	"f4f3fcf0f01e73ab",
	"9c2b064bda80519a",
	"602f417478aec4a5",
	"477eae705f4a84d8",
	"8ed62f630ac30629",
	"3bf760f56cd5d298",
	"8e05f1628229232c",
	"de139408fa47f1cd",
	"6632c92e01a9b927",
	"1e5803494573d261",
	"d51d117e78f046e5",
	"3311d4f5d396b47a",
	"5184ac544add477b",
	"d68f7837a656e093",
	"3fb0fb15c9375e21",
	"7d17c2b45679e7e1",
	"9fe39fa504e7b520",
}

function RestorationSuperMod:ReportMaterials()
	local by_key = {}

	log("[RestorationMod] --- name -> Idstring key ---")
	for _, name in ipairs(self._hash_names) do
		local ok, key = pcall(function() return Idstring(name):key() end)
		if ok then
			by_key[key:lower()] = name
			log(string.format("[RestorationMod] HASH %s %s", key, name))
		else
			log(string.format("[RestorationMod] HASH ------ %s <failed>", name))
		end
	end

	log("[RestorationMod] --- hashes referenced by the swat/tazer models ---")
	local unresolved = 0
	for _, key in ipairs(self._hash_wanted) do
		local name = by_key[key]
		if name then
			log(string.format("[RestorationMod] WANT %s = %s", key, name))
		else
			unresolved = unresolved + 1
			log(string.format("[RestorationMod] WANT %s = UNRESOLVED", key))
		end
	end
	log(string.format("[RestorationMod] ReportMaterials: %d of %d referenced hashes unresolved",
		unresolved, #self._hash_wanted))
end
