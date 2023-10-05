local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	
	if difficulty_index <= 5 then
		ponr_value = 1080
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1050	
	elseif difficulty_index == 8 then
		ponr_value = 1020	
	end
	
if Global.game_settings and Global.game_settings.one_down then
		timelock_normal = 300
		timelock_fast = 270
	
	if difficulty_index == 5 or difficulty_index == 6 or difficulty_index == 7 or difficulty_index == 8 then
		australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
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
	--More timelock timer on Pro Jobs
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
	--Titan Snipers replace FBI Heavy SWATs on Pro Jobs
	[100940] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100956] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100971] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100885] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100336] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100908] = {
		values = {
            enemy = australian_sniper
		}
	},
	[100924] = {
		values = {
            enemy = australian_sniper
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