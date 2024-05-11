local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	--High PONR Timer to work with ponr player scaling
	if difficulty <= 5 then
		ponr_value_1 = 1560
		ponr_value_2 = 840
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value_1 = 1530
		ponr_value_2 = 810
	else
		ponr_value_1 = 1500
		ponr_value_2 = 780
	end
	
local sniper_trigger_times = {
	values = {
        trigger_times = 0
	}
}
local spawn_anim_fix = {
	values = {
        spawn_action = "e_sp_over_3m"
	}
}	
	
local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}	

return {
	--Pro Job PONR
	[101425] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value_1
	},
	[100929] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value_2
	},
	--Fixed snipers being able to spawn only once
	[100368] = sniper_trigger_times,
	[100369] = sniper_trigger_times,
	[100370] = sniper_trigger_times,
	[100371] = sniper_trigger_times,
	--fixes some spawn typos
	[100683] = spawn_anim_fix,
	[100684] = spawn_anim_fix,
	[100789] = spawn_anim_fix,
	[100790] = spawn_anim_fix,
	[100791] = spawn_anim_fix
}