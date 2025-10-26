local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local tank_skull =  ((difficulty >= 8 and pro_job) and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc" or "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")
local surprise_cloaker = "units/payday2/characters/ene_spook_1/ene_spook_1"
local shields = ((difficulty >= 8 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/payday2/characters/ene_shield_2/ene_shield_2")
local sniper = ((difficulty >= 7 and pro_job) and "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper" or "units/payday2/characters/ene_sniper_1/ene_sniper_1")
local diff_scaling = (death_wish_above and 0.7 or overkill_above and 0.5 or 0.3) + (pro_job and 0.15 or 0)
local enabled_chance_ambush = math.random() < diff_scaling
local enabled_ambush = pro_job or overkill_above and enabled_chance_ambush

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
	SO_access = tostring (2048 + 4096 + 512),
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interval = 2,
	so_action = "AI_sniper",
}

local optsShield_01 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{id =  400012,  delay = 0, },
	},
}
local optsShield_02 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400013,  delay = 0, },
	},
}
local optsShield_03 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400014,  delay = 0, },
	},
}
local optsShield_04 = {
	enabled = false,
	enemy = shields,
	on_executed = {
		{ id =  400015,  delay = 0, },
	},
}
local opts_enabale_shields = {
	enabled = {enabled_ambush or pro_job},
	elements = { 400008, 400009, 400010, 400011 },
	toggle = "on",
}

local opts_cloaker_surprise = {
	enemy = surprise_cloaker,
	enabled = false,
	on_executed = {
		{id = 400021, delay = 0,},
	},

}
local optsCloaker_Hide_SO_1 = {
    SO_access = "1024",
	scan = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	interrupt_dis = 5,
	interrupt_dmg = 0.3,
	interval = 2,
    so_action = "e_so_idle_by_container"
}
local opts_enable_surprse_cloaker = {
	enabled = (enabled_ambush or pro_job),
	elements = { 400020, },
	toggle = "on",

}

local opts_surprise_dozer = {
	enemy = tank_skull,
	enabled = false,
	on_executed = {
		{id =  400018, delay = 0,},
	},
}
local opts_enable_dozer = {
	enabled = (death_wish_above  or pro_job),
	elements = { 400020, },
	toggle = "on",
}

local optsSniper = {
	enemy = sniper,
	enabled = false,
	on_executed = {
		{id = 400024, delay = 0,},
	},
}
local opts_enable_sniper = {
	enabled = (enabled_ambush or pro_job),
	elements = { 400023, }, 
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
		-- Shields 
		restoration:gen_dummy(400008, "shield_blockade_vault_01", Vector3(-200, 800, 100), Rotation(180, 0, -0), optsShield_01), -- top stairs, security room
		restoration:gen_dummy(400009, "shield_blockade_vault_02", Vector3(299.985, -98.255, -499.500), Rotation(-176, 0, -0), optsShield_02), -- stairs near the vault
		restoration:gen_dummy(400010, "shield_blockade_vault_03", Vector3(200,-100, -499.500), Rotation(175, 0, -0), optsShield_03), -- stairs near the vault
		restoration:gen_dummy(400011, "shield_blockade_vault_04", Vector3(400, -100, -499.500), Rotation(179, 0, -0), optsShield_04), -- stairs near the vault
		restoration:gen_so(400012, "shield_defend_so_1", Vector3(-200, 800, 100.001), Rotation( -169, -0, -0), optsDefend_SO),
		restoration:gen_so(400013, "shield_defend_so_2",  Vector3(299.985, -98.255, -499.500), Rotation(-168, 0, -0), optsDefend_SO),
		restoration:gen_so(400014, "shield_defend_so_3", Vector3(200, -100, -499.500), Rotation( -177, -0, -0), optsDefend_SO),
		restoration:gen_so(400015, "shield_defend_so_4", Vector3(399.970, -96.510, -499.500), Rotation( -176, -0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400016, "enable_shields", opts_enabale_shields),
		-- Dozer 
		restoration:gen_dummy(400017, "dozer_vault_ambush", Vector3(0, -500, -900), Rotation(-180, 0, -0), opts_surprise_dozer),
		restoration:gen_so(400018, "dozer_defend_so_1", Vector3(-13.777, -610.714, -900), Rotation(-178, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400019, "enable_dozer", opts_enable_dozer),
		-- Cloaker 
		restoration:gen_dummy(400020, "cloaker_ambush", Vector3(300.137, -994.766, -900), Rotation(87, 0 , -0), opts_cloaker_surprise),
		restoration:gen_so(400021, "surprise_motherfucker", Vector3(300, -1000, -900), Rotation(92, 0, -0), optsCloaker_Hide_SO_1),
		restoration:gen_toggleelement(400022, "enable_cloaker", opts_enable_surprse_cloaker),
		-- Sniper 
		restoration:gen_dummy(400023, "sniper_vault", Vector3(-100, -100, -499.500), Rotation(-174, 0, -0), optsSniper),
		restoration:gen_so(400024, "sniper_defend_so_1", Vector3(-100, -100, -499.500), Rotation(-174, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400025, "enable_sniper", opts_enable_sniper),

	},
}
