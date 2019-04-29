if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local orig_raycast = TripMineBase._raycast
	function TripMineBase:_raycast(...)
		if self.blackout_active then 
			return {}
		end
		return orig_raycast(self,...)
	end

	function TripMineBase:_sensor(t)
		local ray = self:_raycast()

		if ray and ray.unit and not tweak_data.character[ray.unit:base()._tweak_table].is_escort then
			self._sensor_units_detected = self._sensor_units_detected or {}

			if not self._sensor_units_detected[ray.unit:key()] then
				self._sensor_units_detected[ray.unit:key()] = true

				if managers.player:has_category_upgrade("trip_mine", "sensor_highlight") then
					if (managers.groupai:state():whisper_mode() and tweak_data.character[ray.unit:base()._tweak_table].silent_priority_shout or tweak_data.character[ray.unit:base()._tweak_table].priority_shout) then
						managers.game_play_central:auto_highlight_enemy(ray.unit, true)
					end
					self:_emit_sensor_sound_and_effect()

					if managers.network:session() then
						managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", TripMineBase.EVENT_IDS.sensor_beep)
					end
				end

				self._sensor_last_unit_time = t + 5
			end
		end
	end

end