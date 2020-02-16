if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local setup_original = NewNPCRaycastWeaponBase.setup

	function NewNPCRaycastWeaponBase:setup(setup_data, ...)
		setup_original(self, setup_data, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)
		local user_unit = setup_data.user_unit
		if user_unit then
			if user_unit:in_slot(16) then
				self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16, 22)
			end
		end

		if self._is_team_ai and managers.player:has_category_upgrade("team", "crew_ai_ap_ammo") then
			self._use_armor_piercing = true
		end
	end
	
end
