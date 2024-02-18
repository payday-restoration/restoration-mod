local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
local pro_job = Global.game_settings and Global.game_settings.one_down
--Instead of bad dozer spam following by a random cloaker, Safehouse Nightmare has now proper scripted endless assault that features variety of Zombie Forces
--Scripted Spawn List
	if difficulty_index <= 3 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_swat_1/ene_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_swat_2/ene_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		shield = "units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		old_chains = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"
		vet_cop = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"
	elseif difficulty_index == 4 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		shield = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		old_chains = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"
		vet_cop = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"
	elseif difficulty_index == 5 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		shield = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"
		old_chains = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"
		vet_cop = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_2/ene_fbi_hvh_2"
	elseif difficulty_index == 6 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		shield = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"
		old_chains = "units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	elseif difficulty_index == 7 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		shield = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		vault_guardian = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"
		old_chains = "units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	else
		swat_1 = "units/pd2_mod_halloween/characters/ene_zeal_city_1/ene_zeal_city_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_zeal_city_2/ene_zeal_city_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_zeal_city_3/ene_zeal_city_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"
		taser_2 = "units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"
		shield_2 = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"
		vault_guardian = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
		spooc = "units/pd2_mod_halloween/characters/ene_zeal_cloaker/ene_zeal_cloaker"
		medic = "units/pd2_mod_halloween/characters/ene_zeal_medic/ene_zeal_medic"
		old_chains = "units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
end

	--Yes, i have to place pro job spawns under the regular spawns cause Non-PJ spawns will overwrite the PJ spawns so it would not work properly
	if pro_job then
	if difficulty_index <= 3 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_swat_3/ene_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		shield = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		old_chains = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	elseif difficulty_index == 4 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		old_chains = "units/pd2_dlc_hvh/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	elseif difficulty_index == 5 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_fbi_swat_1/ene_fbi_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_fbi_swat_2/ene_fbi_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_fbi_swat_3/ene_fbi_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_mod_halloween/characters/ene_shield_1/ene_shield_1"
		shield_2 = "units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		vault_guardian = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"
		old_chains = "units/pd2_dlc_hvh/characters/ene_fbi_hvh_3/ene_fbi_hvh_3"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	elseif difficulty_index == 6 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_city_swat_1/ene_city_swat_1"
		swat_2 = "units/pd2_mod_halloween/characters/ene_city_swat_2/ene_city_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"
		shield_2 = "units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		vault_guardian = "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"
		old_chains = "units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	elseif difficulty_index == 7 then
		swat_1 = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
		swat_2 = "units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"
		swat_3 = "units/pd2_mod_halloween/characters/ene_city_swat_3/ene_city_swat_3"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"
		taser_2 = "units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		shield_2 = "units/pd2_mod_halloween/characters/ene_shield_gensec/ene_shield_gensec"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_bulldozer_3/ene_bulldozer_3"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_bulldozer_1/ene_bulldozer_1"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_bulldozer_2/ene_bulldozer_2"
		vault_guardian = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_1/ene_spook_1"
		medic = "units/pd2_mod_halloween/characters/ene_medic_mp5/ene_medic_mp5"
		old_chains = "units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	else
		swat_1 = "units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"
		swat_2 = "units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"
		swat_3 = "units/pd2_mod_bravo/characters/ene_bravo_lmg/ene_bravo_lmg"
		swat_heavy_1 = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"
		swat_heavy_2 = "units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"
		taser = "units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"
		taser_2 = "units/pd2_mod_halloween/characters/ene_titan_taser/ene_titan_taser"
		shield = "units/pd2_mod_halloween/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"
		shield_2 = "units/pd2_mod_halloween/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"
		bulldozer_1 = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"
		bulldozer_2 = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"
		bulldozer_3 = "units/pd2_mod_halloween/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"
		vault_guardian = "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4"
		spooc = "units/pd2_mod_halloween/characters/ene_spook_cloak_1/ene_spook_cloak_1"
		medic = "units/pd2_mod_halloween/characters/ene_omnia_lpf/ene_omnia_lpf"
		old_chains = "units/pd2_mod_halloween/characters/ene_fbi_titan_1/ene_fbi_titan_1"
		vet_cop = "units/pd2_mod_halloween/characters/ene_veteran_cop_1/ene_veteran_cop_1"
	end
end	
	

return {
	--PONR/Restores unused cloaker vault spawn that spawns a dozer as a *BOOO* mechanic
	[100546] = {
	ponr = 360,
	on_executed = {
		{ id = 102689, delay = 3 }
		}
	},
	--Disables the AI Remover to prevent vault spawn from despawning after few seconds
	[102690] = {
		values = {
            enabled = false
		}
	},
	--Scripted Spawn Rework
	--"Bulldozer" spawns
	[100457] = {
		values = {
            enemy = swat_1
		}
	},
	[101402] = {
		values = {
            enemy = taser
		}
	},
	[101423] = {
		values = {
            enemy = swat_2
		}
	},
	[101433] = {
		values = {
            enemy = vet_cop
		}
	},
	[101441] = {
		values = {
            enemy = swat_heavy_1
		}
	},
	[101471] = {
		values = {
            enemy = swat_heavy_2
		}
	},
	[101526] = {
		values = {
            enemy = shield_2
		}
	},
	[101553] = {
		values = {
            enemy = medic
		}
	},
	[101570] = {
		values = {
            enemy = old_chains
		}
	},
	[101616] = {
		values = {
            enemy = taser_2
		}
	},
	[101628] = {
		values = {
            enemy = swat_heavy_1
		}
	},
	[101636] = {
		values = {
            enemy = swat_3
		}
	},
	[101646] = {
		values = {
            enemy = vet_cop
		}
	},
	[101657] = {
		values = {
            enemy = shield
		}
	},
	[101661] = {
		values = {
            enemy = spooc
		}
	},
	--"Cloaker" spawns
	[102700] = {
		values = {
            enemy = bulldozer_1
		}
	},
	[102701] = {
		values = {
            enemy = swat_3
		}
	},
	[102702] = {
		values = {
            enemy = spooc
		}
	},
	[102703] = {
		values = {
            enemy = bulldozer_2
		}
	},
	[102704] = {
		values = {
            enemy = taser
		}
	},
	[102705] = {
		values = {
            enemy = shield
		}
	},
	[102706] = {
		values = {
            enemy = bulldozer_3
		}
	},
	[102707] = {
		values = {
            enemy = spooc
		}
	},
	[102689] = {
		values = {
            enemy = vault_guardian
		}
	}
}