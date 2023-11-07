Month = os.date("%m")
Day = os.date("%d")
local weapon_names = restoration.Options:GetValue("OTHER/WepNames") or 1
local easterless = restoration and restoration.Options:GetValue("OTHER/GCGPYPMMSAC")
	local eggplant = restoration and restoration.Options:GetValue("OTHER/ForceEggs/Upotte")
	local bobcat = restoration and restoration.Options:GetValue("OTHER/ForceEggs/CrabBattle")
	local shitpost = restoration and restoration.Options:GetValue("OTHER/ForceEggs/BigMan")
	local registeredloser = restoration and restoration.Options:GetValue("OTHER/ForceEggs/EmberMyBeloved")

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
		["RestorationModWeaponHandlingOptionsButtonTitleID"] = "++ Weapon Handling Options ++",
		["RestorationModWeaponHandlingOptionsButtonDescID"] = "Extra options regarding weapon handling.",
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
		["RestorationModInfo_sociopathTitleID"] = "Tension and Co. (Sociopath)",
		["RestorationModInfo_sociopathDescID"] = "Enables or disables tracking of these specific skills.",
		["RestorationModInfo_body_expertiseTitleID"] = "Spray n' Pray",
		["RestorationModInfo_body_expertiseDescID"] = "Enables or disables tracking of this specific skill.",
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

		--EXTRA OPTIONS
		["RestorationModAltLastDownColorTitleID"] = "Alternative Last Down Color Grading",
		["RestorationModAltLastDownColorDescID"] = "Switches the last down color grading to color_sin_classic.",
		["RestorationModNoBleedoutTiltTitleID"] = "Disable Bleedout Camera Tilt",
		["RestorationModNoBleedoutTiltDescID"] = "Disables the camera tilt that happens while in bleedout.",
		["RestorationModGOTTAGETAGRIPTitleID"] = "Hide ALL Foregrips",
		["RestorationModGOTTAGETAGRIPDescID"] = "Hides *all* attachments of the \"vertical_grip\" type from appearing in menus; ones already attached to weapons are unaffected. Requires restart.",
		["RestorationModGCGPYPMMSACTitleID"] = "Super Cereal Weapons",
		["RestorationModGCGPYPMMSACDescID"] = "Disables Star Wars blaster mechanics. Requires restart.",
		["RestorationModGCGPYPMMSACTextTitleID"] = "Super Cereal Text",
		["RestorationModGCGPYPMMSACTextDescID"] = "Disables text based easter eggs from being rolled. Requires restart.",
		["RestorationModForceEggsOptionsButtonTitleID"] = "Force Easter Egg Text",
		["RestorationModForceEggsOptionsButtonDescID"] = "Force enable individual easter egg texts; ignores the effects of \"Super Cereal Text\" if its enabled.\nToggling anything in here requires a restart.",
			["RestorationModUpotteTitleID"] = "Enrole in Seishou Academy",
			["RestorationModUpotteDescID"] = "Work with the Modern Literature teacher or something",
			["RestorationModCrabBattleTitleID"] = "Now There's A Pretty Meme",
			["RestorationModCrabBattleDescID"] = "Exquisite!",
			["RestorationModEmberMyBelovedTitleID"] = "Go EXTREME Digital",
			["RestorationModEmberMyBelovedDescID"] = "Clem Grakata!",
			["RestorationModBigManTitleID"] = ":^)",
			["RestorationModBigManDescID"] = "Enables other easter egg text",
		["RestorationModSevenHoldTitleID"] = "Toggle Interactions (Press2Hold)",
		["RestorationModSevenHoldDescID"] = "Enable/disable whether or not the interact key acts as a toggle.",
		["RestorationModSevenHoldDeployCancelTitleID"] = "Deployable Cancels Interact",
		["RestorationModSevenHoldDeployCancelDescID"] = "Enable/disable whether or not the deployable key is what's used to cancel an active toggle interaction. Requires Toggle Interactions to be enabled to have any effect.",
		["RestorationModClassicMoviesTitleID"] = "Classic Loadout Backgrounds",
		["RestorationModClassicMoviesDescID"] = "Enable or disable PD:TH loadout backgrounds when playing on Classic heists.",
		["RestorationModWpnCatTitleID"] = "Buy Menu Tab Sorting",
		["RestorationModWpnCatDescID"] = "Change weapon grouping method used when buying a weapon from the black market menu. Requires restart.",
		["base_wpn_cat"] = "base skill",
		["sub_wpn_cat"] = "sub-category & damage tier",

		["RestorationModWepNamesTitleID"] = "Weapon (Re)Names",
		["RestorationModWepNamesDescID"] = "Change the naming style of weapons and attachments. Requires restart.",
		["resmod_res_names"] = "Resmod Names (Default)",
		["resmod_no_nicknames"] = "Resmod Names (No Nicknames)",
		["dmcwo_reelnames"] = "Real Weapon Names (DMCWO Port - WIP)",
		["resmod_no_renames"] = "Vanilla Names (or use your own rename mods)",

		--WEAPON HANDLING
		["RestorationModStaticAimTitleID"] = "No Weapon Movement While ADS",
		["RestorationModStaticAimDescID"] = "Enables/Disables cosmetic sway and drift while aiming; overrides the \"Viewmodel Movement\" setting when enabled. Requires restart. WARNING: MAY MAKE SOME OPTICS UNUSABLE IF UNCHECKED",
		["RestorationModViewmodelMovementTitleID"] = "Viewmodel Movement",
		["RestorationModViewmodelMovementDescID"] = "Choose how your weapons' viewmodel moves on screen as you look around; ADS movement is overridden by the \"No Weapon Movement While ADS\" setting if enabled. Requires restart.",
			["vm_vanilla"] = "Vanilla Behavior",
			["vm_drag"] = "Weapon Drags Behind",
			["vm_lead"] = "Weapon Leads Ahead",
			["vm_static"] = "Static (No Movement)",
		["RestorationModCarpalTunnelTitleID"] = "Recoil Auto-Recovery",
		["RestorationModCarpalTunnelDescID"] = "Choose how recoil auto-recovery mechanics work. Enabled versions are balanced differently.",
			["rr_off"] = "Disabled",
			["rr_per_weapon"] = "Weapon specific",
			["rr_full"] = "Full",
		["RestorationModAutoDMRsTitleID"] = "Marksmen Rifles Start Full-Auto",
		["RestorationModAutoDMRsDescID"] = "Toggle whether or not all Marksmen Rifles with semi-auto and full-auto firemodes start off on full-auto.",
		["RestorationModSprintCancelTitleID"] = "Evasion Aced Sprint Cancels Reload",
		["RestorationModSprintCancelDescID"] = "Toggle whether or not if *STARTING* a sprint will cancel any on-going reload when you have aced the \"Evasion\" skill. Reloading while actively sprinting is unaffected.",
		["RestorationModQueuedShootingTitleID"] = "Buffer Fire Inputs",
		["RestorationModQueuedShootingDescID"] = "Enable/disable fire input buffering for semi-auto and weapons to assist with oversampling (sending inputs faster than the weapon can fire).",
		["RestorationModQueuedShootingWindowTitleID"] = "Single-Fire Buffer Sensitivity",
		["RestorationModQueuedShootingWindowDescID"] = "Determines the time window for your fire inputs to be buffered based on a % of the weapon's fire time delay. Higher value = earlier buffer",
		["RestorationModQueuedShootingExcludeTitleID"] = "Single-Fire Input Buffer Firerate Limit",
		["RestorationModQueuedShootingExcludeDescID"] = "Limits the buffering of fire inputs to weapons that fire *above* the fire rate (RPM) set by this option.",
		["RestorationModQueuedShootingMidBurstTitleID"] = "Burstfire Mid-Burst Input Buffer",
		["RestorationModQueuedShootingMidBurstDescID"] = "Buffer fire inputs made *during* a burst.",
		["RestorationModNoADSRecoilAnimsTitleID"] = "No ADS Recoil Animations",
		["RestorationModNoADSRecoilAnimsDescID"] = "Enable/disable ADS recoil animations. Some weapons are not affected by this option (i.e. Manually operated guns, bows, flamethrowers)",
		["RestorationModNoSwapOnReviveTitleID"] = "No Forced Weapon Swap on Revive",
		["RestorationModNoSwapOnReviveDescID"] = "Disables the forced weapon swap upon being revived when going down with a primary without Undying Aced.",
		["RestorationModSecondSightSprintTitleID"] = "Sprint button for second sight toggle",
		["RestorationModSecondSightSprintDescID"] = "Use the sprint button instead of the gadget button to toggle secondary sights while ADS.\nWhile enabled gadgets can be toggled as they could prior to U232 but you cannot enter a sprint while ADS.",
		["RestorationModADSTransitionStyleTitleID"] = "ADS Style",
		["RestorationModADSTransitionStyleDescID"] = "Change the transition style of aiming down your sights.",
			["vanilla_on_rails"] = "Default/On-Rails",
			["kf_mw_style"] = "KF1/CoD Style",
			["tilt_in"] = "Tilted In",
		["RestorationModAimDeploysBipodTitleID"] = "ADS Deploys Bipod",
		["RestorationModAimDeploysBipodDescID"] = "Enable/disable bipods auto-mounting when ADSing over a valid surface.",
		["RestorationModMoveCancelBipodTitleID"] = "Movement Dismounts Bipod",
		["RestorationModMoveCancelBipodDescID"] = "Enable/disable basic movement inputs dismounting bipods.",
		["RestorationModSeparateBowADSTitleID"] = "Separate Bow Aiming",
		["RestorationModSeparateBowADSDescID"] = "Disables forced aiming with bows when drawing an arrow. While enabled, your reload key is used to let down your drawn arrow.",
		["RestorationModPerPelletShotgunsTitleID"] = "Per-Pellet Shotgun Damage (WIP)",
		["RestorationModPerPelletShotgunsDescID"] = "Shotgun damage is calculated per pellet as opposed to the standard \"1 pellet = full damage, headshots prioritized\". Non-slug shotgun damage is increased to compesate for lower consistency. Requires restart.",


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
		["RestorationModCloakerTurnTitleID"] = "Cloaker Kick Camera Turn",
		["RestorationModCloakerTurnDescID"] = "Enable or disable the Cloaker Camera Turn behavior from Vanilla when getting Cloaker kicked.",		
		["RestorationModDisableMutatorColorsTitleID"] = "Disable Mutator Assault Banner Colors",
		["RestorationModDisableMutatorColorsDescID"] = "Disable the color change to the Assault Banner when using mutators (Vanilla HUD only).",			
		["RestorationModRestoreHitFlashTitleID"] = "Restore Hit Flash",
		["RestorationModRestoreHitFlashDescID"] = "Enable or disable the restored hit flash when taking damage.",	
		["RestorationModBotsNoDropTitleID"] = "Disable Bot Loot Bag Dropping",
		["RestorationModBotsNoDropDescID"] = "Enable or disable bots dropping loot bags.",			
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
		["restoration_level_data_firestarter_1"] = "7:25 PM, Private Airport",
		["restoration_level_data_firestarter_1_res"] = "7:25 PM, Private Airport",
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
		["restoration_level_data_roberts"] = "8:47 AM, Roberts Bank of Savings & Trust",
		["restoration_level_data_roberts_v2"] = "8:47 AM, Roberts Bank of Savings & Trust",
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
		["restoration_level_data_nmh_res"] = "8:24 PM, Mercy Hospital - Isolation Ward",
		["restoration_level_data_vit"] = "1:07 PM, Washington D.C. - The White House",
		["restoration_level_data_mex"] = "TIME CLASSIFIED, United States - Southern Border",
		["restoration_level_data_mex_cooking"] = "TIME CLASSIFIED, Mexico - Coyopa Compound",
		["restoration_level_data_bex"] = "TIME CLASSIFIED, Mexico - San Martín Bank",
		["restoration_level_data_pex"] = "TIME CLASSIFIED, Mexico - Police Station",
		["restoration_level_data_fex"] = "TIME CLASSIFIED, Mexico - Buluc's Mansion",
		["restoration_level_data_chas"] = "8:30 PM, San Francisco - Chinatown",
		["restoration_level_data_sand"] = "10:30 PM, San Francisco - Dockyard",
		["restoration_level_data_chca"] = "9:24 PM, San Francisco Bay - The Black Cat",
		["restoration_level_data_pent"] = "11:30 PM, San Francisco - Yufu Wang's Penthouse",
		["restoration_level_data_ranc"] = "6:24 PM, Texas - Midland Ranch",
		["restoration_level_data_trai"] = "7:40 PM, Fort Worth - Dalton Yard",
		["restoration_level_data_corp"] = "8:35 PM, Dallas - SERA R&D Facility",
		["restoration_level_data_deep"] = "9:00 PM, Gulf of Mexico - SERA's Oil Rig Tanker",
		["restoration_level_data_wetwork"] = "TIME CLASSIFIED, LOCATION CLASSIFIED",
		["restoration_level_data_junk"] = "TIME CLASSIFIED, LOCATION CLASSIFIED",
		["restoration_level_data_holly"] = "5:00 PM, Los Angeles - Lukas' Mansion",
		["restoration_level_data_lvl_friday"] = "5:00 PM, Shield Mall",
		["restoration_level_data_skm_nightmare_lvl"] = "A laundromat? Are you here to wash away your sins?",

		--custom heists
		["restoration_level_data_flatline_lvl"] = "10:26 PM, Больница им. Н.И. Пирогова", --Flatline
		["restoration_level_data_ahopl"] = "9:06 PM, Yuri's Private Club", --A House of Pleasure
		["restoration_level_data_atocl"] = "7:03 PM, Penthouse Party", --A Touch of Class
		["restoration_level_data_rusdl"] = "10:23 AM, Garnet Group Jewelery Store", --Cold Stones
		["restoration_level_data_crimepunishlvl"] = "1:19 PM, Correctional Facility Somewhere in Russia", --Crime and Punishment
		["restoration_level_data_deadcargol"] = "8:36 PM, Sewers Under The Depot", --Deadly Cargo
		["restoration_level_data_hunter_party"] = "3:56 PM, Nikolai's Penthouse", --Hunter and Hunted d1
		["restoration_level_data_hunter_departure"] = "10:13 PM, Aleksandr's Private Airport", --Hunger and Hunted d2
		["restoration_level_data_hunter_fall"] = "1:36 AM, Somewhere Over International Waters", --Hunter and Hunted d3
		["restoration_level_data_ruswl"] = "11:50 AM, Somewhere in Russia", --Scorched Earth
		["restoration_level_data_jambank"] = "11:59 AM, Harvest & Trustee Bank", --Botched Bank
		["restoration_level_data_2Fort"] = "Overime, Somewhere in Teufort", --2fort
		["restoration_level_data_anlh"] = "2:35 PM, Jian Liang's Villa", --An End to Liang
		["restoration_level_data_lvl_fourmorestores"] = "3:12 PM, Storefronts", --Four More Stores
		["restoration_level_data_TonCont"] = "11:01 AM, Atrium", --AT: Atrium
		["restoration_level_data_amsdeal1"] = "9:49 PM, Alleyways", --Armsdeal Alleyway
		["restoration_level_data_ascension_III"] = "10:53 PM, Eclipse Research Facility", --Ascension
		["restoration_level_data_hwu"] = "11:03 PM, Avalon Logistics Safehouse", --Avalon's Shadow
		["restoration_level_data_vrc1"] = "2:35 PM, Downtown District", --A Very Richie Christmas d1
		["restoration_level_data_vrc2"] = "6:46 PM, Storage Warehouse", --A Very Richie Christmas d2
		["restoration_level_data_vrc3"] = "11:04 PM, GenSec Tower", --A Very Richie Christmas d3
		["restoration_level_data_btms"] = "4:40 AM, Nevada - Black Ridge Facility", --Blackridge Facility
		["restoration_level_data_BloodMoney"] = "8:00 PM, Downtime Offices", --Blood Money
		["restoration_level_data_brb_rant"] = "6:53 PM, New York, BROOKLYN - Harvest & Trustee Branch Bank", --Brooklyn Bank Ranted
		["restoration_level_data_lit1"] = "4:20 PM, California Green Store", --California Heat
		["restoration_level_data_lit2"] = "4:20 PM, Almir's Games Store", --California Heat - Almir's Games
		["restoration_level_data_dwn1"] = "7:12 PM, California Green depot", --Deep Inside
		["restoration_level_data_the_factory"] = "9:37 PM, Eclipse Research Facility", --Eclipse Research Facility
		["restoration_level_data_Election_Funds"] = "10:29 PM, Electoral Headquarter", --Election Funds
		["restoration_level_data_constantine_mex_level"] = "3:46 PM, Somewhere in Mexico", --End of an Era
		["restoration_level_data_battlearena"] = "11:14 PM, Georgetown", --FiveG
		["restoration_level_data_funbank"] = "Something doesn't look right...", --Funbank
		["restoration_level_data_RogueCompany"] = "8:20 PM, Jackals Territory", --Rogue Company
		["restoration_level_data_bnktower"] = "TIME CLASSIFIED, GenSec H.I.V.E.", --GenSec HIVE
		["restoration_level_data_glb"] = "11:19 AM, Golden Lotus Bank", --Golden Lotus Bank
		["restoration_level_data_constantine_harbor_lvl"] = "9:12 PM, Dockyard Warehouses", --Harboring a Grudge
		["restoration_level_data_tonmapjam22l"] = "4:49 PM, Harvest & Trustee Bank", --Hard Cash
		["restoration_level_data_hardware_store"] = "7:36 PM, Hardware Store", --Hardware Store
		["restoration_level_data_tj_htsb"] = "1:10 PM, Harvest & Trustee Bank", --H&T Southern Branch
		["restoration_level_data_tj_htsb_escape_level"] = "Escape!", --H&T Southern Branch escape day? probably unused, dunno
		["restoration_level_data_hntn"] = "9:16 AM, Harvest & Trustee Bank", --H&T Northern Branch
		["restoration_level_data_hidden_vault"] = "11:08 PM, Kranich facility downtown", --Hidden Vault
		["restoration_level_data_crumch_returns"] = "12:50 PM, Shield Mall", --Mallcrasher Ranted
		["restoration_level_data_mansion_stage1"] = "2:13 AM, Sir Elmsworth's Mansion", --Elmsworth Mansion
		["restoration_level_data_skm_nmh"] = "9:12 PM, Mercy Hospital - Roof", --No Mercy SKM
		["restoration_level_data_office_strike"] = "1:57 PM, Downtown FBI Offices", --Office Strike	
		["restoration_level_data_highrise_stage1"] = "1:03 AM, Tremblay's Apartment", --Out of Frame
		["restoration_level_data_constantine_bank_lvl"] = "12:00 PM, Pacific Bank", --Pacific Bank
		["restoration_level_data_sh_raiders"] = "5:16 PM, Outskirts Warehouse", --Safehouse Raiders
		["restoration_level_data_santas_hardware_store"] = "3:47 PM, Hardware Store", --Santa's Hardware Store
		["restoration_level_data_schl"] = "9:57 PM, The Scarlet Club", --Scarlet Club
		["restoration_level_data_skm_wd2_x"] = "6:09 PM, Almendia Logistics Dockyard", --Watchdogs d2 SKM revamp
		["restoration_level_data_Skyscraper"] = "2:13 AM, GenSec Corporate Headquarters", --Skyscraper Heist
		["restoration_level_data_tonisl1"] = "3:31 PM, Harvest & Trustee Bank", --Grand Harvest
		["restoration_level_data_ttr_yct_lvl"] = "2:19 PM, Wei Cheng's Yacht", --Triad Takedown Remastered
		["restoration_level_data_Tonis2"] = "1:31 PM, Harbor Warehouses", --Triple Threat
		["restoration_level_data_trop"] = "11:48 AM, Somewhere Over International Waters", --Tropical Treasure
		["restoration_level_data_Gambling_room"] = "9:29 PM, Twenty Four Seven Store", --Underground Bargains
		["restoration_level_data_finsternis"] = "5:24 PM, Germany - Schwarzwald", --Projekt Finsternis

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
		["RestorationModDownsThreePlusTitleID"] = "Down counter (3+ downs left)",
		["RestorationModDownsTwoTitleID"] = "Down counter (2 downs left)",
		["RestorationModDownsOneTitleID"] = "Down counter (1 downs left)",
		["RestorationModDownsZeroTitleID"] = "Down counter (0 downs left)",
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

		["RestorationModDodgeDisplayTitleID"] = "Dodge Meter Readout",
		["RestorationModDodgeDisplayDescID"] = "Change what the dodge meter's maximum value *displays*. Requires restart.",
		["dd_scale"] = "150 -Dodge rating",
		["dd_150"] = "150",
		["dd_100"] = "100",

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
		["menu_jukebox_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Old Version)",
		["menu_jukebox_screen_resmusic_thetakeoriginal"] = "Phoney Money / The Take (Old Version)",
		["menu_jukebox_resmusic_razormindbeta"] = "Razormind (Beta Version)",
		["menu_jukebox_screen_resmusic_razormindbeta"] = "Razormind (Beta Version)",
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
		["menu_jukebox_screen_m7"] = "Pre-Planning",
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

		["resmod_challenges"] = "Challenges",
		["resmod_challenges_hint"] = "View completed and active challenges.",
		["resmod_active_challenges"] = "Active Challenges",
		["resmod_active_challenges_hint"] = "Current and active challenges.",
		["resmod_completed_challenges"] = "Completed Challenges",
		["resmod_completed_challenges_hint"] = "Completed and rewarded challenges.",

		["ch_vs_desc"] = "Using a $weapon, defeat $count $eneType. Using melee does not contribute to this challenge.",
		["ch_vs_head_shots_desc"] = "Using a $weapon, defeat $count $eneType with Headshots.",
		["ch_vs"] = "$weapon VS. $eneType $no",
		["ch_vs_head_shots"] = "$weapon VS. $eneType HEADSHOTS $no",

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
		
		["menu_description"] = "The Plan",
		
		-- ///Stuff ripped from the various locale files we had ///
		
		--Halloween Dozer Sword
		["bm_melee_halloween_sword"] = "Headless Bulldozer's Sword",
		["menu_l_global_value_halloween_sword"] = "This is a Halloween 2013 item!",
		
		["menu_l_global_value_shatters_fury"] = "This is a VERITAS item!",

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
		["menu_alex_1_zipline_desc"] = "Bag Zipline for quick bag transport",
		
		
		--The Bomb: Forest Breifing
		["heist_crojob3_briefing"] = "Those thermobaric explosives were loaded onto a freight train this morning. It's heading down to Norfolk. Maybe to be sold on, maybe to be decommissioned - it doesn't matter, because it won't reach there. A moving train is tough to stop, so we're doing this Old West style. Blow a section of bridge and the whole thing comes tumbling down. It's loud and messy, but effective. The wagons will be scattered to hell. One of them has a vault where our explosives are - search each of 'em til you find it. \n\nNOTE FROM JACKAL:\nI've got intel on Reaper teams near the scene - seems Akan wants this prize for himself. Prepare for trouble.",
		
		--Watchdogs Holdout
		["heist_skm_watchdogs_stage2_briefing"] = "Mia Calienté is a real piece of work, friends. For years she's been the brains behind the Murkywater's operations in DC. Not too long ago, Murkywater took over a warehouse at the docks and they've using it as an additional distribution point. Our target is there checking in on some loot recently plundered from abroard. We're going to get in there, grab the dwankie and take her hostage. The Murkies can't afford to lose her, they will pay for her release, maybe with the aforementioned and rather valuable plunder, what do you say gang?",
		
		--Side Jobs
		["menu_challenge_menu_challenge_moon_6_obj"] = "Complete the Slaughterhouse job on the OVERKILL difficulty or above without killing Captain Spring."
		
	})

	-- maybe need change banner descriptions
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)	
	local job = Global.level_data and Global.level_data.level_id
	local captain_type = job and restoration.captain_spawns[job]
	if captain_type == restoration.captain_types.winter and job == "crojob3" or job == "crojob3_night" then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "HAVE NO FEAR, CAPTAIN WINTERS IS HERE!!",
		})
	elseif captain_type == restoration.captain_types.winter then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "KILL CAPTAIN WINTERS TO END ASSAULT",
		})	
	elseif captain_type == restoration.captain_types.summer then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "KILL CAPTAIN SUMMERS TEAM TO END ASSAULT",
		})
	elseif captain_type == restoration.captain_types.spring then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "KILL CAPTAIN SPRING TO END ASSAULT",
		})		
	elseif captain_type == restoration.captain_types.autumn then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "KILL CAPTAIN AUTUMN TO END ASSAULT",
		})		
	elseif captain_type == restoration.captain_types.hvh then
		LocalizationManager:add_localized_strings({	
			["hud_assault_vip"] = "FACE YOUR NIGHTMARES AND WAKE UP",
		})
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
		["heist_skmc_fish_name"] = "Lethe Yacht",
		["heist_skmc_ovengrill_name"] = "Ovengrill Hardware",
		["heist_skmc_mad_name"] = "DRAK R&D Laboratories",
		["heist_skm_friend_name"] = "El Fureidis Mansion",
		["heist_skm_nightmare_name"] = "The Old Safehouse",
		["heist_skm_nightmare_lvl_name"] = "The Safehouse?",

		--Heist Breifings--
		["heist_pines_briefing"] = "We need you there fast, because it's really out in the sticks, so you're going in like the paras. Find the pilot - he's probably near the wreck, and then we'll send in a chopper to extract him. Stay with him til he's safely out, Also, Vlad says that plane was loaded with product, Search the forest and get as much out as you can. We could always use a little extra cash during Christmas.\n\nNOTE FROM JACKAL:\nThe explosion from that crash alerted nearby Reaper teams. Don't expect a police response.",

		----Custom Achievements----
				
		--Scarface Mansion--
		["skm_friend_name"] = "Holdout: El Fureidis Mansion",
		["friend_3"] = "Fuckin' With the Best",
		["friend_3_desc"] = "Having started from wave 1, beat wave 3 of Holdout on the El Fureidis Mansion heist.",
		["friend_3_obj"] = "Having started from wave 1, beat wave 3 of Holdout on the El Fureidis Mansion heist.",
		["friend_5"] = "The Hostage is Yours",
		["friend_5_desc"] = "Having started from wave 1, beat wave 5 of Holdout on the El Fureidis Mansion heist.",
		["friend_5_obj"] = "Having started from wave 1, beat wave 5 of Holdout on the El Fureidis Mansion heist.",
		["friend_7"] = "You Think You Kill Me With Bullets?",
		["friend_7_desc"] = "Having started from wave 1, beat wave 7 of Holdout on the El Fureidis Mansion heist.",
		["friend_7_obj"] = "Having started from wave 1, beat wave 7 of Holdout on the El Fureidis Mansion heist.",
		["friend_9"] = "Look at 'em Run!",
		["friend_9_desc"] = "Having started from wave 1, beat wave 9 of Holdout on the El Fureidis Mansion heist.",
		["friend_9_obj"] = "Having started from wave 1, beat wave 9 of Holdout on the El Fureidis Mansion heist.",

		--Safehouse Nightmare--
		["skm_nightmare_name"] = "Holdout: The Old Safehouse",
		["nightmare_3"] = "Is it really that time again?", --translation note: quote from HL2 ending gman speech
		["nightmare_3_desc"] = "Having started from wave 1, beat wave 3 of Holdout on the Old Safehouse heist.",
		["nightmare_3_obj"] = "Having started from wave 1, beat wave 3 of Holdout on the Old Safehouse heist.",
		["nightmare_5"] = "As long as nothing supernatural happens, this should be easy.", --translation note: quote from TF2 spy (Helltower event)
		["nightmare_5_desc"] = "Having started from wave 1, beat wave 5 of Holdout on the Old Safehouse heist.",
		["nightmare_5_obj"] = "Having started from wave 1, beat wave 5 of Holdout on the Old Safehouse heist.",
		["nightmare_7"] = "No matter how dark the night, the morning always comes.", --translation note: quote from Lulu (Final Fantasy X)
		["nightmare_7_desc"] = "Having started from wave 1, beat wave 7 of Holdout on the Old Safehouse heist.",
		["nightmare_7_obj"] = "Having started from wave 1, beat wave 7 of Holdout on the Old Safehouse heist.",
		["nightmare_9"] = "Wake up, Mister Steele. Wake up and smell the ashes.", --translation note: quote from HL2 intro gman speech + Dallas' alias
		["nightmare_9_desc"] = "Having started from wave 1, beat wave 9 of Holdout on the Old Safehouse heist.",
		["nightmare_9_obj"] = "Having started from wave 1, beat wave 9 of Holdout on the Old Safehouse heist.",
				
		--Shotgun Generic Mods--
		["bm_wp_ns_duck_desc_sc"] = "Causes pellets to #{risk}#spread horizontally## instead of clustering.",
		["bm_wp_ns_ultima_desc_sc"] = "Increases overall spread of pellets by 75%.",
		["bm_wp_upg_a_slug_sc"] = "AP Slug",
		["bm_wp_upg_a_slug_spam_desc"] = "Fires a lead slug that #{skill_color}#deals 75% of its damage through body armor and pierces enemies and thin walls.##",
		["bm_wp_upg_a_slug_desc"] = "Fires a lead slug that #{skill_color}#pierces body armor, multiple enemies, shields and thin walls.##",
		["bm_wp_upg_a_slug_titan_desc"] = "Fires a lead slug that #{skill_color}#pierces body armor, multiple enemies, shields, titan-shields and thin walls.##",
		["bm_wp_upg_a_explosive_desc_sc"] = "Fires an #{heat_warm_color}#explosive## slug with a blast radius of #{skill_color}#1.5## meters.\nSlugs have #{skill_color}#no falloff## but #{risk}#damage is split between the slug and explosion.##",
		["bm_wp_upg_a_custom_desc"] = "Fires #{important_1}#6## larger, heavier pellets that deal #{skill_color}#increased## damage.",
		["bm_wp_upg_a_dragons_breath_auto_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#15%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#90## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.##", --NOT IN USE
		["bm_wp_upg_a_dragons_breath_semi_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#40%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#120## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.\n\nDeals fire damage instead of bullet damage.##",
		["bm_wp_upg_a_dragons_breath_pump_desc_sc"] = "Fires magnesium shards that have up to a #{skill_color}#60%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#180## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.\n\nDeals fire damage instead of bullet damage.##",
		["bm_wp_upg_a_dragons_breath_heavy_desc_sc"] = "Fires magnesium shards that have up to an #{skill_color}#80%## chance to #{heat_warm_color}#set enemies on fire##, dealing #{heat_warm_color}#240## damage over #{skill_color}#2## seconds.\n\n#{risk}#Chance is reduced over range and can only stun enemies before damage falloff starts.\n\nDeals fire damage instead of bullet damage.##",
		["bm_wp_upg_a_rip"] = "Tombstone Buckshot",
		["bm_wp_upg_a_rip_auto_desc_sc"] = "Fires #{stats_positive}#poison laced## buckshot, potentially stunning enemies and dealing #{stats_positive}#60## poison damage over #{skill_color}#2## second.\n\n#{risk}#Duration diminishes over range.##",
		["bm_wp_upg_a_rip_semi_desc_sc"] = "Fires #{stats_positive}#poison laced## buckshot, potentially stunning enemies and dealing #{stats_positive}#120## poison damage over #{skill_color}#4## seconds.\n\n#{risk}#Duration diminishes over range.##",
		["bm_wp_upg_a_rip_pump_desc_sc"] = "Fires #{stats_positive}#poison laced## buckshot, potentially stunning enemies and dealing #{stats_positive}#180## poison damage over #{skill_color}#6## seconds.\n\n#{risk}#Duration diminishes over range.##",
		["bm_wp_upg_a_rip_heavy_desc_sc"] = "Fires #{stats_positive}#poison laced## buckshot, potentially stunning enemies and dealing #{stats_positive}#240## poison damage over #{skill_color}#8## seconds.\n\n#{risk}#Duration diminishes over range.##",
		--["bm_wp_upg_a_piercing_auto_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#96## bleed damage over #{skill_color}#8## seconds.",
		--["bm_wp_upg_a_piercing_semi_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#120## bleed damage over #{skill_color}#8## seconds.",
		--["bm_wp_upg_a_piercing_pump_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#180## bleed damage over #{skill_color}#8## seconds.",
		--["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes that inflict #{skill_color}#240## bleed damage over #{skill_color}#8## seconds.",
		["bm_wp_upg_a_piercing_auto_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.",
		["bm_wp_upg_a_piercing_semi_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.",
		["bm_wp_upg_a_piercing_pump_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.",
		["bm_wp_upg_a_piercing_heavy_desc_sc"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.",
		["bm_wp_upg_a_piercing_auto_desc_per_pellet"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.\n#{skill_color}#Headshot damage is increased by 100% and there is no reduction to enemy headshot multipliers.##",
		["bm_wp_upg_a_piercing_semi_desc_per_pellet"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.\n#{skill_color}#Headshot damage is increased by 100% and there is no reduction to enemy headshot multipliers.##",
		["bm_wp_upg_a_piercing_pump_desc_per_pellet"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.\n#{skill_color}#Headshot damage is increased by 100% and there is no reduction to enemy headshot multipliers.##",
		["bm_wp_upg_a_piercing_heavy_desc_per_pellet"] = "Fires #{skill_color}#12## #{skill_color}#armor piercing## flechettes.\n#{skill_color}#Headshot damage is increased by 100% and there is no reduction to enemy headshot multipliers.##",

		--Generic Optic Zoom Descriptions--
		["bm_wp_upg_o_1_1"] = "Reflex sight.\n#{risk}#1.1x magnification.##",
		["bm_wp_upg_o_1_1_health"] = "Reflex sight that #{skill_color}#displays the health of enemies## while aiming at them.\n#{risk}#1.1x magnification.##",
		["bm_wp_upg_o_1_2"] = "Red dot sight.\n#{risk}#1.2x magnification.##",
		["bm_wp_upg_o_1_5"] = "Holographic sight.\n#{risk}#1.5x magnification.##",
		["bm_wp_upg_o_1_5_pris"] = "Prismatic sight.\n#{risk}#1.5x magnification.##",
		["bm_wp_upg_o_1_5_scope"] = "Low-powered scope.\n#{risk}#1.5x magnification.##",
		["bm_wp_upg_o_1_8"] = "Red dot sight.\n#{risk}#1.8x magnification.##",
		--["bm_wp_upg_o_1_8_irons"] = "Red dot sight with back-up ironsights.\n#{risk}#1-1.8x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_2"] = "Low-powered scope.\n#{risk}#2x magnification.##",
		["bm_wp_upg_o_3"] = "Mid-range scope.\n#{risk}#3x magnification.##",
		["bm_wp_upg_o_3_range"] = "Mid-range scope with a built-in #{skill_color}#rangefinder.##\n#{risk}#3x magnification.##",
		["bm_wp_upg_o_3_rds"] = "Mid-range scope with a top-mounted reflex sight.\n#{risk}#1.1-3x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_3_4"] = "Mid-range scope.\n#{risk}#3.4x magnification.##",
		["bm_wp_upg_o_3_5"] = "Mid-range scope.\n#{risk}#3.5x magnification.##",
		["bm_wp_upg_o_4"] = "Mid-range scope.\n#{risk}#4x magnification.##",
		["bm_wp_upg_o_4_cod"] = "Mid-range scope.\nWhere's #{skill_color}#Stopping Power## when you need it?\n#{risk}#4x magnification.##",
		["bm_wp_upg_o_4_range"] = "Mid-range scope with a built-in #{skill_color}#rangefinder.##\n#{risk}#4x magnification.##",
		["bm_wp_upg_o_4_irons"] = "Mid-range scope with back-up ironsights.\n#{risk}#1-4x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_4_rds"] = "Mid-range scope with an integral reflex sight.\n#{risk}#1.1-4x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_4_rds_mount"] = "Mid-range scope with a top-mounted reflex sight.\n#{risk}#1.1-4x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_4_vari"] = "Variable zoom scope.\n#{risk}#4-8x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_4_valentine"] = "\"I got a class assignment for all of y'all!\"\n\nVariable zoom scope.\n#{risk}#4-8x magnification.##\n\nPress #{skill_color}#$BTN_GADGET## while aiming to switch between sights.",
		["bm_wp_upg_o_4_valentine_x"] = "I don't give a shit, I don't give a fuck!\nI don't give a shit! I don't give a fuck!\nNow if I give a shit, I might just give a fuck!\nBut I don't give a shit, so I don't give a fuck!",
		["bm_wp_upg_o_5"] = "Long-range scope.\n#{risk}#5x magnification.##",
		["bm_wp_upg_o_5_range"] = "Long-range scope with a built-in #{skill_color}#rangefinder.##\n#{risk}#5x magnification.##",
		["bm_wp_upg_o_6"] = "Long-range scope.\n#{risk}#6x magnification.##",
		["bm_wp_upg_o_6_range"] = "Long-range scope with a built-in #{skill_color}#rangefinder.##\n#{risk}#6x magnification.##",
		["bm_wp_upg_o_8"] = "Long-range scope.\n#{risk}#8x magnification.##",
		["bm_wp_upg_o_8_range"] = "Long-range scope with a built-in #{skill_color}#rangefinder.##\n#{risk}#8x magnification.##",

		["bm_wp_upg_fl_flashlight"] = "Toggle the flashlight on/off by pressing #{skill_color}#$BTN_GADGET.##",
		["bm_wp_upg_fl_laser"] = "Toggle the laser on/off by pressing #{skill_color}#$BTN_GADGET.##",
		["bm_wp_upg_fl_dual"] = "Toggle between the laser and flashlight by pressing #{skill_color}#$BTN_GADGET.##",
		["bm_wp_upg_fl_vmp_marker"] = "#{skill_color}#Automatically marks## guards, special enemies, and elites within #{skill_color}#40## meters of you when you aim at them.\n\n#{risk}#NOTE: Guards can only be marked during stealth.##",
		["bm_wp_upg_fl_second_sight_warning"] = "\n\n#{important_1}#CANNOT BE TOGGLED WHILE AIMING AS A SECONDARY SIGHT IS ATTACHED.##",

		["bm_wp_upg_o_angled_desc"] = "Press #{skill_color}#$BTN_GADGET## while aiming to switch between your main optic and the angled iron sights.",
		["bm_wp_upg_o_angled_1_1_desc"] = "Press #{skill_color}#$BTN_GADGET## while aiming to switch between your main optic and the angled reflex sight.\n#{skill_color}#1.1x magnification.##",
		["bm_wp_upg_o_angled_1_2_desc"] = "Press #{skill_color}#$BTN_GADGET## while aiming to switch between your main optic and the angled red dot sight.\n#{skill_color}#1.2x magnification.##",
		["bm_wp_upg_o_angled_laser_desc"] = "Press #{skill_color}#$BTN_GADGET## while aiming to switch between your main optic or to angle your weapon and utilize your laser to aim.\n\n#{risk}#Highly recommend the use of a laser gadget.##", --VMP Point Shoot Laser

		["bm_wp_upg_o_magnifier_desc"] = "Press #{skill_color}#$BTN_GADGET## while aiming to flip the magnifier up/down.\n#{risk}#3x magnification.##",

		--'Nade Launchers--
		["bm_wp_upg_a_grenade_launcher_incendiary_desc_sc"] = "Fires a round that creates a #{heat_warm_color}#pool of fire## at point of impact.\nThe pool has a radius of #{skill_color}#3.75m##, lasts #{skill_color}#5## seconds and deals #{skill_color}#120## damage/sec to enemies standing in it with a chance to set them on fire, causing most to panic while dealing an additional #{skill_color}#60## damage over #{skill_color}#3## seconds.",
		["bm_wp_upg_a_grenade_launcher_incendiary_arbiter_desc_sc"] = "Fires a round that creates a #{heat_warm_color}#pool of fire## at point of impact.\nThe pool has a radius of #{skill_color}#3.75m##, lasts #{skill_color}#5## seconds and deals #{skill_color}#80## damage/sec to enemies standing in it with a chance to set them on fire, causing most to panic while dealing an additional #{skill_color}#60## damage over #{skill_color}#3## seconds.",
		["bm_wp_upg_a_grenade_launcher_incendiary_ms3gl_desc_sc"] = "Fires a round that creates a #{heat_warm_color}#pool of fire## at point of impact.\nThe pool has a radius of #{skill_color}#3.75m##, lasts #{skill_color}#5## seconds and deals #{skill_color}#40## damage/sec to enemies standing in it with a chance to set them on fire, causing most to panic while dealing an additional #{skill_color}#60## damage over #{skill_color}#3## seconds.",
		["bm_wp_upg_a_grenade_launcher_frag_desc_sc"] = "Fires a round that creates an #{risk}#explosion## at point of impact. The explosion deals #{skill_color}#720## damage and has a radius of #{skill_color}#5## meters.",
		["bm_wp_upg_a_grenade_launcher_electric_desc_sc"] = "Fires a round that creates a #{ghost_color}#burst of electricity## at point of impact. The burst deals #{skill_color}#360## damage, has a radius of #{skill_color}#5## meters, and has a chance to #{ghost_color}#tase enemies.##",
		["bm_wp_upg_a_grenade_launcher_electric_ms3gl_desc_sc"] = "Fires a round that creates a #{ghost_color}#burst of electricity## at point of impact. The burst deals #{skill_color}#180## damage, has a radius of #{skill_color}#5## meters, and has a chance to #{ghost_color}#tase enemies.##",
		["bm_wp_upg_a_grenade_launcher_electric_arbiter_desc_sc"] = "Fires a round that creates a #{ghost_color}#burst of electricity## at point of impact. The burst deals #{skill_color}#300## damage, has a radius of #{skill_color}#3## meters, and has a chance to #{ghost_color}#tase enemies.##",
		["bm_wp_upg_a_grenade_launcher_poison"] = "Manticore-6 Round",
		["bm_wp_upg_a_grenade_launcher_poison_desc_sc"] = "Fires a round that creates a #{stats_positive}#cloud of poisonous gas## at point of impact.\nThe gas has a radius of #{skill_color}#6## meters, lingers for #{skill_color}#10## seconds, deals #{skill_color}#240## damage over #{skill_color}#8## seconds, and #{stats_positive}#induces vomiting## in most enemies #{important_1}#1## time when caught in it.",
		["bm_wp_upg_a_grenade_launcher_poison_arbiter_desc_sc"] = "Fires a round that creates a #{stats_positive}#cloud of poisonous gas## at point of impact.\nThe gas has a radius of #{skill_color}#6## meters, lingers for #{skill_color}#8## seconds, deals #{skill_color}#180## damage over #{skill_color}#6## seconds, and #{stats_positive}#induces vomiting## in most enemies #{important_1}#1## time when caught in it.",
		["bm_wp_upg_a_grenade_launcher_poison_ms3gl_desc_sc"] = "Fires a round that creates a #{stats_positive}#cloud of poisonous gas## at point of impact.\nThe gas has a radius of #{skill_color}#6## meters, lingers for #{skill_color}#6## seconds, deals #{skill_color}#120## damage over #{skill_color}#4## seconds, and #{stats_positive}#induces vomiting## in most enemies #{important_1}#1## time when caught in it.",

		--Flamethrowers--
		["bm_wp_fla_mk2_mag_rare_sc"] = "Rare",
		["bm_wp_fla_mk2_mag_rare_desc_sc"] = "Doubles the burn duration on ignited enemies, but halves damage over time.",
		["bm_wp_fla_mk2_mag_well_desc_sc"] = "Halves the burn duration on ignited enemies, but doubles damage over time.",
		["bm_ap_flamethrower_sc_desc"] = "Thousands of degrees of pure pain. How did it come to this?\n#{heat_warm_color}#Burns through body armor.##",
		["bm_ap_money_sc_desc"] = "Thousands of dollars of pure bliss. Turn the valve, and unleash the cash.\n#{competitive_color}#Bribes through body armor.##", --used by both flamethrowers, decouple later?--

		--LMGs/Miniguns--
		["bm_wp_upg_a_halfthatkit"] = "Super Size Me!", -- lol
		["bm_wp_m134_body_upper_light"] = "Light Body",
		["bm_wp_upg_a_halfthatkit_desc"] = "Adds a 10% movement speed penalty while the weapon is equipped.\n\nIncreases weapon's ammo pickup by 20%.",
		["bm_wp_upg_a_halfthatkit_tecci_desc"] = "Adds a 25% movement speed penalty while the weapon is equipped.\n\nIncreases weapon's ammo pickup by 50%.",

		--Legendary Skins--
		["bm_menu_sc_legendary_ak"] = "Vlad's Rodina",
		["bm_menu_sc_legendary_flamethrower"] = "Dragon Lord",
		["bm_menu_sc_legendary_deagle"] = "Midas Touch",
		["bm_menu_sc_legendary_m134"] = "The Gimp",
		["bm_menu_sc_legendary_r870"] = "Big Kahuna",
		["bm_wskn_ak74_rodina_desc_sc"] = "A special-issue AK that - in war and crime - has demonstrated an unquenchable thirst for blood.",
		["bm_wskn_deagle_bling_desc_sc"] = "A hand-crafted Deagle built as testament to the finest gaming-trained crackshot in the world.",

		--Exclusive Sets--
		["bm_wp_upg_ultima_body_kit_desc_sc"] = "This Exclusive Set adds a unique #{risk}#Triple Threat Laser Sight## that is mutually exclusive with other gadgets.",
		["bm_wp_upg_fmg9_conversion_desc_sc"] = "This Exclusive Set adds a #{risk}#High-Tech Ammo Counter## as well as a laser sight that is mutually exclusive with other gadgets.",

		--Modifiers--
		["bm_wp_upg_bonus_sc_none"] = "No Modifier",
		["bm_wp_upg_bonus_sc_none_desc"] = "DISABLES BOOSTS FROM WEAPON SKINS.",
		
		--Generic weapon descriptions (Keep for custom weapon purposes)--
		["bm_menu_weapon_multishot_1"] = "Damage is split between",
		["bm_menu_weapon_multishot_2"] = "projectiles, each dealing",
		["bm_menu_weapon_multishot_3"] = "damage.",
		["bm_menu_weapon_ene_hs_mult_sub"] = "Enemy headshot multipliers are reduced to ",
		["bm_menu_weapon_ene_hs_mult_add"] = "Enemy headshot multipliers are increased to ",
		["bm_menu_weapon_ene_hs_mult_end"] = " of their normal value.",
		["bm_menu_weapon_hs_mult_1"] = "Headshots deal ",
		["bm_menu_weapon_hs_mult_2"] = " more damage to non-captain enemies.",
		["bm_menu_weapon_exp_no_hs_info"] = "#{risk}#Loaded with explosive slugs;## #{risk}#damage is split evenly between the slug and explosion.##",
		["bm_menu_weapon_movement_penalty_info"] = "Slows move speed by ",
		["bm_menu_weapon_movement_bonus_info"] = "Raises move speed by ",
		["bm_menu_weapon_movement_penalty_info_2"] = " while drawn",
		["bm_menu_sms_info_cont"] = "penalty is increased while shooting.",
		["bm_menu_sms_info_cont_2"] = "penalty is increased while shooting due to current attachments.",
		["bm_menu_sms_info_2"] = " while shooting.",
		["bm_menu_stat_sms_info_2"] = " while shooting due to current attachments.",
		["bm_menu_weapon_slot_search_empty"] = "\n##NO RESULTS FOUND FOR## ##\"$search\"##",
		["bm_menu_weapon_slot_warning_1"] = "\n##//////////               DO  NOT  USE               //////////\n",
		["bm_menu_weapon_slot_warning_2"] = "\n//////////               DO  NOT  USE               //////////##",
		["bm_menu_weapon_slot_warning_primary"] = "WEAPON WAS MOVED TO THE PRIMARY SLOT\nWILL CRASH IF USED IN-HEIST AS A SECONDARY",
		["bm_menu_weapon_slot_warning_secondary"] = "WEAPON WAS MOVED TO THE SECONDARY SLOT\nWILL CRASH IF USED IN-HEIST AS A PRIMARY",
		["bm_menu_weapon_slot_warning_disabled"] = "WEAPON WAS DISABLED BY CAPTAIN AUTUMN\nAND WILL RESULT IN A CRASH IF USED IN-HEIST",
		["bm_menu_weapon_slot_warning_wtfdoido"] = "IF YOU STILL HAVE THIS IN YOUR INVENTORY DO NOT EQUIP.\n\nCURRENTLY CANNOT FIND A WAY TO BALANCE THIS",
		["empty"] = "",
		["missing_cap"] = "#{risk}#Custom Attachment Points## is #{important_1}#not installed.##\n\nAttachment will take on the slot's default appearance.",
		["bm_slamfire_generic_desc"] = "Can be #{skill_color}#slamfired for an increased fire rate## at the cost of #{important_1}#more recoil, spread and the inabilty to aim down your sights.##",
		["bm_rapidfire_generic_desc"] = "Can be #{skill_color}#rapid-fired for an increased fire rate## at the cost of #{important_1}#more recoil and reduced effective range.##",
		["bm_ap_weapon_sc_desc"] = "#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
		["bm_ap_armor_weapon_sc_desc"] = "#{skill_color}#Can pierce body armor.##",
		["bm_ap_armor_20_weapon_sc_desc"] = "#{skill_color}#Deals 25% of its damage through body armor.##",
		["bm_ap_armor_50_weapon_sc_desc"] = "#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",
		["bm_ap_armor_80_weapon_sc_desc"] = "#{skill_color}#Deals 75% of its damage through body armor and can pierce enemies and thin walls.##",
		["bm_pdw_gen_sc_desc"] = "#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
		["bm_heavy_ap_weapon_sc_desc"] = "#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
		["bm_heavy_ap_no_mult_weapon_sc_desc"] = "#{skill_color}#Can pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",

		["bm_bow_sc_desc"] = "Hold #{skill_color}#$BTN_FIRE## to draw an arrow, release to fire.\nDamage and velocity of the arrow increases as you approach full draw.\n\nPress #{skill_color}#$BTN_AIM## to let down your drawn arrow.\n\nArrows can be retrieved by picking them up.\n#{skill_color}#Can pierce body armor.##",
		["bm_bow_exp_sc_desc"] = "Hold #{skill_color}#$BTN_FIRE## to draw an arrow, release to fire.\nVelocity of the arrow increases as you approach full draw.\n\nPress #{skill_color}#$BTN_AIM## to let down your drawn arrow.\n\n#{risk}#Arrows explode on impact;## #{risk}#damage is split between the arrow and explosion.##",
		["bm_w_bow_exp_desc"] = "Fire arrows that #{risk}#explode## on impact in a #{skill_color}#2## meter radius.\n\n#{important_1}#Arrow velocity is reduced and they cannot be retrieved for reuse.##",
		["bm_w_bow_light_poison_desc"] = "Fire arrows laced with #{stats_positive}#poison##, potentially stunning enemies and dealing #{stats_positive}#180## poison damage over #{skill_color}#6## seconds.\n\n#{important_1}#Arrow velocity is slightly reduced.##",
		["bm_w_bow_heavy_poison_desc"] = "Fire arrows laced with #{stats_positive}#poison##, potentially stunning enemies and dealing #{stats_positive}#240## poison damage over #{skill_color}#8## seconds.\n\n#{important_1}#Arrow velocity is slightly reduced.##",

		["bm_xbow_sc_desc"] = "Bolts can be retrieved by picking them up.\n\n#{skill_color}#Can pierce body armor.##",
		["bm_xbow_exp_sc_desc"] = "#{risk}#Bolts explode on impact;## #{risk}#damage is split evenly between the bolt and explosion.##",
		["bm_w_xbow_exp_desc"] = "Fire bolts that #{risk}#explode## on impact in a #{skill_color}#2## meter radius.\n\n#{important_1}#Bolt velocity is reduced and they cannot be retrieved for reuse.##",
		["bm_w_xbow_light_poison_desc"] = "Fire bolts laced with #{stats_positive}#poison##, potentially stunning enemies and dealing #{stats_positive}#180## poison damage over #{skill_color}#6## seconds.\n\n#{important_1}#Bolt velocity is slightly reduced.##",
		["bm_w_xbow_heavy_poison_desc"] = "Fire bolts laced with #{stats_positive}#poison##, potentially stunning enemies and dealing #{stats_positive}#240## poison damage over #{skill_color}#8## seconds.\n\n#{important_1}#Bolt velocity is slightly reduced.##",

		["bm_airbow_sc_desc"] = "Arrows can be retrieved by picking them up.\n\n#{skill_color}#Can pierce body armor.##",
		["bm_airbow_exp_sc_desc"] = "#{risk}#Arrows explode on impact;## #{risk}#damage is split evenly between the arrow and explosion.##",
		["bm_w_airbow_poison_desc"] = "Fire arrows laced with #{stats_positive}#poison##, potentially stunning enemies and dealing #{stats_positive}#120## poison damage over #{skill_color}#4## seconds.\n\n#{important_1}#Arrow velocity is slightly reduced.##",

		["bm_40mm_weapon_sc_desc"] = "Press #{skill_color}#$BTN_GADGET## to toggle the leaf sight; zeroed to #{skill_color}#30## meters.",
		["bm_rocket_launcher_sc_desc"] = "Explosive damage dealt by this weapon #{skill_color}#instantly destroys turrets.##",
		["bm_quake_shotgun_sc_desc"] = "Fires both barrels at once, doubling the number of pellets.",
		["bm_hx25_buck_sc_desc"] = "Fires 12 pellets in a wide spread.\n\nUses skills associated with launchers.",
		["bm_auto_generated_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.",
		["bm_auto_generated_ap_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\n#{skill_color}#Can pierce body armor, shields, and thin walls.##",
		["bm_auto_generated_sap_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.\n\n#{skill_color}#Can pierce body armor, shields, titan-shields and thin walls.##",
		["bm_auto_generated_lmg_sc_desc"] = "This weapon is using automatically generated stats, and may not fit the creators intent or be perfectly balanced.",
		["bm_auto_generated_mod_sc_desc"] = "The stats on this attachment have been removed until automatic custom attachment stat generation is finished.",

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
		["bm_melee_swing_arc_1"] = "Has a #{skill_color}#wide## swing radius.",
		["bm_melee_swing_arc_2"] = "Has a #{skill_color}#very wide## swing radius.",
		["bm_melee_swing_arc_3"] = "Has a #{skill_color}#very, very wide## swing radius.",
		["bm_melee_swing_arc_4"] = "Has a #{skill_color}#massive## swing radius.",
		["bm_melee_swing_arc_h_1"] = "Has a #{skill_color}#wide## swing radius when moving sideways.",
		["bm_melee_swing_arc_h_2"] = "Has a #{skill_color}#very wide## swing radius when moving sideways.",
		["bm_melee_swing_arc_h_3"] = "Has a #{skill_color}#very, very wide## swing radius when moving sideways.",
		["bm_melee_swing_arc_h_4"] = "Has a #{skill_color}#massive## swing radius when moving sideways.",
		["bm_melee_swing_arc_charge_h_1"] = "Charged attacks have a #{skill_color}#wide## swing radius when moving sideways.",
		["bm_melee_swing_arc_charge_h_2"] = "Charged attacks have a #{skill_color}#very wide## swing radius when moving sideways.",
		["bm_melee_swing_arc_charge_h_3"] = "Charged attacks have a #{skill_color}#very, very wide## swing radius when moving sideways.",
		["bm_melee_swing_arc_charge_h_4"] = "Charged attacks have a #{skill_color}#massive## swing radius when moving sideways.",
		["bm_melee_weapon_info"] = "In armed robberies, beating the victims with firearms is usually more common than to shoot or stab them.\n\nThe delay between repeated swings is further modified by the used weapon's mobility rating.",
		["bm_melee_katana_info"] = "The Shinsakuto-Katana is a masterpiece, but also freshly forged. It has not tasted blood, and has no real heritage or history. It is simply waiting for a wielder with which to create that.\n\nFully charged attacks come out #{skill_color}#50%## faster, allowing for a faster follow-up slash.\n\nAs Jiro, killing a Cloaker with a charged melee attack will trigger a special kill.",
			["bm_melee_raiden_info"] = "This is no #{important_1}#\"tool of justice\"## in your hands.\n\nFully charged attacks come out #{skill_color}#50%## faster, allowing for a faster follow-up slash.",
			["bm_melee_thejobissnotyours_info"] = "This isn't even your sword.\n\nFully charged attacks come out #{skill_color}#50%## faster, allowing for a faster follow-up slash.",
			["bm_melee_2077tkata_info"] = "Nano filament heated blade.\nThe purest essence of a katana, no add-ons, no modifications, only ripping hot steel.\n\nFully charged attacks #{heat_warm_color}#set enemies on fire,## dealing #{heat_warm_color}#120## fire damage over #{skill_color}#3## seconds.",
		["bm_melee_buck_info"] = "Surprisingly effective against modern weapons too.\n\nReduces incoming ranged damage by #{skill_color}#10%## while charging.", --Buckler Shield
		["bm_melee_briefcase_info"] = "Whatever may be inside, the briefcase itself is shockingly resilient.\n\nReduces incoming ranged damage by #{skill_color}#10%## while charging.", --Briefcase
		["bm_melee_pitch_info"] = "Pitch your forks and fork up some pitches.\n\nSprinting forwards starts a sprint charge that deals #{skill_color}#45## damage every #{skill_color}#0.4## seconds to targets in front of you. This can be increased with skills.\n\nHitting an enemy while sprint charging drains #{important_1}#15%## of your max stamina; a killing blow gives back #{skill_color}#10%.##\n\n#{important_1}#You cannot parry enemy attacks, even when not sprint charging.##", --Randal Pitchfork
			["bm_melee_charge_info"] = "Sprinting forwards starts a sprint charge that deals #{skill_color}#45## damage every #{skill_color}#0.4## seconds to targets in front of you. This can be increased with skills.\n\nHitting an enemy while sprint charging drains #{important_1}#15%## of your max stamina; a killing blow gives back #{skill_color}#10%.##\n\n#{important_1}#You cannot parry enemy attacks, even when not sprint charging.##",
		["bm_melee_cs_info"] = "Rip and Tear, until it is done.\n\nDeals #{skill_color}#30## damage every #{skill_color}#0.25## seconds to targets in front of you while charging. This can be increased with skills.\n\n#{important_1}#Cannot parry enemy attacks.##", -- ROAMING FR-
		["bm_melee_ostry_info"] = "Spiiiiiiiiiin.\n\nDeals #{skill_color}#18## damage every #{skill_color}#0.18## seconds to targets in front of you while charging. This can be increased with skills.\n\n#{important_1}#Cannot parry enemy attacks.##", --Kazaguruma
		["bm_melee_wing_info"] = "Goes great with a disguise kit!\n\nDeals #{skill_color}#400%## damage when attacking enemies from behind.",-- Wing Butterfly Knife
		["bm_melee_switchblade_info"] = "Designed for violence, deadly as a revolver - that's the switchblade!\n\nDeals #{skill_color}#200%## damage when attacking enemies from behind.",-- Switchblade Knife
		["bm_melee_chef_info"] = "Not sure if this was used for chopping meat from the supermarket.\n\nFully charged hits spread panic in a #{skill_color}#12## meter radius around you.", -- Psycho Knife
		["bm_melee_headless_sword_info"] = "A sword forged from nightmares.\n\nFully charged hits spread panic in a #{skill_color}#12## meter radius around you.", -- Headless Dozer Sword
			["bm_melee_goat_info"] = "\"It was too big to be called a sword. Massive, thick, heavy, and far too rough. Indeed, it was like a heap of raw iron.\"\n\nFully charged hits spread panic in a #{skill_color}#12## meter radius around you.", -- im not gaj
		["bm_melee_great_info"] = "Try thrusting attack, but hole.\n\nCharging an attack by at least #{skill_color}#90%## performs a thrust, extending range by #{skill_color}#0.5## meters.", -- Great Sword
		["bm_melee_freedom_info"] = "Thirteen stripes of red alternating with white, a blue rectangle in the canton, fifty small, white, five-pointed stars, a pinch of patriotism, two cups of freedom and a broken flag pole.\n\nVoilà - you have yourself a deadly weapon.\n\nCharging an attack by at least #{skill_color}#90%## performs a thrust, extending range by #{skill_color}#0.5## meters.", -- Great Sword
			["bm_melee_jebus_info"] = "Light and dark.\n\nBlack and white.\n\nLife and death.\n\nThe Binary Sword holds no middle ground as it turns your opponents OFF.\n\nCharging an attack by at least #{skill_color}#90%## performs a thrust, extending range by #{skill_color}#0.5## meters.",
		["bm_melee_nin_info"] = "Fires nails which have a short effective range and instant travel. Still counts as a melee kill.", -- Pounder
			["bm_melee_thebestweapon_info"] = "#{skill_color}#The best weapon in the game.##",
		["bm_melee_iceaxe_info"] = "Deals #{skill_color}#50%## more headshot damage.", -- Icepick
		["bm_melee_mining_pick_info"] = "Deals #{skill_color}#50%## more headshot damage.", --Gold Fever (Pickaxe)
		["bm_melee_boxing_gloves_info"] = "I didn't hear no bell.\n\nKills performed with the OVERKILL Boxing Gloves #{skill_color}#instantly refill your stamina.##", -- OVERKILL Boxing Gloves
		["bm_melee_clean_info"] = "Give the cops that extra clean shave they need.\n\nDeals #{skill_color}#120## bleed damage over #{skill_color}#3## seconds.", --Alabama Razor
		["bm_melee_barbedwire_info"] = "There's no afterlife waiting for my sorry ass... and I'm just here... talking to a fucking baseball bat!\n\nDeals #{skill_color}#120## bleed damage over #{skill_color}#3## seconds.", --Lucille Baseball Bat
			["bm_melee_bleed_info"] = "Deals #{skill_color}#120## bleed damage over #{skill_color}#3## seconds.",
			["bm_melee_inner_child_info"] = "Get in touch with your inner child.\n\nDeals #{skill_color}#120## bleed damage over #{skill_color}#3## seconds.",
		["bm_melee_spoon_gold_info"] = "Eat 'em up, Eat 'em up, Eat 'em up, Eat 'em up! \n\nHas a #{skill_color}#50%## chance to deal #{heat_warm_color}#120## fire damage and interrupt enemies over #{skill_color}#3## seconds.", --Gold Spoon
			["bm_melee_fire_info"] = "Has a #{skill_color}#50%## chance to deal #{heat_warm_color}#120## fire damage and interrupt enemies over #{skill_color}#3## seconds.",
		["bm_melee_cqc_info"] = "Contains an exotic poison that deals #{stats_positive}#120## poison damage and carries a #{skill_color}#50%## chance to interrupt every #{skill_color}#0.5## seconds over #{skill_color}#4## seconds.", --Kunai, Syringe
		["bm_melee_fight_info"] = "Be water, my friend.\n\nParrying an enemy attack deals #{skill_color}#120## melee damage to them. This can be increased with skills.", --Empty Palm Kata
		["bm_melee_slot_lever_info"] = "GIMME A JACKPOT!\n\nHas a #{skill_color}#5%## chance to deal #{skill_color}#10x## times the damage and knockdown.",
		["bm_melee_specialist_info"] = "Twice the blades, twice the fun.\n\nMelee attacks deal #{skill_color}#2x## damage every hit after the first while drawn.", --Specialist Knives, Talons, Knuckle Daggers, Push Daggers
		["bm_melee_cleaver_info"] = "He's whacking and hacking and slashing.\n\nDeals #{important_1}#50%## less headshot damage in exchange for increased overall effectiveness against the body and limbs.",
		["bm_melee_erica_info"] = "A sane person would throw this.\n\nFully charged hits against living enemies have a #{skill_color}#5%## chance to explode dealing #{risk}#720## damage in a #{skill_color}#5## meter radius from the point of impact.",
		["bm_melee_piggy_hammer_info"] = "Deals #{skill_color}#100%## more damage to special and elite enemies.\n\nHas a chance to deal one of the following #{risk}#random effects## upon a successful strike:\n\n-#{skill_color}#12%## chance to inflict #{important_1}#bleed##\n-#{skill_color}#7%## chance to #{ghost_color}#tase##\n-#{skill_color}#5%## chance to inflict #{stats_positive}#poison##\n-#{skill_color}#1%## chance to #{risk}#insta-kill##", --Piggu

		--Melee Weapons
		["bm_melee_twins"] = "Sai", --Plural form is still "sai"

		--CUSTOM MELEE WEAPONS
		["bm_melee_revenant_heirloom"] = "Dead Man's Curve",
		["bm_melee_revenant_heirloom_info"] = "Attacking with a low charge performs a quick jab with end of the weapon.\n\nAttacking with at least a #{skill_color}#25%## charge performs a sweeping slash.",
		["bm_melee_megumins_staff_info"] = "Cast a powerful explosion when fully charged!\nCan be cast as far as #{skill_color}#30## meters on any surface or being; #{risk}#it cannot be cast into the air.##\n\n#{important_1}#Charge speed is unaffected by skills.\nCharging distorts vision, drains stamina and progressively slows down your movement.\nYou are instantly downed upon successfully casting an explosion; skills and perks that delay or save you from going down are ignored.##",

		["bm_menu_weapon_bayonet_header"] = "STATS FROM PRIMARY:",
		["bm_menu_weapon_bayonet_damage"] = "\nADDITIONAL DAMAGE: ##+",
		["bm_menu_weapon_bayonet_damage_base"] = "\n-BASE: ##",
		["bm_menu_weapon_bayonet_damage_skill"] = "\n-SKILL: ##+",
		["bm_menu_weapon_bayonet_range"] = "\nADDITIONAL RANGE: ##+",

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


		-- Color variations - Combat Harness
			["bm_suit_var_loud_suit_default"] = "Professional Black",
			["bm_suit_var_loud_suit_default_desc"] = "The two-piece has become somewhat of a brand recognition for the PAYDAY gang. Sharp, fashionable, allows you to blend in with the crowd. Simply iconic. 'Wait the fuck up! What fucking crowd?!', Chains exclaims as the gang drives to hit Murkywater's warehouse once more. He wishes he could have figured it out sooner.",
			
			["bm_suit_var_loud_suit_white"] = "Frosty White",
			["bm_suit_var_loud_suit_white_desc"] = "Provided by Jimmy for the Boiling Point job, these quickly proved out to be ineffective against harsh conditions of the job. It's not like Jimmy needed one, as he preferred rocking his two-piece anyway.",
			
			["bm_suit_var_loud_suit_red"] = "Uncertain Red",
			["bm_suit_var_loud_suit_red_desc"] = "Red is an interesting color to see on the battlefield. Either it's a medic, coming to save their teammates' lives, or the most dangerous bastard around. You decide who you'd be.",
			
			["bm_suit_var_loud_suit_green"] = "Poison Green",
			["bm_suit_var_loud_suit_green_desc"] = "Enough with the Grenadier bullying you. Gemma McShay provided you with a whole arsenal of poison-flavored armaments, so it's time to show these pigs who's the real pest control.",
			
			["bm_suit_var_loud_suit_blue"] = "Police Blue",
			["bm_suit_var_loud_suit_blue_desc"] = "Why aren't the cops rocking the ICTV, anyway?",
			
			["bm_suit_var_loud_suit_purple"] = "Fashionable Purple",
			["bm_suit_var_loud_suit_purple_desc"] = "Hide that one under your ICTV for a subtle touch of fashion in all your tactical nonsense.",
			
			["bm_suit_var_loud_suit_brown"] = "Outdoor Brown",
			["bm_suit_var_loud_suit_brown_desc"] = "Houston really wishes the gang could have stayed in a cozy urban jungle where he is at his best. But alas, there's too much money to be made in the country.",
			
			["bm_suit_var_loud_suit_gorkagreen"] = "Forest Tactical",
			["bm_suit_var_loud_suit_gorkagreen_desc"] = "Hides you well in the forest, or among all the money you're moving.",
			
			["bm_suit_var_loud_suit_gorkaearth"] = "Murky Tactical",
			["bm_suit_var_loud_suit_gorkaearth_desc"] = "Just how many uniforms does Murkywater produce? Could start their own fashion line at this point.",
			
			["bm_suit_var_loud_suit_gorkagrey"] = "Urban Tactical",
			["bm_suit_var_loud_suit_gorkagrey_desc"] = "No reason to don a suit when you walk into a bank now. Your face is all over the news anyway.",
			
			["bm_suit_var_loud_suit_gorkapurple"] = "Purple Tactical",
			["bm_suit_var_loud_suit_gorkapurple_desc"] = "You never know when you're going to stage a robbery in a purple jungle.",
			
			["bm_suit_var_loud_suit_gorkasea"] = "Navy Tactical",
			["bm_suit_var_loud_suit_gorkasea_desc"] = "Wolf got these back in 2011, when Bain proposed a yacht robbery. Unfortunately, they had to collect dust for almost six years.",
			-- Color variations - Sunny Side
			["bm_suit_var_suit_sunny_default"] = "Casual Business",
			["bm_suit_var_suit_sunny_default_desc"] = "Be the cheesy 90's action movie hero you've always aspired to be.",
				
			["bm_suit_var_suit_sunny_skull"] = "Deadly Business",
			["bm_suit_var_suit_sunny_skull_desc"] = "This little paintjob is what earned the Skulldozer his fearsome name. Show that it means nothing to you by reducing it to a simple decoration for your attire.",
				
			["bm_suit_var_suit_sunny_red"] = "Bloody Business",
			["bm_suit_var_suit_sunny_red_desc"] = "A Cloaker tied to a chair, the Alabama Razor, 'Troubles Always Inbound' playing... This shirt won't stay clean for long.",
				
			["bm_suit_var_suit_sunny_blue"] = "Digital Business",
			["bm_suit_var_suit_sunny_blue_desc"] = "Hackers are modern day wizards, able to do unimaginable things thanks to their sharp skills...  But hacks don't stop bullets. Ballistic vests do. So don't get too cocky and remember to protect yourself.",
				
			["bm_suit_var_suit_sunny_green"] = "Greedy Business",
			["bm_suit_var_suit_sunny_green_desc"] = "No matter the risk, you sweep the place clean out of all the loot. It's not even about money at that point, it's about staying true to yourself.",

			["bm_suit_var_suit_sunny_yellow"] = "Sunshine Business",
			["bm_suit_var_suit_sunny_yellow_desc"] = "Perfect for a romantic drive under the sun.\nWhile being chased by a dozen of police cars, of course.",
			
			["bm_suit_var_suit_sunny_pink"] = "Smooth Business",
			["bm_suit_var_suit_sunny_pink_desc"] = "Mr. Pink got lucky that Cabot's gang doesn't have color-coded attire.",
					
			["bm_suit_var_suit_sunny_hawaii_black"] = "Miami Vacation",
			["bm_suit_var_suit_sunny_hawaii_black_desc"] = "Wolf bought this stylish shirt way back when he heard that the Dentist is setting the gang up for the 'Hotline Miami' job. Who could have known that it would have nothing to do with Miami?",
			
			["bm_suit_var_suit_sunny_hawaii_blue"] = "Cyber Vacation",
			["bm_suit_var_suit_sunny_hawaii_blue_desc"] = "Joy is the kind of a person who would go far away for a vacation and just spend all of it playing videogames. 'Kids these days', Dallas thought, as he couldn't get her to enjoy playing pool, gazing at the sea, drinking unhealthy amounts of scotch and other old-fashioned vacation activities.",
			
			["bm_suit_var_suit_sunny_hawaii_cyan"] = "Swimming Vacation",
			["bm_suit_var_suit_sunny_hawaii_cyan_desc"] = "Sydney is an avid swimmer and has always been wondering why the Safehouse doesn't have a pool installed. Well, besides Aldstone having enough duties as is, swimming is not the most cherished hobby of the PAYDAY gang after the Green Bridge.",
			
			["bm_suit_var_suit_sunny_hawaii_green"] = "Doghouse Vacation",
			["bm_suit_var_suit_sunny_hawaii_green_desc"] = "Vlad enjoyed his time in Mexico greatly. New lands provided new opportunities, and he managed to expand fairly quickly, until one of his drug operations was hit all of sudden. The Federales were tipped by no one other than Buluc, who would become Vlad's main rival for a while. Good thing the PAYDAY gang is always on call.",
						
			["bm_suit_var_suit_sunny_hawaii_orange"] = "Offshore Vacation",
			["bm_suit_var_suit_sunny_hawaii_orange_desc"] = "That's it, you've made it. The White House job completed, all bad guys defeated, and your offshore spent on the greatest party ever. Where can we even go from here? \nEh, another bank heist won't hurt.",
			
			["bm_suit_var_suit_sunny_hawaii_pink"] = "Dancing Vacation",
			["bm_suit_var_suit_sunny_hawaii_pink_desc"] = "Chains doesn't often go on a vacation, but when he does, he lets himself all out. During his vacation around 2016, a video of his sleek dance moves went viral. He had to contact Bain in order to get it erased from the Internet forever.",
			
			["bm_suit_var_suit_sunny_hawaii_red"] = "Far Vacation",
			["bm_suit_var_suit_sunny_hawaii_red_desc"] = "Jimmy loves to tell a story of his nice tropical vacation interrupted by an army of genetically enhanced super soldiers. Sounds like one of his coke-induced fairy tales, but after the AKAN heist... Who even knows?",
			
			["bm_suit_var_suit_sunny_payne"] = "Painless Vacation",
			["bm_suit_var_suit_sunny_payne_desc"] = "During his vacation to Sao Paulo, Wolf decided to buy this shirt, but was given it for free instead, apparently as a sign of gratitude for what he had done for the city.\nWolf was confused because he had never been to Brazil.",
			
			["bm_suit_var_suit_sunny_vice"] = "Viceless Vacation",
			["bm_suit_var_suit_sunny_vice_desc"] = "You can't make Sangres wear anything but a flashy shirt no matter the occasion. As the most dangerous criminals gather round, all sharply dressed, Sangres comes in an old, worn out shirt he got on a garage sale in the city of Vice.",
			
			["bm_suit_var_suit_sunny_security_red"] = "Red Bodyguard",
			["bm_suit_var_suit_sunny_security_red_desc"] = "An elite member of Sosa's security. Ernesto Sosa thought he had it all. A big mansion, a reliable business and a robust security ensuring his safety. The world is his... Yet, the history is bound to repeat itself.",
			
			["bm_suit_var_suit_sunny_security_purple"] = "Purple Bodyguard",
			["bm_suit_var_suit_sunny_security_purple_desc"] = "An elite member of Sosa's security. 24/7 surveillance by drones and well coordinated guard shifts. Sosa's mansion is impenetrable. If only someone bothered to check the latest batch of yayo...",
			
			["bm_suit_var_suit_sunny_soprano"] = "Mafia Business",
			["bm_suit_var_suit_sunny_soprano_desc"] = "Although the mafia is not even close to the PAYDAY gang, but it is worth paying tribute to them - their style is excellent even in everyday life.",
		    -- Color variations - Prison Suit
			["bm_suit_var_suit_prison_default"] = "The Fugitive",
			["bm_suit_var_suit_prison_default_desc"] = "The robes that have changed Hoxton forever. He was sure he burned this relic of the grim past along with the old safehouse, but somehow it found its way to the new one.",
			
			["bm_suit_var_suit_prison_repairman"] = "The 31st",
			["bm_suit_var_suit_prison_repairman_desc"] = "Ever wondered whose been setting up your spy cameras?\n\nWell, you can keep wondering, but at least you'll know what they're wearing.",
			
			["bm_suit_var_suit_prison_comedy"] = "The Felon",
			["bm_suit_var_suit_prison_comedy_desc"] = "The robes of Chins of the Paycheck Crew (in)fame. He almost made off with $225 from the Pear Store cash register, but was caught and sent to the custody. Thankfully, Chin's crewmates took one of the PearBooks hostage and managed to trade it for him.",
			
			["bm_suit_var_suit_prison_vaultboy"] = "The Dweller",
			["bm_suit_var_suit_prison_vaultboy_desc"] = "Surprisingly, Bain has never been into 'end of the world' conspiracies, but after the Meltdown heist he started building a small underground bomb shelter. Because you know. War.",
			
			["bm_suit_var_suit_prison_janitor"] = "The Janitor",
			["bm_suit_var_suit_prison_janitor_desc"] = "There are rumors going around the criminal underworld that OMNIA is conducting some top secret experiments. Stuff that would surpass even the likes of the legendary Henry's Rock. Even OMNIA's janitors have to sign a contract and be kept under control.",
			
			["bm_suit_var_suit_prison_subject"] = "The Subject",
			["bm_suit_var_suit_prison_subject_desc"] = "Jimmy got these off the test subjects before escaping from the AKAN's lab. Just in case those fatigues were the secret behind their outstanding abilities. Let's find out.",
			
		--Weapon Colors
		["bm_wskn_resmod_blackgold"] = "Black Gold",
		["bm_wskn_resmod_cleangold"] = "Clean Gold",
		["bm_wskn_resmod_imissfauna"] = "Ceres Gold",
		["bm_wskn_resmod_imissfauna_desc"] = "Mother Nature would never betray you... right?",
		["bm_wskn_resmod_ownthiscity"] = "Fleur Gold",
		["bm_wskn_resmod_ownthiscity_desc"] = "It's our time now! Let's get this shit started!",
		["bm_wskn_resmod_kindoffeel"] = "Abstract Dark Gold",
		["bm_wskn_resmod_kindoffeel2"] = "Abstract Light Gold",
		["bm_wskn_resmod_insubstantial"] = "Phased Gold",
		["bm_wskn_resmod_palmtop"] = "Tiger Gold",
		["bm_wskn_resmod_palmtop_desc"] = "The thing you wish for the most, is something you'll never get.",
		["bm_wskn_resmod_lildonnie"] = "Pearl Gold",
		["bm_wskn_resmod_quacko"] = "Blue Gold",
		["bm_wskn_resmod_snake"] = "Liquid Gold",
		["bm_wskn_resmod_camo"] = "Camo Gold",
		["bm_wskn_resmod_camo2"] = "Haze Gold",
		["bm_wskn_resmod_digital"] = "Digital Gold",
		["bm_wskn_resmod_splinter"] = "Splinter Gold",
		["bm_wskn_resmod_urban"] = "Urban Gold",
		["bm_wskn_resmod_dioxide"] = "Carbon Gold",
		["bm_wskn_resmod_topography"] = "Topography Gold",
		["bm_wskn_resmod_2019"] = "Warfare Gold",
		["bm_wskn_resmod_llenn"] = "Pink Devil",
		["bm_wskn_resmod_llenn_desc"] = "This isn't exactly what I had in mind, but pink is pink.",
		
		["menu_weapon_color_index_11"] = "Metal + Sights",
		["menu_weapon_color_index_12"] = "Metal + Magazine",
		["menu_weapon_color_index_13"] = "Metal + Sights + Magazine",

		--Menu Buttons--
		["bm_menu_btn_sell"] = "SELL WEAPON ($price)",
		["bm_menu_btn_buy_selected_weapon"] = "BUY WEAPON ($price)",

		--New menu stats--
		["bm_menu_damage_shake"] = "Flinch",
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

		["bm_menu_attack_speed"] = "Repeat Delay",
		["bm_menu_impact_delay"] = "Impact Delay",
		
		["bm_menu_stats_detection"] = "Encumbrance",
		["bm_menu_stats_min_detection"] = "Encumbrance",
		["bm_menu_stats_max_detection"] = "Encumbrance",
		
		--Attachment type names--
		["bm_menu_barrel_ext"] = "Muzzle",
		["bm_menu_barrel_ext_plural"] = "Muzzles",
		["bm_menu_foregrip"] = "Handguard",
		["bm_menu_foregrip_plural"] = "Handguards",
		["bm_menu_vertical_grip"] = "Foregrip",
		["bm_menu_vertical_grip_plural"] = "Foregrips",
		["bm_menu_bayonet"] = "Bayonet",
		["bm_menu_bayonet_plural"] = "Bayonets",
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

		["bm_menu_upotte_barrel"] = "Barrel",
		["bm_menu_upotte_foregrip"] = "Handguard",
		["bm_menu_upotte_stock"] = "Stock",
		["bm_menu_jiisuri_stock"] = "Stock",
		["bm_menu_upotte_grip"] = "Grip",

		["bm_menu_ro_barrel"] = "Barrel",
		["bm_menu_ro_stock"] = "Stock",
		["bm_menu_ro_modifier"] = "Modifiers",
		["bm_menu_ro_charm"] = "Charm",
		["bm_menu_ro_grip"] = "Grip",
		
		--Weapon categories--
		["menu_pistol"] = "Pistols",
			["menu_light_pis"] = "Light Pistols",
			["menu_heavy_pis"] = "Heavy Pistols",
		
		["menu_shotgun"] = "Shotguns",
			["menu_light_shot"] = "Auto Shotguns",
			["menu_heavy_shot"] = "Light Shotguns",
			["menu_break_shot"] = "Heavy Shotguns",
		
		["menu_smg"] = "Sub-Machine Guns",
		["menu_lmg"] = "Machine Guns",
		["menu_minigun"] = "Gatling Guns",
			["menu_light_smg"] = "Light SMGs",
			["menu_heavy_smg"] = "Heavy SMGs",
			["menu_light_mg"] = "LMGs",
			["menu_heavy_mg"] = "MMGs",
			["menu_miniguns"] = "Gatling Guns",

		["menu_assault_rifle"] = "Rifles",
		["menu_snp"] = "Snipers",
			["menu_light_ar"] = "Light Rifles",
			["menu_heavy_ar"] = "Heavy Rifles",
			["menu_dmr_ar"] = "Marksman Rifles",
			["menu_light_snp"] = "Light Sniper Rifles",
			["menu_heavy_snp"] = "Heavy Sniper Rifles",
			["menu_antim_snp"] = "Anti-Materiel Rifles",

		["menu_wpn_special"] = "Specials",


		["menu_flamethrower"] = "Flamethrowers",
		["menu_grenade_launcher"] = "Launchers",

		["menu_saw"] = "Saws",

		["menu_bow"] = "Bows",

		["menu_crossbow"] = "Bows",

		["menu_unsupported"] = "Unsupported",

		["st_menu_value"] = "Value:",

		["st_menu_skill_use"] = "SKILL USE:",
		["st_wpn_akimbo"] = "Akimbo+",
		["st_wpn_assault_rifle"] = "Rifle",
		["st_wpn_snp"] = "Rifle",
		["st_wpn_pistol"] = "Pistol",
		["st_wpn_shotgun"] = "Shotgun",
		["st_wpn_smg"] = "Machine Gun",
		["st_wpn_lmg"] = "Machine Gun",
		["st_wpn_minigun"] = "Machine Gun",
		["st_wpn_crossbow"] = "Bow",
		["st_wpn_bow"] = "Bow",
		["st_wpn_saw"] = "Saw",
		["st_wpn_grenade_launcher"] = "Launcher",
		["st_wpn_wpn_special"] = "Special",
		["st_wpn_flamethrower"] = "Flamethrower",

		["st_menu_firemode"] = "FIREMODES:",
		["st_menu_firemode_semi"] = "SEMI",
		["st_menu_firemode_auto"] = "AUTO",
		["st_menu_firemode_burst"] = "BURST",
			["st_menu_firemode_burst_slamfire"] = "SLAMFIRE",
			["st_menu_firemode_burst_fanning"] = "FANNING",
			["st_menu_firemode_burst_rapidfire"] = "RAPIDFIRE",
			["st_menu_firemode_burst_autoburst"] = "AUTOBURST",
		["st_menu_firemode_volley"] = "VOLLEY",

		["menu_reticle_dmc_eotech"] = "TECopt Full",
		["menu_reticle_dmc_eotech_moa"] = "TECopt MOA Dot",
		["menu_reticle_dmc_eotech_seggs"] = "TECopt Segmented",
		["menu_reticle_dmc_ebr_cqb"] = "Maelstrom EBR-CQB",
		["menu_reticle_dmc_trijicon_chevron"] = "Trigonom Chevron",
		["menu_reticle_dmc_ncstar"] = "Reconnaissance Cross",
		["menu_reticle_dmc_lua"] = "Powered by Lua!",
		["menu_reticle_dmc_dot_4x4"] = "Small Dot",
		["menu_reticle_dmc_dot_2x2"] = "Tiny Dot",
		
		
		

		--Blackmarket gui per-armor skill descriptions.
		["bm_menu_append_milliseconds"] = "ms",
		["bm_menu_dodge_grace"] = "ADDITIONAL GRACE PERIOD ON DODGE: #{skill_color}#$grace_bonus##",
		["bm_menu_dodge_grace_cap"] = "Grace period on dodge is capped to #{important_1}#$grace_bonus_cap## due to the current job's risk level of #{risk}#$risk_level##",

		["bm_menu_armor_grinding_1"] = "Armor regenerated every tick: #{skill_color}#$passive_armor_regen##",
		["bm_menu_armor_grinding_2"] = "Armor regenerated every tick: #{skill_color}#$passive_armor_regen## \nArmor regenerated when damaging enemies: #{skill_color}#$active_armor_regen##",

		["bm_menu_armor_max_health_store_1"] = "Max health stored: #{skill_color}#$health_stored##",
		["bm_menu_armor_max_health_store_2"] = "Max health stored: #{skill_color}#$health_stored## \nArmor regen bonus on kill: #{skill_color}#$regen_bonus%##",
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
		["bm_wp_wpn_fps_ass_tilt_a_fuerte_desc"] =  "Converts the weapon's caliber to 7.62mm, which slightly decreases fire rate and stability in favor of increased damage and accuracy.",

		--MK18 Specialist [Custom]--
		["bm_wp_wpn_fps_ass_mk18s_a_weak_desc"] = "An ammunition type that mimics medium tier rifles. Lowers ammo count and stability in trade for higher damage and accuracy.",
		["bm_wp_wpn_fps_ass_mk18s_vg_magwell"] = "Magwell Grip",

		--Unknown Weapon--
		["bm_wp_wpn_fps_pis_noodle_m_8"] = "Extended Magazine",
		["bm_wp_wpn_fps_pis_noodle_m_10"] = "Extend-o Magazine",

		--Jackal SMG(these are unused though)--
		["bm_wp_wpn_fps_upg_schakal_m_atai_desc"] = "Converts the Jackal into the Mastiff, something of the younger sister in the Jackal family. Not as stable as the Coyote, and not as deadly as the Jackal, but atleast it fires rounds that can pierce both armor and walls.",

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

		--Bipod--
		["bm_sc_bipod_desc_pc"] = "Mount by pressing #{skill_color}#$BTN_BIPOD## over a valid surface. Press again to dismount.\n\nReduces vertical recoil by #{skill_color}#50%##, horizontal recoil by #{skill_color}#75%## and increases range by #{skill_color}#30%## while mounted.\n\n#{item_stage_2}#Additional options for mounting can be found in Restoration Mod's extra options menu.##",
		["bm_sc_bipod_desc"] = "Mount by holding #{skill_color}#$BTN_BIPOD## over a valid surface. Hold again to dismount.\n\nReduces vertical recoil by #{skill_color}#50%##, horizontal recoil by #{skill_color}#75%## and increases range by #{skill_color}#30%## while mounted.\n\n#{item_stage_2}#Additional options for mounting can be found in Restoration Mod's extra options menu.##",
		["hud_hint_bipod_moving"] = "Cannot mount while moving",
		["hud_hint_bipod_slide"] = "Cannot mount while sliding",
		["hud_hint_bipod_air"] = "Cannot mount while airborne",
		["hud_hint_bipod_lean"] = "Cannot mount while leaning",

		["hud_interact_autumn_disable"] = "Disabled by Captain Autumn!",

		["hud_assault_restored_down"] = "Assault Survived - Restoring 1 Down",
		["hud_assault_remaining_single"] = "1 Assault Remaining Until Down Restore",
		["hud_assault_remaining_plural"] = " Assaults Remaining Until Down Restore",

		--String override for the stungun--
		["bm_melee_taser_info"] = "Device that electrocutes and interrupts targets on touch when fully charged.",

		["menu_es_rep_upgrade"] = "",	--???--

		["bm_w_r0991"] = "AR-15 Varmint Pistol",
		
		--Modifiers-- --Let me know if I'm safe to move these up, like the other stuff--
		["bm_menu_bonus_concealment_p1"] = "Small Mobility bonus and Stability penalty",
		["bm_menu_bonus_concealment_p1_mod"] = "Small Mobility Modifier",
		["bm_menu_bonus_concealment_p2"] = "Large Mobility bonus and Stability penalty",
		["bm_menu_bonus_concealment_p2_mod"] = "Large Mobility Modifier",
		["bm_menu_bonus_concealment_p3"] = "Massive Mobility bonus and Stability penalty",
		["bm_menu_bonus_concealment_p3_mod"] = "Massive Mobility Modifier",
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
		["bm_menu_concealment"] = "Mobility\n",
		["bm_menu_bonus_spread_p2_mod"] = "Large Accuracy Modifier",
		["bm_menu_bonus_spread_p3_mod"] = "Massive Accuracy Modifier",
		["bm_menu_bonus_recoil_p2_mod"] = "Large Stability Modifier",
		["bm_wp_upg_bonus_team_money_exp_p1"] = "Money Boost",
		["bm_wp_upg_bonus_team_money_exp_p1_desc"] = "+5% Money reward for you and your crew.",

		["bm_wp_upg_i_singlefire_desc"] = "Locks your weapon to #{risk}#semi-auto##.",
		["bm_wp_upg_i_autofire_desc"] = "Locks your weapon to #{risk}#full-auto##.",

		--Throwables--
		["bm_dynamite_desc"] = "Damage: #{risk}#800## \nRadius: #{skill_color}#4m## \nFuse: #{skill_color}#3s## \n- Reduced bounce and roll compared to other thrown explosives\n\nDesigned to effectively blast through rock. Even more effective at blasting through people.",
		--Frag
		["bm_grenade_frag_desc"] = "Damage: #{risk}#800## \nRadius: #{skill_color}#5m## \nFuse: #{skill_color}#3s## \n\nThe classic explosive hand grenade. Is there any more to say?",
		--Community Frag
		["bm_grenade_frag_com_desc"] = "Damage: #{risk}#800## \nRadius: #{skill_color}#5m## \nFuse: #{skill_color}#3s## \n\nA sleek new look to the classic hand grenade, sure to provide that OVERKILL touch to each blast.",
		--Community Frag 2
		["bm_grenade_dada_com_desc"] = "Damage: #{risk}#800## \nRadius: #{skill_color}#5m## \nFuse: #{skill_color}#3s## \n\nThe doll's outer layers hides its explosive inner workings. A tribute to the Motherland.",
		--Snowball
		["bm_grenade_xmas_snowball_desc"] = "Damage: #{skill_color}#180## \nRadius: #{skill_color}#1m## \nRegen rate: #{skill_color}#1 snowball every 25s## \n\nDunk them in water, toss them in the freezer and you got yourself a deadly throwing weapon. Simple.",
		--Zapper
		["bm_grenade_electric_desc"] = "Damage: #{skill_color}#400## \nRadius: #{skill_color}#5m## \nFuse: #{skill_color}#3s## \n- #{skill_color}#Electrocutes most enemies## \n\nShrapnel is all well and good but some things need to be fried, and this little beauty is a rather practical beast for dishing out some damage with high voltage.",
		--Sticky
		["bm_grenade_sticky_grenade"] = "Semtex Grenade",
		["bm_grenade_sticky_grenade_desc"] = "Damage: #{risk}#800## \nRadius: #{skill_color}#4m## \nFuse: #{skill_color}#2.5s## \n\nThrowable explosive compound that will stick to most surfaces, including people!",
		--Molotov
		["bm_grenade_molotov_desc"] = "Damage (Fire Pool): #{heat_warm_color}#1200 over 10s##\nDamage (Burn): #{heat_warm_color}#60 over 3 seconds## \nRadius: #{skill_color}#3.75m## \nDuration (Fire Pool): #{skill_color}#10s## \nFuse: #{skill_color}#Impact detonation## \n- Has a #{skill_color}#50%## chance to #{heat_warm_color}#ignite## enemies, causing most to panic. \n \nA breakable bottle of flammable liquid with a burning rag. It is cheap, simple and highly effective. Burn it all down.",
		--Incendiary
		["bm_grenade_fir_com_desc"] = "Damage (Fire Pool): #{heat_warm_color}#1440 over 12s##\nDamage (Burn): #{heat_warm_color}#60 over 3s## \nRadius: #{skill_color}#3.75m## \nDuration (Fire Pool): #{skill_color}#12s## \nFuse: #{skill_color}#2.5s## \n- #{skill_color}#50%## chance to #{heat_warm_color}#ignite## enemies, causing most to panic.\n\nA self igniting phosphorus container. Perfect for bouncing off walls and around corners towards your enemies.",
		--Concussion
		["bm_concussion_desc"] = "Radius: #{skill_color}#10m## \n- Stuns enemies for up to #{skill_color}#4s##\n- Enemy accuracy reduced by #{skill_color}#50%## for #{skill_color}#7s## \n- #{important_1}#Titan-Shields, Titan-Bulldozers and Captains are immune to its stunning effects## \n\nThis stunning little beauty will take everyone's breath away, giving you that extra moment to kill them.",
		--Gas
		["bm_grenade_poison_gas_grenade"] = "Manticore-6 Grenade",
		["bm_grenade_poison_gas_grenade_desc"] = "Damage: #{stats_positive}#300 over 10s## \nRadius: #{skill_color}#6m## \nDuration (Gas Cloud): #{skill_color}#12s## \nFuse: #{skill_color}#1s after remaining stationary## \n- #{skill_color}#100%## chance to stun most enemies in range of the gas\n- #{important_1}#Shields, Bulldozers, Grenadiers and Captains are immune to its stunning effects##\n- #{important_1}#Enemies cannot be poisoned by the same gas cloud more than once## \n\nThis experimental bio-weapon will emit a sweeping cloud of toxic gas that targets specific genotypes; has been engineered to not harm you or your crew. Victims will experience violent coughing, nausea, vomiting and is lethal to all but the toughest of enemies.\n\nTruly a war-criminal's weapon of choice, peko.",
		["bm_grenade_poison_gas_grenade_desc_short"] = "Damage: #{stats_positive}#300 over 10s## \nRadius: #{skill_color}#6m## \nDuration (Gas Cloud): #{skill_color}#12s## \nFuse: #{skill_color}#1s after remaining stationary## \n- #{skill_color}#100%## chance to stun most enemies in range of the gas\n- #{important_1}#Shields, Bulldozers, Grenadiers and Captains are immune to its stunning effects##\n- #{important_1}#Enemies cannot be poisoned by the same gas cloud more than once##",

		--Throwing Cards
		["bm_wpn_prj_ace_desc"] = "Damage: #{skill_color}#240## \n- #{skill_color}#Can be retrieved## \n\nThrowing cards with added weight and a razor edge. A real killer hand of cards.",
		--Throwing Stars
		["bm_wpn_prj_four_desc"] = "Damage (Impact): #{skill_color}#200## \nDamage (Poison): #{stats_positive}#120 over 4s## \n- #{skill_color}#Can be retrieved##\n- #{skill_color}#50%## chance to stun most enemies every #{skill_color}#0.5s##\n- #{important_1}#Shields, Bulldozers, Grenadiers and Captains are immune to its stunning effects.## \n\nThe throwing star has a long history filled with blood and battle. These poison coated stainless steel stars will pose a lethal threat to anyone in your way.",
		--Javelin
		["bm_wpn_prj_jav_desc"] = "Damage: #{skill_color}#360## \n- #{skill_color}#Can be retrieved## \n\nWith its origins lost in cloudy pre-history, the javelin is a simple weapon. After all, it's a thrown stick with a pointy end that ruins someone's day.",
		--Throwing Axe
		["bm_wpn_prj_hur_desc"] = "Damage: #{skill_color}#360## \n- #{skill_color}#Can be retrieved## \n\nThey say a sharp axe is never wrong. A thrown sharp axe couldn't be any more right.",
		--Throwing Knife
		["bm_wpn_prj_target_desc"] = "Damage: #{skill_color}#240## \n- #{skill_color}#Can be retrieved## \n\nA solid backup plan and a reliable tactic for a precise and silent kill.",

		--Perk Deck Throwables
		["bm_grenade_copr_ability"] = "Ampule",
		["bm_grenade_damage_control"] = "Hip Flask",
		["bm_grenade_smoke_screen_grenade_desc"] = "Radius: #{skill_color}#6m## \nDuration: #{skill_color}#12s## \nFuse: #{skill_color}#1 second after remaining stationary## \n\nDrop one of these and you'll vanish in a cloud of smoke, leaving your enemies struggling to take aim at you.",
		
		--WEAPON & ATTACHMENT DESCRIPTIONS
		--[[ MANUFACTURERS ]]
				--In-Universe Manufacturer deets
					--Crosskill/Corvus (Payday/OTWD) = Colt
					--DSC [Defense System Crosskill] (PD2) = Saco Defense
					--Simmons Armory (PD2) = Springfield Armory 
						--same acronym lol
					--Bernetti = Beretta
					--Chimano/Stryk = Glock 
					--SG = HK (Heckler Und Koch)
					--Signature/FIK (PD2/OTWD + PD3) = Sig Sauer
						--Signature = European Branches, FIK = American Branch?
					--VF (OTWD + PD3) = FNH
					--Lakner (PD2) = Walther
					--Kang Arms (PD2) = Norinco
					--Northwest (PD3) = China South Industries Group
					--Touro = Taurus (lmao)
					--LWI [Lion Weapon Inc.] (PD2) = Kel-Tec 
						--LWI was Taken from the incredibly hard to read text on the right side of the SUB2000
					--ITI (OTWD) = IMI/IWI
					--CR/TKA (PD2/OTWD) = CZ
					--TTO [Tecci Tactical Operations] (PD2) = Taran Tactical
					--Ferino (OTWD) = Franchi
					--Moretti (PD2) = Benelli(?)
					--Stefan (PD2) = Steyr
					--Wasp = Magpul
						--idunno
					--Repeater/Eaton (PD2/OTWD) = Winchester
					--Rangehitter (PD2) = Marlin
						--"Rangehitter" was bummed off it's original "Bernetti Rangehitter" name as "Bernetti"/Beretta doesn't make the SBL

					["manufacturer_colt"] = "Crosskill",
					["manufacturer_saco"] = "DSC",
					["manufacturer_springfield"] = "Simmons",
					["manufacturer_sigusa"] = "FIK",
					["manufacturer_keltec"] = "LWI",
					["manufacturer_winchester"] = "Eaton",
					["manufacturer_marlin"] = "Rangehitter",
					["manufacturer_swesson"] = "J&M",

					["manufacturer_fnh"] = "VF",
					["manufacturer_sig"] = "Signature",
					["manufacturer_hk"] = "S&G",
					["manufacturer_walther"] = "Lakner",
					["manufacturer_steyr"] = "Stefan",
					["manufacturer_glock"] = "Chimano",

					["manufacturer_benelli"] = "Moretti",
					["manufacturer_franchi"] = "Ferino",
					["manufacturer_beretta"] = "Bernetti",

					["manufacturer_kalashnikov"] = "IZMHA",
					["manufacturer_tula"] = "IZMHA",
					["manufacturer_cz"] = "TKA",

					["manufacturer_imi"] = "ITI",

					["manufacturer_taurus"] = "Touro",

					["manufacturer_chinaindustries"] = "Northwest",
					["manufacturer_norinco"] = "Kang Arms",


			--Contains anything that should always be set regardless of the weapon names option chosen like descriptions or Resmod added weapons and attachments
			--[[ RESMOD WEAPONS + ATTACHMENTS ]]
				--socom deez nuts--
				["bm_w_socom"] = "Anubis .45",
				["bm_w_socom_desc"] = "Jackal's sidearm of choice. A reliable and powerful .45 ACP handgun with a stylish design.",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Ra Combined Module",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "Turn it on/off by pressing #{skill_color}#$BTN_GADGET##",
				["bm_w_x_socom"] = "Akimbo Anubis .45s",
				--S&W .500
				["bm_w_shatters_fury"] = "Phoenix .500",
				["bm_wp_shatters_fury_desc"] = "A massive .500 caliber revolver with insane kick and stopping power. Shatter's weapon of choice.\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				["bm_wp_wpn_fps_pis_shatters_fury_b_comp1"] = "Horus Barrel",
				["bm_wp_wpn_fps_pis_shatters_fury_b_comp2"] = "Shatter Barrel",
				["bm_wp_wpn_fps_pis_shatters_fury_b_long"] = "Hathor Barrel",
				["bm_wp_wpn_fps_pis_shatters_fury_b_short"] = "Firebird Barrel",
				["bm_wp_wpn_fps_pis_shatters_fury_g_ergo"] = "Ergo Grip",
				["bm_wp_wpn_fps_pis_shatters_fury_body_smooth"] = "Smooth Cylinder",
				--OICW--
				["bm_w_osipr"] = "SABR",
				["bm_w_osipr_gl"] = "SABR Grenade Launcher",
				["bm_w_osipr_desc_pc"] = "X-Generation weapon technology. Equipped with a #{skill_color}#20mm grenade launcher.##\nPress #{skill_color}#$BTN_BIPOD## to switch to the Grenade Launcher.",
				["bm_w_osipr_desc"] = "X-Generation weapon technology. Equipped with a #{skill_color}#20mm grenade launcher.##\nHold #{skill_color}#$BTN_BIPOD## to switch to the Grenade Launcher.",
	
				--Reinfield
				["bm_wp_r870_s_folding_ext"] = "Unfolded Muldon Stock",
				--Bernetti--
				["bm_wp_upg_i_93r"] = "Bernetti 93t Kit",
				["bm_wp_upg_i_93r_desc"] = "#{risk}#Adds a fire selector##, permitting this weapon to switch to a #{skill_color}#1100 RPM 3-round burst## setting, at the cost of #{important_1}#extra kick.##",
				--10-0
				["bm_wp_upg_i_tekna"] = "Tekna Burst Kit",
				["bm_wp_upg_i_tekna_desc"] = "Locks this weapon to fire in #{risk}#3-round bursts##; pair it with a #{skill_color}#glaive## maybe?",
				["bm_wally_desc"] = "#{important_2}#Hey kiddo...##",
				--AMR16--
				["bm_wp_upg_i_m16a2"] = "AMR-16 B3 Kit",
				["bm_wp_upg_i_m16a2_desc"] = "Trade full-auto for a #{skill_color}#3-round burst## setting. #{risk}#Burst#{skill_color}# fire rate is #{skill_color}#increased to 950 RPM.##",
				--Bernetti Auto--
				["bm_wp_upg_i_b93o"] = "Bernetti OVERKILL Kit",
				["bm_wp_upg_i_b93o_desc"] = "Trade burst-fire for a #{skill_color}#full-auto## setting, at the cost of #{important_1}#extra kick.##",
				--2006M Hailstorm
				["bm_wp_upg_i_iw_hailstorm"] = "Hailstorm Kit",
				["bm_wp_upg_i_iw_hailstorm_desc"] = "A prototype weapon kit manufactured by Fujiwara Heavy Industries.\n\nModifies this weapon to chamber special #{skill_color}#triple-stacked munitions.##",
				["bm_wp_upg_i_iw_hailstorm_no_pen_desc"] = "A prototype weapon kit manufactured by Fujiwara Heavy Industries.\n\nModifies this weapon to chamber special #{skill_color}#triple-stacked munitions## but #{important_1}#damage though armor is reduced by 50% and can no longer pierce shields.##",
				--M32 MK32 Kit
				["bm_wp_upg_i_ghosts_mk32"] = "MK32 Kit",
				["bm_wp_upg_i_ghosts_mk32_desc"] = "A prototype weapon kit from Task Force: STALKER.\n\nTrade single fire for #{skill_color}#2-round bursts.##",
				--AR-15 MAGS
				["bm_wp_upg_vintage_fal_sc"] = "Ridgeback Mag",
				["bm_wp_upg_vintage_sc"] = "Vintage Mag",
				["bm_wp_upg_mil_sc"] = "Milspec Mag",
				["bm_wp_upg_tac_sc"] = "Tactical Mag",
				--Generic Mods
				["bm_wp_upg_vg_afg"] = "AFG",
				["bm_wp_upg_vg_stubby"] = "Stubby Vertical Grip",
				["bm_wp_upg_vg_tac"] = "TAC Vertical Grip",
				["fucktheatf"] = "That's a felon.",
				["bm_wp_upg_flash_hider"] = "#{skill_color}#Hides muzzle flash## and #{risk}#reduces the chance of enemies evading your aim.##",
				["bm_wp_upg_suppressor"] = "#{skill_color}#Silences## your weapon and #{risk}#reduces the chance of enemies evading your aim.##",
				["bm_wp_upg_suppressor_boss"] = "\"What a thrill...\"\n\n#{skill_color}#Silences## your weapon and #{risk}#reduces the chance of enemies evading your aim.##",
				["bm_wp_upg_suppressor_warn"] = "#{skill_color}#Silences## your weapon and #{risk}#reduces the chance of enemies evading your aim.##\n\n#{important_1}#May block sights.##",
				["bm_wp_upg_o_shortdot_dmc"] = "Shortdot Scope",
				["bm_wp_upg_o_5_default"] = "Long-range scope.\nAttach to be able to modify the default sniper scope reticle.\n#{skill_color}#5x magnification.##",
				["bm_wp_upg_mil_desc"] = "", --These didn't do anything when edited, maybe they aren't actually called?--
				["bm_wp_upg_drum_desc"] = "",
				["bm_wp_upg_drum2_desc"] = "",
				["bm_wp_upg_quad_desc"] = "",
				["bm_wp_upg_quad2_desc"] = "",
				["bm_wp_upg_vintage_desc"] = "",

				--CUSTOM WEAPON ATTACHMENTS
					--M6D
					["kfa_scope"] = "KFA-2 Smart-Link Scope",
					["kfa_scope_desc"] = "Enable interfacing between your mask and the mounted #{skill_color}#Smart-Link## scope.\n#{risk}#2x magnification.##",
					--M6D
					["halo_scope"] = "Smart-Linked Scope",
					["halo_scope_2_desc"] = "Enable interfacing between your mask and the mounted #{skill_color}#Smart-Link## scope.\n#{risk}#2x magnification.##",
					--M200 WIDOWMAKER
					["bm_wp_upg_i_iw_widowmaker"] = "Widowmaker Kit",
					["bm_wp_upg_i_iw_widowmaker_desc"] = "A prototype weapon kit manufactured by Kendall Ballistics.\n\nModifies this weapon to chamber special #{skill_color}#double-stacked munitions.##",
					--NV4
					["bm_wp_upg_o_iwelo"] = "Emitted Light Optic with a floating illuminated reticle\n#{risk}#1.1x magnification.##",
					["bm_wp_upg_o_iwrds"] = "Precision red dot sight.\n#{risk}#1.5x magnification.##",

					--Raygun
					["bm_wp_raygun_o_waw"] = "OG Iron Sight Alignment",
					["bm_wp_raygun_o_waw_desc"] = "Changes the iron sight alignment to how it was before Call of Duty: Black Ops II",
			
			--[[ PISTOLS ]]
				--Gecko Pistol
				["bm_tranq_maxim_sc_desc"] = "The world's first #{skill_color}#integrally suppressed## semi-auto pistol, good handling and concealability tie in well with debilitating tranquilizer rounds.\n\n#{stats_positive}#Deals damage over time with tranquilizer rounds.##",
				["bm_tranq_x_maxim_sc_desc"] = "A pair of the world's first #{skill_color}#integrally suppressed## semi-auto pistol, good handling and concealability tie in well with debilitating tranquilizer rounds.\n\n#{stats_positive}#Deals damage over time with tranquilizer rounds.##",
				--Igor (APS)
				["bm_stech_sc_desc"] = "A heavier, slower firing, machine pistol that lost favor due to its encumbrance. Its weight allows better control at the cost of concealing ability.",
				["bm_x_stech_sc_desc"] = "A heavier, slower firing, machine pistol that lost favor due to its encumbrance. Its weight allows better control at the cost of concealing ability.",
				--Chimano Compact
				["bm_jowi_sc_desc"] = "A Chimano that's configured to take concealment to the extreme at the cost of almost everything else.\n\nRumors say that Wick used this when seeking vengeance against the Russian mob.",
				["bm_x_jowi_sc_desc"] = "When they're this small, why not carry two? An akimbo pairing that incorrectly gets attributed to as Wick's personal choice.",
				--Glock 18c
				["bm_g18c_sc_desc"] = "Fully automatic Austrian spraygun. Difficult to control, but at close range is absolutely devastating.",
				["bm_x_g18c_sc_desc"] = "If one was a bullet hose, carrying two may as well be a storm. Mind the recoil!",
				--CZ 75
				["bm_czech_sc_desc"] = "One of the Wonder Nines, a machine pistol with fine ergonomics and handling. Used by counter terrorist forces all over the world.",
				["bm_x_czech_sc_desc"] = "Another example of how not to use a machine pistol. How can you even comfortably reload the things?",
				--PPK (Gruber)
				["bm_ppk_sc_desc"] = "A compact alternative to larger, more dangerous firearms. A classic weapon with classic application.",
				["bm_x_ppk_sc_desc"] = "For when you need to be less 007 and more Kingsman.",
				--M13
				["bm_legacy_sc_desc"] = "West German design that was ultimately rejected in favor of the Bernetti, but will still hold its own in a fire fight.",
				["bm_x_legacy_sc_desc"] = "Two pistols forgotten by history that will leave a legacy of lead in a room of your choosing.",
				--Glock 17
				["bm_g17_sc_desc"] = "Easy to control recoil and reliable. The perfect sidearm to start a heisting career.",
				["bm_x_g17_sc_desc"] = "Making up for puny 9mm by sheer amount of firepower and still taking advantage of low recoil.\n\nHoxton's choice when we busted him out.",
				--Bernetti 9
				["bm_b92fs_sc_desc"] = "A popular firearm due to an impressive magazine capacity and decent damage. Especially handy for confrontations with numerous antagonists.",
				["bm_x_b92fs_sc_desc"] = "Two pistols are better than one. Another way to turn any engagement into a 9mm party.",
				--White Streak
				["bm_pl14_sc_desc"] = "Modern Russian handgun using post-soviet tech from the west. Popular among the Reapers for its reliability and futuristic look.",
				["bm_x_pl14_sc_desc"] = "Modern Russian handgun using post-soviet tech from the west. Popular among the Reapers for its reliability and futuristic look.",
				--Holt 9mm
				["bm_holt_sc_desc"] = "A working prototype of a sidearm that's been stuck in development hell, features an innovative design to help reduce recoil.",
				["bm_x_holt_sc_desc"] = "Not one, but two working prototypes of the pistol equivalent to lost media.",
				--FMG-9
				["bm_fmg9_sc_desc"] = "A prototype weapon platform that functions as a baby carrier for your STRYK 18c, features futuristic folding technology!",
				--93R
				["bm_beer_sc_desc"] = "A borderline fictional piece of burst-fire hardware that'll have creeps scrambling to figure out whose move it is. Dead or alive, you're coming with me.\n\nHas a #{skill_color}#1200 RPM## fire rate when on burst-fire.",
				["bm_beer_auto_desc"] = "A borderline fictional piece of select-fire hardware that'll have creeps scrambling to figure out whose move it is. Dead or alive, you're coming with me.",
				--Contractor Pistols 
				["bm_packrat_sc_desc"] = "Wick's choice for its reliability and overall ease of use, said to have been used when he paid The Red Circle a visit.",
				["bm_x_packrat_sc_desc"] = "The go-to for when you want to clear Russian owned nightclubs with a message of blood and vengeance.",
				--Breech (Luger) 
				["bm_breech_sc_desc"] = "The pistol that almost took over the world. Twice. This German artifact is sleek, accurate and unfortunately obsolete.",
				--Chimano Custom
				["bm_g22c_sc_desc"] = "This weapon is a combination of high capacity and high power. Among the best overall combat pistols.",
				["bm_x_g22c_sc_desc"] = "If one vote was a free gun, voting fraud seems appealing when you can get two of these portable body stoppers.",
				--Signature .40
				["bm_p226_sc_desc"] = "Whether it be Armored Transport interception or Bank Robberies, this classic cop-stopper will never fail to disappoint.",
				--LEO
				["bm_hs2000_sc_desc"] = "Interpol agents, crooked Croatian cops, and international criminals alike will find this compact blaster effective.",
				["bm_wp_hs2000_sl_long"] = "Elite Slide",
				--5/7 pistol
				["bm_lemming_sc_desc"] = "Power and capacity combined. If it isn't dead in 20 rounds you probably shouldn't be shooting at it.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
				--Baby Deagle--
				["bm_sparrow_sc_desc"] = "SEE YOU SPACE COWBOY...",
				["bm_w_sparrow_sc_g_cowboy_desc"] = "YOU'RE GONNA CARRY THAT WEIGHT.",
				--socom deez nuts--
				["bm_w_socom_desc"] = "Jackal's sidearm of choice. A reliable and powerful .45 ACP handgun with a stylish design.",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Ra Combined Module",
				["bm_wp_wpn_fps_upg_fl_pis_socomlam_desc"] = "Turn it on/off by pressing #{skill_color}#$BTN_GADGET##",
				--Crosskill
				["bm_1911_sc_desc"] = "When 9mm isn't enough, reach for this custom 1911A1 chambered in the powerful .45ACP. Top shelf brutality.",
				["bm_x_1911_sc_desc"] = "While it doesn't have demonic powers, the carnage will certainly leave people screaming in terror.",
				--Crosskill Chunky
				["bm_m1911_sc_desc"] = "A reproduction of the classic Crosskill .45. Despite the name, not at all chunkier than the custom one.",
				--Crosskill Guard
				["bm_shrew_sc_desc"] = "Smaller and more compact than its classic A1 cousin. Trades magazine capacity and barrel length for even more concealability.",
				["bm_x_shrew_sc_desc"] = "The way of the Canaanites, two .45 problem solvers in a seriously small package sure to leave invaders running.",
				["bm_shrew_g_bling_sc_desc"] = "In a world filled with misery and uncertainty, it is a great comfort to know that, in the end, there is light in the darkness.",
				--USP 
				["bm_usp_sc_desc"] = "S&G's above average performer excels in damage, capacity and range.",
				["bm_x_usp_sc_desc"] = "A pair of S&G pistols for when you really need to send a message.",
				--Model 54 
				["bm_type54_sc_desc"] = "A Soviet designed pistol chambered in the hard hitting 7.62×25mm round; features a unique underbarreled shotgun mount for an extra way to get rid of bad guys.",
				["bm_x_type54_sc_desc"] = "A one-two punch that can turn into a one-two-three-four punch.",
				--Broomstick--
				["bm_c96_sc_desc"] = "\"...and then the #{important_1}#wolf## ate up Little Red Riding Hood.\"\n\nA revolutionary German pistol, this one in particular has been modified to fire in full-auto.\n\nThis weapon reloads in clips of 10 bullets at a time.",
				["bm_wp_c96_nozzle"] = "BlasTech DL-44 Muzzle",
				["bm_wp_c96_nozzle_desc_sc"] = "Tech said to have come from #{skill_color}#a galaxy far, far away## converts this weapon to #{risk}#fire bolts of plasma## and utilize a #{skill_color}#recharging magazine.##\n\nRecharge delay: #{skill_color}#2s##\nRecharge rate: #{skill_color}#3/s## #{important_1}#(Halved while overheated)##\nOverheat penalty: #{important_1}#2s##",
				--Sub2000
				["bm_sub2000_sc_desc"] = "Pistol carbine of questionable manufacturing quality. Tiny pistol bullets hit a lot harder when coming out of a longer barrel and its folding capability makes for decent concealment.",
				--Deagle
				["bm_deagle_sc_desc"] = "What more needs to be said about this semi automatic magic wand? Just wave it at the bad guys and shout \"Headicus Explodicus!\"\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",
				["bm_x_deagle_sc_desc"] = "Twin wrist wreckers that take a real nut to actually carry into battle.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",	
				--Kahn .357
				--Matever 2006m
				["bm_2006m_sc_desc"] = "A rare design of an already rare production run. A fancy way to send .38 down range.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",
				["bm_x_2006m_sc_desc"] = "The logistics of handling two of these is outweighed by the sheer badass factor.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",
				--Frenchman Model 87
				["bm_model3_sc_desc"] = "A classic answer to the lifelong question \"What am I going to to about all these jerks all up in my face?\"\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",
				["bm_x_model3_sc_desc"] = "Bring out your inner rootin' tootin' qualities and challenge the cops to a dual at high noon with these twin revolvers.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",	
				--Raging bull
				["bm_rage_sc_desc"] = "Very powerful short range cannon. It puts down mooks fast so long as you're lining up shots.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce multiple enemies.##",
				["bm_x_rage_sc_desc"] = "Not at all good or practical, you can't help but want to flex on the police force by pulling these out during a bank robbery.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce multiple enemies.##",
				--Castigo
				["bm_chinchilla_sc_desc"] = "Powerful, accurate, and stylish. Handy for breaking through the more durable foes in DC.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce multiple enemies.##",
				["bm_x_chinchilla_sc_desc"] = "A sicario needs to ensure his mark is down, two of these will guarantee it.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce multiple enemies.##",
				--RUS-12
				["bm_rsh12_sc_desc"] = "The absolute final word in one handed caliber pissing matches.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				--SAA/Peacemaker
				["bm_ap_weapon_peacemaker_sc_desc"] = "#{risk}#The greatest handgun ever made.##\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##\n\nCan be #{skill_color}#fanned for an increased fire rate## at the cost of #{important_1}#more recoil, reduced effective range and the inabilty to aim down your sights.##",
				--CUSTOM PISTOLS
					--M2019 Blaster
					["thatgun_desc"] = "It's the gun!\n\nYou know, that gun!\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce multiple enemies.##",
					--Malorian 3516
					["whydoyoucome"] = "The only one of its kind, made specially for rockerboy Johnny Silverhand.\n\n#{skill_color}#Can pierce multiple enemies and their body armor.\nRounds ricochet off surfaces while firing from the hip and pierce walls while aiming.\nWeapon Butt attacks shoot out a short ranged wave of fire.##",
					--Colt Detective
					["bm_lemon_dmc_desc"] = "Imagine yourself with a concealable, high-powered revolver. Now imagine no futher, as the Investigator is exactly that.\n\n#{skill_color}#Deals double damage when attacking enemies from behind.##",
			
			--[[ SMGs ]]
				--Kobus 90
				["bm_p90_sc_desc"] = "A bullpup SMG and competitor to the SpecOps-7 SMG. Frequently commented on as looking like a futuristic space gun.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
				["bm_wp_p90_body_p90_tan"] = "Tan Stock",
				["bm_wp_90_body_boxy_desc"] = "Recovered from the desolated remains of an old OMNIA warehouse, this frame makes no difference to the weapon's handling or its functionality whatsoever, but its block-like aesthetic surely makes it a nice thing to have.",
				--Spec Ops
				["bm_mp7_sc_desc"] = "A lightweight SMG and competitor to the Project-90 SMG. Doesn't have an undermounted grenade launcher as some sources may lead you to believe.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
				--Heather
				["bm_sr2_sc_desc"] = "Utilizing a specialized 9×21mm round, the Heather SMG is the Russian answer to the Project-90 and SpecOps-7 SMGs.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 50% more damage to non-captain enemies.##",
				--Compact-5/MP5
				["bm_mp5_sc_desc"] = "The little sister to the Gewehr-3.\nFast-firing, accurate and easy to handle, what more could you want out of an SMG?",
				--Pachett/Sterling
				["bm_wp_sterling_b_e11"] = "BlasTech E-11 Barrel",
				["bm_wp_sterling_b_e11_desc_sc"] = "Tech said to have come from #{skill_color}#a galaxy far, far away## converts this weapon to #{risk}#fire bolts of plasma## and utilize a #{skill_color}#recharging magazine.##\n\nRecharge delay: #{skill_color}#1.4s##\nRecharge rate: #{skill_color}#6/s## #{important_1}#(Halved while overheated)##\nOverheat penalty: #{important_1}#2s##",
				--Uzi
				["bm_uzi_sc_desc"] = "While slow firing, the Uzi makes for a reliable, easy to control SMG that can still deliver a punch, especially now given its .41 AE conversion",
				--Chicago Typewriter
				["bm_thompson_sc_desc"] = "Sporting a high-capacity drum magazine, you too can bring on the mobster heat as you mow down your enemies.",
				--MP40
				["bm_erma_sc_desc"] = "A fairly reliable SMG that saw widespread use in the hands of infantrymen during WWII, just don't use the magazine as a grip.",
				--CUSTOM SMGs
					--AR57
					["bm_w_alpha57_prim_desc"] = "The FSS Hurricane sacrifices range and stopping power for increased ammo capacity and enhanced stabililty.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
					--LWRC
					["bm_w_smg45_desc"] = "An American clone of the AMP-45.",
					--Typhoon
					["bm_w_crysis3_typhoon_desc"] = "\"It's the purest form of expression, and right now #{important_1}#I've got a lot to say##\"\n\nUtilizing #{risk}#superposed loading## technology, this 10-barrelled machine gun trades damage for spitting lead out at blisteringly high speeds.\n\nAlt-fire fires a #{skill_color}#volley## of #{skill_color}#10## rounds down range.",
			
			--[[ MGs ]]
				--Bootleg/HK416c
				["bm_w_tecci_desc_sc"] = "A piston operated rifle specced out like an LMG that can accurately spit lead.",
				--KSP/M249
				["bm_m249_sc_desc"] = "Reloading is a pain in the ass, but chances are that everybody will be dead before you even need to reload.",
				--ChainSAW
				["bm_kacchainsaw_sc_desc"] = "Roaming frothing madness in a machine gun.\n\n#{skill_color}#Has improved hipfire spread.##",
				["bm_wp_upg_i_kacchainsaw_adverse"] = "Adverse Gas System",
				--RPK
				["bm_rpk_sc_desc"] = "A good choice when you want your bullet-hose to be on target and a little more Eastern Bloc.",
				["bm_wp_rpk_m_ban_sc"] = "Potassium Magazine",
				["bm_wp_ak_m_drum"] = "Drum Magazine",
				--Brenner 21/HK21
				["bm_hk21_sc_desc"] = "The big-little sister to the Gewehr-3. Comes with an increased fire rate for even greater suppressive abilties.",
				--M60
				["bm_m60_sc_desc"] = "Nicknamed 'The Pig' for being hungry for ammo and incredibly cumbersome. Expect anyone down range to be a closed casket.\n\n#{skill_color}#Has improved hipfire spread.##",
				--Ksp 58
				["bm_par_sc_desc"] = "A heavier sibling machinegun to the KSP-90 typically mounted on vehicles. Trades mobility for an even bigger bullet.",
				--Versteckt-51/HK51B
				["bm_hk51b_sc_desc"] = "Aftermarket conversion of the Brenner-21, shrinking this MG down to Compact-5 sizes and increasing its rate of fire even further than the Brenner's.",
				--Buzzsaw/Mg42
				["bm_wolf_brigade_sc_desc"] = "\"We are not men disguised as mere dogs.\nWe are #{important_1}#wolves## disguised as mere men.\"\n\n#{skill_color}#Has improved spread and recoil while hipfired.##",
				["bm_wp_mg42_b_vg38"] = "BlasTech DLT-19 Barrel",
				["bm_wp_mg42_b_vg38_desc_sc"] = "Tech said to have come from #{skill_color}#a galaxy far, far away## converts this weapon to #{risk}#fire bolts of plasma## and utilize a #{skill_color}#recharging magazine.##\n\nRecharge delay: #{skill_color}#3s##\nRecharge rate: #{skill_color}#9/s## #{important_1}#(Halved while overheated)##\nOverheat penalty: #{important_1}#4s##",
				--M134
				["bm_m134_sc_desc"] = "\"Each step you take is paved with the corpses of your enemies...\"\n\n#{risk}#Has a brief spin-up period before firing; aiming keeps the weapon spun-up.##",
				--Microgun
				["bm_shuno_sc_desc"] = "\"This is your road. When you come, you'll walk it alone.\"\n\n#{risk}#Has a brief spin-up period before firing; aiming keeps the weapon spun-up.##",
				--Custom MGs
					--TF2 Minigun
					["bm_wp_wpn_fps_lmg_sasha_body_desc"] = "",
					["bm_wp_wpn_fps_lmg_iron_curtain_body_desc"] = "",
					["bm_wp_wpn_fps_lmg_tomislav_body_desc"] = "#{skill_color}#Speeds up spin-up time by 20%.##",
					["bm_wp_wpn_fps_lmg_natascha_body_desc"] = "#{skill_color}#Staggers enemies up to 9.75 meters away.##\n#{risk}#(Stagger range cannot be modified)##\n#{important_1}#Slows spin-up time by 30%.##",
					["bm_wp_wpn_fps_lmg_gatling_gun_body_desc"] = "#{important_1}#Slows spin-up time by 50%.##",
					["bm_wp_wpn_fps_lmg_canton_body_desc"] = "#{skill_color}#80% chance to set enemies on fire, dealing## #{heat_warm_color}#60## #{skill_color}#damage over 4 seconds.##\n#{risk}#Chance is reduced over range and only stuns enemies before damage falloff starts.\nDeals fire damage instead of bullet damage.##",
			
			--[[ SHOTGUNS ]]
				--Saiga
				["bm_saiga_sc_desc"] = "This fully automatic shotgun is perfect for those days you just don't feel like aiming.",
				["bm_wp_saiga_m_20rnd"] = "Drum Magazine",
				--AA12
				["bm_aa12_sc_desc"] = "Box magazine fed full-auto only shotgun. Great for making lasting impressions.",
				--Spas12
				["bm_spas12_sc_desc"] = "A heavier and more complicated alternative to other semi-auto shotguns, features an almost alien alternative firing mode.",
				--Benelli
				["bm_benelli_sc_desc"] = "Top of the line tactical shotgun. Perfect for clearing particularly busy rooms.",
				--Argos III
				["bm_ultima_sc_desc"] = "Nothing says modern like plastic and aluminum, it even comes with a USB slot to charge your phone.\n\nReloads #{skill_color}#2## shells at a time.",
				--Supernova
				["bm_supernova_sc_desc"] = "A shotgun franken-smithed to be capable of switching between pump-action and semi-auto.",
				--Loco
				["bm_serbu_sc_desc"] = "Aftermarket version of the Reinfeld 880 that has been cut down in size; for those who want concealability and a desire to destroy their wrists.",
				--Reinfeld 88
				["bm_menu_sc_m1897_desc"] = "This iconic historical piece has seen everything from muddy trenches to thick pacific island jungles, and has a nasty reputation of being quite an effective firestarter.",
				--Mosconi 12g
				["bm_menu_sc_m590_desc"] = "An improved version of an old classic. A fine choice for LEOs, soldiers, private citizens, and bank robbers alike.",
				--R870
				["bm_menu_sc_r870_desc"] = "Long arm of the law and freedom. Now freedom has a shotgun and shells with your name on it.",
				--KSG
				["bm_menu_sc_ksg_desc"] = "Everything is plastic in the future! Bullpup shotgun with questionable craftsmanship, an LWI specialty.",
				--Breaker 10g
				["bm_menu_sc_boot_desc"] = "An antique shotgun sporting a powerful 10g shotgun shell and an even more potent badass factor. Come with me if you want to live.",	
				--Mosconi
				["bm_menu_sc_huntsman_desc"] = "Double the barrels, double the fun. While limited when it comes to magazine size, #{skill_color}#two triggers## allows you to unleash a ragnarok of buckshot on any unfortunate SOB in the same room as you.",
				--Judge
				["bm_x_judge_sc_desc"] = "Judge and Jury, and with two of these portable room-clearers, you're the executioner.",
				--Joceline
				["bm_b682_sc_desc"] = "A competition over-under typically reserved for sporting events, only instead of clay pigeons you'll be using it for popping helmets.",
				--Custom Shotguns
					--Reinbeck M1
					["bm_w_beck_desc"] = "The criminal underworld's most popular shotgun has returned from its grave to reclaim its rightful place in the shotgun hierarchy. Originally used in the 2011 Crimewave, this shotgun has been proven extremely reliable in just about any close range situation.",
					--Doomstic
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_close_desc"] = "Type of pellets effective at close range.\n#{skill_color}#Increases pellet count to 10.##",
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_buckshot_med_desc"] = "Type of pellets effective at medium range.\n#{important_1}#Lowers pellet count to 6.##",
					["bm_wp_wpn_fps_upg_quadbarrel_ammo_slug_desc"] = "Powerful steel slug effective at long range.\nCapable of #{skill_color}#piercing body armor, enemies, shields, titan shields, and walls.##",
					--Widowmaker TX
					["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "Extended Magazine",
					["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "Burst Fire System",
					["bm_wp_wpn_fps_upg_wmtx_gastube_burst_desc"] = "Adds a ##{skill_color}#2 round burst-fire## toggle.",
			
			--[[ ARs ]]
				--S552		
				["bm_s552_sc_desc"] = "An elegant alternative to other compact 5.56mm rifles, the preferred choice among DHS. Uses special Swiss-made 5.6mm rounds that offer better range.",
				--M733/AMCAR
				["bm_amcar_sc_desc"] = "The most mass produced .223 rifle the world has ever seen. A great all-purpose rifle.",
				--G36
				["bm_g36_sc_desc"] = "Another top shelf contender for the 'best plastic rifle' award.",
				--VHS/Lion's Roar
				["bm_vhs_sc_desc"] = "A difficult weapon to wield that boasts impressive performance in the hands of the capable.\n\nSaid to carry the spirit of Dragan's fury in combat.",
				--Olympic/Para
				["bm_menu_sc_olympic_desc"] = "A grossly oversized pistol firing a rifle round in a fully automatic manner. This gun is an existential crisis that shoots bullets.",
				--TAR-21/Para
				["bm_menu_sc_komodo_desc"] = "A lot of damage in a seriously compact package. Great for CQB or ranged encounters.",
				--Famas
				["bm_menu_sc_famas_desc"] = "This weapon trades magazine capacity for rate of fire and accuracy. A very effective tool for shooting apples off of people's heads.",
				--M4/CAR-4
				["bm_m4_sc_desc"] = "Reliable, compact, and deadly. Sporting a more controllable rate of fire over the AM-CAR, the CAR-4 makes for a popular 5.56mm rifle among modern militaries.",
				["bm_wp_upg_fg_m4a1"] = "Em-Four Kit",
				["bm_wp_upg_fg_m4a1_desc"] = "This Exclusive Set swaps out the aftermarket flip-up sights for a more traditional set up. #{risk}#Overrides the appearance of your handguard.##",
				["bm_wp_upg_s_fixed"] = "CAR Fixed Stock",
				["bm_wp_m4_m_drum"] = "Drum Magazine",
				--AK5
				["bm_ak5_sc_desc"] = "A good all-purpose rifle famous for bank robberies and confusing the uninformed regarding its bullet dimensions.",
				["fnc_burst_desc"] = "Adds a 3-round burst firemode.",
				--Union 5.56
				["bm_corgi_sc_desc"] = "Despite the reputation, this bullpup is not at all sea-worthy.",
				--UAR
				["bm_aug_sc_desc"] = "Classic bullpup rifle. Great all arounder for extra dead bad guys.",
				--AK17
				["bm_flint_sc_desc"] = "The modern interpretation of the classic AK. Features a potent #{skill_color}#2 round burst## and has quite the identity crisis.",
				--AK 5.45
				["bm_ak74_sc_desc"] = "Despite firing a smaller round than its 7.62 sister, this rifle is by no means any less deadly.",
				--CR 805
				["bm_menu_sc_hajk_desc"] = "A younger, modern, cousin to the classic bullet-hose Cobra. This one features various firing modes and even multiple round conversions... not that you'll be getting those.",
				--AMR-16
				["bm_m16_sc_desc"] = "This classic rifle serves as the predecessor to the AM-CAR. What it lacks in concealability and rate of fire it makes up for in range and power.",
				--Queen's Wrath
				["bm_l85a2_sc_desc"] = "Though its reputation has been marred by earlier iterations, this rifle stands to be one of the most accurate automatics ever made.\nStill an ergonomic nightmare though.",
				--AK 7.62
				["bm_akm_sc_desc"] = "This rifle will be a handy thing to have around when body armor starts getting popular in DC.\n\nThe Go-To for insurgents and crazy regimes throughout the world.",
				["bm_akm_gold_sc_desc"] = "What does a heister, a Mexican drug lord and a megalomaniac dictator have in common? A fascination for gold-plated rifles, of course.",
				--Queen's Wrath
				["bm_l85a2_sc_desc"] = "Though its reputation has been marred by earlier iterations, this rifle stands to be one of the most accurate automatics ever made.\n\nStill an ergonomic nightmare though.",
				--KETCHUPKNOB--
				--ASPIRING POKEMON TRAINER, ASH KETCHNOV--
				["bm_groza_sc_desc_pc"] = "The bullpup sister of the AK family, kitted out for those who want a bit more boom.\n\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
				["bm_groza_sc_desc"] = "The bullpup sister of the AK family, kitted out for those who want a bit more boom.\n\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
				--Krinkov
				["bm_akmsu_sc_desc"] = "A small rifle useful for taking down big men. Not to be underestimated as this rifle can hold its own in just about any scenario.",
				--Akimbo Krinkov
				["bm_x_akmsu_sc_desc"] = "A small rifle useful for taking down big men. Not to be underestimated as this rifle can hold its own in just about any scenario.",
				--CUSTOM ARs
					--QBZ-191
					["bm_qbz191_sc_desc"] = "Next generation Chinese assault rifle chambered in 5.8x42mm.\n\n#{skill_color}#Deals 25% of its damage through body armor.##",
					--AN-94/92
					["bm_tilt_sc_desc"] = "#{risk}#The first 2 rounds of each trigger pull## are fired at #{skill_color}#3x the rate of fire.##",
					--NV4
					["bm_nova4_sc_desc"] = "Full-auto ballistic rifle. A moderate fire rate yields increased stability for best-in-class accuracy. Ideal for mid-to-long range engagements",
					["bm_wp_wpn_fps_ass_nova4_flatline_desc"] = "Grants the following perks:\n#{heat_warm_color}#Precision:##\n#{skill_color}#No damage fall off## with #{important_1}#reduced## fire rate.\n#{item_stage_2}#Focus:##\n#{skill_color}#Increased## accuracy.",
					["bm_wp_wpn_fps_ass_nova4_chaos_desc"] = "Grants the following perks:\n#{heat_warm_color}#Celerity:##\n#{skill_color}#Increases## hipfire fire rate but #{important_1}#reduces## ADS fire rate.\n#{item_stage_2}#Steady:##\n#{skill_color}#Reduced## hipfire spread.",
					--MW22 Honey Badger
					["bm_w_mcbravo_desc"] = "With an #{skill_color}#integrated suppressor## and slow, high-energy subsonic #{risk}#.300 BLK## rounds, the Chimera is adept at close-quarters combat.",
					--BOCW CARV2
					["bm_w_t9fastburst"] = "CARV.2",
					["bm_wp_upg_i_g11"] = "K1 Internals",
					["bm_wp_upg_i_g11_desc"] = "Increases the burst fire rate to #{skill_color}#2100 RPM## and #{skill_color}#unlocks the fire selector.##",
			
			--[[ DMRs ]]
				--Little Friend
				["bm_m203_weapon_sc_desc_pc"] = "The big sister to Scarface's personal \"Little Friend\" AMR-16.\n\n#{skill_color}#Deals 25% of its damage through body armor.##\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
				["bm_m203_weapon_sc_desc"] = "The big sister to Scarface's personal \"Little Friend\" AMR-16.\n\n#{skill_color}#Deals 25% of its damage through body armor.##\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
					--VMP
					["bm_m203_vmp_sc_desc_pc"] = "A replica of Scarface's personal \"Little Friend\" AMR-16.\n\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
					["bm_m203_vmp_sc_desc"] = "A replica of Scarface's personal \"Little Friend\" AMR-16.\n\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
					["bm_mesa_vmp_sc_desc_pc"] = "Interesting product from a stolen OMNIA shipment.\n\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
					["bm_mesa_vmp_sc_desc"] = "Interesting product from a stolen OMNIA shipment.\n\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
				--FAL
				["bm_fal_sc_desc"] = "The Right Arm of the Free World. When you have to cut down mooks with heavy body armor, this is the gun you turn to.\n\n#{skill_color}#Deals 25% of its damage through body armor.##",	
				--ASS VAL
				["bm_asval_sc_desc"] = "Tiny rifle bullets might do for your run of the mill gunfighter, but others might go for this gun.\n\nComes #{skill_color}#integrally suppressed## and #{skill_color}#Deals 25% of its damage through body armor.##",
				--Galil
				["bm_galil_sc_desc"] = "A copycat of a rifle based on a Finnish design, which itself was also a derivative of the classic AK. Imitation is the sincerest form of flattery.\n\n#{skill_color}#Deals 25% of its damage through body armor.##",
				--SCAR		
				["bm_scar_sc_desc"] = "The battle rifle of the future. With a good balance of handling and ballistic damage, it's become popular among USMC and special forces.\n\n#{skill_color}#Deals 25% of its damage through body armor.##",	
				["bm_scarl_sc_desc"] = "The infantry rifle of the future... or not. While popular in the civilian market, military forces found little need for another 5.56 rifle.",

				--Galant
				["bm_galant_sc_desc"] = "A classic WW2 battle rifle. Reliable, accurate, and #{skill_color}#quick to reload when emptied.\n\nDeals 50% of its damage through body armor and can pierce multiple enemies.##",
				--M308
				["bm_m14_sc_desc"] = "Fast and accurate, just be sure to keep the recoil in check, especially on full-auto.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",	
				--G3
				["bm_g3_sc_desc"] = "Acting as the big sister to the Compact-5 and Brenner-21, this rifle's accuracy rivals that of snipers.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",	
				["bm_wp_g3_m_psg"] = "Präzision Magazine",
				--KS12
				["bm_shak12_sc_desc"] = "A battle rifle in a bullpup design sporting a very potent 12.7x55mm cartridge. Supreme carnage in a seriously compact package.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",	
				["bm_shak12_sc_oden_desc"] = "A battle rifle in a bullpup design sporting a very potent 12.7x55mm cartridge. Supreme carnage in a seriously compact package.\n\n#{skill_color}#Can pierce body armor, enemies, shields and thin walls.##",	
				["bm_wp_shak12_body_vks"] = "\"VISha\" Stock",
				["bm_wp_shak12_body_vks_ap_desc"] = "Loads high-powered rounds that #{skill_color}#grants full armor penetration and shield piercing capabilites.## Stock and bolt are reinforced with heavier materials #{important_1}#reducing rate of fire.##",
				--HCAR
				["bm_hcar_sc_desc"] = "A modern take on a classic WW2 machine gun.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce multiple enemies.##",
				--Custom DMRs
					--MCX Spear
					["bm_mcx_spear_sc_desc"] = "#{skill_color}#Deals 50% of its damage through body armor and headshots deal 33% more damage to non-captain enemies.##",
					["bm_ngsierra_sc_desc"] = "Uses a unique recoil mitigation system to control its 6.8x51mm TCVM plastic cartridge.\n\n#{skill_color}#Deals 75% of its damage through body armor, can pierce enemies and headshots deal 33% more damage to non-captain enemies.##",
					--["bm_w_xeno"] = "MA14 Surge Rifle",	
					["bm_xeno_sc_desc_pc"] = "From \"Armat\" comes this strange piece of space-age technology. Comes equipped with an #{skill_color}#integrated grenade launcher.##\n\nPress #{skill_color}#$BTN_BIPOD## to switch to the grenade launcher.",
					["bm_xeno_sc_desc"] = "From \"Armat\" comes this strange piece of space-age technology. Comes equipped with an #{skill_color}#integrated grenade launcher.##\n\nHold #{skill_color}#$BTN_BIPOD## to switch to the grenade launcher.",
					--VSS
					["bm_vss_sc_desc"] = "A variant of the Valkyria configured for better range and accuracy.\n\nComes #{skill_color}#integrally suppressed## and #{skill_color}#deals 50% of its damage through body armor and can pierce enemies.##",
					--G3 HK79
					["bm_g3hk79_sc_desc_pc"] = "A variant of the Gewehr-3 that comes equipped with an #{skill_color}#underbarrel grenade launcher## and #{skill_color}#deals 50% of its damage through body armor and can pierce enemies.##\n\nPress #{skill_color}#$BTN_BIPOD## to switch to the grenade launcher.",
					--BO3 XR2
					["bm_xr2_sc_desc"] = "The XR-2 is a versatile rifle designed for the most dynamic of combat scenarios and features a unique #{risk}#3-round auto-burst## that provides an #{skill_color}#increased fire rate while on burst-fire mode.##\n\n#{skill_color}#Deals 25% of its damage through body armor.##",
					["bm_wp_xr2_handle_01_sc"] = "Full-Auto Bolt",
					["bm_xr2_handle_01_sc_desc"] = "Trade the auto-burst for #{skill_color}#full-auto## at the cost of #{important_1}#no burst fire rate increase.##",
					["bm_wp_xr2_handle_02_sc"] = "Rapid-Fire Bolt",
					["bm_xr2_handle_02_sc_desc"] = "Increases burst fire rate to #{skill_color}#950 RPM## at the cost of #{important_1}#lowered recoil mitigation during the burst.\n\nBurst delay and semi-auto fire rate are unaffected.##",
					--SIERRA .458
					["bm_w_sierra458_sc_desc"] = "Chains being the weapon-smith of the gang began development of a heavy-hitting yet high rate of fire alternative to the Tecci Tactical rifle.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies.##",
					["bm_w_sierra458_beo_desc"] = "Chains being the weapon-smith of the gang began development of a heavy-hitting yet high rate of fire alternative to the Tecci Tactical rifle.\n\n#{skill_color}#Can pierce body armor, enemies, shields and thin walls.##",
					["bm_wp_wpn_fps_snp_sierra458_m_bush_desc"] = "Switches .458 SOCOM rounds for #{stats_positive}#poison-laced .450 Bushmaster## rounds that #{stats_positive}#deal 30 damage/sec over 4 seconds and can stun enemies.##\n\n#{important_1}#Can no longer pierce multiple enemies.##",
					["bm_w_sierra458_ivy_desc"] = "Chains being the weapon-smith of the gang began development of a heavy-hitting yet high rate of fire alternative to the Tecci Tactical rifle.\n\n#{skill_color}#Deals 50% of its damage through body armor, can pierce thin walls## and #{stats_positive}#deals damage over time with poison rounds.##",
			
			--[[ SNIPERS ]]
				--MSR
				["bm_msr_sc_desc"] = "The choice sniper rifle for the US military. Good accuracy, handling, and even concealability makes this a good all purpose sniper rifle.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				--R700
				["bm_r700_sc_desc"] = "The predecessor to the Rattlesnake. Good accuracy and handling, even has better range than its younger brother. The downside? Crappy 5 round magazines.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				--QBU88
				["bm_qbu88_sc_desc"] = "Bullpup sniper platform with an Eastern Bloc inspiration. Like many, good for forcing your will on others.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				--Winchester 1874
				["bm_winchester1874_sc_desc"] = "The Gun That Won the West. Holy relic of firearms, but no means less deadly with its supply of potent .44-40 ammunition.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##\n\nCan be #{skill_color}#rapid-fired for an increased fire rate## at the cost of #{important_1}#more recoil and reduced effective range.##",	
				--TTI(TTY)
				["bm_tti_sc_desc"] = "One of Wick's personal firearms. It's said there's footage of him practicing 3-gun with this rifle somewhere online.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				--Icky Vicky
				--["bm_victor_sc_desc"] = "\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				--Scunt
				--["bm_scout_sc_desc"] = "\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				["bm_wp_scout_m_extended"] = "Standoff Speed Magazine",
				--AWP
				["bm_awp_sc_desc"] = "A sniper known for it's exceptional range and accuracy. Who would've thought the original models were built by three guys in a shed?\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",	
				["bm_wp_upg_bazooka"] = "Dragon Lore-less Exclusive Set",
				["bm_wp_upg_bazooka_desc"] = "High risk and high reward, this infamous rifle is recognizable by its signature report and one-shot, one-kill policy.\n\n#{skill_color}#Headshots deal 50% more damage to non-captain enemies.##\n#{skill_color}#Allows for piercing titan-shields.##",
				["bm_bazooka_sc_desc"] = "High risk and high reward, this infamous rifle is recognizable by its signature report and one-shot, one-kill policy.\n\n#{skill_color}#Headshots deal 50% more damage to non-captain enemies.##\n#{skill_color}#Can pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
				--WA2000
				["bm_wa2000_sc_desc"] = "Only a few hundred of these prestigious rifles were made; a sniper fitting for a top-tier hitman.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				--Rangerhitter
				["bm_sbl_sc_desc"] = "A 20th century lever action that offers a bigger slug of lead compared to the 19th century. Expect extra kick and extra dead pigs with .45-70 on your side.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##\n\nCan be #{skill_color}#rapid-fired for an increased fire rate## at the cost of #{important_1}#more recoil and reduced effective range.##",	
				--Contender G2
				["bm_contender_sc_desc"] = "",	
				--Model 70
				["bm_model70_sc_desc"] = "The Rifleman's Rifle. An early bolt action design made by the same designers of the Repeater 1874.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",			
				--SVD
				["bm_siltstone_sc_desc"] = "High powered semi-auto sniper rifle belonging to the AK family. Like most eastern bloc weaponry, its reputation is well earned.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				--Mosin--
				["bm_mosin_sc_desc"] = "When food is a luxury but you're still in need of a gun comes this cheap, classic bolt-action rifle.\n\nThis weapon reloads in clips of 5 bullets at a time and #{skill_color}#can pierce body armor, multiple enemies, shields and thin walls.##",
				["bm_wp_upg_a_tranq_mosin"] = "Tranquilizer Rounds",
				["bm_wp_upg_a_tranq_mosin_desc"] = "For true oblivion, #{item_stage_2}#The End.##\n\nFire #{stats_positive}#tranquilizer## rounds that #{skill_color}#deal 30 damage/sec over 6 seconds and can stun enemies.##\n\n#{important_1}#Can no longer pierce through enemies.##",
				["bm_mosin_tranq_desc"] = "When food is a luxury but you're still in need of a gun comes this cheap, classic bolt-action rifle.\n\nThis weapon reloads in clips of 5 bullets at a time,\n\n#{stats_positive}#deals damage over time with tranquilizer rounds## and #{skill_color}#can pierce body armor, shields and thin walls.##",
				--Desert Fox
				["bm_desertfox_sc_desc"] = "A compact bullpup sniper platform, used by Wick during his assault on a Russian mob safehouse.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",
				--R93
				["bm_r93_sc_desc"] = "German sniper rifle with a big bullet meant to stop big men. Sniper of choice among police and counter-terrorist paramilitary forces across the globe.\n\n#{skill_color}#Can pierce body armor, multiple enemies, shields and thin walls.##",			
				--Flintlock--
				["bm_bessy_sc_desc"] = "A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.\n\n#{skill_color}#Deals 100% more damage to special and elite enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
				--Thanatos--
				["bm_m95_sc_desc"] = "Anti-materiel rifle used to combat small vehicles. Using this on organic targets is probably a war crime.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
				--Custom Snipers
					--M107
					["bm_m107cq_sc_desc"] = "If the Thanatos wasn't up to speed, then the Mors will deliver what you want as a fine, red mist.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
					--M200
					["bm_m200_sc_desc"] = "For those wanting to perform some sweet 360 no-scope ladder-stall shots.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
					--S7
					["bm_w_srs99_s7_desc"] = "I see headshots in your future, Spartan.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",
					["bm_w_srs99_s7_flexfire_desc"] = "I see headshots in your future, Spartan.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields and thin walls.##",	
					["flexfire_desc"] = "#{important_1}#Can no longer pierce titan-grade shields.##",
					["oracle_scope"] = "Oracle TechLink Scope",
					["oracle_scope_desc"] = "Use to change the reticle of the default #{skill_color}#Smart-Link## scope.\n#{risk}#5x magnification.##",
					--SVD
					["bm_wp_wpn_fps_snp_svd_pso"] = "SV7 Scope",
					--Highly Modified CAR-4
					["bm_hmcar_sc_desc"] = "Before being phased out by law-enforcement, you managed to swipe a case full of these conversion kits.\n\nShoots #{stat_maxed}#titan-sniper rounds## capable of #{skill_color}#piercing multiple enemies, their body armor, shields and thin walls;## Alt-fire shoots a #{event_color}#full power sniper round## for #{skill_color}#twice the ammo and power## that also adds the abilty to #{skill_color}#pierce titan-shields.##",
					["bm_wp_hmcar_hd_kit"] = "32bit 8K HD Kit",
					["bm_wp_hmcar_hd_kit_desc"] = "Application has crashed: C++ exception\nCould not load texture because IDirect3D9::CreateTexture call failed.\nDirect3D could not allocate sufficient memory to complete the call.\n\n\n\n\n\n\n ",		
			
			--[[ SPECIALS ]]
				--Saw
				["bm_ap_saw_sc_desc"] = "#{skill_color}#Cuts through body armor.##",
				["bm_ap_saw_blade_sc_desc"] = "Sharpens the blade enough to #{skill_color}#cut through body armor.##",
				["bm_fast_motor_sc_desc"] = "Increases Rotations Per Minute by 15%.",
				["bm_slow_motor_sc_desc"] = "Decreases Rotations Per Minute by 15%.",
				--Light Crossbow		
				["bm_wp_avelyn"] = "Avelyn Kit",
				["bm_wp_avelyn_desc"] = "A #{skill_color}#repeating crossbow## kit.\nAllows for firing a volley of #{skill_color}#3## bolts with a single trigger pull.",
				["bm_wp_avelyn_override_desc"] = "An extremely rare rapid-firing crossbow.\nFires #{skill_color}#three## successive bolts by means of an elaborate mechanism.\n\n#{skill_color}#Can pierce body armor.##",
				--GL40		
				["bm_w_gre_m79_sc_desc"] = "A thump and a boom.\n\nPress #{skill_color}#$BTN_GADGET## to toggle the leaf sight; zeroed to #{skill_color}#30## meters.",
				--3GL
				["bm_ms3gl_sc_desc"] = "Fires custom 40mm rounds superposed in a single chamber. Uses electric primers to fire, allowing for rapid follow-ups in a compact package.\n\nAlt-fire #{skill_color}#fires a burst of 3 grenades.##",
				--PIGLET/M32
				["bm_m32_sc_desc"] = "Become a \"#{risk}#War Machine##\", show your enemies that no amount of love will protect them and those near them from this 6-shot rotary grenade launcher.",
				--China Puff
				["bm_w_china_sc_desc"] = "\"This really is a most horrid neighborhood!\"\n\nPress #{skill_color}#$BTN_GADGET## to toggle the leaf sight; zeroed to #{skill_color}#30## meters.",
				--COMMANDO 101/M202 FLASH
				["bm_ray_sc_desc"] = "Become the \"#{risk}#Grim Reaper##\" with this 4-shot #{heat_warm_color}#incendiary## rocket launcher.\n\nRockets leave behind a #{heat_warm_color}#pool of fire## and explosive damage dealt by this weapon #{skill_color}#instantly destroys turrets.##",
				
				
	})

	--[[ 
		WepNames Options
		1 = do nothing, use resmod default/in-universe names (i.e. Crosskill Operator, Bootleg)
		2 = same as 1, but no nicknames (i.e. Bootleg > SG 416c)
		3 = real names (i.e. SA 1911 Operator, HK 416c)
		4 = Vanilla names/use your own names
	]]
	if weapon_names then
		if weapon_names <= 2 then --Resmod names
			LocalizationManager:add_localized_strings({	

				--[[ PISTOLS ]]
					--Gecko Pistol
					["bm_w_maxim9"] = "Magnus 9",
					["bm_w_x_maxim9"] = "Akimbo Magnus 9s",
					--Igor (APS)
					["bm_w_stech"] = "Igor Automatik",
					["bm_w_x_stech"] = "Akimbo Igor Automatiks",
					--Chimano Compact
					["bm_wp_pis_g26"] = "Chimano 26 Compact",
					["bm_w_jowi"] = "Akimbo Chimano 26 Compacts",
					--Glock 18c
					["bm_w_glock_18c"] = "Chimano 18C",
					["bm_w_x_g18c"] = "Akimbo Chimano 18Cs",
					--CZ 75
					["bm_w_czech"] = "CR 92",
					["bm_w_x_czech"] = "Akimbo CR 92s",
					--PPK (Gruber)
					["bm_w_ppk"] = "Gruber Kurz",
					["bm_w_x_ppk"] = "Akimbo Gruber Kurzes",
					--M13
					["bm_w_legacy"] = "M13",
					["bm_w_x_legacy"] = "Akimbo M13s",	
					--Glock 17
					["bm_w_glock_17"] = "Chimano 88",
					["bm_w_x_g17"] = "Akimbo Chimano 88s",
					--Bernetti 9
					["bm_w_b92fs"] = "Bernetti 92",
					["bm_w_x_b92fs"] = "Akimbo Bernetti 92s",
					--White Streak
					["bm_w_pl14"] = "White Streak",
					["bm_w_x_pl14"] = "Akimbo White Streaks",
					--Holt 9mm
					["bm_w_holt"] = "Holt 9",
					["bm_w_x_holt"] = "Akimbo Holt 9s",
					--FMG-9
					["bm_w_fmg9"] = "Wasp DS-9",
					--93R
					["bm_w_beer"] = "Bernetti 93R",
					--Contractor Pistols 
					["bm_w_packrat"] = "Contractor M30L",
					["bm_w_x_packrat"] = "Akimbo Contractor M30Ls",
					--Breech (Luger) 
					["bm_w_breech"] = "Parabellum-08",
					--Chimano Custom
					["bm_w_g22c"] = "Chimano Custom",
					["bm_w_x_g22c"] = "Akimbo Chimano Customs",
					--Signature .40
					["bm_w_p226"] = "Signature .40",
					--LEO
					["bm_w_hs2000"] = "LEO-40",
					["bm_wp_hs2000_sl_long"] = "Elite Slide",
					--5/7 pistol
					["bm_w_lemming"] = "Acuto 5/7",
					--Baby Deagle--
					["bm_w_sparrow"] = "Sparrow 941",
					["bm_w_x_sparrow"] = "Spike & Vicious",
					--Crosskill
					["bm_w_colt_1911"] = "Crosskill Operator II",
					["bm_w_x_1911"] = "Mustang & Sally",
					["bm_wp_1911_m_big"] = "Casket Magazine",
					--Crosskill Chunky
					["bm_w_m1911"] = "Crosskill A1",
					["bm_w_x_m1911"] = "Price & MacTavish",
					--Crosskill Guard
					["bm_w_shrew"] = "Crosskill Guard",
					["bm_w_x_shrew"] = "Barry & Paul",
					--USP 
					["bm_w_usp"] = "Interceptor-45",
					["bm_w_x_usp"] = "Akimbo Interceptor-45s",
					["bm_wp_usp_m_big"] = "Casket Magazine",
					["bm_wp_pis_usp_b_match"] = "Freeman Slide",
					--Model 54 
					["bm_w_type54"] = "CC-33",
					["bm_w_x_type54"] = "Akimbo CC-33s",
					--Broomstick--
					["bm_w_c96"] = "Broomstick",
					["bm_wp_c96_nozzle"] = "BlasTech DL-44 Muzzle",
					--Sub2000
					["bm_w_sub2000"] = "Cavity .40",
					--Deagle
					["bm_w_deagle"] = "Deagle",
					["bm_w_x_deagle"] = "Akimbo Deagles",
					--Kahn .357
					["bm_w_korth"] = "Kahn .357",
					["bm_w_x_korth"] = "Akimbo Kahn .357s",
					--Matever 2006m
					["bm_w_mateba"] = "Matever 9mm", --:^)
					["bm_wp_2006m_b_short"] = "Tachikoma Barrel",	
					["bm_wp_2006m_b_medium"] = "Togusa Barrel",	
					["bm_wp_2006m_b_long"] = "Kusanagi Barrel",	
					["bm_w_x_2006m"] = "Akimbo Matevers",
					--Frenchman Model 87
					["bm_w_model3"] = "J&M Model 87",	
					["bm_w_x_model3"] = "Akimbo Model 87s",	
					--Raging bull
					["bm_w_raging_bull"] = "Bronco .44",	
					["bm_w_x_rage"] = "Akimbo Bronco .44s",
					--Castigo
					["bm_w_chinchilla"] = "Castigo .44",
					["bm_w_x_chinchilla"] = "Akimbo Castigo .44s",
					--RUS-12
					["bm_w_rsh12"] = "RUS-12",
					--SAA/Peacemaker
					["bm_w_peacemaker"] = "Peacemaker .45LC",
					--CUSTOM PISTOLS
						--Px4
						["bm_w_px4"] = "Bernetti Hx4 Canaan",
						--Browning Hi-Power
						["bm_w_hpb"] = "Hi-Power",
						--Browning Hi-Power (Mira)
						--["bm_w_hpb"] = "Hi-Power",
						--Walther P99
						["bm_w_p99"] = "Lakner G99",
						--Derringer
						["bm_w_derringer"] = "Derringer",
						--Automag .44
						["bm_w_amt"] = "Automag .44",
						--Colt Detective
						["bm_w_coltds"] = "Crosskill Investigator",
						--SIG P320
						["bm_w_papa320"] = "M19",
						["bm_wp_wpn_fps_pis_papa320_magazine_ext2"] = "32 Round Magazine",
				--[[ SMGs ]]
					--Kobus 90--
					["bm_w_p90"] = "Project-90",
					["bm_w_x_p90"] = "Akimbo Project-90s",
					["bm_wp_p90_b_ninja"] = "Ninja Barrel",
					["bm_wp_90_body_boxy"] = "OMNIA Assault Stock",
					--Spec Ops
					["bm_w_mp7"] = "SpecOps-7",
					--Tec-9
					["bm_w_tec9"] = "T3K Urban",
					["bm_w_x_tec9"] = "Akimbo T3K Urbans",
					--Heather
					["bm_w_sr2"] = "Heather-2M",
					["bm_w_x_sr2"] = "Akimbo Heather-2Ms",
					--CMP
					["bm_w_mp9"] = "CMP-9",
					--Miyaka
					["bm_w_pm9"] = "Miyaka 9 Special",
					--Micro Uzi
					["bm_w_baka"] = "Micro Uzi",
					["bm_w_x_baka"] = "Akimbo Micro Uzis",
					--Cobra/Skorpion
					["bm_w_scorpion"] = "Cobra",
					["bm_w_x_scorpion"] = "Akimbo Cobras",
					["bm_wp_scorpion_m_extended"] = "Dual Magazines",
					--Tatonka
					["bm_w_coal"] = "AK-19 Tatonka",
					--AK Gen
					["bm_w_vityaz"] = "AK-19-01 Tasunka",
					--Signature SMG
					["bm_w_shepheard"] = "FIK PC9",
					--Compact-5/MP5
					["bm_w_mp5"] = "Compact-5",	
					["bm_w_x_mp5"] = "Akimbo Compact-5s",
					["bm_wp_mp5_fg_mp5sd"] = "SPOOC Foregrip",
					--Swedish K
					["bm_w_m45"] = "Swedish K",
					--Pachett/Sterling
					["bm_w_sterling"] = "Patchette L2A1",
					["bm_wp_sterling_b_e11"] = "BlasTech E-11 Barrel",
					--Uzi
					["bm_w_uzi"] = "Uzi",
					--Chicago Typewriter
					["bm_w_m1928"] = "Chicago Typewriter",
					--Mark 10
					["bm_w_mac10"] = "Mark 10",
					["bm_w_x_mac10"] = "Akimbo Mark 10s",
					--MP40
					["bm_w_erma"] = "MP 40",
					--Jackal
					["bm_w_schakal"] = "Jackal",
					--Kross Vertex
					["bm_w_polymer"] = "Kross Vertex",
					--CUSTOM SMGs
						--AR57
						["bm_w_alpha57_prim"] = "FSS Hurricane",
						--LWRC
						["bm_w_smg45"] = "FT Striker .45",
						--Typhoon
						["bm_w_crysis3_typhoon"] = "CRYNET Typhoon",
				--[[ MGs ]]
					--Bootleg/HK416c
					["bm_w_tecci"] = "Bootlegger",
					["bm_wp_tecci_s_minicontra_alt"] = "SG Fixed Stock",
					--KSP/M249
					["bm_w_m249"] = "KSP-90",
					--ChainSAW
					["bm_w_kacchainsaw"] = "Campbell 74",
					--RPK
					["bm_w_rpk"] = "RPK",
					--Brenner 21/HK21
					["bm_w_hk21"] = "Brenner-21",
					--M60
					["bm_w_m60"] = "M60",
					--Ksp 58
					["bm_w_par"] = "KSP-58B",
					["bm_wp_par_b_short"] = "Comped Barrel",
					--Buzzsaw/Mg42
					["bm_w_mg42"] = "Buzzsaw-42",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "Versteckt-51B",
					--Microgun
					["bm_wp_wpn_fps_lmg_shuno_body_red"] = "Red Body",

				--[[ SHOTGUNS ]]
					--Grimm
					["bm_w_basset"] = "Grimm 12G",	
					--Saiga
					["bm_w_saiga"] = "IZHMA 12G",
					--AA12
					["bm_w_aa12"] = "Steakout 12G",
					--Spas12
					["bm_w_spas12"] = "Predator 12G",
					--Benelli
					["bm_w_benelli"] = "M1014 12G",
					--Argos III
					["bm_w_ultima"] = "Argos III 12G",
					--Street Sweeper
					["bm_w_striker"] = "Street Sweeper 12G",
					--Goliath
					["bm_w_rota"] = "Goliath 12G",
					--VD-12
					["bm_w_sko12"] = "VD-12G",
					["bm_w_x_sko12"] = "Akimbo VD-12s",
					--GSPS
					["bm_w_m37"] = "GSPS 12G",
					--Supernova
					["bm_w_supernova"] = "Deimos 12G",
					--Loco
					["bm_w_serbu"] = "Locomotive 12G",
					--Reinfeld 88
					["bm_w_m1897"] = "Repeater 1897 12G",
					--Mosconi 12g
					["bm_w_m590"] = "Mosconi Tactical 12G",
					--R870
					["bm_w_r870"] = "Reinfeld 880 12G",
					--KSG
					["bm_w_ksg"] = "Raven 12G",
					--Breaker 10g
					["bm_w_boot"] = "Breaker 10G",
					--Claire Angélique Florette du Bertrand
					["bm_w_coach"] = "Claire S/S 12G",
					--Mosconi
					["bm_w_huntsman"] = "Mosconi S/S 12G",
					--Judge
					["bm_w_judge"] = "The Judge .410",
					["bm_w_x_judge"] = "Judge & Jury", --really wish weaponlib's right_only worked w/ the Judges so that we could have the 'right' one be the reinforced frame. a real shame.
					--Joceline
					["bm_w_b682"] = "Joceline O/U 12G",	
					--Custom Shotguns
						--Doomstick
						["bm_w_quadbarrel"] = "Doomstick",
						--Widowmaker TX
						["bm_wp_wpn_fps_shot_wmtx_mag_ext"] = "Extended Magazine",
						["bm_wp_wpn_fps_upg_wmtx_gastube_burst"] = "Burst Fire System",
				--[[ ARs ]]
					--S552
					["bm_w_s552"] = "Commando 552",
					--M733/AMCAR
					["bm_w_amcar"] = "AM-CAR",
					--G36
					["bm_w_g36"] = "JP36",
					--VHS/Lion's Roar
					["bm_w_vhs"] = "Lion's Roar",
					["bm_wp_vhs_b_sniper"] = "Hyper Barrel",
					["bm_wp_vhs_b_silenced"] = "Bad Dragan Barrel",
					--Olympic/Para
					["bm_w_olympic"] = "Para-23",
					["bm_w_x_olympic"] = "Akimbo Para-23s",
					--TAR-21
					["bm_w_komodo"] = "Tempest-95", --it's modeled after the X95, not the 21
					--Famas
					["bm_w_famas"] = "Clarion 5.56",
					--M4/CAR-4
					["bm_w_m4"] = "CAR-4",
					["bm_wp_upg_ass_m4_b_beowulf"] = "Wolf Barrel",
					["bm_wp_upg_s_fixed"] = "CAR Fixed Stock",
					--AK5
					["bm_w_ak5"] = "Ak 5",
					--Union 5.56
					["bm_w_corgi"] = "Union 5.56",
					["bm_wp_corgi_b_short"] = "MSG Barrel",
					--UAR
					["bm_w_aug"] = "UAR A2",
					["bm_wp_upg_b_hbar"] = "Heavy Barrel",	
					--AK17
					["bm_w_ak12"] = "AK-17",
					--AK 5.45
					["bm_w_ak74"] = "AK 5.45",
					--CR 805
					["bm_w_hajk"] = "CR 805B",
					--AMR-16
					["bm_w_m16"] = "AMR-16",
					--Queen's Wrath
					["bm_w_l85a2"] = "Queen's Wrath",
					--AK 7.62
					["bm_w_akm"] = "AK 7.62",
					["bm_w_akm_gold"] = "Golden AK 7.62",
					["bm_wp_upg_ass_ak_b_zastava"] = "Long Barrel",
					--KETCHUPKNOB--
					--ASPIRING POKEMON TRAINER, ASH KETCHNOV--
					["bm_w_groza"] = "OB-14st Byk-1", --Hopefully less silly than its Ketchup name
					--"OB-14st" being an awful combo of "Oblast" (a word for region/zone/area, as well as literally having BLAST in the name) and the "14" in "OTs-14"
					--Although, a Russian word for "region/zone/area" followed up with a Polish word...
					--Eh, whatever
					--CHIKUBI
					["bm_w_tkb"] = "Rodion 3B",
					["bm_wp_tkb_m_bakelite"] = "Siberian 15x3 Magazine",
					--Krinkov
					["bm_w_akmsu"] = "Krinkov",
					--Akimbo Krinkov
					["bm_w_x_akmsu"] = "Akimbo Krinkovs",
					--CUSTOM ARs
						--QBZ-191
						["bm_w_pd3_qbz191"] = "Northwest B-9",
						--AN-94/92
						["bm_w_tilt"] = "KVK-99",
						--HK G36
						["bm_w_g36k"] = "JP36K",
						--SCAR-L
						["bm_w_scarl"] = "Eagle Light",
						--Valmet Rk.62
						["bm_w_rk62"] = "Velmer",
						--MW22 Honey Badger
						["bm_w_mcbravo"] = "Chimera",
						--AR-18
						["bm_w_ar18"] = "CAR-18",
				--[[ DMRs ]]
					--Little Friend
					["bm_w_contraband"] = "Bigger Friend 7.62",
					--FAL
					["bm_w_fal"] = "Falcon 58",
					--ASS VAL
					["bm_w_asval"] = "Valkyria",
					--Galil
					["bm_w_galil"] = "Gecko 7.62",
					--SCAR
					["bm_w_scar"] = "Eagle Heavy",
					--Galant--
					["bm_w_ching"] = "M1 Galant",
					--M308
					["bm_w_m14"] = "M308",
					--G3
					["bm_w_g3"] = "Gewehr-3",
					["bm_wp_g3_b_sniper"] = "Macro Barrel",
					["bm_wp_g3_b_short"] = "Micro Barrel",
					--KS12
					["bm_w_shak12"] = "KS-12 Urban",
					--HCAR
					["bm_w_hcar"] = "Akron HC",
					
					--Custom DMRs
						--MCX Spear
						["bm_w_mcx_spear"] = "FIK M7",
						["bm_w_ngsierra"] = "Amicus 277",
						--VSS
						["bm_w_vss"] = "Viktoriya",
						--G3 HK79
						["bm_w_g3hk79"] = "Gewehr-A3 w/ GL79",
						--BO3 XR2
						["bm_w_xr2"] = "XR-2",
						--SIERRA .458
						["bm_w_sierra458"] = "Sierra .458",
				--[[ SNIPERS ]]
					--MSR
					["bm_w_msr"] = "Rattlesnake",	
					--R700
					["bm_w_r700"] = "Reinfeld Model 700",	
					--QBU88
					["bm_w_qbu88"] = "Káng Arms X1",
					--Winchester 1874
					["bm_w_winchester1874"] = "Repeater 1874", --"Repeater" is the stand-in/fake name for the IRL manufacturer "Winchester"; I know "Eaton" exists from OTWD
					--TTI(TTY)
					["bm_w_tti"] = "Tecci Tactical .308",
					--Icky Vicky
					["bm_w_victor"] = "SA North Star",
					--Scunt
					["bm_w_scout"] = "Pronghorn",
					--AWP
					["bm_w_awp"] = "AIM 900F", --Dunno why Overkill didn't use the naming method used for OTWD; the model itself even uses OTWD's method by directly referencing "AIM" on the receiver
					--WA2000
					["bm_w_wa2000"] = "Lebensauger",
					--Rangerhitter
					["bm_w_sbl"] = "Rangehitter Mk. 2", --It's not a Beretta gun so "Rangehitter" is the stand-in/fake name for the IRL manufacturer "Marlin"
					--Contender G2
					["bm_w_contender"] = "Aran G2",
					--Model 70
					["bm_w_model70"] = "Platypus 70",
					--SVD
					["bm_w_siltstone"] = "Grom",
					--Mosin--
					["bm_w_mosin"] = "Nagant",
					--Desert Fox
					["bm_w_desertfox"] = "Desertfox",
					--R93
					["bm_w_r93"] = "R93",
					--Thanatos--
					["bm_w_m95"] = "Thanatos 95",
					--Custom Snipers
						--Guerilla
						["bm_w_sgs"] = "Guerilla 542",	
						--PD3 Lynx
						["bm_w_pd3_lynx"] = "HET-5 Red Fox",
						--AMR2
						["bm_w_amr2"] = "Northwest AM-2",
						--M107
						["bm_w_m107cq"] = "Thanatos 107",
						--M200
						["bm_w_m200"] = "TF 141",
						--Marlin 1894
						["bm_w_m1894"] = "Mare's Leg",
						--SPX Centerfire
						["bm_w_moss464spx"] = "Mosconi SPX",
						--Winchester 1894
						["bm_w_winchester1894"] = "Repeater 1894",
						--SVD
						["bm_w_svd"] = "SV7",
						["bm_wp_wpn_fps_snp_svd_pso"] = "SV7 Scope",
						--L115
						["bm_w_l115"] = "AIM 90M",
				--[[ LAUNCHERS & BOWS ]]
					--GL40		
					["bm_w_gre_m79"] = "GL-40",
					--3GL
					["bm_w_ms3gl"] = "Basilisk 3GL",
					--PIGLET/M32
					["bm_w_m32"] = "Piglet",
					--China Puff
					["bm_w_china"] = "China Puff",
					--Compact 40mm
					["bm_w_slap"] = "Compact 40mm",
					--Arbiter
					["bm_w_arbiter"] = "Arbiter",
					--RPG
					["bm_w_rpg7"] = "HRL-7",
					--COMMANDO 101/M202 FLASH
					["bm_w_ray"] = "Commando 101 FLASH",
				--[[ UNIVERSAL ATTACHMENTS ]]
					--MUZZLE DEVICES
					["bm_wp_upg_ns_ass_smg_stubby"] = "Stubby Flash Hider",
					--SIGHTS
					["bm_wpn_fps_upg_o_hamr"] = "Trigonom SCRW Scope",
			})
		end

		if weapon_names == 2 then --Resmod names (No nicknames)
			LocalizationManager:add_localized_strings({	

				["bm_w_pl14"] = "WS-14",
				["bm_w_x_pl14"] = "Akimbo WS-14s",
				["bm_w_g22c"] = "Chimano 22C",
				["bm_w_x_g22c"] = "Akimbo Chimano 22Cs",
				["bm_w_x_1911"] = "Akimbo Operator IIs",
				["bm_w_x_m1911"] = "Akimbo Crosskill A1s",
				["bm_w_x_sparrow"] = "Akimbo Sparrows",
				["bm_w_x_judge"] = "Akimbo Judges",
				["bm_w_scar"] = "VF-7S",
				["bm_w_scarl"] = "VF-6M",
				["bm_w_schakal"] = "AMP 45",
				["bm_w_tecci"] = "SG 416C",
				["bm_w_l85a2"] = "L-95",
				["bm_w_vhs"] = "HVH-2",
				["bm_w_contraband"] = "SG 417D"
	
			})
		elseif weapon_names == 3 then --DMCWO Reelnames
			LocalizationManager:add_localized_strings({	

				--[[PISTOLS]]
					--5/7
					["bm_w_lemming"] = "FN Five-seveN",
					--Gecko Pistol
					["bm_w_maxim9"] = "SilencerCo Maxim 9",
					["bm_w_x_maxim9"] = "Akimbo Maxim 9s",

					--Stryk 18
					["bm_w_glock_18c"] = "Glock 18C",
					["bm_w_x_g18c"] = "Akimbo Glock 18Cs",
					["bm_wp_g18c_co_comp_2"] = "SJC Compensator 9mm",
					--CZ
					["bm_w_czech"] = "CZ AccuShadow 2",
					["bm_w_x_czech"] = "Akimbo AccuShadow 2s",

					--APS
					["bm_w_stech"] = "Stechkin APS",
					["bm_w_x_stech"] = "Akimbo Stechkins",
					--Gruber
					["bm_w_ppk"] = "Walther PPK/S",
					["bm_wp_pis_ppk_g_laser"] = "Crimson Trace Laser Grip",
					["bm_wp_pis_ppk_b_long"] = "PPKS Slide",
					--Chimano 88
					["bm_w_glock_17"] = "Glock 17",
					["bm_w_x_g17"] = "Akimbo Glock 17s",
					--Glock 26
					["bm_wp_pis_g26"] = "Glock 26",
					["bm_w_jowi"] = "Akimbo Glock 26s",
					["bm_wp_g26_body_salient"] = "Stipled Frame",
					["bm_wp_g26_b_custom"] = "Brushed Slide",
					["bm_wp_g26_m_custom"] = "G26 Stipled Magazine",
					--Luger
					["bm_w_breech"] = "Luger P08",
					--Bernetti 9
					["bm_w_b92fs"] = "Beretta 92FS",
					["bm_w_x_b92fs"] = "Akimbo 92FSs",
					["bm_wp_beretta_co_co1"] = "SGS Compensator", --Original name was a reference to the movie "The Professional"
					["bm_wp_beretta_co_co2"] = "Competition Compensator", --Seems to actually be based off of the Shorty USA Beretta 92 Spring Gun, unsurprising considering some of the guns models 	were based off of airsoft counterparts
					["bm_wp_beretta_sl_brigadier"] = "Brigadier Elite Slide",
					["bm_wp_beretta_g_ergo"] = "Wood Ergo Grips",
					["bm_wp_beretta_m_extended"] = "30rnd 92FS Magazine",
					["bm_wp_beretta_g_engraved"] = "Engraved 92FS Grips",
					--PL14
					["bm_w_pl14"] = "Kalashnikov Concern PL-14 \"Lebedev\"",
					["bm_wp_pl14_m_extended"] = "17rnd PL-14 Magazine",
					["bm_wp_pl14_b_comp"] = "PL-14 Compensator",
					--Wick
					["bm_w_packrat"] = "H&K P30L",
					["bm_w_x_packrat"] = "Akimbo P30Ls",
					--Hudson
					["bm_w_holt"] = "Hudson H9",
					["bm_w_x_holt"] = "Akimbo H9s",
					--93R
					["bm_w_beer"] = "Beretta 93R",
					--M13
					["bm_w_legacy"] = "H&K P7M13",

					--LEO-40
					["bm_w_hs2000"] = "Springfield Armory XD(M)-40",
					["bm_wp_hs2000_m_extended"] = "22rnd XD(M)-40 Magazine",
					["bm_wp_hs2000_sl_custom"] = "Compensated Slide",
					["bm_wp_hs2000_sl_long"] = "Custom Slide",
					--Signature 40
					["bm_w_p226"] = "SIG P226R",
					["bm_w_x_p226"] = "Akimbo P226Rs",
					["bm_wp_p226_co_comp_2"] = "SJC Compensator .40",
					["bm_wp_p226_m_extended"] = "22rnd P226 Magazine",
					["bm_wp_p226_b_equinox"] = "Equinox Duo-Tone Slide",
					["bm_wp_p226_b_long"] = "Brushed Long Slide",
					["bm_wp_p226_co_comp_2"] = "SJC Compensator .40",
					--Chimano Custom
					["bm_w_g22c"] = "Glock 22C",
					["bm_w_x_g22c"] = "Akimbo Glock 22Cs",
					["bm_wp_g22c_b_long"] = "Glock 35 Compensated Slide",
					--Bang...
					["bm_w_sparrow"] = "IWI Jericho 941 RPL",
					["bm_w_x_sparrow"] = "Akimbo 941s",
					["bm_wp_sparrow_body_941"] = "IWI Jericho 941F Kit",
					["bm_wp_sparrow_g_cowboy"] = "Weighted Grip",
					["bm_wp_sparrow_g_cowboy_desc"] = "YOU'RE GONNA CARRY THAT WEIGHT.",
					
					--SUB2000
					["bm_w_sub2000"] = "Kel-Tec SUB-2000",
					["bm_sub2000_sc_desc"] = "One of the guns that has ever been made. Tiny pistol bullets hit a lot harder when coming out of a longer barrel and its folding capability makes for decent concealment.",
					["bm_wp_sub2000_fg_gen2"] = "Gen2 Handguard",
					["bm_wp_sub2000_fg_railed"] = "Red Lion R6 Handguard",
					["bm_wp_sub2000_fg_suppressed"] = "Quad Rail Handguard w/Suppressor",
					--C96
					["bm_w_c96"] = "Mauser C96",
					["bm_wp_c96_b_long"] = "Carbine Barrel",
					["bm_wp_c96_nozzle"] = "DL-44 Muzzle",
					["bm_wp_c96_sight"] = "Schmidt & Bender 1-8x24 PM Short Dot",
					["bm_wp_c96_m_extended"] = "20rnd C96 Magazine",
					--Crosskill
					["bm_w_colt_1911"] = "Springfield Armory 1911 Operator",
					["bm_w_x_1911"] = "Akimbo 1911 Operators",
					["bm_wp_1911_co_2"] = "TCII Compensator", --Not 100% but seems to be based off of it
					["bm_wp_1911_co_1"] = "Clark Heavy Pinmaster", --Not 100% but seems to be based off of it
					["bm_wp_1911_g_ergo"] = "Pachmayr 1911 Grip",
					["bm_wp_1911_g_bling"] = "Wood Grips",
					["bm_wp_1911_g_engraved"] = "Engraved 1911 Grips",
					["bm_wp_1911_b_long"] = "Compensated Long Slide",
					["bm_wp_1911_b_vented"] = "Compensated Two-Tone Slide",
					["bm_wp_1911_m_extended"] = "12rnd SA 1911 Magazine",
					--Crosskill Chunky
					["bm_w_m1911"] = "Colt 1911A1", --Not entirely but its the closest thing
					["bm_w_x_m1911"] = "Akimbo 1911A1s",
					--Crosskill Guard
					["bm_w_shrew"] = "Colt Defender",
					["bm_w_x_shrew"] = "Akimbo Defenders",
					--Interceptor
					["bm_w_usp"] = "H&K USP Tactical",
					["bm_w_x_usp"] = "Akimbo USP Tacticals",
					["bm_wp_usp_co_comp_2"] = "SJC Compensator .45",
					["bm_wp_pis_usp_b_expert"] = "USP Expert Slide",
					["bm_wp_pis_usp_b_match"] = "USP Match Slide",
					["bm_wp_pis_usp_m_extended"] = "20rnd USP Magazine",
					--Anubis
					["bm_w_socom"] = "H&K Mk.23",
					["bm_wp_wpn_fps_upg_fl_pis_socomlam"] = "Prototype Phase I LAM",
					["bm_w_x_socom"] = "Akimbo Mk.23s",
					--TT-33	
					["bm_w_type54"] = "Tokarev TT-33",
					["bm_w_x_type54"] = "Akimbo TT-33s",
					
					--Kahn .357
					["bm_w_korth"] = "Korth NXA",
					["bm_w_x_korth"] = "Akimbo Korth NXAs",
					--Mateba
					["bm_w_mateba"] = "Mateba 2006M",
					["bm_w_x_2006m"] = "Akimbo 2006Ms",
					--Frenchman Model 87
					["bm_w_model3"] = "S&W Model 3",	
					["bm_w_x_model3"] = "Akimbo Model 3s",	
					--Castigo
					["bm_w_chinchilla"] = "S&W Model 29",
					["bm_w_x_chinchilla"] = "Akimbo Model 29s",
					--Bronco
					["bm_w_raging_bull"] = "Taurus Raging Bull",
					["bm_w_x_rage"] = "Akimbo Raging Bulls",
					["bm_wp_pis_rage_extra"] = "Raging Bull Scope Mount",
					["bm_wp_rage_b_comp1"] = "S&W V-Compensator",
					["bm_wp_rage_b_short"] = "Snub Nose Barrel",
					["bm_wp_rage_b_comp2"] = "S&W Muzzle Compensator",
					["bm_wp_rage_b_long"] = "Long Barrel",
					--Deagle
					["bm_w_deagle"] = "MRI Desert Eagle Mark XIX", --"IS THAT A M16?"
					["bm_w_x_deagle"] = "Akimbo Desert Eagles",
					["bm_wp_deagle_co_short"] = "Desert Eagle Muzzle Brake", --Original name was a reference to the 1990s film "La Femme Nikita" only for the gun's appearance in it, otherwise this is based on the real "DE50MB" Deagle muzzle brake
					["bm_wp_deagle_co_long"] = "Custom Barrel Weight", --Attachment is a reference to the Boondock Saints
					["bm_wp_deagle_g_ergo"] = "Pachmayr Grip", --Doesn't exist but it's the same model from the 1911 but enlarged so w/e
					["bm_wp_deagle_g_bling"] = "Pearl Grips",
					["bm_wp_deagle_m_extended"] = "12rnd Desert Eagle Magazine",
					["bm_wp_deagle_b_long"] = "10\" Long Barrel",
					--SAA
					["bm_w_peacemaker"] = "Colt Single Action Army",
					["bm_wp_peacemaker_barrel_long"] = "12\" Barrel",
					["bm_wp_peacemaker_barrel_short"] = "5.5\" Barrel",
					["bm_wp_peacemaker_handle_bling"] = "Engraved SAA Grips",
					["bm_wp_peacemaker_rifle_stock"] = "Skeletal Stock",
					--RUS-12
					["bm_w_rsh12"] = "KPB RSh-12",
					--Shatter's Fury
					["bm_w_shatters_fury"] = "S&W Model 500",

					--MODS
					["bm_w_papa320"] = "SIG P320",
					["bm_w_coltds"] = "Colt Detective",
					["bm_w_amt"] = ".44 Auto Mag",
					["bm_w_p99"] = "Walther P99",
					["bm_w_hpb"] = "Browning Hi-Power",

				--[[SMGs]]
					--P90
					["bm_w_p90"] = "FN P90 TR",
					["bm_w_x_p90"] = "Akimbo P90s",
					["bm_p90_sc_desc"] = "A bullpup SMG and competitor to the MP7. Frequently commented on as looking like a futuristic space gun.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
					["bm_wp_p90_b_long"] = "PS90 Barrel",
					["bm_wp_p90_b_civilian"] = "Moerse Lekker Barrel Shroud",
					--MP7
					["bm_w_mp7"] = "H&K MP7A2", --PD2's version kinda existed before the real MP7A2 was a thing so there's still some MP7A1 bits on it but w/e
					["bm_mp7_sc_desc"] = "A lightweight SMG and competitor to the P90 SMG. Doesn't have an undermounted grenade launcher as some sources may lead you to believe.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 66% more damage to non-captain enemies.##",
					["bm_wp_mp7_b_suppressed"] = "B&T Rotex-II Suppressor",
					["bm_wp_mp7_s_long"] = "Extended Stock",
					["bm_wp_mp7_m_extended"] = "MP7 40rnd Magazine",
					--CMP
					["bm_w_mp9"] = "B&T TP9SF",
					["bm_w_x_mp9"] = "Akimbo TP9SFs",
					["bm_wp_mp9_m_extended"] = "30rnd TP9 Magazine",
					["bm_wp_mp9_s_skel"] = "Steyr TMP Fixed Stock",
					["bm_wp_mp9_b_suppressed"] = "B&T MP9 QD Suppressor",
					--Micro Uzi
					["bm_w_baka"] = "IWI Micro Uzi",
					["bm_w_x_baka"] = "Akimbo Micro Uzis",
					--T3K
					["bm_w_tec9"] = "Intratec TEC-9",
					["bm_wp_tec9_b_standard"] = "AB-10 Barrel",
					["bm_wp_tec9_ns_ext"] = "Pseudo Barrel Extension",
					["bm_wp_tec9_s_unfolded"] = "Interdynamic MP-9 Wire Stock",
					["bm_wp_tec9_m_extended"] = "50rnd TEC-9 Magazine",
					--Jacket's Piece
					["bm_w_cobray"] = "Cobray M11/9",
					["bm_wp_cobray_ns_barrelext"] = "MAC Barrel Extension",
					--SR-2M
					["bm_w_sr2"] = "TsNIITochMash SR-2M \"Veresk\"",
					["bm_w_x_sr2"] = "Akimbo SR-2Ms",
					["bm_sr2_sc_desc"] = "Utilizing a specialized 9×21mm round, the SR-2M is the Russian answer to the P90 and MP7 SMGs.\n\n#{skill_color}#Deals 75% of its damage through body armor and headshots deal 50% more damage to non-captain enemies.##",
					--Miyaka 9
					["bm_w_pm9"] = "Minebea PM-9",
					--FMG9
					["bm_w_fmg9"] = "Magpul FDC-9",
					["bm_wp_fmg9_grip_tape"] = "Grip Tape",
					["bm_wp_fmg9_stock_pad"] = "Rubbber Butt-Pad",

					--Cobra
					["bm_w_scorpion"] = "CZ vz. 61 Skorpion",
					["bm_w_x_scorpion"] = "Akimbo Skorpions",
					["bm_wp_scorpion_m_extended"] = "Skorpion Dual Magazines",
					["bm_wp_scorpion_b_suppressed"] = "Skorpion Suppressor",
					--MP5
					["bm_w_mp5"] = "H&K MP5A2",
					["bm_w_x_mp5"] = "Akimbo MP5A2s",
					["bm_mp5_sc_desc"] = "The little sister to the G3.\nFast-firing, accurate and easy to handle, what more could you want out of an SMG?",
					["bm_wp_mp5_fg_m5k"] = "MP5k Tri-Rail Kit",
					["bm_wp_mp5_fg_mp5a5"] = "MP5 Railed Handguard",
					["bm_wp_mp5_fg_mp5sd"] = "MP5SD Kit",
					["bm_wp_mp5_s_adjust"] = "H&K Retractable Stock",
					["bm_wp_mp5_s_ring"] = "No Stock",
					["bm_wp_mp5_s_folding"] = "Choate Folding Stock",
					["bm_wp_mp5_m_drum"] = "70rnd MP5 Drum",
					["bm_wp_mp5_m_straight"] = "30rnd MP5 40/10 Magazine",
					--MPX
					["bm_w_shepheard"] = "SIG MPX", 
					--Vityaz
					["bm_w_vityaz"] = "Kalashnikov Concern PP-19 Vityaz-SN",
					--Bizon
					["bm_w_coal"] = "Kalashnikov Concern PP-19 Bizon-2",

					--Uzi
					["bm_w_uzi"] = "IWI Uzi",
					["bm_w_x_uzi"] = "Akimbo Uzi",
					["bm_wp_uzi_s_solid"] = "Wooden Stock",
					["bm_wp_uzi_fg_rail"] = "FAB Defense Uzi Tri-Rail System",
					["bm_wp_uzi_b_suppressed"] = "Two-Stage Suppressor",
					--Pachette
					["bm_w_sterling"] = "Sterling L2A1",
					["bm_wp_sterling_b_suppressed"] = "L34A1 Barrel",
					["bm_wp_sterling_b_e11"] = "BlasTech E-11 Barrel",
					["bm_wp_sterling_m_short"] = "15rnd L2A1 Magazine",
					["bm_wp_sterling_m_long"] = "34rnd L2A1 Magazine",
					--
					["bm_w_mac10"] = "Ingram M10",
					["bm_w_x_mac10"] = "Akimbo M10s",
					["bm_wp_mac10_m_extended"] = "30rnd M10 Magazine",
					["bm_wp_mac10_body_ris"] = "MAC Rail System", --I'm getting nothing but airsoft results so generic name
					["bm_wp_mac10_s_skel"] = "Low Mount Skeleton Stock",
					--Thompson
					["bm_w_m1928"] = "Auto-Ordnance M1928",
					["bm_wp_m1928_b_short"] = "Short Barrel",
					["bm_wp_m1928_fg_discrete"] = "Polymer Foregrip",
					["bm_wp_m1928_g_discrete"] = "Polymer Pistol Grip",
					["bm_wp_m1928_s_discrete"] = "Polymer Stock",
					--MP 40
					["bm_w_erma"] = "Erma MP 40",
					--UMP
					["bm_w_schakal"] = "H&K UMP-45",
					["bm_wp_schakal_b_civil"] = "USC Barrel",
					["bm_wp_schakal_ns_silencer"] = "GemTech QD UMP Suppressor",
					["bm_wp_schakal_m_short"] = "15rnd UMP Magazine",
					["bm_wp_schakal_m_long"] = "45rnd UMP Magazine",
					--M45
					["bm_w_m45"] = "Carl Gustaf Kpist M/45",
					["bm_wp_smg_m45_m_extended"] = "50rnd M/45 Magazine",
					--Vector
					["bm_w_polymer"] = "KRISS Vector SMG",
					["bm_wp_polymer_barrel_precision"] = "CRB Barrel w/Shroud",
					["bm_wp_polymer_ns_silencer"] = "Defiance HPS 4GSK Suppressor",
	
				--[[MGs]]
					--416C
					["bm_w_tecci"] = "H&K HK416-C",
					["bm_wp_tecci_b_long"] = "Long Barrel",
					["bm_wp_tecci_ns_special"] = "JPE Recoil Eliminator Muzzle Brake",
					--Shuno what it is
					["bm_w_shuno"] = "Empty Shell XM556 Microgun",

					--SAW
					["bm_w_m249"] = "FN M249 Para",
					["bm_wp_m249_fg_mk46"] = "Mk 46 Handguard",
					["bm_wp_m249_s_solid"] = "M249 Fixed Stock",

					--ChainSAW
					["bm_w_kacchainsaw"] = "KAC ChainSAW",
					["bm_wp_kacchainsaw_barrel_short"] = "Short Barrel",
					["bm_wp_kacchainsaw_barrel_long"] = "Long Barrel",
					["bm_wp_kacchainsaw_mag_b"] = "100rnd Soft Ammo Pouch",
					["bm_wp_kacchainsaw_flamethrower"] = "Underbarrel Flamethrower",
					["bm_wp_kacchainsaw_sling"] = "ChainSAW Sling",

					--RPK
					["bm_w_rpk"] = "Kalashnikov Concern RPK",
					["bm_wp_rpk_fg_standard"] = "Polymer AK Handguard",
					["bm_wp_rpk_s_standard"] = "Polymer RPK Stock",
					["bm_wp_rpk_m_ban_sc"] = "45rnd Molot AK Magazine",

					--HK21
					["bm_w_hk21"] = "H&K HK21E",
					["bm_hk21_sc_desc"] = "The big-little sister to the G3. Comes with an increased fire rate for even greater suppressive abilties.",
					["bm_wp_hk21_fg_short"] = "Short HK21 Handguard",
					["bm_wp_hk21_g_ergo"] = "HK21 Ergo Grip",
					--MG42
					["bm_w_mg42"] = "Mauser Maschinengewehr 42",
					["bm_wp_mg42_b_mg34"] = "Maschinengewehr 34 Barrel",
					["bm_wp_mg42_b_vg38"] = "BlasTech DLT-19 Barrel",
					--Versteckt-51/HK51B
					["bm_w_hk51b"] = "Vollmer HK51-B",
					["bm_hk51b_sc_desc"] = "Aftermarket conversion of the HK21, shrinking this MG down to MP5 sizes and increasing its rate of fire even further.",
					["bm_wp_hk51b_fg_railed"] = "Tri-Rail Handguard",
					["bm_wp_hk51b_b_fluted"] = "Fluted Long Barrel",

					--M240
					["bm_w_par"] = "FN M240B",
					["bm_par_sc_desc"] = "A heavier sibling machinegun to the M249 typically mounted on vehicles. Trades mobility for an even bigger bullet.",
				
					["bm_wp_par_s_plastic"] = "M240B Stock",
					--M60
					["bm_w_m60"] = "Saco M60",
					["bm_wp_m60_fg_tactical"] = "MK43 RIS Handguard",
					["bm_wp_m60_fg_tropical"] = "Leaf Wrappings",
					["bm_wp_m60_fg_keymod"] = "Keymod Handguard",

					--M134
					["bm_w_m134"] = "General Electric M134",
					["bm_wp_m134_barrel_extreme"] = "Anti-Air Barrel",
					["bm_wp_m134_barrel_short"] = "Compact Barrel",

				--[[SHOTGUNS]]
					--Saiga
					["bm_w_basset"] = "Spike X1S Saiga",
					["bm_w_basset_m_extended"] = "10rnd AGP Arms Saiga Magazine",
					["bm_w_saiga"] = "Kalashnikov Concern Saiga-12K",
					["bm_wp_saiga_fg_lowerrail"] = "Ultimak AK Modular Rail Forend System",
					["bm_wp_saiga_m_20rnd"] = "20rnd MD Arms Saiga Drum",
					["bm_wp_saiga_fg_holy"] = "Fuglystick Rail System",
					--AA12
					["bm_w_aa12"] = "MPS Auto Assault-12 CQB",
					["bm_wp_aa12_barrel_long"] = "Standard AA-12 Barrel",
					["bm_wp_aa12_mag_drum"] = "20rnd AA-12 Drum",
					--Six12
					["bm_w_rota"] = "Crye Precision SIX12",
					--M1014
					["bm_w_benelli"] = "Benelli M4 Super 90",
					["bm_wp_ben_b_long"] = "Long M4 Barrel",
					["bm_wp_ben_b_short"] = "NFA M4 Barrel",
					["bm_wp_ben_s_collapsed"] = "Collapsed M4 Stock",
					["bm_wp_ben_fg_standard"] = "M4 Tactical Stock",
					--SPAS-12
					["bm_w_spas12"] = "Franchi SPAS-12",
					["bm_wp_spas12_b_long"] = "8rnd Tube",
					--Striker
					["bm_w_striker"] = "Sentinel Arms Striker",
					--VD-12
					["bm_w_sko12"] = "Standard Manufacturing SKO-12",
					--Argos III
					["bm_w_ultima"] = "Baikal MP-155 Ultima",

					--870
					["bm_w_r870"] = "Remington Model 870",
					["bm_wp_r870_m_extended"] = "2rnd Tube Extension",
					["bm_wp_r870_fg_wood"] = "Wooden Pump",
					["bm_wp_r870_s_folding"] = "No Stock",
					["bm_wp_r870_s_folding_ext"] = "Remington Wingmaster Folding Stock",
					["bm_wp_r870_s_folding"] = "Remington Wingmaster Folded Stock",
					["bm_wp_r870_s_nostock_big"] = "No Stock w/Full Length Rail",
					["bm_wp_r870_s_solid_big"] = "Fixed Stock w/Full Length Rail",
					--Loco
					["bm_w_serbu"] = "Short Remington Model 870",
					["bm_wp_shorty_m_extended_short"] = "1rnd Tube Extension",
					["bm_wp_r870_s_solid"] = "Fixed Stock",
					["bm_wp_serbu_s_solid_short"] = "Fixed Stock w/Rail",
					["bm_wp_serbu_s_nostock_short"] = "No Stock w/Rail",
					--KSG
					["bm_w_ksg"] = "Kel-Tec KSG",
					["bm_wp_ksg_b_long"] = "Long Barrel w/2x 8-Shot Tubes",
					["bm_wp_ksg_b_short"] = "Patrol Barrel w/2x 6-Shot Tubes",
					--Judge
					["bm_w_judge"] = "Taurus 4510PLYFS",
					["bm_w_x_judge"] = "Akimbo Judges",
					--M37
					["bm_w_m37"] = "Ithaca Model 37",
					--NO SHOTGUNS IN THE TRENCHES
					["bm_w_m1897"] = "Winchester Model 1897",
					--M590
					["bm_w_m590"] = "Mossberg 590",
					["bm_wp_m590_body_rail"] = "Black Aces Tactical Quad Rail",
					--Supernova
					["bm_w_supernova"] = "Benelli Supernova",
					["bm_wp_supernova_g_adapter"] = "Benelli AR-15 Stock Adapter",
					["bm_wp_supernova_g_raven"] = "ATI Raven Grip",
					["bm_wp_supernova_g_stakeout"] = "Dickinson XX3 Grip",
					["bm_wp_supernova_s_collapsed"] = "Collapsed Stock",
					["bm_wp_supernova_s_Raven"] = "ATI Raven Stock",

					--Mosconi
					["bm_w_huntsman"] = "Mosconi Coach Gun",
					["bm_wp_huntsman_b_short"] = "Sawn-Off Barrel",
					["bm_wp_huntsman_s_short"] = "Sawn-Off Stock",
					--725
					["bm_w_b682"] = "Beretta 682", --funni hybrid 682, naming it after its internal name anyways
					["bm_wp_b682_b_short"] = "Sawn-Off Barrel",
					["bm_wp_b682_s_short"] = "Sawn-Off Stock",
					["bm_wp_b682_s_ammopouch"] = "Ammo Pouch",
					--1887
					["bm_w_boot"] = "Winchester Model 1887",
					["bm_wp_boot_body_exotic"] = "Case Hardened 1887 Reciever",
					--Claire 12G
					["bm_w_coach"] = "Remington Model 1889",

				--[[ARs]]
					--FAMAS
					["bm_w_famas"] = "Nexter FAMAS F1",
					["bm_wp_famas_b_sniper"] = "G2 Sniper Barrel",
					["bm_wp_famas_b_short"] = "G2 Commando Barrel",
					["bm_wp_famas_g_retro"] = "G1 Pistol Grip",
					--VHS
					["bm_w_vhs"] = "HS Produkt VHS-2",
					["bm_wp_vhs_b_short"] = "Short Barrel",
					["bm_wp_vhs_b_sniper"] = "Sniper Barrel",
					["bm_wp_vhs_b_silenced"] = "Suppressed Barrel",
					--JP36
					["bm_w_g36"] = "H&K G36K",
					["bm_wp_g36_fg_c"] = "G36c Handguard",
					["bm_wp_g36_fg_ksk"] = "Knights Armament Co. RAS Handguard",
					["bm_wp_g36_s_kv"] = "G36KV Stock",
					["bm_wp_g36_s_sl8"] = "SL8 Stock",
					--S552
					["bm_w_s552"] = "SIG SG 552-2",
					["bm_wp_ass_s552_fg_standard_green"] = "OD Green Handguard",
					["bm_wp_ass_s552_g_standard_green"] = "OD Green Pistol Grip",
					["bm_wp_ass_s552_s_standard_green"] = "OD Green Stock",
					["bm_wp_ass_s552_fg_railed"] = "SIG Railed Handguard",
					["bm_wp_ass_s552_body_standard_black"] = "Black Receiver",
					--AMCAR
					["bm_w_amcar"] = "Colt M733 Commando",
					--BABBY AR
					["bm_w_olympic"] = "Olympic Arms K23B",
					["bm_w_x_olympic"] = "Akimbo K23Bs",

					--AUG
					["bm_w_aug"] = "Steyr AUG A2",
					["bm_wp_aug_fg_a3"] = "A3 Rail",
					["bm_wp_aug_body_f90"] = "Thales F90 Kit",
					--Boatgun
					["bm_w_corgi"] = "FN F2000 Tactical TR",
					--AK12
					["bm_w_ak12"] = "Kalashnikov Concern AK-12",
					--Ak5
					 ["bm_w_ak5"] = "Bofors Ak 5",
					 ["bm_wp_ak5_fg_ak5c"] = "Ak 5c Handguard",
					 ["bm_wp_ak5_fg_fnc"] = "FN FNC Handguard",
					 ["bm_wp_ak5_s_ak5b"] = "Ak 5b Stock",
					 ["bm_wp_ak5_s_ak5c"] = "Ak 5c Stock",
					--CAR-4
					["bm_w_m4"] = "Colt M4A1",
					--AK74
					["bm_w_ak74"] = "Kalashnikov Concern AKS-74",
					--805
					["bm_w_hajk"] = "CZ 805 BREN",
					["bm_wp_hajk_b_short"] = "A2 Barrel",
					--TAR-21
					["bm_w_komodo"] = "IWI X95",
					--OICW
					["bm_w_osipr"] = "XM29 OICW",

					--M16
					["bm_w_m16"] = "Colt M16A4",
					["bm_wp_m16_fg_railed"] = "Daniel Defense Lite Rail",
					["bm_wp_m16_fg_vietnam"] = "M16A1 Handguard",
					--["bm_wp_m16_s_solid"] = "M16 Stock",
					--L85
					["bm_w_l85a2"] = "BAE L85A2",
					["bm_wp_l85a2_b_long"] = "Long Barrel",
					["bm_wp_l85a2_b_short"] = "Short Barrel",
					["bm_wp_l85a2_g_worn"] = "Taped Pistol Grip",
					["bm_wp_l85a2_fg_short"] = "Daniel Defense L85 Quad Rail",
					--Krink
					["bm_w_akmsu"] = "AKMSU",
					["bm_w_x_akmsu"] = "Akimbo AKMSUs",
					["bm_wp_akmsu_fg_rail"] = "Samson K-Rail",
					--AKM
					["bm_w_akm"] = "Kalashnikov Concern AKMS",
					["bm_w_akm_gold"] = "Gold Plated AKMS",
					--Nipples
					["bm_w_tkb"] = "Tula Arms TKB-059",
					--Groza
					["bm_w_groza"] = "TsKIB SOO Groza-1",

				--[[DMRs]]
					--417
					["bm_w_contraband"] = "H&K HK417 w/ M203",
					["bm_m203_weapon_sc_desc_pc"] = "The big sister to Scarface's personal \"Little Friend\" M16.\n\n#{skill_color}#Deals 25% of its damage through body armor and can pierce enemies.##\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
					["bm_m203_weapon_sc_desc"] = "The big sister to Scarface's personal \"Little Friend\" M16.\n\n#{skill_color}#Deals 25% of its damage through body armor and can pierce enemies.##\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
						--VMP
						["bm_m203_vmp_sc_desc_pc"] = "A replica of Scarface's personal \"Little Friend\" M16.\n\nPressing #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
						["bm_m203_vmp_sc_desc"] = "A replica of Scarface's personal \"Little Friend\" M16.\n\nHolding #{skill_color}#$BTN_BIPOD## switches to the undermounted grenade launcher.",
				
					--SCAR
					["bm_w_scar"] = "FN Mk.17",
					["bm_wp_scar_fg_railext"] = "PWS SCAR Rail Extension",
					["bm_wp_scar_s_sniper"] = "Mk.20 Stock",
					--FAL
					["bm_w_fal"] = "FN FAL",
					["bm_wp_fal_body_standard"] = "DSA SA58 Handguard",
					["bm_wp_fal_fg_wood"] = "Wooden FAL Handguard",
					["bm_wp_fal_fg_04"] = "DSA Freefloat Handguard",
					["bm_wp_fal_fg_03"] = "IWI Romat Handguard",
					["bm_wp_fal_g_01"] = "Tapco FAL Pistol Grip",
					["bm_wp_fal_m_01"] = "20rnd FAL Magazine",
					["bm_wp_fal_s_01"] = "Sidefolding FAL Stock",
					["bm_wp_fal_s_03"] = "Magpul FAL PRS Stock",
					["bm_wp_upg_vintage_fal_sc"] = "20rnd Magazine",
					--Galil
					["bm_w_galil"] = "IWI Galil ARM",
					["bm_wp_galil_fg_sniper"] = "IWI Galatz Handguard",
					["bm_wp_galil_fg_sar"] = "IWI Galil SAR Handguard",
					["bm_wp_galil_fg_mar"] = "IWI Galil MAR Handguard",
					["bm_wp_galil_fg_fab"] = "FAB Defense VFR GA Handguard",
					["bm_wp_galil_g_sniper"] = "IWI Galatz Pistol Grip",
					["bm_wp_galil_s_sniper"] = "IWI Galatz Wooden Stock",
					["bm_wp_galil_s_skeletal"] = "IWI Galil MAR Stock",
					["bm_wp_galil_s_light"] = "IWI Galatz Skeleton Stock",
					["bm_wp_galil_s_fab"] = "FAB Defense MG-CP Cheek Pad",
					--AS VAL
					["bm_w_asval"] = "Tula Arms AS \"Val\"",
					["bm_wp_asval_b_proto"] = "Prototype Barrel",
					["bm_wp_asval_s_solid"] = "VSS Stock",

					--Raifu
					["bm_w_g3"] = "H&K G3A3",
					["bm_g3_sc_desc"] = "Acting as the big sister to the MP5 and HK21, this rifle's accuracy rivals that of snipers.\n\n#{skill_color}#Deals 50% of its damage through body armor and can pierce enemies and thin walls.##",
					["bm_wp_g3_b_short"] = "Short Barrel",
					["bm_wp_g3_b_sniper"] = "PSG-1 Barrel",
					["bm_wp_g3_fg_psg"] = "PSG-1 Handguard",
					["bm_wp_g3_fg_railed"] = "FAB Defense G3-RS Handguard",
					["bm_wp_g3_fg_retro"] = "Wooden Slimline Handguard",
					["bm_wp_g3_fg_retro_plastic"] = "Slimline Handguard",
					["bm_wp_g3_g_retro"] = "G3 Ergo Grip",
					["bm_wp_g3_g_sniper"] = "PSG-1 Wooden Pistol Grip",
					["bm_wp_g3_s_sniper"] = "PSG-1 Stock",
					--M308
					["bm_w_m14"] = "Springfield Armory M14 DMR",
					["bm_wp_m14_body_ebr"] = "Sage EBR Chassis",
					["bm_wp_m14_body_jae"] = "JAE 100 G3 Stock",
					["bm_wp_upg_o_m14_scopemount"] = "Sun Optics USA M14/M1A Scope Mount",
					--Shak12
					["bm_w_shak12"] = "Kalashnikov Concern ShAK-12",
					--HCAR
					["bm_w_hcar"] = "Ohio Ordnance HCAR",
					--GARAND
					["bm_w_ching"] = "Springfield Armory M1 Garand",
					["bm_wp_ching_fg_railed"] = "Amega Mini-Scout-Mount",
					--Custom DMRs
						--G3 HK79
						["bm_g3hk79_sc_desc_pc"] = "A variant of the G3 that comes equipped with an #{skill_color}#underbarrel grenade launcher## and #{skill_color}#deals 50% of its damage through body armor and can pierce enemies and thin walls.##\n\nPress #{skill_color}#$BTN_BIPOD## to switch to the grenade launcher.",

				--[[SNIPERS]]
					--Titty
					["bm_w_tti"] = "Taran Tactical TR-1 AR-10",
					--QBU88
					["bm_w_qbu88"] = "Norinco QBU-88",
					--Icky Vicky
					["bm_w_victor"] = "SAINT Victor AR-15",

					--R700
					["bm_w_r700"] = "Remington Model 700P",
					--Repeater
					["bm_w_winchester1874"] = "Winchester Model 1873",
					["bm_wp_winchester_b_long"] = "Long Barrel",
					["bm_wp_winchester_b_suppressed"] = "Suppressor",
					--MSR
					["bm_w_msr"] = "Remington MSR",
					["bm_wp_snp_msr_ns_suppressor"] = "AAC TiTAN-QD Suppressor",
					["bm_wp_msr_body_msr"] = "MSR Aluminum Stock & Receiver",
					--Scunt
					["bm_w_scout"] = "Steyr Scout",
					--AWP
					["bm_w_awp"] = "Accuracy International AW-F",
					["bm_wp_awp_stock_lightweight"] = "AT308 Stock",

					--Drako
					["bm_w_siltstone"] = "Kalashnikov Concern SVD",
					--WA2000
					["bm_w_wa2000"] = "Walther WA2000",
					["bm_wp_wa2000_g_walnut"] = "Walnut Furniture",
					["bm_wp_wa2000_g_stealth"] = "Black Furniture",
					["bm_wp_wa2000_g_light"] = "Lightweight Furniture",

					--SBL
					["bm_w_sbl"] = "Marlin Model 1895SBL",
					--G2
					["bm_w_contender"] = "Thompson Center G2 Contender",
					["bm_wp_contender_grip_m4"] = "Choate M4 Adapter Grip",
					--Moist Nugget
					["bm_w_mosin"] = "Mosin Nagant M91/30",
					["bm_wp_mosin_b_sniper"] = "Nagant Suppressor",
					["bm_wp_mosin_body_conceal"] = "Black Polymer Stock",
					--Model 70
					["bm_w_model70"] = "Winchester Model 70",
					--R93
					["bm_w_r93"] = "Blaser R93 Tactical 2",
					["bm_wp_r93_b_suppressed"] = "SilencerCo Harvester 338 Suppressor",
					["bm_wp_r93_body_wood"] = "Long Range Sporter 2 Stock",
					--SRS
					["bm_w_desertfox"] = "DTA Stealth Recon Scout",
					--Flintlock
					["bm_w_bessy"] = "Land Pattern Musket",

					--M95
					["bm_w_m95"] = "Barrett M95",
					["bm_wp_m95_b_barrel_long"] = "Long Barrel w/AW50F Muzzle Brake",
					--Custom Snipers
						--PD3 Lynx
						["bm_w_pd3_lynx"] = "SERO Gepard M6",
						--M107
						["bm_m107cq_sc_desc"] = "If the M95 wasn't up to speed, then the M107 will deliver what you want as a fine, red mist.\n\n#{skill_color}#Headshots deal 100% more damage to non-captain enemies.\nCan pierce multiple enemies, their body armor, shields, titan-shields and thin walls.##",

				--[[SPECIALS]]
					--GL40		
					["bm_w_gre_m79"] = "Springfield Armory M79",
					--3GL
					["bm_w_ms3gl"] = "Metal Storm 3GL",
					--PIGLET/M32
					["bm_w_m32"] = "Milkor MGL",
					--China Puff
					["bm_w_china"] = "NAWS China Lake",
					--Compact 40mm
					["bm_w_slap"] = "H&K M320",
					--Arbiter
					["bm_w_arbiter"] = "ATK XM25",
					--Wat is flash haow do u do it? haow 2 flash cartoonz? ADOEB FLASH... adoeb falsh... CS... 6.... a dobe.... a dobe
					["bm_w_ray"] = "Northrop M202 FLASH",
					--RPG
					["bm_w_rpg7"] = "Bazalt RPG-7",

					["bm_w_arblast"] = "Arbalest",
					["bm_w_frankish"] = "Frankish Bow",
					["bm_w_hunter"] = "Avalanche CB1-50 Pistol Grip Crossbow",
					["bm_w_elastic"] = "Hoyt Carbon Spyder ZT 30 Bow",
					["bm_wp_elastic_body_tactic"] = "Hoyt Ignite Riser",

				--Attachments

					--Gadgets
						["bm_wp_upg_fl_pis_tlr1"] = "Streamlight TLR-1 Flashlight",
						["bm_wp_upg_fl_pis_laser"] = "Aim Sports LH002 Laser Sight", 
						["bm_wp_upg_fl_x400v"] = "SureFire X400V-IRC Laser Light",
						["bm_wp_upg_fl_crimson"] = "Crimson Trace CMR-201 Laser Sight",
						["bm_wp_upg_fl_pis_m3x"] = "Insight Technology M3X Flashlight",
						["bm_wp_upg_fl_pis_perst"] = "ZenitCo Perst-4M Laser Sight",

						["bm_wp_upg_fl_ass_smg_sho_surefire"] = "SureFire Scout Flashlight",
						["bm_wp_upg_fl_ass_laser"] = "Offset Mount Laser Sight",
						["bm_wp_upg_fl_ass_smg_sho_peqbox"] = "Insight Technology AN/PEQ-5 Laser Sight",
						["bm_wp_upg_fl_ass_utg"] = "UTG P38 Laser Light",
						["bm_wp_upg_fl_ass_peq15"] = "Insight Technology AN/PEQ-15 Laser Light",
						["bm_wp_upg_fl_dbal_laser"] = "Steiner DBAL-PL Laser Sight",

					--Muzzle Devices
						["bm_wp_upg_ns_meatgrinder"] = "Standoff Muzzle Device",
						["bm_wp_upg_ns_typhoon"] = "Omega Defense Muzzle Brake", --Internal name implies it's the Beretta TYPHOON but it resembles Omega Defense's more.
						["bm_wp_upg_pis_ns_flash"] = "CCF Titanium Flash Suppressor",

						["bm_wp_upg_ns_pis_small"] = "Thompson Machine Poseidon Suppressor",
						["bm_wp_upg_ns_pis_medium"] = "GemTech SFN Suppressor", --Close enough... it's sectioned similarly enough for me to just name it this
						["bm_wp_upg_ns_pis_large"] = "SilencerCo Osprey Suppressor",
						["bm_wp_upg_ns_medium_gem"] = "GemTech Blackside Suppressor",
						["bm_wp_upg_ns_large_kac"] = "KAC MK.23 Suppressor",
						["bm_wp_upg_ns_pis_jungle"] = "FX-HND Suppressor",
						["bm_wp_upg_ns_pis_putnik"] = "RS Putnik Suppressor",
						["bm_wp_upg_ns_ass_filter"] = "Oil Filter",

						["bm_wp_upg_ns_ass_smg_small"] = "GemTech HALO Suppressor", --not 100% but I can't find any other suppressor that is similar to this one's two-piece construction and the ability to wrap around an A2 style muzzle brake
						["bm_wp_upg_ns_ass_smg_medium"] = "Small Arms Industries M80 Suppressor",
						["bm_wp_upg_ns_ass_smg_large"] = "GOV MOD 1 Suppressor", --Couldn't find an IRL equivalent, name is just what it says on the tin, literally
						["bm_wp_upg_ak_ns_tgp"] = "TGP-A Suppressor",
						["bm_wp_victor_ns_omega"] = "SilencerCo Omega 36M Suppressor",
						["bm_wp_kacchainsaw_suppressor"] = "KAC QDSS NT4 Suppressor",
	
						["bm_wp_ultima_ns_comp"] = "Hi-Tech Howitzer70 Muzzle Brake",
						["bm_wp_upg_ns_shot_shark"] = "Tromix Shark Breaching Brake",
						["bm_wp_upg_shot_ns_king"] = "King Armory KA-1212 Breaching Brake",
						["bm_wp_upg_ns_shot_thick"] = "Shotgun Suppressor",
						["bm_wp_upg_ns_sho_salvo_large"] = "SilencerCo Salvo 12 Suppressor",

						["bm_wp_upg_ns_ass_smg_stubby"] = "VFC BM4 Flash Hider", --airsoft part AFAIK, lol (VFC Baby M4)
						["bm_wp_upg_ns_ass_smg_tank"] = "G&P BM Compensator", --airsoft part AFAIK, lol (G&P Baby Monster) also the little "sight" post on it is actually for an AR15 gas tube, lmao
						["bm_wp_upg_ns_ass_smg_firepig"] = "Noveske KX3 Compensator",
						["bm_wp_upg_ass_ns_jprifles"] = "JPE Bennie Cooley Muzzle Brake",
						["bm_wp_upg_ass_ns_linear"] = "KIES Blast Master Linear Compensator",
						["bm_wp_upg_ass_ns_surefire"] = "SureFire MBK Muzzle Brake",
						["bm_wp_ns_battle"] = "Battlecomp 2.0 Compensator",
						["bm_wp_ak_upg_ns_zenitco"] = "ZenitCo DTK-1 Compensator",
						["bm_wp_upg_ns_ass_smg_v6"] = "Kel-Tec V6 Compensator",
						["bm_wp_kacchainsaw_muzzle"] = "KAC QDC MAMS Muzzle Brake",
						["bm_wp_hk51b_ns_jcomp"] = "JCOMP Gen2 Compensator",
						["bm_wp_awp_ns_muzzle"] = "Accuracy International Muzzle Brake",


					--Glock Parts
						["bm_wp_g18c_m_mag_33rnd"] = "Extended Glock Magazine",
						["bm_wp_g18c_g_ergo"] = "Hogue Handall Grip Sleeve",
						["bm_wp_pis_g_laser"] = "Crimson Trace Laser Grip",
						["bm_wp_pis_g_beavertail"] = "Beavertail Grip Extension",

					--AK parts
						["bm_wp_upg_ak_fg_krebs"] = "Krebs UFM Keymod System Handguard",
						["bm_wp_upg_ak_fg_trax"] = "Strike Industries TRAX Handguard",
						["bm_wp_upg_ak_g_rk3"] = "ZenitCo PK-3 Pistol Grip",
						["bm_wp_upg_ak_fg_zenit"] = "ZenitCo Handguard",
						["bm_wp_upg_o_ak_scopemount"] = "K-VAR KV-04S Optic Mount",
						["bm_wp_upg_ak_m_uspalm"] = "30rnd US PALM AK30 Magazine",
						["bm_wp_upg_ns_ass_pbs1"] = "PBS-1 Suppressor",
						["bm_wp_upg_ass_ak_b_zastava"] = "Zastava M76 Barrel",
						["bm_wp_upg_ak_b_draco"] = "Draco Pistol Barrel",
						["bm_wp_upg_ak_b_ak105"] = "AK-105 Barrel",
						["bm_wp_upg_ak_ns_jmac"] = "JMac Customs MTC-1",
						["bm_wp_upg_ak_m_quad"] = "60rnd KC Magazine",
						["bm_wp_ak_m_drum"] = "75rnd AK Drum",
						["bm_wp_ak_fg_combo2"] = "Ultimak AK Optic Mount",
						["bm_wp_ak_fg_combo3"] = "Ultimak AK Modular Rail Forend System",
						["bm_wp_upg_ak_fg_tapco"] = "Tapco Intrafuse Handguard",
						["bm_wp_upg_fg_midwest"] = "Midwest Industries Quad Rail",
						["bm_wp_upg_ak_g_hgrip"] = "Hogue OverMolded AK Pistol Grip",
						["bm_wp_upg_ak_g_pgrip"] = "US PALM Enhanced Pistol Grip",
						["bm_wp_ak_s_folding"] = "Underfolding AK Stock",
						["bm_wp_ak_s_skfoldable"] = "Sidefolding AK Stock",
						["bm_wp_ak_s_psl"] = "PSL Thumbhole Stock",
						["bm_wp_ak_upper_zenitco"] = "ZenitCo B-33 Dust Cover",
						["bm_wp_ak_upg_fg_zenitco"] = "ZenitCo Sport-1 Kit",
						["bm_wp_ak_upg_dh_zenitco"] = "ZenitCo RP-5 Charging Handle",
						["wpn_fps_upg_ak_g_gradus"] = "FAB Defense Gradus Ergo Grip",
						["wpn_fps_upg_ak_g_edg"] = "Evolution Defense Textured Grip",
						["wpn_fps_upg_ak_g_rk9"] = "ZenitCo RK-9 Grip",
						["bm_wp_ak_upg_s_zenitco"] = "ZenitCo PT-1 Telescopic Stock",

					--Sights
						["bm_wp_upg_o_marksmansight_rear_desc"] = "Meprolight Tru-Dot Adjustable Sight Set",
						["bm_wp_upg_o_rmr"] = "Trijicon RMR Reflex Sight",
	
						["bm_wp_upg_o_docter"] = "IRONDOT w/Docter Sight II Plus Reflex Sight",
						["bm_wp_upg_o_reflex"] = "Reflex Sight",
						["bm_wp_upg_o_cmore"] = "C-More Railway Reflex Sight",
						["bm_wp_upg_o_rx01"] = "Trijicon RX01 Reflex Sight",
						["bm_wp_upg_o_rx30"] = "Trijicon RX30 Reflex Sight",	
	
						["bm_wp_upg_o_cs"] = "Aimpoint CS Red Dot Sight",
						["bm_wp_upg_o_aimpoint"] = "Aimpoint PRO Red Dot Sight",
						["bm_wp_upg_o_t1micro"] = "Aimpoint Micro T-1 Red Dot Sight",
						["bm_wp_upg_o_tf90"] = "Tech Force TF90 Red Dot Sight",
	
						["bm_wp_upg_o_fc1"] = "DI Optical FC1 Prismatic Red Dot Sight",
						["bm_wp_upg_o_eotech"] = "EOTech 553 Holographic Sight",
						["bm_wp_upg_o_eotech_xps"] = "EOTech EXPS3 Holographic Sight",
						["bm_wp_upg_o_uh"] = "AMG UH-1 Holographic Sight",
	
						["bm_wp_upg_o_specter"] = "ELCAN Specter DR 1-4x Scope",
						["bm_wp_upg_o_acog"] = "Trijicon ACOG Scope",
						["bm_wp_upg_o_poe"] = "BelOMO PO4x24P Scope",
						["bm_wp_upg_o_bmg"] = "Trijicon 6x48 Scope",

						["bm_wp_upg_o_spot"] = "NcStar ADO 3x42 Scope w/Rangefinder",

						["bm_wp_upg_o_atibal"] = "Atibal MROC 3x32 Scope",
						["bm_wpn_fps_upg_o_hamr"] = "Leupold Mk. 4 HAMR 4x24 Scope",
	
						--"Schmidt & Bender 1-8x24 PM Short Dot"
						["bm_wp_upg_o_leupold"] = "Leupold Mark 4 LR/T M1 w/BORS",
						["bm_wp_upg_o_box"] = "Pulsar Digisight LRF N960 NV Scope",
	
						["bm_wpn_fps_upg_o_45iron"] = "XS Sights Angled Sights",
						["bm_wpn_fps_upg_o_45rds"] = "Leupold Deltapoint Pro Angled RDS",
						["bm_wpn_fps_upg_o_45rds_v2"] = "Aimpoint Micro T-1 Red Dot Sight",
	
						["bm_wpn_fps_upg_o_xpsg33_magnifier"] = "Aimpoint 3XMag Magnifier",
						["bm_wpn_fps_upg_o_sig"] = "SIG Juliet3 Magnifier",
	
						["bm_wp_upg_o_mbus_rear"] = "Magpul MBUS Back-up Sights",

					--Vertical Grips
						["bm_wp_upg_vg_tac"] = "Knights Armament Co. VFG",
						["bm_wp_upg_vg_stubby"] = "Tango Down QD Stubby VFG",
						["bm_wp_upg_vg_afg"] = "Magpul AFG 2",

					--STANAG compatible mags
						["bm_wp_upg_vintage_sc"] = "20rnd STANAG Magazine",
						["bm_wp_m4_m_pmag"] = "30rnd Magpul PMAG GEN1 Magazine",
						["bm_wp_l85a2_m_emag"] = "30rnd Magpul EMAG Magazine",
						["bm_wp_upg_m4_m_quad"] = "60rnd SureFire Magazine",
						["bm_wp_m4_m_drum"] = "100rnd Beta-C Dual Drum",
						["bm_wp_upg_m4_m_l5"] = "30rnd Lancer Systems L5 AW Magazine",
						["bm_wp_m4_uupg_m_strike"] = "33rnd Strike Industries Magazine",
						["bm_wp_m4_m_quick"] = "Magpul Magazine Assist",

					--AR15 parts
						["bm_wp_m4_uupg_b_sd"] = "Suppressed Barrel",
						["bm_wp_upg_ass_m4_b_beowulf"] = "Heavy Barrel",

						["bm_wp_m4_upper_reciever_edge"] = "VLTOR Upper Receiver",
						["bm_wp_upg_ass_m4_upper_reciever_ballos"] = "2A-Arm BALIOS Upper Receiver",
						["bm_wp_upg_ass_m4_upper_reciever_core"] = "CORE15 Upper Receiver",
						["bm_wp_upg_ass_m4_lower_reciever_core"] = "CORE15 Lower Receiver",
						["bm_wp_m4_upper_radian"] = "Radian Model 1 Upper Receiver",
						["bm_wp_m4_lower_radian"] = "Radian A-DAC 15 Lower Receiver",

						["bm_wp_m4_uupg_fg_radian"] = "Radian Model 1 Handguard",
						["bm_wp_upg_fg_jp"] = "JPE Modular Handguard",
						["bm_wp_m4_uupg_fg_lr300"] = "LR300 Handguard",
						["bm_wp_upg_fg_smr"] = "Geissele Super Modular Rail",
						["bm_wp_upg_smg_olympic_fg_lr300"] = "Short LR300 Handguard",
						["bm_wp_upg_ass_m16_fg_stag"] = "Stag Arms Model 8T Handguard",
						["bm_wp_upg_ass_m4_fg_moe"] = "Magpul MOE SL Handguard",
						["bm_wp_upg_ass_m4_fg_lvoa"] = "War Sport LVOA Handguard",

						["bm_wp_m4_s_standard"] = "Bushmaster LE Stock",
						["bm_wp_m4_s_pts"] = "Magpul PTS Stock",
						["bm_wp_m4_uupg_s_fold"] = "LR300 Folding Stock",
						["bm_wp_upg_m4_s_crane"] = "NSWC Crane Stock",
						["bm_wp_upg_m4_s_mk46"] = "NSWC Crane Stock w/Cheek Pad",
						["bm_wp_upg_m4_s_ubr"] = "Magpul UBR Stock",
						["bm_wp_tti_s_vltor"] = "VLTOR E-MOD Stock",
						["bm_wp_victor_s_mod0"] = "BCM MOD 0 Stock",
						["bm_wp_sko12_stock"] = "Standard Mfg AR Stock",
						["bm_wp_m4_uupg_s_zulu"] = "ODIN Works Zulu 2.0 Stock",
						["bm_wp_olympic_s_short"] = "Rock River Arms Pistol Buffer Tube",

						["bm_wp_m4_g_ergo"] = "Command Arms UPG16 Pistol Grip",
						["bm_wp_m4_g_sniper"] = "PSG Style Pistol Grip",
						["bm_wp_upg_m4_g_hgrip"] = "Houge Rubber Ergo Grip",
						["bm_wp_upg_m4_g_mgrip"] = "Magpul MOE-K Pistol Grip",
						["bm_wp_tti_g_grippy"] = "Houge OverMolded Grip",
						["bm_wp_victor_g_mod3"] = "BCM MOD 3 Grip",
						["bm_wp_sko12_grip"] = "Standard Mfg AR Grip",
						["bm_wp_upg_g_m4_surgeon"] = "Tactical Dynamics Skeletonized Pistol Grip",
						["bm_wp_m4_g_billet"] = "JL Billet AR Grip",

					["bm_wp_upg_lmg_lionbipod"] = "Bipod",

				--[[MELEE]]
					["bm_melee_kabar"] = "USMC KA-BAR",
					["bm_melee_kampfmesser"] = "KM 2000",
					["bm_melee_gerber"] = "Gerber DMF Folder",
					["bm_melee_tomahawk"] = "Gerber Downrange Tomahawk",
					["bm_melee_becker"] = "KA-BAR Becker Tac Tool",
					["bm_melee_baton"] = "ASP Friction Loc Baton",
					["bm_melee_shovel"] = "K.L.A.S.",
					["bm_melee_baseballbat"] = "\"Lucille\"",
					["bm_melee_bayonet"] = "AKM Type II Bayonet",
					["bm_melee_bullseye"] = "Smith & Wesson Bullseye Hatchet",	
					["bm_melee_x46"] = "Robson Knives X46 Utility Survival Knife",
					["bm_melee_dingdong"] = "Gerber Ding Dong Breaching Tool",
					["bm_melee_cleaver"] = "Cleaver",
					["bm_melee_kabar_tanto"] = "KA-BAR Tanto",
					["bm_melee_chef"] = "Chef Knife",
					["bm_melee_fairbair"] = "Fairbairn-Sykes Fighting Knife",
					["bm_melee_model24"] = "Model 24 Stielhandgranate",
					["bm_melee_hammer"] = "Jacket's Hammer",
					["bm_melee_meat_cleaver"] = "Dragan's Cleaver",
					["bm_melee_poker"] = "Firewood Poker",
					["bm_melee_tenderizer"] = "Meat Tenderizer",
					["bm_melee_fork"] = "BBQ Fork",
					["bm_melee_mining_pick"] = "Pickaxe",
					["bm_melee_bowie"] = "Bowie Knife",
					["bm_melee_branding_iron"] = "Branding Iron",
					["bm_melee_oldbaton"] = "Nightstick",
					["bm_melee_detector"] = "Garrett Handheld Metal Detector",
					["bm_melee_taser"] = "ZAP Stun Baton",
					["bm_melee_cqc"] = "Kunai",
					["bm_melee_twins"] = "Sais",
					["bm_melee_tiger"] = "Tekko-Kagi",
					["bm_melee_pugio"] = "Extrema Ratio Pugio SE",
					["bm_melee_gator"] = "Gerber Gator Machete Pro",
					["bm_melee_scoutknife"] = "Morakniv Classic Scout 39",
					["bm_melee_shawn"] = "Antique Sheep Shears",
					["bm_melee_stick"] = "Shepherd's Crook",
					["bm_melee_nin"] = "Paslode IM90i Nailgun",
					["bm_melee_ballistic"] = "Ballistic Knives",
					["bm_melee_wing"] = "Benchmade Model 42 Balisong",
					["bm_melee_cs"] = "Homelite Super 2 Chainsaw",
					["bm_melee_brick"] = "Motorola DynaTAC 8000X",
					["bm_melee_sword"] = "Pencil",
					["bm_melee_oxide"] = "UVSR Taiga-1",
					["bm_melee_selfie"] = "PolarPro PowerPole GoPro Extension",
					["bm_melee_twins"] = "Shureido Sai",

				--[[THROWABLES]]
					["bm_grenade_frag"] = "M67 Fragmentation Grenade",
					["bm_grenade_frag_com"] = "M67 Fragmentation Grenade - OVERKILL Model",
					["bm_wpn_prj_hur"] = "Kit Rae Aircobra Throwing Axe",
					["bm_wpn_prj_target"] = "Blazing Arrow Ninja Throwing Knife",
			})
		end
	end	

		local twirl = math.rand(1)
		local shalashaska = 0.06
		if Month == "4" and Day == "1" then
			shalashaska = 1
		end
		if bobcat or not easterless and twirl <= shalashaska then
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
				["bm_menu_ro_grip"] = "Revolver Ocelot",
	
				["bm_m134_sc_desc"] = "CRYPTIC METAPHOR...",
				["bm_wp_upg_suppressor_boss"] = "\"CRAB BATTLE!!!\"\n\n#{skill_color}#Silences## your weapon and #{risk}#reduces the chance of enemies evading your aim.##"

			})
		end

		local cute = math.rand(1)
		local funny = 0.02
		if Month == "4" and Day == "1" then
			funny = 1
		end
		if eggplant or not easterless and cute <= funny then
			LocalizationManager:add_localized_strings({	
			--It's an "Upotte!!" reference
			--SEISHOU ACADEMY
				--MIDDLE SCHOOLERS
					["bm_w_m16"] = "Ichiroku",
						["bm_m16_sc_desc"] = "\"I won't lose!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nThe energetic and foul-mouthed figurehead of the school.",
					["bm_w_m4"] = "Em-Four",
						["bm_m4_sc_desc"] = "\"Don't underestimate a service rifle!\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nVice-president of the middleschool student council.",
					["bm_w_aug"] = "AUG",
						["bm_aug_sc_desc"] = "#{stats_negative}#\"RUN AWAY! PLEAD FOR YOUR LIFE!\"##\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nPresident of the middleschool student council.",
					["bm_wp_ak5_fg_fnc"] = "Funco Kit",
						["bm_wp_ak5_fg_fnc_desc"] = "\"To respond to its master's wishes is a tool's joy.\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nGives off a heavy \"main protagonist\" aura.",
					["bm_w_s552"] = "Shigu",
						["bm_s552_sc_desc"] = "\"Next shot, I'll take your ear off, bitch.\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nAn honor student from a wealthy family who excels in both sports and studies.",
					["bm_w_l85a2"] = "Eru",
						["bm_l85a2_sc_desc"] = "\"...\"\n\nA middleschooler attending #{stats_positive}#Seishou Academy.##\nShy and clumsy, she has an unreliable nature and the habit of breaking a lot.",
					["bm_w_rk62"] = "Sako",
						["bm_rk62_sc_desc"] = "\"#{stat_maxed}#What wonderful squeals!## You sound like you're about to #{stats_negative}#die!##\"\n\nA transfer student attending #{stats_positive}#Seishou Academy.##\nAn elf-eared sadist with a drive to be the \"alpha\" of any school she attends. Desires Funco.",
	
				--HIGH SCHOOLERS
					["bm_w_fal"] = "Faru",
						["bm_fal_sc_desc"] = "\"Your big sis arrived-!\"\n\nFunco's older sister.\nNot to be confused with Funco's other sister, L1A1.",
					["bm_w_m14"] = "Ichiyon",
						["bm_m14_sc_desc"] = "\"What are those westerners doin' copying AKs!? Buncha traitors!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nEasy-going and chalk-full of puns. Currently going through a fashion-sense crisis.",
					["bm_w_g3"] = "Jiisuri",
						["bm_g3_sc_desc"] = "\"Let's settle this!\"\n\nA highschooler attending #{stats_positive}#Seishou Academy.##\nElegant but a bit of a klutz. The eldest of her many sisters and DMC's #{stat_maxed}#raifu.##",
						["bm_menu_jiisuri_stock"] = "Pantyhose",

				--ELEMENTARY
					["bm_w_mp5"] = "Empi",
						["bm_mp5_sc_desc"] = "\"If that's your hobby...\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nOne of Jiisuri's many younger siblings and the student council president of the elementary division.",
					["bm_w_uzi"] = "Uzi",
						["bm_uzi_sc_desc"] = "\"Eat this!\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nThe former self-declared leader of the elementary division, pushed out of the position by Empi when she arrived.",
					["bm_w_mac10"] = "Ram",
						["bm_mac10_sc_desc"] = "\"INGRAM!\"\n\nAn elementary schooler attending #{stats_positive}#Seishou Academy.##\nA machinegun with words. Also rather top-heavy.",
		
				--FACULTY
					["bm_w_erma"] = "Erma-sensei",
						["bm_erma_sc_desc"] = "\"Come in! Come in!\"\n\nAn elementary school dorm mom working at #{stats_positive}#Seishou Academy.##\nThe SMGs love her.",
					["bm_w_m1928"] = "Thompson-sensei",
						["bm_m1928_sc_desc"] = "\"It's common sense!\"\n\nAn elementary school teacher working at #{stats_positive}#Seishou Academy.##\nSpeaks with accented Japanese. A former member of the FBI.",
					["bm_w_ching"] = "Garand",
						["bm_galant_sc_desc"] = "\"ARE YOU TRYING TO PULL ONE OVER ON ME!?\"\n\nA drill instructor working at #{stats_positive}#Seishou Academy.##\nLooks over the middleschoolers.",
	
			--RED STEEL ACADEMY
				--THREE STRIPES
					["bm_w_siltstone"] = "Drako",
						["bm_siltstone_sc_desc"] = "\"Не поймите неправильно...\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nCalm, collected and speaks exclusively in Russian.", --sorry about the Google/MS translate
					["bm_w_akm"] = "AKM",
						["bm_akm_sc_desc"] = "\"DON'T FUCK WITH ME!\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nA tall, menacing girl with the ears and tail of a fox. One of the few students capable of decieving AK47.",
					--["bm_w_rpk"] = "RPK",
						["bm_rpk_sc_desc"] = "\"This is why men are such pigs!\"\n\nA three-stripe student attending #{stats_negative}#Red Steel Academy.##\nA tall, blonde girl with the ears and tail of a Siberian Tiger. Gets sniped frequently.",
				--TWO STRIPES
					["bm_w_ak74"] = "Nanayon",
						["bm_ak74_sc_desc"] = "\"If it's the Major's orders, anything goes-\"\n\nA two-stripe student attending #{stats_negative}#Red Steel Academy.##\nA beautiful girl with not only the ears and tail of a fox but the cunning nature to match.",
					["bm_w_saiga"] = "Saiga-chan",
						["bm_saiga_sc_desc"] = "\"All of you are like mice in a trap, nya!\"\n\nA two-stripe student attending #{stats_negative}#Red Steel Academy.##\nHaughty, overconfident, and expressive, Saiga is a loud and boisterous auto-shotgun.",
				--ONE STRIPE
					["bm_w_coal"] = "Bizon",
						["bm_coal_sc_desc"] = "\"You can count on me-!\"\n\nA one-stripe student attending #{stats_negative}#Red Steel Academy.##\nReally looks up to her seniors, quite literally, but takes special care when addressing SVD.",
				--FACULTY
					["bm_w_mosin"] = "Mosin Nagant",
						["bm_mosin_sc_desc"] = "\"To the self-reflection room it is...\"\n\nA faculty member of #{stats_negative}#Red Steel Academy.##\nThe absolute Tsarista born of the Russian Empire. An old friend of Thomspon-sensei.",
			
			--ENOSHIMA
				--MIDDLE SCHOOLERS
					["bm_w_spas12"] = "Supasu",
						["bm_spas12_sc_desc"] = "\"Idiot! You're completely exposed!\"\n\nA middleschooler attending a public school in Enoshima.",
					["bm_w_benelli"] = "Beneri M4",
						["bm_spas12_sc_desc"] = "\"There's a limit to not being able to read the mood!\"\n\nA middleschooler attending a public school in Enoshima.",
					
			})
		end
	
		local big = math.rand(1)
		local pistol = 0.02
		if Month == "4" and Day == "1" then
			pistol = 1
		end
		if shitpost or not easterless and big <= pistol then
			LocalizationManager:add_localized_strings({	
				["bm_w_deagle"] = "Big Pistol",
				["bm_w_m16"] = "is that a clarion",
				["bm_m16_sc_desc"] = "I'll give you a clip so you can do some damage",
				["bm_w_x_type54"] = "The twin crosskills",
				["bm_akmsu_sc_desc"] = "A small rifle useful for taking down #{stat_maxed}#BIG MEN##. Not to be underestimated as this rifle can hold its own in just about any scenario.",
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
			["hud_assault_assault"] = "Asalto En Marcha",
			["hud_assault_cover"] = "MANTENTE A CUBIERTO",
			["hud_assault_alpha"] = "ASALTO"
		})
	end)
elseif ai_type == m then
	Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Ticker", function(loc)
		LocalizationManager:add_localized_strings({
			["hud_assault_assault"] = "Murkywater Operation in Progress",
			["hud_assault_alpha"] = "MURKYWATER OPERATION"
		})
	end)	
end

 if _G.HopLib then
	local ai_type = tweak_data.levels:get_ai_group_type()
	local murkywetew = tweak_data.levels.ai_groups.murkywater --LevelsTweakData.LevelType.Murkywater
	local lapd = tweak_data.levels.ai_groups.lapd
	local mex = tweak_data.levels.ai_groups.federales
	local akan = tweak_data.levels.ai_groups.russia
	local nypd = tweak_data.levels.ai_groups.nypd
	local fbi = tweak_data.levels.ai_groups.fbi
	local breins = tweak_data.levels.ai_groups.zombie

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
	elseif ai_type == nypd then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_nypd", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/nypd.json")		
		end)
	elseif ai_type == fbi then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_fbi", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/fbi.json")		
		end)
	elseif ai_type == breins then
		Hooks:Add("LocalizationManagerPostInit", "SC_HoplibKillFeedCompat_breins", function(loc)
			loc:load_localization_file(ModPath .. "lua/sc/loc/breins.json")		
		end)	
	end
 end

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Skills", function(loc)
	LocalizationManager:add_localized_strings({
		["menu_toggle_one_down"] = "Pro-Job",
		["menu_one_down"] = "Pro-Job",
		["menu_es_pro_job_bonus"] = "Pro-Job",
		
		["menu_pro_warning"] = "This is a pro job! If you fail, the entire contract will be terminated\nYou also might encounter a Point Of No Return event near the end of the heist, where more powerful enemies will be deployed.\nCompleting a pro job grants you a 25% money and experience bonus.",

		["menu_asset_lock_additional_assets_pro"] = "NOT AVAILABLE IN PRO-JOBS!",

		["cn_menu_contract_daypay_header"] = "Day Rate:",
		["cn_menu_contract_jobpay_header"] = "Contract Pay:",
		["victory_stage_cash_summary_name_job"] = "You earned $stage_cash on your contract day rate and an additional $job_cash for completing the contract.",

		["debug_interact_grenade_crate_take_grenades"] = "HOLD $BTN_INTERACT TO REFILL YOUR THROWABLES",
		["debug_interact_bodybags_bag_take_bodybag"] = "HOLD $BTN_INTERACT TO REFILL YOUR BODY BAGS AND CABLE TIES",

		["menu_equipment_armor_kit"] = "Throwable Case",
		["bm_equipment_armor_kit"] = "Throwable Case",
		["debug_equipment_armor_kit"] = "Throwable Case",
		["bm_equipment_armor_kit_desc"] = "To use the Throwable Case, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to refill your throwables.\n\nIt can only be used #{skill_color}#3## times; you can see how many uses are left by looking into the case.\n\nThe Throwable Case is a concealable case, usually used by a soldier or mercenary to carry specialized weaponry when the heat comes.\n\n#{important_1}#NOTE: CANNOT BE USED TO RESTORE REGENERATING OR COOLDOWN-BASED THROWABLES.##",
		["bm_equipment_armor_kit_desc_short"] = "To use the Throwable Case, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to refill your throwables.\n\nIt can only be used #{skill_color}#3## times; you can see how many uses are left by looking into the case.\n\n#{important_1}#NOTE: CANNOT BE USED TO RESTORE REGENERATING OR COOLDOWN-BASED THROWABLES.##",
		--Ordnance Bag
		["bm_equipment_grenade_crate_desc"] = "To use the Ordnance Bag, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to replenish #{skill_color}#25%## of all of your weapons' ammo reserves and #{skill_color}#1## throwable.\n\nIt can only be used #{skill_color}#4## times; you can see how many uses are left by looking at the bag.\n\nThe Ordnance Bag is a portable bag carried by combat operatives to transport explosives and other throwable weapons into a battle zone.\n\n#{important_1}#NOTE: CANNOT BE USED TO RESTORE REGENERATING OR COOLDOWN-BASED THROWABLES.##",
		["bm_equipment_grenade_crate_desc_short"] = "To use the Ordnance Bag, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to replenish #{skill_color}#25%## of all of your weapons' ammo reserves and #{skill_color}#1## throwable.\n\nIt can only be used #{skill_color}#4## times; you can see how many uses are left by looking at the bag.\n\n#{important_1}#NOTE: CANNOT BE USED TO RESTORE REGENERATING OR COOLDOWN-BASED THROWABLES.##",
		--Trip Mine
		["bm_equipment_trip_mine_desc"] = "To use a Trip Mine, you need to place one by holding #{skill_color}#$BTN_USE_ITEM.## The trigger laser can be toggled between its explosive and sensor modes by pressing #{skill_color}#$BTN_INTERACT.##\n\nTo use a Shaped Charge, you need to place one by holding #{skill_color}#$BTN_INTERACT.## Once the required number of charges have been placed they will detonate within a few seconds.\n\nTrip Mines are basically traps that will hurt or kill enemies crossing the beam. Shaped Charges are commonly used to open safes and doors. Both are a good addition to all combat situations.",
		["bm_equipment_trip_mine_desc_short"] = "To use a Trip Mine, you need to place one by holding #{skill_color}#$BTN_USE_ITEM.## The trigger laser can be toggled between its explosive and sensor modes by pressing #{skill_color}#$BTN_INTERACT.##\n\nTo use a Shaped Charge, you need to place one by holding #{skill_color}#$BTN_INTERACT.## Once the required number of charges have been placed they will detonate within a few seconds.",
		--Ammo Bag
		["bm_equipment_ammo_bag_desc"] = "To use the Ammo Bag, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to refill your ammo.\n\nIt can be used to fully replenish the ammo reserves of a weapon #{skill_color}#$deployable_uses## times; you can see how many uses are left by looking into the bag.\n\nThe Ammo Bag is a portable bag, originally intended to allow soldiers to carry extra ammunition with them into combat.",
		["bm_equipment_ammo_bag_desc_short"] = "To use the Ammo Bag, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to refill your ammo.\n\nIt can be used to fully replenish the ammo reserves of a weapon #{skill_color}#$deployable_uses## times; you can see how many uses are left by looking into the bag.",
		--ECM Jammer
		["bm_equipment_ecm_jammer_desc"] = "To use the ECM Jammer, you need to place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed it cannot be moved and it will be active for #{skill_color}#$deployable_uses## seconds.\n\nYou can activate the ECM Jammer's feedback ability by interacting with it. The feedback loop has a #{skill_color}#25## meter radius. The first feedback loop has a #{skill_color}#100%## chance to stun most enemies, with every #{skill_color}#1.2## seconds afterwards having a #{skill_color}#60%## chance to stun. Feedback lasts for #{skill_color}#$deployable_uses## seconds and will recharge after #{skill_color}#4## minutes.\n\nECM jammers can open ATM machines and temporarily cancel out electronic devices such as cell phones, cameras, and other detection systems easing your way towards your goal.",
		["bm_equipment_ecm_jammer_desc_short"] = "To use the ECM Jammer, you need to place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed it cannot be moved and it will be active for #{skill_color}#$deployable_uses## seconds.\n\nYou can activate the ECM Jammer's feedback ability by interacting with it. The feedback loop has a #{skill_color}#25## meter radius. The first feedback loop has a #{skill_color}#100%## chance to stun most enemies, with every #{skill_color}#1.2## seconds afterwards having a #{skill_color}#60%## chance to stun. Feedback lasts for #{skill_color}#$deployable_uses## seconds and will recharge after #{skill_color}#4## minutes.",
		--FAQ U
		["bm_equipment_first_aid_kit_desc"] = "To use a First Aid Kit, you need to place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to regain #{skill_color}#150## health.\n\nFirst Aid Kits can only be used #{skill_color}#1## time.\n\nThe First Aid Kit is a collection of supplies and equipment for use in rapidly giving first aid in emergency situations.",
		["bm_equipment_first_aid_kit_desc_short"] = "To use a First Aid Kit, you need to place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to regain #{skill_color}#150## health.\n\nFirst Aid Kits can only be used #{skill_color}#1## time.",
		--AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
		["bm_equipment_doctor_bag_desc"] = "To use the Doctor Bag, you need to place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to regain #{skill_color}#20%## of their maximum health and #{skill_color}#4%## maximum health every #{skill_color}#5## seconds for #{skill_color}#3## minutes.\n\nDoctor bags can be used #{skill_color}#$deployable_uses## times; you can see how many uses are left by looking in the bag.\n\nThe Doctor Bag is a portable bag, usually used by a physician or other medical professional to transport medical supplies and medicine.",
		["bm_equipment_doctor_bag_desc_short"] = "To use the Doctor Bag, you need to place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to regain #{skill_color}#20%## of their maximum health and #{skill_color}#4%## maximum health every #{skill_color}#5## seconds for #{skill_color}#3## minutes.\n\nDoctor bags can be used #{skill_color}#$deployable_uses## times; you can see how many uses are left by looking in the bag.",
		--Sentry
		["bm_equipment_sentry_gun_desc"] = "To use the Sentry Gun, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Upon deployment it will use #{skill_color}#$deployable_uses## of your maximum ammo.\n\nYou can pick up your Sentry Gun by holding #{skill_color}#$BTN_INTERACT## while near it; picking it up will refund you for the remaining ammo in it and repair it.\n\nUpon taking too much damage, it will shut off. While in this state, interacting with it will place it into an automatic repair mode.\n\nSentry Guns terrify civilians, forcing them to the ground.\n\nThe Sentry Gun automatically aims and fires at targets that are detected by its sensors. It's commonly used as a distraction, drawing attention away from you and your team.",
		["bm_equipment_sentry_gun_desc_short"] = "To use the Sentry Gun, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Upon deployment it will use #{skill_color}#$deployable_uses## of your maximum ammo.\n\nYou can pick up your Sentry Gun by holding #{skill_color}#$BTN_INTERACT## while near it; picking it up will refund you for the remaining ammo in it and repair it.\n\nUpon taking too much damage, it will shut off. While in this state, interacting with it will place it into an automatic repair mode.",
		--Supp. Sentry
		["bm_equipment_sentry_gun_silent_desc"] = "To use the Suppressed Sentry Gun, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Upon deployment it will use #{skill_color}#$deployable_uses## of your maximum ammo.\n\nYou can pick up your Sentry Gun by holding #{skill_color}#$BTN_INTERACT## while near it; picking it up will refund you for the remaining ammo in it and repair it.\n\nUpon taking too much damage, it will shut off. While in this state, interacting with it will place it into an automatic repair mode.\n\nSentry Guns terrify civilians, forcing them to the ground.\n\nThe Suppressed Sentry Gun is the counterpart to the regular, louder Sentry Gun as it's more used to take out enemies than a classic distraction.",
		["bm_equipment_sentry_gun_silent_desc_short"] = "To use the Suppressed Sentry Gun, you need to place it by holding #{skill_color}#$BTN_USE_ITEM.## Upon deployment it will use #{skill_color}#$deployable_uses## of your maximum ammo.\n\nYou can pick up your Sentry Gun by holding #{skill_color}#$BTN_INTERACT## while near it; picking it up will refund you for the remaining ammo in it and repair it.\n\nUpon taking too much damage, it will shut off. While in this state, interacting with it will place it into an automatic repair mode.",
		--Body Bags
		["bm_equipment_bodybags_bag_desc"] = "To use the Body Bag Case, you place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed, it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to refill your body bags and cable ties.\n\nThe Body Bag Case has limited uses; you can see how many uses are left by looking at the case.\n\nThe Body Bag Case carries additional bags and cable ties, used for the transportation of corpses during stealth and controlling civilian crowds.",
		["bm_equipment_bodybags_bag_desc_short"] = "To use the Body Bag Case, you place it by holding #{skill_color}#$BTN_USE_ITEM##. Once placed, it cannot be moved, but it can be used by you and your crew by holding #{skill_color}#$BTN_INTERACT## to refill your body bags and cable ties.\n\nThe Body Bag Case has limited uses; you can see how many uses are left by looking at the case.",

		["hud_int_hold_take_pardons"] = "PRESS $BTN_INTERACT TO TAKE THE PARDON",
		["debug_interact_gage_assignment_take"] = "PRESS $BTN_INTERACT TO PICK UP THE PACKAGE",

		["hint_ability_no_grenade_pickup"] = "YOU CAN'T PICK UP PERK DECK THROWABLES",
		["hint_full_grenades"] = "YOU ALREADY HAVE THE FULL AMOUNT.",
		["debug_interact_ordnance_bag_take_grenades"] = "HOLD $BTN_INTERACT TO TAKE A THROWABLE AND SOME AMMO",

		["far_repair_sentry_macro"] = "Sentry critically damaged, repairs needed.",
		["fixing_sentry_macro"] = "Repair progress: $AMMO_LEFT",
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
		["loading_gameplay_res_2"] = "Cloakers no longer make an ambient humming sound or screech when charging.",
		["loading_gameplay_res_3"] = "Pistols are ideal secondaries for primaries with long swap times.",
		["loading_gameplay_res_4"] = "Tasers no longer reload your weapons.",
		["loading_gameplay_res_5"] = "Cloakers can easily counter lone or cut off heisters.",
		["loading_gameplay_res_6"] = "Cloakers deal direct health damage when they kick you. This can be reduced with Deflection or the Counter Strike skill.",
		["loading_gameplay_res_7"] = "Green Bulldozers deal high amounts of damage and can often break even the heaviest of armors with a single shot.",
		["loading_gameplay_res_8"] = "Saiga/Black Bulldozers trade damage for high rate of fire and boast an impressive drum magazine. They also run faster than other dozers but have much less health.",
		["loading_gameplay_res_9"] = "LMG Dozers/Skulldozers lay down heavy suppressive fire that knockbacks on close range and will fire until their belts are empty. Their top armor can take up more damage than regular dozer but move as slow as Titandozers.",
		["loading_gameplay_res_10"] = "Benelli Shotgunner Dozers replace Minigun Dozers, high rate of fire and good damage. An unholy union of Green and Black dozers.",
		["loading_gameplay_res_11"] = "Target priority is important. A Bulldozer of any type is worth more attention than a Light SWAT.",
		["loading_gameplay_res_12"] = "On Death Sentence, Bulldozers enter a berserker rage when their glass visors are broken, increasing their damage by 10%.",
		["loading_gameplay_res_13"] = "Cloakers perform their iconic screech when they are about to jump kick you.",
		["loading_gameplay_res_14"] = "Cloaker Jump Kicks will cuff you instead of down you.",
		["loading_gameplay_res_15"] = "Flashbangs cannot be broken on Death Sentence. Your opinion, my choice.",
		["loading_gameplay_res_16"] = "You can parry melee attacks by charging your own. This can be upgraded to work against cloaker kicks.",
		["loading_gameplay_res_17"] = "Enemy melee attacks are quick and deadly. Keep your distance!",
		["loading_gameplay_res_18"] = "You know what's better than smacking enemies with a baseball bat? Smacking them in the head with a baseball bat for headshot damage.",
		["loading_gameplay_res_19"] = "Snipers take a brief period of time to focus before firing. Mind their lasers!",
		["loading_gameplay_res_20"] = "Your Jokers aren't safe from being kicked by Cloakers.",
		["loading_gameplay_res_21"] = "Common enemies of all factions share keen details on their uniforms to warn you about their preferred weaponry.",
		["loading_gameplay_res_22"] = "Shotgun-wielding enemies are poor at range, but make up for it in close-quarters.",
		["loading_gameplay_res_23"] = "Enemies will make better use of Shields on higher difficulties.",
		["loading_gameplay_res_24"] = "Enemies will have different behaviors on higher difficulties.",
		["loading_gameplay_res_25"] = "Death Sentence difficulty brings all sorts of nasty tricks to make your life hell. Don't expect them to pull their punches.",
		["loading_gameplay_res_26"] = "Pro Jobs offer a test of one's ability by only allowing one shot at the prize, and allows the spawning of the dreaded Bravo units.",
		["loading_gameplay_res_27"] = "Restoration Mod provides different factions, such as Murkywater mercenaries and law enforcers from other states.",
		["loading_gameplay_res_28"] = "Cloakers will make use of smoke grenades when performing take-downs on higher difficulties.",
		--New Units Hints
		["loading_new_units_res_title"] = "Restoration Unit Tips",
		["loading_new_units_res_1"] = "OMNIA ASUs will provide damage bonuses to nearby allies marked by giving them Yellow laser attachments.",
		["loading_new_units_res_2"] = "LPFs are weak to melee.",
		["loading_new_units_res_3"] = "Lighter units will be overhealed by the LPF. Enemies are outlined in purple during overhealing process.",
		["loading_new_units_res_4"] = "Titan Cloakers have advanced cloaking gear that renders them nearly invisible, but it still has the ambient hum of older models of standard Cloaker gear.",
		["loading_new_units_res_5"] = "Titan Dozers prefer putting distance between them and their target to unleash the full potential of their railguns undisturbed.",
		["loading_new_units_res_6"] = "Titan Snipers trade damage-per-shot and armor-piercing from their standard counterparts for a higher rate of fire and being able to shoot while moving.",
		["loading_new_units_res_7"] = "Instead of using a laser sight, Titan Sniper shots leave behind purple tracers.",
		["loading_new_units_res_8"] = "Titan Shields can be pierced with Anti-Material rifles, OVE9000 Saw when using Rip and Tear basic or with special AP rounds in Sentry Guns. Even shooting their shield long enough can make them drop it; beware of their sudden tactic change when it happens.",
		["loading_new_units_res_9"] = "Captain Spring and Titan Dozers take bonus headshot damage at all times.",
		["loading_new_units_res_10"] = "Titan Tasers fire electric rounds that severely restrict your movement temporarily, indicated by a blue UI overlay.",
		["loading_new_units_res_11"] = "Veteran Cops will drop Tear Gas grenades on death when killed by anything but a headshot.",
		["loading_new_units_res_12"] = "Veteran Cops move quickly making shots harder to land.",
		["loading_new_units_res_13"] = "The Riot Gear clad Titan SWAT are somewhat resistant to melee.",
		["loading_new_units_res_14"] = "Titan SWAT cannot be taken hostage or converted to fight on your side.",
		["loading_new_units_res_15"] = "Titan SWAT boast LMGs and automatic shotguns that either push back or concusses the enemy.",
		["loading_new_units_res_16"] = "The dreaded Bravo units spawn on Pro Jobs only, when a PONR is triggered. They are powerful no-nonsense enemies with enhanced body armor, and more powerful weapons.",
		["loading_new_units_res_17"] = "Bravo units can throw frag grenades. Mind your surroundings when you see them flashing and emitting a beeping countdown.",
		["loading_new_units_res_18"] = "AKAN fields their own Titan units called D-Series, developed by their R&D firm DRAK.",
		["loading_new_units_res_19"] = "The Grenadier launches tear gas grenades at range with his underbarrel attachment, damaging players that stand in the cloud. On Death Sentence he instead comes armed with deadlier, stamina-draining nerve gas grenades.",
		["loading_new_units_res_20"] = "Titan Shields have flashbang panels mounted on their shields. As a panel charges up, you can shoot it to stop it, breaking it and briefly stunning the wielder in the process.",
		--Captain Hints
		["loading_captains_res_title"] = "Restoration Captain Tips",
		["loading_captains_res_1"] = "Captain Summers' high damage resistance drops as each member of his crew is taken out. Target Doc first as he can heal the rest of his crew so long as he's standing.",		
		["loading_captains_res_2"] = "Don't hug Captain Summers. He WILL melt you with his flamethrower.",		
		["loading_captains_res_3"] = "Captain Spring can take a ton of damage but will eventually go down. Watch for his grenades and take advantage of his low mobility.",	
		["loading_captains_res_4"] = "Captain Spring throws Cluster HE grenades periodically.",	
		["loading_captains_res_5"] = "Captain Spring may be dangerous due to his knockback capabilites but he is incredibly slow and has poor range.",	
		["loading_captains_res_6"] = "Captain Autumn will loudly taunt when he attacks.",	
		["loading_captains_res_7"] = "Unlike other Captains, the police will not announce Autumn's arrival as to not ruin his element of surprise.",	
		["loading_captains_res_8"] = "Captain Autumn will progressively disable your deployables if he's allowed to stay undetected when active for a while. Disabled deployables are outlined in purple and can only be restored if Autumn is found and defeated.",	
		["loading_captains_res_9"] = "You will probably not beat Captain Autumn in a fist fight. Don't even try.",	
		["loading_captains_res_10"] = "Captain Winters has a strong resistance to bullets and even stronger ones to explosives and fire. Despite that, he is somewhat vulnerable to melee.",	
		["loading_captains_res_11"] = "Captain Winters' shield cannot be pierced but it will break after soaking up enough damage; like Titan Shields, beware of his second phase.",	
		["loading_captains_res_12"] = "Captain Winters will wander the map, healing and overhealing nearby enemies.",	
		["loading_captains_res_13"] = "Captain Winters' shield has flashbang panels like those used by Titan Shields; just keep in mind his flashbang panels don't break after being shot.",	
		--Stealth Hints
		["loading_stealth_res_title"] = "Restoration Stealth Tips",
		["loading_stealth_res_1"] = "The security Command Post will send guards to investigate malfunctioning cameras, allowing it to be used as a lure.",	
		["loading_stealth_res_2"] = "Quickly disposing of unalerted guards with a melee strike will allow you to snatch their pager.",	
		["loading_stealth_res_3"] = "The security Command Post will likely notice guards missing and send reinforcements.",	
		["loading_stealth_res_4"] = "Guards with no pagers do not increase suspicion when killed.",	
		["loading_stealth_res_5"] = "All loud weapons in stealth have a fixed 25 meter noise radius.",	
		["loading_stealth_res_6"] = "Civilians will get down in response to gunfire in both loud and stealth.",	
		["loading_stealth_res_7"] = "Sentry Guns will pacify any civilians in a notable radius around them.",	
		["loading_stealth_res_8"] = "While carrying any bag, you can be seen from much farther away, and will also be detected much faster while standing, sprinting, or jumping. Stay low and slow.",	
		["loading_stealth_res_9"] = "You get up to 4 ECMs instead of 2 like in vanilla, but they have half duration.",	
		["loading_stealth_res_10"] = "Suppressed weapons generate no noise in stealth.",	
		["loading_stealth_res_11"] = "You can take up to 4 cops hostage in stealth, just like in loud.",	
		["loading_stealth_res_12"] = "Stealth is more forgiving, allowing for more recovery.",	
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
		["loading_equip_skills_res_1"] = "Shotguns lose effectiveness at long range as their accuracy gets lower while higher accuracy hurts their ability to hit multiple targets; experiment and see what works best!",	
		["loading_equip_skills_res_2"] = "Pistols are faster to swap to compared to other weapon classes.",	
		["loading_equip_skills_res_3"] = "Weapons in Restoration fall under a variety of classes with different pros and cons. Higher damage weapons may kill enemies faster, but they may run dry on you before you know it!",	
		["loading_equip_skills_res_4"] = "Higher-damage weapons are generally less concealable unless they have significant downsides, such as Accuracy or Rate of Fire.",	
		["loading_equip_skills_res_5"] = "Wolf has upgraded our Sentry Guns to allow field repairs. It takes some time, but they will automatically repair once you initiate it.",	
		["loading_equip_skills_res_6"] = "If you have Sentry AP rounds unlocked, you can choose your default ammo type in the Equipment menu.",	
		["loading_equip_skills_res_7"] = "Perk Decks give significant damage bonuses and many of them provide rare and precious healing abilities.",	
		["loading_equip_skills_res_8"] = "Crew Chief, Armorer, Muscle, Crook, Gambler, and Biker are basic but consistent perk decks.",	
		["loading_equip_skills_res_9"] = "Hitman has been reworked into a low long-term survivability and consistency perk deck, but in exchange allows you to gain huge stores of 'Temporary HP' to power through tough spots.",	
		["loading_equip_skills_res_10"] = "Crew Chief is a team-focused perk deck that grants small but useful buffs to you and your teammates and more buffs if you have multiple hostages. It pairs well with The Controller tree in Mastermind.",	
		["loading_equip_skills_res_11"] = "Gambler is a team-focused perk deck that grants a little HP and bonus ammo to teammates when you pick ammo up. Pairs well with skills that grant extra ammo drops.",	
		["loading_equip_skills_res_12"] = "Maniac is a fast team-focused perk deck that reduces incoming damage for you and teammates as long as you keep up consistent killing. Pairs well with high-damage-output builds and builds with Damage Resist.",	
		["loading_equip_skills_res_13"] = "Hacker's Pocket ECM provides team wide healing and powerful crowd control, but takes a long time to recharge. It is also effective in stealth.",	
		["loading_equip_skills_res_14"] = "Burglar is a dodge focused perk deck that promotes keeping your head down during a firefight.",	
		["loading_equip_skills_res_15"] = "Kingpin is a versatile perk deck. The injector can be used for self sustain, surviving heavy damage, or drawing fire away from your team.",	
		["loading_equip_skills_res_16"] = "Tag Team is a team-focused perk deck that allows you to provide a lot of healing to a specific teammate as long as the two of you keep up consistent killing.",	
		["loading_equip_skills_res_17"] = "Bullets that pierce shields deal half damage.",	
		["loading_equip_skills_res_18"] = "The Peacemaker and Phoenix .500 Revolvers are able to pierce like a sniper rifle.",
		["loading_equip_skills_res_19"] = "If you have a blue meter on the side of your screen, then you have dodge. When it's flashing, you will dodge the next bullet. Please refer to the Guide for an in-depth explanation of our dodge rework.",	
		["loading_equip_skills_res_20"] = "The higher a weapon's mobility is, the faster you can draw and holster it.",	
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
		["loading_equip_skills_res_31"] = "Restoration Mod adds two new Perk Decks which provide increased money and XP gain at the cost of disabling your perks. Challenge yourself for better rewards!",
		["loading_equip_skills_res_32"] = "Aiming mechanics have been changed to require you to be fully aimed to reap the benefits of aimed accuracy. Keep an eye on your \"Aim Time\" stat as you mod your weapon.",
		["loading_equip_skills_res_33"] = "Long barrels, sturdier stocks and extended magazines have their merits but they can hit swap, reload, aim and sprint-to-fire times pretty hard; using too many will leave your weapon cumbersome to use.",
		["loading_equip_skills_res_34"] = "Weapon butt melee speeds are affected by the weapon's mobility rating.",
		["loading_equip_skills_res_35"] = "The \"Aim Time\" stat also serves as the \"Sprint-to-Fire\" stat. \"Sprint-to-Fire\" time is the time it takes to be able to fire your weapon after you stop sprinting.",
		["loading_equip_skills_res_36"] = "During combat, silencers reduce the likelihood of enemies evading your aim. Just be aware that the time they spend not dodging you is likely going to be put towards shooting you instead.",
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
		["loading_fluff_res_25"] = "AKAN offered a 'quick and brutal crackdown on cartels' at a price cheaper than OMNIA, which led to the Policía Federal adopting their version of DRAK's D-Series soldiers. This was a ploy to get their forces closer to OMNIA and Murky operations both in Mexico and the US.",

		["menu_button_deploy_bipod"] = "BIPOD/ALT-FIRE",
		["hint_short_max_pagers"] = "Neglecting pagers will significantly increase guard suspicion.",

		--And now we're doing it again--
		["menu_infamy_desc_root_new"] = "As a new arrival to the criminal elite, the first order of business is for you to get gear and fanfare befitting someone of your status.\n\nBONUSES:\nYour infamous base drop rate is increased from ##0.3%## to ##0.6%##\nExperience gained is increased by ##5%.##",

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
		["menu_mutators_achievement_disabled"] = "",
		["menu_mutators_category_holiday"] = "HOLIDAYS",
		["menu_mutators_category_old_event"] = "EVENTS",
		["menu_mutators_category_crime_spree"] = "CRIME SPREE",

		--Enemy Replacers
		["mutator_specials_override_boom"] = "Grenadiers",
		["mutator_specials_override_sniper"] = "Snipers",	
		
		["mutator_titandozers_desc"] = "Halloween Holiday Effects",
		["mutator_titandozers_longdesc"] = "The Headless Bulldozers have escaped from Wolf's nightmares and become reality! Regular Bulldozers will now be their Headless Bulldozer variants and other Halloween effects will now be active!",

		["mutator_medidozer_longdesc"] = "All normal enemies during assault waves are replaced with Medics, and all special units are replaced with Bulldozers.",
		["mutator_medicdozers"] = "Medic Dozers",
		["mutator_medicdozers_desc"] = "Medic Dozers can now spawn.",
		["mutator_medicdozers_longdesc"] = "Whenever a Bulldozer of any variety spawns, there is a 50% chance that it will be replaced by a Medic Bulldozer. \n\nNOTE: If the Semi-Auto Shotgun Bulldozer mutator is enabled, then the Medic Dozer will have a 33.3% chance of replacing a Black Bulldozer.",

		["mutator_notitans"] = "Budget Cuts",
		["mutator_notitans_desc"] = "Disables Titan Units.",
		["mutator_notitans_longdesc"] = "All spawn instances of Titan Units are disabled.",

		["mutator_mememanonly"] = "HAHAHA, FOOLED YOU GUYS!",
		["mutator_mememanonly_desc"] = "SUFFERING",
		["mutator_mememanonly_longdesc"] = "CANTRUNNOESCAPEHELPHELPHELP\n\n WARNING: This mutator may cause crashes on some maps.",

		["MutatorMoreDonutsPlus"] = "More Donuts+",
		["MutatorMoreDonutsPlus_desc"] = "All common enemies replaced by NYPD Bronco Cops, and all specials are replaced by LPFs.",
		["MutatorMoreDonutsPlus_longdesc"] = "All common enemies are replaced by NYPD Bronco Cops, and all specials are replaced with LPFs. \n\nWARNING: By enabling this mutator, you are committing an atrocity.",

		["MutatorJungleInferno"] = "Jungle Inferno",
		["MutatorJungleInferno_desc"] = "All enemies now spawn with flamethrowers.",
		["MutatorJungleInferno_longdesc"] = "All enemies have their standard weapons replaced with Flamethrowers.\n\nNote: Snipers and Shield enemies will still spawn with their normal weapons.",

		["mutator_minidozers"] = "Semi-Auto Shotgun Bulldozers",
		["mutator_minidozers_desc"] = "Semi-Auto Shotgun Bulldozers can now spawn.",
		["mutator_minidozers_longdesc"] = "Whenever a Black Bulldozer spawns, there is a 50% chance that it will be replaced by a Bulldozer wielding an M1014.\n\nNOTE: If the Medic Bulldozer mutator is enabled, then the Semi-Auto Shotgun Bulldozer will have a 33.3% chance of replacing a Black Bulldozer.",

		["mutator_fatroll"] = "Fat Roll",
		["menu_mutator_fatroll"] = "Grace Period (in s)",
		["mutator_fatroll_desc"] = "Custom Damage Grace value (in s).",
		["mutator_fatroll_longdesc"] = "Damage grace on players and AI crew members is set to different value, meaning that there is your specific delay on instances of damage. Minimum is 0 s, maximum is 0.25 s",

		["mutator_spawn_mult"] = "Amplified Response",
		["menu_mutator_enemy_spawn"] = "ENEMY SPAWN MULTIPLIER",
		["mutator_spawn_mult_desc"] = "Increased enemy spawns.",
		["mutator_spawn_mult_longdesc"] = "More enemies will spawn during assault phases. The Overkill™ way!",
		
		["mutator_birthday"] = "Balloon Poppers",
		["mutator_birthday_desc"] = "Special kills spawn balloons that provide buffs.",
		["mutator_birthday_longdesc"] = "PAYDAY 10th Anniversary event:\n\nKilling special units will spawn balloons which you can shoot to give buffs to the entire team that will either be a direct bonus or timed depending on the unit killed. Some units spawn balloons more frequently than others and several buffs can be active at the same time.",		

		["mutator_CG22"] = "A Criminal Carol",
		["mutator_CG22_desc"] = "Some heists will have a christmas tree that spawns presents to shred or give to Hajrudin.",
		["mutator_CG22_longdesc"] = "PAYDAY 2 2022 Christmas Event:\n\nChristmas Trees that appear on some heists will drop Christmas presents. Christmas Presents can either be shredded for temporary buffs during the heist, or given to Hajrudin for bonus XP, Cash, or Continental Coins. Doing either has a chance to spawn the Freeze-Thrower wielding Snowman Dozer.",		

		["menu_cg22_post_objective_1_desc"] = "Kill 200 enemies with any sniper rifle.",
		["menu_cg22_post_objective_2_desc"] = "Kill 15 Cloakers with the North Star rifle on Very Hard or above.",
		["menu_cg22_post_objective_3_desc"] = "Perform 50 double kills with the North Star rifle on any difficulty.",
		["menu_cg22_post_objective_4_desc"] = "Secure 10 loot bags (followed by a successful escape) on any difficulty.",
		["menu_cg22_post_objective_5_desc"] = "Kill 10 Dozers on Overkill difficulty or above.",
		["menu_cg22_post_objective_6_desc"] = "Secure 25 loot bags (followed by a successful escape) on any difficulty.",
		["menu_cg22_post_objective_7_desc"] = "Secure 50 loot bags (followed by a successful escape) on any difficulty.",
		["menu_cg22_post_objective_8_desc"] = "Kill 20 Dozers on Overkill difficulty or above.",
		["menu_cg22_post_objective_9_desc"] = "Secure 75 loot bags (followed by a successful escape) on any difficulty.",

		["mutator_piggybank"] = "Feed The Pig",
		["mutator_piggybank_desc"] = "Enemies killed drop piggy bucks to feed to the Golden Pig.",
		["mutator_piggybank_longdesc"] = "PAYDAY 2 9th Anniversary event:\n\nEnemies killed will have a chance to drop Piggy Bucks. Piggy Bucks are temporary bags that can be used to grow the Golden Piggy on certain heists, and the bigger the Piggy the more bonus XP and money will be rewarded at the end of the heist.",		

		["mutator_piggyrevenge"] = "Piggy's Revenge",
		["mutator_piggyrevenge_desc"] = "Enemies killed drop piggy bucks to feed to the Golden Pig and earn buffs.",
		["mutator_piggyrevenge_longdesc"] = "PAYDAY 2 10th Anniversary event:\n\nEnemies killed will have a chance to drop Piggy Bucks. Piggy Bucks are temporary bags that can be used to grow the Golden Piggy and earn buffs on certain heists, and doing so has a chance to spawn the Flamethrower wielding Piggy Dozer. The bigger the Piggy the more bonus XP and money will be rewarded at the end of the heist.",		

		["menu_pda10_post_objective_3_desc"] = "Complete 25 Heists on any difficulty",
		["menu_pda10_post_objective_5_desc"] = "Kill 50 enemies with Sniper Rifles",
		["menu_pda10_post_objective_2_desc"] = "Secure 50 loot bags",
		["menu_pda10_post_objective_6_desc"] = "Kill 50 enemies with Melee Weapons",
		["menu_pda10_post_objective_1_desc"] = "Kill 50 Dozers",
		["menu_pda10_post_objective_4_desc"] = "Collect 50 Gage Packages",
		
		["mutator_bravos_only"] = "Hardline",
		["mutator_bravos_only_desc"] = "All enemies are replaced by their PONR equivalents.",
		["mutator_bravos_only_longdesc"] = "All non-scripted spawn enemies are replaced by their Point of No Return equivalent spawns from Pro-Jobs at all times. FBI SWATs will replace Blue SWATs, and FBI SWATs will be replaced by National Guard Bravo units.",

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

		--Crime Spree mutators
		["mutator_cloakercuff"] = "Conjurer",
		["mutator_cloakercuff_desc"] = "Cloaker melee strikes will now cuff players.",
		["mutator_cloakercuff_longdesc"] = "Melee strikes from cloakers will force players into a cuffed state.",
		
		["mutator_cloakerflashbang"] = "Dazzling Ninja",
		["mutator_cloakerflashbang_desc"] = "Cloakers have a chance to drop a flashbang when they dodge.",
		["mutator_cloakerflashbang_longdesc"] = "Cloakers will now have a 50% chance to drop a flashbang when they dodge.",
		
		["mutator_fartsmella"] = "\"Pesticide\" Supplies",
		["mutator_fartsmella_desc"] = "Smoke Grenades are now replaced with Tear Gas.",
		["mutator_fartsmella_longdesc"] = "Smokes grenades deployed by enemies will instead be replaced by tear gas.\n\nNote: Does not replace smoke grenades from the \"Hurt Me More\" mutator.",
		
		["mutator_kaboom"] = "Kamikaze",
		["mutator_kaboom_desc"] = "Grenadiers now explode on death.",
		["mutator_kaboom_longdesc"] = "Grenadiers now explode on death.",
		
		["mutator_fastresponse"] = "Fast Response",
		["mutator_fastresponse_desc"] = "All police assaults now start at maximum intensity.",
		["mutator_fastresponse_longdesc"] = "All police assaults now start at maximum intensity.",
		
		["mutator_crazytaser"] = "Taser Overcharge",
		["mutator_crazytaser_desc"] = "Taser units no longer have an aim delay when attempting to stun players.",
		["mutator_crazytaser_longdesc"] = "Taser units no longer have an aim delay when attempting to stun players.\n\nNote: Normal cooldowns between attempts still apply.",

		["mutator_masterdodger"] = "Dodge This!",
		["mutator_masterdodger_desc"] = "Veteran Cops now dodge all bullets.",
		["mutator_masterdodger_longdesc"] = "Veteran Cops now dodge all bullets.",
		
		["mutator_fullautoinbuilding"] = "Rabid Shooters",
		["mutator_fullautoinbuilding_desc"] = "Titan Snipers and their equivalents will now fire their rifles on full auto at close range.",
		["mutator_fullautoinbuilding_longdesc"] = "Titan Snipers, Bravo Sharpshooters will now fire their rifles on full auto at close range (within 10 meters).",
		
		["mutator_quickscope360"] = "Eagle Eye",
		["mutator_quickscope360_desc"] = "Snipers now aim their rifles 100% faster.",
		["mutator_quickscope360_longdesc"] = "Snipers now aim their rifles 100% faster.",
		
		["mutator_goldfarbdozers"] = "Double Trouble",
		["mutator_goldfarbdozers_desc"] = "All Bulldozers that spawn will always deploy in pairs.",
		["mutator_goldfarbdozers_longdesc"] = "All Bulldozers that spawn will always deploy in pairs.",
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
		["menu_cs_modifier_heavies"] = "Light Rifle SWATs have a 100% increased chance to spawn with a squad leader unit, additionally one extra squad leader unit can spawn in each squad.",
		["menu_cs_modifier_heavy_sniper"] = "Titan Snipers and Bravo Sharpshooters will now fire their rifles on full auto at close range.",
		["menu_cs_modifier_dozer_medic"] = "Whenever a Bulldozer spawns, there is a chance that it will be a Medic Bulldozer. A Medic Bulldozer counts as both a Medic and a Bulldozer.",
		["menu_cs_modifier_dozer_minigun"] = "Whenever a Green or Black Bulldozer spawns, there is a chance that it will be replaced by a Bulldozer wielding an M1014.",
		["menu_cs_modifier_shield_phalanx"] = "All regular Shield units have an additional 15% chance to become a Titan Shield.",
		["menu_cs_modifier_taser_overcharge"] = "Taser units no longer have an aim delay when attempting to stun players. Normal cooldowns between attempts still apply.",
		["menu_cs_modifier_dozer_rage"] = "When a Bulldozer's faceplate is destroyed, the Bulldozer enters a berserker rage, receiving a 10% increase to their base damage output.",
		["menu_cs_modifier_medic_adrenaline"] = "All Medic units have an additional 15% chance to become an OMNIA LPF/D-145 SIGMA FLAMER depending on the faction.",
		["menu_cs_modifier_cloaker_arrest"] = "Cloaker melee strikes will now cuff players.",
		["menu_cs_modifier_cloaker_smoke"] = "Cloakers will now have a 50% chance to drop a flashbang when they dodge.",
		["menu_cs_modifier_cloaker_tear_gas"] = "All HRT units have an additional 15% chance to become a ASU unit.",
		["menu_cs_modifier_dozer_lmg"] = "Whenever a Green or Black Bulldozer spawns, there is a chance that it will be replaced by a Skulldozer.",
		["menu_cs_modifier_10secondsresponsetime"] = "All police assaults now start at maximum intensity.",
		["menu_cs_modifier_dozerpairs"] = "Bulldozers will now always spawn in pairs.",

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
		["menu_crew_quiet_desc"] = "Players gain 2 more mobility.",

		["menu_crew_generous"] = "Stockpiler ",
		["menu_crew_generous_desc"] = "Players are granted an extra throwable for every 70 kills.",

		["menu_crew_eager"] = "Accelerator",
		["menu_crew_eager_desc"] = "Players reload 10% faster.",

	--[[   SKILLTREES   ]]--

		--[[   MASTERMIND   ]]--

			--[[   MEDIC SUBTREE   ]]--
				--Combat Medic
				["menu_combat_medic_beta_sc"] = "Combat Medic",
				["menu_combat_medic_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain a #{skill_color}#10%## damage reduction for #{skill_color}#5## seconds while and after reviving another crew member.\n\nACE: #{owned}#$pro##\nReviving a crew member gives them #{skill_color}#30%## more health.",

				--Quick Fix
				["menu_tea_time_beta_sc"] = "Quick Fix",
				["menu_tea_time_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nDecreases your First Aid Kit and Doctor Bag deploy time by #{skill_color}#50%.##\n\nACE: #{owned}#$pro##\nCrew members that use your First Aid Kits take #{skill_color}#50%## less damage for #{skill_color}#5## seconds.",

				--Pain Killers
				["menu_fast_learner_beta_sc"] = "Painkillers",
				["menu_fast_learner_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nCrew members you revive take #{skill_color}#25%## less damage for #{skill_color}#5## seconds.\n\nACE: #{owned}#$pro##\nThe damage reduction is increased by an additional #{skill_color}#25%.##",

				--Uppers
				["menu_tea_cookies_beta_sc"] = "Uppers",
				["menu_tea_cookies_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now carry and deploy #{skill_color}#6## First Aid Kits.\n\nACE: #{owned}#$pro##\nYou can now carry and deploy #{skill_color}#9## First Aid Kits.\n\nYour deployed First Aid Kits will #{skill_color}#auto-revive## you or any crew members going down within #{skill_color}#5## meters of it; a #{important_1}#60## second cooldown for auto-revival is applied to whoever was auto-revived.\n\n#{risk}#NOTE: First Aid Kits will not revive anyone in a Swan Song state.##",

				--Combat Doctor
				["menu_medic_2x_beta_sc"] = "Combat Doctor",
				["menu_medic_2x_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour Doctor Bags carry additional supplies, allowing them to be used #{skill_color}#1## more time.\n\nACE: #{owned}#$pro##\nYou can now carry and deploy #{skill_color}#2## Doctor Bags.",

				--Inspire
				["menu_inspire_beta_sc"] = "Inspire",
				["menu_inspire_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou revive crew members #{skill_color}#50%## faster.\n\nShouting at your crew members will increase their movement and reload speed by #{skill_color}#20%## for #{skill_color}#10## seconds.\n\nACE: #{owned}#$pro##\nYou can revive a downed crew member you have a line of sight on up to #{skill_color}#9## meters away from you by shouting at them; ranged revives have a cooldown of #{important_1}#90## seconds between uses.",

			--[[   CONTROLLER SUBTREE   ]]--
				--Cable Guy
				["menu_triathlete_beta_sc"] = "Cable Guy",
				["menu_triathlete_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour supply of cable ties is increased by #{skill_color}#3.##\n\nACE: #{owned}#$pro##\nYour supply of cable ties is increased by an additional #{skill_color}#3.##\n\nYour chance to pick up cable ties from ammo boxes is increased to #{skill_color}#30%.##",

				--Clowns are Scary
				["menu_cable_guy_beta_sc"] = "Clowns are Scary",
				["menu_cable_guy_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nCivilians remain intimidated #{skill_color}#50%## longer.\n\nACE: #{owned}#$pro##\nThe power and range of your intimidation is increased by #{skill_color}#50%.##",

				--Stockholm Syndrome
				["menu_joker_beta_sc"] = "Stockholm Syndrome",
				["menu_joker_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nWhile down, nearby civilians and converted enemies will #{skill_color}#revive you when called over## and will give you an ammo box.\n\nACE: #{owned}#$pro##\nYou and your crew gain #{skill_color}#1## damage absorption for each hostage; stacks up to #{skill_color}#4## times.\n\n#{risk}#NOTE: Crew skills do not stack if multiple crew members have this skill.##",

				--Joker
				["menu_stockholm_syndrome_beta_sc"] = "Joker",
				["menu_stockholm_syndrome_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nOnce the heist has gone loud, you can convert #{skill_color}#1## non-special enemy who has surrendered to fight on your side; they count as hostages for the purpose of skills and trading crew members out of custody.\n\nYour converted enemy takes #{skill_color}#60%## less damage.\n\nACE: #{owned}#$pro##\nYou can now have #{skill_color}#2## non-special enemies converted at the same time.\n\nYour converted enemies takes an additional #{skill_color}#20%## less damage.",

				--Partners in Crime
				["menu_control_freak_beta_sc"] = "Partners in Crime",
				["menu_control_freak_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour movement speed is increased by an additonal #{skill_color}#3%## for each hostage you have; stacks up to #{skill_color}#4## times.\n\nACE: #{owned}#$pro##\nYour health is increased by an additional #{skill_color}#5%## for each hostage you have; stacks up to #{skill_color}#4## times.",

				--Hostage Taker
				["menu_black_marketeer_beta_sc"] = "Hostage Taker",
				["menu_black_marketeer_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou regenerate #{skill_color}#1## health point every #{skill_color}#4## seconds for each hostage you have; stacks up to #{skill_color}#4## times.\n\nACE: #{owned}#$pro##\nHealth regen from this skill is increased by #{skill_color}#50%## when you have #{skill_color}#4 or more## hostages.\n\n#{skill_color}#Your civillian hostages will not flee## when they have been rescued by law enforcers.\n\n#{skill_color}#A hostage will trade themselves## for your safe return if you go into custody during an assault.\n\n#{risk}#NOTE: This trade can only occur## #{important_1}#1## #{risk}#time during a heist.##",

			--[[   ASSAULT SUBTREE   ]]--
				--Leadership
				["menu_stable_shot_beta_sc"] = "Leadership",
				["menu_stable_shot_beta_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Machine guns## gain #{skill_color}#2## stability.\n\nACE: #{owned}#$pro##\nYou and your crew gain #{skill_color}#2## stability for #{skill_color}#all weapons.##\n\n#{risk}#NOTE: Crew skills do not stack if multiple crew members have this skill.##",

				--MG Handling
				["menu_scavenger_sc"] = "MG Handling",
				["menu_scavenger_desc_sc"] = "BASIC: #{owned}#$basic##\nTightens the hipfire accuracy of #{skill_color}#machine guns## by #{skill_color}#20%.##\n\nACE: #{owned}#$pro##\nTightens the hipfire accuracy of #{skill_color}#machine guns## by an additional #{skill_color}#30%.##\n\n#{skill_color}#Machine guns## reload #{skill_color}#25%## faster.",

				--MG Specialist
				["menu_sharpshooter_sc"] = "MG Specialist",
				["menu_sharpshooter_desc_sc"] = "BASIC: #{owned}#$basic##\nThe movement penalty to accuracy is reduced by #{skill_color}#60%## for #{skill_color}#machine guns.##\n\nThe movement penalty to accuracy is determined by stability.\n\nACE: #{owned}#$pro##\n#{skill_color}#Machine guns## fire #{skill_color}#15%## faster.\n\nEvery #{skill_color}#5th## bullet fired by a #{skill_color}#machine gun## without releasing the trigger consumes no ammo.",

				--Shock and Awe
				["menu_spotter_teamwork_beta_sc"] = "Shock and Awe",
				["menu_spotter_teamwork_beta_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#All weapon## magazine sizes are increased by #{skill_color}#20%.##\n\n#{risk}#NOTE: Does not apply to## #{important_1}#bows or launchers.##\n\nACE: #{owned}#$pro##\nThe magazine size increase is raised by an additional #{skill_color}#30%.##\n\n#{skill_color}#All weapons## can be hipfired while sprinting and their sprint-to-fire delay is removed.",

				--Heavy Impact
				["menu_speedy_reload_sc"] = "Heavy Impact",
				["menu_speedy_reload_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Machine guns## have a #{skill_color}#20%## chance to stagger enemies.\n\nThis chance is raised to #{skill_color}#40%## when using a bipod.\n\n#{risk}#NOTE: Stagger effects do not apply to## #{important_1}#Captains, Bulldozers, Snipers, or Shields.##\n\nACE: #{owned}#$pro##\nYou take #{skill_color}#12.5%## less damage while crouched.\n\nThe effect is raised to #{skill_color}#25%## when using a bipod.",

				--Body Expertise
				["menu_body_expertise_beta_sc"] = "Spray n' Pray",
				["menu_body_expertise_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour weapons deal #{skill_color}#50%## of their damage through body armor; effect is increased to #{skill_color}#100%## for #{skill_color}#machine guns.##\n\nThis is in addition to any armor piercing capabilites your weapon(s) may already have, to a maximum of #{skill_color}#100%.##\n\nACE: #{owned}#$pro##\nKills using #{skill_color}#machine guns## on full-auto without releasing the trigger for more than #{skill_color}#1.5## seconds will grant them an additional #{skill_color}#16.67%## more damage; stacks up to #{skill_color}#3## times.",


		--[[   ENFORCER   ]]--

			--[[   SHOTGUNNER SUBTREE   ]]--
				--Underdog--
				["menu_underdog_beta_sc"] = "Underdog",
				["menu_underdog_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nWhen three or more enemies are within #{skill_color}#18## meters of you, you receive a #{skill_color}#10%## damage bonus that lasts for #{skill_color}#7## seconds.\n\nACE: #{owned}#$pro##\nWhen three or more enemies are within #{skill_color}#18## meters of you, you also receive a #{skill_color}#10%## damage reduction that lasts for #{skill_color}#7## seconds.",

				--Shotgun CQB
				["menu_shotgun_cqb_beta_sc"] = "Shotgun CQB",
				["menu_shotgun_cqb_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour aim down sights and sprint-to-fire speeds for #{skill_color}#shotguns and flamethrowers## are #{skill_color}#7.5%## faster.\n\nACE: #{owned}#$pro##\n#{skill_color}#Shotguns and flamethrowers## reload #{skill_color}#25%## faster.",
				["menu_shotgun_cqb_per_pellet_desc_sc"] = "BASIC: #{owned}#$basic##\nYour aim down sights and sprint-to-fire speeds for #{skill_color}#shotguns and flamethrowers## are #{skill_color}#7.5%## faster.\n\nACE: #{owned}#$pro##\n#{skill_color}#Shotguns and flamethrowers## reload #{skill_color}#25%## faster.",

				--Shotgun Impact
				["menu_shotgun_impact_beta_sc"] = "Shotgun Impact",
				["menu_shotgun_impact_beta_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Shotguns and flamethrowers## gain #{skill_color}#2## stability.\n\nACE: #{owned}#$pro##\n#{skill_color}#Shotguns## fire #{skill_color}#3## extra pellets.\n\n#{risk}#NOTE: Does not apply to shotguns using slugs or explosive rounds.##",
				["menu_shotgun_impact_per_pellet_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Shotguns and flamethrowers## gain #{skill_color}#2## stability.\n\nACE: #{owned}#$pro##\nThe minimum damage of #{skill_color}#shotguns## is increased by #{skill_color}#25%.##\n\n#{risk}#NOTE: Does not apply to shotguns using slugs or explosive rounds.##",

				--Pigeon Shooting
				["menu_far_away_beta_sc"] = "Pigeon Shooter",
				["menu_far_away_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nWhen using a #{skill_color}#shotgun## firing multiple projectiles, each projectile fired is capable of piercing through #{skill_color}#1## enemy and deals #{skill_color}#25%## of their damage through armor.\n\nThis is in addition to any armor piercing capabilites your #{skill_color}#shotgun(s)## may already have, to a maximum of #{skill_color}#100%.##\n\nACE: #{owned}#$pro##\nThe accuracy and range of #{skill_color}#shotguns and flamethrowers## is increased by #{skill_color}#30%## while aiming down sights.",

				--Gung Ho
				["menu_close_by_beta_sc"] = "Gung-Ho",
				["menu_close_by_beta_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Shotguns and flamethrowers## can be hipfired while sprinting and their sprint-to-fire delay is removed.\n\nACE: #{owned}#$pro##\nWhile hip-firing, the rate of fire of #{skill_color}#shotguns and flamethrowers## is increased by #{skill_color}#35%.##",

				--Overkill
				["menu_overkill_sc"] = "OVERKILL",
				["menu_overkill_desc_sc"] = "BASIC: #{owned}#$basic##\nKills before falloff begins using direct damage from #{skill_color}#shotguns, flamethrowers or the OVE9000 Saw## activates this skill and grants them a #{skill_color}#50%## increase to their max damage for #{skill_color}#3## seconds.\n\n#{risk}#NOTE: Will not be triggered by or have any effect on## #{important_1}#explosives or damage-over-time.##\n\nACE: #{owned}#$pro##\nThe damage increase now applies to #{skill_color}#all weapons## and lasts an additional #{skill_color}#6## seconds.\n\n#{risk}#NOTE: Damage bonus does not apply to## #{important_1}#Launchers.##\n\nYour draw and holster speeds for #{skill_color}#shotguns, flamethrowers and the OVE9000 Saw## are #{skill_color}#60%## faster.",

			--[[   JUGGERNAUT SUBTREE   ]]--
				--Stun Resistance--
				["menu_oppressor_beta_sc"] = "Stun Resistance",
				["menu_oppressor_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nEnemy melee attacks push you back #{skill_color}#2.5%## less for every point of armor you have.\n\nACE: #{owned}#$pro##\nReduces the visual effect duration of flashbangs by #{skill_color}#50%.##",

				--Die Hard
				["menu_show_of_force_sc"] = "Die Hard",
				["menu_show_of_force_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain #{skill_color}#5%## deflection.\n\nDeflection reduces the amount of health damage you take, to a maximum of #{skill_color}#$deflection##, and is applied after other forms of damage reduction.\n\nACE: #{owned}#$pro##\nYou gain an additional #{skill_color}#5%## deflection.",

				--Transporter
				["menu_pack_mule_beta_sc"] = "Transporter",
				["menu_transporter_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nFor every #{skill_color}#10## points of armor you have, the movement penalty for carried bags is reduced by #{skill_color}#0.5%.##\n\nACE: #{owned}#$pro##\nYou can now sprint with any bag.\n\n#{risk}#NOTE: The movement penalty from the bag still applies.##",

				--More Blood to Bleed--
				["menu_iron_man_beta_sc"] = "More Blood to Bleed",
				["menu_iron_man_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain #{skill_color}#10%## extra health.\n\nACE: #{owned}#$pro##\nYou gain an additional #{skill_color}#15%## extra health.",

				--Bullseye--
				["menu_prison_wife_beta_sc"] = "Bullseye",
				["menu_prison_wife_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nHeadshots regenerate #{skill_color}#5## armor; has a cooldown of #{important_1}#5## seconds.\n\nLethal headshots reduce the cooldown by #{skill_color}#0.5## seconds. $anarc_disable\n\nACE: #{owned}#$pro##\nHeadshots regenerate an additional #{skill_color}#30## armor.\n\nThe cooldown reduction is increased by an additional #{skill_color}#0.5## seconds. $anarc_disable\n\n",

				--Iron Man
				["menu_juggernaut_beta_sc"] = "Iron Man",
				["menu_juggernaut_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can wear the #{skill_color}#Improved Combined Tactical Vest.##\n\nWhen you melee Shield enemies, they get staggered from the sheer force.\n\n#{risk}#NOTE:## #{important_1}#Titan Shields and Captain Winters## #{risk}#cannot be staggered.##\n\nACE: #{owned}#$pro##\nYour armor recovers #{skill_color}#10%## faster. $anarc_disable\n\nYour ability to stagger shields is extended to your ranged weapons; chances are increased the higher the total damage of the weapon is.",

			--[[   SUPPORT SUBTREE   ]]--
				--Scavenger
				["menu_scavenging_sc"] = "Scavenger",
				["menu_scavenging_desc_sc"] = "BASIC: #{owned}#$basic##\nYour ammo box pick up range is increased by #{skill_color}#50%.##\n\nACE: #{owned}#$pro##\nEvery #{skill_color}#5th## enemy you kill will drop an extra ammo box.",

				--Bulletstorm--
				["menu_ammo_reservoir_beta_sc"] = "Bulletstorm",
				["menu_ammo_reservoir_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nAmmo bags placed by you grant its users the ability to shoot without depleting their ammunition for up to #{skill_color}#5## seconds after replenishing ammo from it.\n\nThe more ammo replenished, the longer the duration of the effect.\n\n#{risk}#NOTE:## #{important_1}#Launchers and weapons using explosive ammo## #{risk}#do not receive the effects of this skill.##\n\nACE: #{owned}#$pro##\nIncreases the maximum possible duration of the effect by an additional #{skill_color}#15## seconds.",

				--Specialist Equipment formally Rip and Tear
				["menu_portable_saw_beta_sc"] = "Specialist Equipment",
				["menu_portable_saw_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nReduces the wear down of #{skill_color}#OVE9000 Saw## blades by #{skill_color}#50%.##\n\nACE: #{owned}#$pro##\nThe #{skill_color}#OVE9000 Saw, Bows and Launchers## reload #{skill_color}#25%## faster.",

				--Extra Lead
				["menu_ammo_2x_beta_sc"] = "Extra Lead",
				["menu_ammo_2x_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nEach ammo bag contains an additional #{skill_color}#200%## more ammunition.\n\nACE: #{owned}#$pro##\nYou can now place #{skill_color}#2## ammo bags instead of just one.",

				--Rip and Tear formally Carbon Blade
				["menu_carbon_blade_beta_sc"] = "Rip and Tear",
				["menu_carbon_blade_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now saw through shields with your #{skill_color}#OVE9000 saw.##\n\nACE: #{owned}#$pro##\nKills with the #{skill_color}#OVE9000 Saw, Bows and Launchers## have a #{skill_color}#50%## chance to cause nearby enemies in a #{skill_color}#10## meter radius to panic.\n\nPanic makes enemies go into short bursts of uncontrollable fear.",

				--Fully Loaded--
				["menu_bandoliers_beta_sc"] = "Fully Loaded",
				["menu_bandoliers_desc_sc"] = "BASIC: #{owned}#$basic##\nYour total ammo capacity is increased by #{skill_color}#25%.##\n\nACE: #{owned}#$pro##\nYou pick up #{skill_color}#50%## more ammo from ammo boxes.\n\nYour base chance to pick up a throwable is raised to #{skill_color}#5%##; chance is increased by an additional #{skill_color}#1%## each time you don't find one and will reset to base when you do.\n\n#{risk}#NOTE: You cannot pick up regenerative or cooldown-based throwables.##",

		--[[   TECHNICIAN   ]]--

			--[[   FORTRESS SUBTREE   ]]--
				--Logistician
				["menu_defense_up_beta_sc"] = "Logistician",
				["menu_defense_up_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou deploy and interact with all deployables #{skill_color}#25%## faster.\n\nACE: #{owned}#$pro##\nYou deploy and interact with all deployables additional #{skill_color}#50%## faster.\nYour crew deploy and interact with all deployables #{skill_color}#25%## faster.\n\n#{risk}#NOTE: Crew skills do not stack if multiple crew members have this skill.##",
	
				--Nerves of Steel--
				["menu_fast_fire_beta_sc"] = "Nerves of Steel",
				["menu_fast_fire_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can #{skill_color}#aim down your sights while bleeding out.##\n\nACE: #{owned}#$pro##\nYou take #{skill_color}#50%## less damage while interacting with objects.",
	
				--Engineering
				["menu_eco_sentry_beta_sc"] = "Engineering",
				["menu_eco_sentry_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour sentry guns gain #{skill_color}#40%## more health.\n\nACE: #{owned}#$pro##\nYour sentry guns gain an additional #{skill_color}#60%## more health.",
	
				--Jack of all Trades
				["menu_jack_of_all_trades_beta_sc"] = "Jack of All Trades",
				["menu_jack_of_all_trades_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou carry #{skill_color}#50%## more throwables.\n\n#{risk}#NOTE: Does not apply to perk deck throwables.##\n\nACE: #{owned}#$pro##\n#{skill_color}#You can now equip a second deployable to bring with you.## Pressing #{skill_color}#$BTN_CHANGE_EQ## will allow you to toggle between deployables.\n\nYou carry #{important_1}#50%## the normal amount of your second deployable, to a minimum of #{skill_color}#1.##",
	
				--Sentry Tower Defense--
				["menu_tower_defense_beta_sc"] = "Tower Defense",
				["menu_tower_defense_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now toggle #{skill_color}#armor-piercing rounds## on your sentry guns, lowering the rate of fire by #{skill_color}#66%## and allowing it to pierce through enemies and shields.\n\nACE: #{owned}#$pro##\nYou can now carry a maximum of #{skill_color}#2## sentry guns.\n\nSentry guns now cost #{skill_color}#35%## of your maximum ammo to place.",
	
				--Bulletproof--
				["menu_iron_man_sc"] = "Bulletproof",
				["menu_iron_man_desc_sc"] = "BASIC: #{owned}#$basic##\nYour armor cannot be pierced.\n\n#{risk}#NOTE: Does not apply to self-damage.##\n\nACE: #{owned}#$pro##\nWhile your armor is full, damage taken is reduced by a number of points equal to #{skill_color}#15%## of your maximum armor.\n\nYour armor recovers #{skill_color}#15%## faster. $anarc_disable",

			--[[   BREACHER SUBTREE   ]]--
				--Silent Drilling--
				["menu_hardware_expert_beta_sc"] = "Silent Drilling",
				["menu_hardware_expert_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour #{skill_color}#drills and saws are now silent##, civilians and guards have to see them in order to be alerted.\n\nACE: #{owned}#$pro##\nYou fix drills and saws #{skill_color}#50%## faster.",
	
				--Demoman
				["menu_trip_mine_expert_beta_sc"] = "Demoman",
				["menu_combat_engineering_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now place up to #{skill_color}#6## shaped charges.\n\nYou deploy shaped charges and trip mines #{skill_color}#25%## faster.\n\nACE: #{owned}#$pro##\nYou can now place up to #{skill_color}#8## shaped charges.\n\nThe explosion radius of your trip mines is increased by #{skill_color}#30%.##",
	
				--Drill Sawgeant
				["menu_drill_expert_beta_sc"] = "Drill Sawgeant",
				["menu_drill_expert_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour drill and saw efficiency is increased by #{skill_color}#10%.##\n\nACE: #{owned}#$pro##\nFurther increases your drill and saw efficency by #{skill_color}#20%.##",
	
				--Fire Trap--
				["menu_more_fire_power_sc"] = "Fire Trap",
				["menu_more_fire_power_desc_sc"] = "BASIC: #{owned}#$basic##\nYour trip mines now spread fire around the area of detonation for #{skill_color}#10## seconds in a #{skill_color}#7.5## meter radius.\n\nFire produced by trip mines do not deal self damage or friendly fire.\n\nACE: #{owned}#$pro##\nYou can now carry and plant #{skill_color}#10## trip mines.\n\nYour trip mine deals #{skill_color}#50%## more damage.",
	
				--Expert Hardware
				["menu_kick_starter_beta_sc"] = "Expert Hardware",
				["menu_kick_starter_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour drills and saws gain a #{skill_color}#10%## chance to automatically restart after breaking.\n\nACE: #{owned}#$pro##\nYour drills and saws gain an additional #{skill_color}#20%## chance to automatically restart after jamming.\n\nEnemies that attempt to stop your drills and saws have a #{skill_color}#50%## chance of being tased, stopping their sabotage attempt.",
	
				--Kickstarter
				["menu_fire_trap_beta_sc"] = "Kick Starter",
				["menu_fire_trap_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain the ability to restart a drill or saw with a melee strike.\n\nYou get #{skill_color}#1## chance for each time it jams with a #{skill_color}#75%## success rate.\n\nACE: #{owned}#$pro##\n#{skill_color}#You no longer put away your weapon while performing interactions.##\n\nYou are able to look around freely, aim, and use your weapons without stopping the interaction, as long as you continue to hold down the interact key and remain in range for the interaction.",

			--[[   COMBAT ENGINEER SUBTREE   ]]--
				--Sharpshooter--
				["menu_discipline_sc"] = "Sharpshooter",
				["menu_discipline_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Rifles## gain #{skill_color}#2## stability.\n\nACE: #{owned}#$pro##\nLethal headshots using #{skill_color}#rifles## set to semi-auto or burst increase your rate of fire by #{skill_color}#20%## for #{skill_color}#10## seconds.",

				--Rifleman
				["menu_rifleman_sc"] = "Rifleman",
				["menu_rifleman_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Rifles## gain #{skill_color}#15%## more accuracy and range while aiming down sights.\n\nACE: #{owned}#$pro##\n#{skill_color}#Rifles## gain an additional #{skill_color}#15%## more accuracy and range while aiming down sights.",

				--Kilmer--
				["menu_heavy_impact_beta_sc"] = "Kilmer",
				["menu_heavy_impact_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nThe movement penalty to accuracy is reduced by #{skill_color}#60%## for #{skill_color}#rifles.##\n\nThe movement penalty to accuracy is determined by stability.\n\nACE: #{owned}#$pro##\n#{skill_color}#Rifles## reload #{skill_color}#25%## faster.",

				--Ammo Efficiency--
				["menu_single_shot_ammo_return_sc"] = "Ammo Efficiency",
				["menu_single_shot_ammo_return_desc_sc"] = "BASIC: #{owned}#$basic##\nGetting #{skill_color}#3## lethal headshots with #{skill_color}#rifles## in less than #{skill_color}#8## seconds will grant #{skill_color}#3%## of your total ammo, to a minimum of #{skill_color}#1## round, back to the weapon.\n\nACE: #{owned}#$pro##\nThe effect is now triggered upon landing #{skill_color}#2## lethal headshots within #{skill_color}#12## seconds of each other.",

				--Aggressive Reload
				["menu_engineering_beta_sc"] = "Aggressive Reload",
				["menu_engineering_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nLethal headshots using #{skill_color}#rifles## set to semi-auto or burst will increase your reload speed by #{skill_color}#25%## for #{skill_color}#10## seconds.\n\nACE: #{owned}#$pro##\nThe reload speed bonus increases to #{skill_color}#50%## and can be triggered regardless of fire mode.",

				--Mind Blown, formerly Explosive Headshot--
				["menu_kilmer_sc"] = "Mind Blown",
				["menu_kilmer_desc_sc"] = "BASIC: #{owned}#$basic##\nHeadshots with #{skill_color}#rifles## set to semi-auto or burst deal #{skill_color}#70%## of the damage dealt to the closest enemy in a #{skill_color}#4## meter radius.\n\nFor every #{skill_color}#8## meters away you are from the enemy, the effect chains to an additional enemy; up to #{skill_color}#3## times.\n\nACE: #{owned}#$pro##\nHeadshots with #{skill_color}#rifles## set to semi-auto have #{skill_color}#no damage falloff## and the radius of the chaining effect is increased by #{skill_color}#1## meter.\n\nFor every #{skill_color}#8## meters away you are from the enemy, the chaining effect deals an additional #{skill_color}#10%## damage; up to a total of #{skill_color}#100%## of the damage dealt.",

		--[[   GHOST   ]]--

			--[[   SHINOBI SUBTREE   ]]--
				--Alert--
				["menu_jail_workout_sc"] = "Alert",
				["menu_jail_workout_desc_sc"] = "BASIC: #{owned}#$basic##\nIncreases the duration of enemy marking by #{skill_color}#100%.##\n\nACE: #{owned}#$pro##\nYou will #{skill_color}#automatically mark## guards, specials, and elite enemies within #{skill_color}#40## meters of you when you aim at them.\n\n#{risk}#NOTE: Guards can only be marked during stealth.##",

				--Sixth Sense--
				["menu_chameleon_beta_sc"] = "Sixth Sense",
				["menu_chameleon_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain the ability to #{skill_color}#automatically mark## enemies within a #{skill_color}#10## meter radius around you after standing still for #{skill_color}#3.5## seconds.\n\nACE: #{owned}#$pro##\nYou #{skill_color}#gain access to all insider assets.##",

				--ECM Overdrive--
				["menu_cleaner_beta_sc"] = "ECM Overdrive",
				["menu_cleaner_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour ECM jammer can now be #{skill_color}#used to open certain electronic doors.##\n\nACE: #{owned}#$pro##\nYour ECM jammer and feedback duration is increased by #{skill_color}#25%.##\n\n##Pagers are delayed by the ECM jammer.##",

				--Nimble--
				["menu_second_chances_beta_sc"] = "Nimble",
				["menu_second_chances_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now #{skill_color}#silently crack safes by hand.##\n\nYou interact with all computers, hacks, cameras, and ECMs #{skill_color}#30%## faster.\n\nACE: #{owned}#$pro##\nYou pick all locks #{skill_color}#50%## faster.\n\nYou interact with all computers, hacks, cameras, and ECMs an additional #{skill_color}#50%## faster.",

				--ECM Specialist--
				["menu_ecm_booster_beta_sc"] = "ECM Specialist",
				["menu_ecm_booster_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now carry #{skill_color}#3## ECM jammers.\n\nACE: #{owned}#$pro##\nYou can now carry #{skill_color}#4## ECM jammers.",

				--Spotter--
				["menu_ecm_2x_beta_sc"] = "Spotter",
				["menu_ecm_2x_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nEnemies you mark take #{skill_color}#25%## more damage when further than #{skill_color}#20## meters away.\n\nACE: #{owned}#$pro##\nEnemies you mark take an additional #{skill_color}#35%## more damage from all sources at all ranges.",

			--[[   ARTFUL DODGER SUBTREE   ]]--
				--Duck and Cover--
				["menu_sprinter_beta_sc"] = "Duck and Cover",
				["menu_sprinter_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour stamina starts regenerating #{skill_color}#25%## earlier and #{skill_color}#25%## faster.\n\nACE: #{owned}#$pro##\nYour dodge meter fills up by #{skill_color}#6%## of your dodge every second while crouching.\n\nYou gain a #{skill_color}#10%## boost in your movement speed when crouching.",

				--Evasion--
				["menu_awareness_beta_sc"] = "Evasion",
				["menu_awareness_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain an additional #{skill_color}#5%## movement speed.\n\nYour fall damage is reduced by #{skill_color}#75%.##\n\nACE: #{owned}#$pro##\nYou can reload your weapons while sprinting.\n\n#{item_stage_2}#A setting to allow for sprint cancelling reloads can be found in Restoration Mod's extra options.##",

				--Deep Pockets--
				["menu_thick_skin_beta_sc"] = "Deep Pockets",
				["menu_thick_skin_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nIncreases the mobility of melee weapons by #{skill_color}#2.##\n\nACE: #{owned}#$pro##\nIncreases the mobility of all ballistic vests by #{skill_color}#4##, and all other armors by #{skill_color}#2.##",

				--Moving Target--
				["menu_dire_need_beta_sc"] = "Moving Target",
				["menu_dire_need_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain #{skill_color}#1.5%## extra movement speed for every #{skill_color}#2## points of encumbrance under #{skill_color}#30##, up to #{skill_color}#15%.##\n\nYou move #{skill_color}#50%## faster while aiming down sights.\n\n#{risk}#NOTE: Speed while aiming is capped to your current stance's max speed.##\n\nACE: #{owned}#$pro##\nYou gain #{skill_color}#1.5%## extra movement speed for every #{skill_color}#1## point of encumbrance under #{skill_color}#30##, up to #{skill_color}#15%.##\n\nYour dodge meter fills up by #{skill_color}#15%## of your dodge every second while sprinting and #{skill_color}#30%## of your dodge every second ziplining.",

				--Shockproof
				["menu_insulation_beta_sc"] = "Shockproof",
				["menu_insulation_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nGetting shocked no longer forces you to shoot and the shock attack from a Taser has a #{skill_color}#15%## chance to backfire, knocking back the Taser in the process.\n\n#{risk}#NOTE: The accuracy and recoil penalties from being shocked still apply.##\n\nKnockback from enemy gunfire is reduced by #{skill_color}#30%.##\n\nACE: #{owned}#$pro##\nInteracting with an enemy Taser within #{skill_color}#2## seconds of him electrocuting you will counter-electrocute him, dealing #{skill_color}#50%## of his max health as damage.\n\nThe slowdown effect and duration of Titan Taser attacks are reduced by #{skill_color}#50%.##",

				--Sneaky Bastard--
				["menu_jail_diet_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain #{skill_color}#1## point of dodge for every #{skill_color}#2## points of encumbrance under #{skill_color}#30##, up to a maximum of #{skill_color}#10##\n\nACE: #{owned}#$pro##\nYou gain #{skill_color}#1## point of dodge for every #{skill_color}#1## point of encumbrance under #{skill_color}#30##, up to a maximum of #{skill_color}#10.##\n\nWhile your armor is broken, the first attack you dodge restores #{skill_color}#2%## of your maximum health.",

			--[[   SILENT KILLER SUBTREE   ]]--
				--Second Wind
				["menu_scavenger_beta_sc"] = "Second Wind",
				["menu_scavenger_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nWhen your armor breaks you gain #{skill_color}#10%## speed for #{skill_color}#3## seconds.\n\nACE: #{owned}#$pro##\nWhen your armor is fully depleted, the first shot on every enemy will stagger them.\n\nThis effect persists for #{skill_color}#3## seconds after your armor has regenerated.",

				--Optical Illusions--
				["menu_optic_illusions_sc"] = "Optical Illusions",
				["menu_optic_illusions_desc_sc"] = "BASIC: #{owned}#$basic##\nYou draw and holster weapons #{skill_color}#15%## faster.\n\nACE: #{owned}#$pro##\nIncreases the mobility of all guns by #{skill_color}#2.##",

				--The Professional--
				["menu_silence_expert_beta_sc"] = "The Professional",
				["menu_silence_expert_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYour aim down sights and sprint-to-fire speeds are #{skill_color}#5%## faster.\n\nACE: #{owned}#$pro##\nYour aim down sights and sprint-to-fire speeds are an additional #{skill_color}#10%## faster.\n\nKilling special and elite enemies with non-explosive ranged weapons will make them drop an extra ammo box.",

				--Unseen Strike, formally Dire Need--
				["menu_backstab_beta_sc"] = "Unseen Strike",
				["menu_backstab_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nIf you do not take damage for #{skill_color}#3## seconds, you gain a #{skill_color}#15%## critical hit chance until you take damage.\n\nCritical hits deal #{skill_color}#50%## additional damage.\n\nACE: #{owned}#$pro##\nUnseen Strike's critical hit chance persists for #{skill_color}#4## seconds after taking damage.",

				--Cleaner--
				["menu_hitman_beta_sc"] = "Cleaner",
				["menu_hitman_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou deal #{skill_color}#10%## more damage to special and elite enemies.\n\n#{risk}#NOTE: Does not apply to## #{important_1}#launchers.##\n\nACE: #{owned}#$pro##\nYou deal an additional #{skill_color}#15%## more damage to special and elite enemies.\n\nKilling an enemy with a headshot fills your dodge meter by #{skill_color}#12.5%## of your dodge.\n\nKilling an enemy from behind fills your dodge meter by #{skill_color}#75%## of your dodge; stacks in addition to dodge given through headshot kills.\n\n#{risk}#NOTE: Kills using## #{important_1}#explosives, fire or damage-over-time effects## #{risk}#will not grant you dodge.##\n ",

				--Low Blow--
				["menu_unseen_strike_beta_sc"] = "Low Blow",
				["menu_unseen_strike_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain a #{skill_color}#3%## critical hit chance for every #{skill_color}#2## points of encumbrance under #{skill_color}#30##, up to a maximum of #{skill_color}#30%.##\n\nCritical hits deal #{skill_color}#50%## additional damage.\n\nACE: #{owned}#$pro##\nYou gain a #{skill_color}#3%## critical hit chance for every #{skill_color}#1## point of encumbrance under #{skill_color}#30##, up to a maximum of #{skill_color}#30%.##\n\nYour critical hit chance is increased by an additional #{skill_color}#50%## when attacking enemies from behind with guns or melee.",

		--[[   FUGITIVE   ]]--

			--[[   GUNSLINGER SUBTREE   ]]--
				--Equilibrium--
				["menu_equilibrium_beta_sc"] = "Equilibrium",
				["menu_equilibrium_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou and your crew's weapon stability with #{skill_color}#pistols## is increased by #{skill_color}#2.##\n\nACE: #{owned}#$pro##\n#{skill_color}#Pistols## are drawn and holstered #{skill_color}#100%## faster.",

				--Gun Nut--
				["menu_dance_instructor_sc"] = "Gun Nut",
				["menu_dance_instructor_desc_sc"] = "BASIC: #{owned}#$basic##\nTightens the hipfire accuracy of #{skill_color}#pistols## by #{skill_color}#20%.##\n\nACE: #{owned}#$pro##\n#{skill_color}#Pistols## fire #{skill_color}#15%## faster.\n\n#{skill_color}#Pistols## deal #{skill_color}#100%## of their damage through armor.",

				--Over Pressurized/Gunfighter--
				["menu_gun_fighter_sc"] = "Gunfighter",
				["menu_gun_fighter_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Pistols## reload #{skill_color}#5%## faster.\n\nThe movement penalty to accuracy is reduced by #{skill_color}#40%## for #{skill_color}#pistols.##\n\nThe movement penalty to accuracy is determined by stability.\n\nACE: #{owned}#$pro##\n#{skill_color}#Pistols## reload an additional #{skill_color}#25%## faster.",

				--Akimbo--
				["menu_akimbo_skill_sc"] = "Akimbo",
				["menu_akimbo_skill_desc_sc"] = "BASIC: #{owned}#$basic##\n#{skill_color}#Akimbo## weapons gain #{skill_color}#10## stability.\n\nACE: #{owned}#$pro##\n#{skill_color}#Akimbo## weapons gain #{skill_color}#10## accuracy.",

				--Desperado--
				["menu_expert_handling_sc"] = "Desperado",
				["menu_expert_handling_desc_sc"] = "BASIC: #{owned}#$basic##\nHeadshots with #{skill_color}#pistols## grants them a #{skill_color}#8%## accuracy and range boost for #{skill_color}#4## seconds.\n\nThis effect can stack #{skill_color}#5## times; the duration of each stack is refreshed with each headshot.\n\nACE: #{owned}#$pro##\nIncreases the accuracy and range boost duration by an additional #{skill_color}#4## seconds.",

				--Trigger Happy--
				["menu_trigger_happy_beta_sc"] = "Trigger Happy",
				["menu_trigger_happy_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nHeadshots with #{skill_color}#pistols## grants them a #{skill_color}#5%## damage boost for #{skill_color}#4## seconds.\n\nThis effect can stack #{skill_color}#5## times; the duration of each stack is refreshed with each headshot.\n\nACE: #{owned}#$pro##\nIncreases the damage boost duration by an additional #{skill_color}#4## seconds and the maximum stack count by an additional #{skill_color}#5## more times.",

			--[[   REVENANT SUBTREE   ]]--
				--Running From Death--
				["menu_nine_lives_beta_sc"] = "Running from Death",
				["menu_nine_lives_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou move #{skill_color}#25%## faster for #{skill_color}#10## seconds after reviving.\n\nACE: #{owned}#$pro##\nYou gain a #{skill_color}#20%## damage reduction for #{skill_color}#10## seconds after reviving.\n\nYour weapons are instantly reloaded after reviving.",

				--Undying--
				["menu_running_from_death_beta_sc"] = "Undying",
				["menu_running_from_death_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou gain a #{skill_color}#100%## increase to bleedout health.\n\nACE: #{owned}#$pro##\nYou gain an additional #{skill_color}#100%## increase to bleedout health.\n\nYou may use your primary weapon while in bleedout.",

				--What Doesn't Kill You Only Makes You Stronger--
				["menu_what_doesnt_kill_beta_sc"] = "What Doesn't Kill",
				["menu_what_doesnt_kill_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nIncoming damage is reduced by #{skill_color}#1## point for each down you are closer to custody. \n\nACE: #{owned}#$pro##\nIncoming damage is reduced by an additional #{skill_color}#3## points at all times.",

				--Swan Song
				["menu_perseverance_desc_sc"] = "BASIC: #{owned}#$basic##\nWhen your health reaches #{skill_color}#0##, instead of instantly going down you enter the Swan Song state; you can fight for #{skill_color}#3## seconds with a #{skill_color}#60%## movement speed penalty.\n\n#{risk}#NOTE: Entering the Swan Song state will always end with you going down once it expires.##\n\nACE: #{owned}#$pro##\nYou can fight for an additional #{skill_color}#6## seconds.",

				--Haunt--
				["menu_haunt_sc"] = "Haunt",
				["menu_haunt_desc_sc"] = "BASIC: #{owned}#$basic##\nKilling an enemy within #{skill_color}#18## meters has a #{skill_color}#5%## chance to spread panic in a #{skill_color}#12## meter radius around you for each down you are closer to custody.\n\nPanic makes enemies go into short bursts of uncontrollable fear.\n\nACE: #{owned}#$pro##\nEnemy panic chance is increased by an additional #{skill_color}#15%## at all times.",

				--Messiah--
				["menu_pistol_beta_messiah_sc"] = "Messiah",
				["menu_pistol_beta_messiah_desc_sc"] = "BASIC: #{owned}#$basic##\nWhile in bleedout, killing an enemy will prime a Messiah charge, allowing you to revive yourself by jumping. You have #{skill_color}#1## charge which is replenished when leaving custody.\n\nYou can be downed #{skill_color}#1## more time before going into custody for the first time during a heist.\n\nACE: #{owned}#$pro##\nYou now have infinite Messiah charges, but they have a #{important_1}#120## second cooldown. Kills while downed reduce the cooldown by #{skill_color}#10## seconds.",

			--[[   BRAWLER SUBTREE   ]]--
				--Martial Arts--
				["menu_martial_arts_beta_sc"] = "Martial Arts",
				["menu_martial_arts_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou take #{skill_color}#50%## less damage from all melee attacks, because of training.\n\nACE: #{owned}#$pro##\nThe knockdown rating of your melee strikes are #{skill_color}#100%## greater, because of training.\n\nYour melee weapon's knockdown rating determines when a melee strike will stagger an enemy as well as how much damage is done towards breaking a Bulldozer's armor plates and visor.",

				--Counter-Strike--
				["menu_drop_soap_beta_sc"] = "Counter Strike",
				["menu_drop_soap_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou can now parry cloaker kicks while you have your melee weapon drawn, knocking them down.\n\nYou take #{skill_color}#20%## less damage from cloaker kicks and taser shocks.\n\nACE: #{owned}#$pro##\nRanged damage against you is reduced by #{skill_color}#10%## while charging your melee weapon.\n\nYou take an additional #{skill_color}#30%## less damage from cloaker kicks and taser shocks.",

				--Pumping Iron--
				["menu_steroids_beta_sc"] = "Pumping Iron",
				["menu_steroids_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nYou swing and charge melee weapons #{skill_color}#20%## faster.\n\nACE: #{owned}#$pro##\nYou swing and charge melee weapons an additional #{skill_color}#30%## faster.",

				--Bloodthirst--
				["menu_bloodthirst_sc"] = "Bloodthirst",
				["menu_bloodthirst_desc_sc"] = "BASIC: #{owned}#$basic##\nWhenever you kill an enemy with a melee attack, you will gain a #{skill_color}#25%## increase in reload speed for #{skill_color}#10## seconds.\n\nACE: #{owned}#$pro##\nEvery non-melee kill you get will increase your next melee attack's damage by #{skill_color}#25%##, up to a maximum of #{skill_color}#100%.##\n\nThis effect gets reset when striking an enemy with a melee attack.",

				--Frenzy--
				["menu_wolverine_beta_sc"] = "Frenzy",
				["menu_wolverine_beta_desc_sc"] = "BASIC: #{owned}#$basic##\nHealing is reduced by up to #{important_1}#30%## the closer you are to full health.\n\nDeflection is increased by up to #{skill_color}#20%## the closer you are to getting downed.\n\nDeflection reduces the amount of health damage you take, to a maximum of #{skill_color}#$deflection##, and is applied after other forms of damage reduction.\n\nACE: #{owned}#$pro##\nHealing is instead reduced by up to #{important_1}#75%## while deflection can be increased by up to #{skill_color}#50%.##",

				--Berserker--
				["menu_frenzy_sc"] = "Berserker",
				["menu_frenzy_desc_sc"] = "BASIC: #{owned}#$basic##\nThe lower your health, the more damage you do.\n\nWhen your health is below #{skill_color}#100%##, you will do up to #{skill_color}#100%## more melee and saw damage.\n\nACE: #{owned}#$pro##\nThe lower your health, the more damage you do.\n\nWhen your health is below #{skill_color}#100%##, you will do up to #{skill_color}#50%## more damage with ranged weapons.\n\n#{risk}#NOTE: Does not apply to## #{important_1}#launchers.##"


	})

		local butt = math.rand(1)
		local frame = 0.01
		if Month == "4" and Day == "1" then
			frame = 1
		end
		if registeredloser or not easterless and butt <= frame then
			LocalizationManager:add_localized_strings({	
				["menu_st_spec_23"] = "Helminth",
				["menu_st_spec_23_desc"] = "Who nurtures you in your times of rest? Who restores your battle-torn body, day after day after day? Whose milk enriches your kindred flesh with endless strength and vigor?\n\n\n#{important_1}#It can only be me.##",
				["menu_difficulty_sm_wish"] = "The Steel Path",
				["menu_risk_sm_wish"] = "The Steel Path. For those who have mastered THE CONCLAVE and wish to seek a challenge."
			})
		end

end)

Hooks:Add("LocalizationManagerPostInit", "SC_Localization_Perk_Decks", function(loc)
	LocalizationManager:add_localized_strings({
		["bm_menu_dodge"] = "Dodge",
		["menu_st_category_activated"] = "Activatable",
		["menu_st_category_challenge"] = "Wild Card",
		["menu_st_category_mod"] = "Mod",

		--Shared Perks--
		["menu_deckall_2_desc_sc"] = "Increases your headshot damage by #{skill_color}#25%.##\n\nYou do #{skill_color}#25%## more damage.\n\n#{risk}#NOTE: Damage increase does not apply to## #{important_1}#Throwables or Launchers.##",
		["menu_deckall_4_desc_sc"] = "You gain #{skill_color}#1## mobility.\n\nWhen wearing armor, your movement speed is #{skill_color}#15%## less affected.\n\nYou gain #{skill_color}#45%## more experience when you complete days and jobs.\n\nYou do #{skill_color}#25%## more damage.\n\n#{risk}#NOTE: Damage increase does not apply to## #{important_1}#Throwables or Launchers.##",
		["menu_deckall_6_desc_sc"] = "Unlocks the #{skill_color}#Throwable Case## equipment for you and your crew to use. The Throwable Case can be used to replenish throwables during a heist.\n\nYou do #{skill_color}#25%## more damage.\n\n#{risk}#NOTE: Damage increase does not apply to## #{important_1}#Throwables or Launchers.##",
		["menu_deckall_8_desc_sc"] = "Increases your Doctor Bag interaction speed by #{skill_color}#20%.##\n\nYou do #{skill_color}#25%## more damage.\n\n#{risk}#NOTE: Damage increase does not apply to## #{important_1}#Throwables or Launchers.##",

		--Crook--
		["menu_deck6_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYour armor is increased by ##15%## for ballistic vests.",
		["menu_deck6_3_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.",
		["menu_deck6_5_desc_sc"] = "Your armor is increased by an additional ##15%## for ballistic vests.\n\nYou pick locks ##20%## faster.",
		["menu_deck6_7_desc_sc"] = "Your dodge is increased by an additional ##5## points for ballistic vests.",
		["menu_deck6_9_desc_sc"] = "Your armor is increased by an additional ##20%## for ballistic vests.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Rogue
		["menu_deck4_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYou swap between your weapons ##30%## faster.",
		["menu_deck4_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck4_5_desc_sc"] = "Your dodge meter will be filled to ##200%## of its normal maximum when you are revived.\n\nYour camera loop duration is increased by ##20## seconds.",
		["menu_deck4_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck4_9_desc_sc"] = "Dodging an attack causes you to regenerate ##1## health every second for the next ##5## seconds. This effect can stack but all stacks are lost whenever you take health damage.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Hitman--
		["menu_deck5_1_sc"] = "Gun-fu",
		["menu_deck5_3_sc"] = "Trained Assassin",
		["menu_deck5_5_sc"] = "With a Pencil",
		["menu_deck5_7_sc"] = "Expert Assassin",

		["menu_deck5_1_desc_sc"] = "Killing an enemy outside of melee stores #{skill_color}#25## health. You can store up to #{risk}#75## health.\n\nKilling an enemy in melee turns that stored health into temporary health that decays at a rate of #{important_1}#5## per second.\n\nTemporary health can exceed your normal maximum health, but you can only have up to #{risk}#240## temporary health at once.",
		["menu_deck5_3_desc_sc"] = "Your dodge meter fills up by ##100%## of your dodge when your armor is restored.\n\nYou gain an additional ##5## dodge points.",
		["menu_deck5_5_desc_sc"] = "You store ##60%## more health.\n\nYou carry ##1## additional body bag in your inventory.",
		["menu_deck5_7_desc_sc"] = "You gain ##120## temporary health when you are revived.\n\nYou gain an additional ##5## dodge points.",
		["menu_deck5_9_desc_sc"] = "While you have temporary health, you gain ##10%## deflection and ##20%## additional movement speed.\n\nDeflection reduces the amount of health damage you take, to a maximum of ##60%##, and is applied after other forms of damage reduction.\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Muscle
		["menu_deck2_1_desc_sc"] = "You gain ##10%## more health.",
		["menu_deck2_3_desc_sc"] = "You gain an additional ##10%## more health.\n\nYour dodge is increased by ##5## points.",
		["menu_deck2_5_desc_sc"] = "You gain an additional ##10%## more health.\n\nYou bag corpses and interact with hostages ##75%## faster.",
		["menu_deck2_7_desc_sc"] = "Every shot you fire with your guns has a ##5%## chance to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck2_9_desc_sc"] = "You gain an additional ##10%## more health.\n\nYou gain ##25%## of your maximum health after reviving.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Crew Chief
		["menu_deck1_3_desc_sc"] = "You and your crew's stamina is increased by #{skill_color}#50%.##\n\n#{risk}#NOTE: Crew perks do not stack.##\n\nIncreases your shout distance by #{skill_color}#25%.##\n\nYour dodge is increased by #{skill_color}#5## points.",
		["menu_deck1_5_desc_sc"] = "You gain an additional ##10%## more health.\n\nYour crew gain ##5%## more health.\n\nNOTE: Crew perks do not stack.\n\nYou answer pagers ##25%## faster.",
		["menu_deck1_7_desc_sc"] = "You gain ##10%## more armor.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck1_9_desc_sc"] = "You and your crew gains ##5%## max health and ##10%## stamina for each hostage up to ##4## times.\n\nNOTE: Crew perks do not stack.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		--I only had to put these in to fix Overkill's shitty rebalance attempt--
		--Armorer--
		["menu_deck3_1_desc_sc"] = "You gain ##10%## more armor.",
		["menu_deck3_3_desc_sc"] = "You gain an additional ##10%## more armor.",
		["menu_deck3_5_desc_sc"] = "You gain an additional ##5%## more armor.\n\nYou gain the ability to place ##2## body bag cases.",
		["menu_deck3_7_desc_sc"] = "Your armor recovery rate is increased by ##10%.##",
		["menu_deck3_9_desc_sc"] = "Your armor recovery rate is increased by an additional ##5%.##\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Burglar--
		["menu_deck7_1_desc_sc"] = "Your dodge is increased by ##5## points.\n\nYour dodge meter fills up by ##5%## of your dodge every second while crouching.",
		["menu_deck7_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck7_5_desc_sc"] = "Your dodge meter fills up by an additional ##5%## of your dodge every second while crouching.\n\nYou gain a ##20%## boost in your movement speed when crouching.",
		["menu_deck7_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck7_9_desc_sc"] = "Your armor recovery rate is increased by ##10%.##\n\nDeck completion Bonus: Your chance of getting a higher quality item during PAYDAY is increased by ##10%.##",

		--Gambler--
		["menu_deck10_1_desc_sc"] = "Ammo boxes you pick up also yield medical supplies that heal you for #{skill_color}#3 to 6## health.\n\nHealing has an #{important_1}#8## second cooldown but every ammo box you pick up reduces it by #{skill_color}#1 to 4## seconds.",
		["menu_deck10_3_desc_sc"] = "When you pick up ammo, you trigger an ammo pickup for ##15%## of normal rate to other crew members.\n\nYou gain ##5## dodge points.",
		["menu_deck10_5_desc_sc"] = "Increase health gained from ammo boxes by an additional ##1## point.\n\nWhen you get healed from picking up ammo boxes, your dodge meter is also filled up by ##100%## of your dodge.\n\nYou answer pagers ##25%## faster.",
		["menu_deck10_7_desc_sc"] = "When you get healed from picking up ammo boxes, your teammates also get healed for ##50%## of the amount.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck10_9_desc_sc"] = "Increase health gained from ammo boxes by an additional ##1## point.\n\nWhen you get healed from picking up ammo boxes, you also gain ##30## armor.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		["menu_deck10_7"] = "Dodgy Medicine",
		["menu_deck10_9"] = "Locked-Up Medicine",

		--Infiltrator--
		["menu_deck8_1_desc_sc"] = "When you are within ##12## meters of an enemy, you receive ##5%## less damage from enemies.",
		["menu_deck8_3_desc_sc"] = "When you are within ##12## meters of an enemy, you receive an additional ##5%## less damage from enemies.\n\nYou gain ##5## dodge points.",
		["menu_deck8_5_desc_sc"] = "When you are within ##12## meters of an enemy, you receive an additional ##10%## less damage from enemies.\n\nEach successful melee hit grants an additional ##8%## melee damage boost for ##10## seconds or until you miss; stacks up to ##5## times.\n\nYour camera loop duration is increased by ##20## seconds.",
		["menu_deck8_7_desc_sc"] = "Each successful melee hit grants an additional ##8%## melee damage boost for ##10## seconds or until you miss; stacks up to ##5## times.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck8_9_desc_sc"] = "Each successful melee hit heals ##1## health every second for ##5## seconds, this effect can stack up to ##5## times.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sociopath--
		["menu_deck9_1_sc"] = "No Talk",
		["menu_deck9_1_desc_sc"] = "When you are surrounded by three or more enemies within ##18## meters, you take ##5%## less damage from enemies.",
		["menu_deck9_3_desc_sc"] = "Killing an enemy regenerates #{skill_color}#20## armor.\n\nThis cannot occur more than once every #{important_1}#5## seconds. Each kill during cooldown reduces it by #{skill_color}#0.5## seconds; melee kills reduce it by an additional #{skill_color}#1.5## seconds.\n\nIf a kill clears an active cooldown it will trigger the applicable perks and restart the cooldown.\n\nYou gain #{skill_color}#5## dodge points.",
		["menu_deck9_5_desc_sc"] = "Killing an enemy with a melee weapon regenerates ##2%## health.\n\nThis shares its cooldown with Tension (Card 3).\n\nYou carry ##1## additional body bag in your inventory.",
		["menu_deck9_7_desc_sc"] = "Killing an enemy within ##18## meters regenerates ##15## armor; melee kills double the amount.\n\nThis shares its cooldown with Tension (Card 3).\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck9_9_desc_sc"] = "Killing an enemy within ##18## meters has a ##25%## chance to spread panic among your enemies in a ##12## meter radius around you; melee kills double the chance.\n\nPanic will make enemies go into short bursts of uncontrollable fear.\n\nThis shares its cooldown with Tension (Card 3).\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Grinder--
		["menu_deck11_1_desc_sc"] = "Damaging an enemy heals #{skill_color}#2## health every second for #{skill_color}#3##; stacks up to #{skill_color}#5## times.\nYou can only gain a stack every #{important_1}#0.75## seconds and only while wearing the #{risk}#Flak Jacket.##\nYour Flak Jacket loses #{important_1}#30## armor but gains #{skill_color}#8## mobility.\n\n#{risk}#NOTE: Damaging enemies with sentries or damage over time effects will not grant stacks.##",
		["menu_deck11_3_desc_sc"] = "Stacks heal an additional ##1## health every second.",
		["menu_deck11_5_desc_sc"] = "Stacks last an additional ##2## seconds.\n\nYou gain the ability to place ##2## body bag cases.",
		["menu_deck11_7_desc_sc"] = "Stacks heal an additional ##1## health every second.",
		["menu_deck11_9_desc_sc"] = "Every stack increases your movement speed by ##5%.##\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Open your mind--
		["menu_deck13_1_desc_sc"] = "While your armor is up, you will store ##4## health for every enemy you kill.\n\nWhen your armor starts to regenerate after being completely depleted, you will gain health equal to the stored health amount.\n\nMaximum amount of stored health depends on your equipped armor, with heavier armors being able to store less health than lighter armors.",
		["menu_deck13_3_desc_sc"] = "Increases the amount of health stored from kills by ##2.##\n\nYour dodge is increased by ##5## points.",
		["menu_deck13_5_desc_sc"] = "Increases the maximum health that can be stored by ##25%.##\n\nCivilians intimidated by you and your crew remain intimidated ##25%## longer.",
		["menu_deck13_7_desc_sc"] = "Increases the amount of health stored from kills by ##2.##\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck13_9_desc_sc"] = "Killing an enemy speeds up your armor recovery speed depending on your equipped armor. Heavier armors gain a smaller bonus than lighter armors. This bonus is reset whenever your armor recovers.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--THIS IS WAR BABY--
		["menu_deck14_1_desc_sc"] = "Damage you deal is converted into Hysteria Stacks. Max amount of stacks is ##720.##\n\nHysteria Stacks:\nIncoming damage is reduced by ##1## point for every ##120## stacks of Hysteria. Hysteria Stacks decay by ##120## every ##8## seconds.",
		["menu_deck14_3_desc_sc"] = "Members of your crew also gains the effect of your Hysteria Stacks.\n\nHysteria Stacks from multiple crew members do not stack and only the stacks that give the highest damage absorption will have an effect.\n\nYou gain ##5## dodge points.",
		["menu_deck14_5_desc_sc"] = "Changes the decay of your Hysteria Stacks to ##90## every ##8## seconds.\n\nCivilians intimidated by you and your crew remain intimidated ##25%## longer.",
		["menu_deck14_7_desc_sc"] = "Incoming damage is now reduced by ##1## point for every ##90## stacks of Hysteria.\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck14_9_desc_sc"] = "Hysteria stacks are ##100%## more potent for you.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Anarchist--
		["menu_st_spec_15"] = "Anarchist", --there's a random space at the end of the original string
		["menu_deck15_1_desc_sc"] = "Instead of fully regenerating armor when out of combat, The Anarchist will periodically regenerate armor at a rate equivalent to #{skill_color}#8## armor per second. Heavier armor regenerates more armor per tick but has a longer delay between ticks.\n\n#{risk}#NOTE: Skills and perks that increase the armor recovery rate or have cooldown reductions tied to regenerating armor are disabled when using this perk deck.##",
		["menu_deck15_3_desc_sc"] = "#{risk}#50% of your health## is converted into #{skill_color}#50% armor.##",
		["menu_deck15_5_desc_sc"] = "#{risk}#50% of your health## is converted into #{skill_color}#100% armor.##\n\nCivilians intimidated by you and your crew remain intimidated ##25%## longer.",
		["menu_deck15_7_desc_sc"] = "#{risk}#50% of your health## is converted into #{skill_color}#150% armor.##",
		["menu_deck15_9_desc_sc"] = "#{skill_color}#Dealing damage will grant you armor,## with heavier armor being granted more armor.\nThis can only occur once every #{important_1}#5## seconds.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by #{skill_color}#10%.##",
		["menu_anarc_disable"] = "#{important_1}#(Disabled by Anarchist)##",

		--Scarface--
		["menu_deck17_1_desc_sc"] = "Unlocks the #{skill_color}#Injector## for use in place of a throwable.\n\nActivating the Injector will heal you for #{skill_color}#30%## of all damage taken for #{skill_color}#4## seconds; you can still take damage during the effect.\n\nThe Injector can only be used once every #{important_1}#30## seconds.",
		["menu_deck17_3_desc_sc"] = "Your movement speed is increased by ##20%## while the Injector is active.",
		["menu_deck17_5_desc_sc"] = "You are now healed for ##30%## of all damage taken for ##6## seconds while the Injector is active.\n\nEnemies nearby will prefer targeting you, whenever possible, while the Injector is active.",
		["menu_deck17_7_desc_sc"] = "The amount of health received during the Injector effect is increased by ##60%## while below ##25%## health.",
		["menu_deck17_9_desc_sc"] = "For every ##5## health gained during the Injector effect while at maximum health, the recharge time of the Injector is reduced by ##2## seconds.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--10 feet higher--
		["menu_deck18_1_desc_sc"] = "Unlocks the #{skill_color}#Smoke Bomb## for use in place of a standard throwable.\n\nWhen deployed, the smoke bomb creates a smoke screen that lasts for #{skill_color}#12## seconds. While standing inside the smoke screen, you and your allies regenerate armor #{skill_color}#100%## faster. Any enemies that stand in the smoke will see their accuracy reduced by #{skill_color}#75%.##\n\nThe Smoke Bomb has a #{important_1}#35## second cooldown; killing enemies will reduce this cooldown by #{skill_color}#2## seconds.\n\nYour dodge is increased by #{skill_color}#5## points.",
		["menu_deck18_3_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_5_desc_sc"] = "Dodging an attack reduces the smoke bomb's cooldown by ##1## second.\n\nYou carry ##1## additional body bag in your inventory.",
		["menu_deck18_7_desc_sc"] = "Your dodge is increased by an additional ##5## points.",
		["menu_deck18_9_desc_sc"] = "Your dodge meter fills up by ##40%## of your dodge every second while you are inside of your smoke screen.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Sweet liquor eases the pain--
		["menu_deck19_1_desc_sc"] = "Unlocks the #{skill_color}#Hip Flask## for use in place of a throwable.\n\n#{skill_color}#30%## of the damage taken to your health is applied over #{skill_color}#8## seconds.\n\nUsing the flask immediately negates any damage-over-time.\n\nWhenever damage-over-time is negated, you heal for #{skill_color}#150%## of the remaining damage-over-time.\n\nThe flask has a #{important_1}#30## second cooldown.\n\nLose #{important_1}#50%## of your armor and gain #{skill_color}#50%## more health.",
		["menu_deck19_3_desc_sc"] = "The cooldown of your flask is reduced by ##4## seconds for each enemy you kill.",
		["menu_deck19_5_desc_sc"] = "After not taking damage for ##4## seconds any remaining damage-over-time will be negated.\n\nYou answer pagers ##25%## faster.",
		["menu_deck19_7_desc_sc"] = "When your health is below ##50%##, the cooldown of your flask is reduced by ##6## seconds for each enemy you kill.",
		["menu_deck19_9_desc_sc"] = "You gain ##25%## of your maximum health after reviving.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--it's not a war crime if they're not people--
		["menu_deck20_1_desc_sc"] = "Unlocks the #{skill_color}#Gas Dispenser## for use in place of a throwable.\n\nTo activate the Gas Dispenser you need to directly look at another allied unit within #{skill_color}#18## meters and press the throwable key to tag them.\n\nKills you or the tagged unit make heal you for #{skill_color}#4## health and the tagged unit for #{skill_color}#2## health.\n\nThe effect lasts for #{skill_color}#11## seconds, and has a cooldown of #{important_1}#80## seconds.",
		["menu_deck20_3_desc_sc"] = "Enemies you or the tagged unit kill extend the duration of the gas dispenser by ##2## seconds. This increase is reduced by ##0.2## seconds each time it happens.",
		["menu_deck20_5_desc_sc"] = "Each enemy you or the tagged unit kills reduces damage you take by ##0.5## points up to a maximum of ##8## until the Gas Dispenser's effect and cooldown ends.\n\nYour camera loop duration is increased by ##20## seconds.",
		["menu_deck20_7_desc_sc"] = "Healing from the Gas Dispenser is increased by ##100%.##",
		["menu_deck20_9_desc_sc"] = "Each enemy you kill will reduce the cooldown of the Gas Dispenser by ##2## seconds.\n\nEach enemy the tagged unit kills will reduce the cooldown of the Gas Dispenser by ##2## seconds until you are no longer paired.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Biker--
		["menu_deck16_1_desc_sc"] = "Every time you or your crew performs a kill you will gain #{skill_color}#2## health. This can only occur once every #{important_1}#5## seconds.",
		["menu_deck16_3_desc_sc"] = "You regenerate ##10## armor every ##5## seconds.",
		["menu_deck16_5_desc_sc"] = "Every ##25%## armor missing reduces cooldown to kill regen by ##0.5## seconds.\n\nYou bag corpses and interact with hostages ##75%## faster.",
		["menu_deck16_7_desc_sc"] = "You now regenerate ##20## armor every ##5## seconds.\n\nKilling an enemy with a melee weapon causes the next armor regen tick to occur ##1## second sooner.",
		["menu_deck16_9_desc_sc"] = "Every ##25%## armor missing increases the number of health gained from kills by ##2.##\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Yakuza--
		["menu_deck12_1_desc_sc"] = "The lower your health, the faster your dodge meter will passively fill up.\n\nWhen your health is below ##100%##, your dodge meter fills by up to ##10%## of your dodge every second.\n\nYour dodge is increased by ##5## points.",
		["menu_deck12_3_desc_sc"] = "The lower your health, the more your dodge meter is filled when you kill an enemy.\n\nWhen your health is below ##100%##, your meter fills by up to ##50%## of your dodge.",
		["menu_deck12_5_desc_sc"] = "The lower your health, the less damage you take. When your health is below ##100%##, you will take up to ##20%## less damage.\n\nYou bag corpses and interact with hostages ##75%## faster.",
		["menu_deck12_7_desc_sc"] = "The lower your health, the more your effective your dodge becomes when you kill an enemy using melee.\n\nWhen your health is below ##100%##, melee kills fill your meter by up to ##125%## of your dodge as well as increasing the grace period of your next dodge by up to ##300%##, to a maximum of ##900ms.##\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck12_9_desc_sc"] = "The maximum amount of deflection you can gain is raised to #{skill_color}#80%.##\n\nOnce per down, if you would be downed you instead survive with ##1## health and you regain ##50## armor.\n\n#{risk}#NOTE: This effect does not apply to, nor is it refreshed by, going down by cloaker kicks and taser shocks.##\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by #{skill_color}#10%.##",
		["menu_yakuza_deflection_add"] = "(Boosted by Yakuza)",

		--Hacker--
		["menu_deck21_1_desc_sc"] = "Unlocks the #{skill_color}#Pocket ECM Device## for use in place of a throwable.\n\nThe Pocket ECM has a #{skill_color}#10## second duration.\n\nActivating it before the alarm is raised will trigger the jamming effect, disabling all electronics and pagers.\n\nActivating it after the alarm is raised will trigger its feedback effect with a radius of #{skill_color}#15## meters. The #{skill_color}#first## feedback loop has a #{skill_color}#100%## chance to stun most enemies, with every #{skill_color}#1.2## seconds afterwards having a #{skill_color}#60%## chance to stun.\n\nThe Pocket ECM has an #{important_1}#80## second cooldown timer; each kill you perform will shorten the cooldown timer by #{skill_color}#2.5## seconds.",
		["menu_deck21_3_desc_sc"] = "Your dodge is increased by ##5## points.",
		["menu_deck21_5_desc_sc"] = "Killing an enemy while the feedback effect is active will regenerate ##5## health.",
		["menu_deck21_7_desc_sc"] = "Your armor recovery rate is increased by ##10%.##\n\nYour dodge is increased by an additional ##5## points.",
		["menu_deck21_9_desc_sc"] = "Crew members killing enemies while the feedback effect is active will regenerate ##2.5## health.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",

		--Leech
		["menu_deck22_1_desc_sc"] = "Unlocks the #{skill_color}#Ampule## for use in place of a throwable.\n\nActivating the Ampule it will restore #{skill_color}#5%## of your max health and #{risk}#disable your armor## for #{important_1}#6## seconds.\n\nWhile active, your health is divided into segments of #{skill_color}#10%## with damage removing one segment. Killing #{skill_color}#3## enemies will restore a segment of your health and block damage for #{skill_color}#1## second.\n\nThe Ampule has a #{important_1}#40## second cooldown.",
		["menu_deck22_3_desc_sc"] = "While the Ampule is active, taking damage heals your teammates for #{skill_color}#1%## of their max health.",
		["menu_deck22_5_desc_sc"] = "The Ampule's duration is increased to #{skill_color}#10## seconds and kills reduce its cooldown by #{skill_color}#1## second.\n\nYou bag corpses and interact with hostages #{skill_color}#75%## faster.",
		["menu_deck22_7_desc_sc"] = "While the Ampule is active your health is now divided into segments of #{skill_color}#5%.##",
		["menu_deck22_9_desc_sc"] = "You can activate the Ampule while downed, temporarily reviving you for its duration and adding an additional #{important_1}#30## seconds to its cooldown.\n\nTaking damage now heals teammates by #{skill_color}#2%## of their max health.\n\nDeck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by #{skill_color}#10%.##",

		--CopyCat--
		["menu_st_spec_23"] = "Copycat",
		["menu_deck23_1_desc"] = "Killing #{skill_color}#10## enemies reloads your holstered weapon.\n\n#{risk}#NOTE: Kills are counted separately between weapons and the counter only resets once you trigger a reload for the holstered weapon.##\n\nYou swap between weapons #{skill_color}#15%## faster.",
		["menu_deck23_1_short"] = "Killing #{skill_color}#10## enemies reloads your holstered weapon.\n\nYou swap between weapons #{skill_color}#15%## faster.",
		["menu_deck23_1_1_desc"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_1_1_short"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_1_2_desc"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_1_2_short"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_1_3_desc"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_1_3_short"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_1_4_desc"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",
		["menu_deck23_1_4_short"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",

		["menu_deck23_3_desc"] = "Each headshot you achieve heals you for #{skill_color}#3## health.\n\nThis cannot occur more than once every #{important_1}#5## seconds; cooldown reduction is shared with the #{skill_color}#\"Bullseye\"## skill if active.",
		["menu_deck23_3_short"] = "Each headshot you achieve heals you for #{skill_color}#3## health.\n\nThis cannot occur more than once every #{important_1}#5## seconds; cooldown reduction is shared with the #{skill_color}#\"Bullseye\"## skill if active.",
		["menu_deck23_3_1_desc"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_3_1_short"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_3_2_desc"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_3_2_short"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_3_3_desc"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_3_3_short"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_3_4_desc"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",
		["menu_deck23_3_4_short"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",

		["menu_deck23_5_desc"] = "Dodged bullets will ricochet back to the enemy that fired them.\n\nBullets that break your armor will ricochet back to the enemy that fired them for #{skill_color}#100%## more damage.\n\nArmor break ricochets have a #{important_1}#15## second cooldown.",
		["menu_deck23_5_short"] = "Dodged bullets will ricochet back to the enemy that fired them.\n\nBullets that break your armor will ricochet back to the enemy that fired them for #{skill_color}#100%## more damage.\n\nArmor break ricochets have a #{important_1}#15## second cooldown.",
		["menu_deck23_5_1_desc"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_5_1_short"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_5_2_desc"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_5_2_short"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_5_3_desc"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_5_3_short"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_5_4_desc"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",
		["menu_deck23_5_4_short"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",

		["menu_deck23_7_desc"] = "When your health drops below #{skill_color}#50%## you will be immune to health damage for #{skill_color}#2## seconds.\n\nThis cannot occur more than once every #{important_1}#90## seconds.",
		["menu_deck23_7_short"] = "When your health drops below #{skill_color}#50%## you will be immune to health damage for #{skill_color}#2## seconds.\n\nThis cannot occur more than once every #{important_1}#90## seconds.",
		["menu_deck23_7_1_desc"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_7_1_short"] = "You gain #{skill_color}#5%## more health.",
		["menu_deck23_7_2_desc"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_7_2_short"] = "You gain #{skill_color}#3.75%## more armor.",
		["menu_deck23_7_3_desc"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_7_3_short"] = "Your dodge is increased by #{skill_color}#1.25## points.",
		["menu_deck23_7_4_desc"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",
		["menu_deck23_7_4_short"] = "Your crouched and carry movement speeds are #{skill_color}#5%## faster.",
		--Final Card
			--Crew Chief
			["menu_deck1_mrwi_desc"] = "Increases your shout distance by ##25%.##\n\nYou and your crew's stamina is increased by ##50%.##\n\nNOTE: Crew perks do not stack.\n\nYou answer pagers ##25%## faster.",
			--Muscle
			["menu_deck2_mrwi_desc"] = "Every shot you fire with your guns has a ##5%## chance to spread panic among your enemies.\n\nPanic will make enemies go into short bursts of uncontrollable fear.\n\nYou bag corpses and interact with hostages ##75%## faster.",
			--Armorer
			["menu_deck3_mrwi_desc"] = "Your armor recovery rate is increased by ##10%.##\n\nYou gain the ability to place ##2## body bag cases.",
			--Rouge
			["menu_deck4_mrwi_desc"] = "Your dodge is increased by an additonal ##5## points.\n\nYou swap between your weapons an additional ##30%## faster.\n\nYour camera loop duration is increased by ##20## seconds.",
			--Hitman
			["menu_deck5_mrwi_desc"] = "Killing an enemy outside of melee stores #{skill_color}#25## health. You can store up to #{risk}#75## health.\n\nKilling an enemy in melee turns that stored health into temporary health that decays at a rate of #{important_1}#5## per second.\n\nTemporary health can exceed your normal maximum health, but you can only have up to #{risk}#240## temporary health at once.\n\nYou carry #{skill_color}#1## additional body bag in your inventory.",
			--Crook
			["menu_deck6_mrwi_desc"] = "Your dodge is increased by an additonal ##5## points for ballistic vests.\n\nYour armor is increased by an additional ##15%## for ballistic vests.\n\nYou pick locks ##20%## faster.",
			--Burglar
			["menu_deck7_mrwi_desc"] = "Your dodge is increased by an additonal ##5## points.\n\nYour dodge meter fills up by ##5%## of your dodge every second while crouching.\n\nYou gain a ##20%## boost in your movement speed when crouching.",
			--Infiltrator
			["menu_deck8_mrwi_desc"] = "When you are within ##12## meters of an enemy, you recieve ##10%## less damage from enemies.\n\nEach successful melee hit grants an additional ##8%## melee damage boost for ##5## seconds or until you miss; stacks up to ##5## times.\n\nYour camera loop duration is increased by ##20## seconds.",
			--Sociopath
			["menu_deck9_mrwi_desc"] = "Killing an enemy regenerates #{skill_color}#20## armor.\n\nKilling an enemy within #{skill_color}#18## meters regenerates an additional #{skill_color}#15## armor.\n\nThis cannot occur more than once every #{important_1}#5## seconds. Each kill during cooldown reduces it by #{skill_color}#0.5## seconds; melee kills reduce it by an additional #{skill_color}#1.5## seconds.\n\nIf a kill clears an active cooldown it will trigger the applicable perks and restart the cooldown.\n\nYou carry #{skill_color}#1## additional body bag in your inventory.",
			--Gambler
			["menu_deck10_mrwi_desc"] = "Ammo boxes you pick up also yield medical supplies that heal you for ##2 to 5## health.\n\nHealing has a ##10## second cooldown, but every ammo box you pick up reduces it by ##1 to 4## seconds.\n\nWhen you pick up ammo, you trigger an ammo pickup for ##15%## of normal rate to other crew members.\n\nYou answer pagers ##25%## faster.",
			--Grinder
			["menu_deck11_mrwi_desc"] = "Damaging an enemy heals #{skill_color}#2## health every second for #{skill_color}#3## seconds; stacks up to #{skill_color}#5## times.\nYou can only gain a stack every #{important_1}#0.75## seconds and only while wearing the #{risk}#Flak Jacket.##\nYour Flak Jacket loses #{important_1}#30## armor but gains #{skill_color}#8## mobility.\n\n#{risk}#NOTE: Damaging enemies with sentries or damage over time effects will not grant stacks.##\n\nYou gain the ability to place #{skill_color}#2## body bag cases.",
			--Yakuza
			["menu_deck12_mrwi_desc"] = "The lower your health, the more your dodge meter is filled when you kill an enemy.\n\nWhen your health is below ##100%##, your meter fills by up to ##50%## of your dodge.\n\nYou bag corpses and interact with hostages ##75%## faster.",
			--Ex-Pres
			["menu_deck13_mrwi_desc"] = "While your armor is up, you will store ##4## health for every enemy you kill.\n\nWhen your armor starts to regenerate after being completely depleted, you will gain health equal to the stored health amount.\n\nMaximum amount of stored health depends on your equipped armor, with heavier armors being able to store less health than lighter armors.\n\nCivilians intimidated by you and your crew remain intimidated ##25%## longer.",
			--Maniac
			["menu_deck14_mrwi_desc"] = "Damage you deal is converted into Hysteria Stacks. Max amount of stacks is ##720.##\n\nHysteria Stacks:\nIncoming damage is reduced by ##1## point for every ##120## stacks of Hysteria. Hysteria Stacks decay by ##120## every ##8## seconds.\n\nCivilians intimidated by you and your crew remain intimidated ##25%## longer.",
			--Anarchist
			["menu_deck15_mrwi_desc"] = "Instead of fully regenerating armor when out of combat, The Anarchist will periodically regenerate armor at a rate equivalent to ##8## armor per second. Heavier armor regenerates more armor per tick, but has a longer delay between ticks.\n\nNOTE: Skills and perks that increase the armor recovery rate are disabled when using this perk deck.\n\nCivilians intimidated by you and your crew remain intimidated ##25%## longer.",
			--Biker
			["menu_deck16_mrwi_desc"] = "Every time you or your crew kill an enemy you will gain #{skill_color}#2## health. This can only occur once every #{important_1}#5## seconds.\n\nYou bag corpses and interact with hostages #{skill_color}#75%## faster.",
			--Kingpin
			["menu_deck17_mrwi_desc"] = "Unlocks the #{skill_color}#Injector## for use in place of a throwable.\n\nActivating the Injector will heal you for #{skill_color}#20%## of all damage taken for #{skill_color}#4## seconds.\n\nYou can still take damage during the effect.\n\nYour movement speed is increased by #{skill_color}#20%## while the Injector is active.\n\nThe Injector can only be used once every #{important_1}#30## seconds.",
			--Sicario
			["menu_deck18_mrwi_desc"] = "Unlocks the #{skill_color}#Smoke Bomb## for use in place of a standard throwable.\n\nWhen deployed, the smoke bomb creates a smoke screen that lasts for #{skill_color}#12## seconds. While standing inside the smoke screen, you and your allies regenerate armor #{skill_color}#100%## faster. Any enemies that stand in the smoke will see their accuracy reduced by #{skill_color}#75%.##\n\nThe Smoke Bomb has a #{important_1}#35## second cooldown, but killing enemies will reduce this cooldown by #{skill_color}#1## second.\n\nYour dodge is increased by an additonal #{skill_color}#5## points.\n\nYou carry #{skill_color}#1## additional body bag in your inventory.",
			--Stoic
			["menu_deck19_mrwi_desc"] = "Unlocks the #{skill_color}#Hip Flask## for use in place of a throwable.\n\n#{skill_color}#20%## of the damage taken to your health is applied over #{skill_color}#5## seconds.\n\nUsing the flask immediately negates any damage-over-time.\n\nWhenever damage-over-time is negated, you heal for #{skill_color}#150%## of the remaining damage-over-time.\n\nThe flask has a #{important_1}#30## second cooldown.\n\nLose #{important_1}#50%## of your armor and gain #{skill_color}#50%## more health.\n\nYou answer pagers #{skill_color}#25%## faster.",
			--Tag Team
			["menu_deck20_mrwi_desc"] = "Unlocks the #{skill_color}#Gas Dispenser## for use in place of a throwable.\n\nTo activate the Gas Dispenser you need to directly look at another allied unit within #{skill_color}#18## meters and press the throwable key to tag them.\n\nKills you or the tagged unit make heal you for #{skill_color}#4## health and the tagged unit for #{skill_color}#2## health.\n\nThe effect lasts for #{skill_color}#11## seconds  and has a cooldown of #{important_1}#80## seconds.\n\nYour camera loop duration is increased by #{skill_color}#20## seconds.",
			--Hacker
			["menu_deck21_mrwi_desc"] = "Unlocks the #{skill_color}#Pocket ECM Device## for use in place of a throwable.\n\nActivating the Pocket ECM Device before the alarm is raised will trigger the jamming effect, disabling all electronics and pagers for a #{skill_color}#10## second duration.\n\nActivating the Pocket ECM Device after the alarm is raised will trigger the feedback effect, lasting #{skill_color}#10## seconds with a radius of #{skill_color}#15## meters. The #{skill_color}#first## feedback loop has a #{skill_color}#100%## chance to stun most enemies, with every #{skill_color}#1.2## seconds afterwards having a #{skill_color}#60%## chance to stun.\n\nThe Pocket ECM Device has an #{important_1}#80## second cooldown timer, but each kill you perform will shorten the cooldown timer by #{skill_color}#2.5## seconds.",
			--Leech
			["menu_deck22_mrwi_desc"] = "Unlocks the #{skill_color}#Ampule## for use in place of a throwable.\n\nActivating the Ampule it will restore #{skill_color}#2.5%## of your maximum health and #{risk}#disable your armor## for #{important_1}#6## seconds.\n\nWhile active, your health is divided into segments of #{skill_color}#10%## with damage removing one segment. Killing #{skill_color}#3## enemies will restore a segment of your health and block damage for #{skill_color}#1## second.\n\nThe Ampule has a #{important_1}#40## second cooldown.\n\nYou bag corpses and interact with hostages #{skill_color}#75%## faster.",

		["menu_deck23_9_desc"] = "Deck Completion Bonus: Your chance of getting a higher quality item during a PAYDAY is increased by #{skill_color}#10%.##",

		--Blank Perk Deck--
		["menu_st_spec_0"] = "Tabula Rasa",
		["menu_st_spec_0_desc"] = "It is hypothesized that human beings are born without inherent ideas, thoughts, or ideologies and that these are all learned behaviors from various experiences. In some ways this can cause one to have great difficulty, in other ways this can be seen as an advantage. The Tabula Rasa perk deck offers benefits that may not seem obvious at first and even detrimental, but a greater challenge can sometimes bring about other rewards.",
		["menu_st_spec_0_desc_short"] = "It is hypothesized that human beings are born without inherent ideas, thoughts, or ideologies and that these are all learned behaviors from various experiences. In some ways this can cause one to have great difficulty, in other ways this can be seen as an advantage. The Tabula Rasa perk deck offers benefits that may not seem obvious at first and even detrimental, but a greater challenge can sometimes bring about other rewards.",
		["menu_deck0_1"] = "Inside Man",
		["menu_deck0_1_desc"] = "Your purchased items on the Black Market and Assets for use in heists cost ##30%## less.",		
		["menu_deck0_2"] = "Black Marketeer",
		["menu_deck0_2_desc"] = "Your purchased items on the Black Market and Assets for use in heists cost an additional ##30%## less.",				
		["menu_deck0_3"] = "Dead Presidents",
		["menu_deck0_3_desc"] = "You gain ##15%## more value to loose items that you pick up.",		
		["menu_deck0_4"] = "Veteran's Day",
		["menu_deck0_4_desc"] = "You gain an additional ##15%## more value to loose items that you pick up.",	
		["menu_deck0_5"] = "Noob Lube",
		["menu_deck0_5_desc"] = "You gain ##45%## more experience when you complete days and jobs.",	
		["menu_deck0_6"] = "Fast Learner",
		["menu_deck0_6_desc"] = "You gain an additional ##45%## more experience when you complete days and jobs.",		
		["menu_deck0_7"] = "Mister Doctor Fantastic",
		["menu_deck0_7_desc"] = "You gain an additional ##45%## more experience when you complete days and jobs.",			
		["menu_deck0_8"] = "Four Leaf Clover",
		["menu_deck0_8_desc"] = "Your chance of getting a higher quality item during a PAYDAY is increased by ##10%.##",
		["menu_deck0_9"] = "Lucky Charm",
		["menu_deck0_9_desc"] = "Your chance of getting a higher quality item during a PAYDAY is increased by an additional ##20%.##",		
		
		["menu_st_spec_00"] = "Innatae",
		["menu_st_spec_00_desc"] = "Some others would argue that the mind has inherent instincts and knowledge, that people are indeed not a blank canvas. The Innatae has the basic abilities that every good bank robber should be expected to have, leaving only room for personal gains to be had. Such convictions, like anything, have a toll on oneself. Is this the cost of giving in to our own primal instincts?",
		["menu_st_spec_00_desc_short"] = "Some others would argue that the mind has inherent instincts and knowledge, that people are indeed not a blank canvas. The Innatae has the basic abilities that every good bank robber should be expected to have, leaving only room for personal gains to be had. Such convictions, like anything, have a toll on oneself. Is this the cost of giving in to our own primal instincts?",
		["menu_deck00_9_desc"] = "Your chance of getting a higher quality item during a PAYDAY is increased by ##20%.##",
		
		["rpd_menu_button"] = "Reset perk deck",
		["rpd_menu_dialog_title"] = "Are you sure?",
		["rpd_menu_dialog_text"] = "If you reset the $perk_deck_name perk deck, you will get back $points_to_refund perk points.",


		--Strings for Lobby Player Info
		["menu_st_spec_24"] = "Tabula Rasa",
		["menu_st_spec_25"] = "Innatae",
		--MOD PERK DECKS
			--OFFYERROCKER'S MERCENARY PERK DECK
				["menu_deck_kmerc_1_desc_sc"] = "Take greatly reduced damage from heavy hits to your health so that no single attack can kill you.\n\nYou gain ##5%## more health.",
				["menu_deck_kmerc_3_desc_sc"] = "You gain ##1%## reload speed and ##2%## weapon swap speed for every ##4## points armor you have.\n\nYou gain ##5%## more armor.",	
				["menu_deck_kmerc_5_desc_sc"] = "When your health would become ##0##, it becomes ##1## instead and you gain ##2## seconds of invulnerability.\nYou cannot sprint while under the effects of this invulnerability.\nThis effect cannot occur again until you are restored to full health.\n\nYou gain an additional ##5%## more health.",
				["menu_deck_kmerc_7_desc_sc"] = "After having armor for at least ##2## seconds, heal health equal to ##1%## of your max armor every ##5## seconds so long as you have armor.",
				["menu_deck_kmerc_9_desc_sc"] = "Whenever you take damage to your health that leaves you at ##30%## health or less, regain ##50%## of that damage as armor.\nThis cannot occur more than once every ##1## second or from the same hit that triggers Walk It Off's (Card 5) invulnerability.",

			--OFFYERROCKER'S LIBERATOR PERK DECK
				["menu_deck_liberator_1_desc_sc"] = "Unlocks the ##Survival Syringe## for use in place of a throwable. Using the Survival Syringe will immediately restore ##15## stamina and restore ##0.5## points of health every second for ##4## seconds or until the player takes health damage.\nThe Survival Syringe has ##1## charge with a cooldown of ##30## seconds; each kill you perform will reduce the cooldown by ##1## second.",
				["menu_deck_liberator_3_desc_sc"] = "The health regen from the Survival Syringe now lasts for an additional ##2## seconds.\n\nWhen health regen from Survival Syringe is canceled, gain ##10%## damage resistance for the remaining time.",
				["menu_deck_liberator_5_desc_sc"] = "The Survival Syringe restores an additional ##15## stamina and restores an additional ##0.5## points of health every second.\n\nYour dodge is increased by ##5## points.",
				["menu_deck_liberator_7_desc_sc"] = "Your health is increased by ##10%##.\n\nThe health regen from Survival Syringe now lasts for an additional ##2## seconds.",
				["menu_deck_liberator_9_desc_sc"] = "The Survival Syringe now restores an additional ##1## point of health every second."

	})
end)
