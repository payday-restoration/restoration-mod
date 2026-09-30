-- Run after the complete setup init, including SuperBLT's constructor hooks.
if not GameSetup._resmod_asset_loader_v2_hooked then
    GameSetup._resmod_asset_loader_v2_hooked = true
    local original = GameSetup.init_managers
    local function finish(self, ...)
        if RestorationSuperMod then
            local ok, reason = RestorationSuperMod:OnManagersReady()
            assert(ok, "[RestorationMod] Required preload failed: " .. tostring(reason))
        end
        return ...
    end
    function GameSetup:init_managers(...)
        return finish(self, original(self, ...))
    end
end

function GameSetup:load_packages()
	if RestorationSuperMod then RestorationSuperMod:BeginSetup() end
	Setup.load_packages(self)

	if not PackageManager:loaded("packages/game_base_init") then
		PackageManager:load("packages/game_base_init")
	end
	
	--Gangster's VO
	if not PackageManager:loaded("levels/narratives/h_alex_must_die/stage_1/world_sounds") then
		PackageManager:load("levels/narratives/h_alex_must_die/stage_1/world_sounds")
	end
	if not PackageManager:loaded("levels/narratives/h_alex_must_die/stage_2/world_sounds") then
		PackageManager:load("levels/narratives/h_alex_must_die/stage_2/world_sounds")
	end
	if not PackageManager:loaded("levels/narratives/e_welcome_to_the_jungle/stage_1/world_sounds") then
		PackageManager:load("levels/narratives/e_welcome_to_the_jungle/stage_1/world_sounds")
	end
	if not PackageManager:loaded("levels/narratives/dentist/mia/stage2/world_sounds") then
		PackageManager:load("levels/narratives/dentist/mia/stage2/world_sounds")
	end

	if not managers.dlc:is_installing() then
		if not PackageManager:loaded("packages/game_base") and PackageManager:package_exists("packages/game_base") then
			PackageManager:load("packages/game_base")
		end

		if not PackageManager:loaded("packages/wip/game_base") and PackageManager:package_exists("packages/wip/game_base") then
			PackageManager:load("packages/wip/game_base")
		end

		local prefix = "packages/dlcs/"
		local sufix = "/game_base"
		local package = ""

		for dlc_package, bundled in pairs(tweak_data.BUNDLED_DLC_PACKAGES) do
			package = prefix .. tostring(dlc_package) .. sufix

			Application:debug("[MenuSetup:load_packages] DLC package: " .. package, "Is package OK to load?: " .. tostring(bundled))

			if bundled and (bundled == true or bundled == 2) and PackageManager:package_exists(package) and not PackageManager:loaded(package) then
				PackageManager:load(package)
			end
		end
	end

	local job_tweak_contact_data, job_tweak_package_data = nil

	if Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id then
		job_tweak_contact_data = tweak_data.narrative:job_data(Global.job_manager.current_job.job_id)
		job_tweak_package_data = tweak_data.narrative:job_data(Global.job_manager.current_job.job_id, true)
	end

	self._loaded_diff_packages = {}

	-- Keep vanilla support resources alongside custom faction registrations.
	-- Russia/Murkywater/Federales previously omitted this baseline entirely.
	local function load_difficulty_package(package_name)
		if PackageManager:package_exists(package_name) and not PackageManager:loaded(package_name) then
			table.insert(self._loaded_diff_packages, package_name)
			log("[RestorationMod] Loading difficulty support package: " .. package_name)
			PackageManager:load(package_name)
		end
    end

	-- Faction assets are BeardLib packages. Registration already happened at boot
	-- from Corepre.lua; what runs here is the dyn_resource hand-off, split the same
	-- way lua/sc/superblt_units.lua splits it: one always-on list plus one list per
	-- faction. A path in the always list is left out of the faction lists, and
	-- BeardLib skips an asset it already holds, so nothing is handed over twice.
	local restoration_always_packages = {
		"packages/res_load_always",
		"packages/res_pkg_america_misc",
		"packages/res_pkg_gensec_misc",
		"packages/res_pkg_mcshay_misc",
		"packages/res_pkg_murkywater_misc",
		"packages/res_pkg_omnia_misc",
	}

	local restoration_always_loaded = false

	local function load_restoration_package(package)
		if not PackageManager:package_exists(package) then
			log("[RestorationMod] package does not exist: " .. package .. " - not declared in main.xml?")
			return false
		end

		if not PackageManager:loaded(package) then
			log("[RestorationMod] loading " .. package)
			PackageManager:load(package)
		end

		return true
	end

	local function load_faction_assets(faction)
		if not restoration_always_loaded then
			restoration_always_loaded = true
			for _, package in ipairs(restoration_always_packages) do
				load_restoration_package(package)
			end
		end

		load_restoration_package("packages/res_load_" .. faction)
	end

    local a = tweak_data.levels.ai_groups.america
    local r = tweak_data.levels.ai_groups.russia
    local m = tweak_data.levels.ai_groups.murkywater
    local z = tweak_data.levels.ai_groups.zombie
    local f = tweak_data.levels.ai_groups.federales
    local la = tweak_data.levels.ai_groups.lapd
    local ny = tweak_data.levels.ai_groups.nypd
	local feds = tweak_data.levels.ai_groups.fbi
    local ai_type = tweak_data.levels:get_ai_group_type()
	log("[RestorationMod] load_packages: level_id=" .. tostring(Global.level_data and Global.level_data.level_id) ..
		" ai_type=" .. tostring(ai_type) ..
		" | known: " .. tostring(a) .. "," .. tostring(r) .. "," .. tostring(m) .. "," .. tostring(z) ..
		"," .. tostring(f) .. "," .. tostring(la) .. "," .. tostring(ny) .. "," .. tostring(feds))

	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
    
	if job_tweak_package_data and job_tweak_package_data.load_all_difficulty_packages and not managers.skirmish:is_skirmish() then
        -- Vanilla difficulty packages do not contain our registered replacement units.
        -- Keep the faction preload even on jobs which request every difficulty.
        local factions = {{a,"america"},{z,"zombie"},{r,"russia"},{m,"murkywater"},
            {f,"federales"},{la,"lapd"},{ny,"nypd"},{feds,"fbi"}}
        local found = false
        for _, pair in ipairs(factions) do
            if ai_type == pair[1] then load_faction_assets(pair[2]);found = true;break end
        end
        if not found then
            for _, pair in ipairs(factions) do load_faction_assets(pair[2]) end
        end

		for i, difficulty in ipairs(tweak_data.difficulties) do
			local diff_package = "packages/" .. (difficulty or "normal")

			load_difficulty_package(diff_package)
        end
    elseif ai_type == a then
		load_faction_assets("america")
		load_difficulty_package("packages/sm_wish")
	elseif ai_type == z then
		load_faction_assets("zombie")
		load_difficulty_package("packages/sm_wish")
	
    elseif ai_type == r then
		load_faction_assets("russia")
		load_difficulty_package("packages/sm_wish")
    elseif ai_type == m then
		load_faction_assets("murkywater")
		load_difficulty_package("packages/sm_wish")
    elseif ai_type == f then
		load_faction_assets("federales")
		load_difficulty_package("packages/sm_wish")
    elseif ai_type == la then
		load_faction_assets("lapd")
		load_difficulty_package("packages/sm_wish")
    elseif ai_type == ny then
		load_faction_assets("nypd")
		load_difficulty_package("packages/sm_wish")
	elseif ai_type == feds then
		load_faction_assets("fbi")
		load_difficulty_package("packages/sm_wish")	
	else
        log("[RestorationMod] Unknown faction: preloading declared faction groups")
        for _, name in ipairs({"america","zombie","russia","murkywater","federales","lapd","nypd","fbi"}) do
            load_faction_assets(name)
        end

		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty or "normal")

		load_difficulty_package(diff_package)
    end
    
    self._loaded_faction_packages = {}

    local faction_package

    if not Global.level_data or not Global.level_data.level_id then
		if not Application:editor() then
			faction_package = "packages/production/level_debug"
		end
    end

    if ai_type == z then
        faction_package = {
            "packages/narr_hvh", 
            "levels/narratives/bain/hvh/world_sounds"
        }
        table.insert(self._loaded_faction_packages, faction_package)
		
    elseif ai_type == r then 
        faction_package = {
			"levels/narratives/elephant/mad/world_sounds"
        }
        table.insert(self._loaded_faction_packages, faction_package)
	 elseif ai_type == m then 
        faction_package = {
			"packages/omniamisc"
        }
        table.insert(self._loaded_faction_packages, faction_package)
	elseif ai_type == f then
        faction_package = {
            "packages/job_bex",
			"levels/narratives/vlad/bex/world_sounds"
        }
        table.insert(self._loaded_faction_packages, faction_package)
	
    end
    if faction_package then
        if type(faction_package) == "table" then
            self._loaded_faction_packages = faction_package
            
            for _, package in ipairs(faction_package) do
				if not PackageManager:loaded(package) then
					PackageManager:load(package)
				end
			end
        end
	end

	local level_package = nil

	if not Global.level_data or not Global.level_data.level_id then
		if not Application:editor() then
			level_package = "packages/production/level_debug"
		end
	else
		local lvl_tweak_data = Global.level_data and Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
		level_package = lvl_tweak_data and lvl_tweak_data.package
	end

	if level_package then
		if type(level_package) == "table" then
			self._loaded_level_package = level_package

			for _, package in ipairs(level_package) do
				if not PackageManager:loaded(package) then
					PackageManager:load(package)
				end
			end
		elseif not PackageManager:loaded(level_package) then
			self._loaded_level_package = level_package

			PackageManager:load(level_package)
		end
	end

	local contact = nil

	if Global.job_manager and Global.job_manager.interupt_stage then
		contact = "interupt"

		if tweak_data.levels[Global.job_manager.interupt_stage].bonus_escape then
			contact = "bain"
		end
	else
		contact = job_tweak_contact_data and job_tweak_contact_data.contact
	end

	local contact_tweak_data = tweak_data.narrative.contacts[contact]
	local contact_package = contact_tweak_data and contact_tweak_data.package

	if contact_package and not PackageManager:loaded(contact_package) then
		self._loaded_contact_package = contact_package

		PackageManager:load(contact_package)
	end

	local contract_package = job_tweak_package_data and job_tweak_package_data.package

	if contract_package and not PackageManager:loaded(contract_package) then
		self._loaded_contract_package = contract_package

		PackageManager:load(contract_package)
	end

	if Global.level_data and Global.level_data.level_id and Global.game_settings and Global.game_settings.gamemode == "crime_spree" then
		self._loaded_job_packages = {}

		for job_id, data in pairs(tweak_data.narrative.jobs) do
			for _, level_data in ipairs(data.chain or {}) do
				if level_data.level_id == Global.level_data.level_id then
					local package = data.package

					if package and PackageManager:package_exists(package) and not PackageManager:loaded(package) and not table.contains(self._loaded_job_packages, package) then
						table.insert(self._loaded_job_packages, package)
					end
				end
			end
		end

		for _, package in ipairs(self._loaded_job_packages) do
			PackageManager:load(package)
		end
	end

	if Global.mutators and Global.mutators.active_on_load and table.size(Global.mutators.active_on_load) > 0 then
		self._mutators_packages = {}

		if PackageManager:package_exists(MutatorsManager.package) and not PackageManager:loaded(MutatorsManager.package) then
			table.insert(self._mutators_packages, MutatorsManager.package)
		end

		for id, data in pairs(Global.mutators.active_on_load) do
			local package = _G[id] and _G[id].package

			if package and PackageManager:package_exists(package) and not PackageManager:loaded(package) then
				table.insert(self._mutators_packages, package)
			end
		end

		for _, package in ipairs(self._mutators_packages) do
			PackageManager:load(package)
		end
	end
end

function GameSetup:gather_packages_to_unload()
	Setup.unload_packages(self)

	self._started_unloading_packages = true
	self._packages_to_unload = self._packages_to_unload or {}

	if not Global.load_level then
		local prefix = "packages/dlcs/"
		local sufix = "/game_base"
		local package = ""

		for dlc_package, bundled in pairs(tweak_data.BUNDLED_DLC_PACKAGES) do
			package = prefix .. tostring(dlc_package) .. sufix

			if bundled and (bundled == true or bundled == 2) and PackageManager:package_exists(package) and PackageManager:loaded(package) then
				table.insert(self._packages_to_unload, package)
			end
		end
	end

	if self._loaded_level_package then
		if type(self._loaded_level_package) == "table" then
			for _, package in ipairs(self._loaded_level_package) do
				if PackageManager:loaded(package) then
					table.insert(self._packages_to_unload, package)
				end
			end
		elseif PackageManager:loaded(self._loaded_level_package) then
			table.insert(self._packages_to_unload, self._loaded_level_package)
		end

		self._loaded_level_package = nil
	end

	if PackageManager:loaded(self._loaded_contact_package) then
		table.insert(self._packages_to_unload, self._loaded_contact_package)

		self._loaded_contact_package = nil
	end

	if PackageManager:loaded(self._loaded_contract_package) then
		table.insert(self._packages_to_unload, self._loaded_contract_package)

		self._loaded_contract_package = nil
	end

	if self._loaded_job_packages then
		for _, package in ipairs(self._loaded_job_packages) do
			if PackageManager:loaded(package) then
				table.insert(self._packages_to_unload, package)
			end
		end
	end

	if self._loaded_diff_packages then
		for i, package in ipairs(self._loaded_diff_packages) do
			if PackageManager:loaded(package) then
				table.insert(self._packages_to_unload, package)
			end
		end

		self._loaded_diff_packages = {}
    end
    
    if self._loaded_faction_packages then
		for i, package in ipairs(self._loaded_faction_packages) do
			if PackageManager:loaded(package) then
				table.insert(self._packages_to_unload, package)
			end
		end

		self._loaded_faction_packages = {}
	end

	if self._mutators_packages then
		for i, package in ipairs(self._mutators_packages) do
			if PackageManager:loaded(package) then
				table.insert(self._packages_to_unload, package)
			end
		end

		self._mutators_packages = {}
	end
end

-- Integrated host sequence authority. Uses the existing overhaul hook registration.
do
 local authority = rawget(_G, "RestorationSequenceAuthority")
 if not authority then
  local root = restoration and restoration._mod_path
  if not root then
   local source = debug.getinfo(1, "S").source:gsub("^@", ""):gsub("\\", "/")
   root = source:match("^(.-)/lua/")
  end
  assert(root, "[SequenceAuthority] Cannot resolve overhaul root")
  -- The game loader need not propagate the Lua chunk return value.
  dofile(root:gsub("[/\\]+$", "") .. "/lua/sc/core/sequence_authority.lua")
  authority = rawget(_G, "RestorationSequenceAuthority")
 end
 assert(type(authority) == "table" and type(authority.install) == "function",
  "[SequenceAuthority] sequence_authority.lua did not initialize; verify the complete integrated lua folder is installed")
 authority:install()
end -- Restoration authority bootstrap

Hooks:PreHook(GameSetup, "init_game", "RestorationAuthorityWorld", function()
 RestorationSequenceAuthority:reset_world()
 RestorationSequenceAuthority:install()
end)
Hooks:PostHook(GameSetup, "update", "RestorationAuthorityTick", function()
 RestorationSequenceAuthority:update()
end)
