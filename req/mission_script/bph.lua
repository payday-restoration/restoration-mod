local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local murky_guard = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870"

	if difficulty_index >= 6 then
		timelock = 150
	end	

if Global.game_settings and Global.game_settings.one_down then

		murky_guard = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"
		
	if difficulty_index <= 5 then
		timelock = 150
	else	
		timelock = 210
	end
end

return {
	--More timelock timer on Pro Jobs
	[101402] = {
		values = {
            time = timelock
		}
	},
	-- restores some unused sniper spawns with their SOs
	[100369] = {
		values = {
			enabled = true
		}
	},
	[100389] = {
		values = {
			enabled = true
		}
	},
	[100399] = {
		values = {
			enabled = true
		}
	},
	[100409] = {
		values = {
			enabled = true
		}
	},
	[100368] = {
		values = {
			enabled = true
		}
	},
	[100398] = {
		values = {
			enabled = true
		}
	},
	[100388] = {
		values = {
			enabled = true
		}
	},
	[100408] = {
		values = {
			enabled = true
		}
	},
	--murky spawn changes
	--Spawn the dozer in security room (PJ only)
	[101669] = {
		values = {
            enemy = murky_guard
		}
	},
	[101670] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull"
		}
	},
	[101671] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"
		}
	},
	[101672] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"
		}
	},
	[101949] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5",
			enabled = true
		}
	},
	[101950] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",
			enabled = true
		}
	},
	[100596] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"
		}
	},
	-- Allow bot navigation earlier
	[102736] = {
		on_executed = {
			{ id = 103049, delay = 1 }
		}
	}
}