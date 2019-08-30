if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	HUDManager._USE_BURST_MODE = true	

	HUDManager.set_teammate_weapon_firemode_burst = HUDManager.set_teammate_weapon_firemode_burst or function(self, id)
		self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
	end	
	
end