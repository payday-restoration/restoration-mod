local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600

return {
	--Pro Job PONR+Hunt (Endless Assault)
	[100673] = {
		ponr = ponr_value,
		hunt = hunt_projob
	}
}