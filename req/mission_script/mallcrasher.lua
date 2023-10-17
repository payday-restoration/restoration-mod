local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 300	
	else
		ponr_value = 480
	end

return {
	--Pro Job PONR 
	[300204] = {
		ponr = ponr_value
	},
	-- Delay SWAT response
	[300203] = {
		on_executed = {
			{ id = 300164, delay = 45 }
		}
	},
	-- access fix (doesn't work for some reason)
	[302019] = {
		values = {
			SO_access = "96"
		}
	},
	[302021] = {
		values = {
			SO_access = "96"
		}
	},
	[302022] = {
		values = {
			SO_access = "96"
		}
	}
}