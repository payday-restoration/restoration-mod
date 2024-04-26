local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

	if difficulty <= 5 then
		ponr_value = 300	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 360	
	else
		ponr_value = 420		
	end

return {
	--Pro Job PONR 
	[103069] = {
		ponr = ponr_value
	},
	--Disable Titan Cams
	[103683] = {
		values = {
			enabled = false
		}
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