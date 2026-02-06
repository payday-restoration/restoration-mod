local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull =   ((difficulty >= 8) and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc" or "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")
local surprise_cloaker = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/payday2/characters/ene_spook_1/ene_spook_1")
local shields =  ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield")
local sniper =  ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper" or "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3")
local gunner = ((difficulty >=8) and "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg" or "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
local death_wish_above = difficulty >= 7


local ponr_value_limo = 1500 - (difficulty * 10)
local ponr_timer_player_mul_limo = {
	1.2,
	1,
	0.8,
	0.6,  -- 4+ players
}
local opts_pro_job_ponr_limo = {
	elements_in_instances = {
		["storage_room"] = { 100028, },
		["drill_bottom"] = { 100319, },
		-- ["drill_top"] = { 100319, },  -- Instance point, not needed (?)
		["limo_escape"] = { 100049, 100008, },
	},
	trigger_times = 1,
	difficulty_add = 0.3,
	min_difficulty = 0.7,
	bravos_difficulty_threshold = 1,
	bravos_timer = 40,
	time_balance_mul_include_team_ai = false,
	time_balance_mul = ponr_timer_player_mul_limo,
	time_easy = ponr_value_limo,
	time_normal = ponr_value_limo,
	time_hard = ponr_value_limo,
	time_overkill = ponr_value_limo,
	time_overkill_145 = ponr_value_limo,
	time_easy_wish = ponr_value_limo,
	time_overkill_290 = ponr_value_limo,
	time_sm_wish = ponr_value_limo,
	enabled = pro_job,
}

local ponr_value_bfd = 1200 - (difficulty * 10)
local ponr_timer_player_mul_bfd = ponr_timer_player_mul_limo
local opts_pro_job_ponr_bfd = table.map_append({}, opts_pro_job_ponr_limo, {
	time_balance_mul = ponr_timer_player_mul_bfd,
	time_easy = ponr_value_bfd,
	time_normal = ponr_value_bfd,
	time_hard = ponr_value_bfd,
	time_overkill = ponr_value_bfd,
	time_overkill_145 = ponr_value_bfd,
	time_easy_wish = ponr_value_bfd,
	time_overkill_290 = ponr_value_bfd,
	time_sm_wish = ponr_value_bfd,
	enabled = false,
})

local ponr_value_van = 900 - (difficulty * 10)
local ponr_timer_player_mul_van = ponr_timer_player_mul_limo
local opts_pro_job_ponr_van = table.map_append({}, opts_pro_job_ponr_limo, {
	time_balance_mul = ponr_timer_player_mul_van,
	time_easy = ponr_value_van,
	time_normal = ponr_value_van,
	time_hard = ponr_value_van,
	time_overkill = ponr_value_van,
	time_overkill_145 = ponr_value_van,
	time_easy_wish = ponr_value_van,
	time_overkill_290 = ponr_value_van,
	time_sm_wish = ponr_value_van,
	enabled = false,
})

local opts_pro_job_ponr_counter = {
	enabled = true,
	counter_target = 2,
	on_executed = {
		{ id = 400001, delay = 0, },
		{ id = 400002, delay = 0, },
		{ id = 400003, delay = 0, },
	},
}

local opts_enable_ponr_bfd = {
	enabled = pro_job,
	toggle = "on",
	elements = {
		400002,
	},
}
local opts_enable_ponr_van = {
	enabled = pro_job,
	toggle = "on",
	elements = {
		400003,
	},
}
local opts_disable_ponrs = {
	enabled = true,
	toggle = "off",
	elements = {
		400001,
		400002,
		400003,
	},
}

local optsDefend_SO = {
	SO_access = tostring (2048 + 4096 + 512 + 128),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_sniper",
}
local opts_dozer = {
	spawn_action = "e_sp_down_6m",
	enabled = false,
	enemy = tank_skull,
	on_executed = {
		{id = 400027, delay = 0,},
	},
}
local optsShield_01 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400010,  delay = 0, },
	},
}
local optsShield_02 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400011,  delay = 0, },
	},
}
local optsShield_03 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id = 400016,  delay = 0, },
	},
}
local optsShield_04 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400017,  delay = 0, },
	},
}
local optsShield_05 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400018,  delay = 0, },
	},
}
local optsShield_06 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400019,  delay = 0, },
	},
}
local opts_sniper = {
	spawn_action = "e_sp_over_1m_dwn_8m_swing",
	enabled = false,
	enemy = sniper,
	on_executed = {
		{id = 400021, delay = 0, },
	},
}
local opts_gunner_01 = {
	spawn_action = "e_sp_over_1m_dwn_8m_swing",
	enabled = false,
	enemy = gunner,
	on_executed = {
		{id = 400024, delay = 0, },
	},
}
local opts_gunner_02 = {
	spawn_action = "e_sp_over_1m_dwn_8m_swing",
	enabled = false,
	enemy = gunner,
	on_executed = {
		{id = 400025, delay = 0, },
	},
}
local opts_cloaker_surprise_01 = {
	enemy = surprise_cloaker,
	enabled = false,
	on_executed = {
		{id = 400029, delay = 0,},
	},

}
local opts_cloaker_surprise_02 = {
	enemy = surprise_cloaker,
	enabled = false,
	on_executed = {
		{id = 400031, delay = 0,},
	},

}
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_idle_by_container"
}
local optsCloaker_Hide_SO_2 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interrupt_dis = 4,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_hide_ledge_enter"
}
local opts_enable_fwb_inspired_vault_ambush = {
	enabled = death_wish_above,
	elements = { 400008, 400009, 400012, 400013, 400014, 400015, 400020, 400022, 400023, 400026, 400028,  400030}, 
	toggle = "on",
}
return {
	elements = {
		-- PONR 
		restoration:gen_pointofnoreturn(400001, "pro_job_ponr_limo", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_limo),
		restoration:gen_pointofnoreturn(400002, "pro_job_ponr_bfd", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_bfd),

		restoration:gen_pointofnoreturn(400003, "pro_job_ponr_van", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_van),
		restoration:gen_toggleelement(400004, "enable_ponr_bfd", opts_enable_ponr_bfd),

		restoration:gen_toggleelement(400005, "enable_ponr_van", opts_enable_ponr_van),
		restoration:gen_counter(400006, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),

		restoration:gen_toggleelement(400007, "disable_ponrs", opts_disable_ponrs),
		-- FWB styled vault ambush 
		-- Shields (down and upstairs)
		restoration:gen_dummy(400008, "shield_upstairs_01", Vector3(-233, 925, 100), Rotation(180, 0, -0), optsShield_01),
		restoration:gen_dummy(400009, "shield_upstairs_02",Vector3(-129, 923, 100), Rotation(180, 0, -0), optsShield_02), 

		restoration:gen_so(400010, "upstair_so_defend_01", Vector3(-233, 925, 100), Rotation(180, 0, -0), optsDefend_SO),
		restoration:gen_so(400011, "upstair_so_defend_02", Vector3(-129, 923, 100), Rotation(-169, 0, -0), optsDefend_SO), 
		-- Shields again (downstairs near vault)
		restoration:gen_dummy(400012, "shield_downstairs_03", Vector3(200, -100, -499.5), Rotation(175, 0, -0), optsShield_03),
		restoration:gen_dummy(400013, "shield_downstairs_04", Vector3(299.985, -98.255, -499.5), Rotation(-176, 0, -0), optsShield_04),
		restoration:gen_dummy(400014, "shield_downstairs_05", Vector3(400, -100, -499.5), Rotation(179, 0, -0), optsShield_05),
		restoration:gen_dummy(400015, "shield_downstairs_06", Vector3(476, -92, -499.5), Rotation(179, 0, -0), optsShield_06),

		restoration:gen_so(400016, "downstairs_so_defend_03", Vector3(200, -100, -499.5), Rotation(175, 0, -0), optsDefend_SO),
		restoration:gen_so(400017, "downstairs_so_defend_04", Vector3(299.985, -98.255, -499.5), Rotation(-176, 0, -0), optsDefend_SO),
		restoration:gen_so(400018, "downstairs_so_defend_05", Vector3(400, -100, -499.5), Rotation(179, 0, -0), optsDefend_SO),
		restoration:gen_so(400019, "downstairs_so_defend_06", Vector3(476, -92, -499.5), Rotation(179, 0, -0), optsDefend_SO),
		-- Snipers n Gunners 
		restoration:gen_dummy(400020, "vault_sniper", Vector3(42, 188, -499.5), Rotation(-174, 0, -0), opts_sniper), 
		restoration:gen_so(400021, "sniper_so", Vector3(-100, -100, -499.5), Rotation(-174, 0, -0), optsDefend_SO),

		restoration:gen_dummy(400022, "gunner_vault_01", Vector3(-1, 218, -499.5), Rotation(-174, 0, -0), opts_gunner_01), 
		restoration:gen_dummy(400023, "gunner_vault_02", Vector3(68, 228, -499.5), Rotation(-174, 0, -0), opts_gunner_02),

		restoration:gen_so(400024, "gunner_so_01", Vector3(10, -99, -499.5), Rotation(-174, 0, -0), optsDefend_SO),
		restoration:gen_so(400025, "gunner_so_02", Vector3(-196, -93, -499.5), Rotation(-174, 0, -0), optsDefend_SO),
		-- Dozer 
		restoration:gen_dummy(400026, "dozer_vault", Vector3(24, 418, -893.448), Rotation(-180, 0, -0), opts_dozer), 
		restoration:gen_so(400027, "dozer_so",  Vector3(-13.777, -610.714, -900), Rotation(-178, 0, -0), optsDefend_SO),
		-- Clokaer (1)
		restoration:gen_dummy(400028, "clomker", Vector3(300.137, -994.766, -900), Rotation(87, 0, -0), opts_cloaker_surprise_01),
		restoration:gen_so(400029, "clomker_s0_01", Vector3(300.137, -994.766, -900), Rotation(87, 0, -0), optsCloaker_Hide_SO_1),
		-- make sure to watch your baack :)
		restoration:gen_dummy(400030, "goro_majima", Vector3(26, 744, 100.5), Rotation(177, 0, -0), opts_cloaker_surprise_02),
		restoration:gen_so(400031, "funk_goes_on_starts_playing", Vector3(38.651, 631.015, 100.5), Rotation(175, 0, -0), optsCloaker_Hide_SO_2),
		-- turn this thang on 
		restoration:gen_toggleelement(400032, "enable_fwb_inspired_vault_ambush", opts_enable_fwb_inspired_vault_ambush),

	},
}
