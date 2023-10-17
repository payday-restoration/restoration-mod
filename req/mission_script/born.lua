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
	[100720] = {
		ponr = ponr_value
	},
	-- Slow down roof and garage spawns
	[100007] = {
		values = {
			interval = 15
		}
	},
	[100128] = {
		values = {
			interval = 15
		}
	},
	--Have Vest Biker beat up Mike
	[100920] = {
		values = {
			enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	--Biker replacements
	[100254] = {
		values = {
			enemy =  "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[100295] = {
		values = {
			enemy =  "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[100301] = {
		values = {
			enemy =  "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[100373] = {
		values = {
			enemy = "units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"
		}
	},
	[100374] = {
		values = {
			enemy = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
		}
	},
	[100384] = {
		values = {
			enemy = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"
		}
	}
}