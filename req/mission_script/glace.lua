local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 7 then
		bulldozer = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
	else
		bulldozer = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"
	end	
	
	if difficulty_index <= 5 then
		ponr_value = 420	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 390
	else
		ponr_value = 360		
	end

return {
	--Pro Job PONR 
	[100137] = {
		ponr = ponr_value
	},
	--PDTH's OVK 145+ Throwback+Make this dozer spawn loopable like in PDTH (Fixes the special scaffolding spawn not using the zipline and replaces cloaker with bulldozer)
	[101320] = {
		values = {
			enemy = bulldozer,
			participate_to_group_ai = true
		},
		on_executed = {
			{id = 105615, delay = 30, delay_rand = 10}
		}
	},
	--Disable this spawn once George the pilot gets Kauzo out
	[100121] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(101320)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end
	},
	-- Remove spawn groups closest to broken bridge part
	[101176] = {
		values = {
			spawn_groups = { 100867, 101153, 101157, 101154, 101160, 101156, 101159 }
		}
	},
	-- Increase spawn group intervals next to prison vans, closest to furthest
	[100867] = {
		values = {
			interval = 60
		}
	},
	[101153] = {
		values = {
			interval = 60
		}
	},
	[101157] = {
		values = {
			interval = 60
		}
	},
	[101154] = {
		values = {
			interval = 45
		}
	},
	[101160] = {
		values = {
			interval = 45
		}
	},
	[101156] = {
		values = {
			interval = 30
		}
	},
	[101159] = {
		values = {
			interval = 30
		}
	}
}	