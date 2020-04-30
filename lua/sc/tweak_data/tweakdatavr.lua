function TweakDataVR:init_skills(tweak_data)
	self.post_warp = {
		min = 0,
		max = 0
	}
	self.steelsight_stamina_regen = 0

	local stamina_regen_macro = tostring(self.steelsight_stamina_regen * 100) .. "%"
	self.skill_descs_addons = {}
end