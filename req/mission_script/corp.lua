local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local bulldozer == (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc) or "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600
	
local enemy_filter = {
	values = {
			rules = {
				enemy_names = {
				"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
			--captain units (for Everlasting Season mutator)
			--Winters squad
				"units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1",
				"units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1",
				"units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper",
				"units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1",
				"units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2",
				"units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
			--Autumn squad	
				"units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn",
				"units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1",
				"units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook",
			--Spring squad
				"units/pd2_dlc_vip/characters/ene_spring/ene_spring",
				"units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser",
				"units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
				"units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser",
			--Summers squad	
				"units/pd2_dlc_vip/characters/ene_summers/ene_summers",
				"units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier",
				"units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser",
				"units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic",
			--Hatman squad
				"units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman",
				"units/pd2_mod_halloween/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw",
				"units/pd2_mod_halloween/characters/ene_bulldozer_4/ene_bulldozer_4",
				"units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
				"units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1"
			}
		}
	}
}
local enemy_filter_dozers = {
	values = {
		rules = {
			enemy_names = {
				"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
				"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
				"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"	
			}
		}
	}
}	
return {
		--Pro Job PONR 
		[102391] = {
			ponr = ponr_value
		},
		[100115] = {
			reinforce = {
				{
					name = "meetingroom1",
					force = 2,
					position = Vector3(3700, 2200, 500)
				},
				{
					name = "meetingroom2",
					force = 2,
					position = Vector3(5300, 2000, 900)
				},
				{
					name = "admin",
					force = 2,
					position = Vector3(-5600, 1200, -200)
				},
				{
					name = "parkinglot",
					force = 2,
					position = Vector3(6000, 5100, 0)
				},
				{
					name = "garden",
					force = 2,
					position = Vector3(7200, -3900, 10)
				},
				{
					name = "labroof1",
					force = 2,
					position = Vector3(4000, 400, 670)
				},
				{
					name = "labroof2",
					force = 2,
					position = Vector3(-1200, 2600, 670)
				},
				{
					name = "statue",
					force = 3,
					position = Vector3(700, -75, 0)
				}
			}
		},
		[103017] = {
		values = {
			enemy = bulldozer
			}
		},
		[103026] = {
		values = {
			enemy = bulldozer
			}
		},
		--fixes the issue with turret objective (the area trigger is depending on these units instead of SO trigger)
		[102783] = enemy_filter_dozers,
		--DON'T DESPAWN THESE UNITS, PLEASEEEEE! THEY ARE IMPORTANT!
		[103639] = enemy_filter,
		[103640] = enemy_filter,
		[103641] = enemy_filter,
		[103642] = enemy_filter,
		[103643] = enemy_filter,
		[103644] = enemy_filter
}	