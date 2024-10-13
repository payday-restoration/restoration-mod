local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local swat_normal = (pro_job and "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc")
local swat_hard = (pro_job and "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc")
local swat_overkill = (pro_job and "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
local ponr_value = (difficulty <= 5 and 360 or (difficulty == 6 or difficulty == 7) and 330) or 300

local swat_n = {
	values = {
        enemy = swat_normal
	}
}
local swat_h = {
	values = {
        enemy = swat_hard
	}
}
local swat_ovk = {
	values = {
        enemy = swat_overkill
	}
}
local disabled = {
	values = {
        enabled = false
	}
}
return {
	--Pro Job PONR 
	[100931] = {
		ponr = ponr_value
	},
	-- Fix harasser respawn delay
	[102807] = {
		on_executed = {
			{ id = 102804, delay = 30 }
		}
	},
	--Disable SWAT Turrets (when they're literally are next to harrasers)
	[101495] = disabled,
	[101496] = disabled,
	--Harasser Tweak Spawns
	[102732] = swat_n,
	[102733] = swat_h,
	[102742] = swat_ovk,
	[102428] = swat_n,
	[102429] = swat_h,
	[102430] = swat_ovk,
	[102444] = swat_n,
	[102445] = swat_h,
	[102446] = swat_ovk,
	[102460] = swat_n,
	[102461] = swat_h,
	[102462] = swat_ovk,
	[102762] = swat_n,
	[102763] = swat_h,
	[102764] = swat_ovk,
	[102778] = swat_n,
	[102779] = swat_h,
	[102780] = swat_ovk,
	[102794] = swat_n,
	[102795] = swat_h,
	[102796] = swat_ovk,
	[102810] = swat_n,
	[102811] = swat_h,
	[102812] = swat_ovk,
	[103125] = swat_ovk,
	[103133] = swat_ovk,
	[103134] = swat_ovk,
	[103135] = swat_ovk,
	[103136] = swat_ovk,
	[103137] = swat_ovk,
	[103138] = swat_ovk
}