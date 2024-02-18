local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 300	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 360	
	else
		ponr_value = 420		
	end

return {
	--Pro Job PONR 
	[103069] = {
		ponr = ponr_value
	}
	--Disables the SWAT Turret
	--Commented this out since the SWAT Turret is in good position now
	--[[
	[103630] = {
		values = {
			enabled = false
		}
	},
	[103631] = {
		values = {
			enabled = false
		}
	}
	]]--
}