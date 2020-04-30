local jam = TimerGui.set_jammed
function TimerGui:set_jammed(jammed,...)
	if jammed and managers.groupai:state():whisper_mode() then 
		--2STELTHY4JAM
		return
	end
	return jam(self,jammed,...)
end