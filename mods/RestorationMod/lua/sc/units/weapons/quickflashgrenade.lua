if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function QuickFlashGrenade:_beep()		
		self._unit:sound_source():post_event("pfn_beep")
	
		self._beep_t = self:_get_next_beep_time()
		self._light_multiplier = tweak_data.group_ai.flash_grenade.beep_multi
	end

end