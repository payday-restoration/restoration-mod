if _G.IS_VR then
	--Ditto
else	

	local _update_stats_values_original = AkimboWeaponBase._update_stats_values
	local fire_original = AkimboWeaponBase.fire
	local fire_rate_multiplier_original = AkimboWeaponBase.fire_rate_multiplier
	local toggle_firemode_original = AkimboWeaponBase.toggle_firemode
	
	function AkimboWeaponBase:_update_stats_values(...)
		_update_stats_values_original(self, ...)
		
		if not self:is_npc() then
			self._has_burst_fire = self._has_burst_fire or ((self:weapon_tweak_data().BURST_FIRE ~= false) and (self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE))
			
			if self._has_burst_fire then
				self:_set_burst_mode(not self._manual_fire_second_gun, true)
			end
		end
	end
	
	function AkimboWeaponBase:fire(...)
		local results = fire_original(self, ...)
		
		if not self:_in_burst_or_auto_mode() then
			self._fire_callbacks = {}
		end
		
		return results
	end
	
	function AkimboWeaponBase:fire_rate_multiplier(...)
		return fire_rate_multiplier_original(self, ...) * (self:_in_burst_or_auto_mode() and 1 or 2)
	end
	
	--Override
	function AkimboWeaponBase:toggle_firemode(...)
		return self._has_burst_fire and self:_check_toggle_burst() or toggle_firemode_original(self, ...)
	end

	
	function AkimboWeaponBase:_set_burst_mode(status, skip_sound)
		if alive(self._second_gun) then
			self._second_gun:base():_set_burst_mode(status, skip_sound)
		end
		
		return AkimboWeaponBase.super._set_burst_mode(self, status, skip_sound)
	end
	
	function AkimboWeaponBase:_in_burst_or_auto_mode()
		return self._fire_mode == NewRaycastWeaponBase.IDSTRING_AUTO or self:in_burst_mode()
	end
	
end	