local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer_1 = math.rand(1)
local chance_dozer_2 = math.rand(1)
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
	if difficulty_index == 4 or difficulty_index == 5 then
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
		
	elseif difficulty_index == 6 or difficulty_index == 7 then	
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

	elseif difficulty_index == 8 then
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
	[101766] = {
		values = {
            enemy = dozer_1
		}
	},
	[101767] = {
		values = {
            enemy = dozer_1
		}
	},
	[101770] = {
		values = {
            enemy = dozer_1
		}
	},
	[101771] = {
		values = {
            enemy = dozer_2
		}
	},
	[101772] = {
		values = {
            enemy = dozer_2
		}
	},
	[101774] = {
		values = {
            enemy = dozer_2
		}
	},
	--fixed some of the scripted enemies not participating into group ai because ????
	[105006] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105009] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105011] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105014] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105019] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105021] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105024] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105035] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105038] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105040] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105043] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105048] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105050] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[103732] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105055] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105058] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105060] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105062] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105065] = {
		values = {
            participate_to_group_ai = true
		}
	},
	[105069] = {
		values = {
            participate_to_group_ai = true
		}
	}
}