local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 690
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 600
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540	
	end
end

return {
	--Pro Job PONR
	[101106] = {
		ponr = ponr_value
	},
	-- Reduce amount of ambush bulldozers
	[101557] = {
		values = {
			enabled = false
		}
	},
	[100567] = {
		values = {
			enabled = false
		}
	},
	[101575] = {
		values = {
			enabled = false
		}
	},
	--less skulldozers (seriously Jules, stop it)
	[100485] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		}
	},
	[100499] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		}
	},
	[101176] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		}
	},
	[101398] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		}
	},
	[101182] = { 
		values = {
            enemy = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		}
	},
	--ambush vault (DS only)
	[101400] = { 
		values = {
            enemy = "units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"
		}
	},
	[101401] = { 
		values = {
            enemy = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
		}
	},
	[101402] = { 
		values = {
            enemy = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		}
	},
	[101403] = { 
		values = {
            enemy = "units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"
		}
	},
	[101404] = { 
		values = {
            enemy = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1" --:)
		}
	},
	[101405] = { 
		values = {
            enemy = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		}
	}
}