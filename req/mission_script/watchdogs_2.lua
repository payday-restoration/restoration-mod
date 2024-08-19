local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")	
	
	if difficulty <= 5 then
		ponr_value = 1080
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020		
	end
	
	local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}

local enabled = {
	values = {
        enabled = true
	}
}
return {
	--Pro Job PONR 
	[100324] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Enable unused Reinforce spots
	--didn't knew that day 2 had reinforce spots to begin with
	[101954] = enabled,
	[101955] = enabled,
	[101984] = enabled,
	[101987] = enabled,
	[102123] = enabled,
	[102125] = enabled,
	[102126] = enabled,
	[100210] = {
		values = {
			enabled = false
		}
	},
	--Spawn FBI Ready Teams
	--Spawn Ground Snipers after 3 minutes
	--Spawn a scripted dozer after 150 seconds
	[100486] = {
		on_executed = {
			{ id = 400054, delay = 25 },
			{ id = 400058, delay = 150 },
			{ id = 400056, delay = 180 }
		}
	},
	--Spawn Snipers on the ships
	[102182] = {
		on_executed = {
			{ id = 400013, delay = 20 }
		}
	},
	[102388] = {
		on_executed = {
			{ id = 400014, delay = 20 }
		}
	},
	[102335] = {
		on_executed = {
			{ id = 400015, delay = 20 }
		}
	}
}