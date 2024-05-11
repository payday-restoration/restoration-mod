local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	
	if difficulty <= 5 then
		ponr_value = 540	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 510	
	else
		ponr_value = 480		
	end
local ponr = {
	ponr = ponr_value
}	

return {
	--Pro Job PONR
	[103328] = ponr,
	[102207] = ponr,
	-- Add power cut SO delay
	[100313] = {
		values = {
			base_delay = 10,
			base_delay_rand = 10
		}
	}
}