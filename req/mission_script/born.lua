local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630
	else
		ponr_value = 600	
	end

return {
	--Pro Job PONR 
	[100720] = {
		ponr = ponr_value
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
	--kill the loop
	[100720] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(102530)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end
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
	[100920] = {
		values = {
			enemy = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	--Biker replacements
	[100254] = {
		values = {
			enemy =  "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[100295] = {
		values = {
			enemy =  "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
	[100301] = {
		values = {
			enemy =  "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
		}
	},
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