local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 750
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 720
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 690
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR
	[103031] = {
			ponr = ponr_value,
			enabled = ponr_toggle
	},
	--change beat cops
	[100634] = {
		values = {
            enemy = "units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest"
		}
	},
	[100635] = {
		values = {
            enemy = "units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest"
		}
	}
}