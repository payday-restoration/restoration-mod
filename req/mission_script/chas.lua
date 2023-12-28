local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local chance_dozer_var = math.rand(1)
local chance_dozer = 75
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}

if Global.game_settings and Global.game_settings.one_down then
	if difficulty_index == 8 then
		chance_dozer = 100
	end
end	


	--Setting up the dozer randomizer
	if difficulty_index == 6 or difficulty_index == 7 then
		if chance_dozer_var < 0.35 then
			dozer = dozer_table.dozer_skull
		elseif chance_dozer_var < 0.70 then
			dozer = dozer_table.dozer_black
		else
			dozer = dozer_table.dozer_green
		end
	end

	if difficulty_index == 8 then
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
		ponr_value = 540	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 480	
	else
		ponr_value = 420	
	end
	

return {
	--Pro Job PONR 
	[100818] = {
		ponr = ponr_value
	},
	--Technically should fix softlock when blowtorch interactions are unavailable. Also player can't abuse keys in loud
	[102704] = {
		on_executed = {
			{id = 101278, delay = 0}
		}
	},	
	--Always comment that all c4 are placed (why it's chance based to begin with, Overkill...)
	[103810] = {
		values = {
            chance = 100
		}
	},
	-- Need for scripted dozer changes
	[103809] = {
		on_executed = {
			{id = 102869, delay = 0}
		}
	},
	-- 100% chance to spawn dozer on DS
	[102869] = {
		values = {
            chance = chance_dozer
		}
	},
	--Dozer gets randomized + repositioned to the boat loot drop point
	[102870] = {
		values = {
            enemy = dozer,
			position = Vector3(-4574, 5314, -400)
		}
	},
	[101190] = {
		reinforce = {
			{
				name = "store_front1",
				force = 3,
				position = Vector3(-2000, 300, -10)
			},
			{
				name = "store_front2",
				force = 3,
				position = Vector3(-1000, 300, -10)
			}
		}
	},
	[101647] = {
		reinforce = {
			{
				name = "store_front2"
			},
			{
				name = "back_alley",
				force = 3,
				position = Vector3(-1400, 4900, 540)
			}
		}
	}
}