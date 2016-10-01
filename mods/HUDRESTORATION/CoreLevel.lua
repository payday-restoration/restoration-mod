--THIS MUST ALWAYS HOOK TO core/lib/managers/coresequencemanager
local map = Global.level_data.level_id
local rnd = math.random (3)
local rnd2 = math.random (2)
--ANYWHERE ELSE AND I'LL TAKE IT AWAY FROM YOU

--Package Loaders
--EXPERIMENTAL!!!  While loading packages during loadtime prevents asset corruption and crashes/visual glitches, it seriously puts load on overhead... look into truncating this?
--Also, when building a new level, keep extra packages and instances as low as you can without sacrificing ideas
--Make sure to put together small testing teams prior to pushing out an update to test a level's overhead, since too heavy a load will cause the game to CTD due to running out of memory

--Green Harvest Packages
if Global.load_level == true and map == "greenharvest_stage1" and not PackageManager:loaded("packages/narr_hox_3") then
PackageManager:load("packages/narr_hox_3")
PackageManager:load("packages/narr_big")
PackageManager:load("packages/narr_roberts")
PackageManager:load("levels/narratives/bain/roberts/world/world")
PackageManager:load("levels/narratives/dentist/hox/stage_1/world/world")
PackageManager:load("levels/narratives/h_watchdogs/stage_1/world_sounds")
log("green harvest stage 1 loaded")
end
if Global.load_level == true and map == "escape_overpass_ghrv" and not PackageManager:loaded("packages/narr_hox_3") then
PackageManager:load("packages/narr_hox_3")
PackageManager:load("levels/narratives/h_watchdogs/stage_1/world_sounds")
log("green harvest overpass escape loaded")
end
if Global.load_level == true and map == "escape_garage_ghrv" and not PackageManager:loaded("packages/narr_hox_3") then
PackageManager:load("packages/narr_hox_3")
PackageManager:load("levels/narratives/h_watchdogs/stage_1/world_sounds")
PackageManager:load("levels/narratives/dentist/hox/stage_1/world/world")
log("green harvest garage escape loaded")
end
--Dearly Departing Packages

--Time of Day Loader
if Restoration.options.veritas_tod == true then
Hooks:Add("BeardLibCreateScriptDataMods", "TODCallBeardLibSequenceFuncs", function()


	if map == "watchdogs_1" then
	if rnd == 1 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	elseif rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	end
	
	if map == "branchbank" then
	if rnd == 1 or rnd == 2 then
	BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end
	
	if map == "watchdogs_1_night" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if map == "ukrainian_job" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/cloudy_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end

	if map == "mad" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_mad_outdoor/pd2_mad_outdoor", "environment")
	end
	
	end)
end

--Heist Loader	
Hooks:Add("BeardLibCreateScriptDataMods", "RestorationCallBeardLibSequenceFuncs", function()
	--Green Harvest	
	if map == "greenharvest_stage1" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_stage1.custom_xml", "custom_xml", "levels/narratives/h_firestarter/stage_3/world/world", "continent")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_bdrop.custom_xml", "custom_xml", "levels/narratives/h_firestarter/stage_3/pc_only/pc_only", "continent")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_stage1.generic_xml", "generic_xml", "levels/narratives/h_firestarter/stage_3/world/world", "mission")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest.nav_data.generic_xml", "generic_xml", "levels/narratives/h_firestarter/stage_3/nav_manager_data", "nav_data")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_worlddef.custom_xml", "custom_xml", "levels/narratives/h_firestarter/stage_3/world", "world")
		log("green harvest loaded")
	end
	if map == "escape_garage_ghrv" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_garage_ghrv.generic_xml", "generic_xml", "levels/narratives/escapes/escape_garage/world/world", "mission")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_garage_ghrv.custom_xml", "custom_xml", "levels/narratives/escapes/escape_garage/world/world", "continent")
	end
	if map == "escape_overpass_ghrv" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_overpass_ghrv.generic_xml", "generic_xml", "levels/narratives/escapes/escape_overpass/world/world", "mission")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_overpass_ghrv.custom_xml", "custom_xml", "levels/narratives/escapes/escape_overpass/world/world", "continent")
	end
	
	
	--Dearly Departing
log("green harvest garage escape loaded")
	--Safehouse edits removed for safety
end)


--Environment skies loader
	
	Hooks:Add("BeardLibPreProcessScriptData", "RestorationCreateEnvironment", function(PackManager, path, raw_data)
    if managers.dyn_resource then
        local skies = {
            "sky_1930_twillight",
            "sky_1846_low_sun_nice_clouds",
            "sky_0902_overcast",
			"sky_0200_night_moon_stars",
			"sky_2000_twilight_mad"
        }
        for _, sky in ipairs(skies) do
            if not managers.dyn_resource:has_resource(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
                log("not loaded")
                managers.dyn_resource:load(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
            end
        end
    end
end)
	
--Shadow Caster Fix
