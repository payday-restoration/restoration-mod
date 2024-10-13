local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 960 or (difficulty == 6 or difficulty == 7) and 930) or 900

local fbi_access = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"fbi"})
			end
		end
}	

return {
	--Pro Job PONR 
	[100914] = {
		ponr = ponr_value
	},
	--The love story of 2 beat cops
	[101241] = fbi_access,
	[101242] = fbi_access,
	-- Gradually increase difficulty
	[100810] = {
		difficulty = 0.25
	},
	[101313] = {
		difficulty = 1
	}
}	