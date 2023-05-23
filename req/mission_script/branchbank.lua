local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

bulldozer = ""

	if tweak_data:difficulty_to_index(difficulty) <= 6 then
		bulldozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 7 then
		bulldozer = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		bulldozer = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
	end

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 450
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 420
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 390
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 360
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 330
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 300
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[104452] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[104715] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[104716] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	--Have Blackdozers spawn on Mayhem from Tear Gas Choppa
	[101785] = {
		values = {
			enemy = bulldozer
		}
	},
	[101786] = {
		values = {
			enemy = bulldozer
		}
	}
}