local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 780
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 750
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 720
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600
		ponr_toggle = true		
	end
end

return {
		--Pro Job PONR 
		[102391] = {
			ponr = ponr_value,
			enabled = ponr_toggle
		},
		[100115] = {
			reinforce = {
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
		--fixes the issue with turret objective
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
		-- Don't kill off enemies in various areas
		[102154] = {
			values = {
				enabled = false
			}
		},
		[102155] = {
			values = {
				enabled = false
			}
		},
		[102162] = {
			values = {
				enabled = false
			}
		},
		[102160] = {
			values = {
				enabled = false
			}
		},
		[102170] = {
			values = {
				enabled = false
			}
		},
		[102167] = {
			values = {
				enabled = false
			}
		},
		[102178] = {
			values = {
				enabled = false
			}
		},
		[102177] = {
			values = {
				enabled = false
			}
		},
		[102186] = {
			values = {
				enabled = false
			}
		},
		[102181] = {
			values = {
				enabled = false
			}
		},
		[102191] = {
			values = {
				enabled = false
			}
		},
		[102189] = {
			values = {
				enabled = false
			}
		}
}	