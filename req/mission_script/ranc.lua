local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value_1 = (difficulty <= 5 and 1560 or (difficulty == 6 or difficulty == 7) and 1530) or 1500
local ponr_value_2 = (difficulty <= 5 and 840 or (difficulty == 6 or difficulty == 7) and 810) or 780
	
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

	reinforce = { -- add all at once so they get populated quickly (from Eclipse)
			{
				name = "fork",
				force = 4, -- fuck huge navseg
				position = Vector3(-2015, -145, 200),
			},
			{
				name = "main_gate1",
				force = 4, -- fuck huge navseg
				position = Vector3(5670, 1125, 400),
			},
			{
				name = "main_gate2",
				force = 4,
				position = Vector3(5310, -1090, 400),
			},
			{
				name = "outside_garage",
				force = 2,
				position = Vector3(7875, -9315, 400),
			},
			{
				name = "such_a_nice_car",
				force = 2,
				position = Vector3(2985, -7040, 400), -- go bank car near some un-enterable sheds
			},
			{
				name = "barn1",
				force = 2,
				position = Vector3(6755, 5320, 400), -- exit by shooting range
			},
			{
				name = "barn2",
				force = 2,
				position = Vector3(4285, 5215, 400), -- exit by stealth secure point
			},
			{
				name = "workshop_a", -- labelled in editor
				force = 3,
				position = Vector3(3070, 2890, 400),
			},
			{
				name = "workshop_c", -- labelled in editor
				force = 3,
				position = Vector3(9215, 1625, 450),
			},
		},
}