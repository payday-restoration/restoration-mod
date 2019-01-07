if not _G.restorationvoice then
	_G.restorationvoice = {}
	_G.restorationvoice.ModPath = ModPath
	blt.xaudio.setup()
        log("DOING FRAMEWORK SETUP")
	if _G.voiceline_framework then
		_G.voiceline_framework:register_unit("grenadier")
		_G.voiceline_framework:register_unit("olpf")
		_G.voiceline_framework:register_unit("tdozer")
		_G.voiceline_framework:register_unit("tspook")
		_G.voiceline_framework:register_unit("pdth")
		_G.voiceline_framework:register_unit("autumn")
		_G.voiceline_framework:register_unit("skeleton")
		_G.voiceline_framework:register_line_type("grenadier", "death")
		_G.voiceline_framework:register_line_type("grenadier", "spawn")
		_G.voiceline_framework:register_line_type("grenadier", "contact")
		_G.voiceline_framework:register_line_type("grenadier", "use_gas")	
		_G.voiceline_framework:register_line_type("olpf", "contact")	
		_G.voiceline_framework:register_line_type("olpf", "death")
		_G.voiceline_framework:register_line_type("olpf", "gogo")
		_G.voiceline_framework:register_line_type("olpf", "heal")
		_G.voiceline_framework:register_line_type("olpf", "pain")
		_G.voiceline_framework:register_line_type("olpf", "spawn")
		_G.voiceline_framework:register_line_type("autumn", "contact")	
		_G.voiceline_framework:register_line_type("autumn", "death")
		_G.voiceline_framework:register_line_type("autumn", "gogo")
		_G.voiceline_framework:register_line_type("autumn", "kill")
		_G.voiceline_framework:register_line_type("tdozer", "spawn")
		_G.voiceline_framework:register_line_type("tdozer", "gogo")	
		_G.voiceline_framework:register_line_type("tdozer", "contact")	
		_G.voiceline_framework:register_line_type("tdozer", "death")	
		_G.voiceline_framework:register_line_type("tspook", "death")	
		_G.voiceline_framework:register_line_type("tspook", "kill")	
		_G.voiceline_framework:register_line_type("pdth", "buddy_died")
		_G.voiceline_framework:register_line_type("pdth", "contact")
		_G.voiceline_framework:register_line_type("pdth", "cover_me")
		_G.voiceline_framework:register_line_type("pdth", "death")
		_G.voiceline_framework:register_line_type("pdth", "gogo")
		_G.voiceline_framework:register_line_type("pdth", "pain")
		_G.voiceline_framework:register_line_type("pdth", "ready")
		_G.voiceline_framework:register_line_type("pdth", "hostage")
		_G.voiceline_framework:register_line_type("pdth", "rescue_civ")
		_G.voiceline_framework:register_line_type("pdth", "retreat")
		_G.voiceline_framework:register_line_type("pdth", "clear")
		_G.voiceline_framework:register_line_type("pdth", "surrender")
		_G.voiceline_framework:register_line_type("skeleton", "buddy_died")
		_G.voiceline_framework:register_line_type("skeleton", "contact")
		_G.voiceline_framework:register_line_type("skeleton", "death")
		_G.voiceline_framework:register_line_type("skeleton", "gogo")
		_G.voiceline_framework:register_line_type("skeleton", "radio")
		
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
	   
	   -- OLPF
		
		for i = 1, 11 do
			_G.voiceline_framework:register_voiceline("olpf", "contact", ModPath .. "assets/oggs/voiceover/olpf/contact/contact" .. i .. ".ogg")
		end		
		for i = 1, 8 do
			_G.voiceline_framework:register_voiceline("olpf", "death", ModPath .. "assets/oggs/voiceover/olpf/death/death" .. i .. ".ogg")
		end		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("olpf", "gogo", ModPath .. "assets/oggs/voiceover/olpf/gogo/gogo" .. i .. ".ogg")
		end		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("olpf", "heal", ModPath .. "assets/oggs/voiceover/olpf/heal/heal" .. i .. ".ogg")
		end		
		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("olpf", "pain", ModPath .. "assets/oggs/voiceover/olpf/pain/pain" .. i .. ".ogg")
		end		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("olpf", "spawn", ModPath .. "assets/oggs/voiceover/olpf/spawn/spawn" .. i .. ".ogg")
		end			  

		-- Autumn
		
		for i = 1, 11 do
			_G.voiceline_framework:register_voiceline("autumn", "contact", ModPath .. "assets/oggs/voiceover/autumn/contact/contact" .. i .. ".ogg")
		end		
		for i = 1, 19 do
			_G.voiceline_framework:register_voiceline("autumn", "death", ModPath .. "assets/oggs/voiceover/autumn/death/death" .. i .. ".ogg")
		end		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("autumn", "gogo", ModPath .. "assets/oggs/voiceover/autumn/gogo/gogo" .. i .. ".ogg")
		end		
		for i = 1, 10 do
			_G.voiceline_framework:register_voiceline("autumn", "kill", ModPath .. "assets/oggs/voiceover/autumn/kill/kill" .. i .. ".ogg")
		end		
		
		--Titan Cosmonaut
		
		for i = 1, 28 do
			_G.voiceline_framework:register_voiceline("tdozer", "contact", ModPath .. "assets/oggs/voiceover/tdozer/contact/contact" .. i .. ".ogg")
		end		
		for i = 1, 10 do
			_G.voiceline_framework:register_voiceline("tdozer", "gogo", ModPath .. "assets/oggs/voiceover/tdozer/gogo/gogo" .. i .. ".ogg")
		end		
		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("tdozer", "spawn", ModPath .. "assets/oggs/voiceover/tdozer/spawn/spawn" .. i .. ".ogg")
		end	
		for i = 1, 19 do
			_G.voiceline_framework:register_voiceline("tdozer", "death", ModPath .. "assets/oggs/voiceover/pdth/death/death" .. i .. ".ogg")
		end	
		
		--tspook temp lines
		
		for i = 1, 40 do
			_G.voiceline_framework:register_voiceline("tspook", "kill", ModPath .. "assets/oggs/voiceover/tspook/kill/kill" .. i .. ".ogg")
		end		
		for i = 1, 14 do
			_G.voiceline_framework:register_voiceline("tspook", "death", ModPath .. "assets/oggs/voiceover/tspook/death/death" .. i .. ".ogg")
		end		
		
		--SkeleSWAT
		
		for i = 1, 26 do
			_G.voiceline_framework:register_voiceline("skeleton", "buddy_died", ModPath .. "assets/oggs/voiceover/skeleton/buddy_died/buddy_died" .. i .. ".ogg")
		end		
		for i = 1, 18 do
			_G.voiceline_framework:register_voiceline("skeleton", "contact", ModPath .. "assets/oggs/voiceover/skeleton/contact/contact" .. i .. ".ogg")
		end		
		for i = 1, 20 do
			_G.voiceline_framework:register_voiceline("skeleton", "death", ModPath .. "assets/oggs/voiceover/skeleton/death/death" .. i .. ".ogg")
		end		
		for i = 1, 17 do
			_G.voiceline_framework:register_voiceline("skeleton", "gogo", ModPath .. "assets/oggs/voiceover/skeleton/gogo/gogo" .. i .. ".ogg")
		end		
		for i = 1, 36 do
			_G.voiceline_framework:register_voiceline("skeleton", "radio", ModPath .. "assets/oggs/voiceover/skeleton/radio/radio" .. i .. ".ogg")
		end
				
		--PDTH (Titan SWAT)
		
		--OH SHIIIIIIIIIIIT
		for i = 1, 19 do
			_G.voiceline_framework:register_voiceline("pdth", "buddy_died", ModPath .. "assets/oggs/voiceover/pdth/buddy_died/buddy_died" .. i .. ".ogg")
		end
        --DOUBLE TAP TRIPLE TAP JUST KEEP TAPPING
		for i = 1, 49 do
			_G.voiceline_framework:register_voiceline("pdth", "contact", ModPath .. "assets/oggs/voiceover/pdth/contact/contact" .. i .. ".ogg")
		end
		--GLORORIUS PDTH DEATH SOUND
		for i = 1, 19 do
			_G.voiceline_framework:register_voiceline("pdth", "death", ModPath .. "assets/oggs/voiceover/pdth/death/death" .. i .. ".ogg")
		end
        --LETS GOOOOOOO
		for i = 1, 29 do
			_G.voiceline_framework:register_voiceline("pdth", "gogo", ModPath .. "assets/oggs/voiceover/pdth/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("pdth", "pain", ModPath .. "assets/oggs/voiceover/pdth/pain/pain" .. i .. ".ogg")
		end

		for i = 1, 31 do
			_G.voiceline_framework:register_voiceline("pdth", "ready", ModPath .. "assets/oggs/voiceover/pdth/ready/ready" .. i .. ".ogg")
		end
		
		for i = 1, 17 do
			_G.voiceline_framework:register_voiceline("pdth", "rescue_civ", ModPath .. "assets/oggs/voiceover/pdth/rescue_civ/rescue_civ" .. i .. ".ogg")
		end
		
		for i = 1, 21 do
			_G.voiceline_framework:register_voiceline("pdth", "retreat", ModPath .. "assets/oggs/voiceover/pdth/retreat/retreat" .. i .. ".ogg")
		end
		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("pdth", "hostage", ModPath .. "assets/oggs/voiceover/pdth/hostage/hostage" .. i .. ".ogg")
		end	
		
		for i = 1, 17 do
			_G.voiceline_framework:register_voiceline("pdth", "clear", ModPath .. "assets/oggs/voiceover/pdth/clear/clear" .. i .. ".ogg")
		end		
		
		for i = 1, 17 do
			_G.voiceline_framework:register_voiceline("pdth", "surrender", ModPath .. "assets/oggs/voiceover/pdth/surrender/surrender" .. i .. ".ogg")
		end
	else	
		log("NO FRAMEWORK!!!")
	end
end