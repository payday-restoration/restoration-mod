local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ben_dozer =  "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"
local surprise_cloaker = ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" or "units/payday2/characters/ene_spook_1/ene_spook_1")
local shields =  ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield")
local sniper  =  ((difficulty >= 8) and "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper" or "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3")
local grunt_1 =  ((difficulty >= 8) and "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle" or "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
local grunt_2 =  ((difficulty >= 8) and "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun" or "units/payday2/characters/ene_swat_1/ene_swat_1")
local grunt_3 =  ((difficulty >= 8) and "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg" or "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870")
local gunner = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
grunt_table = { grunt_1, grunt_2, grunt_3 }
local death_wish_above = difficulty >= 7
local death_sentence = difficulty == 8
local dozer_chance = math.random() < 0.5
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
	SO_access = {
        "tank",
        "shield",
        "swat",
		"sniper", 
    },
	scan = true,
	forced = true,
	align_position = true,
	needs_pos_rsrv = true,
	align_rotation = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_sniper",
}
local disable_thetank = {
	enabled = true,
	toggle = "off",
	elements = { 
		400012, 
	},
}
local enable_thetank = {
	enabled = ( death_sentence and dozer_chance ) ,
	elements = { 
		400012,
	},
}
local optsBravo_Dozer = {
	enemy = ben_dozer,
	enbaled = true,
	participate_to_group_ai = true,
	on_executed = { { id = 400011, delay = 0 }, },
}
local spawn_brav_doz = {
	enbaled = true,
	on_executed = { { id =  400008, delay = 0 }, },
}
local disable_vault_stairs_unit = {
	enabled = true,
	toggle = "off",
	elements = { 
		400023, 
	},
}
local enable_vault_stairs_unit = {
	enabled = death_wish_above,
	elements = { 
		400023,
	},
}
local opts_vault_stairs_unit01 = {
	enemy_table = grunt_table,
	enabled = true,
	on_executed = { { id = 400017, delay = 0, } },
}
local opts_vault_stairs_unit02 = {
	enemy_table = grunt_table,
	enabled = true,
	on_executed = { { id =  400018, delay = 0, } },
}
local opts_vault_stairs_unit03 = {
	enemy_table = grunt_table,
	enabled = true,
	on_executed = { { id = 400019, delay = 0, } },
}
local opts_vault_stairs_unit04 = {
	enemy_table = grunt_table,
	enabled = true,
	on_executed = { { id = 400020, delay = 0, } },
}
local spawn_vault_units = {
	enabled = true,
	on_executed = { 
		{ id =  400013, delay = 0},
		{ id =  400014, delay = 0}, 
		{ id =  400015, delay = 0}, 
		{ id =  400016, delay = 0}, 
},
}
local disable_gunners_ds_pro = {
	enabled = true,
	toggle = "off",
	elements = { 
		400030, 
	},
}
local enable_gunners_ds_pro = {
	enabled = ( death_sentence and pro_job ),
	elements = { 
		400030,
	},
}
local opts_gunner_dspj_01 = {
	enemy = gunner,
	spawn_action = "e_sp_clk_3m_dwn_vent",
	enabled = true,
	participate_to_group_ai = true,
	on_executed = {  { id = 400026, delay = 2.5, }, },
}
local opts_gunner_dspj_02 = {
	enemy = gunner,
	spawn_action = "e_sp_clk_3m_dwn_vent",
	enabled = true,
	participate_to_group_ai = true,
	on_executed = {  { id = 400027, delay = 2.5, }, },
}
local spawn_dspj_gunners_railing = {
	enbaled = true,
	on_executed = {
		{ id =  400024, delay = 0, },
		{ id =  400025, delay =  0, },
	}
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
		-- Dozer (ONLY IN DS, probably has a chance of spawning)
		restoration:gen_dummy(400008, "outside_vault_dozer", Vector3(24, 418, -893.448), Rotation(-180, 0, -0), optsBravo_Dozer),
		restoration:gen_toggleelement(400009, "disable_bravo_dozer", disable_thetank),
		restoration:gen_toggleelement(400010, "enable_bravo_dozer", enable_thetank),

		restoration:gen_so(400011, "brav_doz_so", Vector3(24, -688, -893.448), Rotation(-180, 0, -0), optsDefend_SO),
		restoration:gen_missionscript(400012, "spawn_ds_brav_doz", spawn_brav_doz), 
		
		-- Regular units by the stairs (replacing the shield wall)
		restoration:gen_dummy(400013, "stair_unit_01", Vector3(200, -100, -499.5), Rotation(175, 0, -0), opts_vault_stairs_unit01),
		restoration:gen_dummy(400014, "stair_unit_02", Vector3(299.985, -98.255, -499.5), Rotation(-176, 0, -0), opts_vault_stairs_unit02),
		restoration:gen_dummy(400015, "stair_unit_03", Vector3(400, -100, -499.5), Rotation(179, 0, -0), opts_vault_stairs_unit03),
		restoration:gen_dummy(400016, "stair_unit_04", Vector3(476, -92, -499.5), Rotation(179, 0, -0), opts_vault_stairs_unit04),
		restoration:gen_so(400017, "vault_stair_so_1", Vector3(200, -100, -499.5), Rotation(175, 0, -0), optsDefend_SO),

		restoration:gen_so(400018, "vault_stair_so_2", Vector3(299.985, -98.255, -499.5), Rotation(-176, 0, -0), optsDefend_SO),
		restoration:gen_so(400019, "vault_stair_so_3",  Vector3(400, -100, -499.5), Rotation(179, 0, -0), optsDefend_SO),
		restoration:gen_so(400020, "vault_stair_so_4",  Vector3(476, -92, -499.5), Rotation(179, 0, -0), optsDefend_SO),
		restoration:gen_toggleelement(400021,"disable_vault_stairs_unit", disable_vault_stairs_unit),
		restoration:gen_toggleelement(400022,"enable_vault_stairs_unit", enable_vault_stairs_unit),
		restoration:gen_missionscript(400023, "vault_stairs_units", spawn_vault_units),

		-- LMG GUnners by railings (DSPJ only, yes this is my first time actually doing something like this shut up)
		restoration:gen_dummy(400024, "ds_gunner_01", Vector3(324.472, 117.981, -499.5), Rotation(175, 0, -0),  opts_gunner_dspj_01),
		restoration:gen_dummy(400025, "ds_gunner_02",  Vector3(317.558, 394.636, -499.5), Rotation(175, 0, -0), opts_gunner_dspj_02),
		restoration:gen_so(400026, "gunner_so_01",  Vector3(9.117, -90.326, -499.5), Rotation(175, 0, -0), optsDefend_SO),
		restoration:gen_so(400027, "gunner_so_01", Vector3(-180.16, -73.767, -499.5), Rotation(175, 0, -0) , optsDefend_SO),
		restoration:gen_toggleelement(400028, "disable_dspj_gunners", disable_gunners_ds_pro),
		restoration:gen_toggleelement(400029, "enable_dspj_gunners",  enable_gunners_ds_pro),
		restoration:gen_missionscript(400030, "spawn_dspj_exclusive_gunners", spawn_dspj_gunners_railing),
	},
}
