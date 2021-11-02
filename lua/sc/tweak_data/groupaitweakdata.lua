local job = Global.level_data and Global.level_data.level_id
function GroupAITweakData:_init_chatter_data()
	self.enemy_chatter = {}
	--[[
	notes:
	radius seems to do nothing, game theory how many cops in a radius can say a certain chatter (should test this)
	max_nr how many chatter calls can go off at once
	duration ??? longer ones i grabbed from v009/pdth
	interval is cooldown
	group_min how many cops need to be in a group for the line to play
	queue what call is used in chatter
	]]--
	self.enemy_chatter.clear = {
		radius = 2000,
	    max_nr = 1,
	    duration = {60, 60},
	    interval = {3, 8},
	    group_min = 1,
	    queue = "clr"
	}
	self.enemy_chatter.csalpha = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr2a"
	}
	self.enemy_chatter.csbravo = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr2b"
	}
	self.enemy_chatter.cscharlie = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr2c"
	}
	self.enemy_chatter.csdelta = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr2d"
	}
	self.enemy_chatter.hrtalpha = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr1a"
	}
	self.enemy_chatter.hrtbravo = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr1b"
	}
	self.enemy_chatter.hrtcharlie = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr1c"
	}
	self.enemy_chatter.hrtdelta = {
		radius = 6000,
	    max_nr = 1,
	    duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
	    queue = "gr1d"
	}
	self.enemy_chatter.dodge = {
		radius = 2000,
	    max_nr = 1,
	    duration = {0.5, 0.5},
	    interval = {0.75, 1.5},
	    group_min = 0,
	    queue = "lk3b"
	}
	self.enemy_chatter.csalpha = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr2a"
	}
	self.enemy_chatter.csbravo = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr2b"
	}
	self.enemy_chatter.cscharlie = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr2c"
	}
	self.enemy_chatter.csdelta = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr2d"
	}
	self.enemy_chatter.hrtalpha = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr1a"
	}
	self.enemy_chatter.hrtbravo = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr1b"
	}
	self.enemy_chatter.hrtcharlie = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr1c"
	}
	self.enemy_chatter.hrtdelta = {
		radius = 6000,
		max_nr = 1,
		duration = {3, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "gr1d"
	}
	self.enemy_chatter.aggressive = {
		radius = 700,
		max_nr = 10,
		duration = {3, 4},
		interval = {1.5, 2},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.aggressive_assault = {--cops use less idle chatter during assaults 
		radius = 700,
		max_nr = 10,
		duration = {3, 4},
		interval = {2, 2.5},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.open_fire = {
		radius = 1000,
		max_nr = 10,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "att"
	}
	self.enemy_chatter.aggressive_captain = {
		radius = 700,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "a05"
	}			
	self.enemy_chatter.retreat = {
		radius = 700,
		max_nr = 10,
		duration = {2, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "m01"
	}		
	self.enemy_chatter.deathguard = { --this isnt actually kill lines those are done in playerdamage
		radius = 700,
		max_nr = 5,
		duration = {2, 4},
		interval = {2, 3},
		group_min = 0,
		queue = "r01"
	}
	self.enemy_chatter.contact = {
		radius = 700,
		max_nr = 5,
		duration = {1, 3},
		interval = {0.75, 1.5},
		group_min = 2,
		queue = "c01"
	}
	self.enemy_chatter.clear = {
		radius = 700,
		max_nr = 3,
		duration = {60, 60},
		interval = {0.75, 1.5},
		group_min = 3,
		queue = "clr"
	}
	self.enemy_chatter.clear_whisper = {
		radius = 700,
		max_nr = 2,
		duration = {60, 60},
		interval = {5, 5},
		group_min = 0,
		queue = "a05"
	}		
	self.enemy_chatter.clear_whisper_2 = {
		radius = 700,
		max_nr = 2,
		duration = {60, 60},
		interval = {5, 5},
		group_min = 0,
		queue = "a06"
	}		
	self.enemy_chatter.go_go = {
		radius =  1000,
		max_nr = 20,
		duration = {2, 2},
		interval = {0.75, 1},
		group_min = 0,
		queue = "mov"
	}
	self.enemy_chatter.push = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "pus"
	}
	self.enemy_chatter.reload = {
		radius = 700,
		max_nr = 4,
		duration = {2, 4},
		interval = {4, 5},
		group_min = 0,
		queue = "rrl"
	}
	self.enemy_chatter.look_for_angle = {
		radius = 700,
		max_nr = 20,
		duration = {2, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "t01"
	}
	self.enemy_chatter.ready = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "rdy"
	}
	self.enemy_chatter.smoke = {
		radius = 1000,
		max_nr = 3,
		duration = {2, 2},
		interval = {0.1, 0.1},
		group_min = 0,
		queue = "d01"
	}
	self.enemy_chatter.flash_grenade = {
		radius = 1000,
		max_nr = 3,
		duration = {2, 2},
		interval = {0.1, 0.1},
		group_min = 0,
		queue = "d02"
	}
	self.enemy_chatter.ecm = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch3"
	}
	self.enemy_chatter.saw = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch4"
	}
	self.enemy_chatter.trip_mines = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch1"
	}
	self.enemy_chatter.sentry = {
		radius = 1000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 0,
		queue = "ch2"
	}
	self.enemy_chatter.incomming_captain = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "att"
	}
	self.enemy_chatter.incomming_gren = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "bak"
	}
	self.enemy_chatter.incomming_tank = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "lk3b"
	}
	self.enemy_chatter.incomming_spooc = {
		radius = 1200,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "r01"
	}
	self.enemy_chatter.incomming_shield = {
		radius = 1500,
		max_nr = 1,
		duration = {10, 10},
		interval = {0.5, 1},
		group_min = 0,
		queue = "pos"
	}
	self.enemy_chatter.incomming_taser = {
		radius = 1500,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.5, 1},
		group_min = 0,
		queue = "bak"
	}
	self.enemy_chatter.heal_chatter = {
		radius = 700,
		max_nr = 10,
		duration = {2, 4},
		interval = {1.5, 3.5},
		group_min = 0,
		queue = "heal"
	}	
	self.enemy_chatter.heal_chatter_winters = {
		radius = 700,
		max_nr = 10,
		duration = {2, 4},
		interval = {8.5, 10.5},
		group_min = 0,
		queue = "a05"
	}	
	self.enemy_chatter.aggressive = {
		radius = 2000,
		max_nr = 40,
		duration = {3, 4},
		interval = {4, 6},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.approachingspecial = {
		radius = 4000,
		max_nr = 4,
		duration = {1, 1},
		interval = {6, 10},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.lotusapproach = {
		radius = 4000,
		max_nr = 40,
		duration = {1, 1},
		interval = {1, 4},
		group_min = 0,
		queue = "ch3"
	}
	self.enemy_chatter.aggressivecontrolsurprised1 = {
		radius = 2000,
	    max_nr = 4,
	    duration = {0.5, 0.5},
	    interval = {4, 5},
	    group_min = 0,
	    queue = "lk3b"
	}
	self.enemy_chatter.aggressivecontrolsurprised2 = {
		radius = 2000,
	    max_nr = 4,
	    duration = {0.5, 0.5},
	    interval = {4, 5},
	    group_min = 0,
	    queue = "hlp"
	}
	self.enemy_chatter.aggressivecontrol = {
		radius = 2000,
	    max_nr = 40,
	    duration = {0.5, 0.5},
	    interval = {1.75, 2.5},
	    group_min = 0,
	    queue = "c01"
	}
	self.enemy_chatter.assaultpanic = {
		radius = 2000,
		max_nr = 40,
		duration = {3, 4},
		interval = {3, 6},
		group_min = 0,
		queue = "g90"
	}
	self.enemy_chatter.assaultpanicsuppressed1 = {
		radius = 2000,
		max_nr = 40,
		duration = {3, 4},
		interval = {3, 6},
		group_min = 0,
		queue = "hlp"
	}
	self.enemy_chatter.assaultpanicsuppressed2 = {
		radius = 2000,
	    max_nr = 40,
	    duration = {3, 4},
		interval = {3, 6},
	    group_min = 0,
	    queue = "lk3b"
	}
	self.enemy_chatter.open_fire = {
		radius = 2000,
		max_nr = 40,
		duration = {2, 4},
		interval = {2, 4},
		group_min = 0,
		queue = "att"
	}		
	self.enemy_chatter.retreat = {
		radius = 2000,
		max_nr = 20,
		duration = {2, 4},
		interval = {0.25, 0.75},
		group_min = 0,
		queue = "m01"
	}		
	self.enemy_chatter.cuffed = {
		radius = 1000,
	    max_nr = 1,
	    duration = {0.5, 0.5},
	    interval = {2, 6},
	    group_min = 0,
	    queue = "hr01 "
	}
	self.enemy_chatter.contact = {
		radius = 2000,
		max_nr = 20,
		duration = {1, 3},
		interval = {4, 6},
		group_min = 0,
		queue = "c01"
	}
	self.enemy_chatter.cloakercontact = {
		radius = 1500,
		max_nr = 4,
		duration = {1, 1},
		interval = {2, 4},
		group_min = 0,
		queue = "c01x_plu"
	}
	self.enemy_chatter.cloakeravoidance = {
		radius = 4000,
		max_nr = 4,
		duration = {1, 1},
		interval = {2, 4},
		group_min = 0,
		queue = "m01x_plu"
	}
	self.enemy_chatter.controlpanic = {
		radius = 2000,
	    max_nr = 40,
	    duration = {3, 6},
	    interval = {6, 8},
	    group_min = 1,
	    queue = "g90"
	}
	self.enemy_chatter.sabotagepower = {
		radius = 2000,
	    max_nr = 10,
	    duration = {1, 1},
	    interval = {8, 16},
	    group_min = 1,
	    queue = "e03"
	}
	self.enemy_chatter.sabotagedrill = {
		radius = 2000,
	    max_nr = 10,
	    duration = {1, 1},
	    interval = {8, 16},
	    group_min = 1,
	    queue = "e01"
	}
	self.enemy_chatter.sabotagegeneric = {
		radius = 2000,
	    max_nr = 10,
	    duration = {1, 1},
	    interval = {8, 16},
	    group_min = 1,
	    queue = "e04"
	}
	self.enemy_chatter.sabotagebags = {
		radius = 2000,
	    max_nr = 10,
	    duration = {1, 1},
	    interval = {8, 16},
	    group_min = 1,
	    queue = "l01"
	}
	self.enemy_chatter.sabotagehostages = {
		radius = 2000,
	    max_nr = 40,
	    duration = {1, 1},
	    interval = {8, 16},
	    group_min = 1,
	    queue = "civ"
	}
	self.enemy_chatter.hostagepanic1 = {
		radius = 2000,
	    max_nr = 40,
	    duration = {1, 1},
	    interval = {8, 12},
	    group_min = 1,
	    queue = "p01"
	}
	self.enemy_chatter.hostagepanic2 = {
		radius = 2000,
	    max_nr = 40,
	    duration = {1, 1},
	    interval = {8, 12},
	    group_min = 1,
	    queue = "p02"
	}
	self.enemy_chatter.hostagepanic3 = {
		radius = 2000,
	    max_nr = 40,
	    duration = {1, 1},
	    interval = {8, 12},
	    group_min = 1,
	    queue = "p03"
	}
	self.enemy_chatter.civilianpanic = {
		radius = 2000,
	    max_nr = 40,
	    duration = {1, 1},
	    interval = {6, 8},
	    group_min = 1,
	    queue = "bak"
	}	
end

function GroupAITweakData:_init_unit_categories(difficulty_index)
	local access_type_walk_only = {walk = true}
	local access_type_all = {walk = true, acrobatic = true}
	local Net = _G.LuaNetworking
	local job_id = managers.job and managers.job:current_job_id()
	local tweak = job_id and tweak_data.narrative.jobs[job_id]
	local job = Global.level_data and Global.level_data.level_id
	Month = os.date("%m")
	Day = os.date("%d")	
	self.unit_categories = {}
	if difficulty_index <= 7 then
		self.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1")
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook")
				},	
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1")
				},	
				lapd = {
					Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
				}			
			},
			access = access_type_all,
			special_type = "spooc"
		}
	else
		self.unit_categories.spooc = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg"),	
					Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"),
					Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_cloaker_policia_federale_sc/ene_swat_cloaker_policia_federale_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),			
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),			
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),	
					Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
				}			
			},
			access = access_type_all,
			special_type = "spooc"
		}
	end
	self.unit_categories.CS_cop_C45_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45_sc/ene_akan_cs_cop_c45_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg_sc/ene_akan_cs_cop_akmsu_smg_sc"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"),	
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4")
			}			
		},
		access = access_type_all
	}	
	self.unit_categories.CS_cop_C45_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_c45_sc/ene_akan_cs_cop_c45_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg_sc/ene_akan_cs_cop_akmsu_smg_sc"),	
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"),
				Idstring("units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3")
			}		
		},
		access = access_type_all
	}	
	self.unit_categories.CS_cop_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
			},
			zombie = 
{				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4")
			},				
			murkywater = {	
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4")
			}
		},
		access = access_type_all
	}				
	self.unit_categories.CS_cop_stealth_MP5 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
			},
			russia = {	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_raging_bull_sc/ene_akan_cs_cop_raging_bull_sc")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2")
			},
			murkywater = {	
				Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2")
			}		
		},
		access = access_type_all
	}				
	self.unit_categories.omnia_LPF = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			federales = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},		
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			}		
		},
		access = access_type_all
	}
	if difficulty_index <= 6 then
		self.unit_categories.fbi_vet = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2")
				},
				zombie = {
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2")
				}		
			},
			access = access_type_all
		}
	else
		self.unit_categories.fbi_vet = {
			unit_types = {
				america = {
					Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2")
				},
				zombie = {
					Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_1/ene_veteran_enrique_1")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1")
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1")
				}					
			},
			access = access_type_all
		}
	end
	if difficulty_index <= 3 then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}		
			},
			access = access_type_all
		}		
	elseif difficulty_index == 4 then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}				
			},
			access = access_type_all
		}						
	elseif difficulty_index == 5 then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_sc/ene_swat_policia_federale_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				}			
			},
			access = access_type_all
		}
	else
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}			
			},
			access = access_type_all
		}
	if Month == "04" and Day == "01" and restoration.Options:GetValue("OTHER/Holiday") then
		self.unit_categories.CS_swat_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}				
			},
			access = access_type_all
		}			
		end		
	end
	self.unit_categories.CS_swat_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2")
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2")
			},	
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_r870/ene_swat_policia_federale_r870")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2")
			}	
		},
		access = access_type_all
	}		
	self.unit_categories.CS_heavy_M4 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
			},
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			}			
		},
		access = access_type_all
	}	
	self.unit_categories.CS_heavy_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")						
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_r870/ene_swat_heavy_policia_federale_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},				
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			}		
		},
		access = access_type_all
	}
	self.unit_categories.CS_heavy_M4_w = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1")
			}		
		},
		access = access_type_all
	}	
	if difficulty_index <= 3 then
		self.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},	
				lapd = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				}			
			},
			access = access_type_all,
			special_type = "taser"
		}
	elseif difficulty_index == 4 then
		self.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")						
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				lapd = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				}						
			},
			access = access_type_all,
			special_type = "taser"
		}
	elseif difficulty_index == 5 then
		self.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),						
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),					
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),		
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),					
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),		
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
				},	
				lapd = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),		
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")													
				}					
			},
			access = access_type_all,
			special_type = "taser"
		}
	elseif difficulty_index == 6 or difficulty_index == 7 then
		self.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),			
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),						
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),					
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")								
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
				},
				lapd = {
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
					Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
				}			
			},
			access = access_type_all,
			special_type = "taser"
		}			
	else
		self.unit_categories.CS_tazer = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")						
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")					
				},										
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")								
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")										
				}					
			},
			access = access_type_all,
			special_type = "taser"
		}				
	end			
	self.unit_categories.CS_shield = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_c45/ene_swat_shield_policia_federale_c45")
			},
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2")
			}		
		},
		access = access_type_all,
		special_type = "shield"
	}	
	self.unit_categories.FBI_suit_C45 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1")
			},				
			nypd = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
			},	
			lapd = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1")
			}		
		},
		access = access_type_all
	}		
	self.unit_categories.FBI_suit_C45_M4 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_1/ene_akan_fbi_1"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2")
			},				
			nypd = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2")
			},	
			lapd = {
				Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
			}			
		},
		access = access_type_all
	}	
	if difficulty_index <= 3 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}				
			},
			access = access_type_all
		}
	elseif difficulty_index == 4 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),								
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),								
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},		
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")									
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),								
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),								
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),								
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),		
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),									
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")									
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),						
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},		
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),						
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 6 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}						
			},
			access = access_type_all
		}
	elseif difficulty_index == 7 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_1/ene_veteran_enrique_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}					
	else
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),								
					Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),					
					Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),							
					Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_1/ene_veteran_enrique_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),							
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),							
					Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}
		end
	if Month == "04" and Day == "01" and restoration.Options:GetValue("OTHER/Holiday") and difficulty_index <= 3 then		
	if difficulty_index <= 3 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 4 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),								
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),								
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},		
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")									
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),								
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),								
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),								
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),		
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),									
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),							
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")									
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),						
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				},		
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),	
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),						
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")						
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 6 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_2/ene_veteran_lod_2"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}						
			},
			access = access_type_all
		}
	elseif difficulty_index == 7 then
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}					
	else
		self.unit_categories.FBI_suit_M4_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),								
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),						
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),							
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),							
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),							
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),							
					Idstring("units/payday2/characters/ene_veteran_lod_1/ene_veteran_lod_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}
		end
	end		
	if difficulty_index <= 3 then
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}	
	elseif difficulty_index == 4 then 
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}	
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")									
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				}					
			},
			access = access_type_all
		}			
	elseif difficulty_index == 6 or difficulty_index == 7 then
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
				}					
			},
			access = access_type_all
		}				
	else
		self.unit_categories.FBI_suit_stealth_MP5 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),									
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),							
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),		
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),								
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				},						
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
					Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),								
					Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),		
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),		
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),	
					Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
				}					
			},
			access = access_type_all
		}
	end		
	
	--FBI SWATs (Rifle)
	if difficulty_index <= 4 then
		self.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),	
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),	
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")										
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),			
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale/ene_swat_heavy_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")										
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")								
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),								
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),				
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),						
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),				
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				}					
			},
			access = access_type_all
		}						
	else
		self.unit_categories.FBI_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},	
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				}					
			},
			access = access_type_all
		}
	end
	
	--GenSec SWATs (rifle)
	if difficulty_index <= 7 then
		self.unit_categories.GS_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),	
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},						
				nypd = {
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				}					
			},
			access = access_type_all
		}	
	else
		self.unit_categories.GS_swat_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
				},						
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
				}					
			},
			access = access_type_all
		}
	end	
	
	--FBI Shotgunners/SMG Units
	if difficulty_index <= 4 then
		self.unit_categories.FBI_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),		
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")							
				},								
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),				
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				}					
			},
			access = access_type_all
		}				
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")															
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")														
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")											
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				}					
			},
			access = access_type_all
		}				
	else
		self.unit_categories.FBI_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),			
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")							
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),		
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),			
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),			
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				}				
			},
			access = access_type_all
		}
	end		
	
	--GenSec Shotgunners/SMG units
	if difficulty_index <= 7 then
		self.unit_categories.GS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),	
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),							
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),			
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),							
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),							
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},					
				nypd = {
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),	
					Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),							
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),	
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),							
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
				}					
			},
			access = access_type_all
		}					
	else
		self.unit_categories.GS_swat_R870 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),								
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"),					
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
					Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")
				},						
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),							
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),								
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")
				}					
			},
			access = access_type_all
		}
	end	
	
	--FBI Heavies (Rifle)
	self.unit_categories.FBI_heavy_G36 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			}					
		},
		access = access_type_all
	}			

	if difficulty_index <= 4 then
		self.unit_categories.FBI_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")				
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")	
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				}					
			},
			access = access_type_all
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")				
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")	
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				}					
			},
			access = access_type_all
		}	
	else
		self.unit_categories.FBI_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),						
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
					Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),					
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),	
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),	
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),					
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
					Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),					
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				}					
			},
			access = access_type_all
		}
	end
		
	--FBI Heavy (Rifle, Walk only)
	self.unit_categories.FBI_heavy_G36_w = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			}						
		},
		access = access_type_all
	}			
		
	--GenSec/Zeal Heavy SWAT rifles
	if difficulty_index <= 7 then
		self.unit_categories.GS_heavy_G36 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_g36/ene_swat_heavy_policia_federale_city_g36")
				},						
				nypd = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				}					
			},
			access = access_type_all
		}						
	else
		self.unit_categories.GS_heavy_G36 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_g36/ene_swat_heavy_policia_federale_zeal_g36")
				},							
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				}					
			},
			access = access_type_all
		}
	end		
	--GenSec/Zeal Heavy SWAT shotgunners
	if difficulty_index <= 7 then
		self.unit_categories.GS_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),					
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),						
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),					
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),		
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),	
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},						
				nypd = {
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),		
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),		
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
				}					
			},
			access = access_type_all
		}			
	else
		self.unit_categories.GS_heavy_R870 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")					
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
					Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")					
				},						
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")	
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
					Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")	
				}					
			},
			access = access_type_all
		}
	end			
	--GenSec/Zeal Heavy SWAT rifles (walk only)
	if difficulty_index <= 7 then
		self.unit_categories.GS_heavy_G36_w = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_g36/ene_swat_heavy_policia_federale_city_g36")
				},							
				nypd = {
					Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36")
				}					
			},
			access = access_type_all
		}						
	else
		self.unit_categories.GS_heavy_G36_w = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_g36/ene_swat_heavy_policia_federale_zeal_g36")
				},							
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc")
				}						
			},
			access = access_type_all
		}
	end	
	
	--FBI Shield
	if difficulty_index <= 4 then
		self.unit_categories.FBI_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1")
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1")
				},		
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1")
				}					
			},
			access = access_type_all,
			special_type = "shield"
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),	
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),	
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),			
					Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),	
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")							
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),	
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),	
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				}					
			},
			access = access_type_all,
			special_type = "shield"
		}				
	else
		self.unit_categories.FBI_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
					Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				}					
			},
			access = access_type_all,
			special_type = "shield"
		}		
	end
		
	--GenSec/Zeal Shield
	if difficulty_index <= 7 then
		self.unit_categories.GS_shield = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")									
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},						
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},						
				nypd = {
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				},	
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
				}					
			},
			access = access_type_all,
			special_type = "shield"
		}
	else
		self.unit_categories.GS_shield = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),		
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),		
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},								
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_zeal/ene_swat_shield_policia_federale_mp9_zeal"),
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),		
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),		
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				},	
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),		
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),	
					Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
				}					
			},
			access = access_type_all,
			special_type = "shield"
		}
	end
	
	if difficulty_index <= 4 then
		self.unit_categories.FBI_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
				},				
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				}					
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 5 then
		self.unit_categories.FBI_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				}					
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 6 then
		self.unit_categories.FBI_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				}					
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 7 then
		self.unit_categories.FBI_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_1/ene_bulldozer_hvh_1")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1")								
				}										
			},
			access = access_type_all,
			special_type = "tank"
		}
	else
		self.unit_categories.FBI_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_1/ene_bulldozer_1")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_r870/ene_swat_dozer_policia_federale_r870")
				},						
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")							
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")								
				}							
			},
			access = access_type_all,
			special_type = "tank"
		}
	end		
	if difficulty_index <= 4 then
		self.unit_categories.BLACK_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				}					
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 5 then
		self.unit_categories.BLACK_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				}					
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 6 then
		self.unit_categories.BLACK_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				}					
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 7 then
		self.unit_categories.BLACK_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
				},						
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2")							
				},
				lapd = {
					Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
				}								
			},
			access = access_type_all,
			special_type = "tank"
		}
	else
		self.unit_categories.BLACK_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
				},						
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3")							
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3")								
				}							
			},
			access = access_type_all,
			special_type = "tank"
		}
	end	
	if difficulty_index <= 4 then
		self.unit_categories.SKULL_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
				},						
				nypd = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")								
				}						
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 5 then
		self.unit_categories.SKULL_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
				},					
				nypd = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")								
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 6 then
		self.unit_categories.SKULL_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
				},					
				nypd = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")								
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}
	elseif difficulty_index == 7 then
		self.unit_categories.SKULL_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")								
				},
				zombie = {
					Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_3/ene_bulldozer_hvh_3")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
				},					
				nypd = {
					Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")							
				},
				lapd = {
					Idstring("units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3")	
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}
	else
		self.unit_categories.SKULL_tank = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")								
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg")								
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")							
				},							
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3")					
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249")
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")							
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")								
				}							
			},
			access = access_type_all,
			special_type = "tank"
		}
	end
	self.unit_categories.TIT_tank = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
			},				
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			federales = {
				Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_2_assault/ene_vip_2_assault")
			}				
		},
		access = access_type_all,
		special_type = "tank"
	}
	if difficulty_index <= 7 then 
	    self.unit_categories.boom_M4203 = {
		    unit_types = {
			    america = {
			    	Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    russia = {
			    	Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
			    },
			    zombie = {
			    	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    murkywater = {
			    	Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    federales = {
			    	Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    nypd = {
			    	Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    lapd = {
			    	Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			    }				
		    },
		    access = access_type_all,
		    special_type = "boom"
	    }
	else 
	    self.unit_categories.boom_M4203 = {
		    unit_types = {
			    america = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    russia = {
			    	Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
			    },
			    zombie = {
			    	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    murkywater = {
			    	Idstring("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    federales = {
			    	Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
			    },				
			    nypd = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    },
			    lapd = {
			    	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1")
			    }				
		    },
		    access = access_type_all,
		    special_type = "boom"
	    }
	end
	if difficulty_index <= 5 then
		self.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5")
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale")
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic")
				},	
				lapd = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5")
				}					
			},
			access = access_type_all,
			special_type = "medic"
		}
	elseif difficulty_index == 6 then
		self.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),		
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")							
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),	
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				lapd = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				}					
			},
			access = access_type_all,
			special_type = "medic"
		}			
	elseif difficulty_index == 7 then
		self.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),		
					Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")							
				},					
				murkywater = {
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")						
				},					
				nypd = {
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),	
					Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				lapd = {
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
					Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				}					
			},
			access = access_type_all,
			special_type = "medic"
		}				
	else
		self.unit_categories.medic_M4 = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				russia = {
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
				},
				zombie = {
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),		
					Idstring("units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")							
				},					
				murkywater = {
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),	
					Idstring("units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"),	
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")						
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
					Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")						
				},					
				nypd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				},
				lapd = {
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"),
					Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
				}					
			},
			access = access_type_all,
			special_type = "medic"
		}
	end
	if Month == "04" and Day == "01" and restoration.Options:GetValue("OTHER/Holiday") then		
		self.unit_categories.TIT_tank = {
			unit_types = {
				america = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				},
				russia = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				},
				zombie = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				},				
				murkywater = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				},
				federales = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				},					
				nypd = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				},
				lapd = {
					Idstring("units/payday2/characters/ene_mememan_1/ene_mememan_1"),
					Idstring("units/payday2/characters/ene_mememan_2/ene_mememan_2")					
				}				
			},
			access = access_type_all,
			special_type = "tank"
		}		
	end			
	self.unit_categories.medic_R870 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_medic_hvh_r870/ene_medic_hvh_r870")
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_r870/ene_murky_medic_r870")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale_r870/ene_swat_medic_policia_federale_r870")
			},				
			nypd = {
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
			},	
			lapd = {
				Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870")
			}					
		},
		access = access_type_all,
		special_type = "medic"
	}
	
	--Old Winters Minion
	self.unit_categories.Phalanx_minion = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			}				
		},
		access = access_type_all,
		special_type = "shield",
		is_captain = true
	}
	--Old Winters
	self.unit_categories.Phalanx_vip = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			}				
		},
		access = access_type_all,
		special_type = "shield",
		is_captain = true
	}
	--New Winters
	self.unit_categories.Phalanx_vip_new = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1")
			}				
		},
		max_amount = 1,
		access = access_type_all,
		special_type = "phalanx_vip"
	}	
	--New Winters Minions
	self.unit_categories.Phalanx_minion_new = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1")
			}				
		},
		access = access_type_all,
		special_type = "shield",
		is_captain = true
	}	
	--Titan Snipers that spawn with Winters on DS
	self.unit_categories.Phalanx_sniper = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			federales = {
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			}				
		},
		access = access_type_all,
		is_captain = true
	}		
	--Captain Autumn
	self.unit_categories.Cap_Autumn = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_vip_autumn/ene_vip_autumn")
			}				
		},
		max_amount = 1,
		access = access_type_all,
		special_type = "autumn"
	}
	--Titan Cloakers that spawn with Autumn, ignores spawncaps
	self.unit_categories.Titan_Spooc = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")				
			},
			zombie = {
				Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},					
			murkywater = {
				Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			federales = {
				Idstring("units/pd2_dlc_mad/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},				
			nypd = {
				Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},	
			lapd = {
				Idstring("units/payday2/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			}				
		},
		access = access_type_all,
		special_type = "spooc",
		is_captain = true
	}		
	--Captain Summers
	self.unit_categories.Cap_Summers = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_summers/ene_summers")
			}				
		},
		max_amount = 1,
		access = access_type_all,
		special_type = "summers"
	}
	--Molly
	self.unit_categories.boom_summers = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_grenadier/ene_phalanx_grenadier")
			}					
		},
		access = access_type_all
	}
	--Doc
	self.unit_categories.medic_summers = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_medic/ene_phalanx_medic")
			}				
		},
		access = access_type_all
	}
	--Elektra
	self.unit_categories.taser_summers = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_taser/ene_phalanx_taser")
			}				
		},
		access = access_type_all
	}
	
	--Captain Spring 
	self.unit_categories.Cap_Spring = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},
			russia = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},
			zombie = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},					
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},
			federales = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_spring/ene_spring")
			},				
		},
		max_amount = 1,
		access = access_type_all,
		special_type = "spring"
	}	
	--Benelli Dozers that spawn with Spring (Also ignores spawncaps)
	if difficulty_index <= 7 then
		self.unit_categories.Tank_Ben = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},
				zombie = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},					
				russia = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},
				murkywater = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun")
				},					
				nypd = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},	
				lapd = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				}				
			},
			access = access_type_all,
			special_type = "tank",
			is_captain = true
		}	
	else
		self.unit_categories.Tank_Ben = {
			unit_types = {
				america = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
				},
				zombie = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},					
				russia = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},
				murkywater = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
				},
				federales = {
					Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_minigun/ene_swat_dozer_policia_federale_minigun")
				},						
				nypd = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
				},	
				lapd = {
					Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
				}				
			},
			access = access_type_all,
			special_type = "tank",
			is_captain = true
		}		
	end
	--Titan Tasers that specifically spawn with Spring (Ignores Spawncaps)
	self.unit_categories.Taser_Titan = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")
			},					
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
			},
			murkywater = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
			},
			federales = {
				Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")
			},				
			nypd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")
			}				
		},
		access = access_type_all,
		special_type = "taser",
		is_captain = true
	}
	
	--Headless Titandozer Boss
	self.unit_categories.HVH_Boss = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},
			russia = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},					
			murkywater = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},
			federales = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},				
			nypd = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},
			lapd = {
				Idstring("units/pd2_mod_halloween/characters/ene_headless_hatman/ene_headless_hatman")
			},				
		},
		max_amount = 1,
		access = access_type_all,
		special_type = "headless_hatman"
	}	
	--Headless Titandozers that spawn with boss
	self.unit_categories.HVH_Boss_Headless = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			},
			zombie = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			},					
			russia = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			},
			murkywater = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			},
			federales = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			},				
			nypd = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			},	
			lapd = {
				Idstring("units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw")
			}				
		},
		access = access_type_all,
		special_type = "tank",
		is_captain = true
	}
	--Ghost Titancloakers that spawn with boss
	self.unit_categories.HVH_Boss_Spooc = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},					
			russia = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			murkywater = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},
			federales = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},					
			nypd = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			},	
			lapd = {
				Idstring("units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1")
			}				
		},
		access = access_type_all,
		special_type = "spooc",
		is_captain = true
	}	
	
	--Skirmish only unit categories
	
	--FBI Light SWATs, for earlier waves
	self.unit_categories.SKM_Light_SWAT_Rifle_W1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),	
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			},	
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi/ene_swat_policia_federale_fbi"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			}					
		},
		access = access_type_all
	}	
	
	--FBI Light SWAT Shotgunners, for earlier waves
	self.unit_categories.SKM_Light_SWAT_Shotgun_W1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"),			
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ump/ene_akan_fbi_swat_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")							
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_r870/ene_swat_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_fbi_ump/ene_swat_policia_federale_fbi_ump"),		
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),			
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"),			
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			}				
		},
		access = access_type_all
	}	
	
	--FBI Heavy SWAT, early wave
	self.unit_categories.SKM_Heavy_SWAT_Rifle_W1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1/ene_fbi_heavy_hvh_1")
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_g36/ene_swat_heavy_policia_federale_fbi_g36")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			}					
		},
		access = access_type_all
	}	
		
	--FBI Shotgunner with Sharpshooters
	self.unit_categories.SKM_Heavy_SWAT_Shotgun_W1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870"),						
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"),					
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),	
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),	
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
			},							
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_fbi_r870/ene_swat_heavy_policia_federale_fbi_r870"),					
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),	
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),		
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			}					
		},
		access = access_type_all
	}		
	
	--FBI Shields for early waves
	self.unit_categories.SKM_FBI_shield_W1 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_fbi/ene_swat_shield_policia_federale_mp9_fbi"),
				Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			}					
		},
		access = access_type_all,
		special_type = "shield"
	}		

	--HRTs for Waves 1+2
	self.unit_categories.SKM_FBI_suit_M4_MP5_W2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_1/ene_akan_veteran_1"),
				Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
			},							
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			}						
		},
		access = access_type_all
	}	
	
	--Medics, early waves (FBI tier)
	self.unit_categories.SKM_medic_W2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),		
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")							
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")						
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),	
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			lapd = {
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			}					
		},
		access = access_type_all,
		special_type = "medic"
	}			

	--FBI/GenSec tier tazers
	self.unit_categories.SKM_Tazer_W2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),			
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),		
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"),	
				Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")							
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),		
				Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),
				Idstring("units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"),						
				Idstring("units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser")							
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_tazer_policia_federale/ene_swat_tazer_policia_federale"),					
				Idstring("units/pd2_dlc_mad/characters/ene_titan_taser/ene_titan_taser")								
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")						
			},
			lapd = {
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
				Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),					
				Idstring("units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser")							
			}			
		},
		access = access_type_all,
		special_type = "taser"
	}			

	--FBI/GenSec tier Grenadiers
	self.unit_categories.SKM_Boom_W2 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_grenadier_1/ene_akan_grenadier_1")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1")
			},				
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1")
			},				
			nypd = {
				Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			},
			lapd = {
				Idstring("units/payday2/characters/ene_grenadier_1/ene_grenadier_1")
			}				
		},
		access = access_type_all,
		special_type = "boom"
	}	
	
	--GenSec SWATs with rifles, W3 and W4
	self.unit_categories.SKM_Light_SWAT_Rifle_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat")
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),	
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),	
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),	
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),	
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city/ene_swat_policia_federale_city"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle")
			},						
			nypd = {
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle")
			}					
		},
		access = access_type_all
	}	
	
	--GenSec shotgunners, W3 and W4
	self.unit_categories.SKM_Light_SWAT_Shotgun_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),	
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),							
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")								
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"),			
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")								
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"),							
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")							
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_r870/ene_swat_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_city_ump/ene_swat_policia_federale_city_ump"),							
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},					
			nypd = {
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),	
				Idstring("units/payday2/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3"),							
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"),	
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")					
			}					
		},
		access = access_type_all
	}	

	--GenSec heavy, W3+W4
	self.unit_categories.SKM_Heavy_SWAT_Rifle_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw/ene_akan_fbi_heavy_dw")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36")
			},							
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_g36/ene_swat_heavy_policia_federale_city_g36")
			},						
			nypd = {
				Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36")
			}					
		},
		access = access_type_all
	}		
	
	--GenSec heavy w/ Shotgun, W3+W4
	self.unit_categories.SKM_Heavy_SWAT_Shotgun_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),		
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),					
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper")
			},							
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),	
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),						
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_city_r870/ene_swat_heavy_policia_federale_city_r870"),					
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),		
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),	
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper")
			},						
			nypd = {
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),		
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),	
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),						
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),		
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),				
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper")
			}					
		},
		access = access_type_all
	}	

	--GenSec tier medic, W3+W4
	self.unit_categories.SKM_medic_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),		
				Idstring("units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf")							
			},					
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_medic_policia_federale/ene_swat_medic_policia_federale"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_lpf/ene_akan_lpf")						
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),	
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			},
			lapd = {
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),	
				Idstring("units/payday2/characters/ene_medic_mp5/ene_medic_mp5"),
				Idstring("units/pd2_dlc_vip/characters/ene_omnia_lpf/ene_omnia_lpf")
			}					
		},
		access = access_type_all,
		special_type = "medic"
	}	

	--GenSec tier shield
	self.unit_categories.SKM_FBI_shield_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg"),
				Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")									
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_shield_policia_federale_mp9_sc/ene_swat_shield_policia_federale_mp9_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},						
			nypd = {
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/payday2/characters/ene_shield_gensec/ene_shield_gensec"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"),
				Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault")								
			}					
		},
		access = access_type_all,
		special_type = "shield"
	}	
	
	--GenSec tier M4/MP5 HRTs, + Bloody Vet Cop. W3+W4
	self.unit_categories.SKM_FBI_suit_M4_MP5_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_2/ene_akan_fbi_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_veteran_2/ene_akan_veteran_2"),
				Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
			},							
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_murky_veteran_1/ene_murky_veteran_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_veteran_enrique_1/ene_veteran_enrique_1"),
				Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},	
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_1/ene_lapd_veteran_cop_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			}					
		},
		access = access_type_all
	}						
	
	--GenSec HRT (mp5) tier, W3+W4
	self.unit_categories.SKM_FBI_suit_stealth_MP5_W3 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_zeal/ene_akan_cs_swat_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1")								
			},						
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_mad/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},					
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			},
			lapd = {
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3"),
				Idstring("units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")							
			}					
		},
		access = access_type_all
	}	

	--GenSec tier Blackdozer, W4 only
	self.unit_categories.SKM_BLACK_tank_W4 = {
		unit_types = {
			america = {
				Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga")								
			},
			zombie = {
				Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2")							
			},							
			murkywater = {
				Idstring("units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga")					
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_saiga/ene_swat_dozer_policia_federale_saiga")
			},						
			nypd = {
				Idstring("units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2")							
			},
			lapd = {
				Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")								
			}								
		},
		access = access_type_all,
		special_type = "tank"
	}	

	--Zeal Light SWATs w/ Bravo Support
	self.unit_categories.SKM_Light_SWAT_Rifle_W7 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")				
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass_sc/ene_akan_fbi_swat_dw_ak47_ass_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg_ru/ene_bravo_lmg_ru")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")	
			},						
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),	
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),	
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky")				
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal/ene_swat_policia_federale_zeal"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg_mex/ene_bravo_lmg_mex"),				
			},					
			nypd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")	
			},	
			lapd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")	
			}					
		},
		access = access_type_all
	}	
	
	--Zeal Light Shotgunner with Bravo support
	self.unit_categories.SKM_Light_SWAT_Shotgun_W7 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),	
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870_sc/ene_akan_fbi_swat_dw_r870_sc"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),								
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),	
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),								
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"),					
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")	
			},						
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),							
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),							
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_r870/ene_swat_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),								
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),								
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},					
			nypd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")	
			},
			lapd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")	
			}					
		},
		access = access_type_all
	}	
	
	--Zeal Heavies with Bravo Sharpshooters
	self.unit_categories.SKM_Heavy_SWAT_Shotgun_W7 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),		
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")				
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")					
			},							
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),	
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_sniper/ene_titan_sniper"),	
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex")				
			},						
			nypd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),		
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")	
			},	
			lapd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"),		
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")	
			}					
		},
		access = access_type_all
	}

	--Bravo Support Lights
	self.unit_categories.SKM_Light_SWAT_Rifle_W8 = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")				
			},
			russia = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg_ru/ene_bravo_lmg_ru")				
			},
			zombie = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")	
			},						
			murkywater = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),	
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky")				
			},
			federales = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg_mex/ene_bravo_lmg_mex"),				
			},					
			nypd = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")	
			},	
			lapd = {
				Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg")	
			}					
		},
		access = access_type_all
	}	
	
	--Bravo Shotgunners
	self.unit_categories.SKM_Light_SWAT_Shotgun_W8 = {
		unit_types = {
			america = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			russia = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),	
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ump/ene_akan_fbi_swat_dw_ump"),								
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			zombie = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
				Idstring("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2")	
			},						
			murkywater = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3"),							
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},
			federales = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_policia_federale_zeal_ump/ene_swat_policia_federale_zeal_ump"),								
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_mad/characters/ene_titan_shotgun/ene_titan_shotgun")				
			},					
			nypd = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")	
			},
			lapd = {
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"),								
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
				Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun")	
			}					
		},
		access = access_type_all
	}	
	
	--Zeal Heavies with only Bravo Sharpshooters
	self.unit_categories.SKM_Heavy_SWAT_Shotgun_W8 = {
		unit_types = {
			america = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")				
			},
			russia = {
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_dw_r870/ene_akan_fbi_heavy_dw_r870"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru")				
			},
			zombie = {
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")					
			},							
			murkywater = {
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky")						
			},
			federales = {
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_dlc_bex/characters/ene_swat_heavy_policia_federale_zeal_r870/ene_swat_heavy_policia_federale_zeal_r870"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex")				
			},						
			nypd = {
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")	
			},	
			lapd = {	
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
				Idstring("units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr")	
			}					
		},
		access = access_type_all
	}		

end

function GroupAITweakData:_init_enemy_spawn_groups(difficulty_index)
	--The below summarizes the functions of new or revised tactics in Restoration.
	--charge
	--unit moves to player position and engages per conventional rules. Primary driver for most units.
	--enemies will go into the room and get into sight of you.
	--ranged_fire 
	--unit engages from longer range location with line of sight. Will eventually close with player.
	--elite_ranged_fire 
	--Ranged_fire but with a forced retreat if player closer than closer than 8m (i think that's what we changed it to).
	--obstacle 
	--Unit attempts to position themselves in neighboring room near entrance closest to player.
	--reloadingretreat
	--if player is visible and unit is reloading, attempt to retreat into cover.
	--hitnrun
	--Approach enemies and engage for a short time, then, back away from the fight. Uses 10m retreat range.
	--Tunnel
	--Unit almost entirely targets one player until down, then moves on to next. Special-oriented.
	--spoocavoidance
	--If enemy aimed at or seen within 20m, they retreat away from the fight.
	--harass
	--Player entering non-combat state (such as task interactions or reloading) become priority target.
	--hunter
	--If a player is not within 15 meters of another player, becomes target. MUST NOT be used with deathguard - will cause crashes.
	--deathguard
	--Camps downed player. MUST NOT be used with Hunter - will cause crashes.
	--shield_cover
	--Unit attempts to place leader between self and player, stays close to leader. Can be employed for non-shield units.
	--legday
	--unit can only move by sprinting
	--lonewolf
	--Unit will copy the leader's objective, but behave separately from the group. Useful for pinch groups and to separate flankers from chargers, but still technically have them be part of the same group.
	--skirmish
	--system function for retreating in holdout mode. MUST be last tactic for all units. Do not touch.
	--flank
	--flank enemies will get around you and try to either, run past you, or to your side, so that you're not facing them. if they are walking, and they're within 15-10 meters, they'll crouch.
	self._tactics = {
		--Cloaker tactics, static. Tries to avoid confrontation
		spooc = {
			--"hunter",
			"flank",
			--"lonewolf",
			--"spoocavoidance",
			"smoke_grenade",
			"flash_grenade"
		},	
	
		--Normal/Hard Tactics below
		
		--Standard Beat Cop, prefers to stay at range unless they spawn with a shotgunner
		CS_cop = {
			"provide_coverfire",
			"provide_support",
			"ranged_fire",
			----"shield_cover",
			"groupcsr"
		},
		--Shotgunner variant of Beat Cops, only real difference is they'll charge in
		CS_cop_shotgun = {
			"provide_coverfire",
			"provide_support",
			"charge",
			--"shield_cover",			
			"groupcsr"
		},		
		--Beat Cop, flank variant. Will take control of the squad if they spawn and lead them to flank
		CS_cop_flank = {
			"flank",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",	
			--"shield_cover",			
			"groupcsr"
		},		
		--Beat Cop, stealth variant. Prefers hit n run tactics and avoiding the front to prioritize hostages
		CS_cop_stealth = {
			"flank",
			"provide_coverfire",
			"provide_support",
			--"hitnrun",
			"grouphrtr"
		},
		--Standard Blue SWAT, upgraded from Beat Cops and will now use smoke grenades. 
		CS_swat_rifle = {
			"smoke_grenade",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",	
			--"shield_cover",			
			"deathguard",
			"groupcsr"
		},
		--SWAT shotgunner, will lead charges with his squad
		CS_swat_shotgun = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",			
			"deathguard",			
			"groupcsr"
		},
		--Blue SWAT, flank variant. Will take control and flank with his squad
		CS_swat_rifle_flank = {
			"flank",
			"smoke_grenade",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",	
			--"shield_cover",			
			"deathguard",
			"groupcsr"
		},			
		--Heavy SWAT, act similar to Blue SWATs.
		CS_swat_heavy = {
			"smoke_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",			
			"deathguard",
			"groupcsr"
		},
		--Heavy SWAT Shotgunner. Leads charges
		CS_swat_heavy_shotgun = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"deathguard",
			--"shield_cover",			
			"groupcsr"
		},
		--Heavy SWAT flanker, leads flank maneuvers. 
		CS_swat_heavy_flank = {
			"flank",
			"smoke_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",			
			"deathguard",
			"groupcsr"
		},		
		--Standard SWAT Shield, will charge forward against player positions
		CS_shield = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},	
		--Tazer, flank around and charge to take down players one at a time. 
		CS_tazer = {
			"flank",
			"charge",
			"smoke_grenade",
			--"shield_cover",
			"murder",
			--"tunnel"
		},		
		--Greendozers on Normal/Hard, will try to flank the player
		CS_tank = {
			"flank",
			--"reloadingretreat",
			"murder",
			--"tunnel",
			--"harass",
			--"hitnrun",
			"provide_coverfire",
			"provide_support",
			"shield"
		},		
		--Beat Cop/Blue SWAT/Heavy SWAT defend. Used for reinforce groups
		CS_defend = {
			"flank",
			"ranged_fire"
		},			
		--Sniper tactics. (Unused?)
		CS_sniper = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support"
		},		
		
		--FBI tier stuff below. Very Hard/Overkill mainly
		
		--FBI HRT tactics, for when participating in assaults
		FBI_suit = {
			"flank",
			--"elite_ranged_fire",
			"flash_grenade",
			"grouphrtr"
		},		
		--FBI HRT, stealth and avoiding combat
		FBI_suit_stealth = { 
			"flank",
			--"hunter",
			--"reloadingretreat",
			"provide_coverfire",
			"provide_support",
			"flash_grenade",
			--"hitnrun",
			--"elite_ranged_fire",
			"grouphrtr"
		},
		--FBI Rifle SWATs, can now use flash grenades
		FBI_swat_rifle = { 
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",			
			"provide_support",
			"ranged_fire",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--FBI Shotgun SWATs, leads charges
		FBI_swat_shotgun = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},		
		--FBI Rifle SWATs, flank the player
		FBI_swat_rifle_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"ranged_fire",
			--"shield_cover",
			"provide_coverfire",
			"provide_support",
			"deathguard",
			"groupcsr"
		},		
		--FBI Heavy, now with flash grenades
		FBI_heavy = {
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--FBI Heavy Shotgun, leads charges
		FBI_heavy_shotgun = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			--"shield_cover",
			"provide_coverfire",
			"provide_support",
			"deathguard",
			"groupcsr"
		},			
		--FBI Heavy, flanker
		FBI_heavy_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",	
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},		
		--FBI Shield, basically the same as the CS shield.
		FBI_shield = {
			"charge",
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},	
		--Passive FBI shield
		FBI_shield_flank = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},			
		--Grenadier, passive. Tries to hide behind shields/other units when possible
		FBI_Boom = {
			--"harass",		
			--"elite_ranged_fire",
			"provide_coverfire",		
			"flash_grenade",
			"smoke_grenade",
			"shield_cover"
		},				
		--Medics, passive. Avoids confrontations.
		FBI_medic = { 
			"provide_coverfire",	
			--"hitnrun",
			--"reloadingretreat",
			--"elite_ranged_fire",
			"shield_cover"
		},	
		--Flank Medic tactics, avoid confrontations and flanks. Hugs squad leader
		FBI_medic_flank = {
			"flank",
			--"obstacle",
			"provide_coverfire",	
			--"hitnrun",
			--"reloadingretreat",
			--"elite_ranged_fire",
			"shield_cover"
		},	
		--Reinforce groups
		FBI_defend = {
			"flank",
			"ranged_fire"
		},		
		--Greendozer on FBI tier and above, hitnrun tactics and flank a lot
		GREEN_tank = {
			"flank",
			--"reloadingretreat",
			"murder",
			--"tunnel",
			--"harass",
			--"hitnrun",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		--Blackdozers, hyper aggressive and unload on the player. 
		BLACK_tank = {
			"murder",
			--"tunnel",
			"charge",
			--"harass",
			"shield"
		},
		
		--Mayhem tactics below
		
		--Mayhem rifle SWAT
		MH_swat_rifle = {
			"ranged_fire",
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--Mayhem SWAT Shotgunners, leads charges
		MH_swat_shotgun = { 
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--Mayhem SWAT Flankers, will disengage when targeted
		MH_swat_rifle_flank = { 
			"flank",
			"smoke_grenade",
			"flash_grenade",
			--"elite_ranged_fire",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},		
		--Mayhem Heavy
		MH_heavy = { 
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--Mayhem Heavy Flank, disengage when targeted
		MH_heavy_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--Mayhem Shield, now moves much faster into position
		MH_shield = { 
			--"legday",
			"charge",
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},		
		--Passive MH shield
		MH_shield_flank = { 
			--"legday",
			"ranged_fire",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},					
		
		--Deathwish Tactics below
		
		--hunter hrt tactics
		HRT_attack = { --sneaks up and targets players in bad positions
			"flank",
			--"hunter",
			--"harass",
			"provide_coverfire",
			"provide_support",
			"smoke_grenade",
			"flash_grenade",
			--"hitnrun",
			"grouphrtr"
		},	
		--DW Taser, tries extremely hard to get up close and personal
		DW_tazer = {
			--"legday",
			"charge",
			"flash_grenade",
			"smoke_grenade",
			--"shield_cover",
			"murder",
			--"tunnel"
		},
		--DW Grenadier, even more passive and will use hitnrun
		ELITE_boom = {
			"flash_grenade",
			"smoke_grenade",
			--"harass",		
			--"elite_ranged_fire",
			"provide_coverfire",
			--"hitnrun",
			"shield_cover"
		},			
		--death wish tactics
		DW_swat_rifle = {
			"ranged_fire",
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--Will now also harrass players doing objectives/reloading/other stuff
		DW_swat_rifle_flank = { 
			"flank",
			"smoke_grenade",
			"flash_grenade",
			--"elite_ranged_fire",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",			
			--"harass",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		DW_heavy = {
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},		
		DW_heavy_flank = {
			"flank",	
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			--"harass",	
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		--slightly more passive than the other dozers will stand his ground if charged
		SKULL_tank = { 
			--"reloadingretreat",
			"ranged_fire",
			"murder",
			--"tunnel",
			--"harass",
			"shield"
		},
		--set up to use passive suppressive fire against players :)
		TIT_tank = {
			--"obstacle",
			--"hitnrun",
			--"reloadingretreat",
			--"spoocavoidance",
			"murder",
			--"elite_ranged_fire",
			--"harass"
		},
			
		--mean DS tactics below
		ELITE_suit_stealth = { --sneaky as fuck
			"flank",
			"smoke_grenade",
			"flash_grenade",
			--"hunter",
			--"legday",
			--"reloadingretreat",
			--"spoocavoidance",
			"provide_coverfire",
			"provide_support",
			--"hitnrun",
			"grouphrtr"
		},
		ELITE_swat_rifle = {
			"ranged_fire",	
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			--"harass",
			"provide_support",
			--"shield_cover",
			"groupcsr"
		},
		ELITE_swat_shotgun = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			--"harass",
			"provide_coverfire",
			--"shield_cover",
			"provide_support",
			"groupcsr"
		},		
		ELITE_heavy = { 
			"smoke_grenade",
			"flash_grenade",
			--"harass",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},
		ELITE_heavy_shotgun = { 
			"smoke_grenade",
			"flash_grenade",
			--"harass",
			"charge",
			"provide_coverfire",
			"provide_support",
			--"shield_cover",
			"deathguard",
			"groupcsr"
		},		
		ELITE_swat_rifle_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			--"elite_ranged_fire",
			--"harass",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		ELITE_heavy_flank = { 
			"flank",
			"smoke_grenade",
			"flash_grenade",
			--"harass",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		ELITE_heavy_shotgun_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			--"harass",	
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},				
		
		--Captains
		Cap_spring = {
			"shield",
			"charge"
		},
		HVH_boss = {
			"shield",
			"charge"
		},		
		Cap_summers_minion = {
			--"elite_ranged_fire",
			--"hitnrun",
			"shield_cover"
		},	
		Cap_summers = {
			"charge"
		},
		Cap_autumn = {
			"flank",
			--"hunter",
			--"spoocavoidance",
			--"shield_cover",
			"smoke_grenade",
			"provide_coverfire",
			"provide_support",
			"flash_grenade",
			--"hitnrun"
		},
		Cap_winters = {
			"shield",
			"charge"
		},	
		Cap_winters_minion = {
			"shield",
			"charge"
		},	
		Cap_winters_minion_sniper = {
			--"harass",	
			--"elite_ranged_fire",
			"provide_coverfire",
			"provide_support",
		},		
		--Old Winters
		Phalanx_minion = {
			--"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		Phalanx_vip = {
			--"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		}
	}
	self.enemy_spawn_groups = {}
	self.enemy_spawn_groups.CS_defend_a = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.CS_defend,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_defend,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_defend,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_cops = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_MP5",
				freq = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			},
			{
				unit = "CS_cop_R870",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_cop_shotgun,
				rank = 2
			},
			{
				unit = "CS_cop_C45_MP5",
				freq = 0.33,
				tactics = self._tactics.CS_cop_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_stealth_a = {
		amount = {2, 3},
		spawn = {
			{
				unit = "CS_cop_C45_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 2
			},				
			{
				unit = "CS_cop_stealth_MP5",
				freq = 1,
				amount_max = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_swats = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 1
			},
			{
				unit = "CS_swat_R870",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_swat_shotgun,
				rank = 2
			},
			{
				unit = "CS_swat_MP5",
				freq = 0.33,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_heavys = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				tactics = self._tactics.CS_swat_heavy,
				rank = 2
			},
			{
				unit = "CS_heavy_R870",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_swat_heavy_shotgun,
				rank = 1
			},
			{
				unit = "CS_heavy_M4",
				freq = 0.33,
				tactics = self._tactics.CS_swat_heavy_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_shields = {
		amount = {2, 3},
		spawn = {
			{
				unit = "CS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.CS_shield,
				rank = 3
			},
			{
				unit = "CS_cop_stealth_MP5",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			},
			{
				unit = "CS_swat_MP5",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			}
		}
	}
	if difficulty_index <= 3 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {2, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.CS_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 4 or difficulty_index == 5 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {2, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.CS_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	elseif difficulty_index == 6 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {2, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}			
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {2, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics_ = self._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "GS_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.DW_heavy,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_tazers = {
			amount = {3, 4},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics_ = self._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "GS_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.DW_heavy,
					rank = 1
				}
			}
		}			
	end
	self.enemy_spawn_groups.CS_tanks = {
		amount = {2, 3},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.CS_tank,
				rank = 2
			},
			{
				unit = "CS_heavy_M4",
				freq = 1,
				tactics = self._tactics.CS_swat_heavy,
				rank = 1
			},			
			{
				unit = "CS_tazer",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 1
			}
		}
	}	
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.FBI_Booms = {
			amount = {2, 3},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.CS_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_Booms = {
			amount = {2, 3},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}			
	end
	self.enemy_spawn_groups.FBI_defend_a = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_C45_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			},					
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			},					
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}
	self.enemy_spawn_groups.GS_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			},					
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.FBI_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}
	self.enemy_spawn_groups.GS_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.FBI_defend_d = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_heavy_G36",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}
	self.enemy_spawn_groups.GS_defend_d = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_heavy_G36",
				freq = 1,
				tactics = self._tactics.FBI_defend,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_defend,
				rank = 2
			}
		}
	}	
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},				
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},			
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},				
				{
					unit = "medic_M4",
					freq = 0.35,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 1,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},			
				{
					unit = "medic_M4",
					freq = 0.35,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_stealth_a_boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},				
				{
					unit = "boom_M4203",
					freq = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 2
				},			
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_stealth_a_boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "boom_M4203",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.ELITE_boom,
					rank = 2
				},				
				{
					unit = "medic_M4",
					freq = 0.35,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.FBI_stealth_a_boom = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "boom_M4203",
					freq = 1,
					amount_max = 1,
					tactics = self._tactics.ELITE_boom,
					rank = 1
				},			
				{
					unit = "medic_M4",
					freq = 0.35,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	end			
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				},						
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				},							
				{
					unit = "medic_M4",
					freq = 0.35,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.ELITE_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				},							
				{
					unit = "medic_M4",
					freq = 0.35,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	end
	--For lower difficulties only
	self.enemy_spawn_groups.FBI_stealth_c = {
		amount = {2, 3},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit_stealth,
				rank = 1
			},
			{
				unit = "FBI_suit_C45",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},						
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 1
			}
		}
	}	
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_swat_M4",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "FBI_swat_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 2
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	else	
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.MH_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_swat_M4",
					freq = 0.75,
					tactics = self._tactics.MH_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "FBI_swat_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_swat_shotgun,
					rank = 2
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	end
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.FBI_heavy,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_heavy_shotgun,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 1
				},				
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.MH_heavy_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_heavy_shotgun,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}		
	end
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.FBI_heavys_boom = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.FBI_heavy,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_heavy_shotgun,
					rank = 2
				},
				{
					unit = "boom_M4203",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 1
				},				
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_heavys_boom = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.MH_heavy_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_heavy_shotgun,
					rank = 2
				},
				{
					unit = "boom_M4203",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}		
	end	
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.FBI_shields = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.CS_Tazer,
					rank = 2
				},		
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_shields = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.CS_Tazer,
					rank = 2
				},		
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}	
	end
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.FBI_shields_boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 2
				},		
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_shields_boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield_flank,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 2
				},		
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}	
	end

	if difficulty_index <= 6 then
		self.enemy_spawn_groups.GREEN_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.GREEN_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then
		self.enemy_spawn_groups.GREEN_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.GREEN_tank,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.ELITE_boom,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = self._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}					
			}
		}
	else	
		self.enemy_spawn_groups.GREEN_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.GREEN_tank,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.ELITE_boom,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = self._tactics.ELITE_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}		
			}
		}
	end

	if difficulty_index <= 6 then
		self.enemy_spawn_groups.BLACK_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.BLACK_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.BLACK_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.BLACK_tank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = self._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}	
			}
		}		
	else
		self.enemy_spawn_groups.BLACK_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "BLACK_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.BLACK_tank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					tactics = self._tactics.ELITE_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}		
			}
		}
	end

	if difficulty_index <= 6 then
		self.enemy_spawn_groups.SKULL_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.SKULL_tank,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.SKULL_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.SKULL_tank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_M4",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}		
	else
		self.enemy_spawn_groups.SKULL_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "SKULL_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.SKULL_tank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},
				{
					unit = "GS_swat_R870",
					freq = 1,
					amount_max = 3,
					tactics = self._tactics.ELITE_swat_shotgun,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}	
			}
		}
	end
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.TIT_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.TIT_tank,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_heavy,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.TIT_tanks = {
			amount = {2, 3},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.TIT_tank,
					rank = 3
				},
				{
					unit = "GS_heavy_G36_w",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 2,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}		
	else
		self.enemy_spawn_groups.TIT_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "TIT_tank",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.TIT_tank,
					rank = 3
				},
				{
					unit = "GS_heavy_R870",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.ELITE_heavy_shotgun,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.75,
					amount_max = 2,
					tactics = self._tactics.FBI_medic_flank,
					rank = 2
				}
			}
		}
	end	
	
	--GS/Zeal Light SWATs
	if difficulty_index <= 6 then	
		self.enemy_spawn_groups.GS_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "GS_swat_M4",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.MH_swat_rifle,
					rank = 1
				},
				{
					unit = "GS_swat_M4",
					freq = 0.75,
					tactics = self._tactics.MH_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "GS_swat_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_swat_shotgun,
					rank = 2
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.GS_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "GS_swat_M4",
					freq = 1,
					amount_min = 2,
					tactics = self._tactics.DW_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 1,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "GS_swat_M4",
					freq = 0.75,
					tactics = self._tactics.DW_swat_rifle_flank,
					rank = 3
				},				
				{
					unit = "GS_swat_R870",
					amount_min = 0,
					amount_max = 2,
					freq = 1,
					tactics = self._tactics.MH_swat_shotgun,
					rank = 2
				},
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.GS_swats = {
			amount = {4, 5},
			spawn = {
				{
					unit = "GS_swat_M4",
					freq = 1,
					amount_min = 2,
					tactics = self._tactics.ELITE_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 1,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},		
				{
					unit = "GS_swat_M4",
					freq = 0.75,
					tactics = self._tactics.ELITE_swat_rifle_flank,
					rank = 3
				},				
				{
					unit = "GS_swat_R870",
					amount_min = 1,
					amount_max = 2,
					freq = 1,
					tactics = self._tactics.ELITE_swat_shotgun,
					rank = 2
				},
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	end		
	
	--GS/Zeal Heavys
	if difficulty_index <= 6 then	
		self.enemy_spawn_groups.GS_Heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "GS_heavy_G36",
					freq = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "GS_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.MH_heavy_flank,
					rank = 3
				},
				{
					unit = "GS_heavy_R870",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_heavy_shotgun,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}			
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.GS_Heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "GS_heavy_G36_w",
					freq = 1,
					amount_min = 2,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "GS_swat_M4",
					freq = 0.75,
					tactics = self._tactics.DW_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "GS_heavy_R870",
					amount_min = 0,
					amount_max = 2,
					freq = 1,
					tactics = self._tactics.FBI_heavy_shotgun,
					rank = 2
				},						
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.GS_Heavys = {
			amount = {4, 5},
			spawn = {
				{
					unit = "GS_heavy_G36_w",
					freq = 1,
					amount_min = 2,
					tactics = self._tactics.ELITE_heavy,
					rank = 1
				},
				{
					unit = "GS_swat_M4",
					freq = 0.75,
					tactics = self._tactics.ELITE_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "GS_heavy_R870",
					amount_min = 1,
					amount_max = 2,
					freq = 1,
					tactics = self._tactics.ELITE_heavy_shotgun,
					rank = 2
				},						
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic,
					rank = 1
				}
			}
		}
	end	
	--GS Heavies with Grenadier spawns, Mayhem only
	self.enemy_spawn_groups.GS_heavys_boom = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_heavy_G36",
				freq = 1,
				tactics = self._tactics.MH_heavy,
				rank = 1
			},
			{
				unit = "GS_heavy_G36",
				freq = 0.75,
				tactics = self._tactics.MH_heavy_flank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.FBI_heavy_shotgun,
				rank = 2
			},
			{
				unit = "boom_M4203",
				freq = 0.25,
				amount_max = 1,
				tactics = self._tactics.FBI_Boom,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.2,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}			
	
	--GS/Zeal Shields
	if difficulty_index <= 6 then
		self.enemy_spawn_groups.GS_shields = {
			amount = {2, 3},
			spawn = {
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.CS_Tazer,
					rank = 2
				},		
				{
					unit = "GS_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.GS_shields = {
			amount = {2, 3},
			spawn = {
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 1,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 2,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},				
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.GS_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 1,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 2,
					tactics = self._tactics.DW_tazer,
					rank = 2
				},			
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	end	
	--GS/Zeal Shields, can spawn with Grenadier 
	if difficulty_index <= 6 then	
		self.enemy_spawn_groups.GS_shields_boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield_flank,
					rank = 3
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.FBI_Boom,
					rank = 2
				},		
				{
					unit = "GS_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.MH_heavy,
					rank = 1
				},
				{
					unit = "medic_M4",
					freq = 0.2,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	elseif difficulty_index == 7 then	
		self.enemy_spawn_groups.GS_shields_boom = {
			amount = {2, 3},
			spawn = {
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield_flank,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 1,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 2,
					tactics = self._tactics.ELITE_boom,
					rank = 2
				},				
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}		
	else
		self.enemy_spawn_groups.GS_shields_boom = {
			amount = {3, 4},
			spawn = {
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield_flank,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.HRT_attack,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 1,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "boom_M4203",
					freq = 0.75,
					amount_max = 2,
					tactics = self._tactics.ELITE_boom,
					rank = 2
				},			
				{
					unit = "medic_M4",
					freq = 0.6,
					amount_min = 0,
					amount_max = 1,
					tactics = self._tactics.FBI_medic_flank,
					rank = 1
				}
			}
		}
	end		
	
	--GenSec/Zeal Tier Grenadier Squads
	if difficulty_index <= 7 then
		self.enemy_spawn_groups.GS_Booms = {
			amount = {2, 3},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics_ = self._tactics.ELITE_boom,
					rank = 2
				},
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "GS_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.MH_heavy,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.GS_Booms = {
			amount = {3, 4},
			spawn = {
				{
					unit = "boom_M4203",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics_ = self._tactics.ELITE_boom,
					rank = 2
				},
				{
					unit = "GS_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.MH_shield,
					rank = 3
				},
				{
					unit = "GS_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.ELITE_heavy,
					rank = 1
				}
			}
		}			
	end		
	
	--(Old) Winters
	self.enemy_spawn_groups.Phalanx = {
		amount = {
			self.phalanx.minions.amount + 1,
			self.phalanx.minions.amount + 1
		},
		spawn = {
			{
				unit = "Phalanx_vip",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Phalanx_vip,
				rank = 2
			},
			{
				unit = "Phalanx_minion",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.Phalanx_minion,
				rank = 1
			}
		}
	}
	
	--New Winters
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.Cap_Winters = {
			amount = {7, 7},
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 6,
					amount_max = 6,
					tactics = self._tactics.Cap_winters_minion,
					rank = 2
				}					
			}
		}	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		self.enemy_spawn_groups.Cap_Winters = {
			amount = {9, 9},
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 8,
					amount_max = 8,
					tactics = self._tactics.Cap_winters_minion,
					rank = 2
				}					
			}
		}				
	else
		self.enemy_spawn_groups.Cap_Winters = {
			amount = {13, 13},
			spawn = {
				{
					unit = "Phalanx_vip_new",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_winters,
					rank = 1
				},
				{
					unit = "Phalanx_minion_new",
					freq = 1,
					amount_min = 8,
					amount_max = 8,
					tactics = self._tactics.Cap_winters_minion,
					rank = 2
				},
				{
					unit = "Phalanx_sniper",
					freq = 1,
					amount_min = 4,
					amount_max = 4,
					tactics = self._tactics.Cap_winters_minion_sniper,
					rank = 2
				}	
			}
		}				
	end		
	
	--Captain Spring
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.Cap_Spring = {
			amount = {1, 1},
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_spring,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		self.enemy_spawn_groups.Cap_Spring = {
			amount = {3, 3},
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "Tank_Ben",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.Cap_spring,
					rank = 2
				}
			}
		}				
	else
		self.enemy_spawn_groups.Cap_Spring = {
			amount = {5, 5},
			spawn = {
				{
					unit = "Cap_Spring",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_spring,
					rank = 1
				},
				{
					unit = "Tank_Ben",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.Cap_spring,
					rank = 2
				},
				{
					unit = "Taser_Titan",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.CS_Tazer,
					rank = 2
				},					
			}
		}			
	end
	
	--HVH boss
	if difficulty_index <= 5 then
		self.enemy_spawn_groups.HVH_Boss = {
			amount = {1, 1},
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.HVH_boss,
					rank = 1
				}
			}
		}	
	elseif difficulty_index == 6 or difficulty_index == 7 then
		self.enemy_spawn_groups.HVH_Boss = {
			amount = {3, 3},
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.HVH_boss,
					rank = 2
				}
			}
		}				
	else
		self.enemy_spawn_groups.HVH_Boss = {
			amount = {5, 5},
			spawn = {
				{
					unit = "HVH_Boss",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.HVH_boss,
					rank = 1
				},
				{
					unit = "HVH_Boss_Headless",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.HVH_boss,
					rank = 2
				},
				{
					unit = "HVH_Boss_Spooc",
					freq = 1,
					amount_min = 2,
					amount_max = 2,
					tactics = self._tactics.HVH_boss,
					rank = 2
				},					
			}
		}			
	end	
	
	--Captain Autumn
	if difficulty_index <= 7 then
		self.enemy_spawn_groups.Cap_Autumn = {
			amount = {1, 1},
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_autumn,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.Cap_Autumn = {
			amount = {4, 4},
			spawn = {
				{
					unit = "Cap_Autumn",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.Cap_autumn,
					rank = 1
				},
				{
					unit = "Titan_Spooc",
					freq = 1,
					amount_min = 3,
					amount_max = 3,
					tactics = self._tactics.Cap_autumn,
					rank = 2
				}					
			}
		}		
	end
	
	--Captain Summers
	self.enemy_spawn_groups.Cap_Summers = {
		amount = {4, 4},
		spawn = {
			{
				unit = "Cap_Summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Cap_summers,
				rank = 4
			},
			{
				unit = "medic_summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Cap_summers_minion,
				rank = 1
			},
			{
				unit = "boom_summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Cap_summers_minion,
				rank = 1
			},
			{
				unit = "taser_summers",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.Cap_summers_minion,
				rank = 1
			}
		}
	}
	
	--Single Cloaker groups
	self.enemy_spawn_groups.single_spooc = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
	
	--Skirmish Spawngroups Below
	
	--Wave 1
	self.enemy_spawn_groups.SKM_Light_Swat_W1 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W1",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},	
			{
				unit = "SKM_FBI_suit_M4_MP5_W2",
				freq = 1,
				amount_min = 0,
				amount_max = 1,				
				tactics = self._tactics.HRT_attack,
				rank = 1
			},		
			{
				unit = "SKM_Light_SWAT_Rifle_W1",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},			
			{
				unit = "SKM_Light_SWAT_Shotgun_W1",
				amount_min = 0,
				amount_max = 1,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			}
		}
	}
	self.enemy_spawn_groups.SKM_Heavy_Swat_W1 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Heavy_SWAT_Rifle_W1",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.MH_heavy,
				rank = 1
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W1",
				amount_min = 0,
				amount_max = 1,
				freq = 1,
				tactics = self._tactics.FBI_heavy_shotgun,
				rank = 3
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Shields_W1 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKM_FBI_shield_W1",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W1",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}			
		}
	}	
	
	--Wave 2
	self.enemy_spawn_groups.SKM_Light_Swat_W2 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W1",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "SKM_FBI_suit_M4_MP5_W2",
				freq = 1,
				amount_min = 0,
				amount_max = 1,				
				tactics = self._tactics.HRT_attack,
				rank = 1
			},		
			{
				unit = "SKM_Light_SWAT_Rifle_W1",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},			
			{
				unit = "SKM_Light_SWAT_Shotgun_W1",
				amount_min = 0,
				amount_max = 1,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "SKM_medic_W2",
				freq = 0.1,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Heavy_Swat_W2 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Heavy_SWAT_Rifle_W1",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.MH_heavy,
				rank = 1
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W1",
				amount_min = 0,
				amount_max = 1,
				freq = 1,
				tactics = self._tactics.FBI_heavy_shotgun,
				rank = 3
			},					
			{
				unit = "SKM_medic_W2",
				freq = 0.1,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_W2 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKM_FBI_shield_W1",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W1",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			},		
			{
				unit = "SKM_medic_W2",
				freq = 0.1,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 1
			}			
		}
	}	
	self.enemy_spawn_groups.SKM_Tazers_W2 = {
		amount = {2, 3},
		spawn = {
			{
				unit = "SKM_Tazer_W2",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics_ = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W1",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Booms_W2 = {
		amount = {2, 3},
		spawn = {
			{
				unit = "SKM_Boom_W2",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics_ = self._tactics.FBI_Boom,
				rank = 2
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W1",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}
		}
	}		

	--Wave 3
	self.enemy_spawn_groups.SKM_Light_Swat_W3 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W3",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "SKM_FBI_suit_M4_MP5_W3",
				freq = 1,
				amount_min = 0,
				amount_max = 1,				
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "SKM_Light_SWAT_Rifle_W3",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},			
			{
				unit = "SKM_Light_SWAT_Shotgun_W3",
				amount_min = 0,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "SKM_medic_W3",
				freq = 0.2,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Heavy_Swat_W3 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.MH_heavy,
				rank = 1
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W3",
				amount_min = 0,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.FBI_heavy_shotgun,
				rank = 3
			},					
			{
				unit = "SKM_medic_W3",
				freq = 0.2,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_W3 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKM_FBI_shield_W3",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			},		
			{
				unit = "SKM_medic_W3",
				freq = 0.2,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 1
			}			
		}
	}		
	self.enemy_spawn_groups.SKM_Tazers_W3 = {
		amount = {2, 3},
		spawn = {
			{
				unit = "SKM_Tazer_W2",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Booms_W3 = {
		amount = {2, 3},
		spawn = {
			{
				unit = "SKM_Boom_W2",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.FBI_Boom,
				rank = 2
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_HRTs_W3 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKM_FBI_suit_stealth_MP5_W3",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "SKM_FBI_suit_M4_MP5_W3",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			}
		}
	}	
	
	--Wave 4
	self.enemy_spawn_groups.SKM_Light_Swat_W4 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W3",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "SKM_FBI_suit_M4_MP5_W2",
				freq = 1,
				amount_min = 0,
				amount_max = 1,				
				tactics = self._tactics.HRT_attack,
				rank = 1
			},		
			{
				unit = "SKM_Light_SWAT_Rifle_W3",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},			
			{
				unit = "SKM_Light_SWAT_Shotgun_W3",
				amount_min = 0,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "SKM_medic_W3",
				freq = 0.35,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Heavy_Swat_W4 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.MH_heavy,
				rank = 1
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W3",
				amount_min = 0,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.FBI_heavy_shotgun,
				rank = 3
			},					
			{
				unit = "SKM_medic_W3",
				freq = 0.35,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_W4 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKM_FBI_shield_W3",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			},		
			{
				unit = "SKM_medic_W3",
				freq = 0.35,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 1
			}			
		}
	}		
	self.enemy_spawn_groups.SKM_Tazers_W4 = {
		amount = {2, 3},
		spawn = {
			{
				unit = "SKM_Tazer_W2",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Booms_W4 = {
		amount = {2, 3},
		spawn = {
			{
				unit = "SKM_Boom_W2",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.FBI_Boom,
				rank = 2
			},
			{
				unit = "SKM_Heavy_SWAT_Rifle_W3",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.FBI_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_HRTs_W4 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKM_FBI_suit_stealth_MP5_W3",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "SKM_FBI_suit_M4_MP5_W2",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			}
		}
	}		
	self.enemy_spawn_groups.SKM_BLACK_Tank_W4 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "BLACK_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.BLACK_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "SKM_Light_SWAT_Rifle_W3",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.25,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	
	--Wave 5
	self.enemy_spawn_groups.SKM_Light_Swat_W5 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_swat_M4",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},		
			{
				unit = "GS_swat_M4",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},			
			{
				unit = "GS_swat_R870",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "medic_M4",
				freq = 0.5,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Heavy_Swat_W5 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_heavy_G36_w",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			},
			{
				unit = "GS_swat_M4",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 2
			},						
			{
				unit = "medic_M4",
				freq = 0.5,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_W5 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit_stealth,
				rank = 1
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.5,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Tazers_W5 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_tazer",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.DW_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_Booms_W5 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "boom_M4203",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			}
		}
	}		
	self.enemy_spawn_groups.SKM_HRTs_W5 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},							
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}		
	self.enemy_spawn_groups.SKM_BLACK_Tank_W5 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "BLACK_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.BLACK_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}		
	self.enemy_spawn_groups.SKM_GREEN_Tank_W5 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.GREEN_tank,
				rank = 3
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_single_spooc_W5 = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}	
	
	--Wave 6, more or less just normal DS now
	self.enemy_spawn_groups.SKM_Light_Swat_W6 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_swat_M4",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "GS_swat_M4",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},				
			{
				unit = "GS_swat_R870",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Heavy_Swat_W6 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_heavy_G36_w",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			},
			{
				unit = "GS_swat_M4",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 2
			},						
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Shields_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_Booms_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield_flank,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Tazers_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_tazer",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.DW_heavy,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Booms_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "boom_M4203",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_HRTs_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},							
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_BLACK_Tank_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "BLACK_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.BLACK_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_GREEN_Tank_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.GREEN_tank,
				rank = 3
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_SKULL_Tank_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKULL_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.SKULL_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_R870",
				freq = 1,
				amount_max = 3,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}	
		}
	}	
	self.enemy_spawn_groups.SKM_TIT_Tank_W6 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "TIT_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.TIT_tank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_single_spooc_W6 = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}		
	
	--Wave 7, more or less just normal DS now WITH Bravo support
	self.enemy_spawn_groups.SKM_Light_Swat_W7 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W7",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},			
			{
				unit = "SKM_Light_SWAT_Rifle_W7",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},				
			{
				unit = "SKM_Light_SWAT_Shotgun_W7",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Heavy_Swat_W7 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_heavy_G36_w",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			},
			{
				unit = "SKM_Light_SWAT_Rifle_W7",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W7",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 2
			},						
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Shields_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_Booms_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield_flank,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Tazers_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_tazer",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.DW_heavy,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Booms_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "boom_M4203",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_HRTs_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},							
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_BLACK_Tank_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "BLACK_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.BLACK_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_GREEN_Tank_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.GREEN_tank,
				rank = 3
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_SKULL_Tank_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKULL_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.SKULL_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_R870",
				freq = 1,
				amount_max = 3,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}	
		}
	}	
	self.enemy_spawn_groups.SKM_TIT_Tank_W7 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "TIT_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.TIT_tank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_single_spooc_W7 = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}			
	
	--Wave 8, DS but only Bravos
	self.enemy_spawn_groups.SKM_Light_Swat_W8 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W8",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},	
			{
				unit = "SKM_Light_SWAT_Rifle_W8",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},				
			{
				unit = "SKM_Light_SWAT_Shotgun_W8",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Heavy_Swat_W8 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_heavy_G36_w",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			},
			{
				unit = "SKM_Light_SWAT_Rifle_W8",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W8",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 2
			},						
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Shields_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_Booms_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield_flank,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Tazers_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_tazer",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.DW_heavy,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Booms_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "boom_M4203",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_HRTs_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},							
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_BLACK_Tank_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "BLACK_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.BLACK_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_GREEN_Tank_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.GREEN_tank,
				rank = 3
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_SKULL_Tank_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKULL_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.SKULL_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_R870",
				freq = 1,
				amount_max = 3,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}	
		}
	}	
	self.enemy_spawn_groups.SKM_TIT_Tank_W8 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "TIT_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.TIT_tank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_single_spooc_W8 = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}
	
	--Wave 9
	self.enemy_spawn_groups.SKM_Light_Swat_W9 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "SKM_Light_SWAT_Rifle_W8",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},	
			{
				unit = "SKM_Light_SWAT_Rifle_W8",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},			
			{
				unit = "SKM_Light_SWAT_Shotgun_W8",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 2
			},
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Heavy_Swat_W9 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "GS_heavy_G36_w",
				freq = 1,
				amount_min = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			},
			{
				unit = "SKM_Light_SWAT_Rifle_W8",
				freq = 0.75,
				tactics = self._tactics.ELITE_swat_rifle_flank,
				rank = 3
			},
			{
				unit = "SKM_Heavy_SWAT_Shotgun_W8",
				amount_min = 1,
				amount_max = 2,
				freq = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 2
			},						
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Shields_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Shields_Booms_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield_flank,
				rank = 3
			},
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.HRT_attack,
				rank = 1
			},
			{
				unit = "spooc",
				freq = 0.15,
				amount_max = 1,
				tactics = self._tactics.spooc,
				rank = 1
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},			
			{
				unit = "medic_M4",
				freq = 0.6,
				amount_min = 0,
				amount_max = 1,
				tactics = self._tactics.FBI_medic,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_Tazers_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_tazer",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.DW_heavy,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.SKM_Booms_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "boom_M4203",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics_ = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.MH_shield,
				rank = 3
			},
			{
				unit = "GS_heavy_G36",
				freq = 1,
				amount_max = 2,
				tactics = self._tactics.ELITE_heavy,
				rank = 1
			}
		}
	}	
	self.enemy_spawn_groups.SKM_HRTs_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "FBI_suit_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_suit_stealth,
				rank = 1
			},
			{
				unit = "FBI_suit_M4_MP5",
				freq = 0.75,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},							
			{
				unit = "medic_M4",
				freq = 0.35,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_BLACK_Tank_W9 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "BLACK_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.BLACK_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.DW_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_GREEN_Tank_W9 = {
		amount = {4, 5},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.GREEN_tank,
				rank = 3
			},
			{
				unit = "boom_M4203",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.ELITE_boom,
				rank = 2
			},
			{
				unit = "GS_swat_M4",
				freq = 1,
				tactics = self._tactics.ELITE_swat_rifle,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}		
		}
	}	
	self.enemy_spawn_groups.SKM_SKULL_Tank_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "SKULL_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.SKULL_tank,
				rank = 3
			},
			{
				unit = "CS_tazer",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 2
			},
			{
				unit = "GS_swat_R870",
				freq = 1,
				amount_max = 3,
				tactics = self._tactics.ELITE_swat_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}	
		}
	}	
	self.enemy_spawn_groups.SKM_TIT_Tank_W9 = {
		amount = {3, 4},
		spawn = {
			{
				unit = "TIT_tank",
				freq = 1,
				amount_min = 1,
				amount_max = 1,
				tactics = self._tactics.TIT_tank,
				rank = 3
			},
			{
				unit = "GS_heavy_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.ELITE_heavy_shotgun,
				rank = 1
			},
			{
				unit = "medic_M4",
				freq = 0.75,
				amount_max = 2,
				tactics = self._tactics.FBI_medic_flank,
				rank = 2
			}
		}
	}	
	self.enemy_spawn_groups.SKM_single_spooc_W9 = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}	
	
	--Captains, deep_clone off of the normal ones
	self.enemy_spawn_groups.SKM_Cap_Autumn_W9 = deep_clone(self.enemy_spawn_groups.Cap_Autumn)
	self.enemy_spawn_groups.SKM_Cap_Winters_W9 = deep_clone(self.enemy_spawn_groups.Cap_Winters)
	self.enemy_spawn_groups.SKM_Cap_Summers_W9 = deep_clone(self.enemy_spawn_groups.Cap_Summers)
	self.enemy_spawn_groups.SKM_Cap_Spring_W9 = deep_clone(self.enemy_spawn_groups.Cap_Spring)
	self.enemy_spawn_groups.SKM_HVH_Boss_W9 = deep_clone(self.enemy_spawn_groups.HVH_Boss)
end

function GroupAITweakData:_init_task_data(difficulty_index, difficulty)
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.max_nr_simultaneous_boss_types = 0
	self.difficulty_curve_points = {0.5}
	self.skirmish_difficulty_curve_points = {
		--0 unused
		0.05, --wave 1
		0.1, --wave 2
		0.15, --wave 3
		0.2, --wave 4
		0.25, --wave 5
		0.3, --wave 6
		0.35, --wave 7
		0.4, --wave 8
		0.45, --wave 9
		0.5, --wave 10
		--1 eventually
	}

	if difficulty_index <= 2 then
		self.smoke_grenade_timeout = {20, 20}
		self.flash_grenade_timeout = {10, 10}
	elseif difficulty_index == 3 then
		self.smoke_grenade_timeout = {19, 19}
		self.flash_grenade_timeout = {10, 9}
	elseif difficulty_index == 4 then
		self.smoke_grenade_timeout = {18, 18}
		self.flash_grenade_timeout = {9, 9}
	elseif difficulty_index == 5 then
		self.smoke_grenade_timeout = {17, 17}
		self.flash_grenade_timeout = {9, 8}
	elseif difficulty_index == 6 or difficulty_index == 7 then
		self.smoke_grenade_timeout = {16, 16}
		self.flash_grenade_timeout = {8, 8}
	else
		self.smoke_grenade_timeout = {15, 15}
		self.flash_grenade_timeout = {8, 7}
	end
	
	self.smoke_grenade_lifetime = 12
	self.flash_grenade_lifetime = 7.5
	self.flash_grenade = {
		timer = 2.5,
		light_range = 300,
		range = 1000,
		light_specular = 1,
		beep_fade_speed = 4,
		beep_multi = 0.3,
		light_color = Vector3(255, 0, 0),
		beep_speed = {
			0.1,
			0.025
		}
	}
	if difficulty_index == 8 then
		self.flash_grenade.light_color = Vector3(255, 165, 0)
	end
	self.optimal_trade_distance = {0, 0}
	self.bain_assault_praise_limits = {1, 3}
	if difficulty_index <= 3 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {180, 180},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {60, 60}
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {150, 150},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {60, 60}
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {120, 120},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {60, 60}
			}
		}
	else
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {90, 90},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {60, 60}
			}
		}
	end
	self.besiege.regroup.duration = {
		15,
		15,
		15
	}
	self.besiege.assault = {}
	self.besiege.assault.anticipation_duration = {
		{30, 1},
		{30, 1},
		{30, 1}
	}
	self.besiege.assault.build_duration = 35
	self.besiege.assault.sustain_duration_min = {
		40,
		80,
		120
	}
	self.besiege.assault.sustain_duration_max = {
		40,
		80,
		120
	}
	self.besiege.assault.sustain_duration_balance_mul = {
		1,
		1.1,
		1.2,
		1.3
	}
	self.besiege.assault.fade_duration = 35
	self.besiege.assault.fade_settings = {
		enemies_defeated_percentage = 0.5,
		enemies_defeated_time_limit = 30,
		drama_engagement_time_limit = 30
	}
	if difficulty_index <= 2 then
		self.besiege.assault.delay = {
			80,
			70,
			30
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.delay = {
			45,
			35,
			20
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.delay = {
			40,
			30,
			20
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.delay = {
			30,
			20,
			15
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.delay = {
			30,
			20,
			15
		}
	else
		self.besiege.assault.delay = {
			20,
			15,
			10
		}
	end
	if difficulty_index <= 7 then
		self.besiege.assault.hostage_hesitation_delay = {
			30,
			30,
			30
		}
	else
		self.besiege.assault.hostage_hesitation_delay = {
			15,
			15,
			15
		}
	end

	local map_scale_factor = 1
	for _,t in pairs(restoration.large_levels) do
		if job == t then
			map_scale_factor = 1.15
		end
	end	
	for _,t in pairs(restoration.tiny_levels) do
		if job == t then
			map_scale_factor = 0.85
		end
	end
	for _,vt in pairs(restoration.very_tiny_levels) do
		if job == vt then
			map_scale_factor = 0.7
		end
	end
	for _,vt in pairs(restoration.extremely_tiny_levels) do
		if job == vt then
			map_scale_factor = 0.55
		end
	end

	self.besiege.assault.force_balance_mul = {
		0.55 * map_scale_factor,
		0.7 * map_scale_factor,
		0.85 * map_scale_factor,
		1.0 * map_scale_factor
	}
	self.besiege.assault.force_pool_balance_mul = {
		0.55 * map_scale_factor,
		0.7 * map_scale_factor,
		0.85 * map_scale_factor,
		1.0 * map_scale_factor
	}

	if difficulty_index <= 2 then
		self.besiege.assault.force = {
			12,
			15,
			18
		}
		self.besiege.assault.force_pool = {
			75,
			100,
			125
		}
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = 1,
			boom = 0,
			spooc = 0,
			shield = math.max(math.round(2 * map_scale_factor), 1),
			medic = 0,
			phalanx_vip = 0,
			spring = 0,
			headless_hatman = 0,
			autumn = 0,
			summers = 0
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.force = {
			12,
			15,
			18
		}
		self.besiege.assault.force_pool = {
			75,
			100,
			125
		}
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = math.max(math.round(2 * map_scale_factor), 1),
			boom = 0,
			spooc = 1,
			shield = math.max(math.round(3 * map_scale_factor), 1),
			medic = 0,
			phalanx_vip = 1,
			spring = 1,
			headless_hatman = 1,
			autumn = 1,
			summers = 1
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.force = {
			15,
			18,
			21
		}
		self.besiege.assault.force_pool = {
			75,
			100,
			125
		}
		self.special_unit_spawn_limits = {
			tank = math.max(math.round(2 * map_scale_factor), 1),
			taser = math.max(math.round(3 * map_scale_factor), 1),
			boom = 0,
			spooc = math.max(math.round(2 * map_scale_factor), 1),
			shield = math.max(math.round(3 * map_scale_factor), 1),
			medic = math.max(math.round(3 * map_scale_factor), 1),
			phalanx_vip = 1,
			spring = 1,
			headless_hatman = 1,
			autumn = 1,
			summers = 1
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.force = {
			15,
			18,
			21
		}
		self.besiege.assault.force_pool = {
			75,
			100,
			125
		}
		self.special_unit_spawn_limits = {
			tank = math.max(math.round(3 * map_scale_factor), 1),
			taser = math.max(math.round(4 * map_scale_factor), 1),
			boom = math.max(math.round(0 * map_scale_factor), 1),
			spooc = math.max(math.round(2 * map_scale_factor), 1),
			shield = math.max(math.round(3 * map_scale_factor), 1),
			medic = math.max(math.round(3 * map_scale_factor), 1),
			phalanx_vip = 1,
			spring = 1,
			headless_hatman = 1,
			autumn = 1,
			summers = 1
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.force = {
			17,
			21,
			25
		}
		self.besiege.assault.force_pool = {
			90,
			120,
			150
		}
		self.special_unit_spawn_limits = {
			tank = math.max(math.round(3 * map_scale_factor), 1),
			taser = math.max(math.round(4 * map_scale_factor), 1),
			boom = math.max(math.round(2 * map_scale_factor), 1),
			spooc = math.max(math.round(3 * map_scale_factor), 1),
			shield = math.max(math.round(4 * map_scale_factor), 1),
			medic = math.max(math.round(4 * map_scale_factor), 1),
			phalanx_vip = 1,
			spring = 1,
			headless_hatman = 1,
			autumn = 1,
			summers = 1
		}
	elseif difficulty_index == 7 then
		self.besiege.assault.force = {
			17,
			21,
			25
		}
		self.besiege.assault.force_pool = {
			90,
			120,
			150
		}
		self.special_unit_spawn_limits = {
			tank = math.max(math.round(3 * map_scale_factor), 1),
			taser = math.max(math.round(4 * map_scale_factor), 1),
			boom = math.max(math.round(2 * map_scale_factor), 1),
			spooc = math.max(math.round(4 * map_scale_factor), 1),
			shield = math.max(math.round(4 * map_scale_factor), 1),
			medic = math.max(math.round(4 * map_scale_factor), 1),
			phalanx_vip = 1,
			spring = 1,
			headless_hatman = 1,
			autumn = 1,
			summers = 1
		}
	else
		self.besiege.assault.force = {
			20,
			24,
			28
		}
		self.besiege.assault.force_pool = {
			105,
			140,
			175
		}
		self.special_unit_spawn_limits = {
			tank = math.max(math.round(3 * map_scale_factor), 1),
			taser = math.max(math.round(4 * map_scale_factor), 1),
			boom = math.max(math.round(2 * map_scale_factor), 1),
			spooc = math.max(math.round(4 * map_scale_factor), 1),
			shield = math.max(math.round(4 * map_scale_factor), 1),
			medic = math.max(math.round(4 * map_scale_factor), 1),
			phalanx_vip = 1,
			spring = 1,
			headless_hatman = 1,
			autumn = 1,
			summers = 1
		}
	end
	
	--Assault groups
	if difficulty_index <= 2 then
		self.besiege.assault.groups = {
			CS_cops = {
				0.85,
				0.6,
				0.45
			},
			CS_swats = {
				0.15,
				0.35,
				0.4
			},
			CS_shields = {
				0,
				0.05,
				0.15
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.groups = {
			--Will participate in first assault, then pull out
			CS_cops = {
				0.4,
				0,
				0		
			},
			CS_swats = {
				0.45,
				0.5,
				0.37
			},
			CS_heavys = {
				0.05,
				0.2,
				0.3
			},
			CS_shields = {
				0.1,
				0.135,
				0.15
			},
			CS_tazers = {
				0,
				0.1,
				0.1
			},
			FBI_spoocs = {
				0,
				0.05,
				0.05
			},
			CS_tanks = {
				0,
				0.015,
				0.03
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.groups = {
			--Assist FBI SWATs for a short while, pull out by the last diff increase
			CS_swats = {
				0.44,
				0.22,
				0
			},		
			CS_heavys = {
				0.32,
				0.13,
				0
			},
			FBI_swats = {
				0,
				0.22,
				0.41
			},
			FBI_heavys = {
				0,
				0.13,
				0.25
			},		
			--Ditto
			CS_shields = {
				0.14,
				0.07,
				0
			},
			FBI_shields = {
				0,
				0.07,
				0.14
			},			
			GREEN_tanks = {
				0,
				0.02,
				0.04
			},
			FBI_spoocs = {
				0,
				0.04,
				0.06
			},
			CS_tazers = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.2,
				0.36,
				0.35
			},
			--Only here just for the first few assaults, pull out ASAP
			CS_swats = {
				0.2,
				0,
				0
			},		
			CS_heavys = {
				0.14,
				0,
				0
			},			
			FBI_heavys = {
				0.14,
				0.25,
				0.22
			},
			FBI_heavys_boom = {
				0.04,
				0.03,
				0.02
			},			
			FBI_shields = {
				0.14,
				0.14,
				0.14
			},
			FBI_shields_boom = {
				0.01,
				0.03,
				0.05
			},	
			--[[
			--Base array to consider working with
			GREEN_tanks = {
				0,
				0.02,
				0.04
			},			
			]]--
			GREEN_tanks = {
				0,
				0.01,
				0.02
			},
			BLACK_tanks = {
				0,
				0.01,
				0.02
			},			
			FBI_spoocs = {
				0,
				0.05,
				0.07
			},				
			CS_tazers = {
				0.08,
				0.08,
				0.08,
			},
			FBI_Booms = {
				0.05,
				0.04,
				0.03
			}			
		}	
	elseif difficulty_index == 6 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.4,
				0.18,
				0
			},
			--Slowly get replaced by GenSec boys
			GS_swats = {
				0,
				0.18,
				0.35
			},		
			FBI_heavys = {
				0.28,
				0.125,
				0
			},
			--Slowly get replaced by GenSec boys
			GS_heavys = {
				0,
				0.125,
				0.22
			},			
			FBI_heavys_boom = {
				0.04,
				0.015,
				0
			},	
			--Slowly get replaced by GenSec boys
			GS_heavys_boom = {
				0,
				0.015,
				0.02
			},			
			FBI_shields = {
				0.14,
				0.07,
				0
			},
			--Slowly get replaced by GenSec boys
			GS_shields = {
				0,
				0.07,
				0.14
			},			
			FBI_shields_boom = {
				0.01,
				0.015,
				0
			},	
			--Slowly get replaced by GenSec boys
			GS_shields_boom = {
				0,
				0.015,
				0.05
			},				
			--[[
			--Base array to consider working with
			GREEN_tanks = {
				0,
				0.02,
				0.04
			},			
			]]--
			GREEN_tanks = {
				0,
				0.0095,
				0.019
			},
			BLACK_tanks = {
				0,
				0.0095,
				0.019
			},		
			TIT_tanks = {
				0,
				0.001,
				0.002
			},				
			FBI_spoocs = {
				0,
				0.05,
				0.07
			},				
			CS_tazers = {
				0.08,
				0.08,
				0.08,
			},
			FBI_Booms = {
				0.05,
				0.04,
				0.03
			}			
		}				
	elseif difficulty_index == 7 then
		self.besiege.assault.groups = {
			GS_swats = {
				0.4,
				0.36,
				0.35
			},
			GS_Heavys = {
				0.2515,
				0.202,
				0.1825
			},			
			GS_shields = {
				0.14,
				0.14,
				0.14
			},
			GS_shields_boom = {
				0.02,
				0.04,
				0.06
			},	
			--[[
			--Baseline numbers to think about, work from this as an array for determining dozer types
			GREEN_tanks = {
				0.0285,
				0.038,
				0.0475
			},			
			]]--			
			GREEN_tanks = {
				0.009,
				0.012,
				0.015
			},
			BLACK_tanks = {
				0.009,
				0.012,
				0.015
			},
			SKULL_tanks = {
				0.009,
				0.012,
				0.015
			},
			TIT_tanks = {
				0.0015,
				0.002,
				0.0025
			},					
			CS_tazers = {
				0.1,
				0.1,
				0.1
			},
			GS_Booms = {
				0.06,
				0.04,
				0.02
			},			
			FBI_spoocs = {
				0,
				0.08,
				0.1
			}
		}
	else
		self.besiege.assault.groups = {
			GS_swats = {
				0.4,
				0.36,
				0.35
			},
			GS_Heavys = {
				0.25,
				0.2,
				0.18
			},			
			GS_shields = {
				0.14,
				0.14,
				0.14
			},
			GS_shields_boom = {
				0.02,
				0.04,
				0.06
			},
			GREEN_tanks = {
				0.009,
				0.012,
				0.015
			},
			BLACK_tanks = {
				0.009,
				0.012,
				0.015
			},
			SKULL_tanks = {
				0.009,
				0.012,
				0.015
			},
			TIT_tanks = {
				0.003,
				0.004,
				0.005
			},					
			CS_tazers = {
				0.1,
				0.1,
				0.1
			},
			GS_Booms = {
				0.06,
				0.04,
				0.02
			},			
			FBI_spoocs = {
				0,
				0.08,
				0.1
			}
		}
	end
			
	self.besiege.assault.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.Phalanx = {
		0,
		0,
		0
	}
	--Captain Autumn stuff here--
	for _,v in pairs(restoration.captain_stelf) do
		if job == v then
			if difficulty_index <= 3 then
				self.besiege.assault.groups.Cap_Autumn = {
					0,
					0,
					0
				}
			elseif difficulty_index == 4 then
				self.besiege.assault.groups.Cap_Autumn = {
					0,
					0.1,
					0.2
				}
			elseif difficulty_index == 5 then
				self.besiege.assault.groups.Cap_Autumn = {
					0,
					0.1,
					0.2
				}
			else
				self.besiege.assault.groups.Cap_Autumn = {
					0,
					0.1,
					0.2
				}
			end
			break
		end
	end		
	--Captain Summers stuff here--
	for _,v in pairs(restoration.captain_teamwork) do
		if job == v then
			if difficulty_index <= 3 then
				self.besiege.assault.groups.Cap_Summers = {
					0,
					0,
					0
				}
			elseif difficulty_index == 4 then
				self.besiege.assault.groups.Cap_Summers = {
					0,
					0.1,
					0.2
				}
			elseif difficulty_index == 5 then
				self.besiege.assault.groups.Cap_Summers = {
					0,
					0.1,
					0.2
				}
			else
				self.besiege.assault.groups.Cap_Summers = {
					0,
					0.1,
					0.2
				}
			end
			break
		end
	end
	--Captain Spring stuff here--
	for _,v in pairs(restoration.captain_murderdozer) do
		if job == v then
			if difficulty_index <= 3 then
				self.besiege.assault.groups.Cap_Spring = {
					0,
					0,
					0
				}
			elseif difficulty_index == 4 then
				self.besiege.assault.groups.Cap_Spring = {
					0,
					0.1,
					0.2
				}
			elseif difficulty_index == 5 then
				self.besiege.assault.groups.Cap_Spring = {
					0,
					0.1,
					0.2
				}
			else
				self.besiege.assault.groups.Cap_Spring = {
					0,
					0.1,
					0.2
				}
			end
			break
		end
	end
	--HVH Boss stuff--
	for _,v in pairs(restoration.what_a_horrible_heist_to_have_a_curse) do
		if job == v then
			if difficulty_index <= 3 then
				self.besiege.assault.groups.HVH_Boss = {
					0,
					0,
					0
				}
			elseif difficulty_index == 4 then
				self.besiege.assault.groups.HVH_Boss = {
					0,
					0.1,
					0.2
				}
			elseif difficulty_index == 5 then
				self.besiege.assault.groups.HVH_Boss = {
					0,
					0.1,
					0.2
				}
			else
				self.besiege.assault.groups.HVH_Boss = {
					0,
					0.1,
					0.2
				}
			end
			break
		end
	end	
	--Captain Winters stuff here--
	for _,v in pairs(restoration.captain_camper) do
		if job == v then
			if difficulty_index <= 3 then
				self.besiege.assault.groups.Cap_Winters = {
					0,
					0,
					0
				}
			elseif difficulty_index == 4 then
				self.besiege.assault.groups.Cap_Winters = {
					0,
					0.1,
					0.2
				}
			elseif difficulty_index == 5 then
				self.besiege.assault.groups.Cap_Winters = {
					0,
					0.1,
					0.2
				}
			else
				self.besiege.assault.groups.Cap_Winters = {
					0,
					0.1,
					0.2
				}
			end
			break
		end
	end		
	self.besiege.reenforce.interval = {
		10,
		20,
		30
	}
	if difficulty_index <= 2 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0.2,
				0
			},
			CS_defend_b = {
				0,
				0.8,
				1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.35,
				0,
				0
			},
			CS_defend_b = {
				0.65,
				1,
				0
			},
			CS_defend_c = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.35,
				0,
				0
			},
			CS_defend_b = {
				0.65,
				0.5,
				0
			},
			CS_defend_c = {
				0,
				0,
				0.5
			},
			FBI_defend_a = {
				0,
				0.5,
				0
			},
			FBI_defend_b = {
				0,
				0,
				0.5
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			FBI_defend_b = {
				0.9,
				0.5,
				0
			},
			FBI_defend_c = {
				0,
				0.5,
				0
			},
			FBI_defend_d = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 6 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			FBI_defend_b = {
				0.9,
				0.5,
				0
			},
			FBI_defend_c = {
				0,
				0.5,
				0
			},
			FBI_defend_d = {
				0,
				0,
				1
			}
		}	
	else
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			GS_defend_b = {
				0.9,
				0.5,
				0
			},
			GS_defend_c = {
				0,
				0.5,
				0
			},
			GS_defend_d = {
				0,
				0,
				1
			}
		}
	end
	self.besiege.recon.interval = {
		5,
		5,
		5
	}
	self.besiege.recon.interval_variation = 40
	self.besiege.recon.force = {
		2,
		4,
		6
	}
	if difficulty_index <= 2 then
		self.besiege.recon.groups = {
			CS_stealth_a = {
				1,
				0.5,
				0
			},
			CS_cops = {
				0,
				0.5,
				1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recon.groups = {
			CS_stealth_a = {
				1,
				0.4,
				0
			},
			CS_tazers = {
				0,
				0.1,
				0.15
			},
			FBI_stealth_a = {
				0,
				0.25,
				0.35
			},
			FBI_stealth_c = {
				0,
				0.25,
				0.5
			}			
		}
	elseif difficulty_index == 4 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.5,
				0.5,
				0.25
			},
			FBI_stealth_b = {
				0,
				0,
				0.5
			},
			--Show up for first few recons, slowly replaced
			FBI_stealth_c = {
				0.5,
				0.5,
				0.25
			}			
		}
	elseif difficulty_index == 5 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.4,
				0.4,
				0.3
			},
			FBI_stealth_a_boom = {
				0.267,
				0.267,
				0.2
			},			
			FBI_stealth_b = {
				0.2,
				0.2,
				0.5
			},
			--Show up for first few recons, slowly replaced
			FBI_stealth_c = {
				0.133,
				0.133,
				0
			}		
		}	
	elseif difficulty_index == 6 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.4,
				0.4,
				0.3
			},
			FBI_stealth_a_boom = {
				0.267,
				0.267,
				0.2
			},			
			FBI_stealth_b = {
				0.2,
				0.2,
				0.5
			},
			--Show up for first few recons, slowly replaced
			FBI_stealth_c = {
				0.133,
				0.133,
				0
			}		
		}	
	else
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.4,
				0.4,
				0.3
			},
			FBI_stealth_a_boom = {
				0.267,
				0.267,
				0.2
			},			
			FBI_stealth_b = {
				0.333,
				0.333,
				0.5
			}		
		}
	end
	self.besiege.recon.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.Phalanx = {
		0,
		0,
		0
	}
	self.besiege.cloaker.groups = {
		single_spooc = {
			1,
			1,
			1
		}
	}

	local captain_cooldown = 2700
	local captain_min_diff = 0.5
	local dozer_cooldown = 45

	if Global.game_settings and Global.game_settings.one_down then
		captain_cooldown = 1800
	end

	--Table to define various restrictions for how different spawn groups can appear.
	self.besiege.group_constraints = {
		Cap_Winters = {
			cooldown = captain_cooldown,
			min_diff = captain_min_diff,
			sustain_only = true
		},
		Cap_Spring = {
			cooldown = captain_cooldown,
			min_diff = captain_min_diff,
			sustain_only = true
		},
		HVH_Boss = {
			cooldown = captain_cooldown,
			min_diff = captain_min_diff,
			sustain_only = true
		},
		Cap_Summers = {
			cooldown = captain_cooldown,
			min_diff = captain_min_diff,
			sustain_only = true
		},
		Cap_Autumn = {
			cooldown = captain_cooldown / 2,
			min_diff = captain_min_diff,
			sustain_only = true
		},
		GREEN_tanks = {
			cooldown = dozer_cooldown
		},
		BLACK_tanks = {
			cooldown = dozer_cooldown
		},
		SKULL_tank = {
			cooldown = dozer_cooldown
		},
		TIT_tank = {
			cooldown = dozer_cooldown
		},
		SKM_BLACK_Tank_W4 = {
			cooldown = dozer_cooldown
		},
		SKM_BLACK_Tank_W5 = {
			cooldown = dozer_cooldown
		},
		SKM_BLACK_Tank_W6 = {
			cooldown = dozer_cooldown
		},
		SKM_BLACK_Tank_W7 = {
			cooldown = dozer_cooldown
		},
		SKM_BLACK_Tank_W8 = {
			cooldown = dozer_cooldown
		},
		SKM_BLACK_Tank_W9 = {
			cooldown = dozer_cooldown
		},
		SKM_GREEN_Tank_W5 = {
			cooldown = dozer_cooldown
		},
		SKM_GREEN_Tank_W6 = {
			cooldown = dozer_cooldown
		},
		SKM_GREEN_Tank_W7 = {
			cooldown = dozer_cooldown
		},
		SKM_GREEN_Tank_W8 = {
			cooldown = dozer_cooldown
		},
		SKM_GREEN_Tank_W9 = {
			cooldown = dozer_cooldown
		},
		SKM_SKULL_Tank_W6 = {
			cooldown = dozer_cooldown
		},
		SKM_SKULL_Tank_W7 = {
			cooldown = dozer_cooldown
		},
		SKM_SKULL_Tank_W8 = {
			cooldown = dozer_cooldown
		},
		SKM_SKULL_Tank_W9 = {
			cooldown = dozer_cooldown
		},
		SKM_TIT_Tank_W6 = {
			cooldown = dozer_cooldown
		},
		SKM_TIT_Tank_W7 = {
			cooldown = dozer_cooldown
		},
		SKM_TIT_Tank_W8 = {
			cooldown = dozer_cooldown
		},
		SKM_TIT_Tank_W9 = {
			cooldown = dozer_cooldown
		}
	}

	self.street = deep_clone(self.besiege)
	self.phalanx.minions.min_count = 0
	self.phalanx.minions.amount = 10
	self.phalanx.minions.distance = 100
	self.phalanx.vip.health_ratio_flee = 0.1
	self.phalanx.vip.force_sprint = nil
	self.phalanx.vip.assault_force_multiplier = {1}
	self.phalanx.vip.damage_reduction = {
		start = 0,
		increase = 0,
		max = 0,
		increase_intervall = 0
	}
	self.phalanx.check_spawn_intervall = 120
	self.phalanx.chance_increase_intervall = 120
	self.phalanx.spawn_chance = {
		start = 0,
		increase = 0,
		decrease = 0,
		max = 0,
		respawn_delay = 120
	}
	self.safehouse = deep_clone(self.besiege)	
end