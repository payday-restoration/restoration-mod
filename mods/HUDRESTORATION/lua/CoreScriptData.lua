--THIS MUST ALWAYS HOOK TO core/lib/managers/coresequencemanager
--local map = Global.level_data.level_id
local rnd = math.random (3)
local rnd2 = math.random (2)

--Time of Day Loader
if restoration.Options:GetValue("OTHER/TimeOfDay") then
Hooks:Add("BeardLibCreateScriptDataMods", "TODCallBeardLibSequenceFuncs", function()


	if Global.load_level == true and Global.game_settings.level_id == "watchdogs_1" then
	if rnd == 1 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/dawnorange.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	elseif rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "branchbank" then
	if rnd == 1 or rnd == 2 then
	BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "watchdogs_1_night" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "bronze" then
	
	BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/bronze.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	
	end
	if Global.load_level == true and Global.game_settings.level_id == "watchdogs_2_day" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_wd2_evening/pd2_env_wd2_evening", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "alex_3" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "four_stores" then
	if rnd == 1 or rnd == 2 then
	BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "ukrainian_job" then
		BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/cloudy_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end

	
	end)
end


--Environment skies loader
	
	Hooks:Add("BeardLibPreProcessScriptData", "RestorationCreateEnvironment", function(PackManager, path, raw_data)
    if managers.dyn_resource then
        local skies = {
            "sky_1930_twillight",
            "sky_1846_low_sun_nice_clouds",
            "sky_0902_overcast",
			"sky_0200_night_moon_stars",
			"sky_2000_twilight_mad",
			"sky_2100_moon",
			"sky_1008_cloudy"
			
        }
        for _, sky in ipairs(skies) do
            if not managers.dyn_resource:has_resource(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
                RestorationCore.log_shit("not loaded")
                managers.dyn_resource:load(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
            end
        end
    end
end)
	
--Paintings
if restoration.Options:GetValue("OTHER/Paintings") then	
Hooks:Add("BeardLibCreateScriptDataMods", "MorePaintingsCallBeardLibSequenceFuncs", function()
BeardLib:ReplaceScriptData("mods/HUDRESTORATION/scriptdata/paint.custom_xml", "custom_xml", "units/payday2/architecture/com_int_gallery/com_int_gallery_wall_painting_bars", "sequence_manager", true)
end)
end

