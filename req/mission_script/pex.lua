local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

return {
	-- Pro Job PONR+Hunt (Endless Assault)
	[101397] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	-- End PONR once everyone is inside the escape zone
	[100357] = {
        ponr_end = true
    },
	-- Beat Cop mini wave (you really kicke the beehive just to breakout a drunk guy)
	[101667] = {
		on_executed = {
			{ id = 400037, delay = 17, delay_rand = 3  },
		},
	},
	-- Swat vans  with a spawngroup
	[104070] = { -- arrive 1
		on_executed = {
			{ id = 400005, delay = 0, delay_rand = 5 },
		},
	},
	[104068] = { -- arrive 2
		on_executed = {
			{ id = 400012, delay = 0, delay_rand = 5 },
		},
	},
	[104066] = { -- arrive 3
		on_executed = {
			{ id = 400019, delay = 0, delay_rand = 5 },
		},
	},
	[104141] = { -- arrive 4
		on_executed = {
			{ id = 400026, delay = 0, delay_rand = 5 },
		},
	},
	-- Add new reinforce
	[100109] = { -- Police arrived
		reinforce = {
			{
				name = "parking_lot01",
				force = 3,
				position = Vector3(-1100, -400, 0),
			},
			{
				name = "parking_lot02",
				force = 3,
				position = Vector3(1800, -400, 0),
			},
			{
				name = "parking_lot03",
				force = 3,
				position = Vector3(525, -1325, 0),
			},
		},
	},
	[101584] = { -- fire done
		reinforce = {
			{
				name = "entrance",
				force = 2,
				position = Vector3(775, 925, 100),
			},
			{
				name = "alley",
				force = 2,
				position = Vector3(-1075, 3800, 0),
			},
		},
	},
	[102193] = { -- cell block door opens
		reinforce = {
			{
				name = "cells",
				force = 2,
				position = Vector3(-2300, 3925, 0),
			},
			{
				name = "garage",
				force = 3,
				position = Vector3(-4550, -825, -260),
			},
		},
	},
}