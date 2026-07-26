local fbi_swats = {
    "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
    "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"
}
local gensec_swats = {
    "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
    "units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"
}
local zeal_swats = {
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
    "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
    "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
    "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local oops_all_titanswats = math.random() < 0.45
local swat = (difficulty == 8 and zeal_swats or difficulty == 7 and gensec_swats or (difficulty == 6 or difficulty == 5) and fbi_swats)
local swat_harasser = {
	values = {
        	enemy = swat
	}
}
local enabled = {
	values = {
		enabled = true,
	},
}
return {
-- Repurposed unused lobby units with my own (prison guards lol)
[100048] = {
    on_executed = {
        { id = 400013,  delay = 0, },
    },
},
-- Some garage stuff
[102095] = {
    on_executed = {
        { id = 400023,  delay = 0, },
    },
},
[100809] = {
    on_executed = {
        { id =  400017, delay = 0},
    },
},
    -- Add new reinforce
	[102850] = { -- in garage
		reinforce = {
			{
				name = "car",
				force = 3,
				position = Vector3(10425, 5460, -2560.49),
			},
            {
                name = "seven_bucks", 
                force = 3, 
                position = Vector3(12239, 4607, -2800),
            },
		},
	},
    -- fix one of SWAT spawngroup spawns having messed up positions
	[100143] = {
		values = {
			position = Vector3(-4210.318, 98.610, -2020),
			rotation = Rotation(30.276, 0, 0),
		},
	},
	[100141] = {
		values = {
			position = Vector3(-4302.193, -1.811, -2020),
			rotation = Rotation(-26.785, 0, 0),
		},
	},
	[100142] = {
		values = {
			position = Vector3(-4280.948, 77.521, -2020),
			rotation = Rotation(30.276, 0, 0),
		},
	},
	[100139] = {
		values = {
			position = Vector3(-4313.807, 119.244, -2020),
			rotation = Rotation(-20.627, 0, 0),
		},
	},
	[100140] = {
		values = {
			position = Vector3(-4305.427, 175.010, -2020),
			rotation = Rotation(35.230, 0, 0),
		},
	},
    -- Diff scaling SWAT harrasers next to cop cars that replace beat cops on higher diffs
    [102029] = swat_harasser,
    [102031] = swat_harasser,
    [102033] = swat_harasser,
    [102035] = swat_harasser,
    [102037] = swat_harasser,
    [102039] = swat_harasser,
    [102041] = swat_harasser,
    [102043] = swat_harasser,
    -- Renable some disabled harassers SOs
	[102001] = enabled,
	[102004] = enabled,
	[102005] = enabled,
	[102008] = enabled,
}