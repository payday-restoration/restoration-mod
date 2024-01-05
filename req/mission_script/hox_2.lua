local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local chance_dozer_var = math.rand(1)
local chance_dozer = 25
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}

	--Increase chance of spawning scripted dozer
	if difficulty_index == 5 or difficulty_index == 6 then
		chance_dozer = 50
	elseif difficulty_index == 7 or difficulty_index == 8 then
		chance_dozer = 75
	end
	
	--If we're in Pro Job, then increase the chance even further
	if shadow_fucked_me_hard then
	if difficulty_index == 5 or difficulty_index == 6 then
		chance_dozer = 75
	elseif difficulty_index == 7 or difficulty_index == 8 then
		chance_dozer = 100
	end
end	

	--Setting up the dozer randomizer, so cool
	if difficulty_index == 4 or difficulty_index == 5 then
		if chance_dozer_var < 0.50 then
			dozer = dozer_table.dozer_black
		else
			dozer = dozer_table.dozer_green
		end

	elseif difficulty_index == 6 or difficulty_index == 7 then	
		if chance_dozer_var < 0.25 then
			dozer = dozer_table.dozer_skull
		elseif chance_dozer_var < 0.50 then
			dozer = dozer_table.dozer_black
		else
			dozer = dozer_table.dozer_green
		end
		
	elseif difficulty_index == 8 then
		if chance_dozer_var < 0.25 then
			dozer = dozer_table.dozer_zeal_black
		elseif chance_dozer_var < 0.50 then
			dozer = dozer_table.dozer_zeal_skull
		elseif chance_dozer_var < 0.75 then
			dozer = dozer_table.dozer_titan
		else
			dozer = dozer_table.dozer_zeal_benelli
		end
	end
	
	if difficulty_index <= 5 then
		ponr_value = 300	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 270
	else
		ponr_value = 240	
	end

return {
	--Pro Job PONR 
	[101374] = {
		ponr = ponr_value
	},
	[102218] = {
		values = {
            chance = chance_dozer
		}
	},
	--Dozer gets randomized
	[102214] = {
		values = {
            enemy = dozer
		}
	}
	
}