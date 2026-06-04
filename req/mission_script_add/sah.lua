local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
local murky_response_timer = (difficulty >= 6 and 90) or 120
local murky_responder_1 = "units/payday2/characters/ene_murkywater_1/ene_murkywater_1"
local murky_responder_2 = "units/payday2/characters/ene_murkywater_2/ene_murkywater_2"
local murky_table = {murky_responder_1, murky_responder_2}

local optsMurkywater = {
    enemy_table = murky_table,
	participate_to_group_ai = true,
    enabled = true
}
local global_murky_spawn_mission_script = {
	enabled = true,
	on_executed = { 
		{ id = 400003, delay = 0 },
		{ id = 400002, delay = 0 },
	}
}
local loop = {
	enabled = true,
	on_executed = { 
		{ id = 400001, delay = 80, delay_rand = 20 },
	}
}
local choose_murky_spawnpoint = {
	amount = 2,
	amount_random = 3,
	on_executed = {
		{ id = 400004, delay = 1 },
		{ id = 400005, delay = 1 },
		{ id = 400006, delay = 1 },
		{ id = 400007, delay = 1 },
		{ id = 400008, delay = 1 }
	},
}
local murky_spawnpoint_1 = {
	enabled = true,
	on_executed = { 
		{ id = 400009, delay = 0 },
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 },
	}
}
local murky_spawnpoint_2 = {
	enabled = true,
	on_executed = { 
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 },
		{ id = 400016, delay = 0 },
	}
}
local murky_spawnpoint_3 = {
	enabled = true,
	on_executed = { 
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
	}
}
local murky_spawnpoint_4 = {
	enabled = true,
	on_executed = { 
		{ id = 400019, delay = 0 },
		{ id = 400020, delay = 0 },
		{ id = 400021, delay = 0 },
	}
}
local murky_spawnpoint_5 = {
	enabled = true,
	on_executed = { 
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 },
	}
}

local opts_pro_job_ponr = {
	elements =  { 100024, 100009, },
	trigger_times = 0,
	difficulty_add = 0.6,
	min_difficulty = 0.7,
	bravos_timer = 20,
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
		{ id = 400025, delay = 0, },
		{id = 400001, delay = murky_response_timer},
	},
}

return {
    elements = {
        -- Murky spawns system
        restoration:gen_missionscript(400001, "spawn_murkies", global_murky_spawn_mission_script),
		restoration:gen_missionscript(400002, "loop", loop),
		restoration:gen_element_random(400003, "murkywater_spawnpoint_select", choose_murky_spawnpoint),
		restoration:gen_missionscript(400004, "spawnpoint_1", murky_spawnpoint_1),
		restoration:gen_missionscript(400005, "spawnpoint_2", murky_spawnpoint_2),
		restoration:gen_missionscript(400006, "spawnpoint_3", murky_spawnpoint_3),
		restoration:gen_missionscript(400007, "spawnpoint_4", murky_spawnpoint_4),
		restoration:gen_missionscript(400008, "spawnpoint_5", murky_spawnpoint_5),
		-- Murky Grunts 2 (after you steal the tablet)
        restoration:gen_dummy(400009, "murkywater_1", Vector3(100, -7700, -97.432), Rotation(-0, 0, -0), optsMurkywater),
        restoration:gen_dummy(400010, "murkywater_2", Vector3(0, -7700, -97.432), Rotation(0, 0, -0), optsMurkywater),
        restoration:gen_dummy(400011, "murkywater_3", Vector3(199.027, -7713.917, -97.432), Rotation(-8, 0, -0), optsMurkywater),
        restoration:gen_dummy(400012, "murkywater_4", Vector3(-97.030, -7675.808, -97.432), Rotation(-14, 0, -0), optsMurkywater),
        restoration:gen_dummy(400013, "murkywater_5", Vector3(1000, 5500, -200), Rotation(-91, 0, -0), optsMurkywater),
        restoration:gen_dummy(400014, "murkywater_6", Vector3(1199.969, 5496.509, -200), Rotation(-91, 0, -0), optsMurkywater),
        restoration:gen_dummy(400015, "murkywater_7", Vector3(1299.954, 5494.764, -200), Rotation(-91, 0, -0), optsMurkywater),
        restoration:gen_dummy(400016, "murkywater_8", Vector3(1399.939, 5493.019, -200), Rotation(-91, 0, -0), optsMurkywater),
        restoration:gen_dummy(400017, "murkywater_9", Vector3(-399.863, 5494.767, -200.411), Rotation(93, 0, -0), optsMurkywater),
        restoration:gen_dummy(400018, "murkywater_10", Vector3(-498.904, 5479.094, -203.411), Rotation(83, 0, -0), optsMurkywater),
        restoration:gen_dummy(400020, "murkywater_12", Vector3(-697.809, 5458.188, -203.411), Rotation(83, 0, -0), optsMurkywater),    
        restoration:gen_dummy(400021, "murkywater_13", Vector3( 0, -7800, -97.432), Rotation(0, 0, -0), optsMurkywater),
        restoration:gen_dummy(400022, "murkywater_14", Vector3(100, -7900, -97.432), Rotation(0, -0, -0), optsMurkywater),
        restoration:gen_dummy(400023, "murkywater_15", Vector3(-200,  -7900, -97.432), Rotation(0, -0, -0), optsMurkywater),
        -- PONR 
        restoration:gen_counter(400024, "pro_job_ponr_counter", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr_counter),
		restoration:gen_pointofnoreturn(400025, "pro_job_ponr", Vector3(0, 0, 0), Rotation(0, 0, 0), opts_pro_job_ponr),
    }
}