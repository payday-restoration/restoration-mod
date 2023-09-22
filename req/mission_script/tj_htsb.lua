local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if tweak_data:difficulty_to_index(difficulty) <= 2 then
	ponr_value = 900
elseif tweak_data:difficulty_to_index(difficulty) == 3 then
	ponr_value = 840
elseif tweak_data:difficulty_to_index(difficulty) == 4 then
	ponr_value = 780
elseif tweak_data:difficulty_to_index(difficulty) == 5 then
	ponr_value = 720
elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
	ponr_value = 660	
elseif tweak_data:difficulty_to_index(difficulty) == 8 then
	ponr_value = 900
end
    
    if Global.game_settings and Global.game_settings.one_down then	
        if tweak_data:difficulty_to_index(difficulty) == 5 or tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
            vet_on_break = "units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"
        end
    end
return {
	--Pro Job PONR 
	[103669] = {
		ponr = ponr_value
	},
    -- non bloddy vet cop probably smoking at the police station 
    [101606] = {
        values = {
         enemy =  vet_on_break
        }
    }
}