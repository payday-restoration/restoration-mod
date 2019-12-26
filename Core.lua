if not ModCore then
	restoration.log_shit("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

function restoration:Init()
	restoration.log_shit("SC: LOADING: " .. self.ModPath)
	restoration.captain_camper = {
		"arena", --Alesso
		"welcome_to_the_jungle_1", --Big Oil Day 1
		"welcome_to_the_jungle_1_night", --Big Oil Day 1 Night
		"welcome_to_the_jungle_2", --Big Oil Day 2
		"election_day_1", --Election Day 1
		"election_day_2", --Election Day 2
		"election_day_3", --Election Day 3
		"election_day_3_skip1", --Election Day 3 (Skipped 1)
		"election_day_3_skip2", --Election Day 3 (Skipped 2)
		"firestarter_1", --Firestarter Day 1
		"mia_1", --Hotline Day 1
		"hox_2", --Hoxout Day 2
		"jewelry_store", --Jewelry Store
		"alex_1", --Rats Day 1
		"dinner", --Slaughterhouse
		"moon", --Stealing Xmas
		"ukrainian_job", --Ukrainian Job
		"watchdogs_1", --Watchdogs Day 1
		"watchdogs_1_night", --Watchdogs Day 1 Night
		--Custom Heists--
		"firestarter_1_res", --Firestarter Day 1 res edit version
		"alex_1_res", --Rats Day 1 res edit version
		"ukrainian_job_res", --Ukrainian Job res edit version
	}		
	restoration.captain_teamwork = {
		"pal", --counterfeit 
		"crojob2", --bomb dockyard
		"firestarter_3", --firestarter day 3
		"jolly", --aftershock
		"rvd1", --highland mortuary 
		"watchdogs_2", --watch dogs 2
		"jolly_CD", --jolly crackdown edit
		--custom heists		
		"office_strike", --office strike
		"firestarter_3_res" --firestarter day 3 res edit version
	}
	restoration.captain_murderdozer = {
		"firestarter_2", --firestarter day 2
		"framing_frame_3", --framing frame day 3
		"rat",	--cook off
		"arm_for",	--train heist
		"mus",	--the diamond
		"big", --big bank
		--custom heists		
		"firestarter_2_res" --firestarter day 2 res edit version
	}
	restoration.captain_stelf = {
		"nightclub", --and Autumn stay off the dance floor
		"gallery", --art gallery
		"framing_frame_1", --art gallery but ff
		"branchbank", --well the trees are orange
		"dah", --diamond heist
		"four_stores", --do i really need to make a comment here?
		"family", --diamond store
		--custom heists
		"wetwork", --res map package wetworks
		"lvl_fourmorestores", --four more stores
		"hntn" --harvest and trustee north
	}
	restoration.tiny_levels = {
		"welcome_to_the_jungle_2",
		"election_day_2",
		"peta",
		"rvd2",
		"brb",
		"skm_mus",
		"skm_red2",
		"skm_run",
		"skm_watchdogs_stage2",
		"bph",
		"glace",
		"man",
		"pbr",
		"pbr2",
		"dinner",
		"wwh",
		"born",
		"cane",
		"dah",
		"run",
		"help",
		"arm_cro",
		"arm_hcm",
		"arm_fac",
		"arm_par",
		"arm_und",
		"arm_for",
		"arena",
		--Custom Heists below--
		"Victor Romeo",
		"junk",
		"wetwork_burn",
		"hardware_store",
		"skmc_mad", --rex's holdout maps
		"skmc_fish",
		"skmc_ovengrill",
		"spa_CD",		
		"wwh_CD",		
		"street" --whurr's hs edit
	}
	--Mostly for stuff like Cursed Killed Room and other crap heists
	restoration.very_tiny_levels = {
		"hvh",
		"chew",
		"sah",
		"hox_1",		
		"nail",		
		"nmh",		
		"peta2",
		"des",		
		"vit",
		"spa",		
		"chill_combat",		
		"flat",	
		"mex",
		"mex_cooking",		
		"mia_2"
	}		

	_G.SC = _G.SC or {}
	SC._path = self.ModPath
	SC._data = {}

	if SystemFS:exists("mods/DMCWO/mod.txt") then
		SC._data.sc_player_weapon_toggle = false
	else
		SC._data.sc_player_weapon_toggle = true
	end

	if not restoration.Options:GetValue("SC/SC") then
		SC._data.sc_player_weapon_toggle = false
	end
end

function restoration:all_enabled(...)
	for _, opt in pairs({...}) do
		if self.Options:GetValue(opt) == false then
			return false
		end
	end
	return true
end

function restoration.log_shit(to_log)
	if restoration.we_log then
		log(to_log)
	end
end

function restoration:LoadSCAssets()
	if restoration and restoration.Options:GetValue("SC/SC") then
		return true
	end
end

restoration.assault_style = {
	"beta_assault",
	"alpha_assault"
}

restoration.environments_choice_bank = {
	"default",
	"random",
	"mellowday",
	"xbox_bank",
	"bank_day",
	"env_trailer_bank"
}

restoration.environments_choice_bank = {
	"default",
	"random",
	"mellowday",
	"xbox_bank",
	"bank_day",
	"env_trailer_bank"
}

restoration.environments_choice_rvd1 = {
	"default",
	"random",
	"rvd1_alt1",
	"rvd1_alt2"
}

restoration.environments_choice_rvd2 = {
	"default",
	"random",
	"rvd2_alt"
}

restoration.environments_choice_firestarter_1 = {
	"default",
	"random",
	"fsd1_eve"
}

restoration.environments_choice_pbr2 = {
	"default",
	"random",
	"bos_alt"
}

restoration.environments_choice_crojob2 = {
	"default",
	"random",
	"dockyard_alt"
}

restoration.environments_choice_arm_und = {
	"default",
	"random",
	"underpass_foggyday"
}

restoration.environments_choice_mallcrasher = {
	"default",
	"random",
	"mall_alt"
}

restoration.environments_choice_mia_1 = {
	"default",
	"random",
	"hlm_morn",
	"funny_and_epic_synthwave_very_eighties"
}

restoration.environments_choice_firestarter_3 = {
	"default",
	"env_trailer_bank"
}

restoration.environments_choice_watchdogs_1_night = {
	"default",
	"brightnight"
}

restoration.environments_choice_watchdogs_2_day = {
	"default",
	"random",
	"docks"
}

restoration.environments_choice_alex_3 = {
	"default",
	"random",
	"docks"
}

restoration.environments_choice_big = {
	"default",
	"random",
	"xbox_bank"
}

restoration.environments_choice_four_stores = {
	"default",
	"random",
	"mellowday",
	"xbox_bank",
	"bank_day",
	"bank_green"
}

restoration.environments_choice_ukrainian_job = {
	"default",
	"cloudy_day"
}

-- These tables show the network messages we've modified in the network settings pdmod
-- We will use them for switching to RestorationMod prefixed messages when in SC Mode.
local connection_network_handler_funcs = {
	'sync_player_installed_mod'
}

local unit_network_handler_funcs = {
	'sync_grenades'
}

--[[ local unit_network_handler_funcs = {
	'set_unit',
	'remove_corpse_by_id',
	'mission_ended',
	'from_server_sentry_gun_place_result',
	'sync_equipment_setup',
	'sync_ammo_bag_setup',
	'on_sole_criminal_respawned',
	'sync_grenades',
	'sync_carry_data',
	'sync_throw_projectile',
	'sync_attach_projectile',
	'sync_unlock_asset',
	'sync_equipment_possession',
	'sync_remove_equipment_possession',
	'mark_minion',
	'suspicion',
	'server_secure_loot',
	'sync_secure_loot'
} ]]

-- Builds a single table from our two string based keys for each handler above
restoration.network_handler_funcs = {}
function restoration:add_handler_funcs(handler_funcs)
	for i = 1, #handler_funcs do
		self.network_handler_funcs[handler_funcs[i]] = true
	end
end

restoration:add_handler_funcs(connection_network_handler_funcs)
restoration:add_handler_funcs(unit_network_handler_funcs)


-- Takes the network keys we defined above and prefixes any matches on the given handler
function restoration:rename_handler_funcs(NetworkHandler)
	for key, value in pairs(restoration.network_handler_funcs) do
		if NetworkHandler[key] then
			NetworkHandler['RestorationMod__' .. key] = NetworkHandler[key]
		end
	end
end
