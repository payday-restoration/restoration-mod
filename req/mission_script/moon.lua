local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 480 or (difficulty == 6 or difficulty == 7) and 450) or 420

return {
	--Pro Job PONR 
	[101196] = {
		ponr = ponr_value
	},
	--End PONR once everyone is inside the escape zone
	[100027] = {
        ponr_end = true
    }
}