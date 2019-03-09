if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	
	Month = os.date("%m")
	function CopBase:_chk_spawn_gear()
		if self._tweak_table == "spooc" then
			self._unit:damage():run_sequence_simple("turn_on_spook_lights")
		end
		if self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" then
			GroupAIStateBesiege:set_assault_endless(true)
			managers.hud:set_buff_enabled("vip", true)
		end	
		if restoration and restoration.Options:GetValue("SC/Holiday") then
			if Global.level_data.level_id == "pines" or Global.level_data.level_id == "roberts" or Global.level_data.level_id == "cane" or Global.level_data.level_id == "moon" or Month == "12" then
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
