if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local jam = TimerGui.set_jammed
	function TimerGui:set_jammed(jammed,...)
		if jammed and managers.groupai:state():whisper_mode() then 
			--2STELTHY4JAM
			return
		end
		return jam(self,jammed,...)
	end

end