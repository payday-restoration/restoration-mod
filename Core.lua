if not ModCore then
	restoration.log_shit("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end
restoration._mod_path = restoration:GetPath()
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
		"firestarter_2", --firestarter day 2
		"four_stores", --Gee, I wonder what this could be.
		"dinner", --Slaughterhouse
		"moon", --Stealing Xmas
		"mus",	--the diamond
		--Custom Heists--
		"office_strike", --office strike
		"firestarter_2_res" --firestarter day 2 res edit version
	}
	restoration.captain_teamwork = {
		"pal", --counterfeit
		"mia_1", --Hotline Day 1
		"crojob2", --bomb dockyard
		"firestarter_3", --firestarter day 3
		"jolly", --aftershock
		"rvd1", --highland mortuary 
		"watchdogs_2", --watch dogs 2
		"watchdogs_2_day", --Watchdogs Day 2 Daytime
		"jolly_CD", --jolly crackdown edit
		--custom heists		
		"firestarter_3_res" --firestarter day 3 res edit version
	}
	restoration.captain_murderdozer = {
		"dah", --diamond heist
		"hox_2", --Hoxout Day 2
		"framing_frame_3", --framing frame day 3
		"firestarter_1", --firestarter day 1
		"arm_for",	--train heist
		"big", --big bank
		"kenaz",--Golden Grin Casino
		"cas", --Golden Grin Casino
		--custom heists		
		"firestarter_1_res" --firestarter day 1 res edit version
	}
	restoration.captain_stelf = {
		"alex_1", --Rats Day 1
		"rat",	--cook off
		"nightclub", --and Autumn stay off the dance floor
		"branchbank", --well the trees are orange
		"family", --diamond store
		"framing_frame_1", --art gallery but ff
		"gallery", --art gallery
		"jewelry_store", --Jewelry Store
		"ukrainian_job", --Ukrainian Job
		"framing_frame_2", --Powerbox simulator
		--custom heists
		"wetwork", --res map package wetworks
		"alex_1_res", --Rats Day 1 res edit version
		"lvl_fourmorestores", --four more stores
		"ukrainian_job_res", --Ukrainian Job res edit version
		"hntn" --harvest and trustee north
	}
	--[[restoration.captain_viper = {
		"jackal_zero_day_stage7" --Zero Day 7
	}]]--
	restoration.tiny_levels = {
		"welcome_to_the_jungle_2",
		"election_day_2",
		"peta",
		"brb",
		"mus",
		"hox_1",
		"skm_mus",
		"skm_red2",
		"skm_run",
		"skm_watchdogs_stage2",
		"bph",
		"glace",
		"man",
		"pbr",
		"dinner",
		"wwh",
		"born",
		"dah",
		"run",
		"arm_cro",
		"arm_hcm",
		"arm_fac",
		"arm_par",
		"arm_und",
		"arm_for",
		"shoutout_raid", --Scripted spawns out the ass, doing this just to even it out
		--Custom Heists below--
		"junk",
		"wetwork_burn",
		"hardware_store",
		"skmc_mad", --rex's holdout maps
		"skmc_fish",
		"skmc_ovengrill",
		"spa_CD",		
		"wwh_CD",		
		"street"		--whurr's hs edit
	}
	--Mostly for stuff like Cursed Killed Room and other crap heists
	restoration.very_tiny_levels = {
		"hvh",
		"chew",
		"sah",		
		"nail",		
		"nmh",		
		"arena",		
		"help",		
		"cane",		
		"pbr2",		
		"rvd2",		
		"peta2",
		"des",		
		"vit",
		"spa",		
		"chill_combat",		
		"flat",	
		"mex",
		"mex_cooking",		
		"mia_2",
		--Custom Heists below--
		"Victor Romeo",
		"thechase"
	}	
	--For custom heists that seem to be broken with our normal spawn setup
	restoration.bad_spawn_heists = {
		"help",
		--Custom Heists--
		"Victor Romeo",
		"hardware_store",
		"hntn",
		"bookmakers_office",
		"thechase",
		"santa_pain"
	}	
	--Christmas Effects Heists
	restoration.christmas_heists = {
		"roberts",
		"pines",
		"cane",
		"moon",
		--Custom Heists--
		"roberts_v2",
		"santa_pain"
	}	
	
	restoration.Environment_Settings_Table = {} --leave blank, it will generate contents based on the table below
	
	local environment_settings = { --edit this one
		["OTHER/Env_Banks"] = true,
		["OTHER/Env_RVD1"] = true,
		["OTHER/Env_RVD2"] = true,
		["OTHER/Env_FSD1"] = true,
		["OTHER/Env_PBR2"] = true,
		["OTHER/Env_CJ2"] = true,
		["OTHER/Env_UnderPass"] = true,
		["OTHER/Env_MallCrasher"] = true,
		["OTHER/Env_Mia_1"] = true,
		["OTHER/Env_FSD3"] = true,
		["OTHER/Env_WDD1N"] = true,
		["OTHER/Env_WDD2D"] = true,
		["OTHER/Env_Alex3"] = true,
		["OTHER/Env_Big"] = true,
		["OTHER/Env_FS"] = true,
		["OTHER/Env_Ukra"] = true
		-- ["OTHER/Env_Kosugi"] = true
	}
	for name,enabled in pairs(environment_settings) do 
		if enabled then 
			restoration.Environment_Settings_Table[name] = restoration.Options:GetValue(name)
		end
	end

	_G.SC = _G.SC or {}
	SC._path = self.ModPath
	SC._data = {}

	if SystemFS:exists("mods/DMCWO/mod.txt") then
		SC._data.sc_player_weapon_toggle = false
	else
		SC._data.sc_player_weapon_toggle = true
	end

	local C = blt_class()
	VoicelineFramework = C
	VoicelineFramework.BufferedSounds = {}

	function C:register_unit(unit_name)
		--log("VF: Registering Unit, " .. unit_name)
		if _G.voiceline_framework then
			_G.voiceline_framework.BufferedSounds[unit_name] = {}
		end
	end

	function C:register_line_type(unit_name, line_type)
		if _G.voiceline_framework then
			if _G.voiceline_framework.BufferedSounds[unit_name] then
				--log("VF: Registering Type, " .. line_type .. " for Unit " .. unit_name)
				local fuck = _G.voiceline_framework.BufferedSounds[unit_name]
				fuck[line_type] = {}
			end
		end
	end

	function C:register_voiceline(unit_name, line_type, path)
		if _G.voiceline_framework then
			if _G.voiceline_framework.BufferedSounds[unit_name] then
				local fuck = _G.voiceline_framework.BufferedSounds[unit_name]
				if fuck[line_type] then
					--log("VF: Registering Path, " .. path .. " for Unit " .. unit_name)
					table.insert(fuck[line_type], XAudio.Buffer:new(path))
				end
			end
		end
	end

	if not _G.voiceline_framework then
		blt.xaudio.setup()
		_G.voiceline_framework = VoicelineFramework:new()
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
	return true
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

-- restoration.environments_choice_shadow_raid = {
-- 	"default",
-- 	"random",
-- 	"shadowraiud_darker",
-- 	"shadowraid_day"
-- }

-- These tables show the network messages we've modified in the network settings pdmod
-- We will use them for switching to RestorationMod prefixed messages when in SC Mode.
-- local connection_network_handler_funcs = {
	-- 'sync_player_installed_mod'
--}

-- local unit_network_handler_funcs = {
	-- 'sync_grenades',
	-- 'place_grenade_crate'
--}

-- Builds a single table from our two string based keys for each handler above
-- restoration.network_handler_funcs = {}
-- function restoration:add_handler_funcs(handler_funcs)
-- 	for i = 1, #handler_funcs do
-- 		self.network_handler_funcs[handler_funcs[i]] = true
-- 	end
-- end

-- restoration:add_handler_funcs(connection_network_handler_funcs)
-- restoration:add_handler_funcs(unit_network_handler_funcs)


-- Takes the network keys we defined above and prefixes any matches on the given handler
-- function restoration:rename_handler_funcs(NetworkHandler)
-- 	for key, value in pairs(restoration.network_handler_funcs) do
-- 		if NetworkHandler[key] then
-- 			NetworkHandler['RestorationMod__' .. key] = NetworkHandler[key]
-- 		end
-- 	end
-- end

Hooks:Register("restoration_on_synced_peer")
Hooks:Add("restoration_on_synced_peer","restoration_do_sync_peer_stuff",function(peer,peer_id)
	restoration:send_sync_environment(peer,peer_id)
end)

function restoration:get_env_setting(name)
	local value = restoration.Environment_Settings_Table[name]
	if value ~= nil then 
		return value
	end
	return restoration.Options:GetValue(name)
end

function restoration:send_sync_environment(to)
	if Network:is_server() then 
		local env_data = restoration.Environment_Settings_Table
		local env_string = env_data and LuaNetworking:TableToString(env_data)
		if env_string and env_string ~= "" then 
			if to and managers.network:session():peer(to) then 
				LuaNetworking:SendToPeer(to,"environments_all",env_string)
			else
				LuaNetworking:SendToPeers("environments_all",env_string)
			end
			log("**********************************************************Sent EnvironmentSync with results: ")
			PrintTable(env_data)
			log("**********************************************************End")
		end
	end
end