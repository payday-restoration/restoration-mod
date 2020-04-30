WeaponFlashLight.EFFECT_OPACITY_MAX = 4 --default 16; used for players
WeaponFlashLight.NPC_GLOW_OPACITY_MAX = 100 --default 100; muzzle glow
WeaponFlashLight.NPC_CONE_OPACITY_MAX = 8 --default 8; projected cone

local spot_angle = 65 --default 60
local haunted_range = 10000 --default 10000
local normal_range = 2000 --default 1000

function WeaponFlashLight:is_haunted()
	if restoration and restoration.Options:GetValue("OTHER/Holiday") then
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

Hooks:PostHook(WeaponFlashLight,"init","resmod_make_flashlights_less_awful",function(self,unit)
	self._light:set_spot_angle_end(spot_angle)
	
	self._light:set_far_range(self:is_haunted() and haunted_range or normal_range)
end)