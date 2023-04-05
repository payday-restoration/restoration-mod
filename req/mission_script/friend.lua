if Global.game_settings and Global.game_settings.one_down and not managers.groupai:state():whisper_mode() then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 750
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 720
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 690
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[101095] = {
		ponr = ponr_value,
		enabled = ponr_toggle
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
	 -- Disable Sosa retreat spot SO selection
	[101612] = {
		values = {
			enabled = false
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