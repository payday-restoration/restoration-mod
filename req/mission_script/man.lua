local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ambush_unit_amount = 1
local ambush_unit_amount_random = 2 

--If we're in Pro Job, then do this stuff below
if pro_job then
	--First, replace scripted shields and harassers with titan shields/snipers
	if difficulty >= 5 then
		australian_sniper = "units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"
		titan_shield = "units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
	end
	--DS, has Titan cloaker replace scripted escape cloaker and have more units during escape part
	if difficulty == 8 then
		woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		ambush_unit_amount = 2
		ambush_unit_amount_random = 3 
	end
end

	if difficulty <= 4 then
		gas_dozer = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"
	elseif difficulty == 5 or difficulty == 6 or difficulty == 7 then
		gas_dozer = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"
	else
		gas_dozer = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"
	end
	
local disabled = {
	values = {
        enabled = false
	}
}	
local dozer_heli = {
	values = {
        enemy = gas_dozer
	}
}
local tshield = {
	values = {
        enemy = titan_shield
	}
}
local tsniper = {
	values = {
        enemy = australian_sniper
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
			{id = 101608, delay = 180}
		}
	},
	--remove the line
	[102010] = {
		on_executed = {
			{ id = 101608, remove = true}
		}
	},
	--switch to 0 to make loopable dozer chopper spawn possible
	[101608] = {
		values = {
			trigger_times = 0
		}
	},
	--loop the choppa
	[103297] = {
		on_executed = {
			{ id = 101608, delay = 180}
		}
	},
	--tweak the delays
	[103295] = {
		on_executed = {
			{ id = 103298, delay = 24},
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
	[103293] = dozer_heli,
	[103294] = dozer_heli,
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
	--More squad units waiting at the escape on DSPJ
	[102424] = {
		values = {
            amount = ambush_unit_amount,
			amount_random = ambush_unit_amount_random
		}
	},
	--Titan Cloaker on DSPJ
	[102409] = {
		values = {
            enemy = woman_spooc
		}
	},
	--Titan Shields replace regular ones during escape part
	[102410] = tshield,
	[102411] = tshield,
	[102416] = tshield,
	[102417] = tshield,
	--Titan Snipers replace some SWAT Harassers on Pro Jobs
	[103228] = tsniper,
	[103234] = tsniper,
	[103235] = tsniper,
	[103237] = tsniper,
	[103839] = tsniper,
	[103841] = tsniper,
	[103843] = tsniper,
	[103845] = tsniper,
	[103847] = tsniper,
	[103849] = tsniper
}	
