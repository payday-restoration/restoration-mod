--US Spawns
local america = {
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/payday2/characters/ene_sniper_1/ene_sniper_1"		
	}
local america_very_hard = {
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/payday2/characters/ene_sniper_2/ene_sniper_2"		
	}	
local america_zeal = {
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"
	}	
	
	
--Murkywater Scripted Spawn Replacements, try to use these as templates to work from
local murkywater = {
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_sharks/characters/ene_murky_spook/ene_murky_spook",
		["units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"] = "units/pd2_mod_omnia/characters/ene_omnia_spook/ene_omnia_spook",
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_raging_bull/ene_murky_cs_cop_raging_bull",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870",
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_sharks/characters/ene_murkywater_light/ene_murkywater_light",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_sharks/characters/ene_murkywater_light_r870/ene_murkywater_light_r870",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_m4/ene_murky_yellow_m4",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_sharks/characters/ene_murky_yellow_r870/ene_murky_yellow_r870",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer",
		["units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"] = "units/pd2_mod_omnia/characters/ene_omnia_taser/ene_omnia_taser",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow",
		["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "units/pd2_mod_sharks/characters/ene_murky_hrt_1/ene_murky_hrt_1",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_sharks/characters/ene_murky_hrt_2/ene_murky_hrt_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_sharks/characters/ene_murky_swat_m4/ene_murky_swat_m4",
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_m4/ene_murky_heavy_m4",
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/pd2_mod_sharks/characters/ene_murky_city_m4/ene_murky_city_m4",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_mod_omnia/characters/ene_omnia_city/ene_omnia_city",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_r870/ene_murky_heavy_r870",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_sharks/characters/ene_murky_heavy_ump/ene_murky_heavy_ump",
		["units/payday2/characters/ene_city_swat_2/ene_city_swat_2"] = "units/pd2_mod_sharks/characters/ene_murky_city_bnl/ene_murky_city_bnl",
		["units/payday2/characters/ene_city_swat_3/ene_city_swat_3"] = "units/pd2_mod_sharks/characters/ene_murky_city_ump/ene_murky_city_ump",		
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "units/pd2_mod_omnia/characters/ene_omnia_city_2/ene_omnia_city_2",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"] = "units/pd2_mod_omnia/characters/ene_omnia_city_3/ene_omnia_city_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4",	
		["units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_m4/ene_murky_fbi_heavy_m4",	
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",	
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy",	
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",	
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",	
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",	
		["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_heavy_r870/ene_murky_fbi_heavy_r870",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"] = "units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870",
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/payday2/characters/ene_shield_gensec/ene_shield_gensec"] = "units/pd2_mod_sharks/characters/ene_murky_shield_fbi/ene_murky_shield_fbi",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"] = "units/pd2_mod_omnia/characters/ene_omnia_shield/ene_omnia_shield",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_r870/ene_murky_fbi_tank_r870",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"] = "units/pd2_mod_omnia/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_saiga/ene_murky_fbi_tank_saiga",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"] = "units/pd2_mod_omnia/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"] = "units/pd2_mod_sharks/characters/ene_murky_fbi_tank_m249/ene_murky_fbi_tank_m249",
		["units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"] = "units/pd2_mod_omnia/characters/ene_bulldozer_3/ene_bulldozer_3",		
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_sharks/characters/ene_murky_medic_m4/ene_murky_medic_m4",
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_sharks/characters/ene_murky_sniper/ene_murky_sniper",
		--Scripted Spawns Only
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2",	
		["units/payday2/characters/ene_secret_service_1/ene_secret_service_1"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45",	
		["units/payday2/characters/ene_secret_service_2/ene_secret_service_2"] = "units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5"			
	}
	
--NYPD Scripted Spawn Replacements
local nypd = {
		["units/payday2/characters/ene_spook_1/ene_spook_1"] = "units/pd2_mod_nypd/characters/ene_spook_1/ene_spook_1",
		["units/payday2/characters/ene_cop_1/ene_cop_1"] = "units/pd2_mod_nypd/characters/ene_cop_1/ene_cop_1",
		["units/payday2/characters/ene_cop_2/ene_cop_2"] = "units/pd2_mod_nypd/characters/ene_cop_2/ene_cop_2",
		["units/payday2/characters/ene_cop_3/ene_cop_3"] = "units/pd2_mod_nypd/characters/ene_cop_3/ene_cop_3",
		["units/payday2/characters/ene_cop_4/ene_cop_4"] = "units/pd2_mod_nypd/characters/ene_cop_4/ene_cop_4",
		["units/payday2/characters/ene_swat_1/ene_swat_1"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_1/ene_nypd_swat_1",
		["units/payday2/characters/ene_swat_2/ene_swat_2"] = "units/pd2_mod_nypd/characters/ene_nypd_swat_2/ene_nypd_swat_2",
		["units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4",
		["units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",		
		["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870",
		["units/payday2/characters/ene_tazer_1/ene_tazer_1"] = "units/pd2_mod_nypd/characters/ene_tazer_1/ene_tazer_1",
		["units/payday2/characters/ene_shield_2/ene_shield_2"] = "units/pd2_mod_nypd/characters/ene_nypd_shield/ene_nypd_shield",
		["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "units/pd2_mod_nypd/characters/ene_fbi_2/ene_fbi_2",
		["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "units/pd2_mod_nypd/characters/ene_fbi_3/ene_fbi_3",
		["units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_1/ene_fbi_swat_1",
		["units/payday2/characters/ene_city_swat_1/ene_city_swat_1"] = "units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc",
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1",
		["units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_2/ene_fbi_swat_2",
		["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "units/pd2_mod_nypd/characters/ene_fbi_swat_3/ene_fbi_swat_3",
		["units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",		
		["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"] = "units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc",	
		["units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",	
		["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc",	
		["units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"] = "units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc",	
		["units/payday2/characters/ene_shield_1/ene_shield_1"] = "units/pd2_mod_nypd/characters/ene_shield_1/ene_shield_1",
		["units/payday2/characters/ene_city_shield/ene_city_shield"] = "units/payday2/characters/ene_shield_gensec/ene_shield_gensec",
		["units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"] = "units/pd2_mod_nypd/characters/ene_bulldozer_1/ene_bulldozer_1",
		["units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"] = "units/pd2_mod_nypd/characters/ene_bulldozer_2/ene_bulldozer_2",
		["units/payday2/characters/ene_medic_m4/ene_medic_m4"] = "units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic",
		["units/payday2/characters/ene_medic_r870/ene_medic_r870"] = "units/pd2_mod_nypd/characters/ene_nypd_medic/ene_nypd_medic",
		--Need to add NYPD Snipers at some point
		["units/payday2/characters/ene_sniper_1/ene_sniper_1"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",	
		["units/payday2/characters/ene_sniper_2/ene_sniper_2"] = "units/pd2_mod_nypd/characters/ene_sniper_1/ene_sniper_1",
		--Scripted Spawns Only
		["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1",	
		["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"		
	}	

function ElementSpawnEnemyDummy:init(...)
	ElementSpawnEnemyDummy.super.init(self, ...)
	local ai_type = tweak_data.levels:get_ai_group_type()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local job = Global.level_data and Global.level_data.level_id

	--Murkywater
	if ai_type == "murkywater" then
		if murkywater[self._values.enemy] then
			self._values.enemy = murkywater[self._values.enemy]
		end
		self._values.enemy = murkywater[self._values.enemy] or self._values.enemy
	--NYPD
	elseif ai_type == "nypd" then
		if nypd[self._values.enemy] then
			self._values.enemy = nypd[self._values.enemy]
		end
		self._values.enemy = nypd[self._values.enemy] or self._values.enemy	
	--America
	else
		--Hard and Below
		if difficulty_index <= 3 then
			if america[self._values.enemy] then
				self._values.enemy = america[self._values.enemy]
			end
			self._values.enemy = america[self._values.enemy] or self._values.enemy
		--Very Hard and Above			
		elseif difficulty_index > 3 then
			if america_very_hard[self._values.enemy] then
				self._values.enemy = america_very_hard[self._values.enemy]
			end
			self._values.enemy = america_very_hard[self._values.enemy] or self._values.enemy
		elseif difficulty_index == 8 then
			if america_zeal[self._values.enemy] then
				self._values.enemy = america_zeal[self._values.enemy]
			end
			self._values.enemy = america_zeal[self._values.enemy] or self._values.enemy				
		end
	end
								
	self._enemy_name = self._values.enemy and Idstring(self._values.enemy) or Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
	self._values.enemy = nil
	self._units = {}
	self._events = {}
	self:_finalize_values()
end