local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 540) or 480
local disabled = {
	values = {
        enabled = false
	}
}
return {
	--Pro Job PONR 
	[101289] = {
		ponr = ponr_value
	},
	-- Improve reinforce spots
	[100022] = {
		reinforce = {
			{
				name = "touch_grass",
				force = 3,
				position = Vector3(2000, -900, 30)
			}
		}
	},
	[100589] = disabled,
	[100590] = disabled
}	