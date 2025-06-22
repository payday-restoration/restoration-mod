local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down

local participate_to_group_ai = {
	values = {
		participate_to_group_ai = true,
	},
}
local random_dozer = {
	values = {
		amount_random = pro_job and 1 or 0,
	},
}
local dozer_ambush_chance = {
	values = {
		-- chance = difficulty <= 5 and (pro_job and 70 or 50) or difficulty <= 7 and (pro_job and 80 or 65) or (pro_job and 100 or 80),
		chance = (difficulty * 10) + (pro_job and 10 or 0),
	},
}
local boat_timer = {
	values = {
		timer = pro_job and 180 or 120,
	},
}
local vlad_will_die_in_ponr_tweak = {
	values = {
		bravos_forbidden = true,
	},
}
local pro_job_ponr = {
	on_executed = {
		{ id = 400003, delay = 0, },
	},
}

return {
	-- Vanilla PONRs don't spike difficulty
	[103923] = vlad_will_die_in_ponr_tweak,
	[103870] = vlad_will_die_in_ponr_tweak,
	-- Pro Job PONR + Bravos + Endless Assault
	[103885] = pro_job_ponr,
	[100824] = pro_job_ponr,
	-- Increase the timer of boat arrival on loud
	[103662] = boat_timer,
	-- Increase power cut delay from literally fucking 0 (from ASS)
	[100549] = {
		on_executed = {
			{ id = 103658, delay = 10, delay_rand = 10, },
		},
	},
	[103827] = {
		on_executed = {
			{ id = 103828, delay = 10, delay_rand = 10, },
		},
	},
	-- Pro Job Stuff
	[101783] = random_dozer,
	[101784] = random_dozer,
	[101723] = dozer_ambush_chance,
	[101779] = dozer_ambush_chance,
	[101780] = dozer_ambush_chance,
	[101781] = dozer_ambush_chance,
	-- Fixed some of the scripted enemies not participating to GroupAI because ????
	[105006] = participate_to_group_ai,
	[105009] = participate_to_group_ai,
	[105011] = participate_to_group_ai,
	[105014] = participate_to_group_ai,
	[105019] = participate_to_group_ai,
	[105021] = participate_to_group_ai,
	[105024] = participate_to_group_ai,
	[105035] = participate_to_group_ai,
	[105038] = participate_to_group_ai,
	[105040] = participate_to_group_ai,
	[105043] = participate_to_group_ai,
	[105048] = participate_to_group_ai,
	[105050] = participate_to_group_ai,
	[103732] = participate_to_group_ai,
	[105055] = participate_to_group_ai,
	[105058] = participate_to_group_ai,
	[105060] = participate_to_group_ai,
	[105062] = participate_to_group_ai,
	[105065] = participate_to_group_ai,
	[105069] = participate_to_group_ai,
}
