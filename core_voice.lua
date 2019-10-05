if not _G.restorationvoice then
	_G.restorationvoice = {}
	_G.restorationvoice.ModPath = ModPath
	blt.xaudio.setup()
        log("DOING FRAMEWORK SETUP")
	if _G.voiceline_framework then
		_G.voiceline_framework:register_unit("grenadier")
		_G.voiceline_framework:register_unit("olpf")
		_G.voiceline_framework:register_unit("tdozer")
		_G.voiceline_framework:register_unit("tdozer_ru")
		_G.voiceline_framework:register_unit("tspook")
		_G.voiceline_framework:register_unit("pdth")
		_G.voiceline_framework:register_unit("tswat_ru")
		_G.voiceline_framework:register_unit("autumn")
		_G.voiceline_framework:register_unit("skeleton")
		_G.voiceline_framework:register_unit("bruce")
		_G.voiceline_framework:register_unit("tsniper")
		_G.voiceline_framework:register_unit("bravo")
		--hive man
		_G.voiceline_framework:register_line_type("grenadier", "death")
		_G.voiceline_framework:register_line_type("grenadier", "spawn")
		_G.voiceline_framework:register_line_type("grenadier", "contact")
		_G.voiceline_framework:register_line_type("grenadier", "use_gas")	
		_G.voiceline_framework:register_line_type("grenadier", "pain")	
		--olpf
		_G.voiceline_framework:register_line_type("olpf", "contact")	
		_G.voiceline_framework:register_line_type("olpf", "death")
		_G.voiceline_framework:register_line_type("olpf", "gogo")
		_G.voiceline_framework:register_line_type("olpf", "heal")
		_G.voiceline_framework:register_line_type("olpf", "pain")
		_G.voiceline_framework:register_line_type("olpf", "spawn")
		_G.voiceline_framework:register_line_type("olpf", "kill")
	    --autumn
	    _G.voiceline_framework:register_line_type("autumn", "contact")	
		_G.voiceline_framework:register_line_type("autumn", "death")
		_G.voiceline_framework:register_line_type("autumn", "gogo")
		_G.voiceline_framework:register_line_type("autumn", "kill")
		--tdozer
		_G.voiceline_framework:register_line_type("tdozer", "spawn")
		_G.voiceline_framework:register_line_type("tdozer", "gogo")	
		_G.voiceline_framework:register_line_type("tdozer", "contact")	
		_G.voiceline_framework:register_line_type("tdozer", "death")	
		--russian tdozer
		_G.voiceline_framework:register_line_type("tdozer_ru", "spawn")
		_G.voiceline_framework:register_line_type("tdozer_ru", "gogo")	
		_G.voiceline_framework:register_line_type("tdozer_ru", "contact")	
		_G.voiceline_framework:register_line_type("tdozer_ru", "death")	
		--tspook
		_G.voiceline_framework:register_line_type("tspook", "death")	
		_G.voiceline_framework:register_line_type("tspook", "kill")	
		--tswat
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
		--bravo
		_G.voiceline_framework:register_line_type("bravo", "buddy_died")
		_G.voiceline_framework:register_line_type("bravo", "contact")
		_G.voiceline_framework:register_line_type("bravo", "death")
		_G.voiceline_framework:register_line_type("bravo", "gogo")
		_G.voiceline_framework:register_line_type("bravo", "pain")
		_G.voiceline_framework:register_line_type("bravo", "ready")
		_G.voiceline_framework:register_line_type("bravo", "clear")	
		_G.voiceline_framework:register_line_type("bravo", "kill")	
		--russian tswat
		_G.voiceline_framework:register_line_type("tswat_ru", "buddy_died")
		_G.voiceline_framework:register_line_type("tswat_ru", "contact")
		_G.voiceline_framework:register_line_type("tswat_ru", "death")
		_G.voiceline_framework:register_line_type("tswat_ru", "gogo")
		_G.voiceline_framework:register_line_type("tswat_ru", "ready")
		_G.voiceline_framework:register_line_type("tswat_ru", "hostage")
		_G.voiceline_framework:register_line_type("tswat_ru", "retreat")
		--sans undertale
		_G.voiceline_framework:register_line_type("skeleton", "buddy_died")
		_G.voiceline_framework:register_line_type("skeleton", "contact")
		_G.voiceline_framework:register_line_type("skeleton", "cover_me")
		_G.voiceline_framework:register_line_type("skeleton", "death")
		_G.voiceline_framework:register_line_type("skeleton", "gogo")
		_G.voiceline_framework:register_line_type("skeleton", "pain")
		_G.voiceline_framework:register_line_type("skeleton", "ready")
		_G.voiceline_framework:register_line_type("skeleton", "hostage")
		_G.voiceline_framework:register_line_type("skeleton", "rescue_civ")
		_G.voiceline_framework:register_line_type("skeleton", "retreat")
		_G.voiceline_framework:register_line_type("skeleton", "clear")
		--bruce willis (real)
		_G.voiceline_framework:register_line_type("bruce", "retreat")
		_G.voiceline_framework:register_line_type("bruce", "buddy_died")
		_G.voiceline_framework:register_line_type("bruce", "clear")
		_G.voiceline_framework:register_line_type("bruce", "contact")
		_G.voiceline_framework:register_line_type("bruce", "death")
		_G.voiceline_framework:register_line_type("bruce", "gogo")
		_G.voiceline_framework:register_line_type("bruce", "kill")
		_G.voiceline_framework:register_line_type("bruce", "pain")
		_G.voiceline_framework:register_line_type("bruce", "rescue_civ")
		_G.voiceline_framework:register_line_type("bruce", "spawn")
		_G.voiceline_framework:register_line_type("bruce", "retreat")
		--tsniper
		_G.voiceline_framework:register_line_type("tsniper", "clear")
		_G.voiceline_framework:register_line_type("tsniper", "contact")
		_G.voiceline_framework:register_line_type("tsniper", "death")
		_G.voiceline_framework:register_line_type("tsniper", "gogo")
		_G.voiceline_framework:register_line_type("tsniper", "pain")
		_G.voiceline_framework:register_line_type("tsniper", "spawn")
		_G.voiceline_framework:register_line_type("tsniper", "tasing")
		
		--Grenadier (thanks scruffy)
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
		
		_G.voiceline_framework:register_voiceline("grenadier", "pain", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_hurt1.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "pain", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_hurt2.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "pain", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_hurt3.ogg")
		_G.voiceline_framework:register_voiceline("grenadier", "pain", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_hurt4.ogg")	
		_G.voiceline_framework:register_voiceline("grenadier", "pain", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_hurt5.ogg")	
		_G.voiceline_framework:register_voiceline("grenadier", "pain", ModPath .. "assets/oggs/voiceover/grenadier/grenadier_hurt6.ogg")	
		
		--[[_G.voiceline_framework:register_unit("medicdozer")
		_G.voiceline_framework:register_line_type("medicdozer", "heal")
		for i = 1, 31 do
			_G.voiceline_framework:register_voiceline("medicdozer", "heal", ModPath .. "assets/oggs/voiceover/medicdozer/heal" .. i .. ".ogg")
		end]]--
	   
	   --LPF (thanks VxWolf)
		
		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("olpf", "contact", ModPath .. "assets/oggs/voiceover/olpf/contact/contact" .. i .. ".ogg")
		end		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("olpf", "death", ModPath .. "assets/oggs/voiceover/olpf/death/death" .. i .. ".ogg")
		end		
		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("olpf", "gogo", ModPath .. "assets/oggs/voiceover/olpf/gogo/gogo" .. i .. ".ogg")
		end		
		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("olpf", "heal", ModPath .. "assets/oggs/voiceover/olpf/heal/heal" .. i .. ".ogg")
		end		
		for i = 1, 8 do
			_G.voiceline_framework:register_voiceline("olpf", "pain", ModPath .. "assets/oggs/voiceover/olpf/pain/pain" .. i .. ".ogg")
		end		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("olpf", "spawn", ModPath .. "assets/oggs/voiceover/olpf/spawn/spawn" .. i .. ".ogg")
		end	
		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("olpf", "kill", ModPath .. "assets/oggs/voiceover/olpf/kill/kill" .. i .. ".ogg")
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
		
		--Laugh...and grow Fat!
		
		for i = 1, 9 do
			_G.voiceline_framework:register_voiceline("tdozer_ru", "contact", ModPath .. "assets/oggs/voiceover/tdozer_ru/contact/contact" .. i .. ".ogg")
		end		
		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("tdozer_ru", "gogo", ModPath .. "assets/oggs/voiceover/tdozer_ru/gogo/gogo" .. i .. ".ogg")
		end		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("tdozer_ru", "spawn", ModPath .. "assets/oggs/voiceover/tdozer_ru/spawn/spawn" .. i .. ".ogg")
		end	
		for i = 1, 3 do
			_G.voiceline_framework:register_voiceline("tdozer_ru", "death", ModPath .. "assets/oggs/voiceover/tdozer_ru/death/death" .. i .. ".ogg")
		end	
		
		--Tspook lines
		
		for i = 1, 39 do
			_G.voiceline_framework:register_voiceline("tspook", "kill", ModPath .. "assets/oggs/voiceover/tspook/kill/kill" .. i .. ".ogg")
		end		
		for i = 1, 14 do
			_G.voiceline_framework:register_voiceline("tspook", "death", ModPath .. "assets/oggs/voiceover/tspook/death/death" .. i .. ".ogg")
		end		
				
		--Russian Titan SWAT
		
		for i = 1, 3 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "buddy_died", ModPath .. "assets/oggs/voiceover/tswat_ru/buddy_died/buddy_died" .. i .. ".ogg")
		end
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "contact", ModPath .. "assets/oggs/voiceover/tswat_ru/contact/contact" .. i .. ".ogg")
		end
		for i = 1, 31 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "death", ModPath .. "assets/oggs/voiceover/tswat_ru/death/death" .. i .. ".ogg")
		end
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "gogo", ModPath .. "assets/oggs/voiceover/tswat_ru/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 4 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "ready", ModPath .. "assets/oggs/voiceover/tswat_ru/ready/ready" .. i .. ".ogg")
		end
		
		for i = 1, 2 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "retreat", ModPath .. "assets/oggs/voiceover/tswat_ru/retreat/retreat" .. i .. ".ogg")
		end
		
		for i = 1, 2 do
			_G.voiceline_framework:register_voiceline("tswat_ru", "hostage", ModPath .. "assets/oggs/voiceover/tswat_ru/hostage/hostage" .. i .. ".ogg")
		end	
				
		--spooky scary skeletons
		
		for i = 1, 10 do
			_G.voiceline_framework:register_voiceline("skeleton", "buddy_died", ModPath .. "assets/oggs/voiceover/skeleton/buddy_died/buddy_died" .. i .. ".ogg")
		end
		for i = 1, 24 do
			_G.voiceline_framework:register_voiceline("skeleton", "contact", ModPath .. "assets/oggs/voiceover/skeleton/contact/contact" .. i .. ".ogg")
		end
		for i = 1, 31 do
			_G.voiceline_framework:register_voiceline("skeleton", "death", ModPath .. "assets/oggs/voiceover/skeleton/death/death" .. i .. ".ogg")
		end
		for i = 1, 24 do
			_G.voiceline_framework:register_voiceline("skeleton", "gogo", ModPath .. "assets/oggs/voiceover/skeleton/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("skeleton", "pain", ModPath .. "assets/oggs/voiceover/skeleton/pain/pain" .. i .. ".ogg")
		end

		for i = 1, 18 do
			_G.voiceline_framework:register_voiceline("skeleton", "ready", ModPath .. "assets/oggs/voiceover/skeleton/ready/ready" .. i .. ".ogg")
		end
		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("skeleton", "rescue_civ", ModPath .. "assets/oggs/voiceover/skeleton/rescue_civ/rescue_civ" .. i .. ".ogg")
		end
		
		for i = 1, 14 do
			_G.voiceline_framework:register_voiceline("skeleton", "retreat", ModPath .. "assets/oggs/voiceover/skeleton/retreat/retreat" .. i .. ".ogg")
		end
		
		for i = 1, 1 do
			_G.voiceline_framework:register_voiceline("skeleton", "hostage", ModPath .. "assets/oggs/voiceover/skeleton/hostage/hostage" .. i .. ".ogg")
		end	
		
		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("skeleton", "clear", ModPath .. "assets/oggs/voiceover/skeleton/clear/clear" .. i .. ".ogg")
		end			
		
		--Vet Cop thanks JimTheCookie	

		for i = 1, 10 do
			_G.voiceline_framework:register_voiceline("bruce", "buddy_died", ModPath .. "assets/oggs/voiceover/bruce/buddy_died/buddy_died" .. i .. ".ogg")
		end		
		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("bruce", "retreat", ModPath .. "assets/oggs/voiceover/bruce/retreat/retreat" .. i .. ".ogg")
		end

		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("bruce", "contact", ModPath .. "assets/oggs/voiceover/bruce/contact/contact" .. i .. ".ogg")
		end

		for i = 1, 14 do
			_G.voiceline_framework:register_voiceline("bruce", "death", ModPath .. "assets/oggs/voiceover/bruce/death/death" .. i .. ".ogg")
		end

		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("bruce", "gogo", ModPath .. "assets/oggs/voiceover/bruce/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("bruce", "pain", ModPath .. "assets/oggs/voiceover/bruce/pain/pain" .. i .. ".ogg")
		end

		for i = 1, 9 do
			_G.voiceline_framework:register_voiceline("bruce", "kill", ModPath .. "assets/oggs/voiceover/bruce/kill/kill" .. i .. ".ogg")
		end
		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("bruce", "rescue_civ", ModPath .. "assets/oggs/voiceover/bruce/rescue_civ/rescue_civ" .. i .. ".ogg")
		end
		
		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("bruce", "spawn", ModPath .. "assets/oggs/voiceover/bruce/spawn/spawn" .. i .. ".ogg")
		end
		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("bruce", "clear", ModPath .. "assets/oggs/voiceover/bruce/clear/clear" .. i .. ".ogg")
		end			
		
		--PDTH (Titan SWAT)
		
		--OH SHIIIIIIIIIIIT
		for i = 1, 10 do
			_G.voiceline_framework:register_voiceline("pdth", "buddy_died", ModPath .. "assets/oggs/voiceover/pdth/buddy_died/buddy_died" .. i .. ".ogg")
		end
        --DOUBLE TAP TRIPLE TAP JUST KEEP TAPPING
		for i = 1, 24 do
			_G.voiceline_framework:register_voiceline("pdth", "contact", ModPath .. "assets/oggs/voiceover/pdth/contact/contact" .. i .. ".ogg")
		end
		--GLORORIUS PDTH DEATH SOUND
		for i = 1, 31 do
			_G.voiceline_framework:register_voiceline("pdth", "death", ModPath .. "assets/oggs/voiceover/pdth/death/death" .. i .. ".ogg")
		end
        --LETS GOOOOOOO
		for i = 1, 24 do
			_G.voiceline_framework:register_voiceline("pdth", "gogo", ModPath .. "assets/oggs/voiceover/pdth/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("pdth", "pain", ModPath .. "assets/oggs/voiceover/pdth/pain/pain" .. i .. ".ogg")
		end

		for i = 1, 18 do
			_G.voiceline_framework:register_voiceline("pdth", "ready", ModPath .. "assets/oggs/voiceover/pdth/ready/ready" .. i .. ".ogg")
		end
		
		for i = 1, 7 do
			_G.voiceline_framework:register_voiceline("pdth", "rescue_civ", ModPath .. "assets/oggs/voiceover/pdth/rescue_civ/rescue_civ" .. i .. ".ogg")
		end
		
		for i = 1, 14 do
			_G.voiceline_framework:register_voiceline("pdth", "retreat", ModPath .. "assets/oggs/voiceover/pdth/retreat/retreat" .. i .. ".ogg")
		end
		
		for i = 1, 1 do
			_G.voiceline_framework:register_voiceline("pdth", "hostage", ModPath .. "assets/oggs/voiceover/pdth/hostage/hostage" .. i .. ".ogg")
		end	
		
		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("pdth", "clear", ModPath .. "assets/oggs/voiceover/pdth/clear/clear" .. i .. ".ogg")
		end	
		
		--bravo
		
		for i = 1, 4 do
			_G.voiceline_framework:register_voiceline("bravo", "buddy_died", ModPath .. "assets/oggs/voiceover/bravo/buddy_died/buddy_died" .. i .. ".ogg")
		end

		for i = 1, 22 do
			_G.voiceline_framework:register_voiceline("bravo", "contact", ModPath .. "assets/oggs/voiceover/bravo/contact/contact" .. i .. ".ogg")
		end
        --these have no filter cus hecu meme
		for i = 1, 14 do
			_G.voiceline_framework:register_voiceline("bravo", "death", ModPath .. "assets/oggs/voiceover/bravo/death/death" .. i .. ".ogg")
		end

		for i = 1, 11 do
			_G.voiceline_framework:register_voiceline("bravo", "gogo", ModPath .. "assets/oggs/voiceover/bravo/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 5 do
			_G.voiceline_framework:register_voiceline("bravo", "pain", ModPath .. "assets/oggs/voiceover/bravo/pain/pain" .. i .. ".ogg")
		end	

		for i = 1, 6 do
			_G.voiceline_framework:register_voiceline("bravo", "kill", ModPath .. "assets/oggs/voiceover/bravo/kill/kill" .. i .. ".ogg")
		end
		
		for i = 1, 8 do
			_G.voiceline_framework:register_voiceline("bravo", "clear", ModPath .. "assets/oggs/voiceover/bravo/clear/clear" .. i .. ".ogg")
		end	
		
		--Titan Sniper	

		for i = 1, 19 do
			_G.voiceline_framework:register_voiceline("tsniper", "contact", ModPath .. "assets/oggs/voiceover/tsniper/contact/contact" .. i .. ".ogg")
		end

		for i = 1, 12 do
			_G.voiceline_framework:register_voiceline("tsniper", "death", ModPath .. "assets/oggs/voiceover/tsniper/death/death" .. i .. ".ogg")
		end

		for i = 1, 13 do
			_G.voiceline_framework:register_voiceline("tsniper", "gogo", ModPath .. "assets/oggs/voiceover/tsniper/gogo/gogo" .. i .. ".ogg")
		end		

		for i = 1, 4 do
			_G.voiceline_framework:register_voiceline("tsniper", "pain", ModPath .. "assets/oggs/voiceover/tsniper/pain/pain" .. i .. ".ogg")
		end
		
		for i = 1, 2 do
			_G.voiceline_framework:register_voiceline("tsniper", "spawn", ModPath .. "assets/oggs/voiceover/tsniper/spawn/spawn" .. i .. ".ogg")
		end		
		for i = 1, 2 do
			_G.voiceline_framework:register_voiceline("tsniper", "ready", ModPath .. "assets/oggs/voiceover/tsniper/ready/ready" .. i .. ".ogg")
		end
		
		for i = 1, 9 do
			_G.voiceline_framework:register_voiceline("tsniper", "clear", ModPath .. "assets/oggs/voiceover/tsniper/clear/clear" .. i .. ".ogg")
		end	
	else	
		log("NO FRAMEWORK!!!")
	end
end