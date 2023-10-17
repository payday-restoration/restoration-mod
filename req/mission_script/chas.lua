local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 540	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 480	
	else
		ponr_value = 420	
	end

return {
	--Pro Job PONR 
	[100818] = {
		ponr = ponr_value
	},
	--Technically should fix softlock when blowtorch interactions are unavailable. Also player can't abuse keys in loud
	[100778] = {
		on_executed = {
			{id = 101278, delay = 0}
		}
	},
	[101190] = {
		reinforce = {
			{
				name = "store_front1",
				force = 3,
				position = Vector3(-2000, 300, -10)
			},
			{
				name = "store_front2",
				force = 3,
				position = Vector3(-1000, 300, -10)
			}
		}
	},
	[101647] = {
		reinforce = {
			{
				name = "store_front2"
			},
			{
				name = "back_alley",
				force = 3,
				position = Vector3(-1400, 4900, 540)
			}
		}
	}
}