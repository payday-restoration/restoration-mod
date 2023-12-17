local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local chance_dozer_var = math.rand(1)
local chance_cloaker_var_1 = math.rand(1)
local chance_cloaker_var_2 = math.rand(1)
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}
local cloaker_table = {
	spooc = "units/payday2/characters/ene_spook_1/ene_spook_1",
	zeal_spooc = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
	woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}

	--Setting up the dozer randomizer
	if difficulty_index == 4 or difficulty_index == 5 then
		if chance_dozer_var < 0.50 then
			dozer = dozer_table.dozer_black
		else
			dozer = dozer_table.dozer_green
		end
	elseif difficulty_index == 6 or difficulty_index == 7 then
		if chance_dozer_var < 0.35 then
			dozer = dozer_table.dozer_skull
		elseif chance_dozer_var < 0.70 then
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
	
	--setting up the cloaker randomizer
	if difficulty_index <= 7 then
		clonker = cloaker_table.spooc
		clonker_2 = cloaker_table.spooc
	else
		if chance_cloaker_var_1 < 0.50 then
			clonker = cloaker_table.zeal_spooc
		else
			clonker = cloaker_table.woman_spooc
		end
		if chance_cloaker_var_2 < 0.50 then
			clonker_2 = cloaker_table.zeal_spooc
		else
			clonker_2 = cloaker_table.woman_spooc
		end
	end
	
return {
	--Replace Heavy SWATs that spawn from the chopper with cloakers
	[101571] = {
		values = {
            enemy = clonker
		}
	},
	[101572] = {
		values = {
            enemy = clonker_2
		}
	},
	--dozer gets randomized
	[100952] = {
		values = {
            enemy = dozer
		}
	}
}