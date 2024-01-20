local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 640
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 520
	else
		ponr_value = 480
	end

return {
	--Pro Job PONR 
	[101174] = {
		ponr = ponr_value
	},
	--Dimitri's men are friendly to cops
	[101858] = { 
		values = {
			team = "law1"
		}
	},
	[101865] = { 
		values = {
			team = "law1"
		}
	},
	[101927] = { 
		values = {
			team = "law1"
		}
	},
	[101934] = { 
		values = {
			team = "law1"
		}
	},
	[102193] = { 
		values = {
			team = "law1"
		}
	},
	[102200] = { 
		values = {
			team = "law1"
		}
	},
	[102202] = { 
		values = {
			team = "law1"
		}
	},
	[102206] = { 
		values = {
			team = "law1"
		}
	},
	[102617] = { 
		values = {
			team = "law1"
		}
	},
	[102619] = { 
		values = {
			team = "law1"
		}
	},
	[100513] = { 
		values = {
			team = "law1"
		}
	},
	[100517] = { 
		values = {
			team = "law1"
		}
	},
	[100518] = { 
		values = {
			team = "law1"
		}
	},
	[100520] = { 
		values = {
			team = "law1"
		}
	},
	[100522] = { 
		values = {
			team = "law1"
		}
	},
	[100522] = { 
		values = {
			team = "law1"
		}
	},
	[100523] = { 
		values = {
			team = "law1"
		}
	},
	[100528] = { 
		values = {
			team = "law1"
		}
	},
	[100530] = { 
		values = {
			team = "law1"
		}
	},
	[100532] = { 
		values = {
			team = "law1"
		}
	},
	[100534] = { 
		values = {
			team = "law1"
		}
	},
	[101252] = { 
		values = {
			team = "law1"
		}
	},
	[102708] = { 
		values = {
			team = "law1"
		}
	},
	[102709] = { 
		values = {
			team = "law1"
		}
	},
	[103450] = { 
		values = {
			team = "law1"
		}
	},
	[103451] = { 
		values = {
			team = "law1"
		}
	},
	[103452] = { 
		values = {
			team = "law1"
		}
	},
	[103637] = { 
		values = {
			team = "law1"
		}
	},
	[103638] = { 
		values = {
			team = "law1"
		}
	},
	[103639] = { 
		values = {
			team = "law1"
		}
	},
	[100991] = { 
		values = {
			team = "law1"
		}
	},
	[100994] = { 
		values = {
			team = "law1"
		}
	},
	[101100] = { 
		values = {
			team = "law1"
		}
	},
	[101231] = { 
		values = {
			team = "law1"
		}
	},
	[101232] = { 
		values = {
			team = "law1"
		}
	},
	[101233] = { 
		values = {
			team = "law1"
		}
	},
	[102088] = { 
		values = {
			team = "law1"
		}
	},
	[102099] = { 
		values = {
			team = "law1"
		}
	}
}