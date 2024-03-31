local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
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
	if difficulty == 5 or difficulty == 6 then
		chance_dozer = 50
	elseif difficulty == 7 or difficulty == 8 then
		chance_dozer = 75
	end
	
	--If we're in Pro Job, then increase the chance even further
	if pro_job then
	if difficulty == 5 or difficulty == 6 then
		chance_dozer = 75
	elseif difficulty == 7 or difficulty == 8 then
		chance_dozer = 100
	end
end	

	--Setting up the dozer randomizer, so cool
	if difficulty == 4 or difficulty == 5 then
		if chance_dozer_var < 0.50 then
			dozer = dozer_table.dozer_black
		else
			dozer = dozer_table.dozer_green
		end

	elseif difficulty == 6 or difficulty == 7 then	
		if chance_dozer_var < 0.25 then
			dozer = dozer_table.dozer_skull
		elseif chance_dozer_var < 0.50 then
			dozer = dozer_table.dozer_black
		else
			dozer = dozer_table.dozer_green
		end
		
	elseif difficulty == 8 then
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
	
	if difficulty <= 5 then
		ponr_value = 300	
	elseif difficulty == 6 or difficulty == 7 then
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