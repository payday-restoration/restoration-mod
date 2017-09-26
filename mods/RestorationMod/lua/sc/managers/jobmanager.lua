if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	--[[
	function JobManager:is_current_job_professional()
		if not self._global.current_job then
			return
		end

		--Just to suffer--
		return Global.game_settings.difficulty == "sm_wish"
	end
	]]--

end