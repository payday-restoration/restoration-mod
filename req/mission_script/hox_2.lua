local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local chance_dozer = ((difficulty == 8 or difficulty == 7) and 75 or (difficulty == 6 or difficulty == 5) and 50) or 25
local ponr_value = (difficulty <= 5 and 300 or (difficulty == 6 or difficulty == 7) and 270) or 240

return {
	--Pro Job PONR 
	[101374] = {
		ponr = ponr_value
	},
	[102218] = {
		values = {
            chance = chance_dozer
		}
	}
}