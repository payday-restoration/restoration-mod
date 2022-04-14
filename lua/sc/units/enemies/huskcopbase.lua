Hooks:PostHook(HuskCopBase, "post_init", "postinithuskbase", function(self)	
	self._allow_invisible = true

	--Cloakers lights are always on
	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	elseif self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or managers.skirmish:is_skirmish() and self._tweak_table == "autumn" then
		managers.hud:set_buff_enabled("vip", true) --Captain spawned, enable buff icon
	end
	
	if self._tweak_table == "triad_boss" then
		self._unit:body("head"--[[self._unit:character_damage()._head_body_name--]]):set_sphere_radius(15)
		self._unit:body("body"):set_sphere_radius(22)

		self._unit:body("rag_LeftArm"):set_enabled(true)
		self._unit:body("rag_LeftForeArm"):set_enabled(true)

		self._unit:body("rag_RightArm"):set_enabled(true)
		self._unit:body("rag_RightForeArm"):set_enabled(true)

		self._unit:body("rag_LeftArm"):set_sphere_radius(11)
		self._unit:body("rag_LeftForeArm"):set_sphere_radius(7)
		self._unit:body("rag_RightArm"):set_sphere_radius(11)
		self._unit:body("rag_RightForeArm"):set_sphere_radius(7)

		self._unit:body("rag_LeftUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_LeftLeg"):set_sphere_radius(7)
		self._unit:body("rag_RightUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_RightLeg"):set_sphere_radius(7)
	end
		
	self._unit:character_damage():add_listener("asu_laser_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "enable_asu_laser"))
end)
