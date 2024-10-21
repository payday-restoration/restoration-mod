local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 300) or 480

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
	[300204] = {
		ponr = ponr_value
	},
	-- Delay SWAT response
	[300203] = {
		on_executed = {
			{ id = 300164, delay = 45 }
		}
	},
	--access fix, beat cops use fbi access
	[302019] = fbi_access,
	[302021] = fbi_access,
	[302022] = fbi_access
}