local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local zeal_shield = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"
local death_sentence = difficulty == 8
local fbi_dudes = 3
local chance_normal = 25
local chance_hard = 50
local chance_overkill = 65
	
	if difficulty <= 5 then
		ponr_value = 660	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 630	
	else
		ponr_value = 600		
	end

	if death_sentence then
		fbi_dudes = 4
	end	
		
	--If we're in Pro Job, do this stuff below
	if pro_job then
		chance_normal = 45
		chance_hard = 65
		chance_overkill = 80
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
	--Use unhooked PDTH's leftover shields as 2 extra shields on DS
	[101279] = {
		values = {
            enemy = zeal_shield,
			enabled = death_sentence
		}
	},
	[101280] = {
		values = {
            enemy = zeal_shield,
			enabled = death_sentence
		}
	},
	--and extra unhooked SWAT for DS too
	[101281] = {
		values = {
			enabled = death_sentence
		}
	},
	[101282] = {
		values = {
			enabled = death_sentence
		}
	},
	[101283] = {
		values = {
			enabled = death_sentence
		}
	},
	[101276] = {
		on_executed = {
			{ id = 101279, delay = 0 },
			{ id = 101280, delay = 0 },
			{ id = 101281, delay = 0 },
			{ id = 101282, delay = 0 },
			{ id = 101283, delay = 0 }
		}
	},
	--Spawn the blockade near loot dropoff
	[100771] = {
		on_executed = {
			{ id = 400020, delay = 0 }
		}
	},
	[101459] = {
		on_executed = {
			{ id = 400021, delay = 0 }
		}
	},
	-- Delay SWAT response
	--Spawn Ambush Snipers
	[100327] = {
		on_executed = {
			{ id = 100768, delay = 30 },
			{ id = 400019, delay = 0 }
		}
	}
}