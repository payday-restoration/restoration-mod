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
