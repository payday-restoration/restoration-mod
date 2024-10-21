local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local bulldozer = (difficulty == 8 and "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc") or "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"
local ponr_value = (difficulty <= 5 and 420 or (difficulty == 6 or difficulty == 7) and 390) or 360

local high_interval = {
	values = {
		interval = 60
	}
}
local medium_interval = {
	values = {
		interval = 45
	}
}
local low_interval = {
	values = {
		interval = 30
	}
}

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
		}
	},
	--trigger custom spawns during escape part
	[103111] = {
		on_executed = {
			{id = 400001, delay = 0},
			{id = 400002, delay = 0},
			{id = 400003, delay = 0},
			{id = 400004, delay = 0}
		}
	},
	--trigger custom spawns in scaffolding part
	[103543] = {
		on_executed = {
			{id = 400005, delay = 0},
			{id = 400006, delay = 0},
			{id = 400007, delay = 0},
			{id = 400008, delay = 0}
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
	[100867] = high_interval,
	[101153] = high_interval,
	[101157] = high_interval,
	[101154] = medium_interval,
	[101160] = medium_interval,
	[101156] = low_interval,
	[101159] = low_interval
}	