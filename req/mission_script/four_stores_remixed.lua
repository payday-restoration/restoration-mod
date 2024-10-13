local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 300 or (difficulty == 6 or difficulty == 7) and 360) or 420

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