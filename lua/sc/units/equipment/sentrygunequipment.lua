function SentryGunEquipment:_on_damage_received_event(health_ratio)
	if health_ratio < self._DAMAGE_EFFECTS_2 then
		if not self._second_pass_active then
			self._unit:damage():run_sequence_simple("damage_second_pass")
			self._second_pass_active = true
		end
	elseif health_ratio < self._DAMAGE_EFFECTS_1 then
		if not self._first_pass_active then
			self:_check_sound()
			self._unit:damage():run_sequence_simple("damage_first_pass")
			self._first_pass_active = true
		end
	end
end

function SentryGunEquipment:_on_death_event()
	if self._broken_loop_snd_event then
		self._broken_loop_snd_event:stop()

		self._broken_loop_snd_event = nil
	end

	self._unit:sound_source():post_event("wp_sentrygun_destroy")
	self._unit:damage():run_sequence_simple("destroyed")
end