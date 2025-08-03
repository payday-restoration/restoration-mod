-- Put unit names in these lists as strings, NOT Idstrings
-- Make sure there is a function
-- Do not touch prefix_garbage_for_robots below
local prefix_garbage_for_humans = {
	american_cop_filtered_list = {
		func = function(self, nr_variations)
			return "l" .. nr_variations .. "d_"
		end,
		-- US Blue SWAT
		"units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc",
		"units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc",
		"units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc",
		-- US FBI SWAT
		"units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc",
		"units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		"units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc",
		-- US GenSec
		"units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		"units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc",
		"units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc",
		"units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc",
		"units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		"units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
		-- US Zeals
		"units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		"units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2",
		"units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3",
		"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",
		"units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc",
		"units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc",
		-- NYPD Blue SWATs
		"units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		"units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		"units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		-- NYPD FBI SWATs
		"units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		"units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		"units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		-- NYPD GenSec SWATs
		"units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1",
		"units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2",
		"units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3",
		"units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		"units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870",
		"units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec",
		-- LAPD Blue SWATs
		"units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		"units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		"units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2",
		-- LAPD FBI SWATs
		"units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		"units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",
		"units/pd2_mod_lapd/characters/ene_shield_1/ene_shield_1",
		-- LAPD FBI Elites
		"units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36",
		"units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",
		"units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield",
		-- Constantine GenSec SWATs
		"units/pd2_mod_ttr/characters/ene_fbi_gensec_1/ene_fbi_gensec_1",
		"units/pd2_mod_ttr/characters/ene_fbi_gensec_2/ene_fbi_gensec_2",
		"units/pd2_mod_ttr/characters/ene_swat_gensec_shield/ene_swat_gensec_shield",
		"units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy/ene_fbi_gensec_heavy",
		"units/pd2_mod_ttr/characters/ene_fbi_gensec_heavy_r870/ene_fbi_gensec_heavy_r870",
		"units/pd2_mod_ttr/characters/ene_fbi_gensec_shield/ene_fbi_gensec_shield",
		"units/pd2_mod_ttr/characters/ene_marshal_gensec/ene_marshal_gensec",
	},
	american_cop_list = {
		func = function(self, nr_variations)
			return "l" .. nr_variations .. "n_"
		end,
		-- Murky Blue SWATs
		"units/pd2_mod_sharks/characters/ene_swat_1/ene_swat_1",
		"units/pd2_mod_sharks/characters/ene_swat_2/ene_swat_2",
		"units/pd2_mod_sharks/characters/ene_swat_3/ene_swat_3",
		"units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870",
		-- Murky FBI SWATs
		"units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		"units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		-- Murky City SWATs
		"units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2",
		-- Murky Zeal SWATs
		"units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3",
		"units/pd2_mod_sharks/characters/ene_zeal_swat_shield/ene_zeal_swat_shield",
	},
	american_taser_list = {
		func = function(self, nr_variations)
			return "tsr_"
		end,
		"units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc",
		"units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc",
		"units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser",
		"units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
	},
	american_dozer_list = {
		func = function(self, nr_variations)
			return "bdz_"
		end,
		"units/payday2/characters/ene_bulldozer_1_sc/ene_bulldozer_1_sc",
		"units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc",
		"units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc",
		"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_sc/ene_zeal_bulldozer_sc",
		"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc",
		"units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc",
		"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		"units/pd2_mod_sharks/characters/ene_murky_fbi_tank_benelli/ene_murky_fbi_tank_benelli",
	},
	-- Scary gruff filtered lines, reserve for mercs and whatnot
	l5d_list = {
		func = function(self, nr_variations)
			return "l5d_"
		end,
		"units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",
		"units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1",
		"units/pd2_mod_sharks/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		"units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
		"units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870",
		"units/pd2_mod_sharks/characters/ene_city_swat_1/ene_city_swat_1",
		"units/pd2_mod_sharks/characters/ene_city_swat_3/ene_city_swat_3",
		"units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
		"units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		"units/pd2_mod_sharks/characters/ene_murky_shield_city/ene_murky_shield_city",
		"units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city",
		"units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2",
		"units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3",
		"units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",
		"units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870",
		"units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
		"units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1",
		"units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2",
		"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy",
		"units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870",
	},
	l5n_list = {
		func = function(self, nr_variations)
			return "l5n_"
		end,
		-- Vanilla Murky guards
		"units/payday2/characters/ene_murkywater_1/ene_murkywater_1",
		"units/payday2/characters/ene_murkywater_2/ene_murkywater_2",
		"units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light",
		"units/pd2_dlc_des/characters/ene_murkywater_no_light_not_security/ene_murkywater_no_light_not_security",
		"units/pd2_dlc_des/characters/ene_murkywater_not_security_1/ene_murkywater_not_security_1",
		"units/pd2_dlc_des/characters/ene_murkywater_not_security_2/ene_murkywater_not_security_2",
		-- Murky cops
		"units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",
		"units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull",
		"units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5",
		"units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870",
		-- Murky security (they use "cop" models)
		"units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45",
		"units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull",
		"units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5",
		"units/pd2_mod_sharks/characters/ene_murky_security_r870/ene_murky_security_r870",
		-- Murky FBIs
		"units/pd2_mod_sharks/characters/ene_fbi_1/ene_fbi_1",
		"units/pd2_mod_sharks/characters/ene_fbi_2/ene_fbi_2",
		"units/pd2_mod_sharks/characters/ene_fbi_3/ene_fbi_3",
		-- OMNIA FBIs
		"units/pd2_mod_omnia/characters/ene_omnia_hrt_1/ene_omnia_hrt_1",
		"units/pd2_mod_omnia/characters/ene_omnia_hrt_2/ene_omnia_hrt_2",
		"units/pd2_mod_omnia/characters/ene_omnia_hrt_3/ene_omnia_hrt_3",
		-- OMNIA crew
		"units/pd2_mod_omnia/characters/ene_omnia_crew/ene_omnia_crew",
		"units/pd2_mod_omnia/characters/ene_omnia_crew_2/ene_omnia_crew_2",
		-- OMNIA Snipers (they use "crew" models)
		"units/pd2_mod_omnia/characters/ene_omnia_sniper/ene_omnia_sniper",
		"units/pd2_mod_omnia/characters/ene_omnia_sniper_2/ene_omnia_sniper_2",
	},
	--[[
	l5n_l3n_l2n_list = {
		func = function(self, nr_variations)
			local rand = math.random()
			if rand < 0.33 then
				return "l5n_"
			elseif rand < 0.66 then
				return "l3n_"
			else
				return "l2n_"
			end
		end,
	},
	]]
	female_enemy_list = {
		func = function(self, nr_variations)
			return "fl1n_"
		end,
		"units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1",
		"units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2",
		"units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3",
	},
	russian_taser_list = {
		func = function(self, nr_variations)
			return "rtsr_"
		end,
		"units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser",
	},
	russian_cloaker_list = {
		func = function(self, nr_variations)
			return "rclk_"
		end,
		"units/pd2_mod_reapers/characters/ene_spook_cloak_1/ene_spook_cloak_1",
	},
	russian_medic_list = {
		func = function(self, nr_variations)
			return "rmdc_"
		end,
		"units/pd2_mod_reapers/characters/ene_akan_lpf/ene_akan_lpf",
	},
	russian_merc_list = {
		func = function(self, nr_variations)
			return "r" .. nr_variations .. "n_"
		end,
		"units/pd2_mod_reapers/characters/ene_fbi_titan_1/ene_fbi_titan_1",
		-- Custom stuff below
		"units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1",
		"units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2",
		"units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3",
		"units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1",
		"units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2",
		"units/pd2_dlc_mad/characters/ene_rus_cop_3_mp5/ene_rus_cop_3_mp5",
		"units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870",
		"units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4",
		"units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870",
		"units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4",
		"units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870",
		"units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4",
		"units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36",
		"units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870",
		"units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36",
		"units/pd2_dlc_mad/characters/ene_rus_fsbzeal_akmsu/ene_rus_fsbzeal_akmsu",
		"units/pd2_dlc_mad/characters/ene_rus_fsbzeal_heavy_ak47_ass/ene_rus_fsbzeal_heavy_ak47_ass",
		"units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45",
		"units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2",
		"units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city",
		"units/pd2_dlc_mad/characters/ene_rus_sniper/ene_rus_sniper",
	},
	russian_mobster_list = {
		func = function(self, nr_variations)
			return "rt" .. nr_variations .. "_"
		end,
		"units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1",
		"units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2",
		"units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3",
		"units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4",
		"units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5",
		"units/payday2/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer",
		"units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1",
		"units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2",
		-- Custom stuff below
		"units/pd2_mod_ttr/characters/ene_gang_mobster_1_pager/ene_gang_mobster_1_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_2_pager/ene_gang_mobster_2_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_3_pager/ene_gang_mobster_3_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_4_pager/ene_gang_mobster_4_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_5/ene_gang_mobster_5",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_5_pager/ene_gang_mobster_5_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_6/ene_gang_mobster_6",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_6_pager/ene_gang_mobster_6_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_7_pager/ene_gang_mobster_7_pager",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_armored/ene_gang_mobster_armored",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_armored_2/ene_gang_mobster_armored_2",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_clubowner/ene_gang_mobster_clubowner",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_vip_1/ene_gang_mobster_vip_1",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_vip_2/ene_gang_mobster_vip_2",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer",
		"units/pd2_mod_ttr/characters/ene_gang_mobster_clubsecurity/ene_gang_mobster_clubsecurity",
	},
	cobras_list = {
		func = function(self, nr_variations)
			return "ict" .. nr_variations .. "_"
		end,
		"units/payday2/characters/ene_gang_black_1/ene_gang_black_1",
		"units/payday2/characters/ene_gang_black_2/ene_gang_black_2",
		"units/payday2/characters/ene_gang_black_3/ene_gang_black_3",
		"units/payday2/characters/ene_gang_black_4/ene_gang_black_4",
		"units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer",
	},
	bexico_cop_list = {
		func = function(self, nr_variations)
			return "m" .. nr_variations .. "n_"
		end,
		-- Cartel faction below
		"units/pd2_mod_ttr/characters/ene_cartel_commando/ene_cartel_commando",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier/ene_cartel_soldier",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_2/ene_cartel_soldier_2",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_3/ene_cartel_soldier_3",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_4/ene_cartel_soldier_4",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_1/ene_cartel_soldier_shotgun_1",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_2/ene_cartel_soldier_shotgun_2",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_3/ene_cartel_soldier_shotgun_3",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_shotgun_4/ene_cartel_soldier_shotgun_4",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy/ene_cartel_soldier_heavy",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_shotgun/ene_cartel_soldier_heavy_shotgun",
		"units/pd2_mod_ttr/characters/ene_cartel_shield/ene_cartel_shield",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_1/ene_cartel_soldier_fbi_1",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_2/ene_cartel_soldier_fbi_2",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_3/ene_cartel_soldier_fbi_3",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_4/ene_cartel_soldier_fbi_4",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_1/ene_cartel_soldier_fbi_shotgun_1",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_2/ene_cartel_soldier_fbi_shotgun_2",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_3/ene_cartel_soldier_fbi_shotgun_3",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_fbi_shotgun_4/ene_cartel_soldier_fbi_shotgun_4",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi/ene_cartel_soldier_heavy_fbi",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_fbi_shotgun/ene_cartel_soldier_heavy_fbi_shotgun",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_1/ene_cartel_soldier_city_1",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_2/ene_cartel_soldier_city_2",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_3/ene_cartel_soldier_city_3",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_4/ene_cartel_soldier_city_4",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_1/ene_cartel_soldier_city_shotgun_1",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_2/ene_cartel_soldier_city_shotgun_2",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_3/ene_cartel_soldier_city_shotgun_3",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_city_shotgun_4/ene_cartel_soldier_city_shotgun_4",
		"units/pd2_mod_ttr/characters/ene_cartel_soldier_heavy_city/ene_cartel_soldier_heavy_city",
	},
	bexico_taser_list = {
		func = function(self, nr_variations)
			return "mtsr_"
		end,
		"units/pd2_mod_ttr/characters/ene_cartel_tazer/ene_cartel_tazer",
		"units/pd2_mod_ttr/characters/ene_cartel_tazer_normal/ene_cartel_tazer_normal",
	},
	bexico_cloaker_list = {
		func = function(self, nr_variations)
			return "mclk_"
		end,
		"units/pd2_mod_ttr/characters/ene_cartel_scout/ene_cartel_scout",
	},
	bexico_dozer_list = {
		func = function(self, nr_variations)
			return "mbdz_"
		end,
		"units/pd2_mod_ttr/characters/ene_cartel_bulldozer/ene_cartel_bulldozer",
		"units/pd2_mod_ttr/characters/ene_cartel_bulldozer_2/ene_cartel_bulldozer_2",
		"units/pd2_mod_ttr/characters/ene_cartel_bulldozer_3/ene_cartel_bulldozer_3",
		"units/pd2_mod_ttr/characters/ene_cartel_grenadier/ene_cartel_grenadier",
		"units/pd2_mod_ttr/characters/ene_cartel_grenadier_2/ene_cartel_grenadier_2",
	},
}

local prefix_garbage_for_robots = {}
for unit_type, list in pairs(prefix_garbage_for_humans) do
	local func = list.func
	list.func = nil
	if not func then
		restoration:warn("No prefix func found for unit type %s", unit_type)
	else
		for _, unit_name in pairs(list) do
			prefix_garbage_for_robots[Idstring(unit_name):key()] = func
			prefix_garbage_for_robots[Idstring(unit_name .. "_husk"):key()] = func
		end
	end
end
prefix_garbage_for_humans = nil

function CopSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	local char_tweak = tweak_data.character[unit:base()._tweak_table]

	self:set_voice_prefix(nil)

	local nr_variations = char_tweak.speech_prefix_count and tostring(math.random(char_tweak.speech_prefix_count)) or ""
	local prefix_func = prefix_garbage_for_robots[unit:name():key()]
	self._prefix = prefix_func and prefix_func(self, nr_variations) or nil

	if not self._prefix then
		if char_tweak.speech_prefix_p1 == "l5d" then
			self._prefix = "l5d_"
		else
			self._prefix = (char_tweak.speech_prefix_p1 or "") .. nr_variations .. (char_tweak.speech_prefix_p2 or "") .. "_"
		end
	end

	local spawn_sounds = restoration.Options:GetValue("OTHER/EnemySpawnSounds")
	if spawn_sounds then
		if not restoration.Voicelines:say(self._unit, "spawn") then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event, nil, nil)
		end

		--Mostly just here in the event we have a unit to have both an 'entrance' line *and* a global spawn in noise
		if self._unit:base():char_tweak().spawn_sound_event_2 then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_2, nil, nil)
		end

		--Use this only if an enemy has custom voice and is already using 2nd spawn sound
		if self._unit:base():char_tweak().spawn_sound_event_3 then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event_3, nil, nil)
		end
	end

	unit:base():post_init()
end

-- Is this even used?
function CopSound:chk_voice_prefix()
	if self._prefix then
		return self._prefix
	end
end	

function CopSound:say(sound_name, sync, skip_prefix, important, callback)
	if self._last_speech then
		self._last_speech:stop()
	end

    if restoration.Voicelines:say_id(self._unit, sound_name) then
    	if sync then
			self._unit:network():send("say", SoundDevice:string_to_id(sound_name))
		end

		self._speak_expire_t = TimerManager:game():time() + 2
		return
	end
	
	local full_sound = nil
	
	local l5n_missing_police_calls = {
		"l5n_a09",
		"l5n_a23",
	}
	local l5n_contact_lines = {
		"Play_l5n_i01_con",
		"Play_l5n_g90",
	}
	local l5n_alert = {
		"Play_l5n_lk3_con",
		"l5n_a08",
	}
	
	-- restore the entire l5n voiceset
	if self._prefix == "l5n_" then
		if sound_name == "c01" or sound_name == "att" then
			full_sound = l5n_contact_lines[math.random(#l5n_contact_lines)] -- use i01 and g90 as contact since l5n doesn't have any
		end
		if sound_name == "rdy" then
			full_sound = "Play_l5n_rdy"
		end
		if sound_name == "h01" then
			full_sound = "Play_l5n_c01a" -- contact line is actually a rescue line
		end
		if sound_name == "cn1" then
			full_sound = "Play_l5n_cn1_con"
		end
		if sound_name == "civ" then
			full_sound = "Play_l5n_civ_con"
		end
		if sound_name == "cr1" then
			full_sound = "Play_l5n_cr1_con"
		end
		if sound_name == "clr" then
			full_sound = "Play_l5n_clr_con"
		end
		if sound_name == "g90" then
			full_sound = "Play_l5n_g90"
		end
		if sound_name == "d01" then
			full_sound = "Play_l5n_d01_con"
		end
		if sound_name == "d02" then
			full_sound = "Play_l5n_d02_con"
		end
		if sound_name == "ch1" then
			full_sound = "Play_l5n_ch1_con"
		end
		if sound_name == "ch2" then
			full_sound = "Play_l5n_ch2_con"
		end
		if sound_name == "ch3" then
			full_sound = "Play_l5n_ch3_con"
		end
		if sound_name == "ch4" then
			full_sound = "Play_l5n_ch4_con"
		end
		if sound_name == "gr1a" then
			full_sound = "Play_l5n_gr1a_con"
		end
		if sound_name == "gr1b" then
			full_sound = "Play_l5n_gr1b_con"
		end
		if sound_name == "gr1c" then
			full_sound = "Play_l5n_gr1c_con"
		end
		if sound_name == "gr1d" then
			full_sound = "Play_l5n_gr1d_con"
		end
		if sound_name == "gr2a" then
			full_sound = "Play_l5n_gr2a_con"
		end
		if sound_name == "gr2b" then
			full_sound = "Play_l5n_gr2b_con"
		end
		if sound_name == "gr2c" then
			full_sound = "Play_l5n_gr2c_con"
		end
		if sound_name == "gr2d" then
			full_sound = "Play_l5n_gr2d_con"
		end
		if sound_name == "med" then
			full_sound = "Play_l5n_med_con"
		end
		if sound_name == "m01" then
			full_sound = "Play_l5n_m01_any"
		end
		if sound_name == "mov" then
			full_sound = "Play_l5n_mov_ass"
		end
		if sound_name == "p01" then
			full_sound = "Play_l5n_p01_ass"
		end
		if sound_name == "p02" then
			full_sound = "Play_l5n_p02_ass"
		end
		if sound_name == "p03" then
			full_sound = "Play_l5n_p03_ass"
		end
		if sound_name == "pos" then
			full_sound = "Play_l5n_pos_con"
		end
		if sound_name == "prm" or sound_name == "t01" then
			full_sound = "Play_l5n_prm_con"
		end
		if sound_name == "pus" or sound_name == "rrl" then
			full_sound = "Play_l5n_pus_con"
		end
		if sound_name == "r01" then
			full_sound = "Play_l5n_r01_con"
		end
		if sound_name == "s01x" then
			full_sound = "Play_l5n_s01x_con"
		end
		if sound_name == "i01" then
			full_sound = "Play_l5n_i01_con"
		end
		if sound_name == "i02" then
			full_sound = "Play_l5n_i02_con"
		end
		if sound_name == "i03" then
			full_sound = "Play_l5n_i03_con__________________MISSING_i03c"
		end
		if sound_name == "l01" then
			full_sound = "Play_l5n_l01_con__________________MISSING_l01b"
		end
		if sound_name == "lk3a" then
			full_sound = "Play_l5n_lk3_ass"
		end
		if sound_name == "lk3b" then
			full_sound = "Play_l5n_lk3_con"
		end
		if sound_name == "hlp" then
			full_sound = "Play_l5n_hlp_con"
		end
		if sound_name == "x02a_any_3p" then
			full_sound = "l1n_x01a_any_3p"
		end
		if sound_name == "x01a_any_3p" then
			full_sound = "l1n_x02a_any_3p"
		end
		if sound_name == "a07a" or sound_name == "a07b" then
			full_sound = l5n_alert[math.random(#l5n_alert)]
		end
		if sound_name == "a10" or sound_name == "a11" or sound_name == "a12" then
			full_sound = l5n_missing_police_calls[math.random(#l5n_missing_police_calls)]
		end
	end
	
	if self._prefix == "l5d_" then
		if sound_name == "c01" or sound_name == "att" then
			sound_name = "g90"
		elseif sound_name == "rrl" then
			sound_name = "pus"
		elseif sound_name == "t01" then
			sound_name = "prm"
		elseif sound_name == "h01" then
			sound_name = "h10"
		end
	end
	
	if self._prefix == "lt1_" then
		if sound_name == "g90" then
			sound_name = "c01"
		end
	end
	
	local fixed_sound = nil
	
	if self._prefix == "l1n_" or self._prefix == "l2n_" or self._prefix == "l3n_" then
		if sound_name == "x02a_any_3p" then
			sound_name = "x01a_any_3p"
			fixed_sound = true
			--log("IM FUCKIN DEAD BRO")
		elseif sound_name == "x01a_any_3p" then
			sound_name = "x02a_any_3p"
			--log("OW MY BONES")
		end
	end
	
	
	--Fixes gangsters not having any pain burn lines
	if self._prefix == "ict1_" or self._prefix == "ict2_" or self._prefix == "bik1_" or self._prefix == "bik2_" or self._prefix == "lt1_" or self._prefix == "lt2_" or self._prefix == "rt1_" or self._prefix == "rt2_" then
			if sound_name == "burnhurt" then
				full_sound = "l2n_burnhurt"
			elseif sound_name == "burndeath" then
				full_sound = "l2n_burndeath"
			end
		end
		
	--fixed female enemies not having any pain burn lines
	if self._prefix == "fl1n_" then
			if sound_name == "burnhurt" then
				full_sound = "cf2_burnhurt"
			elseif sound_name == "burndeath" then
				full_sound = "cf2_burndeath"
			end
		end	
	
	if self._prefix == "l4n_" then
		if sound_name == "x02a_any_3p" then
			sound_name = "x01a_any_3p"
			fixed_sound = true
			--log("l4N IS FUCKIGN DEAD WTF NOOOO")
		elseif sound_name == "x01a_any_3p" then
			sound_name = "l1n_x02a_any_3p"
			--log("l4N BONE HURTY JUICE")
		end
	end
	
	if self._prefix == "l1d_" or self._prefix == "l2d_" or self._prefix == "l3d_" or self._prefix == "l4d_" or self._prefix == "l5d_" then
		if sound_name == "a05" or sound_name == "a06" then
			sound_name = "clr"
			--log("CLEAR!!!")
		end
	end
	
	local faction = tweak_data.levels:get_ai_group_type()
	
	if self._unit:base():has_tag("special") and not sound_name == "g90" and not sound_name == "c01" then --just making sure
	
		if sound_name == "x02a_any_3p" then
			if self._unit:base():has_tag("spooc") then
				if faction == "russia" then
					full_sound = "rclk_x02a_any_3p"
				else
					full_sound = "clk_x02a_any_3p"
				end
			end
			
			if self._unit:base():has_tag("taser") then
				if faction == "russia" then
					full_sound = "rtsr_x02a_any_3p"
				else
					full_sound = "tsr_x02a_any_3p"
				end
			end
			
			if self._unit:base():has_tag("tank") then
				full_sound = "bdz_x02a_any_3p"
			end
			
			if self._unit:base():has_tag("medic") then
				full_sound = "mdc_x02a_any_3p"
			end
		end
			
		if self._unit:base():has_tag("tank") then
		       if sound_name == "burndeath" then				
			    full_sound = "l1d_burndeath"
			end	
		end
		
		if self._unit:base():has_tag("tank") then
		       if sound_name == "burnhurt" then				
			    full_sound = "l1d_burnhurt"
			end	
		end
		
		if sound_name == "x01a_any_3p" then
			if self._unit:base():has_tag("spooc") then
				if faction == "russia" then
					full_sound = "rclk_x01a_any_3p" --weird he has hurt noises but the regular cloaker doesnt
				else
					full_sound = full_sound
				end
			end
			if self._unit:base():has_tag("taser") then
				if faction == "russia" then
					full_sound = "rtsr_x01a_any_3p"
				else
					full_sound = "tsr_x01a_any_3p"
				end
			end
			if self._unit:base():has_tag("tank") then
				full_sound = "bdz_x01a_any_3p"
			end
			if self._unit:base():has_tag("medic") then
				full_sound = "mdc_x01a_any_3p"
			end
		end
	end
	
	if self._prefix == "l2d_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l1d_x02a_any_3p"
		end
	end
	
	if self._prefix == "l3d_" then
		if sound_name == "burnhurt" then
			full_sound = "l1d_burnhurt"
		end
		if sound_name == "burndeath" then
			full_sound = "l1d_burndeath"
		end
	end
	
	if self._prefix == "z1n_" or self._prefix == "z2n_" or self._prefix == "z3n_" or self._prefix == "z4n_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l2n_x01a_any_3p"
		end
		
		if sound_name == "x01a_any_3p" then
			full_sound = "l2n_x02a_any_3p"
		end
		
		if sound_name ~= "x01a_any_3p" and sound_name ~= "x02a_any_3p" then
			sound_name = "g90"
		end
	end
		
	if self._prefix == "r1n_" or self._prefix == "r2n_" or self._prefix == "r3n_" or self._prefix == "r4n_" then
		if sound_name == "x02a_any_3p" then
			full_sound = "l2n_x01a_any_3p"
		elseif sound_name == "x01a_any_3p" then
			full_sound = "l2n_x02a_any_3p"
		end
	end
	
	if not full_sound then
		if skip_prefix then
			full_sound = sound_name
		else
			full_sound = self._prefix .. sound_name
		end
	end
	
	local event_id = nil

	if type(full_sound) == "number" then
		event_id = full_sound
		full_sound = nil
	end

	if sync then
		event_id = event_id or SoundDevice:string_to_id(full_sound)

		self._unit:network():send("say", event_id)
	end

	self._last_speech = self:_play(full_sound or event_id)

	if not self._last_speech then
		return
	end

	self._speak_expire_t = TimerManager:game():time() + 2
end
