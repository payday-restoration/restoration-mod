local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 660
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630
	else
		ponr_value = 600	
	end

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
		--fixes the issue with turret objective (the area trigger is depending on these units instead of SO trigger)
		[102783] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		},
		--DON'T DESPAWN THESE DOZERS, PLEASEEEEE! THEY ARE IMPORTANT!
		[103639] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		},
		[103640] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		},
		[103641] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		},
		[103642] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		},
		[103643] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		},
		[103644] = {
			values = {
				rules = {
					enemy_names = {
						"units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
						"units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
						"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
						"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"	
					}
				}
			}
		}
}	