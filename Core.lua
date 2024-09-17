if not ModCore then
	restoration.log_shit("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end

Month = os.date("%m")
Day = os.date("%d")	

restoration._mod_path = restoration:GetPath()
function restoration:Init()
	restoration.log_shit("SC: LOADING: " .. self.ModPath)
	restoration.captain_types = {
		winter = {
			spawn_group = "Cap_Winters",
			icon = "guis/textures/pd2/hud_buff_shield",
			vs_line = "hud_assault_vip_winters"
		},
		spring = {
			spawn_group = "Cap_Spring",
			icon = "guis/textures/pd2/hud_buff_skull",
			vs_line = "hud_assault_vip_spring"
		},
		summer = {
			spawn_group = "Cap_Summers",
			icon = "guis/textures/pd2/hud_buff_fire",
			vs_line = "hud_assault_vip_summers"
		},
		autumn = {
			spawn_group = "Cap_Autumn",
			icon = "guis/textures/pd2/hud_buff_spooc",
			vs_line = "hud_assault_vip_autumn"
		},
		hvh = {
			spawn_group = "HVH_Boss",
			icon = "guis/textures/pd2/hud_buff_halloween",
			vs_line = "hud_assault_vip_hvh",
			captain_warn = "hud_assault_vip_hvhwarn"
		}
	}	
		--Defines what captains spawn on what heists.
	restoration.captain_spawns = {
	    --Winters
		arena = restoration.captain_types.winter, --Alesso
		welcome_to_the_jungle_1 = restoration.captain_types.winter, --Big Oil Day 1
		stage_1 = restoration.captain_types.winter, --Big Oil Day 1 EDIT
		welcome_to_the_jungle_2 = restoration.captain_types.winter, --Big Oil Day 2
		stage_2 = restoration.captain_types.winter, --Big Oil Day 2 EDIT
		election_day_1 = restoration.captain_types.winter, --Election Day 1
		election_day_2 = restoration.captain_types.winter, --Election Day 2
		election_day_3 = restoration.captain_types.winter, --Election Day 3
		election_day_3_skip1 = restoration.captain_types.winter, --Election Day 3 (Skipped 1)
		election_day_3_skip2 = restoration.captain_types.winter, --Election Day 3 (Skipped 2)
		firestarter_2 = restoration.captain_types.winter, --firestarter day 2
		four_stores = restoration.captain_types.winter, --Four Stores
		hox_3 = restoration.captain_types.winter, --Hoxton Revenge
		moon = restoration.captain_types.winter, --Stealing Xmas
		mus = restoration.captain_types.winter,	--the diamond
		gallery = restoration.captain_types.winter, --art gallery
		red2 = restoration.captain_types.winter, --fwb
		watchdogs_1 = restoration.captain_types.winter, --Watchdogs Day 1
		crojob3 = restoration.captain_types.winter, --The Bomb: Forest
		crojob3_night = restoration.captain_types.winter, --The Bomb: Forest Night
		rvd2 = restoration.captain_types.winter, --Garnet Group Boutique
		brb = restoration.captain_types.winter, --brookyn ten-ten benk
		--Custom Heists--
		four_stores_remixed = restoration.captain_types.winter, --Four Stores (Remixed)
		office_strike = restoration.captain_types.winter, --office strike
		schl = restoration.captain_types.winter, --Scarlet Club House
		firestarter_2_res = restoration.captain_types.winter, --firestarter day 2 edit
		constantine_clubhouse_lvl = restoration.captain_types.winter, --Smuggler's Den 
		TonCont = restoration.captain_types.winter, --Armored Transport: Atrium 
		gallery_v2 = restoration.captain_types.winter, --Art Gallery Remastered 
		Skyscraper = restoration.captain_types.winter, --The Skyscraper Heist
		ttr_yct_lvl = restoration.captain_types.winter, --Triad Takedown Remastered 
		tj_af22_kitteh_level = restoration.captain_types.winter, --The Greatest Bank Of All time
		bookmakers_office = restoration.captain_types.winter, --Bookmaker's Office
		tRain_returns = restoration.captain_types.winter, --wip rant-man heist
		constantine_policestation_lvl = restoration.captain_types.winter, --Constantine Scores (precinct raid)
		battlearena = restoration.captain_types.winter, --Five-G
		tonisl1 = restoration.captain_types.winter, --Grand Harvest
		constantine_penthouse_lvl = restoration.captain_types.winter, --Penthouse Crasher (Constantine Scores)
		tonmapjam22l = restoration.captain_types.winter, --Hard Cash
		fuel = restoration.captain_types.winter, --Fuel Feuds 
		icing = restoration.captain_types.winter, --Road Rage
		--Summers
		alex_2 = restoration.captain_types.summer, --Rats Day 2
		pal = restoration.captain_types.summer, --counterfeit
		mia_1 = restoration.captain_types.summer, --Hotline Day 1
		crojob2 = restoration.captain_types.summer, --bomb dockyard
		firestarter_1 = restoration.captain_types.summer, --firestarter day 1
		jolly = restoration.captain_types.summer, --aftershock
		rvd1 = restoration.captain_types.summer, --highland mortuary 
		watchdogs_2_day = restoration.captain_types.summer, --Watchdogs Day 2 Daytime
		trai = restoration.captain_types.summer, --Lost In Transit
		jolly_CD = restoration.captain_types.summer, --jolly crackdown edit
		--Custom Heists--	
		alex_2_res = restoration.captain_types.summer, --Rats Day 2 edit
		lit1 = restoration.captain_types.summer, --California's Heat
		glb = restoration.captain_types.summer, --Golden Lotus Bank 
		constantine_mobsterclub_lvl = restoration.captain_types.summer, --Aurora (Borealis?!) Club
		constantine_harbor_lvl = restoration.captain_types.summer, --Harboring a Grudge
		firestarter_1_res = restoration.captain_types.summer, --firestarter day 1 res edit version
		constantine_murkyairport_lvl = restoration.captain_types.summer, --Murky Airport (Constantine Scores)
		bag_sim_2 = restoration.captain_types.summer, --Bag Simulator 2
		RogueCompany = restoration.captain_types.summer, --Rogue Company
		Security_Avenue = restoration.captain_types.summer, --Gensec HQ Raid day 1
		constantine_resort_lvl = restoration.captain_types.summer, --Scarlett Resort (Constantine Scores)

		--Spring
		xmn_hox2 = restoration.captain_types.spring, --Hoxout Day 2, christmas
		firestarter_3 = restoration.captain_types.spring, --firestarter day 3
		arm_for = restoration.captain_types.spring, --train heist
		arm_for_restoration = restoration.captain_types.spring,	--train heist restoration edit
		big = restoration.captain_types.spring, --big bank
		kenaz = restoration.captain_types.spring, --ggc
		dinner = restoration.captain_types.spring, --Slaughterhouse
		dah = restoration.captain_types.spring, --diamond heist
		hox_2 = restoration.captain_types.spring, --Hoxout Day 2
		--chas = restoration.captain_types.spring, --Dragon Heist
		--Custom Heists--
		firestarter_3_res = restoration.captain_types.spring, --firestarter day 3 res edit version
		hardware_store = restoration.captain_types.spring, --Hardware Store 
		nft_heist = restoration.captain_types.spring, --EN EF TEE HEIST
		anlh = restoration.captain_types.spring, --An End To Liang
		constantine_butcher_lvl = restoration.captain_types.spring, --Butcher's Bay
		constantine_bank_lvl = restoration.captain_types.spring, --Pacific Bank
		santas_hardware_store = restoration.captain_types.spring, --Santa Spring Is Coming To Town
		lvl_friday = restoration.captain_types.spring, --Crashing Capitol
		bnktower = restoration.captain_types.spring, --Gensec HIVVVVVVVVVVVVVVEEEEEEEEEEEEEEEEE
		mansion_stage1 = restoration.captain_types.spring, --Elmsworth Mansion
		constantine_gunrunnerclubhouse_lvl = restoration.captain_types.spring, --Constantine Scores (gunrunner)
		sh_raiders = restoration.captain_types.spring, --Safehouse Raiders
		bluewave = restoration.captain_types.spring,  --res map bluewave
		dwn1 = restoration.captain_types.spring, --Deep Inside
		jambank = restoration.captain_types.spring, --Botched Bank
		arena_club30 = restoration.captain_types.spring, -- Arena Orange 

		--Autumn
		alex_1 = restoration.captain_types.autumn, --Rats Day 1
		rat = restoration.captain_types.autumn,	--cook off
		welcome_to_the_jungle_1_night = restoration.captain_types.autumn, --Big Oil Day 1 Night
		nightclub = restoration.captain_types.autumn, --Night Club
		branchbank = restoration.captain_types.autumn, --Bank Heist
		family = restoration.captain_types.autumn, --diamond store
		framing_frame_1 = restoration.captain_types.autumn, --art gallery but ff
		framing_frame_3 = restoration.captain_types.autumn, --Powerbox simulator
		jewelry_store = restoration.captain_types.autumn, --Jewelry Store
		ukrainian_job = restoration.captain_types.autumn, --Ukrainian Job
		man = restoration.captain_types.autumn, --undercover--
		sah = restoration.captain_types.autumn, --shacklethrone auction
		watchdogs_2 = restoration.captain_types.autumn, --Watchdogs Day 2 Night
		watchdogs_1_night = restoration.captain_types.autumn, --Watchdogs Day 1 Night
		--Custom Heists--
		alex_1_res = restoration.captain_types.autumn, --Rats Day 1 edit
		lvl_fourmorestores = restoration.captain_types.autumn, --four more stores
		ukrainian_job_res = restoration.captain_types.autumn, --Ukrainian Job res edit version
		hntn = restoration.captain_types.autumn, --harvest and trustee north
		wetwork = restoration.captain_types.autumn,  --res map package wetworks
		hwu = restoration.captain_types.autumn, --hwUwU (Avalon's Shadow)
		amsdeal1 = restoration.captain_types.autumn,  --Armsdeal Alleyway
		Gambling_room = restoration.captain_types.autumn,  --Underground Bargains
		branchbank_meth = restoration.captain_types.autumn,  --Bank Heist: Meths
		constantine_apartment_lvl = restoration.captain_types.autumn,  --Concrete Jungle 
		tj_htsb = restoration.captain_types.autumn,  --harvest and trustee - southern branch
		hidden_vault = restoration.captain_types.autumn, --Hidden Vault
		Gensec_HQ = restoration.captain_types.autumn, --Gensec HQ Raid day 2
		skm_firestarter_2 = restoration.captain_types.autumn,--FBI Holdout 

		--I'm not typing out the whole name
		help = restoration.captain_types.hvh, --Prison Nightmare
		nail = restoration.captain_types.hvh, --lab rats
		skm_nightmare_lvl = restoration.captain_types.hvh, --Safehouse Nightmare SKM (for flavour text)
		--Custom Heists--
		daymare = restoration.captain_types.hvh, --Hell's Nightmare
		funbank = restoration.captain_types.hvh, --FunBank: Specials	
		crash_course = restoration.captain_types.hvh, --REDACTED
		ascension_III = restoration.captain_types.hvh --Ascension (project eclipse 3)
	}
	
	--HVH replaces Spring during the month of Halloween
	if Month == "10" and restoration.Options:GetValue("OTHER/Holiday") then
		for heist, captain in pairs(restoration.captain_spawns) do
			if captain == restoration.captain_types.spring then
				restoration.captain_spawns[heist] = restoration.captain_types.hvh
			end
		end		
	end		
	
	--Put heist IDs in this table to disable naturally occuring captains if they're defined above as well, mostly for scripted captain encounters
	restoration.disable_natural_captain = {	
		"skm_nightmare_lvl",
		"crojob3",
		"crojob3_night",
		--Custom Heists--
		"constantine_gunrunnerclubhouse_lvl", 
		"constantine_policestation_lvl"
	}
		
			
	--[[restoration.captain_viper = {
		"jackal_zero_day_stage7" --Zero Day 7
	}]]--	
	
	restoration.global_spawn_multiplier = 1
	restoration.disco_inferno = false
	restoration.force_halloween = false
	restoration.always_bravos = false
	restoration.civ_death_diff_increase = true
	
	--Disable Bravos spawning on PONRs for these heists, usually for heists that have PONRs that go on/off. Also kills forced 1 diff and music changes on Pro Job
	restoration.alternate_ponr_behavior = {
		"sand", --The Ukrainian Prisoner
		"trai",--Lost in Transit	
		"fuel" -- Fueled Feuds
	}	
	
	--[[
	restoration.stealth_ponr_behavior = {
		"cage", --Carshop
		"tag", --Breaking Feds
		"xmn_tag", --Breaking Feds Xmas
		"kosugi", --Shadow Raid
		"dark", --Murky Station
		"fish", --Yacht
		"sand", --The Ukrainian Prisoner
		"ranc" --Midland Ranch
	}		
	]]--
		
	--Increased spawns, should only be reserved for larger maps.
	restoration.very_large_levels = {
		--Custom Heists below--
		"bnktower", --Gensec HIVVVVVVVVVVVVVVEEEEEEEEEEEEEEEEE
		"bag_sim_2", --Bag Simulator 2
		"finsternis", --Projekt Finsternis
		"funbank" --suffer
	}
	--Increased spawns, slightly less. Ditto
	restoration.large_levels = {
		"crojob2", --Bomb Dockyard
		"friend", --Scarface Mansion
		"kenaz", --Golden Grin Casino
		"peta", --Goatsim 1
		"watchdogs_2_day", --Watchdogs Day 2 
		"watchdogs_2", --Watchdogs Day 2 but night
		"bex", --San Martin Bank
		"trai", --Lost in Transit
		"corp", --Hostile Takeover
		"mus", --The Diamond
		--Custom Heists below--
		"hardware_store", --Hardware Store  
		"lit1", --California's restoration
		"lit2", --California's restoration but Payday 3
		"constantine_bank_lvl", --Pacific Bank 
		"anlh", --An End To Liang
		"bluewave", --res map bluewave
		"ruswl", --Scorched Earth
		"hunter_departure", --Hunter and Hunted d2
		"tj_af22_kitteh_level", --The Greatest Bank Of All time
		"constantine_butcher_lvl", --Butcher's Bay
		"glb", --Golden Lotus Bank 
		"schl", --Scarlet Club House
		"hwu", --Avalon's Shadow
		"constantine_smackdown2_lvl", --Truck Hustle
		"constantine_gunrunnerclubhouse_lvl", --Constantine Scores (gunrunner)
		"TonCont", --Armored Transport: Atrium
		"santas_hardware_store", --Hardware Store but Xmas
		"ascension_III", --Ascension (project eclipse 3)
		"RogueCompany", --Rogue Company
		"battlearena", --Five-G
		"constantine_train_lvl",
		"constantine_penthouse_lvl", --Penthouse Crashers (Constantine Scores)
		"constantine_resort_lvl", --Scarlett Resort (Constantine Scores)
		"constantine_murkyairport_lvl", --Murky Airport (Constantine Scores)
		"Security_Avenue", --GenSec HQ Day 1
        "arena_club30" -- Arena Orange 
	}			
	--Slightly reduced spawns, generally use for heists with lengthy sections where players typically hold out in one smallish position, or 'early game' heists.
	restoration.tiny_levels = {
		"welcome_to_the_jungle_2", --Big Oil 2. Scripted cloaker hell.
		"arena", -- Alesso Heist
		"cane", --Santa's Workshop
		"brb", --Brooklyn Bank
		"born", --Biker 1
		"run", --Heat Street
		"ranc", --Midland Ranch
		"mad", --Boiling Point
		"sah", --Shacklethorne
		"glace", --Green Bridge
		"pbr", --Beneath the Mountain
		"dinner", --Slaughterhouse
		"flat", --Panic Room
		"gallery", --Art Gallery
		"framing_frame_1",  --Art Gallery but FF 
		"framing_frame_3", --Framing Frame 3
		"crojob3", --Bomb: Forest
		"crojob3_night", --Ditto
		"spa", --Brooklyn 10-10
		"man", --Undercover
		"man_res", --Undercover resmod edit		
		"jolly", --Aftershock
		"firestarter_3", --firestarter day 3
		"roberts", --Go Bank
		"family", --Diamond Store
		"jewelry_store", --Ukrainian job left off since its bag moving is optional, to compensate for the extra easiness.
		"rat", --Cook Off
		"chas", --Dragon Heist	
		"pent", --Mountain Master Heist
		"rvd1", --Reservoir Dogs Day 1, lots of scripted spawns and little cover
		"sand", --The Ukrainian Prisoner
		"deep", --Crude Awakening
		--Skirmish heists below
		"skm_big2",
		"skm_mallcrasher",
		"skm_cas",
		"skm_bex",
		"skm_friend",
		"skm_street",
		--Custom Heists below--
		"junk", --Doghouse
		"run_res", --Whurr's Heat Street Edit
		"knk_jwl", --Knockover: Jewerly Store
		"RogueCompany", --Rogue Company
		"Gambling_room", --Underground Bargains
		"bookmakers_office", --Bookmaker's Office
		"constantine_mobsterclub_lvl", --Aurora (Borealis?!) Club
		"constantine_clubhouse_lvl", --Smuggler's Den 
		"crimepunishlvl", --Crime And Punshiment
		"nft_heist", --EN EF TEE HEIST
		"branchbank_meth", --Bank Heist: Meth
		"tj_htsb", --Harvest and Trustee: Southern Branch 
		"hntn", --harvest and trustee north
		"ttr_yct_lvl", --Triad Takedown Remastered 
		"modders_devmap", --Proving Grounds
		"gallery_v2", --Art Gallery Remastered 
		"wetwork_burn", --Burnout
		"brb_rant", --Brooklyn Bank: Ranted
		"hidden_vault", --Hidden Vault
		"constantine_gold_lvl", --Golden Shakedown (Constantine Scores)
		"jambank", --Botched Bank
		"tonmapjam22l", --Hard Cash
		"cshr", --Old Safehouse Raid
		"SJamBank", -- Branch Bank Initiative
		"constantine_dwtd_lvl", -- Dance with The Devil (Constantine Scores)
		"constantine_yacht_lvl", --  Showdown  (Constantine Scores) 
		"constantine_policestation_lvl", -- Precint Raid (Constantine Scores)
		"constantine_murkyairport",		 -- Murky Airport (Consantine Scores) 
		"hogar",-- The House Robbery
		"icing",	--Road Rage	
		"gunw_lvl",  -- Gun Waashing 
		"R&amp;B Bank" -- RNB Bank (Notoriety port)
		

	}
	--For levels that have aggressive scripted spawns, or spawn placement such that enemies are constantly spawned next to players.
	restoration.very_tiny_levels = {
		"pbr2", --Birth of Sky
		"chca", --Black Cat Heist
		"rvd2", --Reservoir Dogs 2, has very aggressive scripted spawns.
		"vit", --White House
		"nmh", --No Mercy
		"des",	--Henry's Rock	
		"bph", --Hell's Island		
		"fex", --Buluc's Mansion
		"peta2", --Goats day 2
		"nail",	--Lab Rats
		--Skirmish heists below
		"skmc_mad",
		"skm_red2",
		"skm_mus",
		"skm_arena",
		"skmc_ovengrill",
		"skm_watchdogs_stage2",
		"skm_firestarter_2",
		--Custom Heists below--
		"thechase",
		"daymare", --Hell's Nightmare
		"trop", --Tropical Treasure 
		"constantine_apartment_lvl", --Concrete Jungle 
		"constantine_harbor_lvl", --Harboring a Grudge
		"amsdeal1", --Armsdeal Alleyway
		"constantine_smackdown_lvl", --Smackdown
		"constantine_restaurant_lvl", --Blood in the Water (Constantine Scores)
		"nmh_res", --Resmod edit of no mercy.
		"lvl_friday", --Crashing Capitol
		"physics_citystreets", -- BOWORKS Day 1
		"physics_core",-- BOWRORKS Day 3
		"cold_gold",-- Cold Gold 
		"constantine_dwtd_lvl", -- Constantine Scores
		"constantine_yacht_lvl", --  Constantine Scores
		"R&amp;B Bank" -- RNB Bank (Notoriety port)

		
	}	
	--Mostly for stuff like Cursed Killed Room and other crap puny heists or heists with a *massive* amount of scripted spawns like Texas/Mexico arc heists
	restoration.extremely_tiny_levels = {
		"hvh", --CKR
		"haunted", --Safehouse Nightmare
		"mia_2", --Hotline Miami 2	
		"help", --Prison Nightmare		
		"chill_combat",	--Safehouse Raid	
		"mex", --Border Crossing
		"mex_cooking", --Border Crystals			
		--Skirmish heists below
		"skm_nightmare_lvl", --Safehouse Nightmare SKM
		--Custom Heists below--
		"infinitebank_room",  --First World Tower
		"railrun", --The Last Train
		"highrise_stage1", --Out of Frame
		"Victor Romeo"
	}	
	--Christmas Effects Heists
	restoration.christmas_heists = {
		"roberts",
		"pines",
		"cane",
		"moon",
		--Custom Heists--
		"roberts_v2",
		"santas_hardware_store", --Hardware Store but Xmas
		"santa_pain"
	}	
	--heists to remove infinite assaults from
	restoration.fuck_hunt = {
		"kenaz", --ggc
		"pines", --white xmas
		"jolly", --aftershock
		"born", --biker heist D1
		"chca", --black cat
		"pent", --Mountain Master 
		"lvl_friday", --Mallbank / Crashing Capitol
		--"hox_1", --Hoxout D1
		--"xmn_hox_1" --Xmas edition
		--Custom Heists--
		"the_factory" --eclipse research facility
	}	
		
	--Sub Faction overrides
	--Texas
	restoration.yee_and_I_cannot_stress_this_enough_haw = {
		"ranc",
		"dinner",
		"trai",
		"corp",
		--"deep",
		--Custom Heists--
		"tonmapjam22l"
	}	
	--San Francisco
	restoration.needle = {
		"chas",
		"sand",
		"chca",
		"pent"
	}
	--FSB (custom heists)
	restoration.fsb = {
		"flatline_lvl",
		"ahopl",
		"rusdl",
		"crimepunishlvl",
		"hunter_party",
		"hunter_departure",
		"hunter_fall",
		"ruswl",
		"branchbank_russia"
	}
	--GenSec (custom heists)
	restoration.gensec = {
		"constantine_penthouse_lvl", -- Constantine Scores (Penthouse Crasher)
		"constantine_resort_lvl"	 -- COnstantine Scores (Scarlet Resort)

	}
	--Cartel (custom heists)
	restoration.cartel = {
		"constantine_train_lvl",    -- Constantine Scores (Cartel Transport Train)
		"constantine_cart_dwn_lvl",	-- Constantine Scores (Cartel Transport Downtown)
		"constantine_cart_con_lvl",	-- Constantine Scores ((Cartel Transport Construction Site)
		"constantine_dwtd_lvl",		-- Constantine Scores (Dance With The Devil)
		"constantine_suburbia_lvl", -- Constantine Scores (Early Birds)
		"constantine_fiesta_lvl",    -- COnstantine Scores (Fiesta)
		"constantine_yacht_lvl"	,	-- COnstantine Scores (Showdown)
		"constantine_jungle_lvl"    -- Constantine Scores (Welcome To The Jungle)
	}
	--Support Factions (will spawn alongside the main force)
	--OMNIA
	restoration.omnia_support = {
		"wetwork", --Wetworks
		"bluewave" --Bluewave
		--"wetwork_burn"
	}
	
	restoration.Environment_Settings_Table = {} --leave blank, it will generate contents based on the table below
	
	local environment_settings = { --edit this one
		["OTHER/Env_Banks"] = true,
		["OTHER/Env_RVD1"] = true,
		["OTHER/Env_RVD2"] = true,
		["OTHER/Env_FSD1"] = true,
		["OTHER/Env_PBR2"] = true,
		["OTHER/Env_CJ2"] = true,
		["OTHER/Env_FRIEND"] = true,
		["OTHER/Env_UnderPass"] = true,
		["OTHER/Env_MallCrasher"] = true,
		["OTHER/Env_Mia_1"] = true,
		["OTHER/Env_FSD3"] = true,
		["OTHER/Env_WDD1N"] = true,
		["OTHER/Env_WDD1D"] = true,
		["OTHER/Env_WDD2D"] = true,
		["OTHER/Env_Alex3"] = true,
		["OTHER/Env_Big"] = true,
		["OTHER/Env_FS"] = true,
		["OTHER/Env_Ukra"] = true,
		["OTHER/Env_Peta"] = true
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

	--[[
	if SystemFS:exists("mods/DMCWO/mod.txt") then
		SC._data.sc_player_weapon_toggle = false
	else
		SC._data.sc_player_weapon_toggle = true
	end
	--]]

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
--don't load the fucking classic movies if setting is on.  memory hog
function restoration:LoadClassicMovies()
	if restoration and restoration.Options:GetValue("OTHER/ClassicMovies") then
		return true
	end
end

function restoration:LoadFonts()
	if not Idstring("russian"):key() == SystemInfo:language():key() then
		return true
	end
end

restoration.assault_style = {
	"beta_assault",
	"alpha_assault"
}

restoration.newsfeed_style = {
	"show_both",
	"show_classic_newsfeed"
}

restoration.dodge_display = {
	"dd_scale",
	"dd_150",
	"dd_100"
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

restoration.environments_choice_friend = {
	"default",
	"random",
	"friend_pink",
	"friend_night",
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

restoration.environments_choice_watchdogs_1_day = {
	"default",
	"cloudy_day"
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

restoration.environments_choice_peta = {
	"default",
	"cloudy_day"
}

restoration.ponrtracks = {
	"off",
	"windowofoppurtunity",
	"wheresthevan",
	"random"
}

restoration.vm_move = {
	"vm_vanilla",
	"vm_drag",
	"vm_lead",
	"vm_static",
}
restoration.recoil_recover_style = {
	"rr_off",
	"rr_per_weapon",
	"rr_full"
}
restoration.ads_transition_style = {
	"vanilla_on_rails",
	"kf_mw_style",
	"tilt_in"
}

restoration.weapon_categories = {
	"base_wpn_cat",
	"sub_wpn_cat"
}

restoration.wepnames = {
	"resmod_res_names",
	"resmod_no_nicknames",
	"dmcwo_reelnames",
	"resmod_no_renames"
}

restoration.AdvMovMelee = {
	"resmod_advmov_melee_on",
	"resmod_advmov_melee_loud_only",
	"resmod_advmov_melee_off"
}

-- Detect if ResMod is active to disable PDTH Challenges Standalone
DisablePDTHChallengeStandalone = DisablePDTHChallengeStandalone or {}

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

	restoration.loaded_elements = false

--Stealing this from SH cause it's way better
function restoration:require(file)
	local path = ModPath .. "req/" .. file .. ".lua"
	return io.file_is_readable(path) and blt.vm.dofile(path)
end

function restoration:mission_script_patches()
	if self._mission_script_patches == nil then
		local level_id = Global.game_settings and Global.game_settings.level_id
		if level_id then
			self._mission_script_patches = self:require("mission_script/" .. level_id:gsub('_skip1$', ''):gsub('_skip2$', ''):gsub("_night$", ""):gsub("_day$", "")) or false
		end
	end
	return self._mission_script_patches
end


--mission_script_add allows to add actual custom stuff to heists
function restoration:mission_script_add()
		restoration.loaded_elements = false
		if self._mission_script_add == nil then
			local level_id = Global.game_settings and Global.game_settings.level_id
			if level_id then
				self._mission_script_add = self:require("mission_script_add/" .. level_id:gsub('_skip1$', ''):gsub('_skip2$', ''):gsub("_night$", ""):gsub("_day$", "")) or false
			end
		end
		return self._mission_script_add
	end

	function restoration:gen_dummy(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementSpawnEnemyDummy",
			values = {
				execute_on_startup = opts.execute_on_startup or false,
				participate_to_group_ai = opts.participate_to_group_ai or false,
				position = pos,
				force_pickup = opts.force_pickup or "none",
				voice = opts.voice or 0,
				enemy = opts.enemy or "units/payday2/characters/ene_swat_1/ene_swat_1",
				trigger_times = opts.trigger_times or 0,
				spawn_action = opts.spawn_action or "none",
				accessibility = opts.accessibility or "any",
				on_executed = opts.on_executed or {},
				rotation = rot,
				team = opts.team or "default",
				base_delay = opts.base_delay or 0,
				enabled = opts.enabled or false,
				amount = opts.amount or 0,
				interval = opts.interval or 5,
			},
		}
	end

	function restoration:gen_spawngroup(id, name, elements, interval)
		return {
			id = id,
			editor_name = name,
			class = "ElementSpawnEnemyGroup",
			values = {
				on_executed = {},
				trigger_times = 0,
				base_delay = 0,
				ignore_disabled = false,
				amount = 0,
				spawn_type = "ordered",
				team = "default",
				execute_on_startup = false,
				enabled = true,
				preferred_spawn_groups = {
					"tac_shield_wall_charge",
					"FBI_spoocs",
					"tac_tazer_charge",
					"tac_tazer_flanking",
					"tac_shield_wall",
					"tac_swat_rifle_flank",
					"tac_shield_wall_ranged",
					"tac_bull_rush",
				},
				elements = elements,
				interval = interval or 0,
			},
		}
	end

	function restoration:gen_so(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementSpecialObjective",
			values = {
				path_style = opts.path_style or "destination",
				align_position = opts.align_position or false,
				ai_group = "enemies",
				is_navigation_link = false,
				position = pos,
				scan = opts.scan or false,
				needs_pos_rsrv = opts.needs_pos_rsrv or false,
				enabled = true,
				execute_on_startup = false,
				rotation = rot,
				base_delay = 0,
				action_duration_min = 0,
				search_position = pos,
				use_instigator = true,
				trigger_times = 0,
				trigger_on = "none",
				search_distance = 0,
				so_action = opts.so_action or "none",
				path_stance = opts.path_stance or "hos",
				path_haste = "run",
				repeatable = false,
				attitude = "engage",
				interval = opts.interval or -1,
				action_duration_max = 0,
				align_rotation = opts.align_rotation or false,
				pose = opts.pose or "none",
				forced = opts.forced or false,
				base_chance = 1,
				interaction_voice = "none",
				SO_access = opts.SO_access or "512", -- default to sniper
				chance_inc = 0,
				interrupt_dmg = opts.interrupt_dmg or 1,
				interrupt_objective = false,
				on_executed = opts.on_executed or {},
				interrupt_dis = opts.interrupt_dis or 1,
				patrol_path = "none",
			},
		}
	end

	function restoration:gen_areatrigger(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementAreaTrigger",
			module = "CoreElementArea",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 1,
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				position = pos,
				rotation = rot,
				enabled = true,
				interval = 0.1,
				trigger_on = "on_enter",
				instigator = "player",
				shape_type = opts.shape_type or "box",
				width = opts.width or 500,
				depth = opts.depth or 500,
				height = opts.height or 500,
				radius = opts.radius or 250,
				spawn_unit_elements = {},
				amount = opts.amount or "1",
				instigator_name = "",
				use_disabled_shapes = false,
				substitute_object = "",
			},
		}
	end
	
	function restoration:gen_dummytrigger(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementEnemyDummyTrigger",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				elements = opts.elements or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				position = pos,
				rotation = rot,
				enabled = true,
				event = opts.event or "spawn"
			},
		}
	end
	
	function restoration:gen_missionscript(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "MissionScriptElement",
			module = "CoreMissionScriptElement",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				enabled = opts.enabled or false
			},
		}
	end
	
	function restoration:gen_toggleelement(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementToggle",
			module = "CoreElementToggle",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				set_trigger_times = opts.set_trigger_times or -1,
				elements = opts.elements or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				enabled = opts.enabled or false,
				toggle = opts.toggle or "on"
			},
		}
	end
	
	function restoration:gen_pointofnoreturn(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementPointOfNoReturn",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 1,
				elements = opts.elements or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				tweak_id = "noreturn",
				time_easy = opts.time_easy or 0,
				time_normal = opts.time_normal or 0,
				time_hard = opts.time_hard or 0,
				time_overkill = opts.time_overkill or 0,
				time_overkill_145 = opts.time_overkill_145 or 0,
				time_easy_wish = opts.time_easy_wish or 0,
				time_overkill_290 = opts.time_overkill_290 or 0,
				time_sm_wish = opts.time_sm_wish or 0,
				position = pos,
				rotation = rot,
				enabled = opts.enabled or false
			},
		}
	end
	
	function restoration:gen_dialogue(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementDialogue",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				dialogue = opts.dialogue or "none",
				enabled = true,
				can_not_be_muted = opts.can_not_be_muted or false,
				execute_on_executed_when_done = opts.execute_on_executed_when_done or false,
				play_on_player_instigator_only = opts.play_on_player_instigator_only or false,
				use_instigator = opts.use_instigator or false,
				use_position = opts.use_position or false
			},
		}
	end
	
	function restoration:gen_preferedadd(id, name, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementEnemyPreferedAdd",
			values = {
				execute_on_startup = false,
				base_delay = opts.base_delay or 0,
				trigger_times = opts.trigger_times or 0,
				spawn_groups = opts.spawn_groups or {},
				on_executed = opts.on_executed or {},
				enabled = true
			},
		}
	end
	
	function restoration:gen_smokeandnades(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementSmokeGrenade",
			values = {
				execute_on_startup = false,
				position = pos,
				rotation = rot,
				enabled = true,
				base_delay = opts.base_delay or 0,
				duration = opts.duration or 0,
				effect_type = opts.effect_type or "smoke",
				ignore_control = true,
				immediate = true,
				on_executed = opts.on_executed or {},
				trigger_times = opts.trigger_times or 0
			},
		}
	end
	
	function restoration:gen_dynamicfilter(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementFilter",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				mode_assault = true,
				mode_control = true,
				difficulty_easy = opts.difficulty_easy or false,
				difficulty_normal = opts.difficulty_normal or false,
				difficulty_hard = opts.difficulty_hard or false,
				difficulty_overkill = opts.difficulty_overkill or false,
				difficulty_overkill_145 = opts.difficulty_overkill_145 or false,
				difficulty_easy_wish = opts.difficulty_easy_wish or false,
				difficulty_overkill_290 = opts.difficulty_overkill_290 or false,
				difficulty_sm_wish = opts.difficulty_sm_wish or false,
				player_1 = opts.player_1 or false,
				player_2 = opts.player_2 or false,
				player_3 = opts.player_3 or false,
				player_4 = opts.player_4 or false,
				platform_pc_only = false,
				platform_win32 = true,
				--resmod for consoles when?
				platform_ps3 = false,
				platform_ps4_only = false,
				platform_xb1_only = false,
				position = pos,
				rotation = rot,
				enabled = opts.enabled or false
			},
		}
	end
	
	function restoration:gen_sotrigger(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementSpecialObjectiveTrigger",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				elements = opts.elements or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				position = pos,
				rotation = rot,
				enabled = true,
				event = opts.event or "complete"
			},
		}
	end
	
	function restoration:objecteditor(id, name, pos, rot, opts)
		opts = opts or {}
		return {
			id = id,
			editor_name = name,
			class = "ElementUnitSequence",
			module = "CoreElementUnitSequence",
			values = {
				execute_on_startup = false,
				trigger_times = opts.trigger_times or 0,
				trigger_list = opts.trigger_list or {},
				on_executed = opts.on_executed or {},
				base_delay = opts.base_delay or 0,
				position = pos,
				rotation = rot,
				enabled = true
			},
		}
	end

	function restoration:log(...)
		if self.logging then
			log("[StreamlinedHeistingAI] " .. table.concat({...}, " "))
		end
	end

	function restoration:warn(...)
		log("[StreamlinedHeistingAI][Warning] " .. table.concat({...}, " "))
	end

	function restoration:error(...)
		log("[StreamlinedHeistingAI][Error] " .. table.concat({...}, " "))
	end

