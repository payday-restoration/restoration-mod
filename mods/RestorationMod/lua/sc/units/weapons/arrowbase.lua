if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function ArrowBase:_setup_from_tweak_data(arrow_entry)
		local arrow_entry = self._tweak_projectile_entry or "west_arrow"
		local tweak_entry = tweak_data.projectiles[arrow_entry]
		self._damage_class_string = tweak_data.projectiles[self._tweak_projectile_entry].bullet_class or "InstantBulletBase"
		self._damage_class = CoreSerialize.string_to_classtable(self._damage_class_string)
		self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
		self._damage = tweak_entry.damage or 1
		self._slot_mask = managers.slot:get_mask("arrow_impact_targets")
		self._slot_mask = self._slot_mask - World:make_slot_mask(16)
	end

end