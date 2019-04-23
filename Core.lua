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

RestorationCore.assault_style = {
	"beta_assault",
	"alpha_assault"
}

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
		"pines"
	}
	_G.restoration.captain_teamwork = {
		"pal", --counterfeit 
		"welcome_to_the_jungle_2", --big oil day 2
		"crojob2", --bomb dockyard
		"firestarter_3", --firestarter day 3
		"jolly", --aftershock
		"rvd1" --highland mortuary 
	}
	_G.restoration.captain_murderdozer = {
		"firestarter_2", --firestarter day 2
		"framing_frame_3", --framing frame day 3
		"alex_2", --rats day 2
		"rat",	--cook off
		"arm_for",	--train heist
		"mus",	--the diamond
		"big" --big bank
	}
	_G.restoration.captain_stelf = {
		--[["nightclub", --and Autumn stay off the dance floor
		"gallery", --art gallery
		"branchbank", --well the trees are orange
		"dah", --diamond heist
		"four_stores", --do i really need to make a comment here?
		"pal", --counterfeit probably gonna swap him for summers
		"family" --diamond store]]--
	}
	_G.restoration.tiny_levels = {
		"hvh",
		"chew",
		"peta2",
		"nail",
		"rvd1",
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
		"vit",
		"pbr",
		"pbr2",
		"junk",
		"dinner",
		"wwh",
		"born",
		"cane",
		"dah",
		"run",
		--Custom Heists below--
		"Victor Romeo",
		"hardware_store"
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
