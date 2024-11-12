local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local murky_guard = (difficulty == 8 and "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870") or "units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870"
local timelock = (difficulty == 8 and 210 or (difficulty == 7 or difficulty == 6) and 150) or 120

local enabled = {
	values = {
        enabled = true
	}
}
local disabled = {
	values = {
        enabled = false
	}
}
local murky_mp5 = {
	values = {
        enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"
	}
}
local murky_c45 = {
	values = {
        enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"
	}
}
local murky_c45_enabled = {
	values = {
        enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",
		enabled = true
	}
}
local murky_mp5_enabled = {
	values = {
        enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5",
		enabled = true
	}
}
local murky_bronco = {
	values = {
        enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull"
	}
}

return {
	--Increase PONR timers
	[101161] = {
		values = {
			time_normal = 480,
			time_hard = 480,
			time_overkill = 450,
			time_overkill_145 = 450,
			time_easy_wish = 450,
			time_overkill_290 = 420,
			time_sm_wish = 420
		}
	},
	--More timelock timer on Pro Jobs
	[101402] = {
		values = {
            timer = timelock
		}
	},
	-- restores some unused sniper spawns with their SOs
	[100369] = enabled,
	[100389] = enabled,
	[100399] = enabled,
	[100409] = enabled,
	[100368] = enabled,
	[100398] = enabled,
	[100388] = enabled,
	[100408] = enabled,
	--murky spawn changes
	--Spawn the dozer in security room on Pro Jobs
	[101669] = {
		values = {
            enemy = murky_guard
		}
	},
	[101670] = murky_bronco,
	[101671] = murky_c45,
	[101672] = murky_mp5,
	[101949] = murky_mp5_enabled,
	[101950] = murky_c45_enabled,
	[100596] = murky_mp5,
	-- Allow bot navigation earlier
	[102736] = {
		on_executed = {
			{ id = 103049, delay = 1 }
		}
	}
}