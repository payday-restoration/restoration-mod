local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 960	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 930
	else
		ponr_value = 900	
	end
	
	local ponr_timer_player_mul = {
		1,
		0.8,
		0.6,
		0.4,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		0.35
}

return {
	--Pro Job PONR 
	[102089] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Increase Stealth PONR timers
	[101416] = {
		values = {
			time_normal = 90,
			time_hard = 90,
			time_overkill = 90,
			time_overkill_145 = 90,
			time_easy_wish = 90,
			time_overkill_290 = 90,
			time_sm_wish = 90
		}
	}
}	