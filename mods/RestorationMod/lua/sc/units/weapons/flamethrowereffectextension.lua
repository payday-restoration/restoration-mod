if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	local old_effect_update = FlamethrowerEffectExtension.update
	function FlamethrowerEffectExtension:update(...)
		if FlamethrowerEffectExtension.super.flame_max_range then
			self._flame_max_range = FlamethrowerEffectExtension.super.flame_max_range
		end
		old_effect_update(self, ...)
	end

end