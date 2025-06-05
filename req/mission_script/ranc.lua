-- TODO: convert PONRs to mission script add, add logic for delayed PONRs if going loud after already opening the gate in stealth
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value_1 = (difficulty <= 5 and 1560 or (difficulty == 6 or difficulty == 7) and 1530) or 1500
local ponr_value_2 = (difficulty <= 5 and 840 or (difficulty == 6 or difficulty == 7) and 810) or 780

local sniper_trigger_times = {
	values = {
		trigger_times = 0,
	},
}
local spawn_anim_fix = {
	values = {
		spawn_action = "e_sp_over_3m",
	},
}
local ponr_timer_player_mul = {
	1,
	0.85,
	0.7,
	0.65,  -- 4+ players
}

return {
	-- Pro Job PONR
	-- On water tower collapsing (starting with the laptop)
	[101425] = {
		ponr = {
			length = ponr_value_1,
			player_mul = ponr_timer_player_mul,
		},
	},
	-- On opening the mid gate with C4 (starting with the weapons)
	[100929] = {
		ponr = {
			length = ponr_value_2,
			player_mul = ponr_timer_player_mul,
		},
	},
	-- Fixed snipers being able to spawn only once
	[100368] = sniper_trigger_times,
	[100369] = sniper_trigger_times,
	[100370] = sniper_trigger_times,
	[100371] = sniper_trigger_times,
	-- Fixes some spawn typos
	[100683] = spawn_anim_fix,
	[100684] = spawn_anim_fix,
	[100789] = spawn_anim_fix,
	[100790] = spawn_anim_fix,
	[100791] = spawn_anim_fix,
	[100022] = {  -- Alarm
		reinforce = {  -- Add all at once so they get populated quickly (from Eclipse)
			{
				name = "fork",
				force = 4,  -- Fuck huge navseg
				position = Vector3(-2015, -145, 200),
			},
			{
				name = "main_gate1",
				force = 4,  -- Fuck huge navseg
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
				position = Vector3(2985, -7040, 400),  -- GO Bank car near some un-enterable sheds
			},
			{
				name = "barn1",
				force = 2,
				position = Vector3(6755, 5320, 400),  -- Exit by shooting range
			},
			{
				name = "barn2",
				force = 2,
				position = Vector3(4285, 5215, 400),  -- Exit by stealth secure point
			},
			{
				name = "workshop_a",  -- Labelled in editor
				force = 3,
				position = Vector3(3070, 2890, 400),
			},
			{
				name = "workshop_c",  -- Labelled in editor
				force = 3,
				position = Vector3(9215, 1625, 450),
			},
		},
	},
}
