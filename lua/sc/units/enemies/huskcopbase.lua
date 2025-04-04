-- do not touch this.
local all_head_variants = {}
local all_cop_variants = {}
local enemy_mapping = {}

for name, sequence in pairs(all_cop_variants) do
	all_cop_variants[Idstring(name):key()] = sequence
	all_cop_variants[Idstring(name .. "_husk"):key()] = sequence
end

for name, sequence in pairs(all_head_variants) do
	enemy_mapping[Idstring(name):key()] = sequence
	enemy_mapping[Idstring(name .. "_husk"):key()] = sequence
end

function HuskCopBase:random_mat_seq_initialization()
	local sequence = enemy_mapping[self._unit:name():key()]
    local lvl_tweak_data = tweak_data.levels[job]
    local flashlights_on = lvl_tweak_data and lvl_tweak_data.flashlights_on

	if self._unit:damage() and self._unit:damage():has_sequence(sequence) then
		self._unit:damage():run_sequence_simple(sequence)
	end
end

local enemy_variations = {
	["units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"] = "swat_ar",
	["units/pd2_dlc_vip/characters/ene_titan_sniper/ene_titan_sniper"] = "swat_sniper",
	["units/pd2_dlc_vip/characters/ene_titan_sniper_scripted/ene_titan_sniper_scripted"] = "swat_sniper_scripted",
	["units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"] = "swat_shield",
	["units/pd2_dlc_vip/characters/ene_phalanx_1_new/ene_phalanx_1_new"] = "winters_shield",
	["units/pd2_dlc_vip/characters/ene_titan_taser/ene_titan_taser"] = "taser_titan",
	["units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"] = "swat_sg",
	["units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1"] = "asu",
	
	["units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2"] = "black",
	["units/pd2_mod_nypd/characters/ene_bulldozer_3/ene_bulldozer_3"] = "skull",
	
	["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2_sc/ene_zeal_bulldozer_2_sc"] = "green",
	["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3_sc/ene_zeal_bulldozer_3_sc"] = "black",
	["units/pd2_dlc_gitgud/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"] = "ben",
	["units/pd2_dlc_drm/characters/ene_bulldozer_medic_sc/ene_bulldozer_medic_sc"] = "medic",

	["units/payday2/characters/ene_bulldozer_2_sc/ene_bulldozer_2_sc"] = "black",
	["units/payday2/characters/ene_bulldozer_3_sc/ene_bulldozer_3_sc"] = "skull",
	["units/pd2_mod_lapd/characters/ene_bulldozer_3/ene_bulldozer_3"] = "skull_la",

	["units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"] = "swat_smg",
	["units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"] = "swat_sg",
	["units/payday2/characters/ene_swat_3/ene_swat_3"] = "swat_ar",
	["units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"] = "heavy_swat_ar",
	["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "heavy_swat_sg",
	["units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"] = "swat_shield",
	["units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc"] = "swat_sniper",
	
	["units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"] = "swat_ar",
	["units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"] = "swat_sg",
	["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "swat_smg",	
	["units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"] = "heavy_swat_ar",
	["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "heavy_swat_sg",
	["units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"] = "swat_shield",
	["units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"] = "swat_sniper",
	
	["units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"] = "swat_ar",
	["units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"] = "swat_sg",
	["units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"] = "swat_smg",	
	["units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"] = "heavy_swat_ar",
	["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "heavy_swat_sg",
	["units/payday2/characters/ene_shield_gensec/ene_shield_gensec"] = "swat_shield",
	["units/payday2/characters/ene_sniper_3/ene_sniper_3"] = "swat_sniper",
	
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "swat_ar",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "swat_sg",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"] = "swat_smg",	
	["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"] = "heavy_swat_ar",
	["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"] = "heavy_swat_sg",
	["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"] = "swat_shield",
	["units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"] = "swat_sniper",
	["units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"] = "swat_ar",	
	["units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"] = "swat_sg",
	

	["units/payday2/characters/ene_cop_1/ene_cop_1"] = "cop_pistol",
	["units/payday2/characters/ene_cop_2/ene_cop_2"] = "cop_revolver",
	["units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest"] = "cop_pistol",
	["units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest"] = "cop_revolver",
	["units/payday2/characters/ene_cop_3/ene_cop_3"] = "cop_smg",
	["units/payday2/characters/ene_cop_4/ene_cop_4"] = "cop_sg",
	
	["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "cop_pistol",
	["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "cop_revolver",
	["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "cop_smg",
	["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "cop_la_sg",	
	
	["units/pd2_mod_bravo/characters/ene_bravo_rifle/ene_bravo_rifle"] = "swat_ar",
	["units/pd2_mod_bravo/characters/ene_bravo_shotgun/ene_bravo_shotgun"] = "swat_sg",
	["units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg"] = "swat_lmg",	
	
	["units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1"] = "swat_guard_ar",
	["units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2"] = "swat_guard_sg",
	["units/pd2_mod_bravo/characters/ene_bravo_guard_3/ene_bravo_guard_3"] = "swat_guard_lmg",	
	
	["units/pd2_mod_bravo/characters/ene_bravo_dmr/ene_bravo_dmr"] = "swat_sniper",
	["units/pd2_mod_bravo/characters/ene_bravo_dmr_scripted/ene_bravo_dmr_scripted"] = "swat_sniper",
	
	["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "fbi_1",
	["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "fbi_2",
	["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "fbi_3",
	
	["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "mrkwater_ump",
	["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "mrkwater_ump_nolight",
	["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "mrkwater_scar",
	["units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "fbi_ump",
	["units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "fbi_scar",
	["units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"] = "fbi_ump",
	["units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"] = "fbi_scar",
	
	["units/payday2/characters/ene_security_1/ene_security_1"] = "sec_pistol",
	["units/payday2/characters/ene_security_2/ene_security_2"] = "sec_smg",
	["units/payday2/characters/ene_security_3/ene_security_3"] = "sec_sg",
	["units/payday2/characters/ene_security_4/ene_security_4"] = "sec_4",
	["units/payday2/characters/ene_security_5/ene_security_5"] = "sec_5",
	["units/payday2/characters/ene_security_6/ene_security_6"] = "sec_6",
	["units/payday2/characters/ene_security_7/ene_security_7"] = "sec_7",
	
	["units/payday2/characters/ene_city_guard_1/ene_city_guard_1"] = "sec_ds_pistol",
	["units/payday2/characters/ene_city_guard_2/ene_city_guard_2"] = "sec_ds_smg",
	["units/payday2/characters/ene_city_guard_3/ene_city_guard_3"] = "sec_ds_sg",
		
	["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "sec_pistol",
	["units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2"] = "sec_pistol",	
	["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "sec_smg",
	["units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"] = "sec_smg",
	["units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"] = "sec_sg",
	
	["units/pd2_mod_lapd/characters/ene_city_swat_1/ene_city_swat_1"] = "swat_ar",
	["units/pd2_mod_lapd/characters/ene_city_swat_2/ene_city_swat_2"] = "swat_sg",
	["units/pd2_mod_lapd/characters/ene_city_swat_3/ene_city_swat_3"] = "swat_smg",	
	["units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "heavy_swat_ar",
	["units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "heavy_swat_sg",
	["units/pd2_mod_lapd/characters/ene_city_shield/ene_city_shield"] = "swat_shield",
	["units/pd2_mod_lapd/characters/ene_sniper_3/ene_sniper_3"] = "swat_sniper",

	-- NYPD
	["units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"] = "sec_pistol",
	["units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"] = "sec_smg",
	["units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"] = "sec_sg",
	
	["units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"] = "cop_pistol",
	["units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2"] = "cop_revolver",
	["units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3"] = "cop_smg",
	["units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4"] = "cop_sg",
	
	["units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1"] = "cop_pistol",
	["units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2"] = "cop_revolver",
	["units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3"] = "cop_smg",
	["units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"] = "cop_sg",
	
	["units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"] = "sec_red_pistol",
	["units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"] = "sec_red_smg",
	["units/pd2_mod_nypd/characters/ene_security_gensec_3/ene_security_gensec_3"] = "sec_red_sg",

	["units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "swat_ar",
	["units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "swat_sg",
	["units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "swat_smg",
	["units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "heavy_swat_ar",
	["units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "heavy_swat_sg",
	["units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"] = "swat_shield",
	
	["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = "swat_smg",
	["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = "swat_sg",
	["units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"] = "swat_ar",

	["units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1"] = "swat_ar",
	["units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"] = "swat_sg",
	["units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"] = "swat_smg",	
	["units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "heavy_swat_ar",
	["units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "heavy_swat_sg",
	["units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"] = "swat_shield",
	["units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"] = "swat_sniper",
	
	
	["units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1"] = "swat_sniper",
	["units/pd2_mod_nypd/characters/ene_sniper_2/ene_sniper_2"] = "swat_sniper",
	["units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"] = "swat_sniper",
	["units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_1/ene_nypd_veteran_cop_1"] = "fbi_vet_blood",
	["units/pd2_mod_nypd/characters/ene_nypd_veteran_cop_2/ene_nypd_veteran_cop_2"] = "fbi_vet",
	["units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"] = "swat_medic",
	["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "swat_ar",
	["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "swat_sg",	
	["units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"] = "swat_shield",
	["units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"] = "swat_taser",
	["units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1"] = "swat_cloaca",
	["units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1"] = "swat_gren",
	["units/pd2_mod_nypd/characters/ene_fbi_1/ene_fbi_1"] = "fbi_1",	
	["units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"] = "fbi_2",
	["units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"] = "fbi_3"
	
}

local all_head_variants = {
	-- NYPD
	["units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2"] = "fat_cop",
	["units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4"] = "sec_cop",
	["units/pd2_dlc_ranc/characters/ene_cop_1/ene_cop_1"] = "sec_cop",
	["units/pd2_dlc_ranc/characters/ene_cop_2/ene_cop_2"] = "sec_cop",
	["units/pd2_dlc_ranc/characters/ene_cop_3/ene_cop_3"] = "sec_cop",
	["units/pd2_dlc_ranc/characters/ene_cop_4/ene_cop_4"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_security_gensec_3/ene_security_gensec_3"] = "sec_cop",

	["units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "fbi_swat_ar",
	["units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "fbi_swat_sg",
	["units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "fbi_swat_sg",
	["units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "fbi_swat_ar",
	["units/pd2_mod_nypd/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "fbi_swat_sg",	
	["units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1"] = "fbi_swat_ar",
	
	["units/pd2_mod_nypd/characters/ene_city_swat_1/ene_city_swat_1"] = "gs_swat",
	["units/pd2_mod_nypd/characters/ene_city_swat_2/ene_city_swat_2"] = "gs_swat_sg",
	["units/pd2_mod_nypd/characters/ene_city_swat_3/ene_city_swat_3"] = "gs_swat_sg",
	["units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "head_balaclava_a",
	["units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "head_balaclava_b",	
	["units/pd2_mod_nypd/characters/ene_shield_gensec/ene_shield_gensec"] = "gs_swat",
	["units/pd2_mod_nypd/characters/ene_sniper_3/ene_sniper_3"] = "gs_swat",
	
	["units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1"] = "swat",
	["units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2"] = "swat",
	["units/pd2_mod_nypd/characters/ene_nypd_swat_3/ene_nypd_swat_3"] = "swat_ar",
	["units/pd2_mod_nypd/characters/ene_sniper_2/ene_sniper_2"] = "swat_ar",
	["units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1"] = "swat_ar",
	["units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"] = "swat_heavy",
	["units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"] = "swat_heavy",	
	["units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield"] = "head_balaclava_d",
	["units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1"] = "head_balaclava_d",
	["units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1"] = "grenfaceonly",
	["units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic"] = "gs_swat",
	["units/pd2_mod_nypd/characters/ene_fbi_1/ene_fbi_1"] = "sec_cop",	
	["units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2"] = "sec_cop",
	["units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3"] = "fbi_hrt"
	
}

for name, sequence in pairs(enemy_variations) do
	enemy_mapping[Idstring(name):key()] = sequence
	enemy_mapping[Idstring(name .. "_husk"):key()] = sequence
end

Hooks:PostHook(HuskCopBase, "post_init", "postinithuskbase", function(self)
	if self._unit:base()._tweak_table == "summers" then
		managers.groupai:state():_reset_summers_dr()
		self._unit:base():reset_summers_dr_effect()
	end			

	local faction = tweak_data.levels:get_ai_group_type()
    local lights = self._unit:get_objects_by_type(Idstring("light"))
	if faction == "russia" then
	if self._tweak_table == "spooc" or self._tweak_table == "spooc_titan" then
		for k, v in pairs(lights) do
			v:set_color(Color(hsv_to_rgb(200, 1, 1)))
			end
		end
	end
	if faction == "federales" then
		if self._tweak_table == "spooc_titan" then
			for k, v in pairs(lights) do
				v:set_color(Color(hsv_to_rgb(200, 1, 1)))
			end
		end
	end

	self._allow_invisible = true

	--Cloakers lights are always on
	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	elseif self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or self._tweak_table == "autumn" then
		managers.hud:set_buff_enabled("vip", true) --Captain spawned, enable buff icon
	end
	
	if self._tweak_table == "triad_boss" then
		self._unit:body("head"--[[self._unit:character_damage()._head_body_name--]]):set_sphere_radius(15)
		self._unit:body("body"):set_sphere_radius(22)

		self._unit:body("rag_LeftArm"):set_enabled(true)
		self._unit:body("rag_LeftForeArm"):set_enabled(true)

		self._unit:body("rag_RightArm"):set_enabled(true)
		self._unit:body("rag_RightForeArm"):set_enabled(true)

		self._unit:body("rag_LeftArm"):set_sphere_radius(11)
		self._unit:body("rag_LeftForeArm"):set_sphere_radius(7)
		self._unit:body("rag_RightArm"):set_sphere_radius(11)
		self._unit:body("rag_RightForeArm"):set_sphere_radius(7)

		self._unit:body("rag_LeftUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_LeftLeg"):set_sphere_radius(7)
		self._unit:body("rag_RightUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_RightLeg"):set_sphere_radius(7)
	end
		
	self._unit:character_damage():add_listener("asu_laser_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_asu_laser"))
	
	self._unit:character_damage():add_listener("lpf_buff_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_lpf_buff"))	
	

	local name = self._unit:name():key()
	
	local character_sequence = all_cop_variants[name]
	
	local spawn_manager_ext = self._unit:spawn_manager()
	local damage_ext = self._unit:character_damage()
	local head = damage_ext._head
	
	if spawn_manager_ext then	
		if head then	
			managers.dyn_resource:load(Idstring("unit"), Idstring(head), managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
			
			spawn_manager_ext:spawn_and_link_unit("_char_joint_names", "cop_head", head)

			self._head_unit = spawn_manager_ext:get_unit("cop_head")
		end
	end
	
	if alive(self._head_unit) then		
		self._head_unit:set_enabled(self._unit:enabled())
		
		if self._head_unit:damage() and self._head_unit:damage():has_sequence(character_sequence) then
			self._head_unit:damage():run_sequence_simple(character_sequence)
		end
	end	
end)
