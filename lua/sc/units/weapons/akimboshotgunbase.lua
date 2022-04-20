if _G.IS_VR then
	--Ditto
else	
	
	function AkimboShotgunBase:fire(...)
		self._second_turn = not self._second_turn
		local result
		if not self._second_turn then
			result = AkimboWeaponBase.super.fire(self, ...)
		elseif alive(self._second_gun) then
			result = self._second_gun:base().super.super.fire(self._second_gun:base(), ...) --"super.super" worked to not make it eat a trigger pull, I'm happy
			if result then
				--self._second_gun:base():_fire_sound()
				managers.hud:set_ammo_amount(self:selection_index(), self:ammo_info())
				self._second_gun:base():tweak_data_anim_play("fire")
			end
		end
		
		if result and self:in_burst_mode() then
			if self:clip_empty() then
				self:cancel_burst()
			else			
				self._burst_rounds_fired = self._burst_rounds_fired + 1
				self._burst_rounds_remaining = (self._burst_rounds_remaining <= 0 and self._burst_size or self._burst_rounds_remaining) - 1
				if self._burst_rounds_remaining <= 0 then
					self:cancel_burst()
				end
			end
		end
		
		return result
	end

	local _update_stats_values_original = AkimboShotgunBase._update_stats_values
	function AkimboShotgunBase:_update_stats_values(...)
		_update_stats_values_original(self, ...)
		
		if not self:is_npc() then
			self._has_burst_fire = self._has_burst_fire or ((self:weapon_tweak_data().BURST_FIRE ~= false) and (self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE))
			
			if self._has_burst_fire then
				self:_set_burst_mode(not self._manual_fire_second_gun, true)
			end
		end
	end
	
end	
