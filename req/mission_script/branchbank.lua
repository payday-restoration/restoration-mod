local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if tweak_data:difficulty_to_index(difficulty) == 6 then
		bulldozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	end

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 900
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 840
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 780
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 720
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 660	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 600
	end
	
if Global.game_settings and Global.game_settings.one_down then	
	if tweak_data:difficulty_to_index(difficulty) == 8 then
		bulldozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
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
	[104452] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[104715] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	[104716] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Have Blackdozers spawn on Mayhem from Tear Gas Choppa
	[101785] = {
		values = {
			enemy = bulldozer
		}
	},
	[101786] = {
		values = {
			enemy = bulldozer
		}
	}
}