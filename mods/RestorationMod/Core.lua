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
		"big"
	}
	_G.restoration.captain_teamwork = {
		"nightclub",
		"welcome_to_the_jungle_2",
		"gallery",
		"man",
		"firestarter_3",
		"mad",
		"jolly",
		"rvd1"
	}
	_G.restoration.captain_murderdozer = {
		"pal",
		"firestarter_2",
		"framing_frame_3",
		"four_stores",
		"alex_2",
		"rat",	
		"flat",
		"big"
	}
	_G.restoration.captain_stelf = {
		"branchbank"
	}
	_G.restoration.tiny_levels = {
		"hvh",
		"chew",
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
		"vit"
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
