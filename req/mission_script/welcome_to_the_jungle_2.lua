local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 540 or (difficulty == 6 or difficulty == 7) and 510) or 480	

local ponr = {
	ponr = ponr_value
}	

return {
	-- Reinforce stuff 
	[100533] = { -- Police
		reinforce = {
			{
				name = "cars",
				force = 3,
				position = Vector3(-1789, 1465, -0.017),
			},
			{
				name = "near_escape", 
				force = 2, 
				position = Vector3(-4669, -865, 441.44),
			},
			{
				name = "bbq", 
				force = 2,
				position = Vector3(-1804, -2882, 0),
			},
		},
	},
	[100267] = { -- When the lab door is open 
		reinforce  = {
			{
				name = "kitchen",
				force = 2, 
				position = Vector3(-1278, -1888, 0),
			},
			{
				name = "snooker",
				force = 2,
				position = Vector3(76, -2251, 0), 
			},
			{
				name = "tabul", 
				force = 3, 
				position = Vector3(948, -2236, 0), 
			},
			{
				name = "da_pool",
				force = 3, 
				position = Vector3(2513, -3479, 0),
			},
		},
	},
	-- Pro Job PONR
	[103328] = ponr,
	[102207] = ponr,
	-- Add power cut SO delay
	[100313] = {
		values = {
			base_delay = 30,
			base_delay_rand = 30
		}
	},
}