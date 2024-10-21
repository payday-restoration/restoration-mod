local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 4 and 360 or difficulty == 5 and 480) or 600

local ponr = {
	ponr = ponr_value,
	hunt = hunt_projob
}	

return {
	--Pro Job PONR+Endless Assault 
	[101761] = ponr,
	[101836] = ponr,
	[102031] = ponr,
	[102033] = ponr
}