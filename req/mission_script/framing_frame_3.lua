local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 360	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 330	
	else
		ponr_value = 300		
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

return {
	--Pro Job PONR 
	[100930] = {
		ponr = ponr_value
	},
	--PONR for stealth
	[104156] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value * 2
	},
	--Disable unnecceary invulnerability for patrol guard
	[105930] = {
		values = {
			invulnerable = false
		}
	},
	-- Fix power cut SO delay and add some random delay
	[104685] = {
		values = {
			base_delay = 15,
			base_delay_rand = 15
		}
	},
	-- Always have 3 power boxes to defend regardless of difficulty
	[104661] = {
		values = {
			amount = 3
		}
	},
	[105352] = {
		values = {
			amount = 3
		}
	},
	-- Don't play the "Ah, that's the vault guys" dialogue if vault has been opened in stealth
	--[[[105757] = {
		values = {
			enabled = false
		},
		on_executed = {
			{id = 105221, delay = 0}
		}
	},
	[100750] = {
		on_executed = {
			{id = 105757, delay = 0}
		}
	},	]]--
	--Activate zipline when wine is picked up
	[105900] = {
		values = {
			counter_target = 1
		}--[[,--This enable waypoint.
		on_executed = {
			{id = 104569, delay = 0}
		}]]--
	},
	--Wine now giving it's bag value if secured by zipline
	[105224] = {
		values = {
			operation = "secure"
		}
	}
}