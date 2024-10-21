local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down 
local dozer_ambush_chance_ovk = (pro_job and 70) or 50
local dozer_ambush_chance_dw = (pro_job and 80) or 65
local dozer_ambush_chance_ds = (pro_job and 100) or 80
local bravos_inbound = (pro_job and true) or false
local hunt_projob = pro_job
local ponr_timer = 360
local random_dozer = (pro_job and 2) or 1
local boat_timer = (pro_job and 180) or 120
local max_diff = (pro_job and 1)
	
local participate_to_groupai = {
	values = {
        participate_to_group_ai = true
	}
}	
return {
	--Pro Job PONR+Bravos+Endless Assault
	--Also increases the difficulty curve to 1
	[103885] = {
		ponr = ponr_timer,
		hunt = hunt_projob,
		--spawn_bravos = bravos_inbound,
		difficulty = max_diff
	},
	--Increase the timer of boat arrival on loud
	[103662] = {
		values = {
            timer = boat_timer
		}
	},
	[101579] = {
		values = {
            time = 10
		}
	},
	[101580] = {
		values = {
            time = 10
		}
	},
	--increase power cut delay from literally fucking 0 (from ASS)
	[100549] = {
		on_executed = {
			{ id = 103658, delay = 10, delay_rand = 10 }
		}
	},
	[103827] = {
		on_executed = {
			{ id = 103828, delay = 10, delay_rand = 10 }
		}
	},
	--Pro Job Stuff
	[101783] = {
		values = {
            amount = random_dozer
		}
	},
	[101784] = {
		values = {
            amount = random_dozer
		}
	},
	[101723] = {
		values = {
            chance = dozer_ambush_chance_ovk
		}
	},
	[101779] = {
		values = {
            chance = dozer_ambush_chance_ovk
		}
	},
	[101780] = {
		values = {
            chance = dozer_ambush_chance_dw
		}
	},
	[101781] = {
		values = {
            chance = dozer_ambush_chance_ds
		}
	},
	--fixed some of the scripted enemies not participating into group ai because ????
	[105006] = participate_to_groupai,
	[105009] = participate_to_groupai,
	[105011] = participate_to_groupai,
	[105014] = participate_to_groupai,
	[105019] = participate_to_groupai,
	[105021] = participate_to_groupai,
	[105024] = participate_to_groupai,
	[105035] = participate_to_groupai,
	[105038] = participate_to_groupai,
	[105040] = participate_to_groupai,
	[105043] = participate_to_groupai,
	[105048] = participate_to_groupai,
	[105050] = participate_to_groupai,
	[103732] = participate_to_groupai,
	[105055] = participate_to_groupai,
	[105058] = participate_to_groupai,
	[105060] = participate_to_groupai,
	[105062] = participate_to_groupai,
	[105065] = participate_to_groupai,
	[105069] = participate_to_groupai
}