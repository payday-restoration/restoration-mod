local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value_1 = 1050
		ponr_value_2 = 690
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value_1 = 1020
		ponr_value_2 = 660
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value_1 = 990
		ponr_value_2 = 630
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value_1 = 960
		ponr_value_2 = 600
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value_1 = 930
		ponr_value_2 = 570
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value_1 = 900
		ponr_value_2 = 540
	end
end

return {
	--Pro Job PONR 
	[101331] = {
		ponr = ponr_value_1
	},
	[102615] = {
		ponr = ponr_value_2
	},
	[101469] = {
		groups = {
			tac_shield_wall = false,
			tac_shield_wall_ranged = false,
			tac_shield_wall_charge = false
		}
	},
	[101470] = {
		groups = {
			tac_shield_wall = false,
			tac_shield_wall_ranged = false,
			tac_shield_wall_charge = false
		}
	}
}