local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local chance_dozer = ((difficulty == 8 or difficulty == 7) and 75 or (difficulty == 6 or difficulty == 5) and 50) or 25
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 5 and 300 or (difficulty == 6 or difficulty == 7) and 270) or 240

return {
	-- Pro Job PONR 
	[101374] = {
		ponr = ponr_value
	},
	[102218] = {
		values = {
            chance = chance_dozer
		},
	},
	-- Spawn the weekend boys in final hacking phase (i hope this is the right element for it)
	[102114] = {
		spawn_bravos = pro_job,
		values = {
			time = 10,
		},
	},
	-- FBI Ready Teams
	[100115] = {
		on_executed = {
			{ id = 400016, delay = 17, delay_rand = 3 }
		},
	},	
	-- Garage ambush
	[102022] = {
		on_executed = {
			{id =  400024, delay = 0, },
			-- smokebamb
			{ id = 400037, delay = 0.3, },
		},
	},
	[100109] = { -- Atrium, always active
		reinforce = {
			{
				name = "atrium_lower",
				force = 4,
				position = Vector3(-200, 4200, -500),
			},
			{
				name = "archive_counter",
				force = 2,
				position = Vector3 (1300, 4300,-500),
			},
		},
	},
	[100732] = { -- Activate operations room reinforce when the players are doing objectives
		reinforce = {
			{
				name = "operations_room",
				force = 4,
				position = Vector3(-200, 300, 0),
			},
		},
	},
	[100733] = {
		reinforce = {
			{ name = "operations_room" },
		},
	},
	-- Add reinforce around the operations room
	[101839] = { -- entrance_001
		reinforce = {
			{
				name = "entrance01",
				force = 2,
				position = Vector3(-200, 2200, -100),
			},
		},
	},
	[101840] = { -- entrance_002
		reinforce = {
			{
				name = "entrance02",
				force = 2,
				position = Vector3(975, 2200, -100),
			},
		},
	},
	[101841] = { -- entrance_003
		reinforce = {
			{
				name = "entrance03",
				force = 2,
				position = Vector3(1800, 625, -100),
			},
		},
	},
	[101842] = { -- entrance_004
		reinforce = {
			{
				name = "entrance04",
				force = 2,
				position = Vector3(1800, -600, -100),
			},
		},
	},
}