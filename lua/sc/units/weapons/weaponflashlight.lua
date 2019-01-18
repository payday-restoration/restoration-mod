if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function WeaponFlashLight:is_haunted()
		if restoration and restoration.Options:GetValue("SC/Holiday") then
			local job_id = managers.job and managers.job:current_job_id()
			local tweak = job_id and tweak_data.narrative.jobs[job_id]
			Month = os.date("%m")
			
			if Month == "10" then
				return true
			end
			
			return tweak and tweak.is_halloween_level
		else
			return
		end
		
	end

end