local so_action_fix = {
	values = {
		so_action = "e_nl_down_9_3m_rappel"
	}
}

return {
	-- Fix Prison Nightmare SO animations
	[100347] = so_action_fix,
	[100348] = so_action_fix,
	[100349] = so_action_fix,
	[100351] = so_action_fix,
	[100352] = so_action_fix,
	[100353] = so_action_fix,
	[100354] = so_action_fix,
	[100355] = so_action_fix,
	[100360] = so_action_fix,
	--PONR at the end of the heist
	[101715] = {
		ponr = 300
	}
}