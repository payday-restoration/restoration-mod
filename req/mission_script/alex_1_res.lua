local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer_var_1 = math.random() 
local chance_dozer_var_2 = math.random()
local chance_cloaker_var_1 = math.random() 
local chance_cloaker_var_2 = math.random() 
local dozer_trigger_times = 2
local enable_special_dozers = false
local bravos_inbound = false
local chopper_amount = 1
local dozer_table = {
	dozer_green = "units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
	dozer_black = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	dozer_skull = "units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3",
	dozer_zeal_benelli = "units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	dozer_zeal_black = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc",
	dozer_zeal_skull = "units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
	dozer_titan = "units/pd2_dlc_vip/characters/ene_vip_2/ene_vip_2"
}
local cloaker_table = {
	spooc = "units/payday2/characters/ene_spook_1/ene_spook_1",
	zeal_spooc = "units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc",
	woman_spooc = "units/pd2_dlc_vip/characters/ene_spook_cloak_1/ene_spook_cloak_1"
}

	--enable the special dozers (the ones that replace unused cloaker spawns)
	if difficulty >= 7 then
		enable_special_dozers = true
	end

	if difficulty == 8 then
		dozer_trigger_times = 3
	end	
	
	if difficulty == 4 or difficulty == 5 then
		if chance_dozer_var_1 < 0.50 then
			dozer_1 = dozer_table.dozer_black
		else
			dozer_1 = dozer_table.dozer_green
		end
	elseif difficulty == 6 or difficulty == 7 then
		if chance_dozer_var_1 < 0.35 then
			dozer_1 = dozer_table.dozer_skull
		elseif chance_dozer_var_1 < 0.70 then
			dozer_1 = dozer_table.dozer_black
		else
			dozer_1 = dozer_table.dozer_green
		end
	elseif difficulty == 8 then
		if chance_dozer_var_1 < 0.25 then
			dozer_1 = dozer_table.dozer_zeal_black
		elseif chance_dozer_var_1 < 0.50 then
			dozer_1 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_var_1 < 0.75 then
			dozer_1 = dozer_table.dozer_titan
		else
			dozer_1 = dozer_table.dozer_zeal_benelli
		end
	end
	
	if difficulty == 4 or difficulty == 5 then
		if chance_dozer_var_2 < 0.50 then
			dozer_2 = dozer_table.dozer_black
		else
			dozer_2 = dozer_table.dozer_green
		end
	elseif difficulty == 6 or difficulty == 7 then
		if chance_dozer_var_2 < 0.35 then
			dozer_2 = dozer_table.dozer_skull
		elseif chance_dozer_var_2 < 0.70 then
			dozer_2 = dozer_table.dozer_black
		else
			dozer_2 = dozer_table.dozer_green
		end
	elseif difficulty == 8 then
		if chance_dozer_var_2 < 0.25 then
			dozer_2 = dozer_table.dozer_zeal_black
		elseif chance_dozer_var_2 < 0.50 then
			dozer_2 = dozer_table.dozer_zeal_skull
		elseif chance_dozer_var_2 < 0.75 then
			dozer_2 = dozer_table.dozer_titan
		else
			dozer_2 = dozer_table.dozer_zeal_benelli
		end
	end
	
	--setting up the cloaker randomizer, this is also cool
	if difficulty <= 7 then
		clonker = cloaker_table.spooc
		clonker_2 = cloaker_table.spooc
	else
		if chance_cloaker_var_1 < 0.50 then
			clonker = cloaker_table.zeal_spooc
		else
			clonker = cloaker_table.woman_spooc
		end
		if chance_cloaker_var_2 < 0.50 then
			clonker_2 = cloaker_table.zeal_spooc
		else
			clonker_2 = cloaker_table.woman_spooc
		end
	end
	
if pro_job then
		bravos_inbound = true
	if difficulty >= 7 then
		chopper_amount = 2
	end			
	if difficulty <= 7 then
		dozer_trigger_times = 3
	else
		dozer_trigger_times = 4
	end	
end
local access_fix = {
	pre_func = function (self)
			if not self._values.SO_access_original then
				self._values.SO_access_original = self._values.SO_access
				self._values.SO_access = managers.navigation:convert_access_filter_to_number({"cop", "swat", "fbi", "taser", "spooc"})
			end
		end
}	
return {
	--Call Bravos once Twitch arrives on PJs
	--[[
	[101983] = {
		spawn_bravos = bravos_inbound
	},
	]]--
	--Replace Heavy SWATs that spawn from the chopper with cloakers
	[101571] = {
		values = {
            enemy = clonker
		},
		on_executed = {
			{id = 101636, delay = 0}
		}
	},
	--this triggers the special dozer spawns
	[101572] = {
		values = {
            enemy = clonker_2
		},
		on_executed = {
			{id = 101636, delay = 0},
			{id = 101650, delay = 25},
			{id = 101651, delay = 25}
		}
	},
	--remove the line+trigger the loop here
	[100945] = {
		on_executed = {
			{id = 100946, remove = true},
			{id = 100965, delay = 180}
		}
	},
	--loop the choppa+2 chopper spawns on DW and DS (PJ only)
	[100966] = {
		values = {
            amount = chopper_amount
		},
		on_executed = {
			{id = 100965, delay = 300}
		}
	},
	--trigger_times to 0; making the loop possible
	[100953] = {
		values = {
            trigger_times = 0
		}
	},
	[100887] = {
		values = {
            trigger_times = 0
		}
	},
	--disable this just in case
	[101652] = {
		values = {
            enabled = false
		}
	},
	--unused cloakers are replaced with dozers (have trigger times set up, moved their position, spawns on DW and above)
	[101650] = {
		values = {
            enemy = dozer_1,
			enabled = enable_special_dozers,
			position = Vector3(4569, 537, 1205.660),
			trigger_times = dozer_trigger_times
		},
		on_executed = {
			{id = 100376, delay = 0}
		}
	},
	[101651] = {
		values = {
            enemy = dozer_2,
			enabled = enable_special_dozers,
			position = Vector3(4579, 611, 1206.850),
			trigger_times = dozer_trigger_times
		},
		on_executed = {
			{id = 100376, delay = 0}
		}
	},
	--allow fbi and spooc access to disable the power
	[101039] = access_fix,
	[101593] = access_fix,
	[101594] = access_fix,
	[101595] = access_fix,
	[101600] = access_fix,
	-- Reinforce next to cars
	[100941] = {
		reinforce = {
			{
				name = "such_a_nice_car",
				force = 2,
				position = Vector3(675, -1200, 875)
			}
		}
	}
}