local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

return {
	--Pro Job PONR+Hunt (Endless Assault)
	[101397] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--End PONR once everyone is inside the escape zone
	[100357] = {
        ponr_end = true
    }
}