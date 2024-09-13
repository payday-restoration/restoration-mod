-- Don't replace spawns on custom enemy spawner map
local level_id =  Global.game_settings and Global.game_settings.level_id
--[[
if Global.editor_mode or level_id == "modders_devmap" or level_id == "Enemy_Spawner" then
	StreamHeist:log("Editor/Spawner mode is active, spawn group fixes disabled")
	return
end
]]--
-- Map to correct incorrect faction spawns
ElementSpawnEnemyDummy.faction_mapping = {
	--Hard and Normal uses Very Hard replacement values for every faction
	--America
	america = {
		--SWAT
		overkill = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			swat_1 = {
				"units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
				"units/payday2/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc",
			heavy_1 = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
			heavy_2 = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
			shield = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
			sniper = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",
			taser = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			medic = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			grenadier = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			tsniper = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
			dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		},
		--Mix of SWAT+FBI
		overkill_145 = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			swat_1 = {
				"units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
				"units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
				"units/payday2/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
				"units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"
			},
			heavy_1 = {
				"units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
				"units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
			},
			heavy_2 = {
				"units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
				"units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
			},
			taser = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
			},
			shield = {
				"units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
				"units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
			},
			sniper = {
				"units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
			}
		},
		--Mix of FBI+GenSec
		easy_wish = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			swat_1 = {
				"units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
				"units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
				"units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"
			},
			swat_2 = {
				"units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
				"units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"
			},
			heavy_1 = {
				"units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
				"units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
			},
			heavy_2 = {
				"units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
				"units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
			},
			shield = {
				"units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
				"units/payday2/characters/ene_shield_gensec/ene_shield_gensec"
			},
			sniper = {
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
				"units/payday2/characters/ene_sniper_3/ene_sniper_3"
			},
			taser = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
				"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
			}
		},
		--GenSec
		overkill_290 = {
			security_1 = {
				"units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
				"units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
				"units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			security_3 = {
				"units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
			},	
			swat_1 = {
				"units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
				"units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"
			},
			swat_2 = "units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc",
			heavy_1 = "units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
			heavy_2 = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
			taser = {
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_grenadier_1/ene_grenadier_1"
			},
			shield = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
			sniper = "units/payday2/characters/ene_sniper_3/ene_sniper_3",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
				"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
			}
		},
		--ZEAL
		sm_wish = {
			security_1 = {
				"units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
				"units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
				"units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
			},
			security_3 = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3",
			secret_service = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
			},
			fbi_1 = {
				"units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
				"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4",
			fbi_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5",
			swat_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
			},
			medic = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"
			},
			taser = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	},
	--Russia
	russia = {
		--Akan's Reaper Security Teams
		overkill = {
			security_1 = {
				"units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
				"units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"
			},
			security_3 = {
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3"
			},
			fsb_security = {
				"units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1",
				"units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2",
				"units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"
			},
			cop_1 = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
			fbi_1 = "units/pd2_mod_reapers/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_reapers/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2",
			heavy_1 = "units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
			heavy_2 = "units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
			shield = "units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2",
			sniper = "units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
			taser = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
			cloaker = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
			dozer = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"
		},
		--Mix of Akan's Reaper Security Teams+Soldiers
		overkill_145 = {
			security_1 = {
				"units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
				"units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"
			},
			security_3 = {
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3"
			},
			fsb_security = {
				"units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1",
				"units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2",
				"units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"
			},
			cop_1 = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
			fbi_1 = "units/pd2_mod_reapers/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_reapers/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
			},
			taser = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/pd2_mod_reapers/characters/ene_akan_medic_bob/ene_akan_medic_bob",
			cloaker = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2"
			},
			shield = {
				"units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"
			},
			sniper = {
				"units/pd2_mod_reapers/characters/ene_sniper_1/ene_sniper_1",
				"units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2"
			}
		},
		--Mix of Akan's Reaper Soldiers+Elites
		easy_wish = {
			security_1 = {
				"units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
				"units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"
			},
			security_3 = {
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3"
			},
			fsb_security = {
				"units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1",
				"units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2",
				"units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"
			},
			cop_1 = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
			fbi_1 = "units/pd2_mod_reapers/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2"
			},
			fsb_swat_1 = {
				"units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36",
				"units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36",
				"units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3"
			},
			fsb_swat_2 = {
				"units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870",
				"units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
				"units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870"
			},
			fsb_heavy = {
				"units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36",
				"units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36"
			},
			shield = {
				"units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"
			},
			fsb_shield = {
				"units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city",
				"units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"
			},
			sniper = {
				"units/pd2_mod_reapers/characters/ene_sniper_2/ene_sniper_2",
				"units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3"
			},
			fsb_sniper = {
				"units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper",
				"units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3"
			},
			taser = "units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
			grenadier = "units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
			medic = "units/pd2_mod_reapers/characters/ene_akan_medic_bob/ene_akan_medic_bob",
			cloaker = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"
			}
		},
		--Akan's Elite Soldiers
		overkill_290 = {
			security_1 = {
				"units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
				"units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"
			},
			security_3 = {
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3"
			},
			fsb_security = {
				"units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1",
				"units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2",
				"units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"
			},
			cop_1 = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
			fbi_1 = "units/pd2_mod_reapers/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3",	
			swat_1 = {
				"units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
			fsb_swat_1 = {
				"units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3"
			},
			fsb_swat_2 = "units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			heavy_2 = "units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			fsb_heavy = "units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			taser = {
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
			},
			grenadier = "units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
			shield = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
			fsb_shield = "units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield",
			sniper = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",
			fsb_sniper = "units/pd2_mod_reapers/characters/ene_sniper_3/ene_sniper_3",
			medic = "units/pd2_mod_reapers/characters/ene_akan_medic_zdann/ene_akan_medic_zdann",
			cloaker = "units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3"
			}
		},
		--DRAK (The Better Eggman Empire)
		sm_wish = {
			security_1 = {
				"units/pd2_mod_reapers/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_reapers/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3",
				"units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"
			},
			security_3 = {
				"units/pd2_mod_reapers/characters/ene_security_3/ene_security_3"
			},
			fsb_security = {
				"units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1",
				"units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2",
				"units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"
			},
			cop_1 = "units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4",
			fbi_1 = {
				"units/pd2_mod_reapers/characters/ene_akan_veteran_2/ene_akan_veteran_2",
				"units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_mod_reapers/characters/ene_drak_hrt_1/ene_drak_hrt_1",
			fbi_3 = "units/pd2_mod_reapers/characters/ene_drak_hrt_2/ene_drak_hrt_2",
			swat_1 = {
				"units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			fsb_swat_1 = {
				"units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
			fsb_swat_2 = "units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"
			},
			fsb_heavy = {
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			fsb_shield = {
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini",
				"units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
				"units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini",
				"units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
				"units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2"
			},
			medic = {
				"units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic",
				"units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic",
				"units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic",
				"units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic",
				"units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic",
				"units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer"
			},
			taser = {
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_mod_reapers/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper",
			fsb_sniper = "units/pd2_mod_reapers/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	},
	--Zombie
	zombie = {
		--Zombie SWAT
		overkill = {
			cop_1 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
			cop_2 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
			cop_3 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
			cop_4 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
			fbi_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
			fbi_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
			fbi_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
			swat_1 = {
				"units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2",
			heavy_1 = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
			heavy_2 = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
			shield = "units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2",
			sniper = "units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
			taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
			cloaker = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
			dozer = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
			dozer_headless = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		},
		--Mix of Zombie SWAT+FBI
		overkill_145 = {
			cop_1 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
			cop_2 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
			cop_3 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
			cop_4 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
			fbi_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
			fbi_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
			fbi_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
			swat_1 = {
				"units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
				"units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
			},
			heavy_2 = {
				"units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
			},
			taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
			cloaker = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
			},
			dozer_headless = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
			shield = {
				"units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"
			},
			sniper = {
				"units/pd2_mod_halloween/characters/ene_sniper_1/ene_sniper_1",
				"units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2"
			}
		},
		--Mix of Zombie FBI+GenSec
		easy_wish = {
			cop_1 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
			cop_2 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
			cop_3 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
			cop_4 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
			fbi_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
			fbi_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
			fbi_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
			swat_1 = {
				"units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
				"units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
			},
			heavy_2 = {
				"units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
			},
			shield = {
				"units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"
			},
			sniper = {
				"units/pd2_mod_halloween/characters/ene_sniper_2/ene_sniper_2",
				"units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3"
			},
			taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
			grenadier = "units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1",
			medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
			cloaker = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"
			},
			dozer_headless = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		},
		--Zombie GenSec
		overkill_290 = {
			cop_1 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
			cop_2 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
			cop_3 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
			cop_4 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
			fbi_1 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
			fbi_2 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
			fbi_3 = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
			swat_1 = {
				"units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			heavy_2 = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
			taser = {
				"units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1"
			},
			grenadier = "units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1",
			shield = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec",
			sniper = "units/pd2_mod_halloween/characters/ene_sniper_3/ene_sniper_3",
			medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5",
			cloaker = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"
			},
			dozer_headless = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		},
		--Zombie ZEAL
		sm_wish = {
			cop_1 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1",
			cop_2 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2",
			cop_3 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3",
			cop_4 = "units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4",
			fbi_1 = {
				"units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1",
				"units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4",
			fbi_3 = "units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5",
			swat_1 = {
				"units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
			},
			heavy_2 = {
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"
			},
			shield = {
				"units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
				"units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3",
				"units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer",
				"units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
			},
			medic = {
				"units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf"
			},
			taser = {
				"units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
				"units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
				"units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
				"units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
				"units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
				"units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer",
				"units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
				"units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
				"units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
				"units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
				"units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker",
				"units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			dozer_headless = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
			grenadier = "units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_mod_halloween/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	},
	--Murkywater (le Sharks)
	murkywater = {
		--Murkywater Tactical Security
		overkill = {
			security_1 = {
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
			},
			security_3 = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
			},
			secret_service = {
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
			},
			fbi_1 = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
			heavy_1 = "units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
			heavy_2 = "units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
			shield = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
			sniper = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
			taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
			medic = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
			grenadier = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
			cloaker = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
			tsniper = "units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
			tshield = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
			dozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		},
		--Mix of Murkywater Tactical Security+Marines
		overkill_145 = {
			security_1 = {
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
			},
			security_3 = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
			},
			secret_service = {
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
			},
			fbi_1 = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
				"units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
			},
			taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
			medic = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
			grenadier = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
			cloaker = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
			tsniper = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
			},
			shield = {
				"units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
				"units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"
			},
			tshield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault",
			sniper = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper"
		},
		--Mix of Murkywater Marines+Elites
		easy_wish = {
			security_1 = {
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
			},
			security_3 = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
				"units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"
			},
			secret_service = {
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
			},
			fbi_1 = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
			heavy_2 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
			shield = {
				"units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
				"units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"
			},
			sniper = {
				"units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
				"units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2"
			},
			cloaker = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
			taser = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
			medic = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
			grenadier = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
			tshield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault",
			dozer = {
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
			}
		},
		--Murkywater Elites
		overkill_290 = {
			security_1 = {
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
			},
			security_3 = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
			murky_guard = {
				"units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
				"units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
				"units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"
			},
			fbi_1 = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
			heavy_2 = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
			cloaker = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
			grenadier = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
			taser = {
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
			},
			shield = "units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",
			sniper = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2",
			medic = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
			tsniper = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
			tshield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault",
			dozer = {
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
			}
		},
		--HECU (aka ZEAL)
		--You probably gonna like Black Ridge (the custom stealth heist)
		sm_wish = {
			security_1 = {
				"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
				"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
				"units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
				"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"
			},
			security_3 = "units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
			murky_guard = {
				"units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",
				"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"
			},
			fbi_1 = {
				"units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2",
				"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
				"units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
				"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
				"units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
			},
			medic = {
				"units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
				"units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
				"units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
				"units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
				"units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
				"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"
			},
			taser = {
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
				"units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
				"units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
				"units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
				"units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
				"units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
				"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper",
			tshield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault",
			sniper = "units/pd2_mod_sharks/characters/ene_murky_sniper_2/ene_murky_sniper_2"
		}
	},
	--Federales (the most fucked up faction in vanilla visually)
	federales = {
		--Mexican SWAT
		overkill = {
			security_1 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
				"units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
				"units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"
			},
			security_3 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"
			},
			thug_guard = "units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex",
			cop_1 = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
			cop_2 = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
			cop_3 = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
			cop_4 = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
			fbi_1 = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
				"units/pd2_dlc_bex/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2",
			heavy_1 = "units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
			heavy_2 = "units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
			shield = "units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2",
			sniper = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
			taser = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
			cloaker = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
			dozer = "units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"
		},
		--Mix of Mexican SWAT+FBI
		overkill_145 = {
			security_1 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
				"units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
				"units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"
			},
			security_3 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"
			},
			thug_guard = "units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex",
			cop_1 = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
			cop_2 = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
			cop_3 = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
			cop_4 = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
			fbi_1 = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1",
				"units/pd2_dlc_bex/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2"
			},
			heavy_1 = {
				"units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
				"units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"
			},
			taser = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
			cloaker = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
			},
			shield = {
				"units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
				"units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"
			},
			sniper = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1"
		},
		--Mix of Mexican FBI+Elites
		easy_wish = {
			security_1 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01",
				"units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02",
				"units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"
			},
			security_3 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"
			},
			thug_guard = "units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex",
			cop_1 = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
			cop_2 = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
			cop_3 = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
			cop_4 = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
			fbi_1 = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = {
				"units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
				"units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
				"units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870"
			},
			shield = {
				"units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
				"units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"
			},
			sniper = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
			taser = "units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
			grenadier = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
			medic = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
			cloaker = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
			}
		},
		--Mexican Elites
		overkill_290 = {
			security_1 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01",
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02",
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"
			},
			security_3 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"
			},
			thug_guard = "units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex",
			cop_1 = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
			cop_2 = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
			cop_3 = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
			cop_4 = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
			fbi_1 = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
			fbi_2 = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			heavy_2 = "units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			taser = {
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1"
			},
			grenadier = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
			shield = "units/pd2_dlc_bex/characters/ene_city_shield/ene_city_shield",
			sniper = "units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1",
			medic = "units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
			cloaker = "units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
			}
		},
		--Gendarmería Grupo de la Muerte
		sm_wish = {
			security_1 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01",
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02",
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"
			},
			security_3 = {
				"units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"
			},
			thug_guard = "units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex",
			cop_1 = "units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01",
			cop_2 = "units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02",
			cop_3 = "units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03",
			cop_4 = "units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04",
			fbi_1 = {
				"units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2",
				"units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
			swat_1 = {
				"units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
				"units/pd2_mod_reapers/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
				"units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
				"units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_dlc_bex/characters/ene_bulldozer_3/ene_bulldozer_3",
				"units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2"
			},
			medic = {
				"units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
				"units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
				"units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
				"units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
				"units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5",
				"units/pd2_mod_reapers/characters/ene_subject_enforcer/ene_subject_enforcer"
			},
			taser = {
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
				"units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
				"units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
				"units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
				"units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_dlc_bex/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	},
	--NYPD (The OG PDTH Faction)
	nypd = {
		--NYPD SWAT
		overkill = {
			security_1 = {
				"units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
			},
			security_3 = {
				"units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
			},
			gensec_security = {
				"units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
			},
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
			},
			cop_1 = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
				"units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"
			},
			swat_2 = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
			heavy_1 = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
			heavy_2 = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
			shield = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
			sniper = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
			taser = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			cloaker = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			dozer = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
		},
		--Mix of NYPD SWAT+FBI
		overkill_145 = {
			security_1 = {
				"units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
			},
			security_3 = {
				"units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
			},
			gensec_security = {
				"units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
			},
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
			},
			cop_1 = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
				"units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
				"units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
				"units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
			},
			taser = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic",
			cloaker = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
			grenadier = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"
			},
			shield = {
				"units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"
			},
			sniper = {
				"units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
			}
		},
		--Mix of NYPD FBI+GenSec
		easy_wish = {
			security_1 = {
				"units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
				"units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
			},
			security_3 = {
				"units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
			},
			gensec_security = {
				"units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
				"units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
			},
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
			},
			cop_1 = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
				"units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
				"units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"
			},
			shield = {
				"units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"
			},
			sniper = {
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
				"units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"
			},
			taser = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
			grenadier = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
			medic = "units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic",
			cloaker = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
			}
		},
		--NYPD GenSec
		overkill_290 = {
			security_1 = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2",
				"units/pd2_mod_nypd/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			security_3 = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
			},
			gensec_security = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
			},
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
			},
			cop_1 = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			heavy_2 = "units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
			taser = {
				"units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1"
			},
			grenadier = "units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1",
			shield = "units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
			sniper = "units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3",
			medic = "units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic",
			cloaker = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"
			}
		},
		--ZEAL
		sm_wish = {
			security_1 = {
				"units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
				"units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
				"units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
			},
			security_3 = {
				"units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
			},
			secret_service = {
				"units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1",
				"units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"
			},
			gensec_security = {
				"units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
				"units/payday2/characters/ene_city_guard_2/ene_city_guard_2"
			},
			murky_guard = {
				"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
			},
			cop_1 = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
			fbi_1 = {
				"units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
				"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4",
			fbi_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
			},
			medic = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"
			},
			taser = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	},
	--LAPD 
	lapd = {
		--LAPD SWAT
		overkill = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			security_3 = {
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			cop_1 = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			sfpd_cop = {
				"units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_lapd/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2",
			heavy_1 = "units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
			heavy_2 = "units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
			shield = "units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2",
			sniper = "units/pd2_mod_lapd/characters/ene_sniper_1/ene_sniper_1",
			taser = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
			grenadier = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
			dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		},
		--Mix of LAPD SWAT+FBI
		overkill_145 = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			security_3 = {
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			cop_1 = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			sfpd_cop = {
				"units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1",
				"units/pd2_mod_lapd/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
				"units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
				"units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
			},
			taser = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
			},
			shield = {
				"units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"
			},
			sniper = {
				"units/pd2_mod_lapd/characters/ene_sniper_1/ene_sniper_1",
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
			}
		},
		--Mix of LAPD FBI+Elites
		easy_wish = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			security_3 = {
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			cop_1 = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			sfpd_cop = {
				"units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
				"units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
				"units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
				"units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
			},
			heavy_2 = {
				"units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
				"units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
			},
			shield = {
				"units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
				"units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"
			},
			sniper = {
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
				"units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3"
			},
			taser = "units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
				"units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
			}
		},
		--LAPD FBI Elites
		overkill_290 = {
			security_1 = {
				"units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
				"units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
				"units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			security_3 = {
				"units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			cop_1 = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
			fbi_2 = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
			fbi_3 = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			sfpd_cop = {
				"units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			heavy_2 = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
			taser = {
				"units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
				"units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1",
				"units/payday2/characters/ene_grenadier_1/ene_grenadier_1"
			},
			shield = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
			sniper = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
				"units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
			}
		},
		--ZEAL
		sm_wish = {
			security_1 = {
				"units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
				"units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
				"units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
			},
			security_3 = {
				"units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
			},
			cop_1 = "units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1",
			cop_2 = "units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2",
			cop_3 = "units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3",
			cop_4 = "units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4",
			fbi_1 = {
				"units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
				"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			fbi_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4",
			fbi_3 = "units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5",
			texas_cop = {
				"units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"
			},
			sfpd_cop = {
				"units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1",
				"units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2",
				"units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3",
				"units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"
			},
			swat_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
			},
			medic = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"
			},
			taser = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	},	
	--FBI
	fbi = {
		--SWAT
		overkill = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			fbi_guard = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
			},
			swat_1 = {
				"units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
				"units/payday2/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = "units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc",
			heavy_1 = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
			heavy_2 = "units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
			shield = "units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
			sniper = "units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",
			taser = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			medic = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			grenadier = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			tsniper = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
			dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		},
		--Mix of SWAT+FBI
		overkill_145 = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			fbi_guard = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
			},
			swat_1 = {
				"units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
				"units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc",
				"units/payday2/characters/ene_swat_3/ene_swat_3"
			},
			swat_2 = {
				"units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
				"units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"
			},
			heavy_1 = {
				"units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
				"units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
			},
			heavy_2 = {
				"units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
				"units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
			},
			taser = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
			},
			shield = {
				"units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
				"units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"
			},
			sniper = {
				"units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc",
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"
			}
		},
		--Mix of FBI+Elites
		easy_wish = {
			security_1 = {
				"units/payday2/characters/ene_security_1/ene_security_1",
				"units/payday2/characters/ene_security_2/ene_security_2",
				"units/payday2/characters/ene_security_3/ene_security_3"
			},
			fbi_guard = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
			},
			swat_1 = {
				"units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
				"units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
				"units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = {
				"units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
				"units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"
			},
			heavy_1 = {
				"units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
				"units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
			},
			heavy_2 = {
				"units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
				"units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
			},
			shield = {
				"units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
				"units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"
			},
			sniper = {
				"units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc",
				"units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3"
			},
			taser = "units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
				"units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
			}
		},
		--FBI Elites
		overkill_290 = {
			security_1 = {
				"units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1",
				"units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2",
				"units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			security_3 = {
				"units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"
			},
			fbi_guard = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
			},
			swat_1 = {
				"units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1",
				"units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"
			},
			swat_2 = "units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2",
			heavy_1 = "units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
			heavy_2 = "units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
			taser = {
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
				"units/payday2/characters/ene_grenadier_1/ene_grenadier_1"
			},
			shield = "units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
			sniper = "units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3",
			medic = "units/payday2/characters/ene_medic_mp5/ene_medic_mp5",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			dozer = {
				"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
				"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
				"units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
			}
		},
		--ZEAL
		sm_wish = {
			security_1 = {
				"units/payday2/characters/ene_city_guard_1/ene_city_guard_1",
				"units/payday2/characters/ene_city_guard_2/ene_city_guard_2",
				"units/payday2/characters/ene_city_guard_3/ene_city_guard_3"
			},
			security_3 = "units/payday2/characters/ene_city_guard_3/ene_city_guard_3",
			fbi_guard = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
			},
			secret_service = {
				"units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
				"units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2",
			},
			fbi_1 = {
				"units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
				"units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"
			},
			swat_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
				"units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"
			},
			swat_2 = "units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
			heavy_1 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
				"units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
			},
			heavy_2 = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
				"units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
			},
			shield = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
				"units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
			},
			dozer = {
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
				"units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
			},
			medic = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic",
				"units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf"
			},
			taser = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
			},
			cloaker = {
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
				"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			},
			grenadier = "units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1",
			tsniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
			sniper = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
		}
	}
}

ElementSpawnEnemyDummy.faction_mapping.america.normal = ElementSpawnEnemyDummy.faction_mapping.america.overkill
ElementSpawnEnemyDummy.faction_mapping.america.hard = ElementSpawnEnemyDummy.faction_mapping.america.overkill
ElementSpawnEnemyDummy.faction_mapping.russia.normal = ElementSpawnEnemyDummy.faction_mapping.russia.overkill
ElementSpawnEnemyDummy.faction_mapping.russia.hard = ElementSpawnEnemyDummy.faction_mapping.russia.overkill
ElementSpawnEnemyDummy.faction_mapping.zombie.normal = ElementSpawnEnemyDummy.faction_mapping.zombie.overkill
ElementSpawnEnemyDummy.faction_mapping.zombie.hard = ElementSpawnEnemyDummy.faction_mapping.zombie.overkill
ElementSpawnEnemyDummy.faction_mapping.murkywater.normal = ElementSpawnEnemyDummy.faction_mapping.murkywater.overkill
ElementSpawnEnemyDummy.faction_mapping.murkywater.hard = ElementSpawnEnemyDummy.faction_mapping.murkywater.overkill
ElementSpawnEnemyDummy.faction_mapping.federales.normal = ElementSpawnEnemyDummy.faction_mapping.federales.overkill
ElementSpawnEnemyDummy.faction_mapping.federales.hard = ElementSpawnEnemyDummy.faction_mapping.federales.overkill
ElementSpawnEnemyDummy.faction_mapping.nypd.normal = ElementSpawnEnemyDummy.faction_mapping.nypd.overkill
ElementSpawnEnemyDummy.faction_mapping.nypd.hard = ElementSpawnEnemyDummy.faction_mapping.nypd.overkill
ElementSpawnEnemyDummy.faction_mapping.lapd.normal = ElementSpawnEnemyDummy.faction_mapping.lapd.overkill
ElementSpawnEnemyDummy.faction_mapping.lapd.hard = ElementSpawnEnemyDummy.faction_mapping.lapd.overkill
ElementSpawnEnemyDummy.faction_mapping.fbi.normal = ElementSpawnEnemyDummy.faction_mapping.fbi.overkill
ElementSpawnEnemyDummy.faction_mapping.fbi.hard = ElementSpawnEnemyDummy.faction_mapping.fbi.overkill

ElementSpawnEnemyDummy.enemy_mapping = {
	--Vanilla Factions
	--America
	--Security
	[Idstring("units/payday2/characters/ene_security_1/ene_security_1"):key()] = "security_1",
	[Idstring("units/payday2/characters/ene_security_2/ene_security_2"):key()] = "security_1",
	[Idstring("units/payday2/characters/ene_security_3/ene_security_3"):key()] = "security_3",
	[Idstring("units/payday2/characters/ene_security_4/ene_security_4"):key()] = "security_4",
	[Idstring("units/payday2/characters/ene_security_5/ene_security_5"):key()] = "security_4",
	[Idstring("units/payday2/characters/ene_security_6/ene_security_6"):key()] = "security_4",
	[Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = "secret_service",
	[Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = "secret_service",
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = "gensec_security",
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = "gensec_security",
	[Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = "fbi_guard",
	[Idstring("units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = "fbi_guard",
	--Beat Cops
	[Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"):key()] = "cop_1",
	[Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"):key()] = "cop_2",
	[Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"):key()] = "cop_3",
	[Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"):key()] = "cop_4",
	[Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"):key()] = "cop_1",
	[Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"):key()] = "cop_2",
	[Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"):key()] = "cop_3",
	[Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"):key()] = "cop_4",
	[Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_01/ene_male_chas_police_01"):key()] = "sfpd_cop",
	[Idstring("units/pd2_dlc_chas/characters/ene_male_chas_police_02/ene_male_chas_police_02"):key()] = "sfpd_cop",
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_01/ene_male_ranc_ranger_01"):key()] = "texas_cop",
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_ranger_02/ene_male_ranc_ranger_02"):key()] = "texas_cop",
	--FBI/HRT
	[Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"):key()] = "fbi_1",
	[Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"):key()] = "fbi_2",
	[Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"):key()] = "fbi_3",
	--Blue SWAT
	[Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"):key()] = "swat_1",
	[Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"):key()] = "swat_2",
	[Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"):key()] = "heavy_1",
	[Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"):key()] = "heavy_2",
	--FBI SWAT
	[Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"):key()] = "heavy_1",
	[Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"):key()] = "heavy_2",
	[Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"):key()] = "swat_1",
	[Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"):key()] = "swat_2",
	--City SWAT
	[Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"):key()] = "heavy_1",
	[Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"):key()] = "heavy_2",
	[Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"):key()] = "swat_1",
	[Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"):key()] = "swat_2",
	[Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"):key()] = "swat_1",
	[Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"):key()] = "swat_2",
	--ZEALs
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"):key()] = "swat_1",
	--Specials
	[Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"):key()] = "dozer",
	[Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"):key()] = "dozer",
	[Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"):key()] = "dozer",
	[Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"):key()] = "dozer_headless",
	[Idstring("units/pd2_dlc_help/characters/ene_zeal_bulldozer_halloween/ene_zeal_bulldozer_halloween"):key()] = "dozer_headless",
	[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"):key()] = "dozer",
	[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"):key()] = "dozer",
	[Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"):key()] = "dozer",
	[Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"):key()] = "shield",
	[Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"):key()] = "shield",
	[Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"):key()] = "shield",
	[Idstring("units/payday2/characters/ene_sniper_1/ene_sniper_1"):key()] = "sniper",
	[Idstring("units/payday2/characters/ene_sniper_2/ene_sniper_2"):key()] = "sniper",
	[Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"):key()] = "medic",
	[Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"):key()] = "medic",
	[Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"):key()] = "taser",
	[Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1"):key()] = "grenadier",
	[Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"):key()] = "cloaker",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"):key()] = "taser",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"):key()] = "cloaker",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"):key()] = "shield",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"):key()] = "dozer",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"):key()] = "dozer",
	[Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"):key()] = "dozer",
	[Idstring("units/pd2_dlc_drm/characters/ene_zeal_swat_heavy_sniper/ene_zeal_swat_heavy_sniper"):key()] = "tsniper",
	[Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"):key()] = "tsniper",
	[Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"):key()] = "tsniper",
	[Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_1/ene_male_marshal_shield_1"):key()] = "tshield",
	[Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2"):key()] = "tshield",
	--Russia
	--Beat Cops (unused, were also a part of HRT before One Down Update)
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"):key()] = "cop_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg"):key()] = "cop_2",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"):key()] = "cop_3",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"):key()] = "cop_4",
	--Blue SWAT
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870"):key()] = "swat_2",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"):key()] = "heavy_2",
	--FBI SWAT
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"):key()] = "heavy_2",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"):key()] = "swat_2",
	--City SWAT
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870"):key()] = "swat_2",
	--Specials
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"):key()] = "dozer",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"):key()] = "dozer",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"):key()] = "dozer",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45"):key()] = "shield",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"):key()] = "shield",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"):key()] = "shield",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_sniper_svd_snp/ene_akan_cs_swat_sniper_svd_snp"):key()] = "sniper",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass"):key()] = "medic",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870"):key()] = "medic",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"):key()] = "taser",
	[Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"):key()] = "cloaker",
	--Zombie
	--Blue SWAT
	[Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"):key()] = "swat_2",
	[Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"):key()] = "heavy_2",
	--FBI SWAT
	[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"):key()] = "heavy_2",
	[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"):key()] = "swat_2",
	--Specials
	[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1"):key()] = "dozer",
	[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"):key()] = "dozer",
	[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3"):key()] = "dozer",
	[Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"):key()] = "shield",
	[Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"):key()] = "shield",
	[Idstring("units/pd2_dlc_hvh/characters/ene_sniper_hvh_2/ene_sniper_hvh_2"):key()] = "sniper",
	[Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_m4/ene_medic_hvh_m4"):key()] = "medic",
	[Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870"):key()] = "medic",
	[Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"):key()] = "taser",
	[Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"):key()] = "cloaker",
	--Murkywater
	--Security
	[Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = "murky_guard",
	[Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = "murky_guard",
	[Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = "murky_guard",
	[Idstring("units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security"):key()] = "murky_guard",
	[Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1"):key()] = "murky_guard",
	[Idstring("units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2"):key()] = "murky_guard",
	--Blue SWAT
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light/ene_murkywater_light"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_r870/ene_murkywater_light_r870"):key()] = "swat_2",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy/ene_murkywater_heavy"):key()] = "heavy_1",
	--FBI SWAT
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_g36/ene_murkywater_heavy_g36"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_heavy_shotgun/ene_murkywater_heavy_shotgun"):key()] = "heavy_2",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi/ene_murkywater_light_fbi"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_fbi_r870/ene_murkywater_light_fbi_r870"):key()] = "swat_2",
	--City SWAT
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city/ene_murkywater_light_city"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_light_city_r870/ene_murkywater_light_city_r870"):key()] = "swat_2",
	--Specials
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_1/ene_murkywater_bulldozer_1"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_2/ene_murkywater_bulldozer_2"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_3/ene_murkywater_bulldozer_3"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_4/ene_murkywater_bulldozer_4"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_bulldozer_medic/ene_murkywater_bulldozer_medic"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_shield/ene_murkywater_shield"):key()] = "shield",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_sniper/ene_murkywater_sniper"):key()] = "sniper",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic/ene_murkywater_medic"):key()] = "medic",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_medic_r870/ene_murkywater_medic_r870"):key()] = "medic",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_tazer/ene_murkywater_tazer"):key()] = "taser",
	[Idstring("units/pd2_dlc_bph/characters/ene_murkywater_cloaker/ene_murkywater_cloaker"):key()] = "cloaker",
	--Federales
	--Security
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"):key()] = "security_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"):key()] = "security_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"):key()] = "security_3",
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"):key()] = "security_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"):key()] = "security_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"):key()] = "security_3",
	[Idstring("units/pd2_dlc_fex/characters/ene_secret_service_fex/ene_secret_service_fex"):key()] = "thug_guard",
	--Blue SWAT
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale/ene_swat_policia_federale"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870"):key()] = "swat_2",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_g36/ene_swat_heavy_policia_federale_g36"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"):key()] = "heavy_2",
	--FBI SWAT
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"):key()] = "swat_2",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi/ene_swat_heavy_policia_federale_fbi"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36"):key()] = "heavy_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"):key()] = "heavy_2",
	--City SWAT
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"):key()] = "swat_1",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"):key()] = "swat_2",
	--Specials
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_medic_policia_federale/ene_swat_dozer_medic_policia_federale"):key()] = "dozer",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45"):key()] = "shield",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9/ene_swat_shield_policia_federale_mp9"):key()] = "shield",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_sniper/ene_swat_policia_sniper"):key()] = "sniper",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"):key()] = "medic",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870"):key()] = "medic",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"):key()] = "taser",
	[Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale/ene_swat_cloaker_policia_federale"):key()] = "cloaker",
	--Custom Factions
	--FSB
	--Security
	[Idstring("units/payday2/characters/ene_security_winter_1/ene_security_winter_1"):key()] = "security_1",
	[Idstring("units/payday2/characters/ene_security_winter_2/ene_security_winter_2"):key()] = "security_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"):key()] = "fsb_security",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"):key()] = "fsb_security",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"):key()] = "fsb_security",
	--Blue/FBI SWAT
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = "fsb_swat_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = "fsb_swat_2",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = "fsb_heavy",
	--City SWAT
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = "fsb_swat_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = "fsb_swat_2",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = "fsb_heavy",
	--ZEALs
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu"):key()] = "fsb_swat_1",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass"):key()] = "fsb_heavy",
	--Specials
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_tazer/ene_rus_tazer"):key()] = "taser",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper"):key()] = "fsb_sniper",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = "fsb_shield",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = "fsb_shield",
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = "fsb_shield"
	
}

local difficulty
if tweak_data.levels[level_id] and tweak_data.levels[level_id].group_ai_state == "skirmish" then
	difficulty = "overkill_290" --just in case
else
	difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
end

local mission_script_elements = restoration:mission_script_patches()
Hooks:PostHook(ElementSpawnEnemyDummy, "init", "sh_init", function (self)
        local element_mapping = mission_script_elements and mission_script_elements[self._id]
        self._enemy_mapping = element_mapping and element_mapping.enemy
		
	local ai_type = tweak_data.levels:get_ai_group_type()
	local mapped_name = self.enemy_mapping[self._enemy_name:key()]
	local mapped_unit = self.faction_mapping[ai_type] and self.faction_mapping[ai_type][difficulty] and self.faction_mapping[ai_type][difficulty][mapped_name]
	if type(mapped_unit) == "table" then
		self._enemy_table = mapped_unit
	elseif mapped_unit then
		self._enemy_name = Idstring(mapped_unit)
	end
end)

Hooks:PreHook(ElementSpawnEnemyDummy, "produce", "sh_produce", function (self, params)
	if not (params and params.name) and self._enemy_table then
		self._enemy_name = Idstring(table.random(self._enemy_table))
	end
end)
