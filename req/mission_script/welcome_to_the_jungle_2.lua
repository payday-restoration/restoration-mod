local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 540 or (difficulty == 6 or difficulty == 7) and 510) or 480	

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
			base_delay = 30,
			base_delay_rand = 30
		}
	}
}