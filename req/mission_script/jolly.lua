local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 420
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 390	
	else
		ponr_value = 360	
	end

return {
	--Pro Job PONR 
	[100082] = {
		ponr = ponr_value
	},
	--End PONR once everyone is inside the truck
	[100771] = {
        ponr_end = true
    }
}