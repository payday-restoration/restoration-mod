local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local murky_amount = 2
local murkyman_1 = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"
local murkyman_2 = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"
local murkyman_3 = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"
local murky_greendozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"

	--replace murky greendozer with bendozer on DS
	if difficulty == 8 then
		murky_greendozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"
	end
	
	--increase the amount of scripted murky spawns
	if difficulty >= 5 then
		murky_amount = 5
	end	

	if difficulty <= 5 then
		ponr_value = 120
	else
		ponr_value = 90
	end
	
	--If we're in Pro Job, then do this stuff below
	--Elite Murkies start replace some regular murkies
	if pro_job and difficulty >= 5 then
		murkyman_1 = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
		murkyman_2 = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"
		murkyman_3 = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
	end
	
return {
	--Pro Job PONR 
	[104979] = {
		ponr = ponr_value
	},
	[100024] = {
		on_executed = { 
			{ id = 400046, delay = 3 }
		}
	},
	--Murky amount gets increased to 5 on PJs
	[101394] = {
		values = {
            amount = murky_amount
		}
	},
	-- Replace bulldozers with their murky counterparts
	--1st chopper, right after the ambush
	[103095] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103097] = {
		values = {
            enemy = murky_greendozer
		}
	},
	--spawn murkies at the start of 1 assault
	--spawn scripted dozers after some time
	[103477] = {
		on_executed = { 
			{ id = 400048, delay = 5 },
			{ id = 400056, delay = 30 },
			{ id = 400057, delay = 30 }
		}
	},
	--stop spawning murkies after the end of 1st assault
	[102158] = {
		on_executed = { 
			{ id = 400058, delay = 0 }
		}
	},
	--PDTH styled ambushes
	[102524] = {
		on_executed = {
		--be gone
			{id = 102442, remove = true},
		--trigger ambushes
			{id = 400052, delay = 0},
			{id = 400053, delay = 0},
			{id = 400054, delay = 0},
			{id = 400055, delay = 0}
		}
	},
	[102505] = {
		values = {
			elements = {
				400004,
				400005,
				400006
			}
		}
	},
	[102506] = { 
		values = {
			elements = {
				400001,
				400002,
				400003
			}
		}
	},
	[102511] = {
		values = {
			elements = {
				400007,
				400008,
				400009
			}
		}
	},
	[102512] = { 
		values = {
			elements = {
				400010,
				400011,
				400012
			}
		}
	},
	--spawn 3 snipers as a ambush
	--disable the slaughterhouse dozer and enable 2nd one nearby container area
	[105117] = {
		on_executed = { 
			{ id = 400013, delay = 0 },
			{ id = 400014, delay = 0 },
			{ id = 400015, delay = 0 },
			{ id = 400047, delay = 0 },
			{ id = 400045, delay = 0 }
		}
	},
	--enable van spawngroup if the 2nd van arrived
	[101656] = {
		on_executed = { 
			{ id = 400027, delay = 10 }
		}
	},
	--Force 2 SWAT vans to spawn regardless of difficulty
	[101808] = {
		values = {
            enabled = false
		}
	},
	[101807] = {
		values = {
            enabled = false
		}
	},
	[102696] = {
		values = {
            enabled = false
		}
	},
	[102697] = {
		values = {
			difficulty_normal = "true",
			difficulty_hard = "true"
		}
	},
	[103087] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103096] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[102190] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	[100621] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--2nd chopper, when the gang is in the slaughterhouse
	[103088] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103090] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[103091] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103092] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[103093] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	[103094] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--gensec van
	[101241] = {
		values = {
            enemy = murky_greendozer
		}
	},
	[101242] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"
		}
	},
	[101243] = {
		values = {
            enemy = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"
		}
	},
	--security guards
	[101375] = {
		values = {
            enemy = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"
		}
	},
	[101376] = {
		values = {
            enemy = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"
		}
	},
	--Murky Elite Soldiers replace some regular Murky Mercs on VH-DS PJs
	[103083] = {
		values = {
            enemy = murkyman_1
		}
	},
	[103084] = {
		values = {
            enemy = murkyman_1
		}
	},
	[103085] = {
		values = {
            enemy = murkyman_2
		}
	},
	[103086] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101082] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101083] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101816] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101821] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101827] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101829] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101904] = {
		values = {
            enemy = murkyman_3
		}
	},
	[101906] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101857] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101852] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101382] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101383] = {
		values = {
            enemy = murkyman_1
		}
	},
	[101385] = {
		values = {
            enemy = murkyman_2
		}
	},
	[101386] = {
		values = {
            enemy = murkyman_3
		}
	},
	--disables the Swat Turret, it's not really needed here, eh?
	[102484] = {
		values = {
            chance = 0
		}
	}
}