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
	-- Combine some navigation areas
	[102729] = {
		ai_area = {
			{ 17, 18, 91 },
			{ 7, 10, 90, 171 },
			{ 5, 6, 11, 89 },
			{ 12, 13, 88 },
			{ 14, 16, 87 },
			{ 86, 115, 116 },
			{ 1, 19, 20 },
			{ 2, 21, 22 },
			{ 71, 100, 101, 102, 103 },
			{ 70, 96, 97 },
			{ 69, 98, 99 },
			{ 68, 104, 105 },
			{ 29, 30, 84 },
			{ 27, 28, 83 },
			{ 76, 110, 111, 112 },
			{ 150, 151, 170 },
			{ 77, 108, 109 },
			{ 78, 106, 107 },
			{ 79, 117, 118 },
			{ 25, 26, 81 },
			{ 23, 24, 82 },
			{ 33, 72 },
			{ 31, 73 },
			{ 74, 113, 114 },
			{ 8, 94, 214 },
			{ 3, 9, 93 },
			{ 54, 160, 161 },
			{ 162, 163 },
			{ 53, 164, 165 },
			{ 47, 48, 215 },
			{ 52, 55, 166 },
			{ 56, 57 },
			{ 58, 59 },
			{ 60, 61, 216 },
			{ 62, 126, 128 },
			{ 63, 64, 127 },
			{ 66, 167, 168 },
			{ 38, 39, 168 },
			{ 40, 41 },
			{ 34, 35, 36 },
			{ 43, 44 },
			{ 45, 46 },
		},
	},
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