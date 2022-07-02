MutatorHydra.reductions = {money = 0, exp = 0}
MutatorHydra.disables_achievements = false

MutatorHydra.raw_enemy_list = {} --Disable the original table because it was all kinds of wonky

--General flow Dozer>Taser>Medic>Shield>Heavy>Light>Beat Cop/HRT (bedrock), keep weapons in mind for morphin to the lower tier

--Beat Cops
beat_cops_c45 = "units/payday2/characters/ene_cop_1/ene_cop_1"
beat_cops_mp5 = "units/payday2/characters/ene_cop_3/ene_cop_3"
beat_cops_rage = "units/payday2/characters/ene_cop_2/ene_cop_2"
beat_cops_r870 = "units/payday2/characters/ene_cop_4/ene_cop_4"

--Blue SWATs
blue_swat_rifle = "units/payday2/characters/ene_swat_1/ene_swat_1"
blue_swat_shotgun = "units/payday2/characters/ene_swat_2/ene_swat_2"

yellow_heavy_rifle = "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"
yellow_heavy_r870 = "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"

blue_shield = "units/payday2/characters/ene_shield_2/ene_shield_2"

--FBI tier
fbi_shield = "units/payday2/characters/ene_shield_1/ene_shield_1"

--Blue Rifle SWAT become Beat Cops with pistols + mp5s 
MutatorHydra.raw_enemy_list["units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_swat_1/ene_swat_1"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_swat_1/ene_swat_1"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_swat_1/ene_swat_1"] = {beat_cops_c45, beat_cops_mp5}
MutatorHydra.raw_enemy_list[blue_swat_rifle] = {beat_cops_c45, beat_cops_mp5}

--Blue Shotgun SWAT become Beat Cops with Broncos + R870s 
MutatorHydra.raw_enemy_list["units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_swat_2/ene_swat_2"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_swat_hvh_2/ene_swat_hvh_2"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_swat_2/ene_swat_2"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_swat_2/ene_swat_2"] = {beat_cops_rage, beat_cops_r870}
MutatorHydra.raw_enemy_list[blue_swat_shotgun] = {beat_cops_rage, beat_cops_r870}

--Heavy Rifle SWAT become light SWAT
MutatorHydra.raw_enemy_list["units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_1/ene_swat_heavy_hvh_1"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = {blue_swat_rifle}
MutatorHydra.raw_enemy_list[yellow_heavy_rifle] = {blue_swat_rifle}

--Heavy Shotgun SWAT become light SWAT with shotguns
MutatorHydra.raw_enemy_list["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_swat_heavy_hvh_r870/ene_swat_heavy_hvh_r870"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = {blue_swat_shotgun}
MutatorHydra.raw_enemy_list[yellow_heavy_r870] = {blue_swat_rifle}

--Blue Shield becomes Yellow Heavies
MutatorHydra.raw_enemy_list["units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_shield_hvh_2/ene_shield_hvh_2"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_shield_2/ene_shield_2"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_shield_2/ene_shield_2"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"] = {yellow_heavy_rifle, yellow_heavy_r870}
MutatorHydra.raw_enemy_list[blue_shield] = {yellow_heavy_rifle, yellow_heavy_r870}

--Taser becomes either Blue or FBI shields
MutatorHydra.raw_enemy_list["units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"] = {blue_shield, fbi_shield}
MutatorHydra.raw_enemy_list["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"] = {blue_shield, fbi_shield}
MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"] = {blue_shield, fbi_shield}
MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"] = {blue_shield, fbi_shield}
MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"] = {blue_shield, fbi_shield}
MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"] = {blue_shield, fbi_shield}
MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"] = {blue_shield, fbi_shield}