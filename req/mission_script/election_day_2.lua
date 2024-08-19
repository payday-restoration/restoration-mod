local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down

	if difficulty <= 5 then
		ponr_value = 360	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 330
	else
		ponr_value = 300		
	end

--IF we're in Pro Job, then do this stuff below similiar to Big Bank	
if pro_job then
	swat_normal = "units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
	swat_hard = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
	swat_overkill = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
end
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