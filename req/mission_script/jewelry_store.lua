local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
	
	if difficulty <= 4 then
		ponr_value = 360
	elseif difficulty == 5 then
		ponr_value = 480
	else
		ponr_value = 600	
	end
	
	if pro_job then
		hunt_projob = true
	end

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