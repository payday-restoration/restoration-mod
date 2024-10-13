local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 300 or (difficulty == 6 or difficulty == 7) and 360) or 420

return {
	--Pro Job PONR 
	[102064] = {
		ponr = ponr_value
	},
	-- Disable turret
	[101035] = {
		values = {
			on_executed = {},
			unit_ids = {
				102775,
				102776
			}
		}
	}
}