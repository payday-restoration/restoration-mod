local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local spooc_amount = 1

if pro_job then
	if difficulty == 8 then
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		spooc_amount = 2
	end
	if difficulty >= 4 then
		bravo_dozer = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"
	end
end	
	
	if difficulty <= 5 then
		ponr_value = 600
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 570	
	else
		ponr_value = 540	
	end
	
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