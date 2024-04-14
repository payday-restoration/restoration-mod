local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 600	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 540	
	else
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