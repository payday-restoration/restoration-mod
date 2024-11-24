local titan_table_mayhem_dw = {
	"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1",
	"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf",
	"units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
	"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
}
local titan_table_ds = {
	"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1",
	"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf",
	"units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
	"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
	"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}
local titan_swat_table = {
	"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle",
	"units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local shield_unit = ((difficulty >= 6 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault" or difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc" or (difficulty == 7 or difficulty == 6) and "units/payday2/characters/ene_shield_gensec/ene_shield_gensec" or difficulty == 5 and "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc") or "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
local shotgun_unit = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc" or (difficulty == 7 or difficulty == 6) and "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc" or difficulty == 5 and "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc") or "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"
local titan_swat = ((pro_job and difficulty >= 5) and titan_swat_table)
local random_elite_unit = (difficulty == 8 and titan_table_ds or (difficulty == 7 or difficulty == 6) and titan_table_mayhem_dw) or "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
local ponr_value = (difficulty <= 5 and 330 or (difficulty == 6 or difficulty == 7) and 300) or 240
	
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
			enemy = titan_swat
		}
	},
	[101159] = {
		values = {
			enemy = titan_swat
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