local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false

	if pro_job then
		hunt_projob = true
	end

	if difficulty <= 5 then
		ponr_value = 600	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 570
	else
		ponr_value = 540		
	end

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