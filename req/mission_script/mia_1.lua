local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 600	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 540	
	else
		ponr_value = 480		
	end

return {
	--Pro Job PONR 
	[101289] = {
		ponr = ponr_value
	},
	-- Improve reinforce spots
	[100022] = {
		reinforce = {
			{
				name = "touch_grass",
				force = 3,
				position = Vector3(2000, -900, 30)
			}
		}
	},
	[100589] = {
		values = {
			enabled = false
		}
	},
	[100590] = {
		values = {
			enabled = false
		}
	}
}	