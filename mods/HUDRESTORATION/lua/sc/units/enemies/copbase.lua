if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

Month = os.date("%m")
function CopBase:_chk_spawn_gear()
	if self._tweak_table == "spring" then
		GroupAIStateBesiege:set_assault_endless(true)
		managers.hud:set_buff_enabled("vip", true)
	end
	if Global.level_data.level_id == "pines" or Global.level_data.level_id == "roberts" or Global.level_data.level_id == "cane" or Global.level_data.level_id == "moon" or Month == "12" then
   		PackageManager:load("packages/narr_pines")
		if self._tweak_table == "spooc" or self._tweak_table == "taser" or self._tweak_table == "tank" or self._tweak_table == "shield" or self._tweak_table == "sniper" or self._tweak_table == "phalanx_minion" or self._tweak_table == "boom" or self._tweak_table == "rboom" or self._tweak_table == "medic" or self._tweak_table == "fbi_vet" or self._tweak_table == "heavy_swat_sniper" or self._tweak_table == "city_swat_titan" or self._tweak_table == "tank_mini" or self._tweak_table == "tank_medic" or self._tweak_table == "tank_titan" or self._tweak_table == "spring" or self._tweak_table == "phalanx_vip" then
			local align_obj_name = Idstring("Head")
			local align_obj = self._unit:get_object(align_obj_name)
			self._headwear_unit = World:spawn_unit(Idstring("units/payday2/characters/ene_acc_spook_santa_hat/ene_acc_spook_santa_hat"), Vector3(), Rotation())
			self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
		end
	end
end

end