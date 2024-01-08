local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down

	if difficulty_index <= 5 then
		ponr_value = 720
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 660	
	else
		ponr_value = 600
	end
    
    if shadow_fucked_me_hard and difficulty_index == 8 then	
        vet_on_break = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
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