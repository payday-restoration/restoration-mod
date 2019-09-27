--THIS MUST ALWAYS HOOK TO core/lib/managers/coresequencemanager
--local map = Global.level_data.level_id
local rnd = math.random (3)
local rnd2 = math.random (2)
local rnd3 = math.random (4)
local rnd4 = math.random (5)

--Time of Day Loader
if restoration.Options:GetValue("OTHER/TimeOfDay") then
Hooks:Add("BeardLibCreateScriptDataMods", "TODCallBeardLibSequenceFuncs", function()


	
	if Global.load_level == true and Global.game_settings.level_id == "branchbank" then
	if rnd4 == 1 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd4 == 2 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd4 == 3 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd4 == 4 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bank_green.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bank_green.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd4 == 5 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	end	
	--"sky_orientation/rotation":"-116.40824890137",
	
	if Global.load_level == true and Global.game_settings.level_id == "rvd1" then
	if rnd == 1 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
	end
	if rnd == 2 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "rvd2" then
	if rnd2 == 1 then	    
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_exterior", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_exterior", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_inside", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_inside", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end		
	
	if Global.load_level == true and Global.game_settings.level_id == "firestarter_1" then
	if rnd == 1 or rnd == 2 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end		
	
	if Global.load_level == true and Global.game_settings.level_id == "pbr2" then
	if rnd2 == 1 then	    
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry/pd2_env_jry", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry/pd2_env_jry", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry_interior_01/pd2_env_jry_interior_01", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry_interior_01/pd2_env_jry_interior_01", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end		
	
	if Global.load_level == true and Global.game_settings.level_id == "crojob2" then
	if rnd2 == 1 then	    
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_sunset/pd2_env_sunset", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_sunset/pd2_env_sunset", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_hox1_02/pd2_env_hox1_02", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_hox1_02/pd2_env_hox1_02", "environment")
		--need the inside env here
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "arm_und" then
	if rnd2 == 1 then	    
	BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/underpass_foggyday.custom_xml", "custom_xml", "environments/pd2_env_foggy_bright/pd2_env_foggy_bright", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/underpass_foggyday.custom_xml", "custom_xml", "environments/pd2_env_foggy_bright/pd2_env_foggy_bright", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end	
	
	if Global.load_level == true and Global.game_settings.level_id == "mallcrasher" then
	if rnd2 == 1 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/mall_alt.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/mall_alt.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "mia_1" then
	if rnd3 == 1 or rnd3 == 2  or rnd3 == 3 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/hlm_morn.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/hlm_morn.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	if rnd3 == 4 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/funny_and_epic_synthwave_very_eighties.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/funny_and_epic_synthwave_very_eighties.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "firestarter_3" then
	
	BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "watchdogs_1_night" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end

	
	if Global.load_level == true and Global.game_settings.level_id == "bronze" then
	
	BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bronze.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bronze.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	
	end	
	if Global.load_level == true and Global.game_settings.level_id == "firestarter_3" then
	
	BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	--"sky_orientation/rotation":"-116.40824890137",
	
	end
	if Global.load_level == true and Global.game_settings.level_id == "watchdogs_2_day" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_wd2_evening/pd2_env_wd2_evening", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_wd2_evening/pd2_env_wd2_evening", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "alex_3" then
	if rnd == 1 or rnd == 2 then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "big" then
	if rnd2 == 1 then	    
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_bigbank/pd2_env_bigbank", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_bigbank/pd2_env_bigbank", "environment")
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "four_stores" then
	if rnd3 == 1 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd3 == 2 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd3 == 3 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	if rnd3 == 4 then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/bank_green.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/bank_green.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "ukrainian_job" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/cloudy_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/cloudy_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end

	if Global.load_level == true and Global.game_settings.level_id == "cult_murky" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/cult_stage1.custom_xml", "custom_xml", "core/environments/default", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/cult_stage1.custom_xml", "custom_xml", "core/environments/default", "environment")
	end
	
	end)
end
--SC Level Edits
 if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
Hooks:Add("BeardLibCreateScriptDataMods", "SCLECallBeardLibSequenceFuncs", function()

	if Global.load_level == true and Global.game_settings.level_id == "ukrainian_job_res" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/uk_job_new.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/uk_job_new.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "family_res" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/family.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/family.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "watchdogs_1_res" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "firestarter_2_res" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/firestarter2.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/firestarter2.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		--"sky_orientation/rotation":"278.53564453125",
	end
	
		if Global.load_level == true and Global.game_settings.level_id == "firestarter_1_res" then
				--if rnd == 1 or rnd == 2 then
			--BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/firestarter1.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			--BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/firestarter1.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			--if rnd == 3 then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
		--"sky_orientation/rotation":"278.53564453125",
			--end
		--end
	end
	
	--Safehouse Booster
	if Global.load_level == true and Global.game_settings.level_id == "safehouse" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/missions/safehouse.mission", "generic_xml", "levels/narratives/safehouse/world/world", "mission")
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/missions/safehouse.continent", "custom_xml", "levels/narratives/safehouse/world/world", "continent")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/missions/safehouse.mission", "generic_xml", "levels/narratives/safehouse/world/world", "mission")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/missions/safehouse.continent", "custom_xml", "levels/narratives/safehouse/world/world", "continent")
	end
end)
end

--Restoration Levels
Hooks:Add("BeardLibCreateScriptDataMods", "RESMapsCallBeardLibSequenceFuncs", function()

	if Global.load_level == true and Global.game_settings.level_id == "jackal_surface_tension" then
		BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/platinum.custom_xml", "custom_xml", "core/environments/default", "environment")
		BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/platinum.custom_xml", "custom_xml", "core/environments/default", "environment")
	end
	
	if Global.load_level == true and Global.game_settings.level_id == "firestarter_3_res" then
	    BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	    BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
	end	
end)


--Environment skies loader
	
	Hooks:Add("BeardLibPreProcessScriptData", "RestorationCreateEnvironment", function(PackManager, path, raw_data)
    if managers.dyn_resource then
        local skies = {
            "sky_1930_twillight",
			"sky_1930_sunset_heavy_clouds",
            "sky_1846_low_sun_nice_clouds",
            "sky_0902_overcast",
			"sky_0200_night_moon_stars",
			"sky_2000_twilight_mad",
			"sky_2100_moon",
			"sky_1008_cloudy",
			"sky_0927_whispy_clouds",
			"sky_2335_night_moon",
			"sky_2100_moon",
			"sky_1313_cloudy_dark"
			
        }
        for _, sky in ipairs(skies) do
            if not managers.dyn_resource:has_resource(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
                restoration.log_shit("not loaded")
                managers.dyn_resource:load(Idstring("scene"), Idstring("core/environments/skies/" .. sky .. "/" .. sky), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
            end
        end
    end
end)
	
--Paintings
if restoration.Options:GetValue("OTHER/Paintings") then	
Hooks:Add("BeardLibCreateScriptDataMods", "MorePaintingsCallBeardLibSequenceFuncs", function()
BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/paint.custom_xml", "custom_xml", "units/payday2/architecture/com_int_gallery/com_int_gallery_wall_painting_bars", "sequence_manager", true)
BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/paint.custom_xml", "custom_xml", "units/payday2/architecture/com_int_gallery/com_int_gallery_wall_painting_bars", "sequence_manager", true)
end)
end

--Blue Sapphire FIX
--OVK never finished the opening animation, and it was wrongly calling for to activate the diamond (probably leftover from PD:TH), thus this fix
--probably update instances in heists where I want them to open with the PD:TH one raw
Hooks:Add("BeardLibCreateScriptDataMods", "DiamondFixCallBeardLibSequenceFuncs", function()
BeardLib:ReplaceScriptData("mods/restoration-mod-gold/scriptdata/diamondFIX.custom_xml", "custom_xml", "units/pd2_dlc_dah/props/dah_props_diamond_stands/dah_prop_diamond_stand_01", "sequence_manager", true)
BeardLib:ReplaceScriptData("mods/restoration-mod-dev/scriptdata/diamondFIX.custom_xml", "custom_xml", "units/pd2_dlc_dah/props/dah_props_diamond_stands/dah_prop_diamond_stand_01", "sequence_manager", true)
end)
