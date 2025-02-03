local greendozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
local blackdozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
local skulldozer = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"
local zeal_bendozer = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"
local zeal_skulldozer = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc"
local zeal_blackdozer = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"
local titandozer = "units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault"
local dozertable_vh_ovk = {greendozer, greendozer, greendozer, blackdozer, blackdozer, blackdozer}
local dozertable_mayhem_dw = {skulldozer, skulldozer, greendozer, greendozer, blackdozer, blackdozer}
local dozertable_ds = {zeal_skulldozer, zeal_skulldozer, zeal_skulldozer, zeal_blackdozer, zeal_blackdozer, zeal_blackdozer, zeal_bendozer, zeal_bendozer, zeal_bendozer, titandozer}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local titan_shield = ((difficulty >= 6 and pro_job) and "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
local woman_spooc = ((difficulty == 8 and pro_job) and "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1")
local gas_dozer = (difficulty == 8 and dozertable_ds or (difficulty == 7 or difficulty == 6) and dozertable_mayhem_dw or (difficulty == 5 or difficulty == 4) and dozertable_vh_ovk)
local overkill_above = difficulty >= 5	
local disabled = {
	values = {
        enabled = false
	}
}	
local dozer_heli = {
	values = {
        enemy = gas_dozer,
		participate_to_group_ai = false
	},
	on_executed = {
		{id = 400002, delay = 0}
	}
}
local tshield = {
	values = {
        enemy = titan_shield
	}
}
return {
	 --flashlights, flashlights, flashlights!!!!!!!!!! (enables/disables flashlights when the power is off/on like in PDTH)
	[100756] = {
		flashlight = true
	},
	[101801] = {
		flashlight = false
	},
	--Give saw to all players (Resmod edit not always give saw for every player)
	[101865] = {
		func = function(self)
			managers.network:session():send_to_peers_synched("give_equipment", self._values.equipment, self._values.amount)
		end
	},
	--Spawn more planks (like in PDTH)
	[101661] = {
		values = {
			amount = 20
		}
	},
	--Have the gas chopper be a dozer chopper that has loopable spawn
	--Trigger the heli spawn in police_called instead of triggering during hacking
	[100131] = {
		on_executed = {
			{id = 101608, delay = 240}
		}
	},
	--remove the line
	[102010] = {
		on_executed = {
			{ id = 101608, remove = true}
		}
	},
	--switch to 0 to make loopable dozer chopper spawn possible
	--only on ovk and above
	[101608] = {
		values = {
			trigger_times = 0,
			enabled = overkill_above
		}
	},
	--loop the choppa
	[103297] = {
		on_executed = {
			{ id = 101608, delay = 240}
		}
	},
	--tweak the delays
	[103295] = {
		on_executed = {
			{ id = 103298, delay = 24},
			{ id = 400001, delay = 22}, --incoming dozers warning
			{ id = 102950, delay = 16}
		}
	},
	[102950] = {
		on_executed = {
			{ id = 103895, delay = 4}
		}
	},
	[103298] = {
		on_executed = {
			{ id = 101716, delay = 3}
		}
	},
	--Replace the spawns with dozers
	[104045] = dozer_heli,
	[104046] = dozer_heli,
	[104047] = dozer_heli,
	[104048] = dozer_heli,
	[104049] = dozer_heli,
	[104050] = dozer_heli,
	--disable the Gas SO (it's useless anyway)
	[103302] = disabled,
	[103303] = disabled,
	--disable this once done with hacking
	[102754] = {
		func = function(self)
			local turn_this_shit_off = self:get_mission_element(103297)

			if turn_this_shit_off then
				turn_this_shit_off:set_enabled(false)
			end
		end
	},
	--Pro Job Stuff
	--Titan Cloaker on DSPJ
	[102409] = {
		values = {
            enemy = woman_spooc
		}
	},
	--Titan Shields replace regular ones during escape part on higher diff
	[102410] = tshield,
	[102411] = tshield,
	[102416] = tshield,
	[102417] = tshield
}	
