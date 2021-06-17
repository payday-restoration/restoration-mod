function MenuSetup:load_packages()
	Setup.load_packages(self)

	if not PackageManager:loaded("packages/start_menu") then
		PackageManager:load("packages/start_menu")
	end

	if not PackageManager:loaded("packages/load_level") then
		PackageManager:load("packages/load_level")
	end

	if not PackageManager:loaded("packages/load_default") then
		PackageManager:load("packages/load_default")
	end

	if _G.IS_VR and not PackageManager:loaded("packages/vr_base") then
		PackageManager:load("packages/vr_base")
	end

	if _G.IS_VR and not PackageManager:loaded("packages/vr_menu") then
		PackageManager:load("packages/vr_menu")
    end
    
    -- Always load
    if not PackageManager:loaded("packages/addhudmisc") then
        PackageManager:load("packages/addhudmisc")
    end
    if not PackageManager:loaded("packages/scassets") then
        PackageManager:load("packages/scassets")
    end
    if not PackageManager:loaded("packages/outfitassets") then
        PackageManager:load("packages/outfitassets")
    end

	local prefix = "packages/dlcs/"
	local sufix = "/start_menu"
	local package = ""

	for dlc_package, bundled in pairs(tweak_data.BUNDLED_DLC_PACKAGES) do
		package = prefix .. tostring(dlc_package) .. sufix

		Application:debug("[MenuSetup:load_packages] DLC package: " .. package, "Is package OK to load?: " .. tostring(bundled))

		if bundled and (bundled == true or bundled == 1) and PackageManager:package_exists(package) and not PackageManager:loaded(package) then
			PackageManager:load(package)
		end
	end

	local platform = SystemInfo:platform()

	if platform == Idstring("XB1") or platform == Idstring("PS4") then
		if not PackageManager:loaded("packages/game_base_init") then
			PackageManager:load("packages/game_base_init")

			if Application:installer():get_progress() >= 1 then
				PackageManager:load("packages/game_base")
			end

			Global._game_base_package_loaded = true
		end
	elseif not PackageManager:loaded("packages/game_base_init") then
		local function _load_wip_func()
			Global._game_base_package_loaded = true
		end

		local function load_base_func()
			PackageManager:load("packages/game_base", _load_wip_func)
		end

		PackageManager:load("packages/game_base_init", load_base_func)
	end
end