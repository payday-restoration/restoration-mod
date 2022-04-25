-- ResMod english.json
Hooks:Add("LocalizationManagerPostInit", "ResMod_english_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_es_boost"] = "Boost",
		["menu_es_crew"] = "Crew",
		["menu_es_personal"] = "Personal",
		["menu_es_bad"] = "Bad",
		["menu_es_other"] = "Other",
		["RestorationPDTHHudNeeded"] = "PD:TH HUD REBORN IS REQUIRED!",
		["menu_paygrade"] = "Pay grade: ",
		["menu_diffgrade"] = "Difficulty: ",
		["menu_utility_radial_menu_name"] = "Utility Radial Menu",
		["menu_utility_radial_menu_desc"] = "Open the Utility Menu",

		["res_credits"] = "Restoration Mod Credits",
		["res_credits_help"] = "View the credits for RESTORATION MOD.",

		["Warning_overhaul_title"] = "WARNING: Game closing to prevent save corruption.",
		["dialog_show_overhaul_dialog"] = "You are DISABLING the Complete Overhaul. It is typically NOT RECOMMENDED to do this, and you should instead REMOVE the mod from your mods folder if you intend not to use the Overhaul actively.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",
		["dialog_enable_overhaul_dialog"] = "You are ENABLING the Complete Overhaul. The Overhaul should typically remain ON at all times, and only be disabled by removing the mod from your mods folder.\n\nYour game will close automatically in $TIME seconds, or when you press OK.",

		["res_saveboost"] = "HOLD $BTN_INTERACT TO BOOST TO LEVEL 100",

		["RestorationModOptionsButtonTitleID"] = "Restoration Mod Options",
		["RestorationModOptionsButtonDescID"] = "Restoration Mod's Options.",
		["RestorationModHUDOptionsButtonTitleID"] = "Restoration HUD & UI Options",
		["RestorationModHUDOptionsButtonDescID"] = "Restoration's HUD & UI Options.",
		["RestorationModOTHEROptionsButtonTitleID"] = "Extra Restoration Mod Options",
		["RestorationModOTHEROptionsButtonDescID"] = "Extra Restoration Mod options.",
		["RestorationModUIOptionsButtonTitleID"] = "Alpha UI",
		["RestorationModUIOptionsButtonDescID"] = "Alpha UI options.",
		["RestorationModTimeOfDayTitleID"] = "New + Randomized Time-of-days",
		["RestorationModTimeOfDayDescID"] = "Allows you to customize the time-of-day on certain heists.",

		["restoration_level_data_unknown"] = "TIME UNKNOWN, LOCATION UNKNOWN",
		["RestorationModEnv_BanksTitleID"] = "Branch Bank",
		["RestorationModEnv_BanksDescID"] = "Select an environment for Branch Bank.",
		["RestorationModEnv_RVD1TitleID"] = "Reservoir Dogs Day 1",
		["RestorationModEnv_RVD1DescID"] = "Select an environment for  Reservoir Dogs Day 1.",
		["RestorationModEnv_RVD2TitleID"] = "Reservoir Dogs Day 2",
		["RestorationModEnv_RVD2DescID"] = "Select an environment for  Reservoir Dogs Day 2.",
		["RestorationModEnv_FSD1TitleID"] = "Firestarter Day 1",
		["RestorationModEnv_FSD1DescID"] = "Select an environment for Firestarter Day 1.",
		["RestorationModEnv_PBR2TitleID"] = "Birth of Sky",
		["RestorationModEnv_PBR2DescID"] = "Select an environment for Birth of Sky.",
		["RestorationModEnv_CJ2TitleID"] = "The Bomb: Dockyard",
		["RestorationModEnv_CJ2DescID"] = "Select an environment for The Bomb: Dockyard.",
		["RestorationModEnv_UnderPassTitleID"] = "Transport Underpass",
		["RestorationModEnv_UnderPassDescID"] = "Select an environment for Transport Underpass.",
		["RestorationModEnv_MallCrasherTitleID"] = "Mallcrasher",
		["RestorationModEnv_MallCrasherDescID"] = "Select an environment for Mallcrasher.",
		["RestorationModEnv_Mia_1TitleID"] = "Hotline Miami Day 1",
		["RestorationModEnv_Mia_1DescID"] = "Select an environment for Hotline Miami Day 1.",
		["RestorationModEnv_FSD3TitleID"] = "Firestarter Day 3",
		["RestorationModEnv_FSD3DescID"] = "Select an environment for Firestarter Day 3.",
		["RestorationModEnv_WDD1NTitleID"] = "Watchdogs Day 1 (Night)",
		["RestorationModEnv_WDD1NDescID"] = "Select an environment for Watchdogs Day 1 (Night).",
		["RestorationModEnv_WDD1DTitleID"] = "Watchdogs Day 1 (Day)",
		["RestorationModEnv_WDD1DDescID"] = "Select an environment for Watchdogs Day 1 (Day).",
		["RestorationModEnv_WDD2DTitleID"] = "Watchdogs Day 2 (Day)",
		["RestorationModEnv_WDD2DDescID"] = "Select an environment for Watchdogs Day 2 (Day).",
		["RestorationModEnv_Alex3TitleID"] = "Rats Day 3",
		["RestorationModEnv_Alex3DescID"] = "Select an environment for Rats Day 3.",
		["RestorationModEnv_BigTitleID"] = "Big Bank",
		["RestorationModEnv_BigDescID"] = "Select an environment for Big Bank.",
		["RestorationModEnv_FSTitleID"] = "Four Stores",
		["RestorationModEnv_FSDescID"] = "Select an environment for Four Stores.",
		["RestorationModEnv_UkraTitleID"] = "Ukrainian Job",
		["RestorationModEnv_UkraDescID"] = "Select an environment for Ukrainian Job.",
		["RestorationModEnv_KosugiTitleID"] = "Shadow Raid",
		["RestorationModEnv_KosugiDescID"] = "Select an environment for Shadow Raid Job.",
		["RestorationModEnv_PetaTitleID"] = "Goat Simulator Day 1",
		["RestorationModEnv_PetaDescID"] = "Select an environment for Goat Simulator Day 1.",
		["RestorationModEnv_FRIENDTitleID"] = "Scarface Mansion",
		["RestorationModEnv_FRIENDDescID"] = "Select an environment for Scarface Mansion.",
		["RestorationModINFOHUDOptionsButtonTitleID"] = "Buff Tracker",
		["RestorationModINFOHUDOptionsButtonDescID"] = "Displays icons to reflect information about active skills on the left side of the screen. Does not require Alpha UI to be enabled.",
		["RestorationModInfo_HudTitleID"] = "Enable Buff Tracker",
		["RestorationModInfo_HudDescID"] = "Enables or disables the entire buff tracking UI.",
		["RestorationModInfo_SizeTitleID"] = "Icon Size",
		["RestorationModInfo_SizeDescID"] = "Controls the size of icons on the buff tracker.",
		["RestorationModInfo_CountTitleID"] = "Row Count",
		["RestorationModInfo_CountDescID"] = "Controls the number of rows the buff tracker displays before adding a new column.",
		["RestorationModInfo_single_shot_fast_reloadTitleID"] = "Aggressive Reload",
		["RestorationModInfo_single_shot_fast_reloadDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_ammo_efficiencyTitleID"] = "Ammo Efficiency",
		["RestorationModInfo_ammo_efficiencyDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_bloodthirst_reload_speedTitleID"] = "Bloodthirst",
		["RestorationModInfo_bloodthirst_reload_speedDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_bullet_stormTitleID"] = "Bullet Storm",
		["RestorationModInfo_bullet_stormDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_revive_damage_reductionTitleID"] = "Combat Medic",
		["RestorationModInfo_revive_damage_reductionDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_desperadoTitleID"] = "Desperado",
		["RestorationModInfo_desperadoDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_grinderTitleID"] = "Histamine (Grinder)",
		["RestorationModInfo_grinderDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_infiltratorTitleID"] = "Life Drain (Infiltrator)",
		["RestorationModInfo_infiltratorDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_long_dis_reviveTitleID"] = "Inspire",
		["RestorationModInfo_long_dis_reviveDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_messiahTitleID"] = "Messiah",
		["RestorationModInfo_messiahDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_overkill_damage_multiplierTitleID"] = "Overkill",
		["RestorationModInfo_overkill_damage_multiplierDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_revived_damage_reductionTitleID"] = "Painkillers",
		["RestorationModInfo_revived_damage_reductionDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_first_aid_damage_reductionTitleID"] = "Quick Fix",
		["RestorationModInfo_first_aid_damage_reductionDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_rogueTitleID"] = "Killer Instinct (Rogue)",
		["RestorationModInfo_rogueDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_increased_movement_speedTitleID"] = "Running From Death",
		["RestorationModInfo_increased_movement_speedDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_headshot_fire_rate_multTitleID"] = "Sharpshooter",
		["RestorationModInfo_headshot_fire_rate_multDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_trigger_happyTitleID"] = "Trigger Happy",
		["RestorationModInfo_trigger_happyDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_dmg_multiplier_outnumberedTitleID"] = "Underdog",
		["RestorationModInfo_dmg_multiplier_outnumberedDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_unseen_strikeTitleID"] = "Unseen Strike",
		["RestorationModInfo_unseen_strikeDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_survive_one_hitTitleID"] = "Oni Irezumi (Yakuza)",
		["RestorationModInfo_survive_one_hitDescID"] = "Enables or disables tracking of this specific skill.",
		["RestorationModInfo_doctor_bag_health_regenTitleID"] = "Doctor Bag Health Regen",
		["RestorationModInfo_doctor_bag_health_regenDescID"] = "Enables or disables tracking of doctor bag health regen.",
		["RestorationModAltLastDownColorTitleID"] = "Alternative Last Down Color Grading",
		["RestorationModAltLastDownColorDescID"] = "Switches the last down color grading to color_sin_classic.",
		["RestorationModNoBleedoutTiltTitleID"] = "Disable Bleedout Camera Tilt",
		["RestorationModNoBleedoutTiltDescID"] = "Disables the camera tilt that happens while in bleedout.",
		["RestorationModClassicMoviesTitleID"] = "Classic Loadout Backgrounds",
		["RestorationModClassicMoviesDescID"] = "Enable or disable PD:TH loadout backgrounds when playing on Classic heists.",

		["default"] = "Default",
		["random"] = "Random",
		["mellowday"] = "Mellow Day",
		["xbox_bank"] = "E3 2013",
		["bank_day"] = "Improved Default",
		["env_trailer_bank"] = "Trailer Bank",
		["rvd1_alt1"] = "Nightlife",
		["rvd1_alt2"] = "Pink Smog",
		["rvd2_alt"] = "Overcast",
		["fsd1_eve"] = "Evening",
		["bos_alt"] = "Pink Skies",
		["dockyard_alt"] = "Night Shift",
		["underpass_foggyday"] = "Foggy Day",
		["mall_alt"] = "Afternoon Shopping",
		["hlm_morn"] = "Morning Call",
		["funny_and_epic_synthwave_very_eighties"] = "Retro",
		["brightnight"] = "Bright Night",
		["docks"] = "Docks",
		["bank_green"] = "Beta Green",
		["cloudy_day"] = "Cloudy Day",
		["shadowraid_day"] = "Shadow Raid Daytime",
		["shadowraiud_darker"] = "Shadow Raid Darker",
		["friend_pink"] = "Pink Sunset",
		["friend_night"] = "Miami Night",
		["off"] = "Off",
		["windowofoppurtunity"] = "Window Of Opportunity",
		["wheresthevan"] = "Where's The Van",
		["menu_jukebox_heist_ponr"] = "Point Of No Return",
		["RestorationModPaintingsTitleID"] = "Unused Art Gallery Paintings",
		["RestorationModPaintingsDescID"] = "Enable or disable the ability for unused paintings to spawn on Art Gallery. As host only.",
		["RestorationModMainHUDTitleID"] = "Alpha HUD ON/OFF",
		["RestorationModMainHUDDescID"] = "Enable or disable the alpha HUD entirely.",
		["RestorationModWaypointsTitleID"] = "Alpha Waypoints",
		["RestorationModWaypointsDescID"] = "Enable or disable Alpha Waypoints.",
		["RestorationModAssaultPanelTitleID"] = "Alpha Assault Tape",
		["RestorationModAssaultPanelDescID"] = "Enable or disable the Alpha Assault Tape.",
		["RestorationModAltAssaultTitleID"] = "Early Alpha Assault Indicator",
		["RestorationModAltAssaultDescID"] = "Enable or disable the Early Alpha Assault Indicator. Replaces tape.",
		["RestorationModObjectivesPanelTitleID"] = "Alpha Objectives Panel",
		["RestorationModObjectivesPanelDescID"] = "Enable or disable the Alpha Objectives Panel.",
		["RestorationModPresenterTitleID"] = "Alpha Presenter",
		["RestorationModPresenterDescID"] = "Enable or disable the Alpha Presenter, which is used for loot secure and objective reminder dialogue.",
		["RestorationModInteractionTitleID"] = "Alpha Interaction Meter",
		["RestorationModInteractionDescID"] = "Enable or disable the Alpha Interaction meter.",
		["RestorationModStealthTitleID"] = "Alpha Stealth Meter",
		["RestorationModStealthDescID"] = "Enable or disable the Alpha Stealth meter.",
		["RestorationModDownTitleID"] = "Alpha Downed Timer",
		["RestorationModDownDescID"] = "Enable or disable the Alpha Downed timer.",
		["RestorationModBagTitleID"] = "Alpha Bag Panel",
		["RestorationModBagDescID"] = "Enable or disable the Alpha Bag panel.",
		["RestorationModHostageTitleID"] = "Hide Hostage Panel",
		["RestorationModHostageDescID"] = "If enabled, hides the hostage panel when an assault begins, if assault tape or early alpha indicator are on.",
		["RestorationModDifficultyMarkersTitleID"] = "Pre-Release Difficulty Markers",
		["RestorationModDifficultyMarkersDescID"] = "Enable or disable the Pre-Release Difficulty Markers.",
		["RestorationModStaminaIndicatorTitleID"] = "Debug Stamina Indicator",
		["RestorationModStaminaIndicatorDescID"] = "Enable or disable the Debug Stamina Indicator.",
		["RestorationModBlackScreenTitleID"] = "Restoration Blackscreen",
		["RestorationModBlackScreenDescID"] = "Enable or disable the Restoration Blackscreen.",
		["RestorationModLoadoutsTitleID"] = "Alpha Loadouts",
		["RestorationModLoadoutsDescID"] = "Enable or disable the Alpha Loadouts screen.",
		["RestorationModDistrictTitleID"] = "CRIME.NET District Descriptions",
		["RestorationModDistrictDescID"] = "Enable or disable district descriptions in CRIME.NET.  Not gameplay accurate.",
		["RestorationModSCOptionsButtonTitleID"] = "Restoration Overhaul Options",
		["RestorationModSCOptionsButtonDescID"] = "Restoration Overhaul Options",
		["RestorationModSCTitleID"] = "Complete Overhaul (DEBUG)",
		["RestorationModSCDescID"] = "Enable or disable Restoration's complete game overhaul. Toggling this option will automatically exit your game to prevent save corruption.",
		["RestorationModHolidayTitleID"] = "Holiday Effects",
		["RestorationModHolidayDescID"] = "Enable or disable Holiday effects for the overhaul.",
		["RestorationModRestoreHitFlashTitleID"] = "Restore Hit Flash",
		["RestorationModRestoreHitFlashDescID"] = "Enable or disable the restored hit flash when taking damage.",	
		["RestorationModNotifyTitleID"] = "Feature Notification",
		["RestorationModNotifyDescID"] = "Enable or disable the notification for this feature.",
		["RestorationModPauseTitleID"] = "Alpha Pause Menu",
		["RestorationModPauseDescID"] = "Enable or disable the Alpha Pause Menu.",

		["menu_support"] = "Overhaul Guide/Support",
		["menu_support_help"] = "View the guide for Restoration Mod's Overhaul, get support, find crew mates.",
		["menu_manual_header"] = "Placeholder Text",
		["hud_assault_alpha"] = "POLICE ASSAULT",
		["hud_loot_secured_title"] = "LOOT SECURED!",
		["debug_none"] = "OBJECTIVE",

		["restoration_level_data_welcome_to_the_jungle_1"] = "6:24 PM, 'Overkill MC' Bikers HQ",
		["restoration_level_data_welcome_to_the_jungle_1_night"] = "1:32 AM, 'Overkill MC' Bikers HQ",
		["restoration_level_data_welcome_to_the_jungle_2"] = "6:00 PM, Villa Vivaldi",
		["restoration_level_data_framing_frame_1"] = "11:30 PM, Capitol Art Gallery",
		["restoration_level_data_framing_frame_2"] = "12:30 PM, Abandoned Trainyard",
		["restoration_level_data_framing_frame_3"] = "2:20 AM, Highrise Apartments",
		["restoration_level_data_election_day_1"] = "12:37 PM, Pier 39",
		["restoration_level_data_election_day_2"] = "8:10 AM, Storage Warehouse",
		["restoration_level_data_election_day_3"] = "Hi! If you see this string during gameplay, report it to Restoration! Thank you!",
		["restoration_level_data_election_day_3_skip1"] = "4:25 PM, Capitol Savings Bank",
		["restoration_level_data_election_day_3_skip2"] = "3:25 PM, Capitol Savings Bank",
		["restoration_level_data_watchdogs_1"] = "4:10 PM, Meat Truck",
		["restoration_level_data_watchdogs_1_res"] = "9:10 PM, Meat Truck",
		["restoration_level_data_watchdogs_2"] = "12:25 AM, Almendia Dockyard",
		["restoration_level_data_watchdogs_2_res"] = "12:25 AM, Almendia Dockyard",
		["restoration_level_data_watchdogs_1_night"] = "11:10 PM, Meat Truck",
		["restoration_level_data_watchdogs_2_day"] = "6:05 PM, Almendia Dockyard",
		["restoration_level_data_watchdogs_3_res"] = "12:20 AM, Washington Justice Bridge",
		["restoration_level_data_alex_1"] = "3:30 AM, Quiet Hill",
		["restoration_level_data_alex_2"] = "5:55 AM, Projects",
		["restoration_level_data_alex_3"] = "7:20 AM, Washington Justice Bridge",
		["restoration_level_data_alex_1_res"] = "3:30 AM, Quiet Hill",
		["restoration_level_data_alex_2_res"] = "5:55 AM, Projects",
		["restoration_level_data_alex_3_res"] = "7:20 AM, Washington Justice Bridge",
		["restoration_level_data_firestarter_1"] = "9:25 AM, Private Airport",
		["restoration_level_data_firestarter_1_res"] = "9:25 AM, Private Airport",
		["restoration_level_data_firestarter_2"] = "10:05 AM, FBI Branch Office",
		["restoration_level_data_firestarter_2_res"] = "10:05 AM, FBI Branch Office",
		["restoration_level_data_firestarter_3"] = "12:15 PM, Harvest & Trustee Bank",
		["restoration_level_data_firestarter_3_res"] = "12:15 PM, Harvest & Trustee Bank",
		["restoration_level_data_ukrainian_job"] = "2:50 PM, Precious Things",
		["restoration_level_data_ukrainian_job_res"] = "2:50 PM, Precious Things",
		["restoration_level_data_jewelry_store"] = "2:50 PM, Precious Things",
		["restoration_level_data_four_stores"] = "1:20 PM, Storefronts",
		["restoration_level_data_mallcrasher"] = "12:50 PM, Shield Mall",
		["restoration_level_data_nightclub"] = "8:00 PM, The Tasteful Club",
		["restoration_level_data_branchbank"] = "12:15 PM, Harvest & Trustee Bank",
		["restoration_level_data_escape_cafe"] = "Escape!",
		["restoration_level_data_escape_park"] = "Escape!",
		["restoration_level_data_escape_cafe_day"] = "Escape!",
		["restoration_level_data_escape_park_day"] = "Escape!",
		["restoration_level_data_escape_street"] = "Escape!",
		["restoration_level_data_escape_overpass"] = "Escape!",
		["restoration_level_data_escape_garage"] = "Escape!",
		["restoration_level_data_escape_overpass_night"] = "Escape!",
		["restoration_level_data_safehouse"] = "12:00 PM, The Safehouse",
		["restoration_level_data_arm_fac"] = "9:30 AM, Harbour",
		["restoration_level_data_arm_par"] = "2:25 PM, Downtown District",
		["restoration_level_data_arm_hcm"] = "2:15 PM, Downtown District",
		["restoration_level_data_arm_cro"] = "12:55 PM, McCarthy and James Street Intersection",
		["restoration_level_data_arm_und"] = "8:15 PM, Underpass",
		["restoration_level_data_arm_for"] = "12:25 PM, Armadillo Train",
		["restoration_level_data_family"] = "11:25 AM, Gioelli di Famiglia",
		["restoration_level_data_family_res"] = "11:25 AM, Gioelli di Famiglia",
		["restoration_level_data_big"] = "2:15 PM, Benevolent Bank",
		["restoration_level_data_big_res"] = "2:15 PM, Benevolent Bank",
		["restoration_level_data_roberts"] = "8:47 AM, Robert's Bank of Savings & Trust",
		["restoration_level_data_roberts_v2"] = "8:47 AM, Robert's Bank of Savings & Trust",
		["restoration_level_data_mia_1"] = "9:30 PM, Commissar's Motel",
		["restoration_level_data_mia_2"] = "11:45 AM, Commissar's Apartment Complex",
		["restoration_level_data_mia2_new"] = "11:45 AM, Commissar's Apartment Complex",
		["restoration_level_data_kosugi"] = "4:00 AM, Terminal Warehouse",
		["restoration_level_data_gallery"] = "11:45 PM, Capitol Art Gallery",
		["restoration_level_data_hox_1"] = "10:30 AM, Underground Courthouse Pathway",
		["restoration_level_data_hox_2"] = "4:10 PM, J. Edgar Hoover Building",
		["restoration_level_data_pines"] = "5:52 PM, Deep in the Forest",
		["restoration_level_data_mus"] = "8:15 PM, McKendrick Museum of Ancient Art",
		["restoration_level_data_crojob2"] = "6:10 PM, Port of Washington",
		["restoration_level_data_crojob3"] = "3:35 PM, Forest Outskirts",
		["restoration_level_data_crojob3_night"] = "8:35 PM, Forest Outskirts",
		["restoration_level_data_cage"] = "7:55 PM, Teuer Automotives",
		["restoration_level_data_hox_3"] = "11:55 PM, FBI Safehouse",
		["restoration_level_data_rat"] = "7:55 AM, Quiet Hill",
		["restoration_level_data_shoutout_raid"] = "9:00 AM, Terminal Warehouse",
		["restoration_level_data_arena"] = "9:00 PM, GENSEC Arena",
		["restoration_level_data_kenaz"] = "8:00 PM, Las Vegas Strip - Golden Grin Casino",
		["restoration_level_data_jolly"] = "4:00 PM, Los Angeles - Disaster Zone",
		["restoration_level_data_red2"] = "2:15 PM, DOWNTOWN - FIRST WORLD BANK",
		["restoration_level_data_dinner"] = "8:01 AM, Slaughterhouse District - Ambush!",
		["restoration_level_data_nail"] = "0:00 PM, Quiet Hill",
		["restoration_level_data_haunted"] = "??:?? PM, The 'Safe' House",
		["restoration_level_data_pbr"] = "4:40 AM, Nevada - Black Ridge Facility",
		["restoration_level_data_pbr2"] = "TIME UNKNOWN, Z-170 'ZEUS' - Murkywater Cargo Plane",
		["restoration_level_data_cane"] = "3:15 PM, Santa's Workshop",
		["restoration_level_data_peta"] = "12:00 PM, Downtown District",
		["restoration_level_data_peta2"] = "5:43 PM, Wrecked barn",
		["restoration_level_data_man"] = "6:00 PM, The District - Abandoned Building",
		["restoration_level_data_pal"] = "12:00 PM, Suburbs - Bodhi's Pool Repair",
		["restoration_level_data_short1_stage1"] = "TIME UNKNOWN, LOCATION CLASSIFIED",
		["restoration_level_data_short1_stage2"] = "TIME UNKNOWN, LOCATION CLASSIFIED",
		["restoration_level_data_short2_stage1"] = "TIME UNKNOWN, LOCATION CLASSIFIED",
		["restoration_level_data_short2_stage2"] = "TIME UNKNOWN, LOCATION CLASSIFIED",
		["restoration_level_data_short2_stage2b"] = "TIME UNKNOWN, LOCATION CLASSIFIED",
		["restoration_level_data_dark"] = "2:21 AM, Hidden Trainyard",
		["restoration_level_data_mad"] = "TIME UNKNOWN, Somewhere Over Russia...",
		["restoration_level_data_born"] = "10:15 AM, OVERKILL MC Club & Bar",
		["restoration_level_data_chew"] = "5:25 PM, Outside D.C. - Moving Train!",
		["restoration_level_data_flat"] = "4:02 PM, Projects - Chavez's Crib",
		["restoration_level_data_chill"] = "1:00 PM, The Safehouse",
		["restoration_level_data_chill_combat"] = "1:00 PM, The Safehouse - Police Raid!",
		["restoration_level_data_help"] = "DON'T TOUCH THAT DIAL, WE'RE JUST GETTING STARTED",
		["restoration_level_data_friend"] = "4:30 PM, Miami - El Fureidis Mansion",
		["restoration_level_data_fish"] = "7:30 PM, Outside New York City - 'Lethe' Yacht",
		["restoration_level_data_spa"] = "7:00 PM, New York City - Ambush!",
		["restoration_level_data_moon"] = "11:00 PM, Murica Mall",
		["restoration_level_data_run"] = "11:00 AM, Uptown - Double Crossed",
		["restoration_level_data_glace"] = "10:45 PM, Green Bridge - Southbound",
		["restoration_level_data_dah"] = "1:30 AM, 22nd Floor - Garnet Group Skyscraper",
		["restoration_level_data_hvh"] = "TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK. TICK, TOCK.",
		["restoration_level_data_wwh"] = "TIME UNKNOWN, Somewhere in Alaska...",
		["restoration_level_data_rvd1"] = "TIME CLASSIFIED, LOCATION CLASSIFIED",
		["restoration_level_data_rvd2"] = "TIME CLASSIFIED, LOCATION CLASSIFIED",
		["restoration_level_data_brb"] = "6:53 PM, New York, BROOKLYN - Harvest & Trustee Branch Bank",
		["restoration_level_data_des"] = "TIME CLASSIFIED, Nevada - Henry's Rock",
		["restoration_level_data_sah"] = "TIME CLASSIFIED, Massachusetts - Shacklethorne Estate",
		["restoration_level_data_tag"] = "12:43 AM, J. Edgar Hoover Building",
		["restoration_level_data_bph"] = "TIME CLASSIFIED, Fort Clatsop Prison",
		["restoration_level_data_nmh"] = "8:24 PM, Mercy Hospital - Isolation Ward",
		["restoration_level_data_vit"] = "1:07 PM, Washington D.C. - The White House",
		["restoration_level_data_mex"] = "TIME CLASSIFIED, United States - Southern Border",
		["restoration_level_data_mex_cooking"] = "TIME CLASSIFIED, Mexico - Coyopa Compound",
		["restoration_level_data_bex"] = "TIME CLASSIFIED, Mexico - San Martín Bank",
		["restoration_level_data_pex"] = "TIME CLASSIFIED, Mexico - Police Station",
		["restoration_level_data_fex"] = "TIME CLASSIFIED, Mexico - Buluc's Mansion",
		["restoration_level_data_chas"] = "8:30 PM, San Francisco - Chinatown",
		["restoration_level_data_sand"] = "10:30 PM, San Francisco - Dockyard",
		["restoration_level_data_chca"] = "9:24 PM, San Francisco Bay - The Black Cat",
		["restoration_level_data_wetwork"] = "TIME CLASSIFIED, LOCATION CLASSIFIED",
		["restoration_level_data_junk"] = "TIME CLASSIFIED, LOCATION CLASSIFIED",
		["restoration_level_data_holly"] = "5:00 PM, Los Angeles - Lukas' Mansion",
		["restoration_level_data_lvl_friday"] = "5:00 PM, Shield Mall",

		["heist_greattrain_name"] = "Time Window",
		["heist_easystore_name"] = "Twenty-Four Seven",
		["heist_sin_villa_name"] = "SCORE: Villa Vivaldi",
		["heist_dragon_name"] = "Stonefist",
		["heist_jkl_base_name"] = "Jackal's Safehouse",
		["heist_junger_name"] = "Distorted Angels",
		["heist_deep_name"] = "Deep Six",
		["heist_blood_name"] = "Body/Prison",
		["heist_crystal_name"] = "Slaves of Fear",
		["heist_gold_name"] = "Remains of Nothing",
		["heist_titanium_name"] = "Turf War",
		["heist_airport_name"] = "Dead Reckoning",
		["heist_platinum_name"] = "Surface Tension",
		["heist_cursed_name"] = "Green Harvest",
		["heist_holly_name"] = "Blockbuster Night",

		["heist_platinum_brief"] = "stir the boat",
		["heist_jackal_surface_tension_name"] = "OMNIA Research Vessel SN-XR-LETHE",
		["heist_jackal_surface_tension_brief"] = "PLACEHOLDER",

		["heist_vivinite_name"] = "Zero Day",

		["heist_contact_shatter"] = "Jackal",
		["heist_contact_akashic"] = "Nico",

		["menu_contacts_shatter"] = "CRIMENET Affiliates",
		
		["heist_contact_jackal_description"] = "Jackal started out working for GenSec, but quit after an incident with human trafficking, tied to GenSec and OMNIA.\n\nNow, he works for CRIMENET, bringing the fight to their front door.",
		
		["heist_contact_akashic_description"] = "Formerly a high ranking lieutenant working under Hector Morales, Nicolas 'Nico' René is now commanding the remnants of the Sinaloan Cartel operating in the USA.\nTheir numbers are small, and the larger Colombian cartel has no intention of helping them -- or repairing the relationship with CRIMENET.\n\nAbsorbing various smaller gangs operating on the east coast and allying with CRIMENET, he'll provide his resources in exchange for their services.",

		["bm_msk_shatter_true"] = "Shatter",
		["bm_msk_shatter_true_desc"] = "The legendary mask that has only been spoken of in hushed tones.\n\nOf course, it's just a duplicate.\n\nThere's something much more special about the real one, but I think you'll like a copy just as much.\n\nThe Phoenix symbolizes re-birth, a timeless being that can never truly be killed.  Attempting to smite one down, it will strike back in an awesome show of flames and combustion.",

		["menu_l_global_value_veritas"] = "Restoration Mod",
		["menu_l_global_value_veritas_desc"] = "This is a Restoration Mod item!",

		["menu_alex_1_zipline"] = "Bag Zipline",

		["menu_asset_wet_intel"] = "Intel",
		["menu_asset_risk_murky"] = "Murkywater Mercenaries",
		["menu_asset_risk_bexico"] = "Policía Federal",
		["menu_asset_risk_zombie"] = "zOmbIe rEpsondERs",
		["menu_asset_wet_boat"] = "Boat",
		["menu_asset_wet_boat_desc"] = "Buy an additional boat drop-off and escape",

		["bm_msk_canada"] = "Hockey Hell",
		["bm_msk_canada_desc"] = "Leave nothing behind -- even when the heat arrives, you fight for what you want, when you want it. (even if it's a thermobaric explosive.)",
		["bm_msk_jsr"] = "Mrs. Graffiti",
		["bm_msk_jsr_desc"] = "Made by a true artist. Cleaning up graffiti is like burning a book, yeah?\n\nArt is art, respect that.",
		["bm_msk_jsrf"] = "Mr. Graffiti",
		["bm_msk_jsrf_desc"] = "Graffiti tells tales. Being an artist in the cold city can be a painful story.\n\nGraffiti tells these tales like a book. You'd best read them.",
		["bm_msk_courier_stash"] = "The Lootbag",
		["bm_msk_courier_stash_desc"] = "In case you wanna grab a few extra hundred dollar bills, and you don't have the room in your pockets, this mask will do the trick.",

		["bm_msk_female_mask"] = "Standard Issue Mask (Female)",
		["bm_msk_female_mask_desc"] = "A standard issue mask, provided by CRIMENET.\n\nMade of a dense material, it's not flimsy, but it's not easy to wear, either.",
		["bm_msk_female_mask_blood"] = "Recovered Mask (Female)",
		["bm_msk_female_mask_blood_desc"] = "A standard issue mask, provided by CRIMENET.\n\nMade of a dense material, it's not flimsy, but it's not easy to wear, either.\n\nThis was found in the aftermath of a botched robbery on an OMNIA depot, and all the remained were bodies & blood.\n\nThe crew's last message before going dark, was ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_female_mask_clown"] = "Rosie",
		["bm_msk_female_mask_clown_desc"] = "A standard issue mask, provided by CRIMENET.\n\nMade of a dense material, it's not flimsy, but it's not easy to wear, either.\n\nThis was worn by a heister by the alias of Rosie, though she now wears a new mask these days.\n\nCaught on footage, she was seen taking down a whole squad of SWAT's totally unarmed.",
		["bm_msk_male_mask"] = "Standard Issue Mask (Male)",
		["bm_msk_male_mask_desc"] = "A standard issue mask, provided by CRIMENET.\n\nMade of a dense material, it's not flimsy, but it's not easy to wear, either.",
		["bm_msk_male_mask_blood"] = "Recovered Mask (Male)",
		["bm_msk_male_mask_blood_desc"] = "A standard issue mask, provided by CRIMENET.\n\nMade of a dense material, it's not flimsy, but it's not easy to wear, either.\n\nThis was found in the aftermath of a botched robbery on an OMNIA depot, and all the remained were bodies & blood.\n\nThe crew's last message before going dark, was ''ERIT PREMIUM SANGUINE SANCTUM''.",
		["bm_msk_male_mask_clown"] = "Cross",
		["bm_msk_male_mask_clown_desc"] = "A standard issue mask, provided by CRIMENET.\n\nMade of a dense material, it's not flimsy, but it's not easy to wear, either.\n\nThis was worn by a heister by the alias of Cross, though he now wears a new mask these days.\n\nA talented marksman, he once took out four armored transports in the span of 5 seconds.",

		["bm_msk_twister_mask"] = "Mystery Man",
		["bm_msk_twister_mask_desc"] = "Whomever is behind this mask, is a mystery.\n\nIt could be somebody unknown, or somebody you've known all along.",
		["bm_msk_voodoo_mask"] = "Black Magic",
		["bm_msk_voodoo_mask_desc"] = "Found in the jungle ruins of a bombing raid, this mask withstood the elements and carnage, and now is known as an omen.\n\nIt will most likely find you when you need it most, and imbue the luck to withstand destruction.\n\nOne must ask, though -- at what cost?",

		["bm_msk_f1"] = "X1 Helmet",
		["bm_msk_f1_desc"] = "When speeding down highways & burning rubber through crowded streets, make sure you wear protection.\n\nIt might protect you from a nasty fall -- but definitely not bullets.",
		["bm_msk_f1_b"] = "X1 Helmet (Clean)",
		["bm_msk_f1_b_desc"] = "When speeding down highways & burning rubber through crowded streets, make sure you wear protection.\n\nIt might protect you from a nasty fall -- but definitely not bullets.\n\nThis is a duplicate of the helmet, without those brand stickers on it, found in a lockup with a bunch of fancy vehicles.\n\nKeep this handy, and you might get the chance to drive one of your own.",
		["bm_msk_sweettooth"] = "Sweet Tooth",
		["bm_msk_sweettooth_desc"] = "Sweet Tooth, real name Marcus 'Needles' Kane, is a character from the Twisted Metal video game series. Sweet Tooth is best known for being a killer clown that drives a combat ice cream truck.\n\nIt\'s said that he once had escaped from a mental institution. Now he leads a life of crime.",

		["bm_msk_wolf_stone"] = "Stonecold Wolf",
		["bm_msk_wolf_stone_desc"] = "Wolf's original mask from when he first tipped over the edge, acting out crimes from his favourite media. The mask was thought lost in a robbery, inspired by the video game 'Hyper Heisting.'\n\nIn the wake of the gang's early jobs, the mask resurfaced, and was brought to the safehouse by one of Bain's associates.\n\nThe mask's original pattern has partially worn away over time, perhaps mirroring the decline in Wolf's mental stability.",

		["bm_msk_dallas_aged"] = "Aged Dallas",
		["bm_msk_dallas_aged_desc"] = "You & your crew found these masks in the strange Egyptian box at Henry's Rock. The box itself was later intercepted in transit, and the remaining contents delivered to you.\n\nSomething about these masks... it's unusual. There's no information on where they possibly came from.\n\nJackal suggests that it might be a practical joke, or some kind of attempt to freak the crew out.\n\nAs far as you can tell, though? These seem very, very old.",
		["bm_msk_chains_aged"] = "Aged Chains",
		["bm_msk_chains_aged_desc"] = "You & your crew found these masks in the strange Egyptian box at Henry's Rock. The box itself was later intercepted in transit, and the remaining contents delivered to you.\n\nSomething about these masks... it's unusual. There's no information on where they possibly came from.\n\nJackal suggests that it might be a practical joke, or some kind of attempt to freak the crew out.\n\nAs far as you can tell, though? These seem very, very old.",
		["bm_msk_hoxton_aged"] = "Aged Hoxton",
		["bm_msk_hoxton_aged_desc"] = "You & your crew found these masks in the strange Egyptian box at Henry's Rock. The box itself was later intercepted in transit, and the remaining contents delivered to you.\n\nSomething about these masks... it's unusual. There's no information on where they possibly came from.\n\nJackal suggests that it might be a practical joke, or some kind of attempt to freak the crew out.\n\nAs far as you can tell, though? These seem very, very old.",
		["bm_msk_wolf_aged"] = "Aged Wolf",
		["bm_msk_wolf_aged_desc"] = "You & your crew found these masks in the strange Egyptian box at Henry's Rock. The box itself was later intercepted in transit, and the remaining contents delivered to you.\n\nSomething about these masks... it's unusual. There's no information on where they possibly came from.\n\nJackal suggests that it might be a practical joke, or some kind of attempt to freak the crew out.\n\nAs far as you can tell, though? These seem very, very old.",

		["bm_msk_beef_dallas"] = "Beeef Dallas",
		["bm_msk_beef_dallas_desc"] = "The Crew used these masks when doing the Slaughterhouse heist.\n\nDallas chose to keep the design similar to his iconic clown mask.",
		["bm_msk_beef_chains"] = "Beeef Chains",
		["bm_msk_beef_chains_desc"] = "The Crew used these masks when doing the Slaughterhouse heist.\n\nChains, being the enforcer type, wanted an intimidating animal for his design. What's more intimidating than a friggin' dinosaur?",
		["bm_msk_beef_hoxton"] = "Beeef Hoxton",
		["bm_msk_beef_hoxton_desc"] = "The Crew used these masks when doing the Slaughterhouse heist.\n\nHoxton had a simple list for his mask:\n- Protective!\n- Efficient!\n- Stylish!\n\nAnd thus, this mask was born.",
		["bm_msk_beef_wolf"] = "Beeef Wolf",
		["bm_msk_beef_wolf_desc"] = "The Crew used these masks when doing the Slaughterhouse heist.\n\nWolf's design was inspired by one of his favourite character designs from his game developer days.",

		["bm_msk_vyse_dallas"] = "The Source",
		["bm_msk_vyse_dallas_desc"] = "Vyse stood face to face with the devil of pepper extracts and survived, this mask was made out of the bones of that devil.",
		["bm_msk_vyse_chains"] = "Childs Play",
		["bm_msk_vyse_chains_desc"] = "Although Vyse stole more money and gold than Fort Knox could hold, he had a decency to show some of share some of the contents with sick children.\n\nBain reportedly visited some of those children, and this mask is their thanks for Vyse.",
		["bm_msk_vyse_hoxton"] = "The Three Stooges",
		["bm_msk_vyse_hoxton_desc"] = "They say when you mess up, you should face the pain, and try again. Not Vyse, though. Every time he fucked up, he got slapped by the hands of former military, and kept going. Not even Larry, Curley, and Moe could take such a beating.",
		["bm_msk_vyse_wolf"] = "Bear Grylls",
		["bm_msk_vyse_wolf_desc"] = "Vyse challenged Bear Grylls to a piss drinking completion... Vyse won, and Mr. Grylls used his survival skills to help make this mask.",

		["bm_msk_secret_old_hoxton"] = "Secret Hoxton Reborn",
		["bm_msk_secret_old_hoxton_desc"] = "Hoxton left the Old Country to get his Payday in the new. When Bain first told him about the Secret, he fancied the idea of going after ancient items for their potential value, never really caring whether or not the legendary power Bain talked about was real or not.",

		["bm_msk_secret_clover"] = "Secret Clover",
		["bm_msk_secret_clover_desc"] = "When Bain told Clover about the secret, she was skeptical; Bain's talk of ancient objects with mythical power always seemed farfetched, but when she came face to face with the assembly from the three boxes, all doubt left her mind.",

		["bm_msk_secret_dragan"] = "Secret Dragan",
		["bm_msk_secret_dragan_desc"] = "Being an ex-cop, Dragan had an eye for evidence, and when Bain showed him his research for the secret he was prepared to hunt for ancient objects of power.",

		["bm_msk_secret_bonnie"] = "Secret Bonnie",
		["bm_msk_secret_bonnie_desc"] = "Bonnie, upon being told of the secret by Bain, took a huge swig of her favourite whiskey and was raring to go fuck Kataru up.",

		["bm_msk_secret_sydney"] = "Secret Sydney",
		["bm_msk_secret_sydney_desc"] = "When told of the secret by Bain, Sydney disbelieved tales of ancient powers. Regardless the opportunity to challenge an unknown yet overarching authority was enough to get her onboard.",

		["bm_msk_secret_richard"] = "Secret Richard",
		["bm_msk_secret_richard_desc"] = "Rumours circulating the criminal underworld talk of the killer who inspired Jacket; a killer who met a grizzly end at the hands of an unknown organization. When Jacket was told of the secret by Bain, he later appeared with what seemed to be the mask of his greatest inspiration.",

		["bm_all_seeing"] = "The All Seeing Anchor",
		["bm_all_seeing_desc"] = "A horrifying vision, a nightmarish sight.\n\nThe powers that be have seen you, and ensure you are rewarded for your contributions.",

		["bm_msk_classic_helmet"] = "The Classic Enforcer",
		["bm_msk_classic_helmet_desc"] = "A gift given by an ex-SWAT enforcer. Before retiring, he found Jackal... and offered only the gear he had access to, to aid in Jackal's efforts.\n\nHis curious offer was due to one reason: he saw himself, what OMNIA was doing in secret. But he himself, refused to divulge those secrets, and left soon after, never to be seen again.\n\nJackal sent these helmets forward. A reward for your contributions.",

		["bm_cube"] = "devmask.model",
		["bm_cube_desc"] = "Push the placeholder, we'll get around to it.",

		["bm_j4"] = "J-4",
		["bm_j4_desc"] = "Jackal's mask. Or at least, a recreation.\n\nThe real mask is important to Jackal, and some say the real thing is loaded with sensitive data.\n\nThis recreation, however, the system running the display is very rudimentary, and only seeks to replicate the real thing.\n\nA gift for your efforts.",


		["bm_msk_finger"] = "The Griefer",
		["bm_msk_finger_desc"] = "The Griefer is a mythical beast, known to have been a part of this world long ago. The beast deliberately chased and harassed common folk in villages and towns, hunting them down in unsuspecting ways. The Griefer derived pleasure from these acts and was a threat to the peace until the King's men finally found him and destroyed him.",

		["bm_msk_instinct"] = "The Intuition",
		["bm_msk_instinct_desc"] = "This mask belonged to a mysterious warrior from far away place. He walked the lands, guided by his intuition, hunting evil forces across the world. He ventured to dungeons and slew thousands of evil beings he came across. In the end, he found peace, knowing that the next generation would continue as he did.",

		["bm_msk_unforsaken"] = "The Unforsaken",
		["bm_msk_unforsaken_desc"] = "This legendary mask is a token of our appreciation of our community's dedication, understanding and continued support. From us in the OVERKILL crew - we salute you.\n\nThrough thick and thin, let those helmets fly.",

		["bm_msk_chains_halloween"] = "Shatter Shield",
		["bm_msk_chains_halloween_desc"] = "Being a mercenary for hire, you see lots of pain, and death. Even if you feel invincible, unstoppable... sometimes it all comes back to haunt you.\n\nOn a lovely, bright and snowy October afternoon in 2008, Chains was sleeping in. Fresh off an assassination job on behalf of Murkywater, he did the tough stuff, got paid, and got a sweet hotel room to sleep in.\n\nFor the first time in years, he suffered a nightmare. He can't recall what it was, but he woke up, paralyzed, and a figure that was more skeleton than man standing over him, and he was unable to move.\n\nEach time he held his gun after that day, the following nights would each be restless, and terrible.\n\nEventually, he had to say, 'enough.' Got out of the merc-for-hire business, and saw a therapist. Had medication to help. Life was good for a year...\n\nExactly a year later, on October 31st, 2009, Murkywater was sure that a man out to fix his life would expose secrets, try to hurt the company. They couldn't have that.\n\nChains was thrust into the criminal life to protect himself, becoming a soldier once more.\n\nThis time, though? It was different. The nightmares and sleep paralysis didn't return. He wasn't out to hurt others.\n\nThis time, it was about protecting himself.",

		["bm_msk_dallas_halloween"] = "Monster's Reflection",
		["bm_msk_dallas_halloween_desc"] = "Spend so many years constructing false identities, lies, and stories, you start to lose yourself.\n\nYou start bouncing from person to person, picking up traits and quirks from your various friends, lovers, and flings. Maybe they start to blend together, and you feel like an amalgamation.\n\nDallas woke one October morning, walking to the mirror -- hair dyed an ugly blonde and patchy shave. A tacky suit, stained with sweat from restless nightmares. A throbbing headache after a weekend of jumping from liquor to liquor.\n\nStaring at himself, all he could think is that he was more like a Frankenstein's monster than a person: just bits and pieces convincing enough to make it further in his criminal career.\n\nIt was a turning point, but sometimes, he still can't shake the feeling that his pieces aren't all his.",

		["bm_msk_hoxton_halloween"] = "Halloween Dream",
		["bm_msk_hoxton_halloween_desc"] = "One of Hoxton's Halloween memories was traveling to the states one October with his extended relatives, off to see NYC as a sort of special getaway.\n\nHe was never a big fan of candy, but loved the pumpkin pie being served at his relative's party.\n\nWhile wandering the halls outside the party hall, he saw a big vault door, and trinkets and riches of all sorts being wheeled in.\n\nSince then, he always was fond of hitting places during holidays.",

		["bm_msk_wolf_halloween"] = "Devil's Cry",
		["bm_msk_wolf_halloween_desc"] = "On a cold October evening in 2010, Wolf was still recovering from the financial fallout from his company going defunct.\n\nLaying alone in a motel room, he thought about his family, how he felt he failed them, and how he might never see them again -- a whole country away and stranded after his last lifeline cut him away.\n\nHaving spent the last of his savings on a trip to the states, in a bid to secure enough money to start fresh with a new home, he was crushed.\n\nWeeks later, bouncing from friends places, motels, and shelters, he received the first call from his significant other in weeks.\n\nThe relationship was no more. 'I don't see this working out well any longer.'\n\nMaybe there was a fresh start.\n\nMaybe there was a new profession to pursue.",


		["pattern_jkl_patt01_title"] = "Jackals",
		["pattern_jkl_patt02_title"] = "Company",
		["material_jkl_matt01_title"] = "Fighting Feathers",
		["material_jkl_matt02_title"] = "Veritas Gold",

		["menu_scores"] = "SCORES",

		["RestorationModColorOption"] = "Change the color of this HUD element to your own liking",
		["RestorationModColorsOptionsButtonTitleID"] = "Color settings",
		["RestorationModColorsOptionsButtonDescID"] = "Change the color of many HUD objects.",
		["RestorationModObjectivesBGTitleID"] = "Objectives background",
		["RestorationModObjectivesFGTitleID"] = "Objectives foreground",
		["RestorationModAssaultBGTitleID"] = "Assault background",
		["RestorationModAssaultFGTitleID"] = "Assault foreground",
		["RestorationModNoReturnTitleID"] = "Point of no return text",
		["RestorationModTimerTextTitleID"] = "Heist timer text",
		["RestorationModAssaultEndlessBGTitleID"] = "Captain assault background",
		["RestorationModAssaultSurvivedBGTitleID"] = "Survived Assault background",
		["RestorationModStaminaTitleID"] = "Stamina",
		["RestorationModStaminaThresholdTitleID"] = "Stamina threshold",
		["RestorationModBagBitmapTitleID"] = "Bag",
		["RestorationModBagTextTitleID"] = "Bag text",
		["RestorationModNoReturnTextTitleID"] = "No point of return text",
		["RestorationModHostagesTextTitleID"] = "Hostages text",
		["RestorationModHintTextTitleID"] = "Hint text",
		["RestorationModMaskOnTextTitleID"] = "Mask on text",
		["RestorationModStopAllBotsTitleID"] = "Stop All Bots",
		["RestorationModStopAllBotsDescID"] = "Stops all bots by holding the stop bot key.",
		["RestorationModPONRTrackTitleID"] = "Point Of No Return Music",
		["RestorationModPONRTrackDescID"] = "Changes the music track on Pro-Jobs when the point of no return starts.",
		["RestorationModPONRTracksTitleID"] = "Point Of No Return Music",
		["RestorationModPONRTracksDescID"] = "Select the music track for Pro-Jobs when the point of no return starts.",
		["RestorationModMusicShuffleTitleID"] = "Music Shuffle",
		["RestorationModMusicShuffleDescID"] = "Changes the music track after assault ends.",
		["RestorationModScaleTitleID"] = "HUD scaling",
		["RestorationModScaleDescID"] = "Changes HUD scaling. May require a restart.",
		["RestorationModSizeOnScreenTitleID"] = "HUD size on screen",
		["RestorationModSizeOnScreenDescID"] = "Changes the size of the HUD on the screen. May require a restart.",
		["RestorationModTeammateTitleID"] = "Alpha teammates panel",
		["RestorationModTeammateDescID"] = "Enable or disable the alpha teammates panel, which displays you & your team's statistics.",
		["RestorationModHeistTimerTitleID"] = "Alpha heist timer",
		["RestorationModHeistTimerDescID"] = "Enable or disable the alpha heist timer.",
		["RestorationModMaskOnTitleID"] = "Alpha mask on text",
		["RestorationModMaskOnDescID"] = "Enable or disable the alpha mask on text.",
		["RestorationModNameLabelsTitleID"] = "Alpha name labels",
		["RestorationModNameLabelsDescID"] = "Enable or disable the alpha name labels.",
		["RestorationModHintTitleID"] = "Alpha hint panel",
		["RestorationModHintDescID"] = "Enable or disable the alpha hint panel.",
		["RestorationModExtraOptionsButtonTitleID"] = "More HUD options",
		["RestorationModExtraOptionsButtonDescID"] = "Even more options!",
		["RestorationModRealAmmoTitleID"] = "Real Ammo",
		["RestorationModRealAmmoDescID"] = "The total ammo counter ignores ammo currently in your weapon.",
		["RestorationModStealthOrigPosTitleID"] = "Vanilla Detection Meter Positioning",
		["RestorationModStealthOrigPosDescID"] = "Places the detection meter in the same area as Vanilla.",
		["RestorationModLowerBagTitleID"] = "Lowered carried bag popup",
		["RestorationModLowerBagDescID"] = "Lowers the pop-up that appears when grabbing a bag.",
		["RestorationModAssaultStyleTitleID"] = "Assault Panel Style",
		["RestorationModAssaultStyleDescID"] = "Allows you to choose the style of assault panel you want to use.",
		["RestorationModCasingTickerTitleID"] = "Alpha Casing Tape",
		["RestorationModCasingTickerDescID"] = "Enable or disable the Alpha Casing Tape (Requires Alpha Tape Style).",
		["RestorationModCustodyTitleID"] = "Alpha Custody",
		["RestorationModCustodyDescID"] = "Enable or disable alpha custody panel.",
		["RestorationModCrimenetTitleID"] = "Alpha CRIMENET (WIP)",
		["RestorationModCrimenetDescID"] = "Enable or disable alpha CRIMENET.",
		["RestorationModProfileTitleID"] = "Alpha Profile Box",
		["RestorationModProfileDescID"] = "Enable or disable alpha Profile Box.",
		["RestorationModNewsfeedTitleID"] = "Alpha Newsfeed",
		["RestorationModNewsfeedDescID"] = "Enable or disable alpha Newsfeed.",
		["RestorationModUppercaseNamesTitleID"] = "Uppercase names",
		["RestorationModUppercaseNamesDescID"] = "Enable or disable uppercase names.",
		["RestorationModPeerColorsTitleID"] = "Alpha Peer Colors",
		["RestorationModPeerColorsDescID"] = "Enable or disable the alpha peer colors.",
		["RestorationModPocoCrimenetAlignSortTitleID"] = "Poco Align and Sort CRIMENET",
		["RestorationModPocoCrimenetAlignSortDescID"] = "Aligns and sorts CRIMENET by difficulty.",
		["RestorationModPocoCrimenetScaleTitleID"] = "Poco CRIMENET Scale",
		["RestorationModPocoCrimenetScaleDescID"] = "Allows you to set the scale of CRIMENET.",
		["RestorationModVoiceIconTitleID"] = "Voice Chat Icon",
	    ["RestorationModVoiceIconDescID"] = "Displays when a player is using voice chat in-game.",
		["alpha_assault"] = "Early Alpha Corner",
		["beta_assault"] = "Alpha Tape",

		["menu_ingame_manual"] = "Overhaul Guide",
		["menu_ingame_manual_help"] = "View the guide for Restoration's Overhaul.",

		["menu_asset_wet_add_saw"] = "Additional Saw",
		["menu_asset_wet_add_saw_desc"] = "Buy an additional saw",
		["menu_rush_asset_sentrygun"] = "Sentry Package",
		["menu_rush_asset_sentrygun_desc"] = "Buy a Sentry Package",

		["heist_junker_name"] = "Doghouse",
		["heist_junker_brief"] = "This is a job for Vlad. Apparently, a botched trade deal has left his men & the goods they brought in a bad situation -- Feds are nearly on the case. We have a vehicle ready to get you to the location, and then you can provide backup. We'll secure support chopper, and get you & the essentials out of there.\n\nThis should be short, but don't underestimate the police. Bring your fighting gear.",
		["heist_junk_name"] = "Watchful Eyes",
		["heist_junk_brief"] = "The construction area is just ahead. Cops haven't arrived yet but they'll be here shortly. Vlad's guys will give you backup but they likely won't last too long.\n\nReports are that there's a meth lab on site apparently, so feel free to make a little extra money if you can keep Vlad's stuff safe at the same time.",
		["junk_01"] = "DEFEND THE CASH & DRUGS",
		["junk_01_desc"] = "Keep the cops away from the loot!  Both the coke and the money need to be defended.",
		["junk_02"] = "PLACE & SHOOT EACH GAS CAN TO LIGHT THEM",
		["junk_02_desc"] = "Light a fire, it'll alert the pilot of your position.",
		["junk_03"] = "DEFEND THE CASH & DRUGS",
		["junk_03_desc"] = "Don't let the cops secure any of Vlad's product! Lose too many bags, and the operation will be a failure!",
		["junk_04"] = "SECURE VLAD'S PRODUCT",
		["junk_04_desc"] = "Secure Vlad's cocaine. His own men will make sure the money is secured.",
		["junk_05"] = "EXTRACTION AVAILABLE",
		["junk_05_desc"] = "Leave as soon as you're satisfied with the take.",

		["heist_int_dock_name"] = "Wetworks",
		["heist_int_dock_brief"] = "This warehouse is owned by Murkywater Logistics.  At least, for the moment. They've been using it as a loot lockup for a while, but recently, they were spotted moving some 'classified' servers. Intel suggests that they're holding some information regarding the alliance between them, and OMNIA.\n\nLoud or silent, the only objective here is to get to those servers, and retrieve the data. Expect resistance no matter the method.",
		["heist_wetwork_name"] = "Wetworks",
		["heist_wetwork_brief"] = "This warehouse is owned by Murkywater Logistics.  At least, for the moment. They've been using it as a loot lockup for a while, but recently, they were spotted moving some 'classified' servers. Intel suggests that they're holding some information regarding the alliance between them, and OMNIA.\n\nLoud or silent, the only objective here is to get to those servers, and retrieve the data. Expect resistance no matter the method.",
		["obj1_enterwarehouse"] = "ENTER THE WAREHOUSE",
		["obj1_enterwarehouse_desc"] = "Enter the warehouse.",
		["obj2_findsecuritydoor"] = "LOCATE THE SERVER ROOM",
		["obj2_findsecuritydoor_desc"] = "Locate the server room. It should be somewhere in the warehouse, likely behind a locked door.",
		["obj3_getsecuritydooropen"] = "GET THE DOOR OPEN",
		["obj3_getsecuritydooropen_desc"] = "Find a way to open the door.",
		["obj4_openseconddoor"] = "BREAK INTO THE SERVER ROOM",
		["obj4_openseconddoor_desc"] = "Break into the server room. A keycard or drill might help.",
		["obj5_hack"] = "HACK THE LAPTOP",
		["obj5_hack_desc"] = "Hack the laptop with Jackal's provided software.",
		["obj5b_explode"] = "DEFUSE THE C4!",
		["obj5b_explode_desc"] = "C4! Defuse them or run!",
		["obj6_wait"] = "SEND THE DATA",
		["obj6_wait_desc"] = "Hack is finished. Send the data to Jackal.",
		["obj7_escapeorloot"] = "EXTRACTION AVAILABLE",
		["obj7_escapeorloot_desc"] = "Leave the area as soon as you're satisfied with the take.",

		["heist_int_dock_burn_name"] = "Burnout",
		["heist_int_dock_burn_brief"] = "No time for detailed plans, they're going to move the additional master servers.\nThe driver is going to park a truck full of armed clowns in their doorstep.",
		["heist_wetwork_burn_name"] = "Burnout",
		["heist_wetwork_burn_brief"] = "Alright, we're almost at the site. You've been here before, but we're going in hot this time.\nMight be some loot still stashed around, but that's secondary.\n\nKeep an eye out for anything you can use to see whats inside the closed containers. Cameras, objects around the containers, whiteboards and so on.",
		["wwburn_01"] = "READY UP",
		["wwburn_01_desc"] = "Were in the front gate, Murkywater will be all over so get your guns out.",
		["wwburn_02"] = "LOCATE SERVERS",
		["wwburn_02_desc"] = "Locate the three shipping containers that hold master servers.",
		["wwburn_03"] = "BURN THE BACKUPS",
		["wwburn_03_desc"] = "Burn the backups of the master servers, they'll be in the same containers.",
		["wwburn_04"] = "EXTRACTION AVAILABLE",
		["wwburn_04_desc"] = "Escape, or secure more loot if you feel greedy.",

		["wwburn_serverpku"] = "Secure",
		["wwburn_gaspku"] = "Collect",
		["wwburn_defend"] = "Defend",
		["wwburn_container"] = "Shipping Container",

		["menu_jukebox_resmusic_wetwork"] = "Spectre Shark",
		["menu_jukebox_screen_resmusic_wetwork"] = "Spectre Shark",
		["menu_jukebox_resmusic_bluewave"] = "Spectre Shark 2020",
		["menu_jukebox_screen_resmusic_bluewave"] = "Spectre Shark 2020",
		["menu_jukebox_resmusic_burnout"] = "Brute Force",
		["menu_jukebox_screen_resmusic_burnout"] = "Brute Force",
		["menu_jukebox_resmusic_doghouse"] = "Bleeding Edge",
		["menu_jukebox_screen_resmusic_doghouse"] = "Bleeding Edge",
		["menu_jukebox_resmusic_lethalforce"] = "Lethal Force",
		["menu_jukebox_screen_resmusic_lethalforce"] = "Lethal Force",
		["menu_jukebox_resmusic_redmarks"] = "Red Marks",
		["menu_jukebox_screen_resmusic_redmarks"] = "Red Marks",
		["menu_jukebox_resmusic_ticktockalpha"] = "Tick Tock (Alpha Version)",
		["menu_jukebox_screen_resmusic_ticktockalpha"] = "Tick Tock (Alpha Version)",
		["menu_jukebox_resmusic_doublecrossbeta"] = "Double Cross (Beta Version)",
		["menu_jukebox_screen_resmusic_doublecrossbeta"] = "Double Cross (Beta Version)",
		["menu_jukebox_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Beta Version)",
		["menu_jukebox_screen_resmusic_gunmetalgreybeta"] = "Gun Metal Grey (Beta Version)",
		["menu_jukebox_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_screen_resmusic_ponr"] = "Window of Opportunity",
		["menu_jukebox_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_screen_resmusic_speciesnova"] = "Species Nova",
		["menu_jukebox_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_screen_resmusic_madvlad"] = "Mad Vlad",
		["menu_jukebox_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_resmusic_proto"] = "Jackknife",
		["menu_jukebox_screen_m1"] = "Criminal Intent (Old Version)",
		["menu_jukebox_screen_m2"] = "Preparations (Old Version)",
		["menu_jukebox_screen_m3"] = "Blueprints (Prototype Version)",
		["menu_jukebox_screen_m4"] = "Resistance",
		["menu_jukebox_screen_m5"] = "Fortress",
		["menu_jukebox_screen_m6"] = "Payday Royale Theme",
		["menu_jukebox_screen_m_holiday"] = "The Headless Bulldozer",

		["menu_color_plus"] = "E3 PAYDAY+",
		["menu_color_rvd1"] = "Inverted",
		["menu_color_e3nice"] = "E3 Nice",
		["menu_color_force"] = "E3 BHD",
		["menu_color_halloween"] = "Change",
		["menu_color_halloween2"] = "Pumpkin Spice",

		["color_plus"] = "E3 PAYDAY+",
		["color_rvd1"] = "Inverted",
		["color_e3nice"] = "E3 Nice",
		["color_force"] = "E3 BHD",
		["color_halloween"] = "Change",
		["color_halloween2"] = "Pumpkin Spice",

		["gm_gms_purchase"] = "Purchase with Continental Coins",
		["gm_gms_purchase_window_title"] = "Are you sure?",
		["gm_gms_purchase_window_message"] = "Do you really want to buy '{1}'?\n\nIt will cost you {2} {3}.",
		["gm_gms_purchase_failed"] = "Cannot Purchase",
		["gm_gms_free_of_charge_message"] = "{1} is free of charge and can be applied to as many weapons as you wish.",
		["gm_gms_cannot_afford_message"] = "You cannot purchase {1}, as you do not have enough {3} to afford it. To purchase {1}, you will need {2} {3}",

		["bm_menu_amount_locked"] = "NONE IN STOCK",

		["pdth_hud_challenges"] = "Challenges",
		["pdth_hud_challenges_hint"] = "View completed and active challenges.",
		["pdth_hud_active_challenges"] = "Active Challenges",
		["pdth_hud_active_challenges_hint"] = "Current and active challenges.",
		["pdth_hud_completed_challenges"] = "Completed Challenges",
		["pdth_hud_completed_challenges_hint"] = "Completed and rewarded challenges.",

		["ch_vs_desc"] = "Using $weapon s, defeat $count $eneType. Using melee does not contribute to this challenge.",
		["ch_vs_head_shots_desc"] = "Using the $weapon s, defeat $count $eneType with Headshots.",
		["ch_vs"] = "$weapon s VS. $eneType $no",
		["ch_vs_head_shots"] = "$weapon s VS. $eneType HEADSHOTS $no",

		["ene_law"] = "THE WORLD",
		["ene_law_desc"] = "hostile units",

		["menu_me"] = "HEISTER",

		["RestorationModPDTHChallengesTitleID"] = "Show PDTH Challenges",
		["RestorationModPDTHChallengesDescID"] = "Toggles the visibility of the PDTH challenges in the menu and the hud",

		["RestorationModRaidLockPickingTitleID"] = "Modify Lockpicks",
		["RestorationModRaidLockPickingDescID"] = "Should the mod modify lockpicks? This changes the gameplay revolving lockpicks",
		["RestorationModRaidLockPickingVOTitleID"] = "Play Voice Lines",
		["RestorationModRaidLockPickingVODescID"] = "Should the mod play voice lines when picking a lock?",
		["hud_legend_lockpicking_interact"] = "$BTN_INTERACT Lockpick",
		["hud_legend_persuade_interact"] = "$BTN_INTERACT Persuade",
		["hud_legend_exit"] = "$BTN_CANCEL Exit",
		["RestorationModArmorFixTitleID"] = "Armor Flash Fix",
		["RestorationModArmorFixDescID"] = "Enable or disable armor flash fix.",

		-- /// Challenges Below ///

		["ch_deploy_ammobag_hl"] = "Last Bullet!",
		["ch_deploy_ammobag"] = "Deploy $count Ammo Bags.",
		["ch_plant_tripmine_hl"] = "Laser Show",
		["ch_plant_tripmine"] = "Deploy $count Trip Mines.",
		["ch_deploy_medicbag_hl"] = "Insurance Benefits",
		["ch_deploy_medicbag"] = "Deploy $count Medic Bags.",
		["ch_deploy_ecm_hl"] = "System Crasher",
		["ch_deploy_ecm"] = "Deploy $count ECM's.",
		["ch_deploy_fak_hl"] = "Lifeline",
		["ch_deploy_fak"] = "Deploy $count First Aid Kits.",
		["ch_deploy_sentry_hl"] = "White Mesa Enthusiast",
		["ch_deploy_sentry"] = "Deploy $count Sentries.",


		["ch_watchdogs_d1_heavy_wpn1_hl"] = "HEAVY ARMOR, AND HEAVIER WEAPONS",
		["ch_watchdogs_d1_heavy_wpn1"] = "Complete day one of the WATCHDOGS job, wearing an ICTV and using miniguns, the Thanatos sniper, or RPG's only, on the OVERKILL difficulty or above.  You must have played from the start of the heist to complete this challenge.",
		
		["test_net"] = "Fast.Net",
		["menu_test"] = "",
		["state_filter"] = "State",
		["menu_state_filter"] = "State Filter",
		["menu_state_filter_help"] = "Shows the lobby state",
		["menu_state_lobby"] = "Lobby",
		["menu_state_loading"] = "Loading",
		["menu_state_ingame"] = "Ingame",
		
		-- ///Stuff ripped from the various locale files we had ///
		
		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "Headless Bulldozer's Sword",
		["menu_l_global_value_halloween_sword"] = "This is a Halloween 2013 item!",
		
		--S&W .500
		["bm_w_shatters_fury"] = "Phoenix .500",
		
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "Horus Barrel",
		["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "Shatter Barrel",
		["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "Hathor Barrel",
		["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "Firebird Barrel",
		
		["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "Ergo Grip",
		
		["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "Smooth Cylinder",

		["menu_l_global_value_shatters_fury"] = "This is a VERITAS item!",
		
		--MK-23
		--Semi-automatic pistol. Hold down ■ to aim. Release to fire.
		["bm_w_socom"] = "Anubis .45",
		["bm_w_x_socom"] = "Akimbo Anubis .45's",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Ra Combined Module",
		["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "Turn it on/off by pressing $BTN_GADGET.",

		--Ranted NMH
		["heist_no_mercy_ranted_name"] = "No Mercy",
		["heist_no_mercy_ranted_brief"] = "We are hitting up the Mercy Hospital in a heist for blood. The source is carrying some kind of rare virus and we need to get it out of him. Let nothing stop us as the paycheck is a hefty one. Spilling some blood for this kind of cash is not the end of the world.",

		["heist_nmh_res_name"] = "Mercy Hospital",
		["heist_nmh_res_brief"] = "Our client needs a blood sample from a patient being kept in the isolation ward of Mercy Hospital. You gotta go in there, take out the surveillance, subdue the civilians and get me into the patient database so I can ID the guy. With the security in this place, it should be a nice clean job. I'll get you out via the roof when you're done. This job is a little shady, brokered through a third part, got some some serious shadow-company military industrial vibes, but worth the risk. The payday is something we're gonna need in the future, plus a nice cash bonus.",
		
		["heist_nmh_new"] = "Draw and analyze patient's blood",
		["heist_nmh_new_desc"] = "You gotta find a centrifuge to validate the blood samples.",
		
		["heist_nmh_new2"] = "Call the elevator",
		["heist_nmh_new2_desc"] = "Press the button and wait for the elevator",
		
		["heist_nmh_new3"] = "Call the elevator",
		["heist_nmh_new3_desc"] = "Press the button and wait for the elevator",	
		
		--OICW--
		["bm_w_osipr"] = "SABR",
		["bm_w_osipr_gl"] = "SABR Grenade Launcher",
		
		--GO Bank remastered
		["menu_nh_mod_gobank_v2"] = "GO Bank Remastered",
		
		["heist_gobank_v2_name"] = "GO Bank Remastered",
		["heist_gobank_v2_brief"] = "This is a classic bank job. Break the vault, empty the deposit boxes and get the loot out. Simple. Bain's intel says this branch has the lowest hit-rate in the country. It's time to change that.\n\n» Search the environment for keycards. Two are needed for the vault\n» Failing that, use a drill on the vault\n» Crack open the deposit boxes\n» Assemble the skyhook\n» Get the money out",
		
		["heist_roberts_v2_name"] = "Robert's Bank",
		["heist_roberts_v2_brief"] = "We got a bank here. Not a big branch but I've learned the vault is temporarily holding stacks of cash in transit. Foreign exchange notes.\n\nAnyway, you know how to do it - your way. Sneak in silent, or unleash hell. Either way, I got a little idea for how to lift the money out of there. You'll see what I mean. I think you'll like it.",

		["csgo_plane_timer_text"] = "Wait for the plane &&TIMER",
		["csgo_plane_timer_desc"] = "Wait for the plane &&TIMER",
		
		["hud_equipment_pickup_spraycan"] = "Press $BTN_INTERACT to pickup Spraycan",
		["hud_action_spraypaint"] = "Press $BTN_INTERACT to Spraypaint",
		["hud_action_spraypaint_none"] = "Spraycan Required",
		["spraycan_obtained"] = "Spraycan Obtained",
		["hud_equipment_obtained_spraycan"] = "Spraycan Obtained",
		
		["trophy_csgo01"] = "Graffiti Box",
		["trophy_csgo01_desc"] = "And you didnt even have to buy this one",
		["trophy_csgo01_objective"] = "Find spraypaint and spray graffiti in the vault on GO Bank Remastered.",

		["END"] = "END",	
		
		--Whurr Heat Street Edit
		["heist_heat_street_new_name"] = "Heat Street True Classic",
		["heist_heat_street_new_brief"] = "Someone once said there is no such thing as a sure thing, but this job looks easy: get in, get the briefcase, get out. Your trusted wheelman Matt will be waiting for you in the alley and as long as you get to the van there is no way you can fail. Is there?",
		["heist_street_new_name"] = "Heat Street: The Heist",
		["heist_street_new_brief"] = "Someone once said there is no such thing as a sure thing, but this job looks easy: get in, get the briefcase, get out. Your trusted wheelman Matt will be waiting for you in the alley and as long as you get to the van there is no way you can fail. Is there?",

		--Heat Street, Holdout edition
		["heist_skm_heat_street_name"] = "Uptown - Inkwell Industrial",
		["heist_skm_heat_street_brief"] = "The kerels recently interrogated a prisoner that claims to have seen the face of Bain and can identify him. While we know it isn't true, the kerels don't, and neither do our rivals, so we're going to use the situation to gain some cash. Intercept the chop while they're transferring him to witness protection, near the old factory storage yard where that dumkop Matt crashed his car while trying to get away from us.",
		["heist_skm_street_name"] = "Holdout: Uptown - Inkwell Industrial",
		["heist_skm_street_brief"] = "The kerels recently interrogated a prisoner that claims to have seen the face of Bain and can identify him. While we know it isn't true, the kerels don't, and neither do our rivals, so we're going to use the situation to gain some cash. Intercept the chop while they're transferring him to witness protection, near the old factory storage yard where that dumkop Matt crashed his car while trying to get away from us.",	

		--Xmas Hoxout and Breaking Feds
		["heist_xmn_hox"] = "Hoxton Breakout Xmas",
		["heist_xmn_hox1"] = "The Breakout Xmas",
		["heist_xmn_hox_1_brief"] = "The Dentist got Hoxton a re-trial. Uh, not you, Hox - I mean Old... Look, we'll sort out names later. The trial will be quick. With his record, he ain't gonna walk, but that's not the point. The point is he's moving, and we can hit him in transit. We're going to grab him right after the hearing. A nice little screw you to the US justice system.$NL;$NL;The plan is as loud as it gets: we blast a wall in the courthouse, grab Hox and get him the hell out.$NL;$NL;Area's locked down for blocks around. They'll be expecting trouble. Have your guns ready and pack a lot of ammo.",
		["heist_xmn_hox2"] = "The Search Xmas",
		["heist_xmn_hox_2_brief"] = "Well, lads, thanks for breakin' me out. But I shouldn't have been there to begin with. Someone set me up. I'm sure of it. The Feds had too much on me. Way more than those mingebag wankers could dig up. Someone ratted. Someone fucked me. And I'm gonna find out who.$NL;$NL;Now, it ain't gonna be easy. No fannying about around the edges, right? No shadowy deals or contacts, or that bollocks. We're going to the source. The biggest FBI nest. Gonna find out who screwed me.",
		["heist_xmn_hox_brief"] = "The Dentist got Hoxton a re-trial. We're going to grab him right after the hearing. The plan is as loud as it gets: we blow up a wall, grab Hoxton and get him the hell out.$NL;$NL;» Free Hoxton$NL;» Take Hoxton to the armored truck$NL;» Escort the armored truck with Hoxton in it$NL;» Escape with Hoxton.",
		
		["heist_xmn_tag_name"] = "Breakin' Feds Xmas",
		
		--Rats Zipline
		["menu_alex_1_zipline_desc"] = "Bag Zipline for quick bag transport"
	})

	local job = Global.level_data and Global.level_data.level_id
	for _,j4 in ipairs(restoration.what_a_horrible_heist_to_have_a_curse) do
		if job == j4 then
			log("Spooky!")
			LocalizationManager:add_localized_strings({	
				["hud_assault_vip"] = "FACE YOUR NIGHTMARES AND WAKE UP",
			})
			break
		end
	end			
	
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_sc_blank"] = "", --assumedly this is a debug thing, but I'm not going to touch it--

		--Menu Stuff--
		["menu_hud_cheater"] = "",
		["menu_inspect_player"] = "Inspect Player",
		["menu_inspect_player_desc"] = "Inspect player's stats",
		["menu_toggle_one_down_lobbies"] = "Allow Pro-Job Lobbies",
		
		["heist_safehouse"] = "The Safe House - Basics",
		
		--Events
		
		--Anniversary Event
		["menu_pda8_1_prog_obj_desc"] = "Find 2 different anniversary statues from Jewelry Store, Four Stores, Nightclub, Bank Heist, or Mallcrasher. You need to finish the heist for the statues to register.",
		["menu_pda8_2_prog_obj_desc"] = "As a community all Heisters must spend $5,000,000,000 retiring cops with the Cash Blaster and you need to find 3 different anniversary statues from Jewelry Store, Four Stores, Nightclub, Bank Heist, or Mallcrasher. You need to finish the heist for the statues to register.",
		["menu_pda8_3_prog_obj_desc"] = "As a community all Heisters must spend $10,000,000,000 retiring cops with the Cash Blaster and you need to find 4 different anniversary statues from Jewelry Store, Four Stores, Nightclub, Bank Heist, or Mallcrasher. You need to finish the heist for the statues to register.",
		["menu_pda8_item_1_desc"] = "As a community all Heisters must spend $15,000,000,000 retiring cops with the Cash Blaster and you need to find all 5 different anniversary statues from Jewelry Store, Four Stores, Nightclub, Bank Heist, or Mallcrasher. You need to finish the heist for the statues to register.",

		["menu_pda8_2_prog_obj"] = "Find 3 Anniversary Statues.",
		["menu_pda8_3_prog_obj"] = "Find 4 Anniversary Statues.",
			
		--Holdout--
		["menu_cn_skirmish"] = "Holdout",
		["menu_skirmish"] = "Holdout - Hostile Engagement",
		["menu_skirmish_random"] = "Random Locale",
		["menu_random_skirmish_subtitle"] = "Random combat location.\n\nNo weekly rewards, no starting modifiers.",
		["menu_weekly_skirmish"] = "Target Locale",
		["menu_weekly_skirmish_progress"] = "Waves Completed, Reward Upon Total Completion",
		["menu_skirmish_random_briefing"] = "In this scenario, you're placed into a random HOLDOUT.\n\nA random HOLDOUT consists of 9 waves. Each consecutive wave increases in difficulty.\n\nYou gain a large cash & experience reward with each wave completed, but failure will negate all rewards accrued.\n\nYou will fail if anyone in your crew -- including yourself -- is taken into custody, or if the target hostage is rescued by hostiles.",
		["menu_weekly_skirmish_desc"] = "In this scenario, you're placed into a pre-configured HOLDOUT.\n\nThe weekly HOLDOUT consists of 9 waves, with starting modifiers. Each consecutive wave increases in difficulty.\n\nFinishing all waves will grant you additional weekly rewards, in addition to your cash payout.\n\n##You will fail if anyone in your crew -- including yourself -- are taken into custody, or if the target hostage is rescued by hostiles.##",
		["menu_weekly_skirmish_tab_description"] = "Operation Rundown",
		["menu_weekly_skirmish_rewards"] = "Total Waves Completed & Associated Rewards",
		["hud_skirmish"] = "Holdout",
		["hud_weekly_skirmish"] = "Weekly Holdout",
		["heist_contact_skirmish"] = "Holdout",
		["menu_skirmish_pick_heist"] = "Jackal Company Entrusts You With This Task",
		["menu_skirmish_map_selection"] = "Target Locations",
		["menu_skirmish_selected_briefing"] = "In this scenario, you & your crew can select any HOLDOUT.\n\nA HOLDOUT consists of 9 waves. Each consecutive wave increases in difficulty.\n\nYou gain a large cash, experience, and loot reward with each wave completed.\n\nYou will fail if the target hostage is rescued by hostiles.",
		["menu_skirmish_selected"] = "Holdout",

		--Holdout Heists--
		["heist_skm_mallcrasher"] = "Shield Mall",
		["heist_skm_mallcrasher_h1"] = "Shield Mall",
		["heist_skm_arena"] = "Monarch Stadium",
		["heist_skm_arena_h1"] = "Monarch Stadium",
		["heist_skm_big2"] = "Benevolent Bank",
		["heist_skm_big2_h1"] = "Benevolent Bank",
		["heist_skm_watchdogs_stage2"] = "Almendia Logistics Dockyard",
		["heist_skm_watchdogs_stage2_h1"] = "Almendia Logistics Dockyard",
		["heist_skm_mus"] = "Andersonian Museum",
		["heist_skm_mus_h1"] = "Andersonian Museum",
		["heist_skm_run"] = "Uptown - Inkwell Industrial",
		["heist_skm_run_h1"] = "Uptown - Inkwell Industrial",


		--Heist Breifings--
		["heist_pines_briefing"] = "We need you there fast, because it's really out in the sticks, so you're going in like the paras. Find the pilot - he's probably near the wreck, and then we'll send in a chopper to extract him. Stay with him til he's safely out, Also, Vlad says that plane was loaded with product, Search the forest and get as much out as you can. We could always use a little extra cash during Christmas.\n\nNOTE FROM JACKAL:\nThe explosion from that crash alerted nearby Reaper teams. Don't expect a police response.",

		----Weapons + Mods Descriptions/names----

		--Reinfield--
		["bm_wp_r870_s_folding_ext"] = "Extended Muldon Stock",

		--Bernetti--
		["bm_wp_upg_i_93r"] = "Bernetti 93t Kit",
		["bm_wp_upg_i_93r_desc"] = "Enables a 3 round burst firemode, at the cost of extra kick.", --still need to do the one for the primary bernetti--

		--AMR16--
		["bm_wp_upg_i_m16a2"] = "AMR-16 B3 Kit",
		["bm_wp_upg_i_m16a2_desc"] = "Locks your weapon to semi/burst firemodes, but increases rate of fire by 200.",
		
		--Bernetti Auto--
		["bm_wp_upg_i_b93o"] = "Bernetti OVERKILL Kit",
		["bm_wp_upg_i_b93o_desc"] = "Replaces the 3 round burst firemode with an Auto firemode, at the cost of extra kick.",		
		
		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Causes pellets to spread horizontally instead of clustering.",
		["bm_wp_ns_ultima_desc_sc"] = "Increases overall spread of pellets by 75%.",
		["bm_wp_upg_a_slug_sc"] = "AP Slug",
		["bm_wp_upg_a_slug_sc_desc"] = "Fires a single accurate shotgun slug. Does not pierce.", --Auto/Semi-Auto shotguns--
		["bm_wp_upg_a_slug_heavy_desc_sc"] = "Fires a single accurate lead slug that penetrates body armor, enemies, shields, titan shields, and walls.", --For shotguns that can hit Heavy Sniper damage tier--
		["bm_wp_upg_a_explosive_desc_sc"] = "High-explosive slugs. Fires one explosive charge that kills or stuns targets. Cannot headshot.",
		["bm_wp_upg_a_custom_desc"] = "Fewer, bigger pellets that increase damage at the cost of some consistency and ammo.",
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 96 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 120 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 180 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Fires pellets that burn through body armor. Has a chance to set enemies on fire at close range, dealing 240 damage and potentially stunning over three seconds.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Fires armor piercing flechettes that inflict 96 bleed damage over three seconds.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "Fires armor piercing flechettes that inflict 120 bleed damage over three seconds.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "Fires armor piercing flechettes that inflict 180 bleed damage over three seconds.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Fires armor piercing flechettes that inflict 240 bleed damage over three seconds.",

		--Generic Mods--
		["bm_wp_upg_vg_afg"] = "AFG",
		["bm_wp_upg_vg_stubby"] = "Stubby Vertical Grip",
		["bm_wp_upg_vg_tac"] = "TAC Vertical Grip",

		["bm_wp_upg_vintage_sc"] = "Vintage Mag",
		["bm_wp_upg_mil_sc"] = "Milspec Mag",
		["bm_wp_upg_tac_sc"] = "Tactical Mag",

		["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
		["bm_wp_upg_drum_desc"] = "",
		["bm_wp_upg_drum2_desc"] = "",
		["bm_wp_upg_quad_desc"] = "",
		["bm_wp_upg_quad2_desc"] = "",
		["bm_wp_upg_vintage_desc"] = "",

		--Scorpion (get in-game-name later)--
		["bm_wp_scorpion_m_extended_sc"] = "Double Magazine",
		["bm_sc_scorpion_double_mag"] = "", --Unsure what this one is?--

		--RPK--
		["bm_wp_rpk_m_ban_sc"] = "Potassium Magazine",

		--Saw--
		["bm_ap_saw_sc_desc"] = "CUTS THROUGH BODY ARMOR.",
		["bm_ap_saw_blade_sc_desc"] = "Sharpens the blade enough to cut through body armor.",
		["bm_fast_motor_sc_desc"] = "Increases Rotations Per Minute by 15%.",
		["bm_slow_motor_sc_desc"] = "Decreases Rotations Per Minute by 15%.",

		--Weapon Sights--
		["bm_wp_upg_o_leupold_desc_sc"] = "Automatically marks special enemies, as well as guards in Stealth, while aiming.", --I believe all sights/objects with this effect call this same line, rather than having a unique one. Will need to be decoupled later when we add zoom to all of the sight descriptions.

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_tiny"] = "1.1x MAGNIFICATION.",
		["bm_wp_upg_o_small"] = "1.2x MAGNIFICATION.",
		["bm_wp_upg_o_cs_desc"] = "1.5x MAGNIFICATION.",
		["bm_wp_upg_o_aim"] = "2x MAGNIFICATION.",
		["bm_wp_upg_o_med"] = "3x MAGNIFICATION.",
		["bm_wp_upg_o_large"] = "4x MAGNIFICATION.",
		["bm_wp_upg_o_huge"] = "5x MAGNIFICATION.",
		--;)
		["bm_wp_upg_o_overkill"] = "6x MAGNIFICATION.",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Fires a round that causes a fire at point of impact. The fire deals damage over time and has a chance to interrupt enemies.",
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "Fires a round that causes an explosion at point of impact. The explosion deals 800 damage and has a radius of 5 meters.",
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "Fires a round that causes a burst of electricity at point of impact. The burst deals 400 damage, has a radius of 5 meters, and has a chance to tase enemies.",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "Fires a round that causes a burst of electricity at point of impact. The burst deals 300 damage, has a radius of 2.5 meters, and has a chance to tase enemies.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Rare",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Doubles the burn duration on ignited enemies, but halves damage over time.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Halves the burn duration on ignited enemies, but doubles damage over time.",
		["bm_ap_flamethrower_sc_desc"] = "Thousands of degrees of pure pain. How did it come to this?\nBURNS THROUGH BODY ARMOR.", --used by both flamethrowers, decouple later?--
		["bm_ap_money_sc_desc"] = "Thousands of dollars of pure bliss. Turn the valve, and unleash the cash.\nBRIBES THROUGH BODY ARMOR.", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "Super Size Me!", -- lol
		["bm_wp_m134_body_upper_light"] = "Light Body",
		["bm_wp_upg_a_halfthatkit_desc"] = "Adds a 10% movement speed penalty while the weapon is equipped.\n\nIncreases weapon's ammo pickup by 20%.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "Adds a 25% movement speed penalty while the weapon is equipped.\n\nIncreases weapon's ammo pickup by 50%.",

		--Thanatos--
		["bm_thanatos_sc_desc"] = "Anti-materiel rifle used to combat small vehicles. Using this on organic targets is probably a war crime.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, TITAN SHIELDS, AND THIN WALLS.",

		--Galant--
		["bm_galant_sc_desc"] = "A classic WW2 battle rifle. Reliable, accurate, and quick to reload.\n\nReloads faster when the magazine is empty.",

		--Kobus 90--
		["bm_wp_p90_body_p90_tan"] = "Tan Body",
		["bm_ap_weapon_mod_sc_desc"] = "ADDS BODY ARMOR PENETRATION, SHIELD PENETRATION, AND WALL PENETRATION.",
		["bm_wp_90_body_boxy"] = "OMNIA Assault Frame",
		["bm_wp_90_body_boxy_desc"] = "Recovered from the desolated remains of an old OMNIA warehouse, this frame makes no difference to the weapon's handling or its functionality whatsoever, but its block-like aesthetic surely makes it a nice thing to have.",

		--Phoenix .500--
		["bm_wp_shatters_fury_desc"] = "A massive .500 caliber revolver with insane kick and stopping power. Shatter's weapon of choice.\nCAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",

		--OICW--
		["bm_w_osipr_desc_pc"] = "X-Generation weapon technology. Equipped with 20mm airburst grenade launcher.\nPress $BTN_BIPOD to switch to the Grenade Launcher.",
		["bm_w_osipr_desc"] = "X-Generation weapon technology. Equipped with 20mm airburst grenade launcher.\nHold $BTN_BIPOD to switch to the Grenade Launcher.",

		--socom deez nuts--
		["bm_w_socom_desc"] = "Jackal's sidearm of choice. A reliable and powerful .45ACP handgun with a stylish design.",

		--Baby Deagle--
		["bm_w_sparrow_sc_g_cowboy_desc"] = "You're gonna carry that weight.",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "A special-issue AK that - in war and crime - has demonstrated an unquenchable thirst for blood.",
		["bm_wskn_deagle_bling_desc_sc"] = "A hand-crafted Deagle built as testament to the finest gaming-trained crackshot in the world.",

		--Exclusive Sets--
		["bm_wp_upg_ultima_body_kit_desc_sc"] = "This Exclusive Set adds a unique 'Triple Threat' laser sight that is mutually exclusive with other gadgets.",
		["bm_wp_upg_fmg9_conversion_desc_sc"] = "This Exclusive Set adds a High-Tech Ammo Counter as well as a laser sight that is mutually exclusive with other gadgets.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "No Modifier",
		["bm_wp_upg_bonus_sc_none_desc"] = "USE THIS TO DISABLE BOOSTS FROM WEAPON SKINS.",

		--Little Friend--
		["bm_m203_weapon_sc_desc_pc"] = "Press $BTN_BIPOD to switch to the mounted Grenade Launcher.",
		["bm_m203_weapon_sc_desc"] = "Hold $BTN_BIPOD to switch to the mounted Grenade Launcher.",

		--Mosin--
		["bm_mosin_sc_desc"] = "Classic, Powerful bolt-action rifle. This weapon reloads in clips of 5 bullets at a time.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",
		["bm_wp_upg_a_tranq_mosin"] = "Tranquilizer Rounds",
		["bm_wp_upg_a_tranq_mosin_desc"] = "Fires weaker tranquilizer rounds that deal damage over time and can stun enemies.\n\nFor true oblivion, The End.",
		
		--Crosskill Guard
		["bm_shrew_g_bling_sc_desc"] = "In a world filled with misery and uncertainty, it is a great comfort to know that, in the end, there is light in the darkness. ",

		--Broomstick--
		["bm_c96_sc_desc"] = "Revolutionary German machine pistol. Capable of firing in full-auto at an insane rate, but will decimate your ammo reserves.\nThis weapon reloads in clips of 10 bullets at a time.",

		--M4/CAR-4
		["bm_menu_sc_m4_desc"] = "Reliable, compact, and deadly. A popular 5.56mm rifle among modern militaries.",

		--Buzzsaw/Mg42
		["bm_wolf_brigade_sc_desc"] = "25% less recoil when fired from the hip.",		
		["bm_wp_mg42_b_mg34_desc_sc"] = "Slows your rate of fire to 800",

		--SAA/Peacemaker
		["bm_ap_weapon_peacemaker_sc_desc"] = "Can penetrate body armor, shields and thin walls.\n\nThe greatest handgun ever made.",		

		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_menu_weapon_movement_penalty_info"] = "MOVEMENT SPEED IS REDUCED BY ",
		["bm_menu_weapon_movement_penalty_info_2"] = " WHILE DRAWN",
		["bm_ap_weapon_sc_desc"] = "Can penetrate body armor, shields and thin walls.",
		["bm_ap_armor_weapon_sc_desc"] = "Can penetrate body armor.",
		["bm_heavy_ap_weapon_sc_desc"] = "Can penetrate body armor, shields, titan shields and thin walls.",
		["bm_ap_2_weapon_sc_desc"] = "Can penetrate body armor. Arrows can be restored by picking them up and range increases the longer an arrow is drawn.",
		["bm_ap_3_weapon_sc_desc"] = "Can penetrate body armor. Arrows can be restored by picking them up.",
		["bm_40mm_weapon_sc_desc"] = "Press $BTN_GADGET to toggle the flip up sight.",
		["bm_rocket_launcher_sc_desc"] = "Rockets fired by this weapon instantly destroy turrets.",
		["bm_quake_shotgun_sc_desc"] = "Fires both barrels at one, doubleing the number of pellets.",
		["bm_hx25_buck_sc_desc"] = "Fires 12 pellets in a wide spread.\n\nUses skills associated with launchers.",
		["bm_auto_generated_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.",
		["bm_auto_generated_ap_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, AND THIN WALLS.",
		["bm_auto_generated_sap_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\nCAN PENETRATE BODY ARMOR, SHIELDS, TITAN SHIELDS, AND THIN WALLS.",
		["bm_auto_generated_lmg_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\nWHILE EQUIPPED, THIS WEAPON WILL REDUCE YOUR MOVEMENT SPEED## BY 25%.",
		["bm_auto_generated_mod_sc_desc"] = "The stats on this attachment have been removed until automatic custom attachment stat generation is finished.",
		["bm_tranq_maxim_sc_desc"] = "Integrally suppressed.\n\nDeals damage over time with tranquilizer rounds.",
		["bm_m134_rof_init_sc_desc"] = "Briefly shoots at 2x the rate of fire for the first few rounds of each trigger pull.",
				
		--Overhaul Content Indicators--
		["loot_sc"] = "Restoration Overhaul",
		["loot_sc_desc"] = "THIS IS A RESTORATION OVERHAUL ITEM!",

		["menu_l_global_value_omnia"] = "OMNIA",
		["menu_l_global_value_omnia_desc"] = "THIS IS AN OMNIA ITEM!",

		["menu_rifle"] = "RIFLES",
		["menu_jowi"] = "Wick",
		["menu_moving_target_sc"] = "Subtle",

		["bm_wp_upg_i_singlefire_sc"] = "Slower Cyclic",
		["bm_wp_upg_i_singlefire_sc_desc"] = "SLOWS YOUR RATE OF FIRE BY 15%", --RIP RoF mods
		["bm_wp_upg_i_autofire_sc"] = "Faster Cyclic",
		["bm_wp_upg_i_autofire_sc_desc"] = "INCREASES YOUR RATE OF FIRE BY 15%",

		["bm_hint_titan_60"] = "The Titandozer leaves in 60 seconds!",
		["bm_hint_titan_10"] = "The Titandozer leaves in 10 seconds!",
		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",

		["bm_hint_titan_end"] = "The Titandozer left to haunt another world!",
		["bm_menu_gadget_plural"] = "Gadgets",
		["menu_pistol_carbine"] = "Pistol Carbine",
		["menu_battle_rifle"] = "Battle Rifle",

		-- Melee weapon descriptions (don't forget to call them in blackmarkettweakdata, not weapontweakdata) --
		["bm_melee_katana_info"] = "While playing as Jiro, killing a Cloaker with a charged attack triggers a special kill animation.",
		["bm_melee_buck_info"] = "Surprisingly effective against modern weapons too.\n\nReduces incoming ranged damage by 10% while charging.", --Buckler Shield
		["bm_melee_cs_info"] = "Rip and Tear, until it is done.\n\nDeals 30 damage every 0.25 seconds to targets in front of you while charging. This can be increased with skills. Cannot parry enemy attacks.", -- ROAMING FR-
		["bm_melee_ostry_info"] = "Spiiiiiiiiiin.\n\nDeals 18 damage every 0.25 seconds to targets in front of you while charging. This can be increased with skills. Cannot parry enemy attacks.", --Kazaguruma
		["bm_melee_wing_info"] = "Goes great with a disguise kit!\n\nDeals quadruple damage when attacking enemies from behind.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "Designed for violence, deadly as a revolver - that's the switchblade!\n\nDeals double damage when attacking enemies from behind.",-- Switchblade Knife
		["bm_melee_chef_info"] = "Not sure if this was used for chopping meat from the supermarket.\n\nFully charged hits spread panic.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "A sword forged from nightmares.\n\nFully charged hits spread panic.", -- Headless Dozer Sword
		["bm_melee_nin_info"] = "Fires nails which have a short effective range and instant travel. Still counts as a melee kill.", -- Pounder
		["bm_melee_iceaxe_info"] = "Deals 50% more headshot damage.", -- Icepick
		["bm_melee_mining_pick_info"] = "Deals 50% more headshot damage.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "I didn't hear no bell.\n\nKills performed with the OVERKILL Boxing Gloves instantly refill your stamina.", -- OVERKILL Boxing Gloves
		["bm_melee_clean_info"] = "Give the cops that extra clean shave they need.\n\nDeals 120 bleed damage over three seconds.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "There's no afterlife waiting for my sorry ass... and I'm just here... talking to a fucking baseball bat!\n\nDeals 120 bleed damage over three seconds.", --Lucille Baseball Bat
		["bm_melee_spoon_gold_info"] = "Eat 'em up, Eat 'em up, Eat 'em up, Eat 'em up! \n\nHas a 50% chance to deal 120 fire damage and interrupt enemies over 3 seconds.", --Gold Spoon
		["bm_melee_cqc_info"] = "Contains an exotic poison that deals 120 extra damage and carries a chance to interrupt over three seconds.", --Kunai, Syringe
		["bm_melee_fight_info"] = "Be water, my friend.\n\nParrying an enemy attack deals 120 melee damage to them. This can be increased with skills.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "GIMME A JACKPOT!\n\nHas a 5% chance to deal ten times the damage and knockdown.",
		["bm_melee_specialist_info"] = "Twice the blades, twice the fun.\n\nMelee attacks deal double damage every hit after the first while drawn.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "He's whacking and hacking and slashing.\n\nDeals 50% less headshot damage in exchange for increased overall effectiveness against the body and limbs.",

		--We assets now--
		["menu_asset_dinner_safe"] = "Safe",
		["menu_asset_bomb_inside_info"] = "Insider Info",
		["menu_asset_mad_cyborg_test_subject"] = "Test Subjects",

		--Player Outfits--
		["bm_suit_two_piece_sc"] = "Two-piece Suit",
		["bm_suit_two_piece_desc_sc"] = "The classy approach to heisting. Never hurts to look sharp when yelling, 'down on the ground!'\n\nSelecting this option will make sure you wear your Default outfit, regardless of any heist's own outfit.",

		["bm_suit_loud_suit"] = "Combat Harness",
		["bm_suit_loud_suit_desc"] = "This is a suit for when you don't mind the heat. It's lightweight, easy to move in, and built for utility. Good choice for going in for a smash and grab, or when hitting heavily fortified mercenary facilities.",

		["bm_suit_jackal_track"] = "Special Merchandise",
		["bm_suit_jackal_track_desc"] = "A special-made tracksuit, with both the Jackal logo, and a variation on the VERITAS logo.\n\nThe crew received them in unmarked boxes, but Jackal confirms he never sent them, or has seen them before.\nIt's unknown where they came from.\n\n\n\n...Inside the packages, was one note:\n\n''##A TOKEN OF APPRECIATION, FOR THOSE WITH DEDICATION.\nXOXO\n--S.N.##''\n\n",

		["bm_suit_sunny"] = "Sunny-Side Robber",
		["bm_suit_sunny_desc"] = "Sometimes you just want to roll up your sleeves and do a little heisting.",

		["bm_suit_pool"] = "Bodhi's Pool Repair Uniform",
		["bm_suit_pool_desc"] = "Sharp threads for pool repair men...",

		["bm_suit_prison"] = "Prison Suit",
		["bm_suit_prison_desc"] = "You've been taken into custody!",

		["bm_suit_var_jumpsuit_flecktarn"] = "Flecktarn Camo",
		["bm_suit_var_jumpsuit_flecktarn_desc"] = "A classic camo used by two European countries, proven battle-effective by its ability to blend into forested environments easily. It sure as hell doesn't work in urban areas, but in rural ones it does wonders to trick people's eyes.",

		["bm_suit_var_jumpsuit_flatgreen"] = "Gooey Green",
		["bm_suit_var_jumpsuit_flatgreen_desc"] = "This suit was rumored to have belonged to one member of a trio of psychotic criminals, having been recovered near a destroyed garbage truck that was presumed to have been involved in a bloody heist on a GenSec armored car, which left numerous SWAT members dead and quite a few wounded. The identity of these criminals are still shrouded in mystery, as most evidence was destroyed with the Garbage Truck, only leaving this jumpsuit.",

		--New menu stats--
		["bm_menu_deflection"] = "Deflection",
		["bm_menu_regen_time"] = "Regen Delay",
		["bm_menu_swap_speed"] = "Swap Time",
		["bm_menu_pickup"] = "Ammo Pickup",
		["bm_menu_ads_speed"] = "Aim Time",
		["bm_menu_reload"] = "Reload Time",
		["bm_menu_damage"] = "Damage", -- I gotta find out WHO KILLED MY DA- how to spoof the damage readout for melee ["bm_menu_damage"] = "Damage Max",
		["bm_menu_standing_range"] = "Falloff Start",
		["bm_menu_damage_min"] = "Damage Min",
		["bm_menu_moving_range"] = "Falloff End",
		
		--Attachment type names--
		["bm_menu_barrel_ext"] = "Muzzle",
		["bm_menu_foregrip"] = "Handguard",
		["bm_menu_vertical_grip"] = "Foregrip",
		--Spoof types--
		["bm_menu_frame"] = "Frame",
		["bm_menu_whole_receiver"] = "Receiver",
		["bm_menu_shell_rack"] = "Shell Rack",
		["bm_menu_nozzle"] = "Nozzle",
		["bm_menu_fuel"] = "Tank",
		["bm_menu_cylinder"] = "Cylinder",
		["bm_menu_model"] = "Model",
		["bm_menu_forebarrelgrip"] = "Barrel & Handguard",
		["bm_menu_riser"] = "Riser",
		["bm_menu_pump"] = "Pump",

		["bm_menu_ro_barrel"] = "Barrel",
		["bm_menu_ro_stock"] = "Stock",
		["bm_menu_ro_modifier"] = "Modifiers",
		["bm_menu_ro_charm"] = "Charm",
		["bm_menu_ro_grip"] = "Grip",
		
		--Weapon categories--
		["menu_pistol"] = "Pistols",
		["menu_akimbo_pistol"] = "Dual Pistols",
		--
		["menu_light_pis"] = "Light Pistols",
		["menu_heavy_pis"] = "Heavy Pistols",
		
		["menu_shotgun"] = "Shotguns",
		["menu_akimbo_shotgun"] = "Dual Shotguns",
		--
		["menu_light_shot"] = "Light Shotguns",
		["menu_heavy_shot"] = "Heavy Shotguns",
		["menu_break_shot"] = "Break-Action Shotguns",
		
		["menu_smg"] = "SMGs",
		["menu_akimbo_smg"] = "Dual SMGs",
		--
		["menu_light_smg"] = "Light SMGs",
		["menu_heavy_smg"] = "Heavy SMGs",
		
		["menu_assault_rifle"] = "Rifles",
		["menu_akimbo_assault_rifle"] = "Dual Rifles",
		--
		["menu_light_ar"] = "Light Rifles",
		["menu_heavy_ar"] = "Heavy Rifles",
		["menu_dmr_ar"] = "Marksman Rifles",
		
		["menu_lmg"] = "Machine Guns",
		--
		["menu_light_mg"] = "LMGs",
		["menu_heavy_mg"] = "HMGs",
		
		["menu_snp"] = "Snipers",
		--
		["menu_light_snp"] = "Light Snipers",
		["menu_heavy_snp"] = "Heavy Snipers",
		["menu_antim_snp"] = "Anti-Materiel Rifles",

		["menu_wpn_special"] = "Specials & Unsorted",
		
		
		

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_armor_grinding_1"] = "Armor regenerated every tick: $passive_armor_regen",
		["bm_menu_armor_grinding_2"] = "Armor regenerated every tick: $passive_armor_regen \nArmor regenerated when damaging enemies: $active_armor_regen",

		["bm_menu_armor_max_health_store_1"] = "Max health stored: $health_stored",
		["bm_menu_armor_max_health_store_2"] = "Max health stored: $health_stored \nArmor regen bonus on kill: $regen_bonus%",
	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Weapons", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_bonus"] = "Modifiers",
		["steam_inventory_stat_boost"] = "Stat Modifier",

		--Safe House--
		["dialog_safehouse_text"] = "You haven't visited the safe house yet.\n\nYou should, as you might find something new.\n\nWould you like to go there now?",

		["bm_menu_custom_plural"] = "WEAPON ATTACHMENTS IN THE CUSTOM CATEGORY", --unused?--

		----Custom Weapon Mod Descriptions----

		--Is there a reason these have to be down here? If not, I'll move them up with the others (custom weapons in their own section dw)--

		--Triad Chi-Revolver [Custom]--
		["bm_wp_wpn_fps_upg_triad_bullets_44normal_desc"] = "Why would you use outdated post-Collision ammunition with Chi-Revolvers? Why the fuck do dogs lick their balls?\nMin and max ammo pickup rate: 1.33x",
		["bm_wp_wpn_fps_upg_triad_bullets_44ap_desc"] = "Assblast your enemies through walls, armor, and shields with these rounds.\nEnables armor, shield, and wall piercing at the cost of damage.",
		["bm_wp_wpn_fps_upg_triad_bullets_44hollow_desc"] = "Chi-fussed hollow rounds stolen from a place of unknown origin. The only thing you need to know is that this shit KICKS hard and the fact that anything on the other end of the barrel is practically vaporized after the gun kicks. Good shit, ain't it?\nThis ammunition is much harder to find in ammo drops.\nEverything else lowered in favor of damage, and pickup rate.\nMin and max ammo pickup rate: 0.33x",

		--DECK-ARD [Custom]--
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_high_desc"] = "Shoot them so dead they'll die in hell.\nMassive damage at the cost of everything else.\nCapable of piercing through armor, walls and shields.\nThis ammunition is much harder to find in ammo drops.\nMin and max ammo pickup rate: 0.33x",
		["bm_wp_wpn_fps_upg_deckard_ammo_damage_med_desc"] = "Shoot them dead.\nThis ammunition is substantially easier to find in ammo drops.\nMin and max ammo pickup rate: 1.33x",

		--Unknown Weapon--
		["bm_wp_wpn_fps_ass_tilt_a_fuerte"] = "7.62mm Conversion Kit",
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "Converts the weapon's caliber to 7.62mm, which slightly decreases firerate and stability in favor of increased damage and accuracy.",

		--MK18 Specialist [Custom]--
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "An ammunition type that mimics medium tier rifles. Lowers ammo count and stability in trade for higher damage and accuracy.",
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "Magwell Grip",

		--Unknown Weapon--
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "Extended Magazine",
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "Extend-o Magazine",

		--Jackal SMG(these are unused though)--
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "Converts the Jackal into the Mastiff, something of the younger sister in the Jackal family. Not as stable as the Coyote, and not as deadly as the Jackal, but atleast it fires rounds that can penetrate both armor and walls.",

		--Unknown weapon--
		["bm_wp_wpn_fps_upg_am_hollow_large_desc"] = "Open-tipped rounds that, thanks to physics, create larger and more painful wound cavities in their enemies. Although HP rounds are harder to find on enemies and have more recoil, they are thankfully more effective against the head and somewhat more accurate than normal rounds.",
		--Unknown Weapon--
		["bm_menu_weirdmagthing"] = "Magwell Grip",

		--Gecko 7.62--
		["bm_wp_wpn_fps_ass_galil_m_drum"] = "75 Round Drum Magazine",

		--Cavity 9mm--
		["bm_wp_wpn_fps_smg_calico_body_full_desc"] = "Converts to medium pistol tier.\nMin and Max pickup rate: 0.8x",

		--DP-28 [Custom]--
		["bm_wp_wpn_fps_lmg_dp28_tripod_top_desc"] = "A tripod with additional ammo mounted on its side.\nReduces movement speed by 20% when equipped.",

		--Arbiter--
		["bm_wp_wpn_fps_gre_arbiter_o_smart_desc"] = "Experimental scope that provides airburst capabilites to the Arbiter.\nIncompatible with incendiary rounds.", --this weapon mod isn't vanilla though iirc--

		--Itachi [Custom]--
		["bm_wp_wpn_fps_upg_bajur_m_pants"] = "NO",
		["bm_wp_wpn_fps_upg_bajur_fg_dmr_desc"] = "Replaces the upper receiver of the Itachi with a .50 Beowulf variant, making the weapon kick a hell of a lot harder, but increasing the size of bulletholes made on law enforcers ten-fold.\n Reduces all stats, except for accuracy and power.",

		--Union 5.56--
		["bm_wp_corgi_b_short"] = "MSG Barrel",

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "Deploy/Undeploy by pressing $BTN_BIPOD on a valid surface.\n\nDramatically reduces recoil while deployed.",
		["bm_sc_bipod_desc"] = "Deploy/Undeploy by holding $BTN_BIPOD on a valid surface.\n\nDramatically reduces recoil while deployed.",

		--String override for the stungun--
		["bm_melee_taser_info"] = "Device that electrocutes and interrupts targets on touch when fully charged.",

		-- Renamed default weapons and mods + descriptions-- --move all these to their respective weapons--

		["bm_wp_pis_usp_b_match"] = "Freeman Slide",
		["bm_wp_1911_m_big"] = "Casket Magazine",
		["bm_wp_usp_m_big"] = "Casket Magazine",
		["bm_wp_upg_ass_ak_b_zastava"] = "Long Barrel",
		["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf Barrel",
		["bm_wp_p90_b_ninja"] = "Ninja Barrel",
		["bm_wp_par_b_short"] = "Comped Barrel",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_lemming"] = "5/7 Pistol",

		["bm_w_x_judge"] = "Judge & Jury", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
		["bm_w_x_shrew"] = "Barry & Paul",
		["bm_w_x_1911"] = "Mustang & Sally",
		["bm_w_tec9"] = "T3K Urban Submachine Gun",
		["bm_w_x_tec9"] = "Akimbo T3K Urban Submachine Guns",

		["bm_wp_mp5_fg_mp5sd"] = "SPOOC Foregrip",
		["bm_wp_hs2000_sl_long"] = "Elite Slide",
		["bm_wp_vhs_b_sniper"] = "Hyper Barrel",
		["bm_w_r0991"] = "AR-15 Varmint Pistol",
		["bm_wp_vhs_b_silenced"] = "Bad Dragan Barrel",
		["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Red Body",
		["bm_wp_g3_b_sniper"] = "Macro Barrel",
		["bm_wp_g3_b_short"] = "Micro Barrel",
		["bm_wp_g3_m_psg"] = "Präzision Magazine",
		["bm_wp_shak12_body_vks"] = "Reinforced Frame",

		["bm_w_beck_desc"] = "The criminal underworld's most popular shotgun has returned from its grave to reclaim its rightful place in the shotgun hierarchy. Originally used in the 2011 Crimewave, this shotgun has been proven extremely reliable in just about any close range situation.",



		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Small Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p1_mod"] = "Small Concealment Modifier",
		["bm_menu_bonus_concealment_p2"] = "Large Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p2_mod"] = "Large Concealment Modifier",
		["bm_menu_bonus_concealment_p3"] = "Massive Concealment bonus and Accuracy/Stability penalty",
		["bm_menu_bonus_concealment_p3_mod"] = "Massive Concealment Modifier",
		["bm_menu_bonus_spread_p1"] = "Small Accuracy bonus and Stability penalty",
		["bm_menu_bonus_spread_p1_mod"] = "Small Accuracy Modifier",
		["bm_menu_bonus_spread_n1"] = "Massive Stability bonus and Accuracy penalty",
		["bm_menu_bonus_recoil_p3_mod"] = "Massive Stability Modifier",
		["bm_menu_bonus_recoil_p1"] = "Small Stability bonus and Accuracy penalty",
		["bm_menu_bonus_recoil_p1_mod"] = "Small Stability Modifier",
		["bm_menu_bonus_recoil_p2"] = "Large Stability bonus and Accuracy penalty",
		["bm_wp_upg_bonus_team_exp_money_p3_desc"] = "+5% Experience reward for you and your crew.",
		["bm_menu_spread"] = "Accuracy\n",
		["bm_menu_recoil"] = "Stability\n",
		["bm_menu_concealment"] = "Concealment\n",
		["bm_menu_bonus_spread_p2_mod"] = "Large Accuracy Modifier",
		["bm_menu_bonus_spread_p3_mod"] = "Massive Accuracy Modifier",
		["bm_menu_bonus_recoil_p2_mod"] = "Large Stability Modifier",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Money Boost",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+5% Money reward for you and your crew.",

		["bm_wp_upg_i_singlefire_desc"] = "LOCKS YOUR WEAPON TO SINGLE-FIRE MODE.",
		["bm_wp_upg_i_autofire_desc"] = "LOCKS YOUR WEAPON TO AUTO-FIRE MODE.",

		--Fixed names for SMGS to ARs--
		["bm_w_olympic"] = "Para Rifle",
		["bm_w_akmsu"] = "Krinkov Rifle",
		["bm_w_x_akmsu"] = "Akimbo Krinkov Rifles",
		["bm_w_hajk"] = "CR 805B Rifle",
		
		["bm_w_fmg9"] = "Wasp-DS Machine-Pistol",

		["menu_akimbo_assault_rifle"] = "Akimbo Assault Rifle",

		["bm_w_m95"] = "Thanatos .50 cal Anti-Materiel Rifle",
		["bm_w_m107cq"] = "Mors .50 cal Anti-Materiel Rifle",
		["bm_w_m200"] = "TF-141 Anti-Materiel Rifle",

		--Throwables--
		["bm_concussion_desc"] = "Capacity: 3 \nRange: 10m \nStuns enemy for up to 4s \nEnemy accuracy reduced by 50% for 7s \nStuns all enemies, excluding Titan-Shields, Titan-Bulldozers and Captains \n \nThis stunning little beauty will take everyone's breath away, giving you that extra moment to kill them.",
		["bm_grenade_smoke_screen_grenade_desc"] = "Range: 8m \nDuration: 12s \n \nDrop one of these and you'll vanish in a cloud of smoke, leaving your enemies struggling to take aim at you.",
		["bm_grenade_frag_desc"] = "Capacity: 3\nDamage: 800 \nRange: 5m \n \nThe classic explosive hand grenade. Is there any more to say?",
		["bm_dynamite_desc"] = "Capacity: 3\nDamage: 800 \nRange: 4m \nDoes not bounce or roll from impact point, but deals less splash damage than similar explosives.\n\nDesigned to effectively blast through rock. Even more effective at blasting through people.",
		["bm_grenade_frag_com_desc"] = "Capacity: 3 \nDamage: 800 \nRange: 5m \n \nA sleek new look to the classic hand grenade, sure to provide that OVERKILL touch to each blast.",
		["bm_grenade_dada_com_desc"] = "Capacity: 3 \nDamage: 800 \nRange: 5m \n \nThe doll's outer layers hides its explosive inner workings. A tribute to the Motherland.",
		["bm_grenade_molotov_desc"] = "Capacity: 3 \nDamage: 1200 per pool over 10s \nRange: 3.75m \nDuration: 10s \nDetonates on impact \n \nA breakable bottle of flammable liquid with a burning rag. It is cheap, simple and highly effective. Burn it all down.",
		["bm_grenade_fir_com_desc"] = "Capacity: 3 \nDamage: 1440 per pool over 12s \nRange: 3.75m \nDuration: 12s \nDetonates after 2.5s \n \nA self igniting phosphorus container. Perfect for bouncing off walls and around corners towards your enemies.",
		["bm_wpn_prj_ace_desc"] = "Capacity: 9 \nDamage: 240 \n \nThrowing cards with added weight and a razor edge. A real killer hand of cards.",
		["bm_wpn_prj_four_desc"] = "Capacity: 9 \nDamage: 200 (Impact) \nDamage: 200 over 5s (Poison) \nInterrupts enemy actions \n \nThe throwing star has a long history filled with blood and battle. These poison coated stainless steel stars will pose a lethal threat to anyone in your way.",
		["bm_wpn_prj_target_desc"] = "Capacity: 9 \nDamage: 240 \n \nA solid backup plan and a reliable tactic for a precise and silent kill.",
		["bm_wpn_prj_jav_desc"] = "Capacity: 6 \nDamage: 360 \n \nWith its origins lost in cloudy pre-history, the javelin is a simple weapon. After all, it's a thrown stick with a pointy end that ruins someone's day.",
		["bm_wpn_prj_hur_desc"] = "Capacity: 6 \nDamage: 360 \n \nThey say a sharp axe is never wrong. A thrown sharp axe couldn't be any more right.",
		["bm_grenade_electric_desc"] = "Capacity: 3\nDamage: 400 \nRange: 5m \n \nShrapnel is all well and good but some things need to be fried, and this little beauty is a rather practical beast for dishing out some damage with high voltage.",

		["bm_wp_wpn_fps_upg_scar_m203_buckshot"] = "40MM Buckshot Rounds",
		["bm_wp_wpn_fps_upg_scar_m203_buckshot_desc"] = "Round loaded with 6 heavy pellets.\n\nTotal ammo: 15\nDamage: 360\nAccuracy: 40\nEffective range: 9M\nMaximum range: 18M",
		["bm_wp_wpn_fps_upg_scar_m203_flechette"] = "40MM Flechette Rounds",
		["bm_wp_wpn_fps_upg_scar_m203_flechette_desc"] = "Round loaded with 12 small long range darts.\n\nTotal ammo: 20\nDamage: 240\nAccuracy: 50\nEffective range: 11M\nMaximum range: 22M",

		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot"] = "40MM Buckshot Rounds",
		["bm_wp_wpn_fps_upg_g3m203_gre_buckshot_desc"] = "Round loaded with 6 heavy pellets.\n\nTotal ammo: 15\nDamage: 360\nAccuracy: 40\nEffective range: 9M\nMaximum range: 18M",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette"] = "40MM Flechette Rounds",
		["bm_wp_wpn_fps_upg_g3m203_gre_flechette_desc"] = "Round loaded with 12 small long range darts.\n\nTotal ammo: 20\nDamage: 240\nAccuracy: 50\nEffective range: 11M\nMaximum range: 22M",
	})

	local twirl = math.rand(1)
	local shalashaska = 0.06

	if twirl <= shalashaska then
		LocalizationManager:add_localized_strings({	
			["bm_w_peacemaker"] = "Revolver Ocelot",
			["bm_w_peacemaker_desc"] = "Revolver Ocelot",
			["bm_ap_weapon_peacemaker_sc_desc"] = "Revolver Ocelot",
			["bm_wp_peacemaker_barrel_long"] = "Revolver Ocelot",
			["bm_wp_peacemaker_barrel_short"] = "Revolver Ocelot",
			["bm_wp_peacemaker_handle_bling"] = "Revolver Ocelot",
			["bm_wp_peacemaker_rifle_stock"] = "Revolver Ocelot",

			["bm_menu_ro_barrel"] = "Revolver Ocelot",
			["bm_menu_ro_stock"] = "Revolver Ocelot",
			["bm_menu_ro_modifier"] = "Revolver Ocelot",
			["bm_menu_ro_charm"] = "Revolver Ocelot",
			["bm_menu_ro_grip"] = "Revolver Ocelot"
		})
	end
	
end)

local r = tweak_data.levels.ai_groups.russia --LevelsTweakData.LevelType.Russia
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local m = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater
local z = tweak_data.levels.ai_groups.zombie --LevelsTweakData.LevelType.Zombie
local f = tweak_data.levels.ai_groups.federales
local ai_type = tweak_data.levels:get_ai_group_type()

if ai_type == r then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "ИДЁТ ШТУРМ НАЁМНИКОВ",
			["hud_assault_cover"] = "ОСТАВАЙТЕСЬ В УКРЫТИИ",
			["hud_assault_alpha"] = "ШTУPM HAЁMHИKOB"
		})
	end)
elseif ai_type == z then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Pciloe Asuaslt in Prergoss",
			["hud_assault_cover"] = "STYA IN COVRE...FLESH",
			["hud_assault_alpha"] = "PCILOE ASUASLT"
		})
	end)
elseif ai_type == f then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Asalto Federal En Marcha",
			["hud_assault_cover"] = "MANTENTE A CUBIERTO",
			["hud_assault_alpha"] = "ASALTO FEDERAL"
		})
	end)
elseif ai_type == m and difficulty_index <= 7 then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Murkywater Assault in Progress",
			["hud_assault_alpha"] = "MURKYWATER ASSAULT"
		})
	end)
elseif ai_type == m then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "OMNIA Incursion Underway",
			["hud_assault_alpha"] = "OMNIA INCURSION"
		})
	end)
end

 if _G.HopLib then
	local ai_type = tweak_data.levels:get_ai_group_type()
	local murkywetew = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater
	local lapd = tweak_data.levels.ai_groups.lapd
	local mex = tweak_data.levels.ai_groups.federales
	local akan = tweak_data.levels.ai_groups.russia

	Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat", function(loc)
		loc:load_localization_file(ModPath .. "lua/sc/loc/hoplibkillfeedcompat.json")
	end)

	if ai_type == murkywetew then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_murkywetew", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/murkywetew.json")
		end)
	elseif ai_type == lapd then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_LAPD", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/lapd.json")
		end)	
	elseif ai_type == mex then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_mex", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/mex.json")		
		end)
	elseif ai_type == akan then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_akan", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/akan.json")		
		end)	
	end
 end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_toggle_one_down"] = "Pro-Job",
		["menu_one_down"] = "Pro-Job",
		["menu_es_pro_job_bonus"] = "Pro-Job",

		["menu_asset_lock_additional_assets_pro"] = "NOT AVAILABLE IN PRO-JOBS!",

		["cn_menu_contract_daypay_header"] = "Day Rate:",
		["cn_menu_contract_jobpay_header"] = "Contract Pay:",
		["victory_stage_cash_summary_name_job"] = "You earned $stage_cash on your contract day rate and an additional $job_cash for completing the contract.",

		["debug_interact_grenade_crate_take_grenades"] = "HOLD $BTN_INTERACT TO REFILL YOUR THROWABLES",
		["debug_interact_bodybags_bag_take_bodybag"] = "HOLD $BTN_INTERACT TO REFILL YOUR BODY BAGS",

		["menu_equipment_armor_kit"] = "Throwable Case",
		["bm_equipment_armor_kit"] = "Throwable Case",
		["debug_equipment_armor_kit"] = "Throwable Case",
		["bm_equipment_armor_kit_desc"] = "To use the throwable case, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved, but it can be used by you and your crew by holding $BTN_INTERACT to refill your throwables. It can only be used three times.\n\nYou can see how many uses are left by looking into the case.\n\nThe Throwable Case is a concealable case, usually used by a soldier or mercenary to carry specialized weaponry when the heat comes.",

		["bm_equipment_ecm_jammer_desc"] = "To use the ECM Jammer, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved and it will be active for 10 seconds.\n\nYou can toggle the ECM Jammer's feedback ability by interacting with it. The feedback will have a chance to incapacitate your enemies within a 25 meter radius. Feedback lasts for 10 seconds and will recharge after 4 minutes.\n\nECM jammers can open ATM machines and temporarily cancel out electronic devices such as cell phones, cameras, and other detection systems easing your way towards your goal.",
		["bm_equipment_first_aid_kit_desc"] = "To use the first aid kit, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved, but it can be used by you and your crew by holding $BTN_INTERACT to regain 150 health. First aid kits can only be used once.\n\nThe first aid kit is a collection of supplies and equipment for use in rapidly giving first aid in emergency situations.",
		["bm_equipment_doctor_bag_desc"] = "To use the doctor bag, you need to place it by holding $BTN_USE_ITEM. Once placed it cannot be moved, but it can be used by you and your crew by holding $BTN_INTERACT to regain 20% of their maximum health and 4% maximum health every 4 seconds for 3 minutes. Doctor bags can be used twice.\n\nThe doctor dag is a portable bag, usually used by a physician or other medical professional to transport medical supplies and medicine.",
		["bm_equipment_sentry_gun_desc"] = "To use the sentry gun, you need to place it by holding $BTN_USE_ITEM. Upon deployment it will use 40% of your maximum ammo. Upon taking too much damage, it will shut off. While in this state, interacting with it by holding $BTN_INTERACT will place it into an automatic repair mode. Picking up sentries will refund their remaining ammo and repair them. Sentry guns terrify civilians, forcing them to the ground.\n\nThe Sentry Gun automatically aims and fires at targets that are detected by its sensors. It's commonly used as a distraction, drawing attention away from you and your team.",
		["bm_equipment_sentry_gun_silent_desc"] = "To use the sentry gun, you need to place it by holding $BTN_USE_ITEM. Upon deployment it will use 40% of your maximum ammo. Upon taking too much damage, it will shut off. While in this state, interacting with it by holding $BTN_INTERACT will place it into an automatic repair mode. Picking up sentries will refund their remaining ammo and repair them. Sentry guns terrify civilians, forcing them to the ground.\n\nThe Suppressed Sentry Gun is the counterpart to the regular, louder Sentry Gun as it's more used to take out enemies than a classic distraction.",

		["hud_int_hold_take_pardons"] = "PRESS $BTN_INTERACT TO TAKE THE PARDON",
		["debug_interact_gage_assignment_take"] = "PRESS $BTN_INTERACT TO PICK UP THE PACKAGE",

		["far_repair_sentry_macro"] = "Sentry critically damaged, repairs needed.",
		["fixing_sentry_macro"] = "Repair progress: $AMMO_LEFT%",
		--Are concatenated to the related button prompts. Using Macros results in controller prompts at the wrong times.
		["repair_sentry_macro"] = " to start sentry auto-repair sequence",
		["pickup_sentry_macro"] = " to retrieve sentry.\n$AMMO_LEFT ammo left. ", --Gets % health remaining appended to the end.
		["firemode_sentry_macro"] = " to change fire modes.\n$AMMO_LEFT ammo left.",
		["hud_interact_pickup_sentry_gun"] = "$AMMO_LEFT", --$AMMO_LEFT macro is a dummy macro to be replaced with desired string, since changing interaction objects is slightly cursed.
		["hud_interact_sentry_gun_switch_fire_mode"] = "$AMMO_LEFT",
		["hud_repair_sentry"] = "$AMMO_LEFT",
		["hud_action_repair_sentry"] = "Repairing sentry...",

		--More fitting descriptions of difficulties--
		["menu_risk_elite"] = "DEATH WISH. FOR YOU, ACTION IS THE JUICE.",
		["menu_risk_sm_wish"] = "DEATH SENTENCE. NOW SHOW THEM THAT YOU CAN'T BE STOPPED.",

		--Loading Hints--
		--Restoration Gameplay Hints--
		["loading_gameplay_res_title"] = "Restoration Gameplay Tips",
		["loading_gameplay_res_1"] = "Cloakers make a 'wheezing' sound when aggressive towards heisters. Use this to locate them.",
		["loading_gameplay_res_2"] = "Cloakers no longer make an ambient humming sound or screech when charging. Pay attention to your surroundings, as their goggles are now always lit up.",
		["loading_gameplay_res_3"] = "On Death Sentence, enemies may prioritize you if you reload. Make sure that you're in good cover or far from enemies. It might be better to swap weapons sometimes, especially if using a pistol as your secondary.",
		["loading_gameplay_res_4"] = "Tasers no longer reload your weapons. Try to stay topped up when possible, or switch to a secondary if you're about to be tased.",
		["loading_gameplay_res_5"] = "Cloakers will actively go after lone heisters, stick together or go to jail alone.",
		["loading_gameplay_res_6"] = "Cloakers deal direct health damage when they kick you. This can be reduced with Deflection or the Counter Strike skill.",
		["loading_gameplay_res_7"] = "Green Bulldozers will attempt to flank players and will run in, unload, and then run away. Be careful not to get overwhelmed or surprised.",
		["loading_gameplay_res_8"] = "Saiga/Black Bulldozers are hyper-aggressive and will charge at the player. This makes them easy to predict, but highly dangerous if you aren't prepared.",
		["loading_gameplay_res_9"] = "LMG Dozers/Skulldozers will attempt to provide covering fire for other units, but will still charge in various circumstances and have very high DPS.",
		["loading_gameplay_res_10"] = "Benelli Shotgunner Dozers replace Minigun Dozers. They only spawn in Crime Spree and alongside Captain Spring on Death Sentence. They are very, very dangerous.",
		["loading_gameplay_res_11"] = "All Dozers will prioritize targeting players who are reloading.",
		["loading_gameplay_res_12"] = "On Death Sentence, Bulldozers enter a berserker rage when their glass visors are broken, increasing their damage by 10%.",
		["loading_gameplay_res_13"] = "Cloakers perform their iconic screech when they are about to jump kick you, dodge to the side when you hear it.",
		["loading_gameplay_res_14"] = "Cloaker Jump Kicks will cuff you instead of down you.",
		["loading_gameplay_res_15"] = "Flashbangs cannot be broken on Death Sentence. Your opinion, my choice.",
		["loading_gameplay_res_16"] = "You can parry melee attacks by charging your own. This can be upgraded to work against cloaker kicks.",
		["loading_gameplay_res_17"] = "Enemy melee attacks are vastly more effective than before. Don't expect to simply walk past a horde.",
		["loading_gameplay_res_18"] = "You know what's better than smacking enemies with a baseball bat? Smacking them in the head with a baseball bat for headshot damage.",
		["loading_gameplay_res_19"] = "Snipers take a brief period of time to focus before firing. You'll know when you are being focused if all of your audio begins to fade away.",
		["loading_gameplay_res_20"] = "Your Jokers aren't safe from being kicked by Cloakers.",
		["loading_gameplay_res_21"] = "Regular enemies will come at you wielding a variety of weapons. You can tell who is carrying what by watching for details in their uniforms.",
		["loading_gameplay_res_22"] = "Shotgun-wielding enemies are deadly. Up close, they may take you down in two shots if you don't have much armor. However, they have very limited range.",
		["loading_gameplay_res_23"] = "Enemies try to hide behind Shields on higher difficulties.",
		["loading_gameplay_res_24"] = "Enemies will behave significantly smarter and are less predictable on higher difficulties.",
		["loading_gameplay_res_25"] = "Death Sentence difficulty has gone through a full design overhaul from vanilla to make it harder and meaner without being unfair. Check the Guide.",
		["loading_gameplay_res_26"] = "Pro Jobs forbid you from buying generic assets before the heist (such as the Medic Bag, Ammo Bag or the Body Bag Case), toggle friendly fire on (even with your bots) and may trigger a PONR in the final stretch of the mission with special Bravo enemies joining the ranks.",
		["loading_gameplay_res_27"] = "Restoration Mod provides different factions, such as Murkywater mercenaries and enforcers from other states. They function the same, but add a nice flavor to heists that canonically take place away from Washington DC.",
		["loading_gameplay_res_28"] = "Cloakers will throw smoke grenades at you before charging.",
		--New Units Hints
		["loading_new_units_res_title"] = "Restoration Unit Tips",
		["loading_new_units_res_1"] = "Titan HRTs are lightning-fast units that will free hostages and steal loot before you know they were there. Also, they will drop a tear gas grenade when killed without a Headshot or melee.",
		["loading_new_units_res_2"] = "LPFs are weak to melee.",
		["loading_new_units_res_3"] = "Lighter units will be Overhealed by the LPF. Overhealed enemies are outlined in purple. Overhealed units will always survive at least one shot.",
		["loading_new_units_res_4"] = "Titan Cloakers have advanced cloaking gear that renders them nearly invisible, but it still has the ambient hum of older models of standard Cloaker gear. Listen for them.",
		["loading_new_units_res_5"] = "Titan Dozers will actively attempt to avoid direct combat whenever possible and lay suppressive fire on you from a safe distance.",
		["loading_new_units_res_6"] = "Titan Snipers trade damage-per-shot and armor-piercing from their standard counterparts for a higher rate of fire and being able to shoot while moving.",
		["loading_new_units_res_7"] = "Instead of using a laser sight, Titan Sniper shots leave behind purple tracers. Use these to track them down.",
		["loading_new_units_res_8"] = "Titan Shields can only be pierced with the Thanatos, OVE9000 Saw when using Rip and Tear basic, and special AP rounds in Sentry Guns.",
		["loading_new_units_res_9"] = "Captain Spring and Titan Dozers take bonus headshot damage at all times.",
		["loading_new_units_res_10"] = "Titan Tasers fire electric rounds that severely restrict your movement temporarily. Your screen will glow blue when shot by one.",
		["loading_new_units_res_11"] = "Veteran Cops have quick reflexes that limit how much damage any given shot can deal. They cannot dodge melee, fire, or explosives. Alternatively, pick something with a high rate of fire and lower damage.",
		["loading_new_units_res_12"] = "Veteran Cops physically dodge and jump all over the place to make themselves harder to hit. They also drop smoke grenades frequently.",
		["loading_new_units_res_13"] = "Titan SWAT are lightly resistant to melee, but it still works well as a finisher.",
		["loading_new_units_res_14"] = "Titan SWAT cannot be taken hostage or converted to fight on your side.",
		["loading_new_units_res_15"] = "Titan SWAT boast LMGs and automatic shotguns. They are a major threat to your well-being.",
		["loading_new_units_res_16"] = "The dreaded Bravo units spawn on Pro Jobs only, when a PONR is triggered. They are powerful no-nonsense enemies with enhanced body armor, and more powerful weapons.",
		["loading_new_units_res_17"] = "Bravo units can throw frag grenades. Look for the flashers and listen for the beep.",
		["loading_new_units_res_18"] = "AKAN fields their own Titan units, which look different but behave the same way. Their overall color scheme and visual characteristics are the same, though, so that they may be easily identified.",
		["loading_new_units_res_19"] = "The Grenadier launches tear gas grenades at range with his underbarrel attachment, damaging players that stand in the cloud. On Death Sentence he instead comes armed with deadlier, stamina-draining nerve gas grenades.",
		--Captain Hints
		["loading_captains_res_title"] = "Restoration Captain Tips",
		["loading_captains_res_1"] = "To take Captain Summers down, target his crew first starting with Doc. He's unkillable until his entire crew is dead, and the other two are nearly invulnerable until Doc is dead.",		
		["loading_captains_res_2"] = "Don't hug Captain Summers. He WILL melt you with his flamethrower, and he has a Buzzer that he will electrocute you with.",		
		["loading_captains_res_3"] = "Captain Spring can take a ton of damage but will eventually go down. Watch for his grenades and try to lead him around, as he's very slow.",	
		["loading_captains_res_4"] = "Captain Spring throws Cluster HE grenades periodically. Don't stay close to him for long.",	
		["loading_captains_res_5"] = "Captain Spring may be dangerous, but he is incredibly slow and has poor range.",	
		["loading_captains_res_6"] = "Captain Autumn will loudly taunt when he attacks. Use this to locate him.",	
		["loading_captains_res_7"] = "Unlike other Captains, the police will not announce Autumn's arrival, as to not ruin the element of surprise.",	
		["loading_captains_res_8"] = "Captain Autumn will progressively disable your deployables if he's allowed to stay undetected in the map for a while. Disabled deployables are outlined in purple and can only be restored if Autumn is found and defeated.",	
		["loading_captains_res_9"] = "You will probably not beat Captain Autumn in a fist fight. Don't even try.",	
		["loading_captains_res_10"] = "Captain Winters is nearly immune to explosives and fire, and has strong bullet resistance, but is somewhat vulnerable to melee.",	
		["loading_captains_res_11"] = "Captain Winters' shield is completely unpierceable.",	
		["loading_captains_res_12"] = "Captain Winters has been overhauled. He now wanders around the map healing enemies in a large area around him while aggressively charging when the opportunity arises.",	
		--Stealth Hints
		["loading_stealth_res_title"] = "Restoration Stealth Tips",
		["loading_stealth_res_1"] = "Guards will no longer be instantly alerted by seeing broken cameras. A specific guard will be made to inspect the camera, allowing it to be used as a lure.",	
		["loading_stealth_res_2"] = "Killing unalerted guards with melee or taking them hostage will not set off a pager. Melee killing a guard a split second after he was alerted will still prevent the pager from being set off.",	
		["loading_stealth_res_3"] = "Melee killing unalerted guards or taking them hostage will still trigger guard replacements and map events.",	
		["loading_stealth_res_4"] = "Guards with no pagers do not increase suspicion when killed.",	
		["loading_stealth_res_5"] = "All loud weapons in stealth have a fixed 25 meter noise radius.",	
		["loading_stealth_res_6"] = "Civilians will get down in response to gunfire in both loud and stealth.",	
		["loading_stealth_res_7"] = "Sentry Guns will pacify any civilians in a notable radius around them.",	
		["loading_stealth_res_8"] = "While carrying any bag, you can be seen from much farther away, and will also be detected much faster while standing, sprinting, or jumping. Stay low and slow.",	
		["loading_stealth_res_9"] = "You get up to 4 ECMs instead of 2 like in vanilla, but they have half duration. Make sure to use them for objectives.",	
		["loading_stealth_res_10"] = "Suppressed weapons generate no noise in stealth.",	
		["loading_stealth_res_11"] = "You can take up to 4 cops hostage in stealth, just like in loud. This will NOT activate their pager or increase suspicion, but will if you later kill them.",	
		["loading_stealth_res_12"] = "Most instant fail states for stealth (such as alerted cameras, or exceeding the maximum level of pagers) have been removed or severely toned down. Check the Guide for more detailed information.",	
		["loading_stealth_res_13"] = "Guards will no longer instantly die from any source of damage while unalerted. Aim for the head, and bring something more damaging than your fists.",	
		["loading_stealth_res_14"] = "When the suspicion meter is full, you have 60 seconds to finish up what you started before the alarm is raised.",	
		["loading_stealth_res_15"] = "The higher the suspicion meter is, the easier it is to be detected by guards.",	
		["loading_stealth_res_16"] = "You can carry more body bags with you than in the base game, and even more so if you are playing solo.",	
		["loading_stealth_res_17"] = "In Crime.net Offline Mode, you will be given extra cable ties to make up for missing players. The amount still increases if you have the right skills.",	
		["loading_stealth_res_18"] = "Guards killed by gunfire will set off their pagers. While pagers going off doesn't increase suspicion, ignoring them certainly will.",	
		["loading_stealth_res_19"] = "Pager operators are less lenient on higher difficulties. Your last pager is indicated by the use of a special voice line.",	
		["loading_stealth_res_20"] = "Answering pagers beyond your allowed limit massively increases suspicion, but not as much as dropping or not answering.",	
		["loading_stealth_res_21"] = "Pagers take longer to answer and expire faster on the ground on higher difficulties.",	
		--Equipment/Skill Hints
		["loading_equip_skills_res_title"] = "Restoration Equipment/Skill Tips",
		["loading_equip_skills_res_1"] = "Shotguns lose range as their accuracy gets lower, experiment and see what works best! Be careful not to leave yourself unable to deal with snipers, though; consider a non-shotgun secondary.",	
		["loading_equip_skills_res_2"] = "Pistols are very fast to swap to and are generally accurate and stable. They work very well as backup weapons if you aren't specialized in something else.",	
		["loading_equip_skills_res_3"] = "Weapons in Restoration fall under a variety of classes with different pros and cons. Higher damage weapons may kill enemies faster, but they may run dry on you before you know it!",	
		["loading_equip_skills_res_4"] = "Higher-damage weapons are generally less concealable unless they have significant downsides, such as Accuracy or Rate of Fire.",	
		["loading_equip_skills_res_5"] = "Wolf has upgraded our Sentry Guns to allow field repairs. It takes some time, but they will automatically repair once you initiate it.",	
		["loading_equip_skills_res_6"] = "If you have Sentry AP rounds unlocked, you can choose your default ammo type in the Equipment menu.",	
		["loading_equip_skills_res_7"] = "Perk Decks give significant damage bonuses and many of them provide rare and precious healing abilities. Make sure not to neglect upgrading them if you want to play higher difficulties.",	
		["loading_equip_skills_res_8"] = "Crew Chief, Armorer, Muscle, Crook, Gambler, and Biker are basic but consistent perk decks. They're great first choices for a perk deck to build into.",	
		["loading_equip_skills_res_9"] = "Hitman has been reworked into a low long-term survivability and consistency perk deck, but in exchange allows you to gain huge stores of 'Temporary HP' to power through tough spots.",	
		["loading_equip_skills_res_10"] = "Crew Chief is a team-focused perk deck that grants small but useful buffs to you and your teammates and more buffs if you have multiple hostages. It pairs well with The Controller tree in Mastermind.",	
		["loading_equip_skills_res_11"] = "Gambler is a team-focused perk deck that grants a little HP and bonus ammo to teammates when you pick ammo up. Pairs well with skills that grant extra ammo drops.",	
		["loading_equip_skills_res_12"] = "Maniac is a fast team-focused perk deck that reduces incoming damage for you and teammates as long as you keep up consistent killing. Pairs well with high-damage-output builds and builds with Damage Resist.",	
		["loading_equip_skills_res_13"] = "Hacker's Pocket ECM provides team wide healing and powerful crowd control, but takes a long time to recharge. It is also effective in stealth.",	
		["loading_equip_skills_res_14"] = "Burglar is a perk deck that provides small bonuses to Stealth in exchange for being a bit weaker than other decks in Loud.",	
		["loading_equip_skills_res_15"] = "Kingpin is a versatile perk deck. The injector can be used for self sustain, surviving heavy damage, or drawing fire away from your team.",	
		["loading_equip_skills_res_16"] = "Tag Team is a team-focused perk deck that allows you to provide a lot of healing to a specific teammate as long as the two of you keep up consistent killing.",	
		["loading_equip_skills_res_17"] = "Bullets that pierce shields deal half damage.",	
		["loading_equip_skills_res_18"] = "The Peacemaker and Phoenix .500 Revolvers are able to pierce like a sniper rifle.",
		["loading_equip_skills_res_19"] = "If you have a blue meter on the side of your screen, then you have dodge. When it's flashing, you will dodge the next bullet. Please refer to the Guide for an in-depth explanation of our dodge rework.",	
		["loading_equip_skills_res_20"] = "The higher a weapon's concealment is, the faster you can draw and holster it.",	
		["loading_equip_skills_res_21"] = "The Chainsaw and Kazaguruma deal damage to enemies in front of you while held.",	
		["loading_equip_skills_res_22"] = "The Butterfly Knife and Switchblade deal massive damage when stabbing enemies in the back.",	
		["loading_equip_skills_res_23"] = "The Icepick and Gold Fever do increased headshot damage in exchange for poor speed.",	
		["loading_equip_skills_res_24"] = "Poison deals only moderate damage, but induces vomiting which interrupts other actions.",	
		["loading_equip_skills_res_25"] = "Stun Grenades provide very potent disruption, even against bulldozers.",	
		["loading_equip_skills_res_26"] = "Aiming down sights grants significantly increased accuracy and reduced recoil, even with LMGs.",	
		["loading_equip_skills_res_27"] = "The Pounder Nailgun melee weapon has an incredibly long range, far longer than any other melee weapon.",	
		["loading_equip_skills_res_28"] = "Leveling up perk decks unlocks the Throwables Case.",
		["loading_equip_skills_res_29"] = "Replenishing your throwables in the Equipment Case now refills your entire stock with each use.",	
		["loading_equip_skills_res_30"] = "Save Inspire ace for when things have really gone sideways, it has a very long cooldown and requires line of sight.",	
		["loading_equip_skills_res_31"] = "Restoration Mod adds two new Perk Decks (Wildcard and Blank) which provide only the common perks and no perks whatsoever, respectively. They are meant for self-imposed challenges.",
		--Misc Hints
		["loading_misc_res_title"] = "Restoration Miscellaneous Tips",
		["loading_misc_res_1"] = "Try our Custom Heists as well! You can find most of them under the 'Jackal' Contractor, as well as 'Doghouse' under Vlad.",	
		["loading_misc_res_2"] = "Restoration Mod has a Steam Guide! This should be your resource for more detailed information. Check the Main Menu.",	
		["loading_misc_res_3"] = "Restoration Mod has a Discord server! Join for discussion, balance feedback, and matchmaking! Check the Main Menu.",	
		--Trivia Hints
		["loading_fluff_res_title"] = "Restoration Trivia",
		["loading_fluff_res_1"] = "OMNIA spends a fortune reviving failed weapon projects.",	
		["loading_fluff_res_2"] = "The LPF is owed a lot of beers.",	
		["loading_fluff_res_3"] = "The LPF and Titan Sniper are Australian.",	
		["loading_fluff_res_4"] = "The NYPD Bronco Cop loves donuts.",	
		["loading_fluff_res_5"] = "The ZEAL UMP Elite SWAT's name is Chad.",	
		["loading_fluff_res_6"] = "Titan Dozers have glowing eyes thanks to extensive genetic engineering, human experiments, and combat drugs.",	
		["loading_fluff_res_7"] = "Captain Spring is not human. He might have been, once upon a time.",	
		["loading_fluff_res_8"] = "Restoration Mod is often nicknamed 'resmod', 'SCmod', 'furry mod' and 'mememod', by various members of the community and the dev team.",	
		["loading_fluff_res_9"] = "OMNIA has been developing reinforced security doors to protect against dinosaur attacks.",	
		["loading_fluff_res_10"] = "The Grenadier used to work in pest control.",	
		["loading_fluff_res_11"] = "You have never seen a Titan Cloaker.",
		["loading_fluff_res_12"] = "Omnia is a self-described 'neoceltic pagan folk' band based in the Netherlands and whose members have had Irish, Dutch, Cornish, Belgian, Indonesian and Persian backgrounds. Connection to the organization OMNIA unconfirmed.",	
		["loading_fluff_res_13"] = "Whatever happened that caused Jackal to get involved with Crime.Net and leave GenSec, he refuses to talk about it. He seems to have been 'disturbed' by the event.",	
		["loading_fluff_res_14"] = "HAHAHAHAHA.",
		["loading_fluff_res_15"] = "Captain Summers and his crew used to be a crew of four heisters, much like a multinational equivalent of the Payday Crew. They are now a strike team for OMNIA.",
		["loading_fluff_res_16"] = "Captain Summers and his crew officially died in a building collapse while trying to rob a bank. This was a ruse.",
		["loading_fluff_res_17"] = "Captain Autumn spends a fortune on handcuffs.",
		["loading_fluff_res_18"] = "Captain Summers spends a fortune on gas gas gas.",
		["loading_fluff_res_19"] = "Captain Spring spends a fortune on bullets and grenades.",
		["loading_fluff_res_20"] = "Captain Winters spends a fortune on shields and duct tape.",
		["loading_fluff_res_21"] = "The Grenadier division spends a fortune on Diphoterine due to several friendly fire incidents.",
		["loading_fluff_res_22"] = "You may or may not have met Captain Summers before.",
		["loading_fluff_res_23"] = "The Policía Federal has a special chupacabra hunting division.",
		["loading_fluff_res_24"] = "Captains don't die, they go into custody.",
		["loading_fluff_res_25"] = "REAPER offered a 'quick and brutal crackdown on cartels' at a price cheaper than OMNIA, which led to the Policía Federal adopting their version of TITAN units. This was a ploy to get their forces closer to OMNIA and Murky operations both in Mexico and the US.",

		["menu_button_deploy_bipod"] = "BIPOD/ALT-FIRE",
		["skill_stockholm_syndrome_trade"] = "Down Restored!",
		["hint_short_max_pagers"] = "Neglecting pagers will significantly increase guard suspicion.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "As a new arrival to the criminal elite, the first order of business is for you to get gear and fanfare befitting someone of your status.\n\nBONUSES:\nYour infamous base drop rate is increased from ##0.3%## to ##0.6%##\nExperience gained is increased by ##5%##.",

		--Renaming some of the skill subtrees--
		["st_menu_mastermind_single_shot"] = "Assault",
		["st_menu_enforcer_armor"] = "Juggernaut",
		["st_menu_enforcer_ammo"] = "Support",
		["st_menu_technician_auto"] = "Combat Engineer",
		["st_menu_technician_breaching"] = "Breacher",
		["st_menu_technician_sentry"] = "Fortress",
		["hud_instruct_mask_on"] = "Press $BTN_USE_ITEM To put on Mask",
		["hud_instruct_mask_on_alpha"] = "Press $BTN_USE_ITEM to put on your mask",

		--Default Suit String
		["bm_suit_none_desc"] = "This is the heister's default outfit with the selected armor. Will automatically change from the Two-piece Suit depending on the selected heist!",

		-- Ad Banner Change
		["menu_changelog"] = "Latest Changelog",
		["menu_discord"] = "Discord Server",
		["menu_guide"] = "Overhaul Guide",
		["menu_captains"] = "Information on Captains",
		["menu_content_updates"] = "Guide/Support",
		["menu_content_updates_previous"] = "",

		--Mutators
		["menu_mutators_achievement_disabled"] = "Mutators that reduce Experience and Money gained will also disable the earning of achievements, most trophies, and level completions!",

		--Enemy Replacers
		["mutator_specials_override_boom"] = "Grenadiers",

		["mutator_medidozer_longdesc"] = "All normal enemies during assault waves are replaced with Medics, and all special units are replaced with Bulldozers.",
		["mutator_medicdozers"] = "Medic Dozers",
		["mutator_medicdozers_desc"] = "Medic Dozers can now spawn.",
		["mutator_medicdozers_longdesc"] = "Whenever a Bulldozer of any variety spawns, there is a 50% chance that it will be replaced by a Medic Bulldozer. \n\nNote: If the Semi-Auto Shotgun Bulldozer mutator is enabled, then the Medic Dozer will have a 33.3% chance of replacing a Black Bulldozer.",

		["mutator_notitans"] = "Budget Cuts",
		["mutator_notitans_desc"] = "Disables Titan Units.",
		["mutator_notitans_longdesc"] = "All spawn instances of Titan Units are disabled.",

		["mutator_mememanonly"] = "HAHAHA, FOOLED YOU GUYS!",
		["mutator_mememanonly_desc"] = "SUFFERING",
		["mutator_mememanonly_longdesc"] = "CANTRUNNOESCAPEHELPHELPHELP\n\n WARNING: This mutator may cause crashes on some maps.",

		["MutatorMoreDonutsPlus"] = "More Donuts+",
		["MutatorMoreDonutsPlus_desc"] = "All common enemies replaced by NYPD Bronco Cops, and all specials are replaced by OMNIA LPFs.",
		["MutatorMoreDonutsPlus_longdesc"] = "All common enemies are replaced by NYPD Bronco Cops, and all specials are replaced with OMNIA LPFs. \n\nWARNING: By enabling this mutator, you are committing an atrocity.",

		["MutatorJungleInferno"] = "Jungle Inferno",
		["MutatorJungleInferno_desc"] = "All enemies are replaced by Captain Summers.",
		["MutatorJungleInferno_longdesc"] = "All non-scripted spawn enemies are replaced by clones of Captain Summers.",

		["mutator_minidozers"] = "Semi-Auto Shotgun Bulldozers",
		["mutator_minidozers_desc"] = "Semi-Auto Shotgun Bulldozers can now spawn.",
		["mutator_minidozers_longdesc"] = "Whenever a Black Bulldozer spawns, there is a 50% chance that it will be replaced by a Bulldozer wielding an M1014.\n\nNote: If the Medic Bulldozer mutator is enabled, then the Semi-Auto Shotgun Bulldozer will have a 33.3% chance of replacing a Black Bulldozer.",

		["mutator_fatroll"] = "Fat Roll",
		["mutator_fatroll_desc"] = "Damage Grace disabled.",
		["mutator_fatroll_longdesc"] = "Damage grace on players and AI crew members is set to 0, meaning that there is no delay on instances of damage.",

		["mutator_zombie_outbreak"] = "The Dead Walking",
		["mutator_zombie_outbreak_desc"] = "Replaces all enemies with Zombie units",
		["mutator_zombie_outbreak_longdesc"] = "The dead have risen! Replaces all enemies with Zombie units",

		["mutator_faction_override"] = "Enemy Faction Override",
		["mutator_faction_override_desc"] = "",
		["mutator_faction_override_longdesc"] = "",
		["mutator_faction_override_"] = "",
		["mutator_faction_override_select"] = "",
		["mutator_faction_override_america"] = "America",
		["mutator_faction_override_russia"] = "Russia",
		["mutator_faction_override_zombie"] = "Zombie",
		["mutator_faction_override_murkywater"] = "MurkyWater",
		["mutator_faction_override_nypd"] = "NYPD",
		["mutator_faction_override_lapd"] = "LAPD",
		["faction_selector_choice"] = "Faction: ",

		--Crime spree modifier changes
		["cn_crime_spree_brief"] = "A Crime Spree is an endless series of randomly selected heists, executed in succession. With each heist you complete, your Rank and Reward will increase! Each 20th or 26th rank you will need to choose a modifier and each 100th rank there is an increase to the risk level, that will make the next heists harder to complete. After risk level 600, the amount of i-frames that player have starts to decrease and bravo units begin to spawn normally.\n\n##If you invite your crew, make sure they started their own Crime Spree before joining in order to gain ranks and Rewards as well.##",
		["menu_cs_next_modifier_forced"] = "",
		["menu_cs_modifier_dozers"] = "One additional Bulldozer is allowed into the level.",
		["menu_cs_modifier_medics"] = "One additional Medic is allowed into the level.",
		["menu_cs_modifier_no_hurt"] = "Enemies are 50% resistant to knock down.",
		["menu_cs_modifier_dozer_immune"] = "Bulldozers take 50% less explosive damage.",
		["menu_cs_modifier_bravos"] = "Enemies have an additional 6.667% chance to become Bravo Units.",
		["menu_cs_modifier_grace"] = "Your damage grace period is reduced by a 60th of a second.",
		["menu_cs_modifier_letstrygas"] = "Smoke Grenades are now replaced with Tear Gas.",
		["menu_cs_modifier_boomboom"] = "Grenadiers now explode on death.",
		["menu_cs_modifier_friendlyfire"] = "Teammates now take 100% friendly fire damage.",
		["menu_cs_modifier_dodgethis"] = "Veteran Cops now dodge all bullets.",
		["menu_cs_modifier_sniper_aim"] = "Snipers now aim their rifles 100% faster.",
		["menu_cs_modifier_health_damage_total"] = "",
		["menu_cs_modifier_heavies"] = "All rifle SWAT units have an additional 15% chance to become an elite UMP unit.",
		["menu_cs_modifier_heavy_sniper"] = "Titan Snipers and Bravo Sharpshooters will now fire their rifles on full auto at close range.",
		["menu_cs_modifier_dozer_medic"] = "Whenever a Bulldozer spawns, there is a chance that it will be a Medic Bulldozer. A Medic Bulldozer counts as both a Medic and a Bulldozer.",
		["menu_cs_modifier_dozer_minigun"] = "Whenever a Green or Black Bulldozer spawns, there is a chance that it will be replaced by a Bulldozer wielding an M1014.",
		["menu_cs_modifier_shield_phalanx"] = "All regular Shield units have an additional 15% chance to become a Titan Shield.",
		["menu_cs_modifier_taser_overcharge"] = "The tasing knockout effect of the Taser is no longer delayed.",
		["menu_cs_modifier_dozer_rage"] = "When a Bulldozer's faceplate is destroyed, the Bulldozer enters a berserker rage, receiving a 10% increase to their base damage output.",
		["menu_cs_modifier_medic_adrenaline"] = "All Medic units have an additional 15% chance to become an OMNIA LPF.",
		["menu_cs_modifier_cloaker_arrest"] = "Cloaker melee strikes will now cuff players.",
		["menu_cs_modifier_cloaker_smoke"] = "Cloakers will now have a 50% chance to drop a flashbang when they dodge.",
		["menu_cs_modifier_cloaker_tear_gas"] = "All HRT units have an additional 15% chance to become a Titan HRT.",
		["menu_cs_modifier_dozer_lmg"] = "Whenever a Green or Black Bulldozer spawns, there is a chance that it will be replaced by a Skulldozer.",
		["menu_cs_modifier_10secondsresponsetime"] = "All police assaults now start at maximum intensity.",

		["bm_menu_skill"] = "Crew Boosts",

		["menu_crew_interact"] = "Quick",
		["menu_crew_interact_desc"] = "Players interact 15% faster per AI controlled crew member.",

		["menu_crew_inspire"] = "Inspiring",
		["menu_crew_inspire_desc"] = "Bots equipped with this ability can now use the Inspire aced ability.\n\nThey cannot do this more than once every 90 seconds. Cooldown is reduced by 15 seconds per AI controlled crew member.",

		["menu_crew_scavenge"] = "Sharpeyed",
		["menu_crew_scavenge_desc"] = "Players ammo pickup is increased by 10% per AI controlled crew member.",

		["menu_crew_ai_ap_ammo"] = "Piercing",
		["menu_crew_ai_ap_ammo_desc"] = "Your team AI will now use armor piercing rounds that deal 25% more damage.\n\nThis enables them to shoot through body armor and knock down shields.",

		["menu_crew_healthy"] = "Reinforcer",
		["menu_crew_healthy_desc"] = "Players' health is increased by 30.",

		["menu_crew_sturdy"] = "Protector",
		["menu_crew_sturdy_desc"] = "Players' armor is increased by 10%.",

		["menu_crew_evasive"] = "Distractor",
		["menu_crew_evasive_desc"] = "Players' dodge meters are filled by 3% of their dodge every second.",

		["menu_crew_motivated"] = "Invigorator",
		["menu_crew_motivated_desc"] = "Players have 15 more stamina.",

		["menu_crew_regen"] = "Healer",
		["menu_crew_regen_desc"] = "Players heal 1 health every 4 seconds.",

		["menu_crew_quiet"] = "Concealer",
		["menu_crew_quiet_desc"] = "Players gain 2 more concealment.",

		["menu_crew_generous"] = "Stockpiler ",
		["menu_crew_generous_desc"] = "Players are granted an extra throwable for every 70 kills.",

		["menu_crew_eager"] = "Accelerator",
		["menu_crew_eager_desc"] = "Players reload 10% faster.",

--[[   SKILLTREES   ]]--
	--{

		--[[   MASTERMIND   ]]--
		--{
			--[[   MEDIC SUBTREE   ]]--
			--{

			--Combat Medic
			["menu_combat_medic_beta_sc"] = "Combat Medic",
			["menu_combat_medic_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##10%## damage reduction for ##5## seconds both after and during reviving another player.\n\nACE: ##$pro##\nReviving a crew member gives them ##30%## more health.",

			--Quick Fix
			["menu_tea_time_beta_sc"] = "Quick Fix",
			["menu_tea_time_beta_desc_sc"] = "BASIC: ##$basic##\nDecreases your First Aid Kit and Doctor Bag deploy time by ##50%.##\n\nACE: ##$pro##\nCrew members that use your First Aid Kits take ##50%## less damage for ##5## seconds.",

			--Pain Killers
			["menu_fast_learner_beta_sc"] = "Painkillers",
			["menu_fast_learner_beta_desc_sc"] = "BASIC: ##$basic##\nCrew members you revive take ##25%## less damage for ##5## seconds.\n\nACE: ##$pro##\nThe damage reduction is increased by an additional ##25%.##",

			--Uppers
			["menu_tea_cookies_beta_sc"] = "Uppers",
			["menu_tea_cookies_beta_desc_sc"] = "BASIC: ##$basic##\nAdds ##3## more First Aid Kits to your inventory.\n\nACE: ##$pro##\nAdds ##3## more First Aid Kits to your inventory.\n\nYour deployed first aid kits will be automatically used if a player would go down within a ##5## meter radius of the first aid kit.\n\nThis cannot occur more than once every ##30## seconds individually for each player.\n\nNote: Does not apply to Swan Song.",

			--Combat Doctor
			["menu_medic_2x_beta_sc"] = "Combat Doctor",
			["menu_medic_2x_beta_desc_sc"] = "BASIC: ##$basic##\nYour doctor bags have ##1## more charge.\n\nACE: ##$pro##\nYou can now deploy ##2## Doctor Bags instead of just one.",

			--Inspire
			["menu_inspire_beta_sc"] = "Inspire",
			["menu_inspire_beta_desc_sc"] = "BASIC: ##$basic##\nYou revive crew members ##50%## faster.\n\nShouting at your teammates will increase their movement and reload speed by ##20%## for ##10## seconds.\n\nACE: ##$pro##\nYou can revive crew members with ##clear line of sight## at a distance of ##9 meters## by shouting at them. This cannot occur more than once every ##90## seconds.",


			--}

			--[[   CONTROLLER SUBTREE   ]]--
			--{

			--Cable Guy
			["menu_triathlete_beta_sc"] = "Cable Guy",
			["menu_triathlete_beta_desc_sc"] = "BASIC: ##$basic##\nIncreases your supply of cable ties by ##4##.\n\nACE: ##$pro##\nYour chance to pick up cable ties from ammo boxes is increased to ##30%.##\n\nIncreases your maximum cable ties by ##3.##",

			--Clowns are Scary
			["menu_cable_guy_beta_sc"] = "Clowns are Scary",
			["menu_cable_guy_beta_desc_sc"] = "BASIC: ##$basic##\nCivilians remain intimidated ##50%## longer.\n\nACE: ##$pro##\nThe power and range of your intimidation is increased by ##50%.##",

			--Stockholm Syndrome
			["menu_joker_beta_sc"] = "Stockholm Syndrome",
			["menu_joker_beta_desc_sc"] = "BASIC: ##$basic##\nYour hostages will not flee when they have been rescued by law enforcers.\n\nACE: ##$pro##\nNearby civilians and jokers have a chance of reviving you if you interact with them, and have a chance of giving you ammo.",

			--Joker
			["menu_stockholm_syndrome_beta_sc"] = "Joker",
			["menu_stockholm_syndrome_beta_desc_sc"] = "BASIC: ##$basic##\nYou can convert a non-special enemy to fight on your side. This can not be done during stealth and enemies must surrender before you can convert them. You can only convert one enemy at a time.\n\nYour converted enemy takes ##60%## less damage.\n\nConverted enemies count as hostages for the purposes of skills and trading people out of custody.\n\nACE: ##$pro##\nYou can now have ##2## converted enemies at the same time.\n\nYour converted enemy takes an additional ##20%## less damage.",

			--Partners in Crime
			["menu_control_freak_beta_sc"] = "Partners in Crime",
			["menu_control_freak_beta_desc_sc"] = "BASIC: ##$basic##\nEach hostage increases your movement speed by ##3%##, up to ##4## times.\n\nACE: ##$pro##\nEach hostage increases your health by ##10%##, up to ##4## times.",

			--Hostage Taker
			["menu_black_marketeer_beta_sc"] = "Hostage Taker",
			["menu_black_marketeer_beta_desc_sc"] = "BASIC: ##$basic##\nYou regenerate ##1## health every ##4## seconds for each hostage up to ##4## times.\n\nACE: ##$pro##\nHealth regen from Hostage Taker is increased by ##100%## when you have ##4## or more hostages.\n\nIncoming damage is reduced by ##1## point for you and your crew for each hostage up to ##4## times.\n\nNote: Hostage Taker does not stack.",


			--}

			--[[   ASSAULT SUBTREE, FORMERLY SHARPSHOOTER   ]]--
			--{

			--Leadership
			["menu_stable_shot_beta_sc"] = "Leadership",
			["menu_stable_shot_beta_desc_sc"] = "BASIC: ##$basic##\nSMGs and LMGs gain ##4## stability.\n\nACE: ##$pro##\nYou and your crews' stability rating for all weapons is increased by ##4.##",

			--MG Handling
			["menu_scavenger_sc"] = "MG Handling",
			["menu_scavenger_desc_sc"] = "BASIC: ##$basic##\nTightens the hipfire accuracy of SMGs and LMGs by ##20%##\n\nACE: ##$pro##\nSMGs and LMGs reload ##25%## faster.",

			--MG Specialist
			["menu_sharpshooter_sc"] = "MG Specialist",
			["menu_sharpshooter_desc_sc"] = "BASIC: ##$basic##\nThe movement penalty to accuracy is reduced by ##60%## for SMGs and LMGs.\n\nThe movement penalty to accuracy is determined by stability.\n\nACE: ##$pro##\nSMGs and LMGs fire ##15%## faster.\n\nEvery ##5th## bullet fired by an SMG or LMG without releasing the trigger consumes no ammo.",

			--Shock and Awe
			["menu_spotter_teamwork_beta_sc"] = "Shock and Awe",
			["menu_spotter_teamwork_beta_desc_sc"] = "BASIC: ##$basic##\nYour weapons' magazine sizes are increased by ##20%.##\n\nNote: Does not apply to Crossbows, Bows, Grenade Launchers, or Rocket Launchers.\n\nACE: ##$pro##\nYour weapons can be hip-fired while sprinting and their sprint-to-fire delay is removed.\n\nYour weapons' magazine sizes are increased by an additional ##30%.##",

			--Heavy Impact
			["menu_speedy_reload_sc"] = "Heavy Impact",
			["menu_speedy_reload_desc_sc"] = "BASIC: ##$basic##\nSMGs and LMGs have a ##20%## chance to knock down enemies.\nThis chance is raised to ##40%## when using a bipod.\n\nNote: Stagger effects do not apply to Captains, Bulldozers, and Shields.\n\nACE: ##$pro##\nYou take ##12.5%## less damage while crouched.\nThe effect is raised to ##50%## when using a bipod.",

			--Body Expertise
			["menu_body_expertise_beta_sc"] = "Body Expertise",
			["menu_body_expertise_beta_desc_sc"] = "BASIC: ##$basic##\nYour bullets can ##now pierce body armor.##\n\nSMGs and LMGs fired in full auto apply ##30%## of the enemy's headshot damage multiplier to their body.\n\nNote: Does not apply to Bulldozers.\n\nACE: ##$pro##\nAll guns fired in full auto apply ##100%## of the enemy's headshot damage multiplier to their body.",

			--}
		--}

		--[[   ENFORCER   ]]--
		--{
			--[[   SHOTGUNNER SUBTREE   ]]--
			--{

			--Underdog--
			["menu_underdog_beta_sc"] = "Underdog",
			["menu_underdog_beta_desc_sc"] = "BASIC: ##$basic##\nWhen three or more enemies are within ##18## meters of you, you receive a ##10%## damage bonus that lasts for ##7## seconds.\n\nACE: ##$pro##\nWhen three or more enemies are within ##18## meters of you, you also receive a ##10%## damage reduction that lasts for ##7## seconds.",

			--Shotgun CQB
			["menu_shotgun_cqb_beta_sc"] = "Shotgun CQB",
			["menu_shotgun_cqb_beta_desc_sc"] = "BASIC: ##$basic##\nYour aim down sights and sprint-to-fire speeds for Shotguns and flamethrowers are ##20%## faster.\n\nACE: ##$pro##\nShotguns and flamethrowers reload ##25%## faster.",

			--Shotgun Impact
			["menu_shotgun_impact_beta_sc"] = "Shotgun Impact",
			["menu_shotgun_impact_beta_desc_sc"] = "BASIC: ##$basic##\nShotguns and flamethrowers gain ##4## stability.\n\nACE: ##$pro##\nShotguns fire ##3## extra pellets.\n\nNote: Does not apply to slugs or explosive rounds.",

			--Pigeon Shooting
			["menu_far_away_beta_sc"] = "Pigeon Shooter",
			["menu_far_away_beta_desc_sc"] = "BASIC: ##$basic##\nYou move ##60%## faster while aiming down sights.\n\nNOTE: Speed is capped to your current stance's max speed.\n\nACE: ##$pro##\nShotgun and flamethrower accuracy and range is increased by ##30%## while aiming down sights.",

			--Gung Ho
			["menu_close_by_beta_sc"] = "Gung-Ho",
			["menu_close_by_beta_desc_sc"] = "BASIC: ##$basic##\nShotguns and flamethrowers can be hip-fired while sprinting and their sprint-to-fire delay is removed.\n\nACE: ##$pro##\nYour rate of fire is increased by ##35%## while hip-firing with shotguns and flamethrowers.",

			--Overkill
			["menu_overkill_sc"] = "OVERKILL",
			["menu_overkill_desc_sc"] = "BASIC: ##$basic##\nKills using a shotgun, flamethrower, or the OVE9000 portable saw grants them a ##50%## damage boost for ##2## seconds.\n\nACE: ##$pro##\nThe damage bonus now applies to all weapons and lasts ##10## seconds. Skill must still be activated using a shotgun or the OVE9000 portable saw.\n\nNote: Does not apply to grenade launchers.\n\nDecreases the time it takes to pull and put away shotguns and the saw by ##50%##.",

			--}

			--[[   ARMORER SUBTREE   ]]--
			--{

			--Stun Resistance--
			["menu_oppressor_beta_sc"] = "Stun Resistance",
			["menu_oppressor_beta_desc_sc"] = "BASIC: ##$basic##\nEnemy melee attacks push you back ##0.25%## less for every point of armor you have.\n\nACE: ##$pro##\nReduces the visual effect duration of Flashbangs by ##50%.##",

			--Die Hard
			["menu_show_of_force_sc"] = "Die Hard",
			["menu_show_of_force_desc_sc"] = "BASIC: ##$basic##\nYou gain ##5## deflection.\n\nEach point of deflection makes you take ##1%## less health damage, and is applied after other forms of damage reduction.\n\nACE: ##$pro##\nYou gain an additional ##5## deflection.",

			--Transporter
			["menu_pack_mule_beta_sc"] = "Transporter",
			["menu_transporter_beta_desc_sc"] = "BASIC: ##$basic##\nFor each ##10## armor points the bag movement penalty is reduced by ##0.5%##.\n\nACE: ##$pro##\nYou can now sprint with any bag.\n\nNote: The movement penalty from the bag still applies.",

			--More Blood to Bleed--
			["menu_iron_man_beta_sc"] = "More Blood to Bleed",
			["menu_iron_man_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##15%## extra health.\n\nACE: ##$pro##\nYou gain an additional ##25%## extra health.",

			--Bullseye--
			["menu_prison_wife_beta_sc"] = "Bullseye",
			["menu_prison_wife_beta_desc_sc"] = "BASIC: ##$basic##\nHeadshots regenerate ##5## armor once every ##3## seconds.\n\nACE: ##$pro##\nHeadshots regenerate an additional ##30## armor once every ##3## seconds.",

			--Iron Man
			["menu_juggernaut_beta_sc"] = "Iron Man",
			["menu_juggernaut_beta_desc_sc"] = "BASIC: ##$basic##\nUnlocks the ability to wear the Improved Combined Tactical Vest.\n\nACE: ##$pro##\nWhen you melee Shield enemies, they get knocked back by the sheer force.\n\nEnables your ranged weapons to have a chance to knock back Shield enemies when attacking them. Knock back chance is increased the higher the total damage of the weapon is.\n\nYour armor recovers ##10%## faster.",


			--}

			--[[   AMMO SPECIALIST SUBTREE   ]]--
			--{

			--Scavenger
			["menu_scavenging_sc"] = "Scavenger",
			["menu_scavenging_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##50%## increased ammo box pick up range.\n\nACE: ##$pro##\nEvery ##5th## enemy you kill will drop an extra ammo box.",

			--Bulletstorm--
			["menu_ammo_reservoir_beta_sc"] = "Bulletstorm",
			["menu_ammo_reservoir_beta_desc_sc"] = "BASIC: ##$basic##\nAmmo bags placed by you grant players the ability to shoot without depleting their ammunition for up to ##5## seconds after interacting with it. The more ammo players replenish, the longer the duration of the effect.\n\nACE: ##$pro##\nIncreases the base duration of the effect by up to ##15## seconds.",

			--Specialist Equipment formally Rip and Tear
			["menu_portable_saw_beta_sc"] = "Specialist Equipment",
			["menu_portable_saw_beta_desc_sc"] = "BASIC: ##$basic##\nReduces the wear down of saw blades by ##50%.##\n\nACE: ##$pro##\nSaws, Crossbows, Bows, Grenade Launchers, and Rocket Launchers reload ##25%## faster.",

			--Extra Lead
			["menu_ammo_2x_beta_sc"] = "Extra Lead",
			["menu_ammo_2x_beta_desc_sc"] = "BASIC: ##$basic##\nEach ammo bag contains additional ##200%## ammunition.\n\nACE: ##$pro##\nYou can now place ##2## ammo bags instead of just one.",

			--Rip and Tear formally Carbon Blade
			["menu_carbon_blade_beta_sc"] = "Rip and Tear",
			["menu_carbon_blade_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now saw through shield enemies with your OVE9000 portable saw.\n\nACE: ##$pro##\nKills with the Saw, Crossbows, Bows, Grenade Launchers, or Rocket Launchers have a ##50%## chance to cause nearby enemies in a ##10## meter radius to panic.\n\nPanic makes enemies go into short bursts of uncontrollable fear.",

			--Fully Loaded--
			["menu_bandoliers_beta_sc"] = "Fully Loaded",
			["menu_bandoliers_desc_sc"] = "BASIC: ##$basic##\nYour total ammo capacity is increased by ##25%##.\n\nACE: ##$pro##\nYou pick up ##50%## more ammo.\n\nYou gain a ##5%## chance to get a throwable from an ammo box. This increases by an additional ##1%## every time you do not get a throwable until you get one.",

			--}
		--}

		--[[   TECHNICIAN   ]]--
		--{
			--[[   ENGINEER SUBTREE   ]]--
			--{

			--Logistician
			["menu_defense_up_beta_sc"] = "Logistician",
			["menu_defense_up_beta_desc_sc"] = "BASIC: ##$basic##\nYou deploy and interact with all deployables ##25%## faster.\n\nACE: ##$pro##\nYou and your crew deploy and interact with all deployables ##50%## faster.",

			--Nerves of Steel--
			["menu_fast_fire_beta_sc"] = "Nerves of Steel",
			["menu_fast_fire_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now ##use steel sights while in bleedout.##\n\nACE: ##$pro##\nYou take ##50%## less damage while interacting with objects.",

			--Engineering
			["menu_eco_sentry_beta_sc"] = "Engineering",
			["menu_eco_sentry_beta_desc_sc"] = "BASIC: ##$basic##\nYour sentry guns gain ##40%## more health.\n\nACE: ##$pro##\nYour sentry guns gain an additional ##60%## more health.",

			--Jack of all Trades
			["menu_jack_of_all_trades_beta_sc"] = "Jack of All Trades",
			["menu_jack_of_all_trades_beta_desc_sc"] = "BASIC: ##$basic##\nYou carry ##50%## more throwables.\n\nACE: ##$pro##\nYou can now equip a second deployable to bring with you. Pressing the ##'X'## key will allow you to toggle between deployables.\n\nThe second deployable has ##50%## less uses than normal.",

			--Sentry Tower Defense--
			["menu_tower_defense_beta_sc"] = "Tower Defense",
			["menu_tower_defense_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now toggle AP rounds on your sentry guns, lowering the rate of fire by ##66%## and allowing it to pierce through enemies and shields.\n\nACE: ##$pro##\nYou can now carry a maximum of ##2## sentry guns.\n\nSentry guns now cost ##35%## of your maximum ammo to place.",

			--Bulletproof--
			["menu_iron_man_sc"] = "Bulletproof",
			["menu_iron_man_desc_sc"] = "BASIC: ##$basic##\nYour armor cannot be pierced.\n\nACE: ##$pro##\nWhile your armor is full, damage taken is reduced by a number of points equal to ##30%## of your maximum armor.\n\nYour armor recovers ##15%## faster.",

			--}

			--[[   BREACHER SUBTREE   ]]--
			--{

			--Hardware Expert--
			["menu_hardware_expert_beta_sc"] = "Hardware Expert",
			["menu_hardware_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYou fix drills and saws ##20%## faster.\n\nYour drill makes ##65%## less noise.\n\nACE: ##$pro##\nYou fix drills and saws an additional ##30%## faster.\n\nYour drills and saws are now silent. Civilians and guards have to see the drill or saw in order to be alerted.",

			--Danger Close
			["menu_trip_mine_expert_beta_sc"] = "Danger Close",
			["menu_combat_engineering_desc_sc"] = "BASIC: ##$basic##\nThe radius of trip mine explosion is increased by ##30%.##\n\nACE: ##$pro##\nYour trip mine deals ##50%## more damage.",

			--Drill Sawgeant
			["menu_drill_expert_beta_sc"] = "Drill Sawgeant",
			["menu_drill_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYour drill and saw efficiency is increased by ##10%.##\n\nACE: ##$pro##\nFurther increases your drill and saw efficency by ##20%.##",

			--Demoman--
			["menu_more_fire_power_sc"] = "Demoman",
			["menu_more_fire_power_desc_sc"] = "BASIC: ##$basic##\nYou can now carry ##6## shaped charges and ##6## trip mines.\n\nYou deploy shaped charges and trip mines ##20%## faster.\n\nACE: ##$pro##\nYou can now carry ##8## shaped charges and ##10## trip mines.\n\nYou deploy shaped charges and trip mines an additional ##20%## faster.",

			--Kickstarter
			["menu_kick_starter_beta_sc"] = "Kick Starter",
			["menu_kick_starter_beta_desc_sc"] = "BASIC: ##$basic##\nYour drills and saws gain a ##30%## chance to automatically restart after breaking.\n\nACE: ##$pro##\nYou gain the ability to restart drills and saws by hitting them with a melee attack. You get ##1## chance for each time it breaks with a ##50%## success rate.",

			--Fire Trap
			["menu_fire_trap_beta_sc"] = "Fire Trap",
			["menu_fire_trap_beta_desc_sc"] = "BASIC: ##$basic##\nYour trip mines now spread fire around the area of detonation for ##10## seconds in a ##7.5## meter radius.\n\nACE: ##$pro##\nYour trip mines now spread fire around the area of detonation for ##20## seconds in an ##11.25## meter radius.",


			--}

			--[[  BATTLE SAPPER  SUBTREE   ]]--
			--{



			--}
		--}

		--[[   GHOST   ]]--
		--{
			--[[   COVERT OPS SUBTREE   ]]--
			--{


			--}

			--[[   COMMANDO SUBTREE   ]]--
			--{

			--Shockproof
			["menu_insulation_beta_sc"] = "Shockproof",
			["menu_insulation_beta_desc_sc"] = "BASIC: ##$basic##\nA Taser's shock attack has a ##15%## chance to backfire when targeted at you, knocking back the Taser in the process.\n\nACE: ##$pro##\nInteracting with an enemy Taser within ##2## seconds of him electrocuting you will counter-electrocute him, dealing ##50%## damage to his health.",


			--}

			--[[   SILENT KILLER SUBTREE   ]]--
			--{

			--Second Wind
			["menu_scavenger_beta_sc"] = "Second Wind",
			["menu_scavenger_beta_desc_sc"] = "BASIC: ##$basic##\nWhen your armor breaks you gain ##10%## speed for ##3## seconds.\n\nACE: ##$pro##\nWhen your armor is fully depleted, the first shot on every enemy will cause them to stagger.\n\nThis effect persists for ##3## seconds after your armor has regenerated.",



			--}
		--}

		--[[   FUGITIVE   ]]--
		--{
			--[[   GUNSLINGER SUBTREE   ]]--
			--{



			--}

			--[[   RELENTLESS SUBTREE   ]]--
			--{

			--Swan Song
			["menu_perseverance_desc_sc"] = "BASIC: ##$basic##\nWhen your health reaches ##0##, instead of instantly going down, you can fight for ##3## seconds with a ##60%## movement speed penalty.\n\nACE: ##$pro##\nYou can fight for an additional ##6## seconds.",



			--}

			--[[   BRAWLER SUBTREE   ]]--
			--{

			--Counter-Strike--
			["menu_drop_soap_beta_sc"] = "Counter Strike",
			["menu_drop_soap_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now parry cloaker kicks while you have your melee weapon drawn, knocking them down.\n\nYou take ##20%## less damage from cloaker kicks and taser shocks.\n\nACE: ##$pro##\nRanged damage against you is reduced by ##10%## while charging your melee weapon.\n\nYou take an additional ##30%## less damage from cloaker kicks and taser shocks.",

			--Bloodthirst--
			["menu_bloodthirst_sc"] = "Bloodthirst",
			["menu_bloodthirst_desc_sc"] = "BASIC: ##$basic##\nWhenever you kill an enemy with a melee attack, you will gain a ##25%## increase in reload speed for ##10## seconds.\n\nACE: ##$pro##\nEvery kill you get will increase your next melee attack damage by ##25%##, up to a maximum of ##100%.##\n\nThis effect gets reset when striking an enemy with a melee attack.",


			--}
		--}
	--}

		--Deep Pockets--
		["menu_thick_skin_beta_sc"] = "Deep Pockets",
		["menu_thick_skin_beta_desc_sc"] = "BASIC: ##$basic##\nIncreases the concealment of melee weapons by ##2.##\n\nACE: ##$pro##\nIncreases the armor of all ballistic vests by ##20.##\n\nIncreases the concealment of all ballistic vests by ##4.##",

		--Duck and Cover--
		["menu_sprinter_beta_sc"] = "Duck and Cover",
		["menu_sprinter_beta_desc_sc"] = "BASIC: ##$basic##\nYour stamina starts regenerating ##25%## earlier and ##25%## faster.\n\nACE: ##$pro##\nYour dodge meter fills up by ##10%## of your dodge every second while sprinting.\n\nYour dodge meter fills up by ##30%## of your dodge every second while on a zipline.",

		--Sneaky Bastard--
		["menu_jail_diet_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## point of dodge for every ##3## points of concealment under ##35## up to a maximum of ##10##\n\nACE: ##$pro##\nYou gain ##1## point of dodge for every ##1## point of concealment under ##35## up to a maximum of ##10##.\n\nWhile your armor is broken, dodging an attack restores ##6%## of your maximum health. This can only occur once every time your armor breaks.",

		--Sharpshooter--
		["menu_discipline_sc"] = "Sharpshooter",
		["menu_discipline_desc_sc"] = "BASIC: ##$basic##\nRifles gain ##4## stability.\n\nACE: ##$pro##\nLethal headshots using Rifles set to semi-auto increase your rate of fire by ##20%## for ##10## seconds.",

		--Kilmer--
		["menu_heavy_impact_beta_sc"] = "Kilmer",
		["menu_heavy_impact_beta_desc_sc"] = "BASIC: ##$basic##\nRifles gain ##4## accuracy.\n\nACE: ##$pro##\nRifles reload ##25%## faster.",

		--Mind Blown, formerly Explosive Headshot--
		["menu_kilmer_sc"] = "Mind Blown",
		["menu_kilmer_desc_sc"] = "BASIC: ##$basic##\nHeadshots with Rifles set to semi-auto deal ##70%## of the damage dealt to the closest enemy in a ##4## meter radius.\n\nFor every ##7## meters away you are from the enemy, the effect chains to an additional enemy; up to ##4## times.\n\nACE: ##$pro##\nThe radius of Mind Blown is increased by ##1## meter.\n\nFor every ##7## meters away you are from the enemy, the chaining effect deals an additional ##10%## damage; up to a total of ##110%## of the damage dealt.",

		--Ammo Efficiency--
		["menu_single_shot_ammo_return_sc"] = "Ammo Efficiency",
		["menu_single_shot_ammo_return_desc_sc"] = "BASIC: ##$basic##\nGetting ##3## lethal headshots with Rifles in less than ##8## seconds will grant ##1## bullet or ##3%## of your total ammo, whichever is higher, to the Rifle.\n\nACE: ##$pro##\nThe effect is now triggered upon landing ##2## lethal headshots, and the ammo is refunded directly into your magazine whenever possible.",

		--Rifleman
		["menu_rifleman_sc"] = "Rifleman",
		["menu_rifleman_desc_sc"] = "BASIC: ##$basic##\nYour aim down sights and sprint-to-fire speeds are ##20%## faster.\n\nACE: ##$pro##\nRifles gain ##30%## more accuracy and range while aiming down sights.",

		--Aggressive Reload
		["menu_engineering_beta_sc"] = "Aggressive Reload",
		["menu_engineering_beta_desc_sc"] = "BASIC: ##$basic##\nLethal headshots using Rifles set to semi-auto will increase your reload speed by ##25%## for ##10## seconds.\n\nACE: ##$pro##\nThe reload speed bonus increases to ##50%##, and can be triggered regardless of fire mode.",

		--Cleaner--
		["menu_jail_workout_sc"] = "Cleaner",
		["menu_jail_workout_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1## additional body bag in your inventory.\n\nYou deal ##5%## more damage against special enemies.\n\nACE: ##$pro##\nYou gain the ability to place ##2## body bag cases.\n\nYou deal an additional ##10%## damage against special enemies.",

		--Nimble--
		["menu_cleaner_beta_sc"] = "Nimble",
		["menu_cleaner_beta_desc_sc"] = "BASIC: ##$basic##\nYou pick all locks and handcuffs ##50%## faster.\n\nACE: ##$pro##\nYou can now ##silently crack safes by hand.##",

		--Sixth Sense--
		["menu_chameleon_beta_sc"] = "Sixth Sense",
		["menu_chameleon_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain the ability to automatically mark enemies within a ##10## meter radius around you after standing still for ##3.5## seconds.\n\nACE: ##$pro##\nYou ##gain access to all insider assets.##",

		--Systems Specialist--
		["menu_second_chances_beta_sc"] = "Systems Specialist",
		["menu_second_chances_beta_desc_sc"] = "BASIC: ##$basic##\nYour camera loop duration is increased by ##20## seconds.\n\nYou interact with all computers, hacks, cameras, and ECMs ##25%## faster.\n\nACE: ##$pro##\nIncreases the duration of marked enemies by ##100%## and you can now mark specials and guards in stealth by aiming at them with any weapon.\n\nYou interact with all computers, hacks, cameras, and ECMs an additional ##50%## faster.",

		--ECM Specialist--
		["menu_ecm_booster_beta_sc"] = "ECM Specialist",
		["menu_ecm_booster_beta_desc_sc"] = "BASIC: ##$basic##\nYou can now place ##3## ECM jammers instead of just two.\n\nACE: ##$pro##\nYou can now place ##4## ECM jammers instead of just three.",

		--ECM Overdrive--
		["menu_ecm_2x_beta_sc"] = "ECM Overdrive",
		["menu_ecm_2x_beta_desc_sc"] = "BASIC: ##$basic##\nYour ECM jammer can ##now be used to open certain electronic doors.##\n\nYour ECM jammer and feedback duration is increased by ##25%.##\n\nACE: ##$pro##\nThe ECM jammer duration is increased by an additional ##25%## and the ECM feedback duration lasts ##25%## longer.\n\nPagers are delayed by the ECM jammer.",

		--Evasion--
		["menu_awareness_beta_sc"] = "Evasion",
		["menu_awareness_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##5%## additional movement speed.\n\nYour fall damage is reduced by ##75%##.\n\nACE: ##$pro##\nRun and reload - you can reload your weapons while sprinting.",

		--Moving Target--
		["menu_dire_need_beta_sc"] = "Moving Target",
		["menu_dire_need_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##1.5%## extra movement speed for every ##3## points of concealment under ##35##, up to ##15%.##\n\nACE: ##$pro##\nYou gain ##1.5%## extra movement speed for every ##1## point of concealment under ##35##, up to ##15%.##\n\nKilling an enemy from behind with guns or melee fills your dodge meter by ##75%## of your dodge.",

		--Optical Illusions--
		["menu_optic_illusions_sc"] = "Optical Illusions",
		["menu_optic_illusions_desc_sc"] = "BASIC: ##$basic##\nSilenced weapons gain ##1## concealment.\n\nACE: ##$pro##\nSilenced weapons gain an additional ##1## concealment.\n\nYou draw and holster silenced weapons ##25%## faster.",

		--The Professional--
		["menu_silence_expert_beta_sc"] = "The Professional",
		["menu_silence_expert_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain ##4## accuracy with silenced weapons.\n\nACE: ##$pro##\nSpecial enemies killed with silenced weapons drop an extra ammo box.",

		--Unseen Strike, formally Dire Need--
		["menu_backstab_beta_sc"] = "Unseen Strike",
		["menu_backstab_beta_desc_sc"] = "BASIC: ##$basic##\nIf you do not take damage for ##3## seconds, you gain a ##15%## critical hit chance until you take damage.\n\nCritical hits deal ##100%## additional damage.\n\nACE: ##$pro##\nUnseen Strike's critical hit chance persists for ##4## seconds after taking damage.",

		--Spotter--
		["menu_hitman_beta_sc"] = "Spotter",
		["menu_hitman_beta_desc_sc"] = "BASIC: ##$basic##\nEnemies you mark take ##15%## more damage.\n\nACE: ##$pro##\nEnemies you mark take an additional ##30%## damage when further than ##20## meters.",

		--Low Blow--
		["menu_unseen_strike_beta_sc"] = "Low Blow",
		["menu_unseen_strike_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##3%## critical hit chance for every ##3## points of concealment under ##35## up to a maximum of ##30%.##\n\nCritical hits deal ##100%## additional damage.\n\nACE: ##$pro##\nYou gain a ##3%## critical hit chance for every ##1## point of concealment under ##35## up to a maximum of ##30%.##\n\nYour critical hit chance is increased by an additional ##50%## when attacking enemies from behind with guns or melee.",

		--Equilibrium--
		["menu_equilibrium_beta_sc"] = "Equilibrium",
		["menu_equilibrium_beta_desc_sc"] = "BASIC: ##$basic##\nYou and your crew's weapon stability with pistols is increased by ##4.##\n\nACE: ##$pro##\nYou draw and holster pistols ##100%## faster.",

		--Gun Nut--
		["menu_dance_instructor_sc"] = "Gun Nut",
		["menu_dance_instructor_desc_sc"] = "BASIC: ##$basic##\nTightens the hipfire accuracy of Pistols by ##20%##.\n\nACE: ##$pro##\nPistols fire ##15%## faster.\n\nPistols ##now pierce body armor.##",

		--Over Pressurized/Gunfighter--
		["menu_gun_fighter_sc"] = "Gunfighter",
		["menu_gun_fighter_desc_sc"] = "BASIC: ##$basic##\nPistols reload ##5%## faster.\n\nThe movement penalty to accuracy is reduced by ##40%## for Pistols.\n\nThe movement penalty to accuracy is determined by stability.\n\nACE: ##$pro##\nPistols reload an additional ##25%## faster.",

		--Akimbo--
		["menu_akimbo_skill_sc"] = "Akimbo",
		["menu_akimbo_skill_desc_sc"] = "BASIC: ##$basic##\nAkimbo weapons gain ##10## stability.\n\nACE: ##$pro##\nAkimbo weapons gain ##25%## more total ammo capacity and pickup.",

		--Desperado--
		["menu_expert_handling_sc"] = "Desperado",
		["menu_expert_handling_desc_sc"] = "BASIC: ##$basic##\nEach pistol headshot grants your weapons a ##8%## accuracy and range boost for ##4## seconds. This effect can stack ##5## times, and the duration of each stack is refreshed on pistol headshots.\n\nACE: ##$pro##\nIncreases the accuracy and range boost duration to ##10## seconds.",

		--Trigger Happy--
		["menu_trigger_happy_beta_sc"] = "Trigger Happy",
		["menu_trigger_happy_beta_desc_sc"] = "BASIC: ##$basic##\nEach pistol headshot grants them a ##10%## damage boost for ##4## seconds. This effect can stack ##5## times, and the duration of each stack is refreshed on pistol headshots.\n\nACE: ##$pro##\nIncreases the damage boost duration to ##10## seconds.",

		--Running From Death--
		["menu_nine_lives_beta_sc"] = "Running from Death",
		["menu_nine_lives_beta_desc_sc"] = "BASIC: ##$basic##\nYou move ##25%## faster for ##10## seconds after reviving.\n\nACE: ##$pro##\nYou gain a ##20%## damage reduction for ##10## seconds after reviving.\n\nYour weapons are instantly reloaded after reviving.",

		--Undying--
		["menu_running_from_death_beta_sc"] = "Undying",
		["menu_running_from_death_beta_desc_sc"] = "BASIC: ##$basic##\nYou gain a ##100%## increase to bleedout health.\n\nACE: ##$pro##\nYou gain an additional ##100%## increase to bleedout health.\n\nYou may use your primary weapon while in bleedout.",

		--What Doesn't Kill You Only Makes You Stronger--
		["menu_what_doesnt_kill_beta_sc"] = "What Doesn't Kill",
		["menu_what_doesnt_kill_beta_desc_sc"] = "BASIC: ##$basic##\nIncoming damage is reduced by ##1## point for each down you are closer to custody. \n\nACE: ##$pro##\nIncoming damage is reduced by an additional ##3## points at all times.",

		--Haunt--
		["menu_haunt_sc"] = "Haunt",
		["menu_haunt_desc_sc"] = "BASIC: ##$basic##\nKilling an enemy within ##18## meters has a ##5%## chance to spread panic for each down you are closer to custody.\n\nPanic makes enemies go into short bursts of uncontrollable fear.\n\nACE: ##$pro##\nEnemy panic chance is increased by an additional ##15%## at all times.",

		--Messiah--
		["menu_pistol_beta_messiah_sc"] = "Messiah",
		["menu_pistol_beta_messiah_desc_sc"] = "BASIC: ##$basic##\nWhile in bleedout, killing an enemy will allow you to revive yourself. You have ##1## charge which is replenished when leaving custody.\n\nYou can be downed ##1## additional time before going into custody for the first time.\n\nACE: ##$pro##\nMessiah now has infinite charges, but has a ##120## second cooldown. Kills while downed reduce the cooldown by ##10## seconds.",

		--Martial Arts--
		["menu_martial_arts_beta_sc"] = "Martial Arts",
		["menu_martial_arts_beta_desc_sc"] = "BASIC: ##$basic##\nYou take ##50%## less damage from all melee attacks because of training.\n\nACE: ##$pro##\nYou are ##50%## more likely to knock down enemies with a melee strike because of training.",

		--Pumping Iron--
		["menu_steroids_beta_sc"] = "Pumping Iron",
		["menu_steroids_beta_desc_sc"] = "BASIC: ##$basic##\nYou swing and charge melee weapons ##20%## faster.\n\nACE: ##$pro##\nYou swing and charge melee weapons an additional ##30%## faster.",

		--Frenzy--
		["menu_wolverine_beta_sc"] = "Frenzy",
		["menu_wolverine_beta_desc_sc"] = "BASIC: ##$basic##\nYou start with and cannot heal above ##25%## of your maximum health.\n\nYou gain ##20## deflection but ##you can no longer heal##.\n\nEach point of deflection makes you take ##1%## less health damage, and is applied after other forms of damage reduction.\n\nACE: ##$pro##\nYou gain an additional ##25## deflection, and healing is instead reduced by ##75%##.",

		--Berserker--
		["menu_frenzy_sc"] = "Berserker",
		["menu_frenzy_desc_sc"] = "BASIC: ##$basic##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##50%##, you will do up to ##150%## more melee and saw damage.\n\nACE: ##$pro##\nThe lower your health, the more damage you do.\n\nWhen your health is below ##50%##, you will do up to ##75%## more damage with firearms."

	})
end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Dodge",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Increases your headshot damage by ##25%.##\n\nYou do ##25%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
		["menu_deckall_4_desc_sc"] = "You gain ##+1## increased concealment.\n\nWhen wearing armor, your movement speed is ##15%## less affected.\n\nYou gain ##45%## more experience when you complete days and jobs.\n\nYou do ##25%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
		["menu_deckall_6_desc_sc"] = "Unlocks a Throwable Case equipment for you and your crew to use. The Throwable Case can be used to replenish throwables during a heist.\n\nYou do ##25%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",
		["menu_deckall_8_desc_sc"] = "Increases your doctor bag interaction speed by ##20%.##\n\nYou do ##25%## more damage. Does not apply to throwables, grenade launchers, or rocket launchers.",

		--Crook--
		["menu_st_spec_6_desc_sc"] = "The Crook is a versatile criminal. The term is as old as crime itself.\n\nTruly, the crook is a jack of all trades and a master of none. He steals, lies, cheats and does any and every dishonest or illegal work necessary to get by.\n\n\n\nBenefits from a full perk deck:\n##-##Your dodge is increased by ##5## points.\n##-##Your dodge is increased by an additional ##10## points for ballistic vests.\n##-##Your armor is increased by ##50%## for ballistic vests.",
		["menu_deck6_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYour armor is increased by ##15%## for ballistic vests.",
		["menu_deck6_3_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.",
		["menu_deck6_5_desc_sc"] = "Your armor is increased by an additional ##15%## for ballistic vests.",
		["menu_deck6_7_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.",
		["menu_deck6_9_desc_sc"] = "Your armor is increased by an additional ##20%## for ballistic vests.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Rogue
		["menu_st_spec_4_desc_sc"] = "The Rogue is a stealthy criminal, capable of sneaky tricks and deadly force. Versatile and deceptive, the Rogue is hired to do anything from pickpocketing, to burglaries and con jobs.\n\nThe trademark of a Rogue is his versatility - what he lacks in strength he makes up for in skill.\n\n\n\nBenefits from a full perk deck:\n##-##Your dodge is increased by ##15## points.\n##-##You swap between your weapons ##30%## faster.\n##-##Your dodge meter will be filled to ##200%## of its normal maximum when you are revived.\n##-##Dodging an attack causes you to regenerate ##1## life point every ##2## seconds for the next ##20## seconds. This effect can stack, but all stacks are lost whenever you take health damage.",
		["menu_deck4_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYou swap between your weapons ##30%## faster.",
		["menu_deck4_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck4_5_desc_sc"] = "Your dodge meter will be filled to ##200%## of its normal maximum when you are revived.",
		["menu_deck4_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck4_9_desc_sc"] = "Dodging an attack causes you to regenerate ##1## health every ##2## seconds for the next ##20## seconds. This effect can stack, but all stacks are lost whenever you take health damage.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Hitman--
		["menu_deck5_1_sc"] = "Gun-fu",
		["menu_deck5_3_sc"] = "Trained Assassin",
		["menu_deck5_5_sc"] = "With a Pencil",
		["menu_deck5_7_sc"] = "Expert Assassin",

		["menu_st_spec_5_desc_sc"] = "The Hitman is a professional killer from the criminal underworld who excels at close and ranged combat.\n\nCriminal syndicates will hire a hitman as a last resort to enforce criminal authority, deliver retribution or eliminate competition.\n\n\n\n\nBenefits from a full perk deck:\n##-##Killing an enemy outside of melee stores ##25## temporary health. You can store up to ##120## temporary health. Killing an enemy in melee turns that stored temporary health into temporary health that decays at a rate of ##5## per second. Temporary health can exceed your normal maximum health, but you can only have up to ##240## temporary health at once. Note: Frenzy will reduce temporary health by ##75%.##\n##-##Your dodge meter fills up by ##100%## of your dodge when your armor is restored.\n##-##You gain ##5## dodge points.\n##-##While you have temporary health you gain ##20## deflection and ##20%## more movement speed.",
		["menu_deck5_1_desc_sc"] = "Killing an enemy outside of melee stores ##25## health. You can store up to ##75## health.\n\nKilling an enemy in melee turns that stored health into temporary health that decays at a rate of ##5## per second.\n\nTemporary health can exceed your normal maximum health, but you can only have up to ##240## temporary health at once.\n\nNote: Frenzy will reduce temporary health by ##75%##.",
		["menu_deck5_3_desc_sc"] = "Your dodge meter fills up by ##100%## of your dodge when your armor is restored.\n\nYou gain ##5## dodge points.",
		["menu_deck5_5_desc_sc"] = "You store ##60%## more health.",
		["menu_deck5_7_desc_sc"] = "You gain ##120## temporary health when you are revived.\n\nYou gain an additional ##5## dodge points.",
		["menu_deck5_9_desc_sc"] = "While you have temporary health, you gain ##20## deflection and ##20%## additional movement speed.\n\nEach point of deflection makes you take ##1%## less health damage, and is applied after other forms of damage reduction.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Muscle
		["menu_st_spec_2_desc_sc"] = "The Muscle is a tough guy who uses violence to send messages from his Mafia superiors. They are the backbone of any criminal organization.\n\nThe muscle is called in whenever you need to rough someone up, break some legs, crush a skull or remind people who's boss.\n\n\nBenefits from a full perk deck:\n##-##You gain ##40%## more health.\n##-##You can now use your guns to ##spread panic among your enemies.##\n##-##You gain ##25%## of your maximum health after reviving.",
		["menu_deck2_1_desc_sc"] = "You gain ##10%## more health.",
		["menu_deck2_3_desc_sc"] = "You gain an additional ##10%## more health.",
		["menu_deck2_5_desc_sc"] = "You gain an additional ##10%## more health.",
		["menu_deck2_7_desc_sc"] = "Every shot you fire with your guns has a ##5%## chance to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.",
		["menu_deck2_9_desc_sc"] = "You gain an additional ##10%## more health.\n\nYou gain ##25%## of your maximum health after reviving.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Crew Chief
		["menu_st_spec_1_desc_sc"] = "The Crew Chief, also known as the Caporegime, is the head of a branch of an organized crime syndicate. The Crew Chief commands a crew of soldiers and reports directly to a boss or an underboss.\n\nWhen the crime syndicate needs to have someone dealt with, the Crew Chief and his soldiers make sure it's done.\n\n\nBenefits from a full perk deck:\n##-##You gain ##15%## more health.\n##-##Your shout distance is increased by ##25%##\n##-##You gain ##10%## more armor.\n##-##You and your crew gain ##50%## more stamina.\n##-##Your crew gains ##5%## more HP.\n##-##You and your crew gains ##5%## max health and ##10%## stamina for each hostage up to ##4## times.",
		["menu_deck1_3_desc_sc"] = "You and your crew's stamina is increased by ##50%##.\n\nIncreases your shout distance by ##25%##.\n\nNote: Crew perks do not stack.",
		["menu_deck1_5_desc_sc"] = "You and your crew gain ##5%## more health.\n\nNote: Crew perks do not stack.",
		["menu_deck1_7_desc_sc"] = "You gain ##10%## more armor.",
		["menu_deck1_9_desc_sc"] = "You and your crew gains ##5%## max health and ##10%## stamina for each hostage up to ##4## times.\n\nNote: Crew perks do not stack.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_st_spec_3_desc_sc"] = "The Armorer was formerly a profession within the military. The armorer's job is to maintain, repair and improve armors.\n\nAny self-respecting crime syndicate needs someone who can make sure the soldiers have the necessary protection to do their jobs.\n\n\n\nBenefits from a full perk deck:\n##-##You gain ##25%## more armor.\n##-##Your armor recovery rate is increased by ##20%##.",
		["menu_deck3_1_desc_sc"] = "You gain ##10%## more armor.",
		["menu_deck3_3_desc_sc"] = "You gain an additional ##10%## more armor.",
		["menu_deck3_5_desc_sc"] = "You gain an additional ##5%## more armor.",
		["menu_deck3_7_desc_sc"] = "Your armor recovery rate is increased by ##10%##.",
		["menu_deck3_9_desc_sc"] = "Your armor recovery rate is increased by an additional ##10%##.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Burglar--
		["menu_st_spec_7_desc_sc"] = "The natural dexterity of the Burglar has benefits beyond merely breaking and entering. Being nimble allows the Burglar to pick locks, bag bodies and answer pagers faster.\n\nThey are also harder to hit in combat. They stay alive by staying out of the way.\n\n\n\nBenefits from a full perk deck:\n##-##Your dodge is increased by ##15## points.\n##-##Your dodge meter fills up by ##10%## of your dodge every second while crouching.\n##-##You bag corpses ##20%## faster.\n##-##You pick locks ##20%## faster.\n##-##You answer pagers ##10%## faster.\n##-##Your armor recovery rate is increased by ##10%##\n##-##You gain a ##10%## boost in your movement speed when crouching..",		
		["menu_deck7_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYour dodge meter fills up by ##5%## of your dodge every second while crouching.",
		["menu_deck7_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.\n\nYou bag corpses ##20%## faster.",
		["menu_deck7_5_desc_sc"] = "You pick locks ##20%## faster.\n\nYour dodge meter fills up by an additional ##5%## of your dodge every second while crouching.",
		["menu_deck7_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.\n\nYou answer pagers ##10%## faster.",
		["menu_deck7_9_desc_sc"] = "Your armor recovery rate is increased by ##10%##.\n\nYou gain a ##10%## boost in your movement speed when crouching.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Gambler--
		["menu_st_spec_10_desc_sc"] = "Luck is an elusive quality. The ancient Greeks believed it was the design of the Gods. It isn't. It certainly exists, but it's something you can earn. It requires preparation and forethought to get your pieces in place, and maximizes your chances of a return. It's counting cards, rather than the blessing of Fortuna.\n\nThe Gambler perk deck is a support deck. Anyone can help the team win, but it takes the Gambler to help the team win big.\n\nBenefits from a full perk deck:\n##-##Ammo supplies you pick up also yield medical supplies that heal you for ##8## to ##12## health. Cannot occur more than once every ##10## seconds, but every ammo box you pick up reduces this by ##3## to ##5## seconds.\n##-##When you get healed from picking up ammo packs:\nYour ##teammates also gain an ammo pickup##.\nYour dodge meter is filled up by ##100%## of your dodge when healing from ammo packs.\nYour teammates get healed for ##50%## of the amount.\nYou gain ##30## armor.\n##-##You gain ##10## dodge points.",		
		["menu_deck10_1_desc_sc"] = "Ammo supplies you pick up also yield medical supplies that heal you for ##4## to ##8## health.\n\nCannot occur more than once every ##10## seconds, but every ammo box you pick up reduces this by ##3## to ##5## seconds.",
		["menu_deck10_3_desc_sc"] = "When you get healed from picking up ammo packs, your teammates also gain an ammo pickup.\n\nYou gain ##5## dodge points.",
		["menu_deck10_5_desc_sc"] = "Increase health gained from ammo packs by an additional ##2##.\n\nWhen you get healed from picking up ammo packs, your dodge meter is also filled up by ##100%## of your dodge.",
		["menu_deck10_7_desc_sc"] = "When you get healed from picking up ammo packs, your teammates also get healed for ##50%## of the amount.\n\nYou gain ##5## dodge points.",
		["menu_deck10_9_desc_sc"] = "Increase health gained from ammo packs by an additional ##2##.\n\nWhen you get healed from picking up ammo packs, you also gain ##30## armor.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Infiltrator--
		["menu_st_spec_8_desc_sc"] = "The Infiltrator is an agent hired by a government or large criminal organization to obtain information about its enemies, or by a corporation to obtain industrial secrets from its competitors.\n\nThe Infiltrator is a close combat specialist who knows how to use the environment in order to get the upper hand.\n\n\nBenefits from a full perk deck:\n##-##When you are within ##12## meters of an enemy, you receive ##20%## less damage from enemies.\n##-##Each successful melee hit grants an additional ##16%## melee damage boost for ##10## seconds and can stack up to ##5## times.\n##-##Each successful melee hit heals ##1## life point every ##1.25## seconds for ##10## seconds, stacks up to ##5## times.",
		["menu_deck8_1_desc_sc"] = "When you are within ##12## meters of an enemy, you receive ##5%## less damage from enemies.",
		["menu_deck8_3_desc_sc"] = "When you are within ##12## meters of an enemy, you receive an additional ##5%## less damage from enemies.",
		["menu_deck8_5_desc_sc"] = "When you are within ##12## meters of an enemy, you receive an additional ##10%## less damage from enemies.\n\nEach successful melee hit grants an additional ##8%## melee damage boost for ##10## seconds and can stack up to ##5## times.",
		["menu_deck8_7_desc_sc"] = "Each successful melee hit grants an additional ##8%## melee damage boost for ##10## seconds, this effect can stack up to ##5## times.",
		["menu_deck8_9_desc_sc"] = "Each successful melee hit heals ##1## health every ##1.25## seconds for ##10## seconds, this effect can stack up to ##5## times.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sociopath--
		["menu_st_spec_9_desc_sc"] = "The Sociopath is known to be one of the most effective type of criminals. Where he is effective, he is also difficult to deal with, which is why larger organizations avoid him.\n\nBold, disinhibitted and mean, the Sociopath excels in the most violent of jobs. Unable to feel guilt for the crimes he commits, the Sociopath is a dangerous enemy.\n\n\nBenefits from a full perk deck:\n##-##When you are within ##18## meters of an enemy, you receive ##5%## less damage from enemies.\n##-##Killing an enemy regenerates ##40## armor. Cannot occur more than once every ##3## seconds.\n##-##Killing an enemy with a melee weapon regenerates ##5%## health. Cannot occur more than once every ##3## seconds.\n##-##Killing an enemy within ##18## meters has a ##25%## chance to spread panic among your enemies. Cannot occur more than once every ##2## seconds.",
		["menu_deck9_1_sc"] = "No Talk",
		["menu_deck9_1_desc_sc"] = "When you are surrounded by three enemies or more within ##18 meters##, you take ##5%## less damage from enemies.",
		["menu_deck9_3_desc_sc"] = "Killing an enemy regenerates ##20## armor.\n\nThis cannot occur more than once every ##3## seconds.",
		["menu_deck9_5_desc_sc"] = "Killing an enemy with a melee weapon regenerates ##5%## health.\n\nThis cannot occur more than once every ##3## seconds.",
		["menu_deck9_7_desc_sc"] = "Killing an enemy within ##18## meters regenerates ##20## armor.\n\nThis cannot occur more than once every ##3## seconds.",
		["menu_deck9_9_desc_sc"] = "Killing an enemy within ##18## meters has a ##25%## chance to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.\n\nThis cannot occur more than once every ##2## seconds.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Grinder--
		["menu_st_spec_11_desc_sc"] = "A typical grinder is a hard working individual, able to take control of difficult situations and turn them around.\n\nThe grinder relies heavily on always being in the front and dishing out punishment, being able to survive due to the fact that he does damage to the enemies regardless of how much damage he has sustained.\n\n\nBenefits from a full perk deck:\n##-##Damaging an enemy heals ##3## life point every second for ##5## seconds. This effect stacks up to ##5## times but cannot occur more than once every ##0.5## seconds and only while wearing the Flak Jacket. Damaging enemies with sentries or damage over time effects does not grant stacks.\n##-##You lose ##80## armor while wearing the Flak Jacket.\n##-##Every stack increases your movement speed by ##5%##.",
		["menu_deck11_1_desc_sc"] = "Damaging an enemy heals ##1## health every second for ##3## seconds.\n\nThis effect stacks up to ##5## times but you can only gain a stack every ##0.5## seconds and only while wearing the ##Flak Jacket##. Damaging enemies with sentries or damage over time effects does not grant stacks.\n\nYou lose ##80## armor while wearing the Flak Jacket.",
		["menu_deck11_3_desc_sc"] = "Stacks heal an additional ##1## health every second.",
		["menu_deck11_5_desc_sc"] = "Stacks last an additional ##2## seconds.",
		["menu_deck11_7_desc_sc"] = "Stacks heal an additional ##1## health every second.",
		["menu_deck11_9_desc_sc"] = "Every stack increases your movement speed by ##5%##.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Open your mind--
		["menu_st_spec_13_desc_sc"] = "The Ex-Presidents are one of the most daring heisting crews out there. Great risk takers and brothers in arms. Their lack of fear for their own mortality brought them together and made them as successful as they are.\n\nAn Ex-President follows no rules and only adheres to the Ozaki 8, a set of trials to honor their nature.\n\n\nBenefits from a full perk deck:\n##-##While your armor is up, you will store ##8## health for every ##1## enemy you kill. When your armor has been completely depleted and then starts to regenerate, you will gain health equal to the stored health amount. Maximum amount of stored health depends on your equipped armor.\n##-##Killing an enemy speeds up your armor recovery time depending on how much armor you have. The more armor the less recovery speed gained per kill. Armor recovery speed is reset whenever your armor recovers.\n##-##Your dodge is increased by ##10## points.",
		["menu_deck13_1_desc_sc"] = "While your armor is up, you will store ##4## health for every enemy you kill.\n\nWhen your armor starts to regenerate after being completely depleted, you will gain health equal to the stored health amount.\n\nMaximum amount of stored health depends on your equipped armor, with heavier armors being able to store less health than lighter armors.",
		["menu_deck13_3_desc_sc"] = "Increases the amount of health stored from kills by ##2##.\n\nYour dodge is increased by ##5## points.",
		["menu_deck13_5_desc_sc"] = "Increases the maximum health that can be stored by ##25%##.",
		["menu_deck13_7_desc_sc"] = "Increases the amount of health stored from kills by ##2##.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck13_9_desc_sc"] = "Killing an enemy speeds up your armor recovery speed depending on your equipped armor. Heavier armors gain a smaller bonus than lighter armors. This bonus is reset whenever your armor recovers.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--THIS IS WAR BABY--
		["menu_st_spec_14_desc_sc"] = "The Maniac Perk Deck is the embodiment of crazy and to never accept bad odds in moments of danger. By pushing through and constantly deal damage, your fellow heisters will be granted a temporary shield making all of you feel Jimmy's invulnerable spirit.\n\n\n\n\n\nBenefits from a full perk deck:\n##-##Damage you deal is converted into Hysteria Stacks. Max amount of stacks is ##2400##. Hysteria Stacks: Incoming damage is reduced by ##1.5## points for every ##240## stacks of Hysteria. Hysteria Stacks decay by ##240## every ##8## seconds.\n##-##Members of your crew also gains the effect of your Hysteria Stacks.",
		["menu_deck14_1_desc_sc"] = "Damage you deal is converted into Hysteria Stacks. Max amount of stacks is ##2400##.\n\nHysteria Stacks:\nIncoming damage is reduced by ##1## point for every ##400## stacks of Hysteria. Hysteria Stacks decay by ##400## every ##8## seconds.",
		["menu_deck14_5_desc_sc"] = "Changes the decay of your Hysteria Stacks to ##300## every ##8## seconds.",
		["menu_deck14_7_desc_sc"] = "Incoming damage is now reduced by ##1## point for every ##300## stacks of Hysteria.",
		["menu_deck14_9_desc_sc"] = "Hysteria stacks are ##100%## more potent for you.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Anarchist--
		["menu_st_spec_15_desc_sc"] = "The Anarchist refuses to acknowledge the arbitrary laws imposed by traditional authority. Kings, queens and presidents hold no sway over the Anarchist mind. Fly free and make your own rules is the motto. This refusal to abide by established truths enables the Anarchist to go where others cannot, employing unconventional tactics to slip through the cracks and reach seemingly impossible objectives.\n\n\nBenefits from a full perk deck:\n##-##Instead of fully regenerating armor when out of combat, The Anarchist will periodically regenerate armor at a rate equivalent to ##8## armor per second. Heavier armor regenerates more armor per tick, but has a longer delay between ticks.\n##-## ##50%## of your health is converted into ##150%## armor.\n##-##Dealing damage will grant you armor - This can only occur once every ##3## seconds. Heavier armors are granted more armor.",
		["menu_deck15_1_desc_sc"] = "Instead of fully regenerating armor when out of combat, The Anarchist will periodically regenerate armor at a rate equivalent to ##8## armor per second. Heavier armor regenerates more armor per tick, but has a longer delay between ticks.\n\nNote: Skills and perks that increases the armor recovery rate are disabled when using this perk deck.",
		["menu_deck15_3_desc_sc"] = "##50%## of your health is converted into ##50%## armor.",
		["menu_deck15_5_desc_sc"] = "##50%## of your health is converted into ##100%## armor.",
		["menu_deck15_7_desc_sc"] = "##50%## of your health is converted into ##150%## armor.",
		["menu_deck15_9_desc_sc"] = "Dealing damage will grant you armor - This can only occur once every ##3## seconds. Heavier armors are granted more armor.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Scarface--
		["menu_st_spec_17_desc_sc"] = "The Kingpin is the boss, an autocrat whose every whim must be obeyed. But you gotta get the money first. Then when you get the money, you get the power. Remember, the only thing in this world that gives orders...is balls.\n\n\n\n\n\nBenefits from a full perk deck:\n##-##Unlocks and equips the Kingpin Injector. Activating the injector will heal you for ##30%## of all damage taken for ##6## seconds. You can still take damage during the effect. The Injector can only be used once every ##30## seconds.\n##-##Your movement speed is increased by ##20%## while the Kingpin Injector is active.\n##-##Enemies nearby will prefer targeting you, whenever possible, while the Injector is active.\n##-##The amount of health received during the Injector effect is increased by ##60%## while below ##25%## health.\n##-##For every ##3## points of health gained during the injector effect while at maximum health, the recharge time of the injector is reduced by ##1## second.",
		["menu_deck17_1_desc_sc"] = "Unlocks and equips the Kingpin Injector. Changing to another perk deck will make the Injector unavailable again. The Injector replaces your current throwable, is equipped in your throwable slot and can be switched out if desired.\n\nWhile in game you can use the throwable key to activate the injector. Activating the injector will heal you for ##30%## of all damage taken for ##4## seconds.\n\nYou can still take damage during the effect. The Injector can only be used once every ##30## seconds.",
		["menu_deck17_3_desc_sc"] = "Your movement speed is increased by ##20%## while the Kingpin Injector is active.",
		["menu_deck17_5_desc_sc"] = "You are now healed for ##30%## of all damage taken for ##6## seconds while the Kingpin Injector is active.\n\nEnemies nearby will prefer targeting you, whenever possible, while the Injector is active.",
		["menu_deck17_7_desc_sc"] = "The amount of health received during the Injector effect is increased by ##60%## while below ##25%## health.",
		["menu_deck17_9_desc_sc"] = "For every ##5## health gained during the injector effect while at maximum health, the recharge time of the injector is reduced by ##2## seconds.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--10 feet higher--
		["menu_st_spec_18_desc_sc"] = "The Sicario is a must in every drug cartel. Someone who takes care of all types of problems in a most lethal way. The Sicario never ducks out of a fight, they get the job done - without hesitation or fear.\n\n\n\n\n\nBenefits from a full perk deck:\n##-##Unlocks and equips the throwable Smoke Bomb. When deployed, the smoke bomb creates a smoke screen that lasts for ##12## seconds. While standing inside the smoke grenade, you and your allies regenerate armor ##100%## faster. Any enemies that stand in the smoke will see their accuracy reduced by ##75%##. After the smoke dissipates, the Smoke Bomb is on a cooldown for ##40## seconds, but killing enemies will reduce this cooldown by ##1## second.\n##-##Dodging an attack reduces the smoke bomb's cooldown by ##1## second.\n##-##Your dodge meter fills up by ##40%## of your dodge every second while you are inside of your smoke screen.\nYour dodge is increased by ##15## points.",
		["menu_deck18_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nUnlocks and equips the throwable ##Smoke Bomb.##\n\nWhen deployed, the smoke bomb creates a smoke screen that lasts for ##12## seconds. While standing inside the smoke screen, you and your allies regenerate armor ##100%## faster. Any enemies that stand in the smoke will see their accuracy reduced by ##75%##.\n\nThe Smoke Bomb has a ##40## second cooldown, but killing enemies will reduce this cooldown by ##1## second.",
		["menu_deck18_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_5_desc_sc"] = "Dodging an attack reduces the smoke bomb's cooldown by ##1## second.",
		["menu_deck18_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_9_desc_sc"] = "Your dodge meter fills up by ##40%## of your dodge every second while you are inside of your smoke screen.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sweet liquor eases the pain--
		["menu_st_spec_19_desc_sc"] = "You are an unbreakable wall of resolve and calm. Discipline of the mind helps the Stoic overcome situations that would make others fall crying into shaking heaps. Combinations of breathing and physical reaction-control learned from buddhist monks will let you keep going long enough to finish the job, no matter what he enemy throws at you.\n\n\n\nBenefits from a full perk deck:\n##-##Unlocks and equips the Stoic Hip Flask. ##30%## of damage taken is applied over time (##8## seconds). Activating the hip flask immediately negates any damage-over-time. Whenever damage-over-time is negated, you heal for ##250%## of the remaining damage over time. The flask has a ##30## second cooldown.\n##-##All of your armor is converted to ##50%## health.\n##-##The cooldown of your flask will be reduced by ##1## second for each enemy you kill.\n##-##After not taking damage for ##4## seconds any damage-over-time will be negated.\n##-##When your health is below ##50%##, the cooldown of your flask will be reduced by ##6## seconds for each enemy you kill.\n##-##You gain ##25%## of your maximum health when getting up.",
		["menu_deck19_1_desc_sc"] = "Unlocks and equips the Stoic Hip Flask.\n\n##30%## of damage taken is applied over time (##8## seconds).\n\nYou can use the throwable key to activate the Stoic Hip Flask and immediately negate any damage-over-time.\n\nWhenever damage-over-time is negated, you heal for ##300%## of the remaining damage-over-time. The flask has a ##30## second cooldown.\n\nAll of your ##armor is converted to 50% health.##",
		["menu_deck19_3_desc_sc"] = "The cooldown of your flask will be reduced by ##1## second for each enemy you kill.",
		["menu_deck19_5_desc_sc"] = "After not taking damage for ##4## seconds any remaining damage-over-time will be negated.",
		["menu_deck19_7_desc_sc"] = "When your health is below ##50%##, the cooldown of your flask will be reduced by ##6## seconds for each enemy you kill.",
		["menu_deck19_9_desc_sc"] = "You gain ##25%## of your maximum health after reviving.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--it's not a war crime if they're not people--
		["menu_st_spec_20_desc_sc"] = "Some way that experiences are best when shared, even in the case of performance-enhancing aerosol dispensers! For that special heister you like, this is something to bond over while you're looting bank vaults and taking care of business.\n\n\n\n\n\nBenefits from a full perk deck:\n##-##Unlocks and equips the Gas Dispenser. To activate the Gas Dispenser you need to look at another allied unit within a ##18## meter radius with clear line of sight and press the throwable key to tag them. Each enemy you or the tagged unit kills will now heal you for ##15## health and the tagged unit for ##7.5## health. Each enemy you kill will now extend the duration of the effect by ##2## seconds. The effect will last for a duration of ##12## seconds and has a cooldown of ##60## seconds.\n##-##Each enemy you or the tagged unit kill now grant you ##1## absorption up to a maximum of ##20##. This effect will last until the perk deck item goes out of cooldown.\n##-##Enemies you kill will reduce the cooldown timer by ##2## seconds.\n##-##Each enemy the tagged unit kills will reduce your perk deck item cooldown timer by ##2## seconds until you are no longer paired.",
		["menu_deck20_1_desc_sc"] = "Unlocks and equips the ##Gas Dispenser.##\n\nTo activate the Gas Dispenser you need to look at another allied unit within a ##18## meter radius with clear line of sight and press the throwable key to tag them.\n\nKills you or the tagged unit make heal you for ##8## health and the tagged unit for ##5## health.\n\nThe effect lasts for ##11## seconds, and has a cooldown of ##80## seconds.",
		["menu_deck20_3_desc_sc"] = "Enemies you or the tagged unit kill extend the duration of the gas dispenser by ##2## seconds. This increase is reduced by ##0.2## seconds each time it happens.",
		["menu_deck20_5_desc_sc"] = "Each enemy you or the tagged unit kills reduces damage you take by ##0.5## points up to a maximum of ##8## until the Gas Dispenser's effect and cooldown ends.",
		["menu_deck20_7_desc_sc"] = "Healing from the Gas Dispenser is increased by ##100%##.",
		["menu_deck20_9_desc_sc"] = "Each enemy you kill will reduce the cooldown of the Gas Dispenser by ##2## seconds.\n\nEach enemy the tagged unit kills will reduce the cooldown of the Gas Dispenser by ##2## seconds until you are no longer paired.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Biker--
		["menu_st_spec_16_desc_sc"] = "Biker gangs are feared all over the world, and the biggest clubs are common household names. To be a biker you need to be tough and loyal, and know that the rules of the club are absolute. Bikers are known to be ruthless and violent people, and they are never afraid to challenge anyone that dare to cross them.\n\n\n\nBenefits from a full perk deck:\n##-##Every time you or your crew performs a kill you will gain ##2## life points. This can only occur once every ##2## seconds.\n##-##You regenerate ##10## armor every ##3## seconds.\n##-##Every ##25%## armor missing reduces cooldown to kill regen by ##0.5## seconds and increases the number of life points gained from kills by ##2.##\n##-##You regenerate an additional ##10## armor every ##2.5## seconds. Killing an enemy with a melee weapon instantly triggers this effect and causes the next armor regen tick to occur ##1## second sooner.",
		["menu_deck16_1_desc_sc"] = "Every time you or your crew performs a kill you will gain ##2## health. This can only occur once every ##2## seconds.",
		["menu_deck16_3_desc_sc"] = "You regenerate ##10## armor every ##3## seconds.",
		["menu_deck16_5_desc_sc"] = "Every ##25%## armor missing reduces cooldown to kill regen by ##0.5## seconds.",
		["menu_deck16_7_desc_sc"] = "You now regenerate ##20## armor every ##2.5## seconds.\n\nKilling an enemy with a melee weapon instantly triggers this effect and causes the next armor regen tick to occur ##1## second sooner.",
		["menu_deck16_9_desc_sc"] = "Every ##25%## armor missing increases the number of health gained from kills by ##2##.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Yakuza--
		["menu_st_spec_12_desc_sc"] = "The Yakuza are one of the most feared crime syndicates in the world. Ruled by the ninkyo and lead by the Oyabun, the Yakuza are known for their strict code of conduct, organized nature and the tattoos that cover their entire bodies.\n\nAn outcast and a dropout from society, the Yakuza knows how it is to fend for himself. While he appears gentle, he is not to be taken lightly.\n\n\nBenefits from a full perk deck:\n##-##When your health is below 50%:\nYour dodge meter fills by up to ##8%## of your dodge every second.\nYour dodge meter fills by up to ##50%## of your dodge when you kill an enemy.\nYour dodge meter fills by up to ##50%## of your dodge when you kill an enemy in melee (Stacks with effect 2).\nYou take up to ##20%## less damage.\n##-##Once per down, if you would be downed, you instead survive with ##1## life point and you regain ##50## armor.",
		["menu_deck12_1_desc_sc"] = "The lower your health, the faster your dodge meter will passively fill up. When your health is below ##50%##, your dodge meter fills by up to ##8%## of your dodge every second.\n\nYour dodge is increased by ##5## points.",
		["menu_deck12_3_desc_sc"] = "The lower your health the more your dodge meter is filled when you kill an enemy. When your health is below ##50%##, your meter fills by up to ##50%## of your dodge.",
		["menu_deck12_5_desc_sc"] = "The lower your health, the less damage you take. When your health is below ##50%##, you will take up to ##20%## less damage.",
		["menu_deck12_7_desc_sc"] = "The lower your health the more your dodge meter is filled when you kill an enemy in melee. When your health is below ##50%##, your meter fills by up to ##50%## of your dodge.\n\nThis effect stacks with Hebi Irezumi.",
		["menu_deck12_9_desc_sc"] = "Once per down, if you would be downed you instead survive with ##1## health and you regain ##50## armor.\n\nNote: This effect does not apply to, nor is it refreshed by, downs caused by cloaker kicks and taser shocks.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Hacker--
		["menu_st_spec_21_desc_sc"] = "Using your sharp mind and gear, you can bring any security system to its knees with the push of a button. You are never caught unaware by a camera or security guard, but if things do go awry, you can just as easily brute-force your way into enemy comms to deliver a nasty surprise for anyone listening.\n\n\n\n\nBenefits from a full perk deck:\n##-##Unlocks and equips the Pocket ECM Device. Activating the Pocket ECM device before the alarm is raised will trigger the jamming effect, disabling all electronics and pagers for a ##12## second duration. Activating the Pocket ECM after the alarm is raised will trigger the feedback effect, granting a chance to stun enemies on the map every second for a ##12## second duration. The Pocket ECM device has ##1## charge with a ##80## second cooldown timer, but each kill you perform will shorten the cooldown timer by ##3## seconds.\n##-##Killing an enemy while the feedback effect is active will regenerate ##20## health. Crew members killing enemies while the feedback effect is active will regenerate ##10## health.\n##-##Your armor recovery rate is increased by ##10%.##\n##-##Your dodge is increased by ##10## points.",
		["menu_deck21_1_desc_sc"] = "Unlocks and equips the ##Pocket ECM Device##.\n\nWhile in game you can use the throwable key to activate the Pocket ECM Device.\n\nActivating the Pocket ECM Device before the alarm is raised will trigger the jamming effect, disabling all electronics and pagers for a ##12## second duration.\n\nActivating the Pocket ECM Device after the alarm is raised will trigger the feedback effect, granting a chance to stun enemies on the map every second for a ##12## second duration.\n\nThe Pocket ECM Device has ##1## charge with a ##80## second cooldown timer, but each kill you perform will shorten the cooldown timer by ##3## seconds.",
		["menu_deck21_3_desc_sc"] = "Your dodge is increased by ##5## points.",
		["menu_deck21_5_desc_sc"] = "Killing an enemy while the feedback effect is active will regenerate ##20## health.",
		["menu_deck21_7_desc_sc"] = "Your armor recovery rate is increased by ##10%##.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck21_9_desc_sc"] = "Crew members killing enemies while the feedback effect is active will regenerate ##10## health.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "Blank Deck",
		["menu_st_spec_0_desc"] = "This deck has no benefits at all.",
		["menu_st_spec_00"] = "Wildcard Deck",
		["menu_st_spec_00_desc"] = "This deck only has the shared skills.",
		["menu_deck0_1"] = "",
		["menu_deck0_1_desc"] = "",
	})
end)
