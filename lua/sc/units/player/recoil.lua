if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	function FPCameraPlayerBase:stop_shooting(wait)
		self._recoil_kick.to_reduce = self._recoil_kick.accumulated * 0
		self._recoil_kick.h.to_reduce = self._recoil_kick.h.accumulated * 0
		self._recoil_wait = wait or 0
	end

end