local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local swat_normal = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"
local swat_hard = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
local swat_overkill = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"

	if difficulty_index == 7 then
	   swat_overkill = "units/pd2_dlc_gitgud/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"  
	elseif difficulty_index == 8 then
	   swat_overkill = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
	end
	
	if difficulty_index <= 5 then
		ponr_value = 1080
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020	
	end
	
	if difficulty_index >= 6 then
		timelock_normal = 240
		timelock_fast = 210
	end
	
if Global.game_settings and Global.game_settings.one_down then

		swat_normal = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		swat_hard = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_overkill = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"

	if difficulty_index <= 5 then
		timelock_normal = 240
		timelock_fast = 210
	else
		timelock_normal = 300
		timelock_fast = 270
	end	
end

local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}

return {
	--Pro Job PONR 
	[105790] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[105845] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Make server hack guranteed when solo
	[104494] = {
		pre_func = function (self)
			if table.size(managers.network:session():peers()) == 0 then
				self._chance = 100
			end
		end
	},
	--More timelock timer on higher diifs and Pro Jobs
	[103137] = {
		values = {
            time = timelock_normal
		}
	},
	[100170] = {
		values = {
            time = timelock_fast
		}
	},
	-- Enable roof spawns
	[100006] = {
		values = {
			spawn_groups = { 100019, 100007, 100692 }
		}
	},
	-- Roof spawn intervals
	[100007] = {
		values = {
			interval = 20
		}
	},
	[100692] = {
		values = {
			interval = 20
		}
	},
	--Harasser Tweaks
	[100883] = {
		values = {
            enemy = swat_normal
		}
	},
	[100884] = {
		values = {
            enemy = swat_hard
		}
	},
	[100885] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100332] = {
		values = {
            enemy = swat_normal
		}
	},
	[100334] = {
		values = {
            enemy = swat_hard
		}
	},
	[100336] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100906] = {
		values = {
            enemy = swat_normal
		}
	},
	[100907] = {
		values = {
            enemy = swat_hard
		}
	},
	[100908] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100922] = {
		values = {
            enemy = swat_normal
		}
	},
	[100923] = {
		values = {
            enemy = swat_hard
		}
	},
	[100924] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100938] = {
		values = {
            enemy = swat_normal
		}
	},
	[100939] = {
		values = {
            enemy = swat_hard
		}
	},
	[100940] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100954] = {
		values = {
            enemy = swat_normal
		}
	},
	[100955] = {
		values = {
            enemy = swat_hard
		}
	},
	[100956] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100969] = {
		values = {
            enemy = swat_normal
		}
	},
	[100970] = {
		values = {
            enemy = swat_hard
		}
	},
	[100971] = {
		values = {
            enemy = swat_overkill
		}
	},
	-- Reinforce groups in front of the vault
	[105844] = {
		reinforce = {
			{
				name = "meetingroom",
				force = 2,
				position = Vector3(-3400, 1000, -600)
			},
			{
				name = "outside_vault",
				force = 2,
				position = Vector3(-3000, 500, -1000)
			}
		}
	}
}