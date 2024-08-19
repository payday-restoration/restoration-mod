local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_titan_swat_left = math.random()
local chance_titan_swat_right = math.random()
local chance_elite = math.random()
local titan_table = { 
	titan_swat_rifle = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	titan_swat_shotgun = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
	titan_hrt = "units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1",
	omnia_lpf = "units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf",
	titan_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
	titan_taser = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
	invis_woman = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}

	if difficulty <= 5 then
		ponr_value = 330
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 300
	else
		ponr_value = 240		
	end
    
	
	--Setting up scirpted SWAT spawns
	if difficulty <= 4 then
		shield_unit = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
		shotgun_unit = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"
	elseif difficulty == 5 then
		shield_unit = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"
		shotgun_unit = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"		
	elseif difficulty == 6 or difficulty == 7 then
		shield_unit = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec"
		shotgun_unit = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
	else
		shield_unit = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
		shotgun_unit = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
	end
	
	--Titan Shields replace usual scripted shields on OVK+ with PJ
	if pro_job and difficulty >= 5 then	
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
	if difficulty <= 5 then
		random_elite_unit = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
	else
		if difficulty ~= 8 then
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
	
local sniper_trigger_times = {
	values = {
        trigger_times = 0
	}
}
local law_team = {
	values = {
		team = "law1"
	}
}
local shield = {
	values = {
        enemy = shield_unit
	}
}
local shotgun = {
	values = {
        enemy = shotgun_unit
	}
}	
local no_spawn_instigator_ids = {
	values = {
		spawn_instigator_ids = false
	}
}	
return {
	--Pro Job PONR 
	[100220] = {
		ponr = ponr_value
	},
	--Snipers that look on Panic Room zone now spawn more than 1 time
	[101128] = sniper_trigger_times,
	[101121] = sniper_trigger_times,
	[101520] = sniper_trigger_times,
	[101113] = sniper_trigger_times,
	[101140] = sniper_trigger_times,
	[101136] = sniper_trigger_times,
	--SWAT units replacement
	[101164] = shield,
	[101151] = shield,
	[101156] = shotgun,
	[101160] = shotgun,
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
	[101505] = law_team,
	[101497] = law_team,
	[101496] = law_team,
	[101506] = law_team,
	[100190] = law_team,
	[100191] = law_team,
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
	},
	-- Fix nav links
	[101433] = no_spawn_instigator_ids,
	[101434] = no_spawn_instigator_ids,
	[101435] = no_spawn_instigator_ids,
	[101562] = no_spawn_instigator_ids
}