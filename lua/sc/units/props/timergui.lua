Hooks:PostHook(TimerGui, "setup", "ResDrillFix", function(self)
	--Lowers drill screen brightness
	self._gui_script.panel:set_alpha(0.6)
end)

function DrillTimerGui:set_jammed(jammed)
	if jammed and managers.groupai:state():whisper_mode() then 
		--2STELTHY4JAM
		return
	end

	if managers.network:session() then
		local event_id = jammed and DrillTimerGui.EVENT_IDS.jammed or DrillTimerGui.EVENT_IDS.unjammed

		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "timer_gui", event_id)
	end

	self:_set_jammed(jammed)
end

-- Set an upper limit for how many times drills, saws, etc can randomly jam, based on their timers
Hooks:PreHook(TimerGui, "_set_jamming_values", "sh__set_jamming_values", function (self)
	if self._can_jam then
		self._jam_times = math.min(self._jam_times, math.ceil(self._timer / 60))
	end
end)


-- Skip next scheduled jam if it's going to happen very shortly after unjamming
Hooks:PostHook(TimerGui, "set_jammed", "sh_set_jammed", function (self, jammed)
	if not jammed and self._current_jam_timer and self._current_jam_timer < 5 / self:get_timer_multiplier() then
		self._current_jam_timer = table.remove(self._jamming_intervals, 1)
	end
end)