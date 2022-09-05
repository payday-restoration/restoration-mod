local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")

Month = os.date("%m")
local job = Global.level_data and Global.level_data.level_id

function CopBase:enable_asu_laser(state)
	local weapon = self._unit:inventory():equipped_unit()
	if weapon then
		weapon:base():set_asu_laser_enabled(state)
	end
end

function CopBase:disable_asu_laser(state)
	local weapon = self._unit:inventory():equipped_unit()
	if weapon then
		weapon:base():set_asu_laser_enabled(false)
	end
end

Hooks:PostHook(CopBase, "post_init", "postinithooksex", function(self)
	self:random_mat_seq_initialization()

	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	elseif self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or managers.skirmish:is_skirmish() and self._tweak_table == "autumn" then
		GroupAIStateBesiege:set_assault_endless(true)
		managers.hud:set_buff_enabled("vip", true)
	end

	self._unit:character_damage():add_listener("asu_laser_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_asu_laser"))	
end)

--Yufu Wang Hitbox fix
Hooks:PostHook(CopBase, "post_init", "hitbox_fix_post_init", function(self)
	if self._tweak_table == "triad_boss" then
		self._unit:body("head"--[[self._unit:character_damage()._head_body_name--]]):set_sphere_radius(16)
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
	
	if not self._char_tweak.big_head_mode and not self._unit:base():has_tag("tank") then
		local head = self._unit:character_damage()._head_body_name and self._unit:body(self._unit:character_damage()._head_body_name)
		if head then
			head:set_sphere_radius(16)
		end
	end
	
end)

function CopBase:random_mat_seq_initialization()
    local unit_name = self._unit:name()
 	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
       	
	--BEAT COP FACE STUFF STARTS HERE	
	local cop1_4 = unit_name == Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
	or unit_name == Idstring("units/payday2/characters/ene_cop_1/ene_cop_1_husk")
	or unit_name == Idstring("units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest")
	or unit_name == Idstring("units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest_husk")
	or unit_name == Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
	or unit_name == Idstring("units/payday2/characters/ene_cop_3/ene_cop_3_husk")
	
	local cop2_3 = unit_name == Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") 
	or unit_name == Idstring("units/payday2/characters/ene_cop_2/ene_cop_2_husk")	
	or unit_name == Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	or unit_name == Idstring("units/payday2/characters/ene_cop_4/ene_cop_4_husk")
	or unit_name == Idstring("units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest")
	or unit_name == Idstring("units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest_husk")
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_cop_1_4") and cop1_4 then
		self._unit:damage():run_sequence_simple("pick_mats_for_cop_1_4")
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_cop_2_3") and cop2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_cop_2_3")	
	end	
	--END BEAT COP FACE STUFF

	-- sniper nonsense (don't trust this being executed every time a common unit spawns tbh)
	local sniper_fbi = unit_name == Idstring("units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc") 
	or unit_name == Idstring("units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc_husk")
	
	local sniper_blue = unit_name == Idstring("units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc") 
	or unit_name == Idstring("units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc_husk")
	
	local sniper_gensec = unit_name == Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3") 
	or unit_name == Idstring("units/payday2/characters/ene_sniper_3/ene_sniper_3_husk")

	local switch_mat_config_federales_sniper = unit_name == Idstring("units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1")
	or unit_name == Idstring("units/pd2_dlc_bex/characters/ene_sniper_1/ene_sniper_1_husk")

	if faction == "federales" and difficulty_index == 6 then
		if self._unit:damage() and self._unit:damage():has_sequence("swap_federales_to_fbi") and switch_mat_config_federales_sniper then
			self._unit:damage():run_sequence_simple("swap_federales_to_fbi")
		elseif faction == "federales" and difficulty_index == 7 then
			if self._unit:damage() and self._unit:damage():has_sequence("swap_federales_to_city") and switch_mat_config_federales_sniper then
				self._unit:damage():run_sequence_simple("swap_federales_to_city")
			end
		end	
	end
	
	if self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_to_lapd") and sniper_fbi and faction == "lapd" then
		self._unit:damage():run_sequence_simple("switch_sniper_to_lapd")
	elseif self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_to_nypd") and sniper_fbi and faction == "nypd" then
		self._unit:damage():run_sequence_simple("switch_sniper_to_nypd")		
	elseif self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_to_zombie") and sniper_fbi and faction == "zombie" then
		self._unit:damage():run_sequence_simple("switch_sniper_to_zombie")		
	end
			
	if self._unit:damage() and self._unit:damage():has_sequence("switch_sniper_3_to_zombie") and sniper_gensec and faction == "zombie" then
		self._unit:damage():run_sequence_simple("switch_sniper_3_to_zombie")	
	end	
	
	--START FBI HRT FACES.
	local fbi_1_2 = unit_name == Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") 
	or unit_name == Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1_husk")	
	or unit_name == Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	or unit_name == Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2_husk")
	
	local fbi_3 = unit_name == Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") 
	or unit_name == Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3_husk")	
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_fbi_1_2") and fbi_1_2 then
		self._unit:damage():run_sequence_simple("pick_mats_for_fbi_1_2")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_fbi_3") and fbi_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_fbi_3")	
	end	 	
	
	--security $!!SLAT^* insanity	
	local sec_2_3 = unit_name == Idstring("units/payday2/characters/ene_security_2/ene_security_2") 
	or unit_name == Idstring("units/payday2/characters/ene_security_2/ene_security_2_husk")
	or unit_name == Idstring("units/payday2/characters/ene_security_3/ene_security_3")
	or unit_name == Idstring("units/payday2/characters/ene_security_3/ene_security_3_husk")
	
	local sec_1 = unit_name == Idstring("units/payday2/characters/ene_security_1/ene_security_1") 
	or unit_name == Idstring("units/payday2/characters/ene_security_1/ene_security_1_husk")
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_sec_1") and sec_1 then
		self._unit:damage():run_sequence_simple("pick_mats_for_sec_1")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_sec_2_3") and sec_2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_sec_2_3")	
	end
	--end security shit
	
    local murk_sec = unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5_husk")	
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870_husk")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45")	
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45_husk")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5_husk")
		
    local murkies = unit_name == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1") 
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk")
	
    if self._unit:damage() and self._unit:damage():has_sequence("murksecrandom") and murk_sec then
        self._unit:damage():run_sequence_simple("murksecrandom")				
    elseif self._unit:damage() and self._unit:damage():has_sequence("set_style_murky") and murkies then
        self._unit:damage():run_sequence_simple("set_style_murky")
    end
end	

local material_config_paths = {
  "units/payday2/characters/ene_cop_vars/ene_cop_var1",
  "units/payday2/characters/ene_cop_vars/ene_cop_var2",
  "units/payday2/characters/ene_cop_vars/ene_cop_var3",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var1",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var2",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var3",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var4",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var5",
  "units/payday2/characters/ene_fbi_vars/ene_fbi_var6",
  "units/payday2/characters/ene_security_vars/ene_security_var1",
  "units/payday2/characters/ene_security_vars/ene_security_var2",
  "units/payday2/characters/ene_security_vars/ene_security_var3",
  "units/payday2/characters/ene_security_vars/ene_security_var4",
  "units/payday2/characters/ene_security_vars/ene_security_var5",
  "units/payday2/characters/ene_security_vars/ene_security_var6",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var1",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var2",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var3",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var4",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var5",
  "units/pd2_mod_lapd/characters/ene_la_cop_vars/ene_la_cop_var6",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var1",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var2",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var3",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var4",
  "units/pd2_mod_lapd/characters/ene_fbi_vars/ene_fbi_var5",  
  "units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_disktrasa"
}

for i, material_config_path in pairs(material_config_paths) do
  local normal_ids = Idstring(material_config_path)
  local contour_ids = Idstring(material_config_path .. "_contour")

  CopBase._material_translation_map[tostring(normal_ids:key())] = contour_ids
  CopBase._material_translation_map[tostring(contour_ids:key())] = normal_ids 
end

--Deleting dozer hats cause it blows people up, pls gib standalone that's always loaded
function CopBase:_chk_spawn_gear()
	local region = tweak_data.levels:get_ai_group_type()
	local difficulty_index = tweak_data:difficulty_to_index(Global and Global.game_settings and Global.game_settings.difficulty or "overkill")

	--Using this only so we can slap this on custom heists
	if restoration and restoration.Options:GetValue("OTHER/Holiday") then
		for _,x in pairs(restoration.christmas_heists) do
			if job == x or Month == "12" then
				if self._tweak_table == "tank_hw" or self._tweak_table == "spooc_titan" or self._tweak_table == "autumn" then
					--In case we decide to give these guys a unique hat that has some crazy seq manager stuff
				elseif self._tweak_table == "tank_medic" or self._tweak_table == "tank_mini" or self._tweak_table == "spring" then
					self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_zeal_santa_hat_sc/ene_acc_dozer_zeal_santa_hat_sc", Vector3(), Rotation())
				elseif self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2") or self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_vip_2/ene_vip_2_husk") then
					--These guys need a unique hat shifted down, can be done whenever				
				elseif self._tweak_table == "tank_titan" or self._tweak_table == "tank_titan_assault" then
					if region == "russia" or region == "federales" then
						self._headwear_unit = safe_spawn_unit("units/payday2/characters/ene_acc_spook_santa_hat_sc/ene_acc_spook_santa_hat_sc", Vector3(), Rotation())					
					else
						self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_zeal_santa_hat_sc/ene_acc_dozer_zeal_santa_hat_sc", Vector3(), Rotation())
					end
				elseif self._tweak_table == "tank" then
					if region == "russia" or region == "federales" then
						self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_akan_santa_hat_sc/ene_acc_dozer_akan_santa_hat_sc", Vector3(), Rotation())
					elseif difficulty_index == 8 then
						self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_zeal_santa_hat_sc/ene_acc_dozer_zeal_santa_hat_sc", Vector3(), Rotation())
					else
						self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_santa_hat_sc/ene_acc_dozer_santa_hat_sc", Vector3(), Rotation())
					end			
				elseif self:char_tweak().is_special then
					self._headwear_unit = safe_spawn_unit("units/payday2/characters/ene_acc_spook_santa_hat_sc/ene_acc_spook_santa_hat_sc", Vector3(), Rotation())					
				end

				if self._headwear_unit then
					local align_obj_name = Idstring("Head")
					local align_obj = self._unit:get_object(align_obj_name)

					self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
				end
			end
		end
	end
end

local weapons_map = {
	--Secret Service Bois--
	[Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = {"m1911_npc", "mp5", "m4"},

	--Biker Weapon Changes--
	[Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"):key()] = {"c45", "m4", "r870"},
	
	--Female Bikers
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/pd2_dlc_hvh/characters/ene_bulldozer_hvh_2/ene_bulldozer_hvh_2"):key()] = "aa12_npc",

	--Mendoza Weapon Changes
	[Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	--Cobras Weapon Changes
	["man"] = {
		[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = "c45",
		[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = "raging_bull",
		[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = "c45",
		[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = "raging_bull",
	},
	[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer"):key()] = {"ak47", "r870"},

	--Russian Gangster Weapon Changes
	[Idstring("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	-- colombians
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_1/ene_gang_colombian_1"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_2/ene_gang_colombian_2"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_3/ene_gang_colombian_3"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"):key()] = {"ak47", "r870"},
	
	--Bolivian Weapons
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = {"c45", "mac11", "mossberg", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = {"c45", "mac11", "mossberg", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = {"raging_bull", "mac11", "ak47"},
	
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"):key()] = {"c45", "mac11", "mp5", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"):key()] = {"c45", "mac11", "mp5", "mossberg", "ak47", "raging_bull"},
	
	--Border Crossing Guards
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_thug_outdoor_02/ene_mex_thug_outdoor_02"):key()] = {"m1911_npc", "mac11", "mossberg", "ak47", "raging_bull"},
	
	--Triads (Because why the fuck they carry only pistols)
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = {"deagle", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = {"deagle", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = {"deagle", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = {"deagle", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"):key()] = {"deagle", "ak47", "mossberg", "c45"},
	
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"):key()] = {"m1911_npc", "mac11", "ak47"},
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"):key()] = {"m1911_npc", "mac11", "ak47"},
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"):key()] = {"m1911_npc", "mac11", "ak47"},
	
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"):key()] = {"m1911_npc", "ak47", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"):key()] = {"m1911_npc", "ak47", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	
	["man"] = {
		[Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = {"c45", "raging_bull", "m4", "r870"},
		[Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = {"c45", "raging_bull", "m4", "r870"},
	},
	[Idstring("units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1"):key()] = "c45",
	[Idstring("units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2"):key()] = "c45",
	[Idstring("units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3"):key()] = "c45",
	[Idstring("units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4"):key()] = "c45",
	[Idstring("units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1"):key()] = "raging_bull",
	[Idstring("units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2"):key()] = "raging_bull",
	[Idstring("units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3"):key()] = "raging_bull",
	[Idstring("units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4"):key()] = "raging_bull",
	
	--Midland Ranch Guards
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"):key()] = {"c45", "raging_bull", "mac11", "m4", "r870"},
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"):key()] = {"c45", "raging_bull", "mac11", "m4", "r870"},
	
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranchmanager_1/ene_male_ranchmanager_1"):key()] = {"c45", "raging_bull", "mac11"},

	--Security Guards
	[Idstring("units/payday2/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5"},
	[Idstring("units/payday2/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5"},
	[Idstring("units/payday2/characters/ene_security_3/ene_security_3"):key()] = "r870",
	[Idstring("units/payday2/characters/ene_security_4/ene_security_4"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_5/ene_security_5"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_6/ene_security_6"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_7/ene_security_7"):key()] = "r870",
	[Idstring("units/payday2/characters/ene_security_8/ene_security_8"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1"):key()] = {"deagle", "ump"},
	[Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2"):key()] = {"deagle", "ump"},
	
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = {"m1911_npc", "mp5", "m4"},
	
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45"):key()] = {"c45", "mp5", "m4"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5"):key()] = {"c45", "mp5", "m4"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"):key()] = {"raging_bull", "mp5", "m4"},
	
	[Idstring("units/pd2_mod_reapers/characters/ene_security_1/ene_security_1"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	[Idstring("units/pd2_mod_reapers/characters/ene_security_2/ene_security_2"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	[Idstring("units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	
	[Idstring("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = {"m1911_npc", "mp5", "m4"},
	
	
	[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1"):key()] = {"m1911_npc", "ump", "m4"},
	[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"):key()] = {"m1911_npc", "ump", "m4"},
	
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"):key()] = {"c45", "mp5", "r870"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"):key()] = {"c45", "mp5", "r870"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"):key()] = {"c45", "mp5", "r870"},
	
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"):key()] = {"m1911_npc", "mp5", "r870"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"):key()] = {"m1911_npc", "mp5", "r870"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"):key()] = {"m1911_npc", "mp5", "r870"},
	
	[Idstring("units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"):key()] = "r870",
	
	[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = {"m1911_npc", "deagle", "ump", "scar_murky"},
	[Idstring("units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = {"m1911_npc", "deagle", "ump", "scar_murky"},
	
	[Idstring("units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"):key()] = {"ump", "r870", "scar_murky"},
	[Idstring("units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"):key()] = {"ump", "r870", "scar_murky"},

	--Giving Friendly AI silenced pistols
	[Idstring("units/pd2_dlc_spa/characters/npc_spa/npc_spa"):key()] = "beretta92",
	[Idstring("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2"):key()] = "beretta92",
	[Idstring("units/pd2_dlc_berry/characters/npc_locke/npc_locke"):key()] = "beretta92",

	--Giving Vanilla Titanshields their silent pistols
	[Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1"):key()] = "beretta92_titan",
}

local default_weapon_name_orig = CopBase.default_weapon_name
function CopBase:default_weapon_name(...)
	local job = Global.level_data and Global.level_data.level_id or ""
	local weapon_override = weapons_map[job] and weapons_map[job][self._unit:name():key()] or weapons_map[self._unit:name():key()]
	
	--For Jungle Inferno Mutator
	if not self._weapon_set and restoration and restoration.disco_inferno and not self._char_tweak.no_mutator_weapon_override then
		self._default_weapon_id = "flamethrower"
		self._weapon_set = true		
	end
	
	if not self._weapon_set and weapon_override then
		self._default_weapon_id = type(weapon_override) == "table" and table.random(weapon_override) or weapon_override
		self._weapon_set = true
	end

	return default_weapon_name_orig(self, ...)
end

local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")

function CopBase:set_visibility_state(stage)
	local state = stage and true
	if not state and not self._allow_invisible then
		state = true
		stage = 3 -- lowest lod stage since the only time this gets called with stage as false is if the unit is not in sight
	end

	if self._lod_stage == stage then
		return
	end

	local inventory = self._unit:inventory()
	local weapon = inventory and inventory.get_weapon and inventory:get_weapon()

	if weapon then
		-- flashlight enables if the unit is visible and in LOD stage 1/2 instead of only LOD stage 2
		weapon:base():set_flashlight_light_lod_enabled(stage and stage <= 2)
	end

	if self._visibility_state ~= state then
		local unit = self._unit

		if inventory then
			inventory:set_visibility_state(state)
		end

		unit:set_visible(state)

		if self._headwear_unit then
			self._headwear_unit:set_visible(state)
		end

		if state or self._ext_anim.can_freeze and (not self._ext_anim.upper_body_active or self._ext_anim.upper_body_empty) then
			unit:set_animatable_enabled(ids_lod, state)
			unit:set_animatable_enabled(ids_ik_aim, state)
		end

		self._visibility_state = state
	end

	if state then
		self:set_anim_lod(stage)
		self._unit:movement():enable_update(true)

		if stage == 1 then
			self._unit:set_animatable_enabled(ids_lod1, true)
		elseif self._lod_stage == 1 then
			self._unit:set_animatable_enabled(ids_lod1, false)
		end
	end

	self._lod_stage = stage

	self:chk_freeze_anims()
end

function CopBase:chk_freeze_anims()
	if (not self._lod_stage or self._lod_stage > 1) and self._ext_anim.can_freeze and (not self._ext_anim.upper_body_active or self._ext_anim.upper_body_empty) then
		if not self._anims_frozen then
			self._anims_frozen = true

			self._unit:set_animations_enabled(false)
			self._ext_movement:on_anim_freeze(true)
		end
	elseif self._anims_frozen then
		self._anims_frozen = nil

		self._unit:set_animations_enabled(true)
		self._ext_movement:on_anim_freeze(false)
	end
end
