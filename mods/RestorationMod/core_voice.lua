if not _G.restorationvoice then
	_G.restorationvoice = {}
	_G.restorationvoice.ModPath = ModPath
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