local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local fbi_dudes = 3
local chance_normal = 25
local chance_hard = 50
local chance_overkill = 65
	
	if difficulty_index <= 5 then
		ponr_value = 660	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 630	
	else
		ponr_value = 600		
	end

	if difficulty_index == 8 then
		fbi_dudes = 4
	end	
	
	if Global.game_settings and Global.game_settings.one_down then
		chance_normal = 45
		chance_hard = 75
		chance_overkill = 100
		fbi_agent_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		fbi_agent_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		fbi_agent_3 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
	if difficulty_index >= 5 then
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
	if difficulty_index == 8 then
		fbi_agent_1 = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"
	end
end

return {
	--Pro Job PONR 
	[102872] = {
			ponr = ponr_value
	},
	[102316] = {
		values = {
			difficulty_normal = "true",
            difficulty_hard = "true",
			difficulty_overkill = "false",
			difficulty_overkill_145 = "false",
			difficulty_easy_wish = "false",
			difficulty_overkill_290 = "false",
			difficulty_sm_wish = "false"
		}
	},
	[102318] = {
		values = {
            difficulty_normal = "false",
            difficulty_hard = "false",
			difficulty_overkill = "true",
			difficulty_overkill_145 = "true",
			difficulty_easy_wish = "true",
			difficulty_overkill_290 = "false",
			difficulty_sm_wish = "false"
		}
	},
	[102319] = {
		values = {
            difficulty_normal = "false",
            difficulty_hard = "false",
			difficulty_overkill = "false",
			difficulty_overkill_145 = "false",
			difficulty_easy_wish = "false",
			difficulty_overkill_290 = "true",
			difficulty_sm_wish = "true"
		}
	},
	[101687] = {
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false,
			CS_shields = false,
			FBI_shields = false,
			FBI_shields_boom = false,
			GS_shields = false,
			GS_shields_boom = false,
			GS_defend_shields = false
		}
	},
	[102827] = {
		groups = {
			GREEN_tanks = false,
			BLACK_tanks = false,
			SKULL_tanks = false,
			TIT_tanks = false
		}
	},
	[102845] = {
		values = {
            amount = fbi_dudes
		}
	},
	[102315] = {
		values = {
            chance = chance_normal
		}
	},
	[101878] = {
		values = {
            chance = chance_hard
		}
	},
	[101873] = {
		values = {
            chance = chance_overkill
		}
	},
	[102841] = {
		values = {
            enemy = fbi_agent_1
		}
	},
	[102842] = {
		values = {
            enemy = fbi_agent_2
		}
	},
	[102843] = {
		values = {
            enemy = fbi_agent_3
		}
	},
	[102844] = {
		values = {
            enemy = fbi_agent_2
		}
	},
	[102848] = {
		values = {
            enemy = titan_shield
		}
	},
	[102849] = {
		values = {
            enemy = titan_shield
		}
	},
	[102850] = {
		values = {
            enemy = titan_shield
		}
	},
	[102851] = {
		values = {
            enemy = titan_shield
		}
	},
	-- Delay SWAT response
	[100327] = {
		on_executed = {
			{ id = 100768, delay = 30 }
		}
	}
}