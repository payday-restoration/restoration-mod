local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local amount_guards = 8

	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630	
	else
		ponr_value = 600		
	end

	if difficulty_index == 8 then	
		amount_guards = 12
	end
	
	if shadow_fucked_me_hard then	
		enforcer_guard = "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"
	end
	
return {
	--Pro Job PONR + Players now can steal paintings when boat escape triggered (if we do it on stealth tho)
	[100216] = {
		ponr = ponr_value,
		on_executed = {
			{ id = 101070, delay = 0 }
		}
	},
	-- Enter main hall
	[103594] = {
		difficulty = 0.5
	},
	-- Boss spawn
	[101101] = {
		difficulty = 0.1
	},
	-- Boss dead, safe objective
	[101169] = {
		difficulty = 1
	},
	-- Disable Sosa retreat on low health during boss fight
	[101596] = {
		values = {
			enabled = false
		}
	},
	-- Fallback to make Sosa retreat when house is accessible
	[102653] = {
		on_executed = {
			{ id = 102692, delay = 0 }
		}
	},
	 --forcing boat escape
	[100213] = {
		values = {
			enabled = false
		}
	},
	[100214] = {
		values = {
			enabled = false
		}
	},
	[103446] = {
		values = {
			enabled = false --don't even try.....
		}
	},
	--Force spawn all possible guards during Sosa fight (DS only)
	[101725] = {
		values = {
			amount = amount_guards
		}
	},
	--Spawn enforcers during Sosa fight on PJ
	[101845] = {
		values = {
            enemy = enforcer_guard
		}
	},
	[101868] = {
		values = {
            enemy = enforcer_guard
		}
	},
	--You're Sosa's men, not undercover cops
	[100852] = { 
		values = {
			team = "mobster1"
		}
	},
	[100854] = { 
		values = {
			team = "mobster1"
		}
	},
	[100855] = { 
		values = {
			team = "mobster1"
		}
	},
	[100856] = { 
		values = {
			team = "mobster1"
		}
	},
	[100857] = { 
		values = {
			team = "mobster1"
		}
	},
	[100858] = { 
		values = {
			team = "mobster1"
		}
	},
	[100858] = { 
		values = {
			team = "mobster1"
		}
	},
	[100859] = { 
		values = {
			team = "mobster1"
		}
	},
	[100860] = { 
		values = {
			team = "mobster1"
		}
	},
	[100861] = { 
		values = {
			team = "mobster1"
		}
	},
	[100862] = { 
		values = {
			team = "mobster1"
		}
	},
	[100863] = { 
		values = {
			team = "mobster1"
		}
	},
	[101185] = { 
		values = {
			team = "mobster1"
		}
	},
	[101185] = { 
		values = {
			team = "mobster1"
		}
	},
	[101189] = { 
		values = {
			team = "mobster1"
		}
	},
	[101771] = { 
		values = {
			team = "mobster1"
		}
	},
	[102301] = { 
		values = {
			team = "mobster1"
		}
	},
	[102395] = { 
		values = {
			team = "mobster1"
		}
	},
	[102399] = { 
		values = {
			team = "mobster1"
		}
	},
	[102404] = { 
		values = {
			team = "mobster1"
		}
	},
	[102408] = { 
		values = {
			team = "mobster1"
		}
	},
	[102419] = { 
		values = {
			team = "mobster1"
		}
	},
	[102421] = { 
		values = {
			team = "mobster1"
		}
	},
	[102532] = { 
		values = {
			team = "mobster1"
		}
	},
	[102535] = { 
		values = {
			team = "mobster1"
		}
	},
	[102538] = { 
		values = {
			team = "mobster1"
		}
	},
	[102540] = { 
		values = {
			team = "mobster1"
		}
	},
	[102542] = { 
		values = {
			team = "mobster1"
		}
	},
	[102544] = { 
		values = {
			team = "mobster1"
		}
	},
	[102546] = { 
		values = {
			team = "mobster1"
		}
	},
	[102548] = { 
		values = {
			team = "mobster1"
		}
	},
	[102550] = { 
		values = {
			team = "mobster1"
		}
	},
	[102553] = { 
		values = {
			team = "mobster1"
		}
	},
	[102557] = { 
		values = {
			team = "mobster1"
		}
	},
	[102559] = { 
		values = {
			team = "mobster1"
		}
	},
	[102562] = { 
		values = {
			team = "mobster1"
		}
	},
	[102565] = { 
		values = {
			team = "mobster1"
		}
	},
	[102569] = { 
		values = {
			team = "mobster1"
		}
	},
	[102572] = { 
		values = {
			team = "mobster1"
		}
	},
	[102576] = { 
		values = {
			team = "mobster1"
		}
	},
	[102578] = { 
		values = {
			team = "mobster1"
		}
	},
	[102581] = { 
		values = {
			team = "mobster1"
		}
	},
	[102583] = { 
		values = {
			team = "mobster1"
		}
	}
}