if Global.game_settings and Global.game_settings.one_down and not managers.groupai:state():whisper_mode() then
ponr_value = 0
ponr_toggle = false
if tweak_data:difficulty_to_index(difficulty) <= 2 then
		ponr_value = 1290
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 3 then
		ponr_value = 1260
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 4 then
		ponr_value = 1260
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 5 then
		ponr_value = 1230
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 6 or tweak_data:difficulty_to_index(difficulty) == 7 then
		ponr_value = 1230
		ponr_toggle = true
	elseif tweak_data:difficulty_to_index(difficulty) == 8 then
		ponr_value = 1200
		ponr_toggle = true
	end
end

return {
	--Pro Job PONR 
	[101226] = {
		ponr = ponr_value,
		enabled = ponr_toggle
	},
	[103595] = {
		reinforce = {
			{
				name = "main_room",
				force = 3,
				position = Vector3(300, -1600, 12100)
			}
		}
	},
	[103831] = {
		reinforce = {
			{
				name = "main_room"
			},
			{
				name = "helipad",
				force = 3,
				position = Vector3(1600, -1600, 13100)
			}
		}
	}
}