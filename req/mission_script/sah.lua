if Global.game_settings and Global.game_settings.one_down then
ponr_value = 0
ponr_toggle = false

	if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 690
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 660
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 630
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 600
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 570
		ponr_toggle = true	
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 540
		ponr_toggle = true		
	end
end

return {
	--Pro Job PONR 
	[103820] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	-- Disable instant difficulty increase
	[100122] = {
		values = {
			enabled = false
		}
	},
	--Made Locke less annoying
	[101989] = {
		values = {
			trigger_times = 1
		}
	},
	[101400] = {
		difficulty = 0.5,
		reinforce = {
			{
				name = "auction_room",
				force = 5,
				position = Vector3(0, 2000, -100)
			}
		}
	}
}