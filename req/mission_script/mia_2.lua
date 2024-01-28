local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer_left = math.rand(1)
local chance_dozer_middle = math.rand(1)
local chance_dozer_right = math.rand(1)
local chance_titan_swat_left = math.rand(1)
local chance_titan_swat_right = math.rand(1)
local chance_elite = math.rand(1)
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2"
}
local titan_table = { 
	titan_swat_rifle = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	titan_swat_shotgun = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
	titan_hrt = "units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1",
	omnia_lpf = "units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf",
	titan_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
	titan_taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
	invis_woman = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}

	if difficulty_index <= 5 then
		ponr_value = 330
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 300
	else
		ponr_value = 240		
	end
    
	
	--Setting up scirpted SWAT spawns
	if difficulty_index <= 4 then
		shield_unit = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
		shotgun_unit = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"
	elseif difficulty_index == 5 then
		shield_unit = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"
		shotgun_unit = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"		
	elseif difficulty_index == 6 or difficulty_index == 7 then
		shield_unit = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec"
		shotgun_unit = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
	else
		shield_unit = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		shotgun_unit = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end
	
	--Titan Shields replace usual scripted shields on OVK+ with PJ
	if pro_job and difficulty_index >= 5 then	
		shield_unit = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		--2 scripted SWAT units will be replaced by titan SWAT
		if chance_titan_swat_left < 0.5 then
			titan_swat_left = titan_table.titan_swat_rifle
		else
			titan_swat_left = titan_table.titan_swat_shotgun
		end
		if chance_titan_swat_right < 0.5 then
			titan_swat_right = titan_table.titan_swat_rifle
		else
			titan_swat_right = titan_table.titan_swat_shotgun
		end
	end
	
	
	--Random titan unit for Mayhem+. Otherwise - vet cop
	if difficulty_index <= 5 then
		random_elite_unit = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
	else
		if difficulty_index ~= 8 then
			if chance_elite < 0.25 then
				random_elite_unit = titan_table.titan_hrt
			elseif chance_elite < 0.50 then
				random_elite_unit = titan_table.omnia_lpf
			elseif chance_elite < 0.75 then
				random_elite_unit = titan_table.titan_sniper
			else
				random_elite_unit = titan_table.titan_taser
			end
		else
			if chance_elite < 0.20 then
				random_elite_unit = titan_table.titan_hrt
			elseif chance_elite < 0.40 then
				random_elite_unit = titan_table.omnia_lpf
			elseif chance_elite < 0.60 then
				random_elite_unit = titan_table.titan_sniper
			elseif chance_elite < 0.80 then
				random_elite_unit = titan_table.titan_taser
			else
				random_elite_unit = titan_table.invis_woman
			end
		end
	end
	
	--Setting up random dozers for DW+
	if difficulty_index == 6 or difficulty_index == 7 then
		if chance_dozer_left < 0.35 then
			tank_replacement_left = dozer_table.dozer_skull
		elseif chance_dozer_left < 0.70 then
			tank_replacement_left = dozer_table.dozer_black
		else
			tank_replacement_left = dozer_table.dozer_green
		end
		
		if chance_dozer_middle < 0.25 then
			tank_replacement_middle = dozer_table.dozer_skull
		elseif chance_dozer_middle < 0.50 then
			tank_replacement_middle = dozer_table.dozer_black
		else
			tank_replacement_middle = dozer_table.dozer_green
		end
		
		if chance_dozer_right < 0.25 then
			tank_replacement_right = dozer_table.dozer_skull
		elseif chance_dozer_right < 0.50 then
			tank_replacement_right = dozer_table.dozer_black
		else
			tank_replacement_right = dozer_table.dozer_green
		end
	end
	
	if difficulty_index == 8 then
		if chance_dozer_left < 0.25 then
			tank_replacement_left = dozer_table.dozer_zeal_black
		elseif chance_dozer_left < 0.50 then
			tank_replacement_left = dozer_table.dozer_zeal_skull
		elseif chance_dozer_left < 0.75 then
			tank_replacement_left = dozer_table.dozer_titan
		else
			tank_replacement_left = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_middle < 0.25 then
			tank_replacement_middle = dozer_table.dozer_zeal_black
		elseif chance_dozer_middle < 0.50 then
			tank_replacement_middle = dozer_table.dozer_zeal_skull
		elseif chance_dozer_middle < 0.75 then
			tank_replacement_middle = dozer_table.dozer_titan
		else
			tank_replacement_middle = dozer_table.dozer_zeal_benelli
		end
		
		if chance_dozer_right < 0.25 then
			tank_replacement_right = dozer_table.dozer_zeal_black
		elseif chance_dozer_right < 0.50 then
			tank_replacement_right = dozer_table.dozer_zeal_skull
		elseif chance_dozer_right < 0.75 then
			tank_replacement_right = dozer_table.dozer_titan
		else
			tank_replacement_right = dozer_table.dozer_zeal_benelli
		end
	end
	
	
return {
	--Pro Job PONR 
	[100220] = {
		ponr = ponr_value
	},
	--Snipers that look on Panic Room zone now spawn more than 1 time
	[101128] = {
		values = {
			trigger_times = 0
		}
	},
	[101121] = {
		values = {
			trigger_times = 0
		}
	},
	[101520] = {
		values = {
			trigger_times = 0
		}
	},
	[101113] = {
		values = {
			trigger_times = 0
		}
	},
	[101140] = {
		values = {
			trigger_times = 0
		}
	},
	[101136] = {
		values = {
			trigger_times = 0
		}
	},
	--SWAT units replacement
	[101164] = {
		values = {
			enemy = shield_unit
		}
	},
	[101151] = {
		values = {
			enemy = shield_unit
		}
	},
	[101156] = {
		values = {
			enemy = shotgun_unit
		}
	},
	[101160] = {
		values = {
			enemy = shotgun_unit
		}
	},
	[101158] = {
		values = {
			enemy = titan_swat_left
		}
	},
	[101159] = {
		values = {
			enemy = titan_swat_right
		}
	},
	--Use unhooked scripted swat spawn for random titan unit (or vet cop if VH or lower diffs)
	[101678] = {
		on_executed = {
			{ id = 101166, delay = 0 }
		}
	},
	[101166] = {
		values = {
			enemy = random_elite_unit
		}
	},
	--Mobsters are friendly to cops (in Commissar panic room section)
	--P.S. The Commissar now friendly to cops either but this is an instance
	[101505] = {
		values = {
			team = "law1"
		}
	},
	[101497] = {
		values = {
			team = "law1"
		}
	},
	[101496] = {
		values = {
			team = "law1"
		}
	},
	[101506] = {
		values = {
			team = "law1"
		}
	},
	[100190] = {
		values = {
			team = "law1"
		}
	},
	[100191] = {
		values = {
			team = "law1"
		}
	},
	--Dozer replacements
	[101133] = {
		values = {
			enemy = tank_replacement_left
		}
	},
	[101137] = {
		values = {
			enemy = tank_replacement_middle
		}
	},
	[101141] = {
		values = {
			enemy = tank_replacement_right
		}
	},
	--Should decrease sniper spawn intensity (I hope)
	[101202] = {
		values = {
			chance = 2
		}
	},
	[100686] = {
		values = {
			chance = 4
		}
	},
	-- Boss spawn
	[100521] = {
		difficulty = 0.1
	},
	-- Boss dead
	[100533] = {
		difficulty = 1
	}
}