local cop_1 = "units/payday2/characters/ene_cop_1/ene_cop_1"
local cop_2 = "units/payday2/characters/ene_cop_2/ene_cop_2"
local cop_3 = "units/payday2/characters/ene_cop_3/ene_cop_3"
local cop_4 = "units/payday2/characters/ene_cop_4/ene_cop_4"
local beat_cops_table = {cop_1, cop_1, cop_2, cop_2, cop_3, cop_3, cop_4}

local optsBeatcops = {
      enemy_table = beat_cops_table,
	participate_to_group_ai = true,
	on_executed = { 
		{ id = 400057, delay = 0 } 
	},
    enabled = true
}
local global_beat_cops_spawn_mission_script = {
	enabled = true,
	on_executed = { 
		{ id = 400003, delay = 0 },
		{ id = 400002, delay = 0 },
	},
}
local loop = {
	enabled = true,
	on_executed = { 
		{ id = 400001, delay = 15, delay_rand = 5 },
	},
}
local choose_beat_cops_spawnpoint = {
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
local beat_cops_spawnpoint_1 = {
	enabled = true,
	on_executed = { 
		{ id = 400009, delay = 0 },
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 },
	},
}
local beat_cops_spawnpoint_2 = {
	enabled = true,
	on_executed = { 
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 },
		{ id = 400016, delay = 0 },
	},
}
local beat_cops_spawnpoint_3 = {
	enabled = true,
	on_executed = { 
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
	},
}
local beat_cops_spawnpoint_4 = {
	enabled = true,
	on_executed = { 
		{ id = 400019, delay = 0 },
		{ id = 400020, delay = 0 },
		{ id = 400021, delay = 0 },
	},
}
local beat_cops_spawnpoint_5 = {
	enabled = true,
	on_executed = { 
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 },
	},
}
local opts_hunt_so = {
	scan = true,
	SO_access = "32",
	use_instigator = true,
	so_action = "AI_hunt",
}

return {
    elements = {
        -- beat  cops spawns system
        restoration:gen_missionscript(400001, "spawn_beat_cops", global_beat_cops_spawn_mission_script),
		restoration:gen_missionscript(400002, "loop", loop),
		restoration:gen_element_random(400003, "beat_cops_spawnpoint_select", choose_beat_cops_spawnpoint),
		restoration:gen_missionscript(400004, "spawnpoint_1", beat_cops_spawnpoint_1),
		restoration:gen_missionscript(400005, "spawnpoint_2", beat_cops_spawnpoint_2),
		restoration:gen_missionscript(400006, "spawnpoint_3", beat_cops_spawnpoint_4),
		restoration:gen_missionscript(400007, "spawnpoint_4", beat_cops_spawnpoint_4),
		restoration:gen_missionscript(400008, "spawnpoint_5", beat_cops_spawnpoint_5),
        restoration:gen_so(400057, "hunt_so", Vector3(-479.957, -2623.79, 0), Rotation(0, 0, 0), opts_hunt_so),
		--beat cops 
        restoration:gen_dummy(400009, "cop_1", Vector3(-654.089, 6904.53, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400010, "cop_2", Vector3(-597.869, 6860.76, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400011, "cop_3", Vector3(-764.385, 6902.21, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400012, "cop_4", Vector3(1049, 785, 676.187), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400013, "cop_5", Vector3(-690.353, 6965.54, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400014, "cop_6", Vector3(1.807, 6888.87, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400015, "cop_7",Vector3(-130.288, 6897.06, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400016, "cop_8",Vector3(-67.221, 6970.19, 302.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400017, "cop_9", Vector3(1354.95, -8640.83, 2.5), Rotation(88, 0, -0), optsBeatcops),
        restoration:gen_dummy(400018, "cop_10", Vector3(1423.68, -8558.1, 2.5), Rotation(88, 0, -0), optsBeatcops),
        restoration:gen_dummy(400019, "cop_11", Vector3(953.945, -8997.78, 2.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400020, "cop_12", Vector3(890.076, -8962.46, 2.5), Rotation(0, 0, -0), optsBeatcops),    
        restoration:gen_dummy(400021, "cop_13", Vector3(826.155, -8986.63, 2.5), Rotation(0, 0, -0), optsBeatcops),
        restoration:gen_dummy(400022, "cop_14", Vector3(302.03, -8894.75, 55), Rotation(0, -0, -0), optsBeatcops),
        restoration:gen_dummy(400023, "cop_15", Vector3(211.63, -8880.58, 55), Rotation(0, 0, -0), optsBeatcops)
    }
}