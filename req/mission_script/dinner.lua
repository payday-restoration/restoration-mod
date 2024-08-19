local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local murky_amount = 2
local murky_greendozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"

	--replace murky greendozer with bendozer on DS
	if difficulty == 8 then
		murky_greendozer = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli"
	end
	
	--increase the amount of scripted murky spawns
	if difficulty >= 6 then
		murky_amount = 5
	end	

	if difficulty <= 5 then
		ponr_value = 120
	else
		ponr_value = 90
	end
	
	--If we're in Pro Job, then do this stuff below
	if pro_job and difficulty >= 6 then
		murkyman_1 = "units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"
		murkyman_2 = "units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"
	end
	
return {
	--Pro Job PONR 
	[104979] = {
		ponr = ponr_value
	},
	-- Slightly slower difficulty ramp up
	[101357] = {
		values = {
			difficulty = 0.6
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
			{ id = 400046, delay = 5 },
			{ id = 400054, delay = 30 }
		}
	},
	--stop spawning murkies after the end of 1st assault
	[102158] = {
		on_executed = { 
			{ id = 400056, delay = 0 }
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
			{ id = 400055, delay = 90 },
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
	--limit scripted van dozers to 2 (just in case if it might spawn like 4 or 5 dozers)
	[101576] = {
		values = {
            trigger_times = 2
		}
	},
	[101636] = {
		values = {
            trigger_times = 2
		}
	},
	--Replace bulldozers with their murky counterparts
	--1st chopper, right after the ambush
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
	--Murky Elite Soldiers replace heli rappeling Murkies on PJ Mayhem and above
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
	[103098] = {
		values = {
            enemy = murkyman_1
		}
	},
	[103100] = {
		values = {
            enemy = murkyman_1
		}
	},
	[103101] = {
		values = {
            enemy = murkyman_2
		}
	},
	[103102] = {
		values = {
            enemy = murkyman_2
		}
	},
	--disables the Swat Turret, it's not really needed here, eh?
	[102484] = {
		values = {
            chance = 0
		}
	}
}