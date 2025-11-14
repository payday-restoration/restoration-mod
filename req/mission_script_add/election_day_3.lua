local cop_1 = "units/payday2/characters/ene_cop_1/ene_cop_1"
local cop_2 = "units/payday2/characters/ene_cop_2/ene_cop_2"
local cop_3 = "units/payday2/characters/ene_cop_3/ene_cop_3"
local cop_4 = "units/payday2/characters/ene_cop_4/ene_cop_4"
local beat_cop_amount = 4

local opts_hunt_so = {
	scan = true,
	SO_access = "32",
	use_instigator = true,
	so_action = "AI_hunt",
}
local opts_beat_cops = {
	enabled = true,
    enemy = cop_1, cop_2, cop_3, cop_4,
    enemy_table = {cop_1,cop_2, cop_2, cop_3, cop_4,},
    on_executed = {
        {id = 400025, delay= 0, },
    },
}
local opts_spawn_beat_cops = {
	enabled = true,
	trigger_times = 6,
	amount = beat_cop_amount,
	on_executed = {
		{ id = 400004, delay = 0, },
		{ id = 400005, delay = 0, },
        { id = 400006, delay = 0, },
        { id = 400007, delay = 0, },
        { id = 400008, delay = 0, },
	},
}
local opts_loop = {
	enabled = true,
	trigger_times = 6,
	on_executed = {
		{ id = 400024, delay = 0, },
	},
}
local opts_beat_cops_spawngroup_1 = {
	enabled = true,
	on_executed = { 
		{ id = 400009, delay = 0 },
		{ id = 400010, delay = 0 },
		{ id = 400011, delay = 0 },
		{ id = 400012, delay = 0 },
		{ id = 400013, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_2 = {
	enabled = true,
	on_executed = { 
		{ id = 400014, delay = 0 },
		{ id = 400015, delay = 0 },
		{ id = 400016, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_3 = {
	enabled = true,
	on_executed = { 
		{ id = 400017, delay = 0 },
		{ id = 400018, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_4 = {
	enabled = true,
	on_executed = { 
		{ id = 400019, delay = 0 },
		{ id = 400020, delay = 0 },
		{ id = 400021, delay = 0 },
	},
}
local opts_beat_cops_spawngroup_5 = {
	enabled = true,
	on_executed = { 
		{ id = 400022, delay = 0 },
		{ id = 400023, delay = 0 },
	},
}
return {
    elements = {
        -- beat  cops spawns system
        restoration:gen_missionscript(400004, "beat_cops_spawngroup_1", opts_beat_cops_spawngroup_1),
		restoration:gen_missionscript(400005, "beat_cops_spawngroup_2", opts_beat_cops_spawngroup_2),
		restoration:gen_missionscript(400006, "beat_cops_spawngroup_3", opts_beat_cops_spawngroup_3),
        restoration:gen_missionscript(400007, "beat_cops_spawngroup_4", opts_beat_cops_spawngroup_4),
        restoration:gen_missionscript(400008, "beat_cops_spawngroup_5", opts_beat_cops_spawngroup_5),
        restoration:gen_so(400025, "hunt_so", Vector3(-700, 1000, 8.515), Rotation(0, 0, 0), opts_hunt_so),
        restoration:gen_element_random(400024, "spawn_beat_cops", opts_spawn_beat_cops),
        restoration:gen_missionscript(400018, "loop_beat_cops", opts_loop),
		-- beat cops 
        restoration:gen_dummy(400009, "cop_1", Vector3(-654.089, 6904.53, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400010, "cop_2", Vector3(-597.869, 6860.76, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400011, "cop_3", Vector3(-764.385, 6902.21, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400012, "cop_4", Vector3(1049, 785, 676.187), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400013, "cop_5", Vector3(-690.353, 6965.54, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400014, "cop_6", Vector3(1.807, 6888.87, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400015, "cop_7",Vector3(-130.288, 6897.06, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400016, "cop_8",Vector3(-67.221, 6970.19, 302.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400017, "cop_9", Vector3(1354.95, -8640.83, 2.5), Rotation(88, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400018, "cop_10", Vector3(1423.68, -8558.1, 2.5), Rotation(88, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400019, "cop_11", Vector3(953.945, -8997.78, 2.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400020, "cop_12", Vector3(890.076, -8962.46, 2.5), Rotation(0, 0, -0), opts_beat_cops),    
        restoration:gen_dummy(400021, "cop_13", Vector3(826.155, -8986.63, 2.5), Rotation(0, 0, -0), opts_beat_cops),
        restoration:gen_dummy(400022, "cop_14", Vector3(302.03, -8894.75, 55), Rotation(0, -0, -0), opts_beat_cops),
        restoration:gen_dummy(400023, "cop_15", Vector3(211.63, -8880.58, 55), Rotation(0, 0, -0), opts_beat_cops),
    }
}