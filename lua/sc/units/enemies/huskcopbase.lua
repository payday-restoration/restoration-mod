Hooks:PostHook(HuskCopBase, "post_init", "postinithuskbase", function(self)	
	--Cloakers lights are always on
	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	end
	
	--Captain spawned, enable buff icon
	if self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or managers.skirmish:is_skirmish() and self._tweak_table == "autumn" then
		managers.hud:set_buff_enabled("vip", true)
	end		
end)