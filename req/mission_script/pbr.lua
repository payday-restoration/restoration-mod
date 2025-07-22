local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local TitanWelcomingPartyChance = math.random() < 0.5
local tdozer = ((difficulty == 8 and pro_job and TitanWelcomingPartyChance) and "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
local tshield = ((difficulty == 8 and pro_job and TitanWelcomingPartyChance) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300

return {
	-- Pro Job PONR 
	[101774] = {
		ponr = ponr_value
	},
	-- End PONR once everyone is inside the chopper
	[102357] = {
        ponr_end = true
    },
	--slope forces
	[100373] = {
		values = {
            enemy = tdozer
		}
	},
	[100402] = {
		values = {
            enemy = tshield
		}
	},
	[101498] = {
		values = {
            enemy = tshield
		}
	},
	[101125] = { -- Escape
		reinforce = {
			{
				name = "gate",
				force = 3,
				position = Vector3(-11000, -6800, 7000),
			},
			{
				name = "what_a_nice_car",
				force = 3,
				position = Vector3(-11200, 400, 7400),
			},
		},
	},
	-- Add reinforce
	[100003] = {
		reinforce = {
			{
				name = "entrance1",
				force = 3,
				position = Vector3(725, 150, 0),
			},
		},
	},
	[100004] = {
		reinforce = {
			{
				name = "entrance2",
				force = 3,
				position = Vector3(825, -3400, -300),
			},
		},
	},
	[100005] = {
		reinforce = {
			{
				name = "entrance3",
				force = 3,
				position = Vector3(2780, -4615, 0),
			},
		},
	},
	[100085] = {
		reinforce = {
			{ name = "entrance1" },
		},
	},
	[100086] = {
		reinforce = {
			{ name = "entrance2" },
		},
	},
	[100087] = {
		reinforce = {
			{ name = "entrance3" },
		},
	},
	[101027] = {
		reinforce = {
			{
				name = "demeter",
				force = 2,
				position = Vector3(-12645, -1165, -900),
			},
			{
				name = "hades",
				force = 2,
				position = Vector3(-9235, -490, -900),
			},
			{
				name = "ares",
				force = 2,
				position = Vector3(-8765, -5100, -900),
			},
			{
				name = "chronos",
				force = 2,
				position = Vector3(-11170, -3015, -900),
			},
			{
				name = "zeus",
				force = 2,
				position = Vector3(-7080, -4205, -900),
			},
			{
				name = "poseidon",
				force = 2,
				position = Vector3(-7100, -2950, -900),
			},
		},
	},
	[101434] = {
		reinforce = {
			{ name = "demeter" },
			{ name = "hades" },
			{ name = "ares" },
			{ name = "chronos" },
			{ name = "zeus" },
			{ name = "poseidon" },
		},
	},
	-- Make snipers not participate to group ai
	[100602] = no_participate,
	[100603] = no_participate,
	[100604] = no_participate,
	[100605] = no_participate,
	[100606] = no_participate,
	[100369] = no_participate,
	[101627] = no_participate,
	[101628] = no_participate,
	[101236] = no_participate,
	[101237] = no_participate,
	[101238] = no_participate,
	[101239] = no_participate,
}