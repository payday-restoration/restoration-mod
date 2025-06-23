local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 3 and 240 or (difficulty == 4 or difficulty == 5) and 360) or 480
local hunt_projob = pro_job	

local disabled = {
	values = {
		enabled = false
	}
}	

return {
	-- Pro Job PONR 
	[101095] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	-- Disable Titan Cams
	[102211] = disabled,
	-- Restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	-- Add custom reinforce from ASS
	[100324] = disabled, -- reenforce
	[100022] = {
		on_executed = { -- delay Twitch from leaving the area after the heist goes loud
			{ id = 100168, delay = 8 },
		},
		reinforce = {
			{
				name = "street1",
				force = 2,
				position = Vector3(-750, 450, 0),
			},
			{
				name = "street2",
				force = 2,
				position = Vector3(-1750, 450, 0),
			},
			{
				name = "street3",
				force = 2,
				position = Vector3(-1000, -4000, 0),
			},
			{
				name = "street4",
				force = 2,
				position = Vector3(3000, -4000, 0),
			},
			{
				name = "alley",
				force = 2,
				position = Vector3(2200, 1000, 0),
			},
			{
				name = "plaza",
				force = 3,
				position = Vector3(4250, -1700, 0),
			},
		},
	},
	-- Disable the bad van escape spots
	[100754] = disabled,
	[100755] = disabled,
}	