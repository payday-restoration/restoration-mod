if not ModCore then
	RestorationCore.log_shit("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end
RestorationCore = RestorationCore or class(ModCore)

function RestorationCore:init()
	self.super.init(self, ModPath .. "config.xml", true, true)

	
	self:post_init({"Options"})
end

function RestorationCore:all_enabled(...)
	for _, opt in pairs({...}) do
		if self.Options:GetValue(opt) == false then
			return false
		end
	end
	return true
end

function RestorationCore.log_shit(to_log)
	if _G.restoration.we_log then
		log(to_log)
	end
end

function RestorationCore:LoadSCAssets()
	if restoration and restoration.Options:GetValue("SC/SC") then
		return true
	end
end

RestorationCore.assault_style = {
	"beta_assault",
	"alpha_assault"
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
RestorationCore.network_handler_funcs = {}
function add_handler_funcs(handler_funcs)
	for i = 1, #handler_funcs do
		RestorationCore.network_handler_funcs[handler_funcs[i]] = true
	end
end

add_handler_funcs(connection_network_handler_funcs)
add_handler_funcs(unit_network_handler_funcs)


-- Takes the network keys we defined above and prefixes any matches on the given handler
function RestorationCore:rename_handler_funcs(NetworkHandler)
	for key, value in pairs(RestorationCore.network_handler_funcs) do
		if NetworkHandler[key] then
			NetworkHandler['RestorationMod__' .. key] = NetworkHandler[key]
		end
	end
end

if not _G.restoration then
	local success, err = pcall(function() _G.restoration = RestorationCore:new() end)
	if not success then
		RestorationCore.log_shit("[ERROR] Something bad happened with Restoration. " .. tostring(err))
	end
	RestorationCore.log_shit("SC: FUCKING LOADING: " .. ModPath)
	_G.restoration.ModPath = ModPath
	_G.restoration.disable_captain_camper = {
		"pbr2",
		"born",
		"nail",
		"peta",
		"skm_mus",
		"skm_red2",
		"skm_run",
		"skm_watchdogs_stage2",
		"crojob2",
		"mus",
		"big",
		"wwh",
		"pines",
		"hox_3",
		--custom heists
		"hardware_store", --hes fucking awful on this heist pdc why did you think it was ok
		"office_strike",
		"spa_CD",		
		"skmc_mad", --rex's holdout maps
		"skmc_fish",
		"skmc_ovengrill",
		"firestarter_2_res" --firestarter day 2 res edit version
	}
	_G.restoration.captain_teamwork = {
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
	_G.restoration.captain_murderdozer = {
		"firestarter_2", --firestarter day 2
		"framing_frame_3", --framing frame day 3
		"rat",	--cook off
		"arm_for",	--train heist
		"mus",	--the diamond
		"big", --big bank
		--custom heists		
		"firestarter_2_res" --firestarter day 2 res edit version
	}
	_G.restoration.captain_stelf = {
		"nightclub", --and Autumn stay off the dance floor
		"gallery", --art gallery
		"branchbank", --well the trees are orange
		"dah", --diamond heist
		"four_stores", --do i really need to make a comment here?
		"family", --diamond store
		--custom heists
		"wetwork", --res map package wetworks
		"lvl_fourmorestores", --four more stores
		"hntn" --harvest and trustee north
	}
	_G.restoration.tiny_levels = {
		"hvh",
		"chew",
		"peta",
		"peta2",
		"nail",
		"rvd2",
		"mia_2",
		"hox_1",
		"spa",
		"chill_combat",
		"des",
		"sah",
		"skm_mus",
		"skm_red2",
		"skm_run",
		"skm_watchdogs_stage2",
		"bph",
		"nmh",
		"flat",
		"glace",
		"man",
		"vit",
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
	--Meant to be used for heists that use custom suits, since armor clips really badly with them
	_G.restoration.custom_suit_heists = {
		"glace", --Green Bridge
		"dah", --Diamond Heist
		"wwh", --Alaskan Deal
		"sah", --Shacklethrorne Heist
		"bph", --Hell's Island
		"vit", --White House
		"dinner", --Slaughterhouse
		"man", --Undercover
		"mad" --Boiling Point
	}	
end

_G.SC = _G.SC or {}
SC._path = ModPath
SC._data = {}

if SystemFS:exists("mods/DMCWO/mod.txt") then
	SC._data.sc_player_weapon_toggle = false
else
	SC._data.sc_player_weapon_toggle = true
end

if not restoration.Options:GetValue("SC/SC") then
	SC._data.sc_player_weapon_toggle = false
end
