local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local spooc_amount = (difficulty == 8 and 2) or 1
local woman_spooc = ((difficulty == 8 and pro_job) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
local bravo_dozer = ((difficulty >= 4 and pro_job) and "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer")
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540
	
local tcloaker = {
	values = {
        enemy = woman_spooc
    }
}
local bravo_dozer = {
	values = {
        enemy = bravo_dozer
    }
}
local disabled = {
	values = {
        enabled = false
	}
}
return {
	--Pro Job PONR
	[101106] = {
		ponr = ponr_value
	},
	--Disable the SWAT Turrets, it's not fun...
	[101147] = disabled,
	-- Reduce amount of ambush bulldozers
	[101557] = disabled,
	[100567] = disabled,
	[101575] = disabled,
	[102438] = { 
		values = {
            amount = spooc_amount
		}
	},
	--Titan Cloakers replace scripted escape cloakers on DSPJ
	[102430] = tcloaker,
	[102431] = tcloaker,
	[102423] = tcloaker,
	[102436] = tcloaker,
	--Bravo Dozers replace scripted dozer that kicks the door out
	[102412] = bravo_dozer,
	[102411] = bravo_dozer,
	[102404] = bravo_dozer
}