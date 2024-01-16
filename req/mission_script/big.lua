local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local shadow_fucked_me_hard = Global.game_settings and Global.game_settings.one_down
local swat_normal = "units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"
local swat_hard = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
local swat_overkill = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
local someone_gone_and_fucked_the_wall_up_chance = 50

	--So it will not crash
	if difficulty_index == 7 then
	   swat_overkill = "units/pd2_dlc_gitgud/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"  
	elseif difficulty_index == 8 then
	   swat_overkill = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
	end
	
	--High PONR Timer to work with ponr player scaling
	if difficulty_index <= 5 then
		ponr_value = 1080
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 1050	
	else
		ponr_value = 1020	
	end
	
	if difficulty_index == 6 or difficulty_index == 7 then
		someone_gone_and_fucked_the_wall_up_chance = 80
	elseif difficulty_index == 8 then
		someone_gone_and_fucked_the_wall_up_chance = 100
	end
	
	--Increase the time lock timers on mayhem above, will probably fuck 12 angry minutes achivement
	if difficulty_index >= 6 then
		timelock_normal = 240
		timelock_fast = 210
	end

--IF we're in Pro Job, then do this shit below
if shadow_fucked_me_hard then
	--Have Heavies be a thing from the start, with FBI Heavies spawning from Hard and most importantly...Titan Snipers on Overkill above
		swat_normal = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		swat_hard = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_overkill = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
	
	--Titan snipers in C4 route for DSPJ
	if difficulty_index == 8 then
		titan_sniper_c4 = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
	end

	--Increase the time lock timers on all diffs, will probably fuck 12 angry minutes achivement even more
	if difficulty_index <= 5 then
		timelock_normal = 240
		timelock_fast = 210
	else
		timelock_normal = 300
		timelock_fast = 270
	end	
end

local ponr_timer_player_mul = {
		1,
		0.85,
		0.7,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65,
		0.65
}

return {
	--Pro Job PONR. Heli and van timers increased
	--Helicopter
	[105804] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value + 300
	},
	--Van
	[103405] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value + 300
	},
	--C4 route
	[101373] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Bus
	[104782] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	--Elevator
	[101391] = {
		ponr_player_mul = ponr_timer_player_mul,
		ponr = ponr_value
	},
	-- Make server hack guranteed when solo
	[104494] = {
		pre_func = function (self)
			if table.size(managers.network:session():peers()) == 0 then
				self._chance = 100
			end
		end
	},
	--Prevent shields/dozers from disabling the timelock (Are we living in PDTH?)
	[101195] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "spooc"})
			end
		end
	},
	[102268] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "spooc"})
			end
		end
	},
	--adds swat access so titan snipers can move to SO spot
	[102890] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[102896] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[102900] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[102906] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	--More chance for blowing up the wall/also faster time to trigger
	[102451] = {
		values = {
            chance = someone_gone_and_fucked_the_wall_up_chance
		},
		on_executed = {
			{ id = 104386, delay = 60 }
		}
	},
	[102469] = {
		values = {
            chance = someone_gone_and_fucked_the_wall_up_chance
		},
		on_executed = {
			{ id = 104388, delay = 60 }
		}
	},
	--Titan Snipers replace C4 route snipers on DSPJ
	[102883] = {
		values = {
            enemy = titan_sniper_c4
		}
	},
	[102893] = {
		values = {
            enemy = titan_sniper_c4
		}
	},
	[102898] = {
		values = {
            enemy = titan_sniper_c4
		}
	},
	[102901] = {
		values = {
            enemy = titan_sniper_c4
		}
	},
	--More timelock timer on higher diifs and Pro Jobs
	[103137] = {
		values = {
            time = timelock_normal
		}
	},
	[100170] = {
		values = {
            time = timelock_fast
		}
	},
	-- Enable roof spawns
	[100006] = {
		values = {
			spawn_groups = { 100019, 100007, 100692 }
		}
	},
	-- Roof spawn intervals
	[100007] = {
		values = {
			interval = 20
		}
	},
	[100692] = {
		values = {
			interval = 20
		}
	},
	--Harasser Tweaks
	[100883] = {
		values = {
            enemy = swat_normal
		}
	},
	[100884] = {
		values = {
            enemy = swat_hard
		}
	},
	[100885] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100332] = {
		values = {
            enemy = swat_normal
		}
	},
	[100334] = {
		values = {
            enemy = swat_hard
		}
	},
	[100336] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100906] = {
		values = {
            enemy = swat_normal
		}
	},
	[100907] = {
		values = {
            enemy = swat_hard
		}
	},
	[100908] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100922] = {
		values = {
            enemy = swat_normal
		}
	},
	[100923] = {
		values = {
            enemy = swat_hard
		}
	},
	[100924] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100938] = {
		values = {
            enemy = swat_normal
		}
	},
	[100939] = {
		values = {
            enemy = swat_hard
		}
	},
	[100940] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100954] = {
		values = {
            enemy = swat_normal
		}
	},
	[100955] = {
		values = {
            enemy = swat_hard
		}
	},
	[100956] = {
		values = {
            enemy = swat_overkill
		}
	},
	[100969] = {
		values = {
            enemy = swat_normal
		}
	},
	[100970] = {
		values = {
            enemy = swat_hard
		}
	},
	[100971] = {
		values = {
            enemy = swat_overkill
		}
	},
	-- Reinforce groups in front of the vault
	[105844] = {
		reinforce = {
			{
				name = "meetingroom",
				force = 2,
				position = Vector3(-3400, 1000, -600)
			},
			{
				name = "outside_vault",
				force = 2,
				position = Vector3(-3000, 500, -1000)
			}
		}
	}
}