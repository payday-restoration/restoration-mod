--THIS MUST ALWAYS HOOK TO core/lib/managers/coresequencemanager
--local map = Global.level_data.level_id

local rnd = math.random (3)
local rnd2 = math.random (2)
local rnd3 = math.random (4)
local rnd4 = math.random (5)
local mod_path = tostring(restoration._mod_path or "mods/restoration-mod-gold")

if restoration.Options:GetValue("OTHER/TimeOfDay") then

	--Time of Day Loader

	Hooks:Add("BeardLibCreateScriptDataMods", "TODCallBeardLibSequenceFuncs", function()
		if not Global.load_level then 
			return
		end
		local level_id = Global.game_settings.level_id
		
		local level_setting
		if level_id == "branchbank" then 
			setting = restoration:get_env_setting("OTHER/Env_Banks")
			if setting == 1 then
				return
			elseif setting == 2 then	--random setting
				if rnd3 == 1 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				elseif rnd3 == 2 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				elseif rnd3 == 3 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				elseif rnd3 == 4 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				end
			elseif setting == 3 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			elseif setting == 4 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			elseif setting == 5 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			elseif setting == 6 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			end
		elseif level_id == "rvd1" then
			setting = restoration:get_env_setting("OTHER/Env_RVD1")
			if setting == 1 then
				return
			elseif setting == 2 then
				if rnd == 1 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
				elseif rnd == 2 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
				end	
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt1.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
			elseif setting == 4 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_exterior", "environment")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd1_alt2.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day1_inside", "environment")
			end
		elseif level_id == "rvd2" then 
			setting = restoration.Options:GetValue("OTHER/Env_RVD2")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd2 == 1 then	    
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_exterior", "environment")
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_inside", "environment")
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_exterior", "environment")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rvd2_alt.custom_xml", "custom_xml", "units/pd2_dlc_rvd/environments/pd2_env_rvd/pd2_env_rvd_day2_inside", "environment")
			end
		elseif level_id == "firestarter_1" then 
			setting = restoration:get_env_setting("OTHER/Env_FSD1")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd == 1 or rnd == 2 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
				end
			elseif setting == 3 then 			
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			end
		elseif level_id == "pbr2" then 
			setting = restoration:get_env_setting("OTHER/Env_PBR2") 
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd2 == 1 then	    
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry/pd2_env_jry", "environment")
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry_interior_01/pd2_env_jry_interior_01", "environment")
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry/pd2_env_jry", "environment")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bos_alt.custom_xml", "custom_xml", "environments/pd2_env_jry_interior_01/pd2_env_jry_interior_01", "environment")
			end
		elseif level_id == "crojob2" then 
			setting = restoration:get_env_setting("OTHER/Env_CJ2")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd2 == 1 then	    
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_sunset/pd2_env_sunset", "environment")
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_hox1_02/pd2_env_hox1_02", "environment")
					--need the inside env here
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_sunset/pd2_env_sunset", "environment")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dockyard_alt.custom_xml", "custom_xml", "environments/pd2_env_hox1_02/pd2_env_hox1_02", "environment")
				--need the inside env here
			end
		elseif level_id == "arm_und" then 
			setting = restoration:get_env_setting("OTHER/Env_UnderPass")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd2 == 1 then	    
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/underpass_foggyday.custom_xml", "custom_xml", "environments/pd2_env_foggy_bright/pd2_env_foggy_bright", "environment")
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/underpass_foggyday.custom_xml", "custom_xml", "environments/pd2_env_foggy_bright/pd2_env_foggy_bright", "environment")
			end
		elseif level_id == "mallcrasher" then 
			setting = restoration:get_env_setting("OTHER/Env_MallCrasher")
			if setting == 1 then 
				return
			elseif setting == 2 then 
			if rnd2 == 1 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/mall_alt.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/mall_alt.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			end
		elseif level_id == "mia_1" then
			setting = restoration:get_env_setting("OTHER/Env_Mia_1")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd3 == 1 or rnd3 == 2  or rnd3 == 3 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/hlm_morn.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
				end
			elseif setting == 3 then 
				if rnd3 == 4 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/funny_and_epic_synthwave_very_eighties.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
				end
			elseif setting == 4 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/funny_and_epic_synthwave_very_eighties.custom_xml", "custom_xml", "environments/pd2_hlm1/pd2_hlm1", "environment")
			end
		elseif level_id == "firestarter_3" then 
			setting = restoration:get_env_setting("OTHER/Env_FSD3")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/env_trailer_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			end
		elseif level_id == "watchdogs_1_night" then 
			setting = restoration:get_env_setting("OTHER/Env_WDD1N")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			elseif setting == 3 then 
			end
		elseif level_id == "bronze" then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bronze.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		elseif level_id == "watchdogs_2_day" then 
			setting = restoration:get_env_setting("OTHER/Env_WDD2D")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd == 1 or rnd == 2 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_wd2_evening/pd2_env_wd2_evening", "environment")
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_wd2_evening/pd2_env_wd2_evening", "environment")
			end
		elseif level_id == "alex_3" then 
			setting = restoration:get_env_setting("OTHER/Env_Alex3")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd == 1 or rnd == 2 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/docks.custom_xml", "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
			end
		elseif level_id == "big" then 
			setting = restoration:get_env_setting("OTHER/Env_Big")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd2 == 1 then	    
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_bigbank/pd2_env_bigbank", "environment")
				end
			elseif setting == 3 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_bigbank/pd2_env_bigbank", "environment")
			end
		elseif level_id == "four_stores" then 
			setting = restoration:get_env_setting("OTHER/Env_FS")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				if rnd3 == 1 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				elseif rnd3 == 2 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				elseif rnd3 == 3 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				elseif rnd3 == 4 then
					BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bank_green.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
				end
			elseif setting == 3 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/mellowday.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			elseif setting == 4 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/xbox_bank.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			elseif setting == 5 then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bank_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			elseif setting == 6 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/bank_green.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			end
		elseif level_id == "ukrainian_job" then 
			setting = restoration:get_env_setting("OTHER/Env_Ukra")
			if setting == 1 then 
				return
			elseif setting == 2 then 
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/cloudy_day.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			end
		-- elseif level_id == "kosugi" then 
			-- setting = restoration:get_env_setting("OTHER/Env_Kosugi")
			-- if setting == 1 then
			-- 	return
			-- elseif setting == 2 then	--random setting
			-- 	math.random( 3 , #setting )
			-- elseif setting == 3 then
			-- 	BeardLib:ReplaceScriptData(mod_path .. "scriptdata/shadowraid_darker.custom_xml", "custom_xml", "environments/pd2_kosugi/pd2_kosugi", "environment")
			-- elseif setting == 4 then
			-- 	BeardLib:ReplaceScriptData(mod_path .. "scriptdata/shadowraid_day.custom_xml", "custom_xml", "environments/pd2_kosugi/pd2_kosugi", "environment")
			-- end
		elseif level_id == "cult_murky" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/cult_stage1.custom_xml", "custom_xml", "core/environments/default", "environment")
		end
	end)
end

--SC Level Edits
Hooks:Add("BeardLibCreateScriptDataMods", "SCLECallBeardLibSequenceFuncs", function()
	if Global.load_level == true then 
		local level_id = Global.game_settings.level_id
		if level_id == "ukrainian_job_res" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/uk_job_new.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		elseif level_id == "family_res" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/family.custom_xml", "custom_xml", "environments/pd2_env_jew_street/pd2_env_jew_street", "environment")
		elseif level_id == "watchdogs_1_res" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/brightnight.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
			--"sky_orientation/rotation":"278.53564453125",
		elseif level_id == "firestarter_2_res" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/firestarter2.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			--"sky_orientation/rotation":"278.53564453125",
		elseif level_id == "firestarter_1_res" then 
			--if rnd == 1 or rnd == 2 then
			--BeardLib:ReplaceScriptData(mod_path .. "scriptdata/firestarter1.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			--if rnd == 3 then
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/fsd1_eve.custom_xml", "custom_xml", "environments/pd2_env_night/pd2_env_night", "environment")
			--"sky_orientation/rotation":"278.53564453125",
				--end
			--end
		elseif level_id == "alex_1_res" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rat1.custom_xml", "custom_xml", "environments/pd2_env_rat_night/pd2_env_rat_night", "environment")
			--"sky_orientation/rotation":"278.53564453125",
		elseif level_id == "alex_3_res" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/rat3.custom_xml", "custom_xml", "environments/pd2_env_rat_night_stage_3/pd2_env_rat_night_stage_3", "environment")
			--"sky_orientation/rotation":"278.53564453125",
		elseif level_id == "safehouse" then --Safehouse Booster
			if SystemFS:exists(mod_path .. "scriptdata/missions/safehouse.mission") and SystemFS:exists(mod_path .. "scriptdata/missions/safehouse.continent") then
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/missions/safehouse.mission", "generic_xml", "levels/narratives/safehouse/world/world", "mission")
				BeardLib:ReplaceScriptData(mod_path .. "scriptdata/missions/safehouse.continent", "custom_xml", "levels/narratives/safehouse/world/world", "continent")
			end
		elseif level_id == "kosugi" then 
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/shadowraid_darker.custom_xml", "custom_xml", "environments/pd2_kosugi/pd2_kosugi", "environment")
		end
	end
end)

--Restoration Levels
Hooks:Add("BeardLibCreateScriptDataMods", "RESMapsCallBeardLibSequenceFuncs", function()
	if Global.load_level == true then 
		if Global.game_settings.level_id == "jackal_surface_tension" then
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/platinum.custom_xml", "custom_xml", "core/environments/default", "environment")
		end
		
		if Global.game_settings.level_id == "firestarter_3_res" then
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/dawnorange_grnhrv.custom_xml", "custom_xml", "environments/pd2_env_mid_day/pd2_env_mid_day", "environment")
		end			
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
			"sky_1345_clear_sky",
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
		if SystemFS:exists(mod_path .. "scriptdata/paint.custom_xml") then
			BeardLib:ReplaceScriptData(mod_path .. "scriptdata/paint.custom_xml", "custom_xml", "units/payday2/architecture/com_int_gallery/com_int_gallery_wall_painting_bars", "sequence_manager", true)
		end
	end)
end

--Blue Sapphire FIX
--OVK never finished the opening animation, and it was wrongly calling for to activate the diamond (probably leftover from PD:TH), thus this fix
--probably update instances in heists where I want them to open with the PD:TH one raw
Hooks:Add("BeardLibCreateScriptDataMods", "DiamondFixCallBeardLibSequenceFuncs", function()
	if SystemFS:exists(mod_path .. "scriptdata/diamondFIX.custom_xml") then
		BeardLib:ReplaceScriptData(mod_path .. "scriptdata/diamondFIX.custom_xml", "custom_xml", "units/pd2_dlc_dah/props/dah_props_diamond_stands/dah_prop_diamond_stand_01", "sequence_manager", true)
	end
end)
