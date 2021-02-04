Month = os.date("%m")
local job = Global.level_data and Global.level_data.level_id

Hooks:PostHook(CopBase, "post_init", "postinithooksex", function(self)
    -- log("cursed mod xd")
    self:random_mat_seq_initialization()
	
	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	end
	if self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or managers.skirmish:is_skirmish() and self._tweak_table == "autumn" then
		GroupAIStateBesiege:set_assault_endless(true)
		managers.hud:set_buff_enabled("vip", true)
	end		
end)

function CopBase:random_mat_seq_initialization()
    local unit_name = self._unit:name()
        	
	--BEAT COP FACE STUFF STARTS HERE	
	local cop1_4 = unit_name == Idstring("units/payday2/characters/ene_cop_1/ene_cop_1")
	or unit_name == Idstring("units/payday2/characters/ene_cop_3/ene_cop_3")
	
	local cop2_3 = unit_name == Idstring("units/payday2/characters/ene_cop_2/ene_cop_2") 
	or unit_name == Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
	
	local lacop1_4 = unit_name == Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1") 
	or unit_name == Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3")
	
	local lacop2_3 = unit_name == Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2") 
	or unit_name == Idstring("units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4")
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_cop_1_4") and cop1_4 then
		self._unit:damage():run_sequence_simple("pick_mats_for_cop_1_4")
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_cop_2_3") and cop2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_cop_2_3")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_lacop_2_3") and lacop2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_lacop_2_3")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_lacop_1_4") and lacop1_4 then
		self._unit:damage():run_sequence_simple("pick_mats_for_lacop_1_4")	
	end	
	--END BEAT COP FACE STUFF

	
	--START FBI HRT FACES. fuck this useless enemy! praise jules for removing him!
	local fbi_1_2 = unit_name == Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1") 
	or unit_name == Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
	
	local fbi_3 = unit_name == Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3") 
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_fbi_1_2") and fbi_1_2 then
		self._unit:damage():run_sequence_simple("pick_mats_for_fbi_1_2")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_fbi_3") and fbi_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_fbi_3")	--he is obscured so there's no need to replace him.
	end	 	
	--END FBI FACE NONSENSE

	
	--security $!!SLAT^* insanity	
	local sec_2_3 = unit_name == Idstring("units/payday2/characters/ene_security_2/ene_security_2") 
	or unit_name == Idstring("units/payday2/characters/ene_security_3/ene_security_3")
	
	local sec_1 = unit_name == Idstring("units/payday2/characters/ene_security_1/ene_security_1") 
	
	
	if self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_sec_1") and sec_1 then
		self._unit:damage():run_sequence_simple("pick_mats_for_sec_1")	
	elseif self._unit:damage() and self._unit:damage():has_sequence("pick_mats_for_sec_2_3") and sec_2_3 then
		self._unit:damage():run_sequence_simple("pick_mats_for_sec_2_3")	
	end
	--end security shit
	
    local murk_sec = unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5") 
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_r870/ene_murky_cs_cop_r870")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_c45/ene_murky_cs_cop_c45")
    or unit_name == Idstring("units/pd2_mod_sharks/characters/ene_murky_cs_cop_mp5/ene_murky_cs_cop_mp5")
		
    local murkies = unit_name == Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1") 
	
	if self._unit:damage() and self._unit:damage():has_sequence("nypdrandom") and nypd_cops then
        self._unit:damage():run_sequence_simple("nypdrandom")
    elseif self._unit:damage() and self._unit:damage():has_sequence("murksecrandom") and murk_sec then
        self._unit:damage():run_sequence_simple("murksecrandom")				
    elseif self._unit:damage() and self._unit:damage():has_sequence("set_style_murky") and murkies then
        self._unit:damage():run_sequence_simple("set_style_murky")
    end
end	

local material_config_paths = {
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

function CopBase:default_weapon_name()
	local default_weapon_id = self._default_weapon_id
	local weap_ids = tweak_data.character.weap_ids
	
	local job = Global.level_data and Global.level_data.level_id

	--M1911 Users--
	if self._unit:name() == Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1") 
	or self._unit:name() == Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2")
	or self._unit:name() == Idstring("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service")	then
		default_weapon_id = "m1911_npc"
	end
	
	--Blue SWAT Weapon Changes (test)--
	if self._unit:name() == Idstring("units/payday2/characters/ene_swat_1/ene_swat_1") then
		default_weapon_id = "m4_blue"	
	elseif self._unit:name() == Idstring("units/pd2_dlc_hvh/characters/ene_swat_hvh_1/ene_swat_hvh_1") then
		default_weapon_id = "m4_blue"	
	end		
	
	--Yellow Heavy SWAT Weapon Changes (test)
	if self._unit:name() == Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass") then
		default_weapon_id = "ak102"		
	end		
	
	--Biker Weapon Changes--
	if self._unit:name() == Idstring("units/payday2/characters/ene_biker_1/ene_biker_1") then
		default_weapon_id = "mac11"
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_biker_2/ene_biker_2") then
		default_weapon_id = "mossberg"
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_biker_3/ene_biker_3") then
		default_weapon_id = "ak47"
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_biker_4/ene_biker_4") then
		default_weapon_id = "raging_bull"			
	end
	
	--Mendoza Weapon Changes
	if self._unit:name() == Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1") then
		default_weapon_id = "mac11"
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2") then
		default_weapon_id = "mossberg"
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3") then
		default_weapon_id = "ak47"
	elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4") then
		default_weapon_id = "raging_bull"			
	end
	
	--Cobras Weapon Changes
	if job == "man" then
		if self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1") then
			default_weapon_id = "c45"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2") then
			default_weapon_id = "raging_bull"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3") then
			default_weapon_id = "c45"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4") then
			default_weapon_id = "raging_bull"			
		end		
	else
		if self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1") then
			default_weapon_id = "mac11"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2") then
			default_weapon_id = "mossberg"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3") then
			default_weapon_id = "ak47"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4") then
			default_weapon_id = "raging_bull"			
		end				
	end
	
	--Russian Gangster Weapon Changes
	if job == "spa" then
		if self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1") then
			default_weapon_id = "ak47"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2") then
			default_weapon_id = "raging_bull"	
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3") then
			default_weapon_id = "mossberg"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5") then
			default_weapon_id = "ak47"			
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4") then
			default_weapon_id = "mac11"			
		end		
	else
		if self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1") then
			default_weapon_id = "mossberg"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2") then
			default_weapon_id = "raging_bull"	
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3") then
			default_weapon_id = "ak47"
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5") then
			default_weapon_id = "ak47"			
		elseif self._unit:name() == Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4") then
			default_weapon_id = "mac11"			
		end				
	end
	
	--Bolivian Weapons
	if self._unit:name() == Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01") then
		default_weapon_id = "mossberg"	
	elseif self._unit:name() == Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02") then
		default_weapon_id = "mac11"		
	elseif self._unit:name() == Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager") then
		default_weapon_id = "raging_bull"				
	end
	
	if self._unit:name() == Idstring("units/pd2_dlc_bex/characters/ene_swat_dozer_policia_federale_m249/ene_swat_dozer_policia_federale_m249") then
		default_weapon_id = "m60"				
	end
	
	--Security Guards
	if self._unit:name() == Idstring("units/payday2/characters/ene_security_3/ene_security_3") then
		default_weapon_id = "r870"	
	end

	--Giving Friendly AI silenced pistols
	if self._unit:name() == Idstring("units/pd2_dlc_spa/characters/npc_spa/npc_spa") then
		default_weapon_id = "beretta92"	
	elseif self._unit:name() == Idstring("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2") then
		default_weapon_id = "beretta92"				
	elseif self._unit:name() == Idstring("units/pd2_dlc_berry/characters/npc_locke/npc_locke") then
		default_weapon_id = "beretta92"					
	end
	
	--Giving Vanilla Titanshields their silent pistols
	if self._unit:name() == Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1") then
		default_weapon_id = "beretta92_titan"	
	end	

	for i_weap_id, weap_id in ipairs(weap_ids) do
		if default_weapon_id == weap_id then
			return tweak_data.character.weap_unit_names[i_weap_id]
		end
	end
end

local init_orig = CopBase.init
function CopBase:init(unit)
	init_orig(self, unit)
	
	self.my_voice = nil
	self.voice_length = 0
	self.voice_start_time = 0
	self:play_voiceline(nil, nil)
end

function CopBase:play_voiceline(buffer, force)
	if buffer then
		if force and self.my_voice and not self.my_voice:is_closed() then
			self.my_voice:stop()
			self.my_voice:close()
			self.my_voice = nil
			self.voice_length = 0
		end
		local _time = math.floor(TimerManager:game():time())
		if self.voice_length == 0 or self.voice_start_time < _time then
			if self.my_voice and not self.my_voice:is_closed() then
				self.my_voice:stop()
				self.my_voice:close()
				self.my_voice = nil
			end
			self.my_voice = XAudio.UnitSource:new(self._unit, buffer)
			self.voice_length = buffer:get_length()
			self.voice_start_time = _time + buffer:get_length()
		end
	end
end