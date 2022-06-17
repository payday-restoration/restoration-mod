function GameSetup:load_packages()
	Setup.load_packages(self)

	if not PackageManager:loaded("packages/game_base_init") then
		PackageManager:load("packages/game_base_init")
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

	local function load_difficulty_package(package_name)
		if PackageManager:package_exists(package_name) and not PackageManager:loaded(package_name) then
			table.insert(self._loaded_diff_packages, package_name)
			PackageManager:load(package_name)
		end
    end

    local a = tweak_data.levels.ai_groups.america
    local r = tweak_data.levels.ai_groups.russia
    local m = tweak_data.levels.ai_groups.murkywater
    local z = tweak_data.levels.ai_groups.zombie
    local f = tweak_data.levels.ai_groups.federales
    local la = tweak_data.levels.ai_groups.lapd
    local ny = tweak_data.levels.ai_groups.nypd
	local feds = tweak_data.levels.ai_groups.fbi
	local texas = tweak_data.levels.ai_groups.texas
    local ai_type = tweak_data.levels:get_ai_group_type()

	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
    
	if job_tweak_package_data and job_tweak_package_data.load_all_difficulty_packages and not managers.skirmish:is_skirmish() then
		for i, difficulty in ipairs(tweak_data.difficulties) do
			local diff_package = "packages/" .. (difficulty or "normal")

			load_difficulty_package(diff_package)
        end
    elseif ai_type == a then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_america" or "normal")

		load_difficulty_package(diff_package)
		PackageManager:load("packages/sm_wish")
	elseif ai_type == z then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_zombie" or "normal")

        load_difficulty_package(diff_package)
		PackageManager:load("packages/sm_wish")
	
    elseif ai_type == r then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_russia" or "normal")

        load_difficulty_package(diff_package) 

    elseif ai_type == m then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_murkywater" or "normal")

        load_difficulty_package(diff_package)
    elseif ai_type == f then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_federales" or "normal")

        load_difficulty_package(diff_package)
    elseif ai_type == la then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_lapd" or "normal")

        load_difficulty_package(diff_package)
		PackageManager:load("packages/sm_wish")
    elseif ai_type == ny then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_nypd" or "normal")

        load_difficulty_package(diff_package)
		PackageManager:load("packages/sm_wish")
	elseif ai_type == feds then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_fbi" or "normal")

        load_difficulty_package(diff_package)
		PackageManager:load("packages/sm_wish")	
	elseif ai_type == texas then
		local diff_package = "packages/" .. (Global.game_settings and Global.game_settings.difficulty .. "_sc_texas" or "normal")

        load_difficulty_package(diff_package)
		PackageManager:load("packages/sm_wish")		
	else
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
            "packages/lvl_mad",
			"levels/narratives/elephant/mad/world_sounds"
        }
        table.insert(self._loaded_faction_packages, faction_package)
	
	elseif ai_type == f then
        faction_package = {
            "packages/job_bex",
			"levels/narratives/vlad/bex/world_sounds"
        }
        table.insert(self._loaded_faction_packages, faction_package)
	--[[	
	elseif ai_type == texas then
        faction_package = {
            "packages/job_ranc",
			"levels/narratives/locke/ranc/world_sounds"
        }
        table.insert(self._loaded_faction_packages, faction_package)	
	]]--
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

	if Global.mutators and Global.mutators.active_on_load and table.size(Global.mutators.active_on_load) > 0 and PackageManager:package_exists(MutatorsManager.package) and not PackageManager:loaded(MutatorsManager.package) then
		self._mutators_package = MutatorsManager.package

		PackageManager:load(MutatorsManager.package)
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

	if self._mutators_package and PackageManager:loaded(self._mutators_package) then
		table.insert(self._packages_to_unload, self._mutators_package)

		self._mutators_package = nil
	end
end