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
	if difficulty_index == 7 or difficulty_index == 8 then
		titan_swat_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		titan_swat_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
	end
	if difficulty_index <= 5 then
		fbi_agent_1 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		fbi_agent_2 = "units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"
		fbi_agent_3 = "units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"
		titan_shield = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"
	else
		fbi_agent_1 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		fbi_agent_2 = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"
		fbi_agent_3 = "units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
end

return {
	--Pro Job PONR 
	[102872] = {
			ponr = ponr_value
	},
	--fixes the diff scaling with chance of ambush shields
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
	--one additional man on DS (from 3 to 4)
	[102845] = {
		values = {
            amount = fbi_dudes
		}
	},
	--ambush chance tweaks on PJs
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
	--those guys replace scripted ambush beat cops on DW-DS PJ
	[100360] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100361] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100363] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100367] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100371] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100372] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100373] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100374] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100375] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100376] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100377] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100378] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100379] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100392] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100395] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100404] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100432] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100433] = {
		values = {
            enemy = titan_swat_2
		}
	},
	[100435] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100436] = {
		values = {
            enemy = titan_swat_1
		}
	},
	[100438] = {
		values = {
            enemy = titan_swat_1
		}
	},
	--FBI Ready Teams on Overkill below, gets replaced with Titan squad on Mayhem+
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
	--FBI Shields for Overkill below, gets replaced with Titan shields on Mayhem+
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