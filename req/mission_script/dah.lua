local chance_ovk = 10
local chance_dw = 20
local pro_job = Global.game_settings and Global.game_settings.one_down
local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local hard_above = false
local cop_1 = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"
local cop_2 = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3"
local cop_3 = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4"

	if difficulty >= 3 then
		hard_above = true
	end
	
if pro_job then
	chance_ovk = chance_ovk + 5
	chance_dw = chance_dw + 5
end

local interval = {
	values = {
		interval = 30
	}
}

local spawnfix = {
	values = {
		event = "spawn"
	}
}

return {
	-- Disable outline for Ralph if he is tied
	[100461] = {
		on_executed = {
			{id = 100082, delay = 0}
		}
	},
	-- disable atrium snipers on startup
	[100000] = {
		on_executed = {
			{ id = 400077, delay = 3 },
		}
	},
	-- delay the elevator spawn
	-- trigger the 3 cloakers event
	-- enable autrium snipers
	[100429] = {
		on_executed = {
			{id = 102128, delay = 45},
			{id = 102196, delay = 10},
			{id = 400076, delay = 0}
		}
	},
	-- make the elevator do actual beep sound
	[102366] = {
		on_executed = {
			{id = 101838, remove = true},
			{id = 101837, delay = 0}
		}
	},
	-- do close elevator sound when the elevator gets closed
	[102820] = {
		on_executed = {
			{id = 101838, delay = 0}
		}
	},
	[101837] = {
		values = {
            sound_event = "elevator_doors_open"
		}
	},
	[101838] = {
		values = {
            sound_event = "elevator_doors_close",
			position = Vector3(-2525, -3625, 639.622),
			rotation = Rotation(0, 0, -0)
		}
	},
	-- replace guards in elevator with beat cops
	[100104] = {
		values = {
            enemy = cop_1,
			participate_to_group_ai = true
		}
	},
	[101787] = {
		values = {
            enemy = cop_1,
			participate_to_group_ai = true
		}
	},
	[102812] = {
		values = {
            enemy = cop_2,
			participate_to_group_ai = true
		}
	},
	[102813] = {
		values = {
            enemy = cop_2,
			participate_to_group_ai = true
		}
	},
	[102814] = {
		values = {
            enemy = cop_3,
			participate_to_group_ai = true
		}
	},
	-- spawn dozer and 2 tasers on overkill above (comes a bit later after beat cops)
	[102128] = {
		on_executed = {
			{id = 400061, delay = 40},
			{id = 400062, delay = 40},
			{id = 400063, delay = 40}
		}
	},
	[102167] = { 
		values = {
			elements = {
				102813,
				102812,
				102814,
				101787,
				100104,
				400061,
				400062,
				400063
			}
		}
	},
	-- Restore 3 cloakers event from PDTH
	-- remove 2 diff checkers, trigger it on hard and above
	[102196] = {
		values = {
			enabled = hard_above
		},
		on_executed = {
			{id = 102256, remove = true},
			{id = 102257, remove = true},
			{id = 102198, delay = 0}
		}
	},
	-- add cloakers to mission scripts
	[102199] = { 
		on_executed = {
			{id = 102203, remove = true},
			{id = 102204, remove = true},
			{id = 102205, remove = true},
			{id = 400007, delay = 0},
			{id = 400008, delay = 0.8},
			{id = 400009, delay = 1.3}
		}
	},
	[102200] = { 
		on_executed = {
			{id = 102206, remove = true},
			{id = 102207, remove = true},
			{id = 102208, remove = true},
			{id = 400004, delay = 0},
			{id = 400005, delay = 0.8},
			{id = 400006, delay = 1.3}
		}
	},
	[102201] = { 
		on_executed = {
			{id = 102211, remove = true},
			{id = 400001, delay = 0},
			{id = 400002, delay = 0.8},
			{id = 400003, delay = 1.3}
		}
	},
	--spawn roof access blockades when CFO has been found (that respawn after 45 seconds of getting killed)
	--spawn dozer and 2 shields near helipad
	[100061] = { 
		on_executed = {
			{id = 400048, delay = 0},
			{id = 400049, delay = 1.4},
			{id = 400047, delay = 1.7},
			{id = 400055, delay = 0},
			{id = 400054, delay = 1.4},
			{id = 400053, delay = 1.7},
			{id = 400066, delay = 0},
			{id = 400067, delay = 0},
			{id = 400068, delay = 0}
		}
	},
	--Spawn escape sniper when the heli escape gets triggered
	[104949] = {
		on_executed = {
			{id = 400059, delay = 3}
		}
	},
	--Spawn atrium snipers when you pick up diamonds on loud
	[105129] = {
		on_executed = {
			{id = 400072, delay = 0},
			{id = 400073, delay = 3}
		}
	},
	--Get rid of cringe turret, replace with proper ambush from PDTH
	[104103] = { 
		on_executed = {
		--be gone
			{id = 102751, remove = true},
		--spawn snipers first
			{id = 400010, delay = 3},
			{id = 400011, delay = 3},
			{id = 400012, delay = 3},
			{id = 400013, delay = 3},
		--smoke bombs
			{id = 400079, delay = 9},
			{id = 400080, delay = 9.5},
			{id = 400081, delay = 10},
		--spawn SWAT squads with specials	
		--1st squad
			{id = 400023, delay = 11},
			{id = 400024, delay = 11},
			{id = 400025, delay = 11},
			{id = 400026, delay = 11},
			{id = 400027, delay = 11},
			{id = 400028, delay = 11},
			{id = 400018, delay = 11},
		--2nd squad	
			{id = 400029, delay = 18},
			{id = 400030, delay = 18},
			{id = 400031, delay = 18},
			{id = 400032, delay = 18},
			{id = 400033, delay = 18},
			{id = 400034, delay = 18},
			{id = 400019, delay = 18},
			{id = 400022, delay = 18},
		--3rd squad
			{id = 400035, delay = 30},
			{id = 400036, delay = 30},
			{id = 400037, delay = 30},
			{id = 400038, delay = 30},
			{id = 400039, delay = 30},
			{id = 400040, delay = 30},
			{id = 400020, delay = 30},
		--4th squad
			{id = 400041, delay = 38},
			{id = 400042, delay = 38},
			{id = 400043, delay = 38},
			{id = 400044, delay = 38},
			{id = 400045, delay = 38},
			{id = 400046, delay = 38},
			{id = 400021, delay = 38}
		}
	},
	-- Fixed some of the enemydummytriggers having wrong event set up
	[102739] = spawnfix,
	[102741] = spawnfix,
	[102743] = spawnfix,
	-- Increase chances to spawn red diamond if PJ is enabled
	[104079] = {
		values = {
			chance = chance_ovk
		}
	},
	[104082] = {
		values = {
			chance = chance_dw
		}
	},
	-- Slow down vault group spawns
	[100722] = interval,
	[100723] = interval,
	[104821] = interval,
	[104822] = interval
}