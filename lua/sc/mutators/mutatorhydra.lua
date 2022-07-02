MutatorHydra.reductions = {money = 0, exp = 0}
MutatorHydra.disables_achievements = false

MutatorHydra.raw_enemy_list = {} --Disable the original table because it was all kinds of wonky

--General flow Dozer>Taser>Medic>Cloaker>Shield>Heavy>Light>Beat Cop/HRT (bedrock), keep weapons in mind for morphin to the lower tier

--CS Tier
beat_cops_c45 = "units/payday2/characters/ene_cop_1/ene_cop_1"
beat_cops_mp5 = "units/payday2/characters/ene_cop_3/ene_cop_3"
beat_cops_rage = "units/payday2/characters/ene_cop_2/ene_cop_2"
beat_cops_r870 = "units/payday2/characters/ene_cop_4/ene_cop_4"

blue_swat_rifle = "units/payday2/characters/ene_swat_1/ene_swat_1"
blue_swat_shotgun = "units/payday2/characters/ene_swat_2/ene_swat_2"

yellow_heavy_rifle = "units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"
yellow_heavy_r870 = "units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"

--FBI tier
hrt_c45 = "units/payday2/characters/ene_fbi_1/ene_fbi_1"
hrt_m4 = "units/payday2/characters/ene_fbi_2/ene_fbi_2"
hrt_mp5 = "units/payday2/characters/ene_fbi_3/ene_fbi_3"

fbi_swat_rifle = "units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"
fbi_swat_r870 = "units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"

fbi_heavy_swat_rifle = "units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"
fbi_heavy_swat_r870 = "units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"

--GenSec tier
city_swat_rifle = "units/payday2/characters/ene_city_swat_1/ene_city_swat_1"
city_swat_ben = "units/payday2/characters/ene_city_swat_2/ene_city_swat_2"
city_swat_r870 = "units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"
city_swat_ump = "units/payday2/characters/ene_city_swat_3/ene_city_swat_3"

city_heavy_swat_rifle = "units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"
city_heavy_swat_r870 = "units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"

--Specials
blue_shield = "units/payday2/characters/ene_shield_2/ene_shield_2"
fbi_shield = "units/payday2/characters/ene_shield_1/ene_shield_1"
city_shield = "units/payday2/characters/ene_city_shield/ene_city_shield"

spooc = "units/payday2/characters/ene_spook_1/ene_spook_1"

medic = "units/payday2/characters/ene_medic_m4/ene_medic_m4"

taser = "units/payday2/characters/ene_tazer_1/ene_tazer_1"

green_dozer = "units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"
black_dozer = "units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"
skull_dozer = "units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"

--[[ CS Tier ]]--
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

--[[ FBI TIER]] --
	--FBI Rifle SWAT become HRTs
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_1/ene_fbi_swat_hvh_1"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list[fbi_swat_rifle] = {hrt_c45, hrt_m4, hrt_mp5}

	--FBI Shotgun SWAT become HRTs
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_fbi_swat_hvh_2/ene_fbi_swat_hvh_2"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list[fbi_swat_r870] = {hrt_c45, hrt_m4, hrt_mp5}
	
	--FBI UMP SWAT become HRTs
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = {hrt_c45, hrt_m4, hrt_mp5}	

	--FBI Heavy Rifle SWAT become light SWAT
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_1_sc/ene_fbi_heavy_hvh_1_sc"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = {fbi_swat_rifle}
	MutatorHydra.raw_enemy_list[fbi_heavy_swat_rifle] = {fbi_swat_rifle}

	--FBI Heavy Shotgun SWAT become light SWAT with shotguns
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_fbi_heavy_hvh_r870/ene_fbi_heavy_hvh_r870"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = {fbi_swat_r870}
	MutatorHydra.raw_enemy_list[fbi_heavy_swat_r870] = {fbi_swat_r870}

	--FBI Shields becomes FBI Heavies
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_shield_1/ene_shield_1"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_shield_hvh_1/ene_shield_hvh_1"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_shield_1/ene_shield_1"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}
	MutatorHydra.raw_enemy_list[fbi_shield] = {fbi_heavy_swat_rifle, fbi_heavy_swat_r870}

--[[ City Tier ]]--
	--City Shields becomes City Heavies
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_shield_gensec/ene_shield_gensec"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_city_shield/ene_city_shield"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_shield_gensec/ene_shield_gensec"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = {city_heavy_swat_rifle, city_heavy_swat_r870}
	MutatorHydra.raw_enemy_list[city_shield] = {city_heavy_swat_rifle, city_heavy_swat_r870}

--[[ Specials that aren't shields ]]--
	--Cloakers become shields
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_spook_1/ene_spook_1"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_spook_1/ene_spook_1"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_spook_hvh_1/ene_spook_hvh_1"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_spook_1/ene_spook_1"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_spook_1/ene_spook_1"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_gitgud/characters/ene_zeal_cloaker_sc/ene_zeal_cloaker_sc"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list["uunits/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook"] = {blue_shield, fbi_shield, city_shield}
	MutatorHydra.raw_enemy_list[spooc] = {blue_shield, fbi_shield, city_shield}

	--Medics become Cloakers
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_medic_mp5/ene_medic_mp5"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_mad/characters/ene_akan_medic_bob/ene_akan_medic_bob"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_medic_mp5/ene_medic_mp5"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"] = {spooc}
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_medic_mp5/ene_medic_mp5"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_mad/characters/ene_akan_medic_zdann/ene_akan_medic_zdann"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_gitgud/characters/ene_zeal_medic/ene_zeal_medic"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_mod_reapers/characters/ene_drak_medic/ene_drak_medic"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"] = {spooc}
	MutatorHydra.raw_enemy_list["units/pd2_mod_omnia/characters/ene_omnia_medic/ene_omnia_medic"] = {spooc}
	MutatorHydra.raw_enemy_list[medic] = {spooc}

	--Taser become Medics
	MutatorHydra.raw_enemy_list["units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_hvh/characters/ene_tazer_hvh_1/ene_tazer_hvh_1"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_mod_lapd/characters/ene_tazer_1/ene_tazer_1"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"] = {medic}
	MutatorHydra.raw_enemy_list["units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser"] = {medic}
	MutatorHydra.raw_enemy_list[taser] = {medic}
	
