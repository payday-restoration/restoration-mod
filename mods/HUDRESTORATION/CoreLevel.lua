--THIS MUST ALWAYS HOOK TO core/lib/managers/coresequencemanager
local map = Global.level_data.level_id
local rnd = math.random (3)
local rnd2 = math.random (2)
--ANYWHERE ELSE AND I'LL TAKE IT AWAY FROM YOU

if Restoration.options.veritas_tod == true then
Hooks:Add("BeardLibCreateScriptDataMods", "TODCallBeardLibSequenceFuncs", function()


	if map == "watchdogs_1" then
	if rnd == 1 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment", true)
	elseif rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment", true)
	end
	end
	
	if map == "branchbank" then
	if rnd == 1 or rnd == 2 then
	BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment", true)
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end
	
	if map == "watchdogs_1_night" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment", true)
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if map == "ukrainian_job" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/cloudy_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment", true)
	end

	end)
end
	
Hooks:Add("BeardLibCreateScriptDataMods", "RestorationCallBeardLibSequenceFuncs", function()


--Green Harvest	
	if map == "greenharvest_stage1" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_stage1.custom_xml", "custom_xml", "levels/narratives/h_firestarter/stage_3/world/world", "continent", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_bdrop.custom_xml", "custom_xml", "levels/narratives/h_firestarter/stage_3/pc_only/pc_only", "continent", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_stage1.generic_xml", "generic_xml", "levels/narratives/h_firestarter/stage_3/world/world", "mission", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/greenharvest_worlddef.custom_xml", "custom_xml", "levels/narratives/h_firestarter/stage_3/world", "world", true)
	end
	if map == "escape_garage_ghrv" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_garage_ghrv.generic_xml", "generic_xml", "levels/narratives/escapes/escape_garage/world/world", "mission", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_garage_ghrv.custom_xml", "custom_xml", "levels/narratives/escapes/escape_garage/world/world", "continent", true)
	end
	if map == "escape_overpass_ghrv" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_overpass_ghrv.generic_xml", "generic_xml", "levels/narratives/escapes/escape_overpass/world/world", "mission", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment", true)
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/greenharvest/escape_overpass_ghrv.custom_xml", "custom_xml", "levels/narratives/escapes/escape_overpass/world/world", "continent", true)
	end
	
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/safehouse/safehouse_w.custom_xml", "custom_xml", "levels/narratives/safehouse/world/world", "continent", true)
end)


--Environment skies loader
	
	Hooks:Add("BeardLibPreProcessScriptData", "RestorationCreateEnvironment", function(PackManager, path, raw_data)
    if managers.dyn_resource then
        local skies = {
            "sky_1930_twillight",
            "sky_1846_low_sun_nice_clouds",
            "sky_0902_overcast",
			"sky_0200_night_moon_stars"
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
	BeardLib.ScriptData.Continent:CreateMod({
            ID = "BranchBankFix",
            file = "levels/narratives/h_firestarter/stage_3/world/world"
        })

        BeardLib.ScriptData.Continent:AddUnit("BranchBankFix", {
            path = "units/dev_tools/level_tools/shadow_caster_5x5",
            name = "test_unit",
            position = Vector3(-2936.95, 1200.98, 205.935),
            rotation = Rotation(0, 90, 0),
            unit_id = 66676
        })
		