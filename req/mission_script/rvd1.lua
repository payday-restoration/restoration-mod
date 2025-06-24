local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job

return {
		--Pro Job PONR+Endless Assault
		[100727] = {
			ponr = ponr_value,
			hunt = hunt_projob
		},
	-- Add new reinforce
	[100109] = {
		reinforce = {
			{
				name = "street",
				force = 3,
				position = Vector3(-3150, -500, 0),
			},
			{
				name = "parking_lot",
				force = 3,
				position = Vector3(200, -1150, 0),
			},
		},
	},
	-- Place the reinforce point near the car crash site
	[101096] = {
		reinforce = {
			{
				name = "pink_car1",
				force = 2,
				position = Vector3(-3100, 1400, 0),
			},
		},
	},
	[101130] = {
		reinforce = {
			{ name = "pink_car1" },
		},
	},
	[101095] = {
		reinforce = {
			{
				name = "pink_car2",
				force = 2,
				position = Vector3(-2100, -1200, 0),
			},
		},
	},
	[101200] = {
		reinforce = {
			{ name = "pink_car2" },
		},
	},
	[101101] = {
		reinforce = {
			{
				name = "pink_car3",
				force = 2,
				position = Vector3(-400, 0, 0),
			},
		},
	},
	[101195] = {
		reinforce = {
			{ name = "pink_car3" },
		},
	},
	[100545] = {
		reinforce = {
			{
				name = "pink_car4",
				force = 2,
				position = Vector3(-4700, -2000, 0),
			},
		},
	},
	[101543] = {
		reinforce = {
			{ name = "pink_car4" },
		},
	},
}