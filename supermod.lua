-- Restoration Mod - SuperBLT entry point.
-- Runs via the <hooks> block in supermod.xml. Captures the mod's asset loader so scripted
-- asset groups (<group target="scripted" load_group="..."/>) can be loaded from game code.
--
-- Loading policy, and why it lives here instead of in the XML:
--
-- SuperBLT's asset loader will dyn-load anything marked dyn_package="true" the moment the
-- group is flushed, in whatever order pairs() happens to walk the table. That is fine for
-- a handful of overrides and wrong for us, for two reasons:
--
--   1. A unit can be handed to dyn_resource before its own .object/.model/.material_config
--      DB entries have been created, because they are all flushed in the same arbitrary
--      order pass.
--   2. A dbpath that is registered in more than one group - and 360 of ours are, because
--      the old BeardLib packages shared enemies between factions - gets handed to
--      dyn_resource once per group. The second load never completes. dyn_resource keeps
--      waiting on it, the level never finishes loading, and the game sits on a black
--      screen until it is killed.
--
-- So every superblt/*.xml now sets dyn_package="false": SuperBLT creates DB entries and
-- nothing else. The list of units that actually need loading lives in
-- lua/sc/superblt_units.lua, and this file loads them itself, after the whole group is
-- registered, at most once per dbpath for the lifetime of the process.
if not RestorationSuperMod then
	RestorationSuperMod = {}

	RestorationSuperMod.mod_instance = ModInstance
	RestorationSuperMod.supermod = ModInstance and ModInstance.supermod
	RestorationSuperMod.asset_loader = RestorationSuperMod.supermod and RestorationSuperMod.supermod:GetAssetLoader()

	-- dbpath key -> true, for every unit already handed to dyn_resource.
	RestorationSuperMod.loaded_units = {}

	-- Group names asked for before managers.dyn_resource existed. The <hooks> block runs
	-- when lib/setups/gamesetup.lua is *required*, which is long before the managers are
	-- built, and GameSetup:load_packages runs before init_managers too - so the first ask
	-- for a faction always lands too early. It is parked here and flushed from the
	-- DynamicResourceManagerCreated hook at the bottom of this file.
	RestorationSuperMod.pending_groups = {}

	log(string.format("[RestorationMod] SuperBLT init: ModInstance=%s supermod=%s asset_loader=%s",
		tostring(RestorationSuperMod.mod_instance ~= nil),
		tostring(RestorationSuperMod.supermod ~= nil),
		tostring(RestorationSuperMod.asset_loader ~= nil)))

	if RestorationSuperMod.asset_loader then
		local groups = {}
		for name, _ in pairs(RestorationSuperMod.asset_loader.script_loadable_packages or {}) do
			table.insert(groups, name)
		end
		log("[RestorationMod] scripted asset groups available: " ..
			(#groups > 0 and table.concat(groups, ", ") or "(none)"))
	end

	function RestorationSuperMod:ModPath()
		local inst = self.mod_instance
		if inst and inst.GetPath then
			local ok, path = pcall(function() return inst:GetPath() end)
			if ok and path then
				return path
			end
		end
		return "mods/restoration-mod/"
	end

	-- The generated { group_name = { {dbpath, extension}, ... } } table.
	function RestorationSuperMod:UnitLists()
		if self._unit_lists == nil then
			local file = self:ModPath() .. "lua/sc/superblt_units.lua"
			local ok, result
			if not io.file_is_readable(file) then
				ok, result = false, "file is not readable"
			elseif blt and blt.vm and blt.vm.dofile then
				ok, result = pcall(blt.vm.dofile, file)
			else
				ok, result = pcall(dofile, file)
			end
			if ok and type(result) == "table" then
				self._unit_lists = result
			else
				self._unit_lists = false
				log("[RestorationMod] FATAL: could not read '" .. file .. "': " .. tostring(result))
			end
		end
		return self._unit_lists or nil
	end

	-- Hands every not-yet-loaded unit in one list to dyn_resource. Returns loaded, skipped,
	-- missing. 'missing' names entries with no DB record at all - those are the ones whose
	-- files are absent or misnamed, and they are logged individually so they can be found.
	function RestorationSuperMod:LoadUnitList(list_name)
		local lists = self:UnitLists()
		local list = lists and lists[list_name]
		if not list then
			return nil, nil, "no unit list named '" .. tostring(list_name) .. "'"
		end

		local dres = managers and managers.dyn_resource
		if not dres then
			return nil, nil, "managers.dyn_resource does not exist yet"
		end

		local package = dres.DYN_RESOURCES_PACKAGE
		local loaded, skipped, missing = 0, 0, 0

		for _, entry in ipairs(list) do
			local dbpath, extension = entry[1], entry[2]
			local key = extension .. "|" .. dbpath

			if self.loaded_units[key] then
				skipped = skipped + 1
			else
				local ext_id = Idstring(extension)
				local db_id = Idstring(dbpath)

				if DB:has(ext_id, db_id) then
					-- Mark it before the call: dyn_resource may run the callback inline,
					-- and a dbpath must never be handed over twice.
					self.loaded_units[key] = true
					loaded = loaded + 1
					dres:load(ext_id, db_id, package, nil)
				else
					missing = missing + 1
					log("[RestorationMod] MISSING ASSET: " .. dbpath .. "." .. extension ..
						" is in the '" .. list_name .. "' load list but has no DB entry -" ..
						" the file is absent from assets/ or is not registered in superblt/*.xml")
				end
			end
		end

		return loaded, skipped, missing
	end

	-- Loads one faction's units. The DB entries themselves are already in place: every
	-- superblt/*.xml group registers at mod init, which it has to - registering during
	-- GameSetup:load_packages is too late for the level's own packages to pick up the
	-- overrides, and the mod's files silently lose to the base game's.
	--
	-- Returns true on success; on failure returns false plus a reason naming the stage
	-- that failed.
	function RestorationSuperMod:LoadAssetGroup(group_name)
		if not self.asset_loader then
			return false, "GetAssetLoader() returned nil - supermod.lua ran but SuperBLT gave no asset loader"
		end

		local lists = self:UnitLists()
		if not lists then
			return false, "lua/sc/superblt_units.lua could not be read (see the FATAL line above)"
		end
		if not lists[group_name] then
			local names = {}
			for name, _ in pairs(lists) do
				table.insert(names, name)
			end
			table.sort(names)
			return false, string.format("no unit list named '%s' (lists: %s)",
				tostring(group_name), #names > 0 and table.concat(names, ", ") or "none")
		end

		if not (managers and managers.dyn_resource) then
			self.pending_groups[group_name] = true
			log("[RestorationMod] faction '" .. group_name ..
				"' deferred: managers.dyn_resource does not exist yet, will load from" ..
				" the DynamicResourceManagerCreated hook")
			return true
		end

		-- The always-on sets are shared with every faction, so they go in first and claim
		-- their dbpaths before the faction list runs.
		self:LoadUnitList("_always")

		local loaded, skipped, missing = self:LoadUnitList(group_name)
		if not loaded then
			return false, tostring(missing)
		end

		log(string.format("[RestorationMod] faction '%s': %d units loaded, %d already loaded, %d missing",
			group_name, loaded, skipped, missing))

		return true
	end
end

-- Loads the always-on set plus anything LoadAssetGroup had to park, and is safe to call
-- as often as you like: loaded_units means a dbpath is only ever handed over once.
function RestorationSuperMod:FlushPending()
	if not (managers and managers.dyn_resource) then
		return
	end

	local loaded, skipped, missing = self:LoadUnitList("_always")
	if not loaded then
		log("[RestorationMod] always-on units NOT loaded: " .. tostring(missing))
	elseif loaded > 0 or missing > 0 then
		log(string.format("[RestorationMod] always-on units: %d loaded, %d already loaded, %d missing",
			loaded, skipped, missing))
	end

	for group_name, _ in pairs(self.pending_groups) do
		self.pending_groups[group_name] = nil
		local l, s, m = self:LoadUnitList(group_name)
		if not l then
			log("[RestorationMod] faction '" .. group_name .. "' NOT loaded: " .. tostring(m))
		else
			log(string.format("[RestorationMod] faction '%s': %d units loaded, %d already loaded, %d missing",
				group_name, l, s, m))
		end
	end
end

-- The managers do not exist when this script runs, so the real loading happens here.
-- SuperBLT fires this when managers.dyn_resource is created, which is after
-- GameSetup:load_packages has already picked the faction.
if not RestorationSuperMod._dyn_hook_added and Hooks then
	RestorationSuperMod._dyn_hook_added = true
	Hooks:Add("DynamicResourceManagerCreated", "RestorationMod.SuperBLTAssets", function()
		local ok, err = pcall(function() RestorationSuperMod:FlushPending() end)
		if not ok then
			log("[RestorationMod] ERROR flushing asset loads: " .. tostring(err))
		end
	end)
end

-- And once more on every gamesetup/menusetup hook, in case the manager already existed.
RestorationSuperMod:FlushPending()

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
