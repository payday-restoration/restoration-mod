local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
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
		{ id = 400004, delay = 0 },
		{ id = 400005, delay = 0 },
		{ id = 400006, delay = 0 },
		{ id = 400007, delay = 0 },
		{ id = 400008, delay = 0 }
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

return {
    elements = {
        -- Murky spawns system
        restoration:gen_missionscript(400001, "spawn_murkies", global_murky_spawn_mission_script),
		restoration:gen_missionscript(400002, "loop", loop),
		restoration:gen_element_random(400003, "murkywater_spawnpoint_select", choose_murky_spawnpoint),
		restoration:gen_element_random(400004, "spawnpoint_1", murky_spawnpoint_1),
		restoration:gen_element_random(400005, "spawnpoint_2", murky_spawnpoint_2),
		restoration:gen_element_random(400006, "spawnpoint_3", murky_spawnpoint_3),
		restoration:gen_element_random(400007, "spawnpoint_4", murky_spawnpoint_4),
		restoration:gen_element_random(400008, "spawnpoint_5", murky_spawnpoint_5),
		--Murky Grunts
        restoration:gen_dummy(400009, "murkywater_1", Vector3(789, 785, 676.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400010, "murkywater_2", Vector3(874, 785, 676.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400011, "murkywater_3", Vector3(965, 785, 676.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400012, "murkywater_4", Vector3(1049, 785, 676.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400013, "murkywater_5", Vector3(1136, 785, 676.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400014, "murkywater_6", Vector3(4890, -1652, 3.752), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400015, "murkywater_7", Vector3(4890, -1582, 3.752), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400016, "murkywater_8", Vector3(4890, -1354, 3.752), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400017, "murkywater_9", Vector3(269, -7018, 2.395), Rotation(0, 0, -0), optsMurkywater),
        restoration:gen_dummy(400018, "murkywater_10", Vector3(258, -7064, 2.395), Rotation(0, 0, -0), optsMurkywater),
        restoration:gen_dummy(400019, "murkywater_11", Vector3(2345, 794, 700.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400020, "murkywater_12", Vector3(2638, 794, 700.187), Rotation(-180, 0, -0), optsMurkywater),    
        restoration:gen_dummy(400021, "murkywater_13", Vector3(2728, 794, 700.187), Rotation(-180, 0, -0), optsMurkywater),
        restoration:gen_dummy(400022, "murkywater_14", Vector3(274, 2673, 2.395), Rotation(90, -0, -0), optsMurkywater),
        restoration:gen_dummy(400023, "murkywater_15", Vector3(329, 2673, 2.395), Rotation(90, -0, -0), optsMurkywater)
    }
}
