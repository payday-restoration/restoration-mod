local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer_1 = math.random() 
local chance_dozer_2 = math.random() 
local dozer_ambush_chance_ovk = 50
local dozer_ambush_chance_dw = 65
local dozer_ambush_chance_ds = 80
local random_dozer = 1
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}
	--If we're in Pro Job, then change scripted dozers stuff
	if pro_job then
		random_dozer = 2
		dozer_ambush_chance_ovk = 70
		dozer_ambush_chance_dw = 80
		dozer_ambush_chance_ds = 100
	end	

	--Setting up the dozer randomizer, this is so cool
	if difficulty == 4 or difficulty == 5 then
		if chance_dozer_1 < 0.50 then
			dozer_1 = dozer_table.dozer_black
		else
			dozer_1 = dozer_table.dozer_green
		end
		
		if chance_dozer_2 < 0.50 then
			dozer_2 = dozer_table.dozer_black
		else
			dozer_2 = dozer_table.dozer_green
		end
		
	elseif difficulty == 6 or difficulty == 7 then	
		if chance_dozer_1 < 0.25 then
			dozer_1 = dozer_table.dozer_skull
		elseif chance_dozer_1 < 0.50 then
			dozer_1 = dozer_table.dozer_black
		else
			dozer_1 = dozer_table.dozer_green
		end
		
		if chance_dozer_2 < 0.25 then
			dozer_2 = dozer_table.dozer_skull
		elseif chance_dozer_2 < 0.50 then
			dozer_2 = dozer_table.dozer_black
		else
			dozer_2 = dozer_table.dozer_green
		end

	elseif difficulty == 8 then
		if chance_dozer_1 < 0.25 then
			dozer_1 = dozer_table.dozer_zeal_black
		elseif chance_dozer_1 < 0.50 then
			dozer_1 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_1 < 0.75 then
			dozer_1 = dozer_table.dozer_titan
		else
			dozer_1 = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_2 < 0.25 then
			dozer_2 = dozer_table.dozer_zeal_black
		elseif chance_dozer_2 < 0.50 then
			dozer_2 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_2 < 0.75 then
			dozer_2 = dozer_table.dozer_titan
		else
			dozer_2 = dozer_table.dozer_zeal_benelli
		end
	end
	
local participate_to_groupai = {
	values = {
        participate_to_group_ai = true
	}
}	
local dozer_1 = {
	values = {
        enemy = dozer_1
	}
}
local dozer_2 = {
	values = {
        enemy = dozer_2
	}
}	
return {
	--Pro Job Stuff
	[101783] = {
		values = {
            amount = random_dozer
		}
	},
	[101784] = {
		values = {
            amount = random_dozer
		}
	},
	[101723] = {
		values = {
            chance = dozer_ambush_chance_ovk
		}
	},
	[101779] = {
		values = {
            chance = dozer_ambush_chance_ovk
		}
	},
	[101780] = {
		values = {
            chance = dozer_ambush_chance_dw
		}
	},
	[101781] = {
		values = {
            chance = dozer_ambush_chance_ds
		}
	},
	--Dozers gets randomized
	[101766] = dozer_1,
	[101767] = dozer_1,
	[101770] = dozer_1,
	[101771] = dozer_2,
	[101772] = dozer_2,
	[101774] = dozer_2,
	--fixed some of the scripted enemies not participating into group ai because ????
	[105006] = participate_to_groupai,
	[105009] = participate_to_groupai,
	[105011] = participate_to_groupai,
	[105014] = participate_to_groupai,
	[105019] = participate_to_groupai,
	[105021] = participate_to_groupai,
	[105024] = participate_to_groupai,
	[105035] = participate_to_groupai,
	[105038] = participate_to_groupai,
	[105040] = participate_to_groupai,
	[105043] = participate_to_groupai,
	[105048] = participate_to_groupai,
	[105050] = participate_to_groupai,
	[103732] = participate_to_groupai,
	[105055] = participate_to_groupai,
	[105058] = participate_to_groupai,
	[105060] = participate_to_groupai,
	[105062] = participate_to_groupai,
	[105065] = participate_to_groupai,
	[105069] = participate_to_groupai
}