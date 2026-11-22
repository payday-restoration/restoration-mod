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
	-- Pro Job PONR 
	[300204] = {
		ponr = ponr_value
	},
	-- Delay SWAT response
	[300203] = {
		on_executed = {
			{ id = 300164, delay = 45 }
		}
	},
		[300164] = { -- Add an unused spawngroup
		values = {
			spawn_groups = { 300313, 300314, 300281 },
		},
	},
	-- Fix one of the cop cars not being hidden
	[302012] = {
		values = {
			unit_ids = {
				302026,
				302025,
				302023,
				302027,
				500501,
				500857,
				500851,
			},
		},
	},
	-- Combine some navigation areas
	[300000] = {
		ai_area = {
			{ 47, 54, 67, 68, 70, 112 },
			{ 49, 61, 73 },
			{ 41, 52 },
			{ 29, 33, 42, 44 },
			{ 3, 4 },
			{ 45, 57, 60, 69 },
			{ 58, 65 },
			{ 76, 84 },
			{ 81, 72 },
			{ 55, 111 },
			{ 86, 101, 104, 106, 108, 109 },
			{ 24, 39 },
			{ 90, 93, 94, 96 },
		},
	},
	-- Access fix, beat cops use fbi access
	[302019] = fbi_access,
	[302021] = fbi_access,
	[302022] = fbi_access,
	
}