local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer_var_1 = math.rand(1)
local chance_dozer_var_2 = math.rand(1)
local chance_elite = math.rand(1)
local dozer_table = {
	dozer_green = "units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1",
	dozer_black = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
	dozer_skull = "units/pd2_mod_reapers/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_benelli = "units/pd2_mod_reapers/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
}
local eseries_table = {
	e102_gamma = "units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper",
	e106_delta = "units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle",
	e110_eta = "units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser",
	e123_omega = "units/pd2_mod_reapers/characters/ene_vip_2/ene_vip_2",
	e1000_ghost = "units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}

	if difficulty_index <= 5 then
		ponr_value = 600
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 570	
	else
		ponr_value = 540		
	end
	
	--Setting up the dozer randomizer, this is cool
	if difficulty_index == 4 or difficulty_index == 5 then
		if chance_dozer_var_1 < 0.50 then
			dozer_1 = dozer_table.dozer_black
		else
			dozer_1 = dozer_table.dozer_green
		end
	elseif difficulty_index == 6 or difficulty_index == 7 then
		if chance_dozer_var_1 < 0.35 then
			dozer_1 = dozer_table.dozer_skull
		elseif chance_dozer_var_1 < 0.70 then
			dozer_1 = dozer_table.dozer_black
		else
			dozer_1 = dozer_table.dozer_green
		end
	elseif difficulty_index == 8 then
		if chance_dozer_var_1 < 0.25 then
			dozer_1 = dozer_table.dozer_black
		elseif chance_dozer_var_1 < 0.50 then
			dozer_1 = dozer_table.dozer_skull
		elseif chance_dozer_var_1 < 0.75 then
			dozer_1 = dozer_table.dozer_benelli
		else
			dozer_1 = eseries_table.e123_omega
		end
	end
	
	if difficulty_index == 4 or difficulty_index == 5 then
		if chance_dozer_var_2 < 0.50 then
			dozer_2 = dozer_table.dozer_black
		else
			dozer_2 = dozer_table.dozer_green
		end
	elseif difficulty_index == 6 or difficulty_index == 7 then
		if chance_dozer_var_2 < 0.35 then
			dozer_2 = dozer_table.dozer_skull
		elseif chance_dozer_var_2 < 0.70 then
			dozer_2 = dozer_table.dozer_black
		else
			dozer_2 = dozer_table.dozer_green
		end
	elseif difficulty_index == 8 then
		if chance_dozer_var_2 < 0.25 then
			dozer_2 = dozer_table.dozer_black
		elseif chance_dozer_var_2 < 0.50 then
			dozer_2 = dozer_table.dozer_skull
		elseif chance_dozer_var_2 < 0.75 then
			dozer_2 = dozer_table.dozer_benelli
		else
			dozer_2 = eseries_table.e123_omega
		end
	end
	
	
	--Random titan unit for Mayhem+. Otherwise - vet cop
	if difficulty_index <= 5 then
		eseries_elite_unit = "units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1"
	else
		if difficulty_index ~= 8 then
			if chance_elite < 0.25 then
				eseries_elite_unit = eseries_table.e106_delta
			elseif chance_elite < 0.50 then
				eseries_elite_unit = eseries_table.e110_eta
			elseif chance_elite < 0.75 then
				eseries_elite_unit = eseries_table.e102_gamma
			else
				eseries_elite_unit = eseries_table.e123_omega
			end
		else
			if chance_elite < 0.20 then
				eseries_elite_unit = eseries_table.e106_delta
			elseif chance_elite < 0.40 then
				eseries_elite_unit = eseries_table.e110_eta
			elseif chance_elite < 0.60 then
				eseries_elite_unit = eseries_table.e102_gamma
			elseif chance_elite < 0.80 then
				eseries_elite_unit = eseries_table.e1000_ghost
			else
				eseries_elite_unit = eseries_table.e123_omega
			end
		end
	end
	
if pro_job then
	if difficulty_index >= 5 then
		epsilon_shield = "units/pd2_mod_reapers/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end	
	if difficulty_index >= 7 then
		gamma_sniper = eseries_table.e102_gamma
		bravo_sniper = "units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru"
	end	
end
	

return {
	--Pro Job PONR
	[100176] = {
		ponr = ponr_value
	},
	--fix hunt used by reaper sec in lab
	[100245] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "fbi"})
			end
		end
	},
	--allow swat access (that titan sniper use) to use sniper's SO
	[101783] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[101784] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100587] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100589] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100595] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100609] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100611] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100613] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	[100615] = {
		pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"sniper", "swat"})
			end
		end
	},
	--trigger the elite spawn when enterning the lab
	[100335] = {
		on_executed = {
			{id = 101053, delay = 1}
		}
	},
	--use unused lab spawn as random elite unit
	[101053] = {
		values = {
            enemy = eseries_elite_unit,
			position = Vector3(1421.624, 2495.052, -800.000),
			rotation = Rotation(138.000, 0, -0)
		}
	},
	--Titan/Bravo Snipers for DW+ (PJ only)
	[101782] = {
		values = {
            enemy = gamma_sniper
		}
	},
	[101785] = {
		values = {
            enemy = gamma_sniper
		}
	},
	[100586] = {
		values = {
            enemy = bravo_sniper
		}
	},
	[100588] = {
		values = {
            enemy = bravo_sniper
		}
	},
	[100594] = {
		values = {
            enemy = bravo_sniper
		}
	},
	[100608] = {
		values = {
            enemy = bravo_sniper
		}
	},
	[100610] = {
		values = {
            enemy = bravo_sniper
		}
	},
	[100612] = {
		values = {
            enemy = bravo_sniper
		}
	},
	[100614] = {
		values = {
            enemy = bravo_sniper
		}
	},
	--Titan Shields for OVK+ (PJ only)
	[101860] = {
		values = {
            enemy = epsilon_shield
		}
	},
	[101863] = {
		values = {
            enemy = epsilon_shield
		}
	},
	[101864] = {
		values = {
            enemy = epsilon_shield
		}
	},
	--dozers gets randomized
	[101848] = {
		values = {
            enemy = dozer_1
		}
	},
	[101852] = {
		values = {
            enemy = dozer_1
		}
	},
	[101854] = {
		values = {
            enemy = dozer_1
		}
	},
	[101851] = {
		values = {
            enemy = dozer_2
		}
	},
	[101853] = {
		values = {
            enemy = dozer_2
		}
	},
	[101855] = {
		values = {
            enemy = dozer_2
		}
	},
	-- Disable instant difficulty increase
	[101980] = {
		values = {
			enabled = false
		}
	},
	[101596] = {
		difficulty = 0.5
	}
}