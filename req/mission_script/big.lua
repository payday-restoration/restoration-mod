local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1200
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1170
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 1140	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 1080	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 1080	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 1050	
	end
	
	if tweak_data:difficulty_to_index(difficulty) == 5 or tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 or tweak_data:difficulty_to_index(difficulty) == 8 then
		australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
	end
end

return {
	--Pro Job PONR 
	[105790] = {
		ponr = ponr_value
	},
	[105844] = {
		ponr = ponr_value
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
	}
}