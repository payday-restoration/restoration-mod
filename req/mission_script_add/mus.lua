local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local death_wish_above = difficulty >= 7
local cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local get_hiding_cloaker_so_opts = restoration.get_hiding_cloaker_so_opts

-- Without serious crowd control like multiple ECM feedback loops, it's suicidal to try and get all loot
-- Team AI are excluded from PONR duration calculation
local ponr_value = (difficulty <= 5 and 750 or (difficulty == 6 or difficulty == 7) and 750) or 750
local ponr_timer_player_mul = {
	1,
	0.9,
	0.8,
	0.7,  -- 4+ players
}
local opts_pro_job_ponr = {
	elements = { 100247, },
	elements_in_instances = {
		["mus_helicopter_001"] = { 100016, },
	},
	trigger_times = 1,
	time_balance_mul_include_team_ai = false,
	time_balance_mul = ponr_timer_player_mul,
	time_easy = ponr_value,
	time_normal = ponr_value,
	time_hard = ponr_value,
	time_overkill = ponr_value,
	time_overkill_145 = ponr_value,
	time_easy_wish = ponr_value,
	time_overkill_290 = ponr_value,
	time_sm_wish = ponr_value,
	enabled = pro_job,
}

local opts_pro_job_ponr_counter = {
	enabled = true,
	counter_target = 2,
	on_executed = {
		{ id = 400001, delay = 0, },
	},
}

local optsBesiegeDummyCloaker_1 = { -- (beseiege stuff)
	trigger_times = 0,
	enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_swing_dwn_7m_window",
	enabled = true,
}
local optsBesiegeDummyCloaker_2 = { -- (beseiege stuff)
	trigger_times = 0,
	enemy = cloaker,
	participate_to_group_ai = true,
	spawn_action = "e_sp_down_6m",
	enabled = true,
}
local optsPreferedCloakerAdd1 = {
	spawn_groups = {400019 , 400020,  400021,  400022, 400023, 400024, 400025  }, -- spawngroup 
	on_executed = {
		{ id = 400027, delay = 0 }, -- so group 
	},
	enabled = true,
}
local optsAddCloakerHideGroup = { -- needed for mission script 
	enabled = true,
	on_executed = {
		{ id = 400026, delay = 0 }, -- preferedadd 
	},
}
local optsCloakerHideGroup = { -- hide SOs
	followup_elements = {
		400006,
		400007,
		400008,
		400009,
		400010,
		400011,
		400029,
	},
}
-- Sneaky bastards
local hide_so_search_pos = Vector3(1189, -1632, -300)
local optsCloaker_Hide_SpotSO_1 = get_hiding_cloaker_so_opts("e_so_sneak_wait_stand", hide_so_search_pos)
local optsCloaker_Hide_SpotSO_2 = get_hiding_cloaker_so_opts("e_so_sneak_wait_crh", hide_so_search_pos)
local optsCloaker_Hide_SpotSO_3 = get_hiding_cloaker_so_opts("e_so_sneak_wait_crh_var3", hide_so_search_pos)

local optsCloaker_Hide_SO = {
	SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "e_so_hide_behind_door_enter",
}
local optsCloaker_01 = {
    enabled = false,
    enemy = cloaker,
    on_executed = {
        { id = 400003, delay = 0}
    },
}
local opts_enable_cloaker_diamond = {
	enabled = death_wish_above,
	elements = { 400004, },
	toggle = "on",
}

return {
	elements = {
		-- PONR 
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
		restoration:gen_counter(400002, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		-- Cloaker in the diamond room 
		restoration:gen_so(400003, "diamond_room_hider", Vector3(6132, 356, -598.295), Rotation(103, -0, -0), optsCloaker_Hide_SO),
		restoration:gen_dummy(400004, "clokaer_diamond", Vector3(6092, 460, -598.397), Rotation(131, 0, -0), optsCloaker_01),
		restoration:gen_toggleelement(400005, "enable_diamond_cloaker", opts_enable_cloaker_diamond),
		-- Cloaker hiders
		-- hiders 
		restoration:gen_so(400006, "cloaker_so_1", Vector3(1506, 222, -350),  Rotation(171, 0, -0), optsCloaker_Hide_SpotSO_3),
		restoration:gen_so(400007, "claoker_so_2", Vector3(663, -2755, -300),  Rotation(173, 0, -0), optsCloaker_Hide_SpotSO_3),
		restoration:gen_so(400008, "cloaker_so_3", Vector3(-1611, 216, -350), Rotation(171, 0, -0), optsCloaker_Hide_SpotSO_3),

		restoration:gen_so(400009, "cloaker_so_4", Vector3(-2258, -284, -1200),  Rotation(87, -0, -0),  optsCloaker_Hide_SpotSO_2),
		restoration:gen_so(400010, "cloaker_so_5", Vector3(-163, 3162, -300), Rotation(91, -0, -0), optsCloaker_Hide_SpotSO_3),
		restoration:gen_so(400011, "cloaker_so_6",Vector3(-2445, -1931, -300), Rotation(-5, 0, -0), optsCloaker_Hide_SpotSO_3),
		restoration:gen_so(400029, "cloaker_so_7", Vector3(-2836.89, -1409.8, -800.004), Rotation(179, 0, -0), optsCloaker_Hide_SpotSO_1),
		-- the spooks themselves
		restoration:gen_dummy(400012, "spook_01", Vector3(-69, 2013, -300), Rotation(-178, 0, -0), optsBesiegeDummyCloaker_2),
		restoration:gen_dummy(400013, "spook_02", Vector3(-49, 2902, -300), Rotation(-24, 0, 0), optsBesiegeDummyCloaker_2),

		restoration:gen_dummy(400014, "spook_03", Vector3(2011, 1618, -300), Rotation(-89, 0, -0), optsBesiegeDummyCloaker_2),
		restoration:gen_dummy(400015, "spook_04", Vector3(1969, -1392, -300), Rotation(-89, 0, -0), optsBesiegeDummyCloaker_2),
		
		restoration:gen_dummy(400016, "spook_05", Vector3(653, -3761, -500), Rotation(0, 0, -0), optsBesiegeDummyCloaker_1),
		restoration:gen_dummy(400017, "spook_06", Vector3(-566, 4160, -500), Rotation(-179, 0, -0), optsBesiegeDummyCloaker_1),
		restoration:gen_dummy(400018, "spook_07", Vector3(32, -1711, -300), Rotation(-89, 0, -0), optsBesiegeDummyCloaker_2),
		-- spawwngroups 
		restoration:gen_spawngroup(400019, "mus_spook_spawngroup_01", { 400012 }, 0),
		restoration:gen_spawngroup(400020, "mus_spook_spawngroup_02", { 400013 }, 0),

		restoration:gen_spawngroup(400021, "mus_spook_spawngroup_03", { 400014 }, 0),
		restoration:gen_spawngroup(400022, "mus_spook_spawngroup_04", { 400015 }, 0),

		restoration:gen_spawngroup(400023, "mus_spook_spawngroup_05", { 400016 }, 0),
		restoration:gen_spawngroup(400024, "mus_spook_spawngroup_06", { 400017 }, 0),
		restoration:gen_spawngroup(400025, "mus_spook_spawngroup_07", { 400018 }, 0),
		-- the hider system 
		restoration:gen_preferedadd(400026, "mus_spook_spawns", optsPreferedCloakerAdd1),
		restoration:gen_sogroup(400027, "mus_spook_spawngroup", hide_so_search_pos, Rotation(0, 0, 0), optsCloakerHideGroup),
		restoration:gen_missionscript(400028, "mus_spook_spawn_global", optsAddCloakerHideGroup),

	},
}
