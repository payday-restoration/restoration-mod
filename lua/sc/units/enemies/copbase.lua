if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	
	Month = os.date("%m")
	local job = Global.level_data and Global.level_data.level_id	
	
	function CopBase:_chk_spawn_gear()
		if self._tweak_table == "spooc" then
			self._unit:damage():run_sequence_simple("turn_on_spook_lights")
		end
		if self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" then
			GroupAIStateBesiege:set_assault_endless(true)
			managers.hud:set_buff_enabled("vip", true)
		end	
		if restoration and restoration.Options:GetValue("SC/Holiday") then
			for _,x in pairs(restoration.christmas_heists) do
				if job == x or Month == "12" then
					if self:char_tweak().is_special then
						if self._tweak_table == "tank_hw" or self._tweak_table == "spooc_titan" or self._tweak_table == "autumn" then
						else
							local align_obj_name = Idstring("Head")
							local align_obj = self._unit:get_object(align_obj_name)
							self._headwear_unit = World:spawn_unit(Idstring("units/payday2/characters/ene_acc_spook_santa_hat_sc/ene_acc_spook_santa_hat_sc"), Vector3(), Rotation())
							self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
						end
					end
				end
			end
		end
	end
	
	function CopBase:default_weapon_name()
		local default_weapon_id = self._default_weapon_id
		local weap_ids = tweak_data.character.weap_ids
		
		local job = Global.level_data and Global.level_data.level_id
		
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
			default_weapon_id = "mac11"	
		elseif self._unit:name() == Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02") then
			default_weapon_id = "mossberg"		
		elseif self._unit:name() == Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager") then
			default_weapon_id = "raging_bull"				
		end

		--Giving Friendly AI silenced pistols
		if self._unit:name() == Idstring("units/pd2_dlc_spa/characters/npc_spa/npc_spa") then
			default_weapon_id = "beretta92"	
		elseif self._unit:name() == Idstring("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2") then
			default_weapon_id = "beretta92"				
		elseif self._unit:name() == Idstring("units/pd2_dlc_berry/characters/npc_locke/npc_locke") then
			default_weapon_id = "beretta92"					
		end

		for i_weap_id, weap_id in ipairs(weap_ids) do
			if default_weapon_id == weap_id then
				return tweak_data.character.weap_unit_names[i_weap_id]
			end
		end
	end
	
end
