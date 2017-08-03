if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function WeaponFlashLight:is_haunted()
	local job_id = managers.job and managers.job:current_job_id()
	local tweak = job_id and tweak_data.narrative.jobs[job_id]
	return tweak and tweak.is_halloween_level
end

Month = os.date("%m")
if Month == "10" then

function WeaponFlashLight:init(unit)
	WeaponFlashLight.super.init(self, unit)
	self._on_event = "gadget_flashlight_on"
	self._off_event = "gadget_flashlight_off"
	self._a_flashlight_obj = self._unit:get_object(Idstring("a_flashlight"))
	local is_haunted = managers.job and (managers.job:current_job_id() == "haunted" or managers.job:current_job_id() == "nail")
	self._g_light = self._unit:get_object(Idstring("g_light"))
	local texture = "units/lights/spot_light_projection_textures/spotprojection_22_flashlight_df"
	self._light = World:create_light("spot|specular|plane_projection", texture)
	self._light_multiplier = 2
	self._current_light_multiplier = self._light_multiplier
	self._light:set_spot_angle_end(60)
	self._light:set_far_range(10000)
	self._light:set_multiplier(self._current_light_multiplier)
	self._light:link(self._a_flashlight_obj)
	self._light:set_rotation(Rotation(self._a_flashlight_obj:rotation():z(), -self._a_flashlight_obj:rotation():x(), -self._a_flashlight_obj:rotation():y()))
	self._light:set_enable(false)
	local effect_path = "effects/particles/weapons/flashlight_spooky/fp_flashlight"
	self._light_effect = World:effect_manager():spawn({
		effect = Idstring(effect_path),
		parent = self._a_flashlight_obj,
		force_synch = true
	})
	World:effect_manager():set_hidden(self._light_effect, true)
end

function WeaponFlashLight:set_npc()
	if self._light_effect then
		World:effect_manager():kill(self._light_effect)
	end
	local obj = self._unit:get_object(Idstring("a_flashlight"))
	local is_haunted = managers.job and (managers.job:current_job_id() == "haunted" or managers.job:current_job_id() == "nail")
	local effect_path = "effects/particles/weapons/flashlight_spooky/flashlight"
	self._light_effect = World:effect_manager():spawn({
		effect = Idstring(effect_path),
		parent = obj
	})
	World:effect_manager():set_hidden(self._light_effect, true)
	self._is_npc = true
end

function WeaponFlashLight:_check_state(current_state)
	WeaponFlashLight.super._check_state(self, current_state)
	self._light:set_enable(self._on)
	self._g_light:set_visibility(self._on)
	World:effect_manager():set_hidden(self._light_effect, not self._on)
	self._is_haunted = true
	self._unit:set_extension_update_enabled(Idstring("base"), self._on)
end

local mvec1 = Vector3()
local mrot1 = Rotation()
local mrot2 = Rotation()
WeaponFlashLight.HALLOWEEN_FLICKER = 1
WeaponFlashLight.HALLOWEEN_LAUGHTER = 2
WeaponFlashLight.HALLOWEEN_FROZEN = 3
WeaponFlashLight.HALLOWEEN_SPOOC = 4
WeaponFlashLight.HALLOWEEN_WARP = 5
function WeaponFlashLight:update(unit, t, dt)
	mrotation.set_xyz(mrot1, self._a_flashlight_obj:rotation():z(), -self._a_flashlight_obj:rotation():x(), -self._a_flashlight_obj:rotation():y())
	t = Application:time()
	self:update_flicker(t, dt)
	self:update_laughter(t, dt)
	self:update_frozen(t, dt)
	if not self._frozen_t then
		self._light_speed = self._light_speed or 1
		self._light_speed = math.step(self._light_speed, 1, dt * (math.random(4) + 2))
		self._light_rotation = (self._light_rotation or 0) + dt * -50 * self._light_speed
		mrotation.set_yaw_pitch_roll(mrot2, self._light_rotation, mrotation.pitch(mrot2), mrotation.roll(mrot2))
		mrotation.multiply(mrot1, mrot2)
		self._light:link(self._a_flashlight_obj)
		self._light:set_rotation(mrot1)
	end
	if not self._kittens_timer then
		self._kittens_timer = t + 25
	end
	if t > self._kittens_timer then
		if math.rand(1) < 0.75 then
			self:run_net_event(self.HALLOWEEN_FLICKER)
			self._kittens_timer = t + math.random(10) + 5
		elseif math.rand(1) < 0.35 then
			self:run_net_event(self.HALLOWEEN_WARP)
			self._kittens_timer = t + math.random(12) + 3
		elseif math.rand(1) < 0.3 then
			self:run_net_event(self.HALLOWEEN_FROZEN)
			self._kittens_timer = t + math.random(20) + 30
		elseif math.rand(1) < 0.25 then
			self:run_net_event(self.HALLOWEEN_LAUGHTER)
			self._kittens_timer = t + math.random(5) + 8
		elseif math.rand(1) < 0.15 then
			self:run_net_event(self.HALLOWEEN_SPOOC)
			self._kittens_timer = t + math.random(2) + 3
		else
			self._kittens_timer = t + math.random(5) + 3
		end
	end
end

end

end