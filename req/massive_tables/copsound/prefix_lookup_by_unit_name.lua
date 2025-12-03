-- Put unit names in these lists as strings, NOT Idstrings
-- Make sure there is a function
-- Do not touch prefix_lookup_by_unit_name below
local prefix_lookup_for_humans = {
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

local prefix_lookup_by_unit_name = {}
for unit_type, list in pairs(prefix_lookup_for_humans) do
	local func = list.func
	list.func = nil
	if not func then
		restoration:warn("No prefix func found for unit type %s", unit_type)
	else
		for _, unit_name in pairs(list) do
			prefix_lookup_by_unit_name[Idstring(unit_name):key()] = func
			prefix_lookup_by_unit_name[Idstring(unit_name .. "_husk"):key()] = func
		end
	end
end
prefix_lookup_for_humans = nil

return prefix_lookup_by_unit_name
