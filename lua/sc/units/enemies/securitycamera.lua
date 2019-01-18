if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

--[[local gen_cooldown = SecurityCamera.generate_cooldown
function SecurityCamera:generate_cooldown(amount)
	if managers.job and (managers.job:current_job_id() == "safehouse" or managers.job:current_job_id() == "custom_safehouse" or managers.job:current_job_id() == "chill" or managers.job:current_job_id() == "chill_combat") then
		--Smashing your own security cameras isn't the best idea
	else
		managers.hint:show_hint("destroyed_security_camera")
	end
	return gen_cooldown(self, amount)
end]]--
--rest in peiece maybe we can do something cool with cams one day
end