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
		"peta"
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
		"branchbank",
		"pal",
		"firestarter_2",
		"framing_frame_3",
		"four_stores",
		"alex_2",
		"rat",	
		"flat"
	}
	_G.restoration.tiny_levels = {
		"hvh",
		"chew",
		"peta2",
		"nail",
		"rvd2",
		"mia_2",
		"spa",
		"chill_combat",
		"des"
	}
	blt.xaudio.setup()
	log("DOING FRAMEWORK SETUP")
	if _G.voiceline_framework then
		_G.voiceline_framework:register_unit("grenadier")
		_G.voiceline_framework:register_line_type("grenadier", "death")
		_G.voiceline_framework:register_line_type("grenadier", "spawn")
		_G.voiceline_framework:register_line_type("grenadier", "contact")
		_G.voiceline_framework:register_line_type("grenadier", "use_gas")
		
		_G.voiceline_framework:register_voiceline("grenadier", "death", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_death1.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "death", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_death2.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "death", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_death3.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "death", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_death4.ogg")
		
		_G.voiceline_framework:register_voiceline("grenadier", "spawn", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_spawn1.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "spawn", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_spawn2.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "spawn", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_spawn3.ogg")
		
		_G.voiceline_framework:register_voiceline("grenadier", "contact", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_contact1.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "contact", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_contact2.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "contact", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_contact3.ogg")
		
		_G.voiceline_framework:register_voiceline("grenadier", "use_gas", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_gas_1.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "use_gas", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_gas_2.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "use_gas", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_gas_3.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "use_gas", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_gas_4.ogg")
		
		_G.voiceline_framework:register_unit("medicdozer")
		_G.voiceline_framework:register_line_type("medicdozer", "heal")
		for i = 1, 31 do
			_G.voiceline_framework:register_voiceline("medicdozer", "heal", ModPath .. "assets/oggs/voiceover/medicdozer/heal" .. i .. ".ogg")
		end
	else
		log("NO FRAMEWORK!!!")
	end
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
