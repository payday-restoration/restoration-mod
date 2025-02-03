local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job

return {
		--Pro Job PONR+Endless Assault
		[100727] = {
			ponr = ponr_value,
			hunt = hunt_projob
		}
}	