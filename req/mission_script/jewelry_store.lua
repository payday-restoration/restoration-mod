local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false
	
	if difficulty <= 4 then
		ponr_value = 300
	elseif difficulty == 5 then
		ponr_value = 360	
	else
		ponr_value = 420	
	end
	
	if pro_job then
		hunt_projob = true
	end

return {
	--Pro Job PONR+Endless Assault 
	[101761] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	[101836] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	[102031] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	[102033] = {
		ponr = ponr_value,
		hunt = hunt_projob
	}
}