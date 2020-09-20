local jam = TimerGui.set_jammed
function TimerGui:set_jammed(jammed,...)
	if jammed and managers.groupai:state():whisper_mode() then 
		--2STELTHY4JAM
		return
	end
	return jam(self,jammed,...)
end

Hooks:PostHook(TimerGui, "setup", "ResDrillFix", function(self)
	--Lowers drill screen brightness
	self._gui_script.panel:set_alpha(0.6)
end)
