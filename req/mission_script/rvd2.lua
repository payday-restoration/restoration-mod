local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 600
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 570	
	else
		ponr_value = 540	
	end

return {
	--Pro Job PONR
	[101106] = {
		ponr = ponr_value
	},
	--Disable the SWAT Turrets, why would they add those fucking annoying turrets in this day, spawning reinforcments is already ENOUGH!!!!
	[101147] = {
		values = {
			enabled = false
		}
	},
	-- Reduce amount of ambush bulldozers
	[101557] = {
		values = {
			enabled = false
		}
	},
	[100567] = {
		values = {
			enabled = false
		}
	},
	[101575] = {
		values = {
			enabled = false
		}
	},
	--less skulldozers (seriously Jules, stop it)
	[100485] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		}
	},
	[100499] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		}
	},
	[101176] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		}
	},
	[101398] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		}
	},
	[101182] = { 
		values = {
            enemy = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		}
	}
}