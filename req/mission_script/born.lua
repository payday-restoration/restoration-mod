local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local ponr_value = (difficulty <= 5 and 660 or (difficulty == 6 or difficulty == 7) and 630) or 600

local fbi_access = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"fbi"})
			end
		end
}	
local guard_biker = {
	values = {
         enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
	}
}
return {
	--Pro Job PONR 
	--kill the loop
	[100720] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(102530)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end,
		ponr = ponr_value
	},
	--Disable the turret
	[101175] = {
		values = {
			enabled = false
		}
	},
	--Allow only enemies with fbi access to interrupt Mike
	[101451] = fbi_access,
	[101536] = fbi_access,
	[103072] = {
		values = {
            sound_event = "l2n_a15"
		},
		on_executed = {
			{id = 103020, delay = 4.85}
		}
	},
	--Loopable heli 
	--trigger in alarm rather than in the second assault
	[100022] = {
		on_executed = {
			{id = 102530, delay = 360} --6 mins delay to trigger
		}
	},
	--not need to have that anymore
	[101908] = {
		values = {
			enabled = false
		}
	},
	--and you too
	[102538] = {
		values = {
			enabled = false
		}
	},
	--loop the choppa
	[102530] = {
		values = {
			trigger_times = 0
		},
		on_executed = {
			{ id = 102530, delay = 180}
		}
	},
	--Spawn Bikerdozer after opening the door
	[102786] = {
		on_executed = {
			{ id = 400001, delay = 0}
		}
	},
	-- Slow down roof and garage spawns
	[100007] = {
		values = {
			interval = 15
		}
	},
	[100128] = {
		values = {
			interval = 15
		}
	},
	--Have Vest Biker beat up Mike
	[100920] = guard_biker,
	--Biker replacements
	[100254] = guard_biker,
	[100295] = guard_biker,
	[100301] = guard_biker,
	[100373] = {
		values = {
			enemy = "units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"
		}
	},
	[100374] = {
		values = {
			enemy = "units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"
		}
	},
	[100384] = {
		values = {
			enemy = "units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"
		}
	}
}
