if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	
	function CopSound:init(unit)
		self._unit = unit
		self._speak_expire_t = 0
		local char_tweak = tweak_data.character[unit:base()._tweak_table]

		self:set_voice_prefix(nil)

		local nr_variations = char_tweak.speech_prefix_count
				
		if char_tweak.speech_prefix_p1 == "l5d" then
			self._prefix = (char_tweak.speech_prefix_p1 or "") .. "_"
		else
			self._prefix = (char_tweak.speech_prefix_p1 or "") .. (nr_variations and tostring(math.random(nr_variations)) or "") .. (char_tweak.speech_prefix_p2 or "") .. "_"
		end

		if self._unit:base():char_tweak()["custom_voicework"] then
			local voicelines = _G.voiceline_framework.BufferedSounds[self._unit:base():char_tweak().custom_voicework]
			if voicelines and voicelines["spawn"] then
				local line_to_use = voicelines.spawn[math.random(#voicelines.spawn)]
				self._unit:base():play_voiceline(line_to_use, true)
			end
		elseif self._unit:base():char_tweak().spawn_sound_event then
			self._unit:sound():play(self._unit:base():char_tweak().spawn_sound_event, nil, nil)
		end

		unit:base():post_init()
	end
	
end
