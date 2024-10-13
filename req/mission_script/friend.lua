local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local amount_guards = (difficulty == 8 and 12) or 8
local enforcer_guard = (pro_job and "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer")
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600

local mobster_team = {
	values = {
		team = "mobster1"
	}
}	
local disabled = {
	values = {
        enabled = false
	}
}	
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
	[101596] = disabled,
	-- Fallback to make Sosa retreat when house is accessible
	[102653] = {
		on_executed = {
			{ id = 102692, delay = 0 }
		}
	},
	 --forcing boat escape
	[100213] = disabled,
	[100214] = disabled,
	[103446] = disabled, --don't even try.....
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
	--Sosa gets two additional ninja like gangsters on DSPJ
	[101101] = {
		on_executed = {
			{ id = 400001, delay = 0 },
			{ id = 400002, delay = 0 }
		}
	},
	--Change Sosa's line to more apporiate one (having chance to say the famous Scarface quote)
	[101485] = {
		values = {
            sound_event = "Play_bos_fri_04"
		}
	},
	--You're Sosa's men, not undercover cops
	[100852] = mobster_team,
	[100854] = mobster_team,
	[100855] = mobster_team,
	[100856] = mobster_team,
	[100857] = mobster_team,
	[100858] = mobster_team,
	[100858] = mobster_team,
	[100859] = mobster_team,
	[100860] = mobster_team,
	[100861] = mobster_team,
	[100862] = mobster_team,
	[100863] = mobster_team,
	[101185] = mobster_team,
	[101185] = mobster_team,
	[101189] = mobster_team,
	[101771] = mobster_team,
	[102301] = mobster_team,
	[102395] = mobster_team,
	[102399] = mobster_team,
	[102404] = mobster_team,
	[102408] = mobster_team,
	[102419] = mobster_team,
	[102421] = mobster_team,
	[102532] = mobster_team,
	[102535] = mobster_team,
	[102538] = mobster_team,
	[102540] = mobster_team,
	[102542] = mobster_team,
	[102544] = mobster_team,
	[102546] = mobster_team,
	[102548] = mobster_team,
	[102550] = mobster_team,
	[102553] = mobster_team,
	[102557] = mobster_team,
	[102559] = mobster_team,
	[102562] = mobster_team,
	[102565] = mobster_team,
	[102569] = mobster_team,
	[102572] = mobster_team,
	[102576] = mobster_team,
	[102578] = mobster_team,
	[102581] = mobster_team,
	[102583] = mobster_team
}