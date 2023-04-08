local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

if Global.game_settings and Global.game_settings.one_down then
ponr_value_1 = 0
ponr_toggle_1 = false

ponr_value_2 = 0
ponr_toggle_2 = false
	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value_1 = 1050
		ponr_toggle_1 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value_1 = 1020
		ponr_toggle_1 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value_1 = 990
		ponr_toggle_1 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value_1 = 960
		ponr_toggle_1 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value_1 = 930
		ponr_toggle_1 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value_1 = 900
		ponr_toggle_1 = true
	end

if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value_2 = 690
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value_2 = 660
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value_2 = 630
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value_2 = 600
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value_2 = 570
		ponr_toggle_2 = true
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value_2 = 540
		ponr_toggle_2 = true
	end
end

return {
	--Pro Job PONR 
	[101331] = {
		ponr = ponr_value_1,
		enabled = ponr_toggle_1
	},
	[102615] = {
		ponr = ponr_value_2,
		enabled = ponr_toggle_2
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