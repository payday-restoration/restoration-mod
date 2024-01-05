local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	--OMNIA Crewman on DS
	if difficulty_index == 8 then
		omnia_crewman_1 = "units/pd2_mod_omnia/characters/ene_omnia_crew/ene_omnia_crew"
		omnia_crewman_2 = "units/pd2_mod_omnia/characters/ene_omnia_crew_2/ene_omnia_crew_2"
		omnia_sniper_1 = "units/pd2_mod_omnia/characters/ene_omnia_sniper/ene_omnia_sniper"
		omnia_sniper_2 = "units/pd2_mod_omnia/characters/ene_omnia_sniper_2/ene_omnia_sniper_2"
	end	

return {
	--Omnia Scripted Spawns
	--Snipers
	[100584] = {
		values = {
            enemy = omnia_sniper_1
		}
	},
	[100587] = {
		values = {
            enemy = omnia_sniper_1
		}
	},
	[100604] = {
		values = {
            enemy = omnia_sniper_2
		}
	},
	[100622] = {
		values = {
            enemy = omnia_sniper_1
		}
	},
	[100618] = {
		values = {
            enemy = omnia_sniper_2
		}
	},
	[100626] = {
		values = {
            enemy = omnia_sniper_2
		}
	},
	--Guards
	[100085] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100220] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100711] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100718] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100719] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100724] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100725] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100739] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100694] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100695] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100755] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100769] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100770] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100826] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100827] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100891] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100892] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100899] = {
		values = {
            enemy = omnia_crewman_2
		}
	},
	[100903] = {
		values = {
            enemy = omnia_crewman_1
		}
	},
	[100904] = {
		values = {
            enemy = omnia_crewman_1
		}
	}
}