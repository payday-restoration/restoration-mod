-- This table is for humans, edit this one
-- First item is the unit to be replaced, second is the replacement unit that should spawn instead
-- Separated by unit type first, and then by faction in the same order as GroupAITweakData unit categories
local replacement_table = {
	-- Low difficulty Greendozers ("hard" suffix) turn into Blackdozers rather than Bravodozers
	-- America/Default
	["units/payday2/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_mod_reapers/characters/ene_bulldozer_2/ene_bulldozer_2",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870_hard/ene_murky_fbi_tank_r870_hard"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_dlc_bex/characters/ene_bulldozer_2/ene_bulldozer_2",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_bulldozer_1_hard/ene_bulldozer_1_hard"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",

	-- Standard Greendozers turn into Bravodozers
	-- America/Default
	["units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
	["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_reapers/characters/ene_bulldozer_mini/ene_bulldozer_mini",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
	["units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870"] = "units/pd2_mod_omnia/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_dlc_bex/characters/ene_bulldozer_minigun/ene_bulldozer_minigun",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_bravo/characters/ene_bravo_bulldozer/ene_bravo_bulldozer",

	-- Cops turn into FBI agents
	-- America/Default
	["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
	["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
	["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
	["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_reapers/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_mod_reapers/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_reapers/characters/ene_akan_veteran_1/ene_akan_veteran_1",
	["units/pd2_mod_reapers/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_reapers/characters/ene_fbi_2/ene_fbi_2",
	["units/pd2_mod_reapers/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_reapers/characters/ene_fbi_3/ene_fbi_3",
	-- Zombies
	["units/pd2_dlc_hvh/characters/ene_cop_hvh_1/ene_cop_hvh_1"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_1/ene_fbi_hvh_1",
	["units/pd2_dlc_hvh/characters/ene_cop_hvh_2/ene_cop_hvh_2"] = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1",
	["units/pd2_dlc_hvh/characters/ene_cop_hvh_3/ene_cop_hvh_3"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2",
	["units/pd2_dlc_hvh/characters/ene_cop_hvh_4/ene_cop_hvh_4"] = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45"] = "units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull"] = "units/pd2_mod_sharks/characters/ene_murky_veteran_2/ene_murky_veteran_2",
	["units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"] = "units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
	["units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_policia_01/ene_policia_01"] = "units/pd2_dlc_bex/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_dlc_bex/characters/ene_policia_02/ene_policia_02"] = "units/pd2_dlc_bex/characters/ene_veteran_enrique_2/ene_veteran_enrique_2",
	["units/pd2_dlc_bex/characters/ene_policia_03/ene_policia_03"] = "units/pd2_dlc_bex/characters/ene_fbi_2/ene_fbi_2",
	["units/pd2_dlc_bex/characters/ene_policia_04/ene_policia_04"] = "units/pd2_dlc_bex/characters/ene_fbi_3/ene_fbi_3",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
	["units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
	["units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
	-- LAPD
	["units/pd2_mod_lapd/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_mod_lapd/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
	["units/pd2_mod_lapd/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
	["units/pd2_mod_lapd/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
	-- San Francisco
	["units/pd2_dlc_chas/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_dlc_chas/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
	["units/pd2_dlc_chas/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
	["units/pd2_dlc_chas/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
	-- Texas rangers
	["units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1"] = "units/payday2/characters/ene_fbi_1/ene_fbi_1",
	["units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2"] = {
		nypd = "units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2",
		lapd = "units/pd2_mod_lapd/characters/ene_lapd_veteran_cop_2/ene_lapd_veteran_cop_2",
		-- default = "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2",
	},
	["units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3"] = {
		nypd = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		lapd = "units/pd2_mod_lapd/characters/ene_fbi_2/ene_fbi_2",
		default = "units/payday2/characters/ene_fbi_2/ene_fbi_2",
	},
	["units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"] = {
		nypd = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		lapd = "units/pd2_mod_lapd/characters/ene_fbi_3/ene_fbi_3",
		default = "units/payday2/characters/ene_fbi_3/ene_fbi_3",
	},

	-- Blue SWAT turn into FBI SWAT
	-- America/Default
	["units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"] = "units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc",
	["units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"] = "units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc",
	["units/payday2/characters/ene_swat_3/ene_swat_3"] = "units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	["units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	["units/pd2_mod_reapers/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	["units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	["units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	["units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	["units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	["units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	["units/pd2_dlc_bex/characters/ene_swat_3/ene_swat_3"] = "units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	["units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
	-- LAPD
	["units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	["units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	["units/pd2_mod_lapd/characters/ene_swat_3/ene_swat_3"] = "units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3",

	-- Yellow heavies turn into FBI heavies
	-- America/Default
	["units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"] = "units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
	["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	["units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
	["units/pd2_mod_halloween/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	["units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	["units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
	-- LAPD
	["units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	["units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",

	-- SWAT Shields turn into FBI Shields
	-- America/Default
	["units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"] = "units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"] = "units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
	-- LAPD
	["units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",

	-- FBI/GenSec/ZEAL SWAT turn into Bravo SWAT
	-- Murky UMP SWAT turn into OMNIA UMP SWAT instead, they're at the bottom of this table
	-- America/Default
	["units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	["units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
	["units/pd2_mod_reapers/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
	["units/pd2_mod_reapers/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_ru/ene_bravo_rifle_ru",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	["units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	["units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
	["units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
	["units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_murky/ene_bravo_rifle_murky",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
	["units/pd2_dlc_bex/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
	["units/pd2_dlc_bex/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle_mex/ene_bravo_rifle_mex",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	["units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	-- LAPD
	["units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",
	["units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle",

	-- America/Default
	["units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
	["units/pd2_mod_reapers/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
	["units/pd2_mod_reapers/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
	["units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
	["units/pd2_mod_reapers/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
	["units/pd2_mod_reapers/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_ru/ene_bravo_shotgun_ru",
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
	["units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
	["units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_murky/ene_bravo_shotgun_murky",
	-- Federales
	["units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
	["units/pd2_dlc_bex/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
	["units/pd2_dlc_bex/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
	["units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
	["units/pd2_dlc_bex/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
	["units/pd2_dlc_bex/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun_mex/ene_bravo_shotgun_mex",
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	-- LAPD
	["units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",
	["units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun",

	-- Titan LMGs turn into Bravo LMGs
	-- America/Default
	["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_titan_rifle/ene_titan_rifle"] = {
		federales = "units/pd2_mod_bravo/characters/ene_bravo_lmg_mex/ene_bravo_lmg_mex",
		default = "units/pd2_mod_bravo/characters/ene_bravo_lmg_ru/ene_bravo_lmg_ru",
	},
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_titan_rifle/ene_titan_rifle"] = "units/pd2_mod_bravo/characters/ene_bravo_lmg_murky/ene_bravo_lmg_murky",

	-- Titan Snipers turn into Bravo Snipers
	-- America/Default
	["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
	["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_1/ene_male_marshal_marksman_1"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
	["units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
	-- Reapers
	["units/pd2_mod_reapers/characters/ene_titan_sniper/ene_titan_sniper"] = {
		federales = "units/pd2_mod_bravo/characters/ene_bravo_dmr_mex/ene_bravo_dmr_mex",
		default = "units/pd2_mod_bravo/characters/ene_bravo_dmr_ru/ene_bravo_dmr_ru",
	},
	-- Zombies
	["units/pd2_mod_halloween/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr",
	-- Murkywater
	["units/pd2_mod_sharks/characters/ene_titan_sniper/ene_titan_sniper"] = "units/pd2_mod_bravo/characters/ene_bravo_dmr_murky/ene_bravo_dmr_murky",

	-- Other Murky units turn into OMNIA variants
	["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga"] = "units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2",
	["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249"] = "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3",
	["units/pd2_mod_sharks/characters/ene_murky_fbi_tank_medic/ene_murky_fbi_tank_medic"] = "units/pd2_mod_omnia/characters/ene_bulldozer_medic/ene_bulldozer_medic",
	["units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1",
	["units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2",
	["units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_omnia/characters/ene_omnia_hrt_3/ene_omnia_hrt_3",
	["units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3",
	["units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3",
	["units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3",
	["units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
	["units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
	["units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870",
	["units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870",
	["units/pd2_mod_sharks/characters/ene_titan_shotgun/ene_titan_shotgun"] = "units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun",
	["units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
	["units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
	["units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
	["units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"] = "units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser",
	["units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1"] = "units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1",
	["units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"] = "units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook",
	["units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"] = "units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic",
}

-- This table is for robots, don't edit this one
local unit_table = {}
for to_replace, replacement in pairs(replacement_table) do
	local replace_key = string.key(to_replace)
	if type(replacement) == "table" then
		unit_table[replace_key] = replacement
		for faction, fac_replace in pairs(replacement) do
			replacement[faction] = Idstring(fac_replace)
		end
	else
		unit_table[replace_key] = Idstring(replacement)
	end
end
replacement_table = nil

-- Define this here so ModifierBravos can pull the same table
Hooks:PostHook(ModifiersManager, "init", "res_init", function(self)
	self._unit_table = unit_table or {}
end)

local modify_value_original = ModifiersManager.modify_value
function ModifiersManager:modify_value(id, value, ...)
	local result = modify_value_original(self, id, value, ...)
	if id ~= "GroupAIStateBesiege:SpawningUnit" or not managers.groupai:state():should_spawn_bravos() then
		return result
	end
	local typ = type(value)
	value = typ == "string" and Idstring(value) or typ == "userdata" and value or "motherfucker"
	local bravo_data = self._unit_table[value:key()]
	if type(bravo_data) == "table" then
		return bravo_data[tweak_data.levels:get_ai_group_type()] or bravo_data.default or result
	end
	return bravo_data or result
end
