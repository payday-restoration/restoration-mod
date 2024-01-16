local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local chance_dozer_1 = math.rand(1)
local chance_dozer_2 = math.rand(1)
local ambush_unit_amount = 1
local ambush_unit_amount_random = 2 
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
}

--If we're in Pro Job, then do this shit below
if shadow_fucked_me_hard then
	--First, replace scripted shields and harassers with titan shields/snipers
	if difficulty_index >= 5 then
		australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
	--DS, has Titan cloaker replace scripted escape cloaker and have more units during escape part
	if difficulty_index == 8 then
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		ambush_unit_amount = 2
		ambush_unit_amount_random = 3 
	end
end


	--Setting up the dozer randomizer, so cool
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
	 --flashlights, flashlights, flashlights!!!!!!!!!! (enables/disables flashlights when the power is off/on like in PDTH)
	[100756] = {
			flashlight = true
	},
	[101801] = {
			flashlight = false
	},
	--Give saw to all players (Resmod edit not always give saw for every player)
	[101865] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	},
	--dozers gets randomized
	[102433] = {
		values = {
            enemy = dozer_1
		}
	},
	[102434] = {
		values = {
            enemy = dozer_2
		}
	},
	--Pro Job Stuff
	--More squad units waiting at the escape on DSPJ
	[102424] = {
		values = {
            amount = ambush_unit_amount,
			amount_random = ambush_unit_amount_random
		}
	},
	--Titan Cloaker on DSPJ
	[102409] = {
		values = {
            enemy = woman_spooc
		}
	},
	--Titan Shields replace regular ones during escape part
	[102410] = {
		values = {
            enemy = titan_shield
		}
	},
	[102411] = {
		values = {
            enemy = titan_shield
		}
	},
	[102416] = {
		values = {
            enemy = titan_shield
		}
	},
	[102417] = {
		values = {
            enemy = titan_shield
		}
	},
	--Titan Snipers replace some SWAT Harassers on Pro Jobs
	[103228] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103234] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103235] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103237] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103839] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103841] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103843] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103845] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103847] = {
		values = {
            enemy = australian_sniper
		}
	},
	[103849] = {
		values = {
            enemy = australian_sniper
		}
	}
}	
