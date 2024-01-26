local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
local spooc_amount = 1

if pro_job then
	if difficulty_index == 8 then
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		spooc_amount = 2
	end
	if difficulty_index >= 4 then
		bravo_dozer = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer"
	end
end	
	
	if difficulty_index <= 5 then
		ponr_value = 600
	elseif difficulty_index == 6 or difficulty_index == 7 then
		ponr_value = 570	
	else
		ponr_value = 540	
	end
	

return {
	--Pro Job PONR
	[101106] = {
		ponr = ponr_value
	},
	--Disable the SWAT Turrets, why would they add those fucking annoying turrets in this day, spawning reinforcments is already ENOUGH!!!!
	[101147] = {
		values = {
			enabled = false
		}
	},
	-- Reduce amount of ambush bulldozers
	[101557] = {
		values = {
			enabled = false
		}
	},
	[100567] = {
		values = {
			enabled = false
		}
	},
	[101575] = {
		values = {
			enabled = false
		}
	},
	[102438] = { 
		values = {
            amount = spooc_amount
		}
	},
	--Titan Cloakers replace scripted escape cloakers on DSPJ
	[102430] = { 
		values = {
            enemy = woman_spooc
		}
	},
	[102431] = { 
		values = {
            enemy = woman_spooc
		}
	},
	[102423] = { 
		values = {
            enemy = woman_spooc
		}
	},
	[102436] = { 
		values = {
            enemy = woman_spooc
		}
	},
	--Bravo Dozers replace scripted dozer that kicks the door out
	[102412] = { 
		values = {
            enemy = bravo_dozer
		}
	},
	[102411] = { 
		values = {
            enemy = bravo_dozer
		}
	},
	[102404] = { 
		values = {
            enemy = bravo_dozer
		}
	},
	--less skulldozers (seriously Jules, stop it)
	[100485] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		}
	},
	[100499] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		}
	},
	[101176] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
		}
	},
	[101398] = { 
		values = {
            enemy = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
		}
	},
	[101182] = { 
		values = {
            enemy = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
		}
	}
}