local low_murkydozers = {
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
}
local medium_murkydozers = {
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
}
local hard_murkydozers = {
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
}
local ds_murkydozers = {
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
	"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
}
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local murky_amount = (difficulty >= 6 and 5)
local murky_greendozer = low_murkydozers
local murky_blackdozer = medium_murkydozers
local murky_skulldozer = (difficulty == 8 and ds_murkydozers) or hard_murkydozers
local disabled = {
	values = {
		enabled = false,
	},
}
local murky_dozer_green = {
	values = {
		enemy = murky_greendozer,
	},
}
local murky_dozer_black = {
	values = {
		enemy = murky_blackdozer,
	},
}
local murky_dozer_skull = {
	values = {
		enemy = murky_skulldozer,
	},
}

return {
	-- Pro Job PONR
	-- Triggers on second crane interaction
	[100750] = {
		on_executed = {
			{ id = 400063, delay = 0, },
		},
	},
	-- Murky amount gets increased to 5 on PJs
	[101394] = {
		values = {
			amount = murky_amount,
		},
	},
	-- Spawn murkies at the start of 1 assault
	-- Spawn scripted dozers after some time
	[103477] = {
		on_executed = {
			{ id = 400046, delay = 5, },
			{ id = 400054, delay = 30, },
		},
	},
	-- Stop spawning murkies after the end of 1st assault
	[102158] = {
		on_executed = {
			{ id = 400056, delay = 0, },
		},
	},
	-- PDTH styled ambushes
	[102524] = {
		on_executed = {
			{ id = 102442, remove = true, },  -- Be gone
			{ id = 400052, delay = 15, },  -- Trigger ambushes
			{ id = 400053, delay = 15, },
			{ id = 400054, delay = 15, },
			{ id = 400055, delay = 15, },
		},
	},
	-- Make new scripted units trigger door opening in the long hallway
	[102505] = {
		values = {
			elements = {
				400004,
				400005,
				400006,
			},
		},
	},
	[102506] = {
		values = {
			elements = {
				400001,
				400002,
				400003,
			},
		},
	},
	[102511] = {
		values = {
			elements = {
				400007,
				400008,
				400009,
			},
		},
	},
	[102512] = {
		values = {
			elements = {
				400010,
				400011,
				400012,
			},
		},
	},
	-- Spawn 3 snipers as a ambush
	-- Disable the slaughterhouse dozer and enable 2nd one nearby container area
	[105117] = {
		on_executed = {
			{ id = 400013, delay = 0, },
			{ id = 400014, delay = 0, },
			{ id = 400015, delay = 0, },
			{ id = 400055, delay = 90, },
			{ id = 400045, delay = 0, },
		},
	},
	-- Enable van spawngroup if the 2nd van arrived
	[101656] = {
		on_executed = {
			{ id = 400027, delay = 10, },
		},
	},
	-- Force 2 SWAT vans to spawn regardless of difficulty
	[101808] = disabled,
	[101807] = disabled,
	[102696] = disabled,
	[102697] = {
		values = {
			difficulty_normal = true,
			difficulty_hard = true,
		},
	},
	-- Limit scripted van dozers to 2 (just in case if it might spawn like 4 or 5 dozers)
	[101576] = {
		values = {
			trigger_times = 2,
		},
	},
	[101636] = {
		values = {
			trigger_times = 2,
		},
	},
	-- Replace bulldozers with their murky counterparts
	-- 1st chopper, right after the ambush
	[103095] = murky_dozer_green,
	[103097] = murky_dozer_green,
	[103087] = murky_dozer_black,
	[103096] = murky_dozer_black,
	[102190] = murky_dozer_skull,
	[100621] = murky_dozer_skull,
	-- 2nd chopper, when the gang is in the slaughterhouse
	[103088] = murky_dozer_green,
	[103090] = murky_dozer_green,
	[103091] = murky_dozer_black,
	[103092] = murky_dozer_black,
	[103093] = murky_dozer_skull,
	[103094] = murky_dozer_skull,
	-- GenSec van
	[101241] = murky_dozer_green,
	[101242] = murky_dozer_black,
	[101243] = murky_dozer_skull,
	-- genseggs security guards
	[101375] = {
		values = {
			enemy = "units/pd2_mod_nypd/characters/ene_security_1/ene_security_1",
		},
	},
	[101376] = {
		values = {
			enemy = "units/pd2_mod_nypd/characters/ene_security_2/ene_security_2",
		},
	},
	-- Disables the Swat Turret, it's not really needed here, eh?
	[102484] = {
		values = {
			chance = 0,
		},
	},
}
