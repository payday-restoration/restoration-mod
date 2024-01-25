if _G.IS_VR then
	--Ditto
else	

	local _update_stats_values_original = AkimboWeaponBase._update_stats_values
	local fire_original = AkimboWeaponBase.fire
	local fire_rate_multiplier_original = AkimboWeaponBase.fire_rate_multiplier
	local toggle_firemode_original = AkimboWeaponBase.toggle_firemode
	
	local init_original = AkimboWeaponBase.init

	function AkimboWeaponBase:init(...)
		init_original(self, ...)
		local fire_mode_data = tweak_data.weapon[self._name_id].fire_mode_data
		if fire_mode_data then
			fire_mode_data.original_fire_rate = fire_mode_data.original_fire_rate or fire_mode_data.fire_rate
		end
	end

	function AkimboWeaponBase:_update_stats_values(...)
		_update_stats_values_original(self, ...)
		
		if not self:is_npc() then
			self._has_burst_fire = self._has_burst_fire or ((self:weapon_tweak_data().BURST_FIRE ~= false) and (self._fire_mode == NewRaycastWeaponBase.IDSTRING_SINGLE))
			
			if not self._set_burst_spawn and self._has_burst_fire then
				self._set_burst_spawn = true --fix to stop forcing burst upon switching back to the main weapon
				self:_set_burst_mode(not self._manual_fire_second_gun, true)
			end
		end
	end
	
	--[[
	function AkimboWeaponBase:fire(...)
		local results = fire_original(self, ...)
		
		if not self:_in_burst_or_auto_mode() then
			self._fire_callbacks = {}
		end
		
		return results
	end
	]]

	function AkimboWeaponBase:fire(...)
		self._second_turn = not self._second_turn
		local result
		
		if not self._second_turn then
			result = AkimboWeaponBase.super.fire(self, ...)
		elseif alive(self._second_gun) then
			result = self._second_gun:base().super.fire(self._second_gun:base(), ...)
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



	function AkimboWeaponBase:fire_rate_multiplier(...)
		return fire_rate_multiplier_original(self, ...) * (self:_in_burst_or_auto_mode() and 1 or 1)
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

-- Fix npc akimbo weapons to aktually fire both guns, from Streamlined Heisting
function NPCAkimboWeaponBase:fire(...)
	if self._fire_second_gun_next then
		self._fire_second_gun_next = false
		if alive(self._second_gun) then
			return self._second_gun:base().super.fire(self._second_gun:base(), ...)
		end
	else
		self._fire_second_gun_next = true
		return self.super.fire(self, ...)
	end
end

