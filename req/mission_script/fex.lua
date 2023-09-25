local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if tweak_data:difficulty_to_index(difficulty) <= 5 then
		ponr_value = 600	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 540	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 480		
	end

return {
	--Pro Job PONR 
	[102921] = {
		ponr = ponr_value
	},
	-- Don't kill off enemies in courtyard/patio
	[102903] = {
		values = {
			enabled = false
		}
	},
	[102904] = {
		values = {
			enabled = false
		}
	},
	--replace American Secret Service
	[102750] = {
		values = {
			enemy = "units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3"
		}
	}
}