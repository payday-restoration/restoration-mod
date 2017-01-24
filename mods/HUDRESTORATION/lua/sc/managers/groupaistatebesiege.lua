if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function GroupAIStateBesiege:_check_spawn_phalanx()
	if self._task_data and self._task_data.assault.active and self._phalanx_center_pos and not self._phalanx_spawn_group then
		if self._task_data.assault.phase == "build" or self._task_data.assault.phase == "sustain" then
		local now = TimerManager:game():time()
		local respawn_delay = tweak_data.group_ai.phalanx.spawn_chance.respawn_delay
		if not self._phalanx_despawn_time or now >= self._phalanx_despawn_time + respawn_delay then
			local spawn_chance_start = tweak_data.group_ai.phalanx.spawn_chance.start
			self._phalanx_current_spawn_chance = self._phalanx_current_spawn_chance or spawn_chance_start
			self._phalanx_last_spawn_check = self._phalanx_last_spawn_check or now
			self._phalanx_last_chance_increase = self._phalanx_last_chance_increase or now
			local spawn_chance_increase = tweak_data.group_ai.phalanx.spawn_chance.increase
			local spawn_chance_max = tweak_data.group_ai.phalanx.spawn_chance.max
			if spawn_chance_max > self._phalanx_current_spawn_chance and spawn_chance_increase > 0 then
				local chance_increase_intervall = tweak_data.group_ai.phalanx.chance_increase_intervall
				if now >= self._phalanx_last_chance_increase + chance_increase_intervall then
					self._phalanx_last_chance_increase = now
					self._phalanx_current_spawn_chance = math.min(spawn_chance_max, self._phalanx_current_spawn_chance + spawn_chance_increase)
					print("Phalanx spawn chance increased to ", self._phalanx_current_spawn_chance)
				end
			else
			end
			if self._phalanx_current_spawn_chance > 0 then
				local check_spawn_intervall = tweak_data.group_ai.phalanx.check_spawn_intervall
				if now >= self._phalanx_last_spawn_check + check_spawn_intervall then
					self._phalanx_last_spawn_check = now
					print("Spawn chance roll...")
					if math.random() <= self._phalanx_current_spawn_chance then
						self:_spawn_phalanx()
					else
						print("Spawn chance roll failed!")
					end
				end
			end
		end
	end
	else
	end
end

end