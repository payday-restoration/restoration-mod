local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630	
	else
		ponr_value = 600		
	end

return {
		--Pro Job PONR 
		[102872] = {
			ponr = ponr_value
	},
	[101687] = {
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false,
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	},
	[102827] = {
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false
		}
	},
	-- Delay SWAT response
	[100327] = {
		on_executed = {
			{ id = 100768, delay = 30 }
		}
	}
}