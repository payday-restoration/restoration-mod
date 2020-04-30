QuickFlashGrenade.States = {
	{
		"_state_launched",
		0.5
	},
	{
		"_state_bounced"
	},
	{
		"_state_detonated",
		3
	},
	{
		"_state_destroy",
		0
	}
}

function QuickFlashGrenade:init(unit)
	self._unit = unit
	self._state = 0
	self._armed = false

	for i, state in ipairs(QuickFlashGrenade.States) do
		if state[2] == nil then
			QuickFlashGrenade.States[i][2] = tweak_data.group_ai.flash_grenade.timer
		end
	end

	if Network:is_client() then
		local shooter_pos = nil
		local smoke_and_flash_grenades = managers.groupai:state():smoke_and_flash_grenades()

		if smoke_and_flash_grenades then
			for id, data in ipairs(smoke_and_flash_grenades) do
				if data and data.flashbang and data.shooter_pos and data.detonate_pos == self._unit:position() then
					shooter_pos = data.shooter_pos
					smoke_and_flash_grenades[id] = nil

					break
				end
			end
		end

		if not shooter_pos then
			shooter_pos = self._unit:position()
		end

		self:activate(shooter_pos, tweak_data.group_ai.flash_grenade_lifetime)
	end
end

function QuickFlashGrenade:activate_immediately(position, duration)
	self:_activate(1, 0, position, duration)
end

function QuickFlashGrenade:_activate(state, timer, position, duration)
	self._state = state
	self._armed = true
	self._timer = timer
	self._shoot_position = position
	self._duration = duration
end

function QuickFlashGrenade:_state_bounced()
	self._unit:damage():run_sequence_simple("activate")

	local bounce_point = self._unit:position()
	local sound_source = SoundDevice:create_source("grenade_bounce_source")

	sound_source:set_position(bounce_point)
	sound_source:post_event("flashbang_bounce", callback(self, self, "sound_playback_complete_clbk"), sound_source, "end_of_event")

	local light = World:create_light("omni|specular")

	light:set_far_range(tweak_data.group_ai.flash_grenade.light_range)
	light:set_color(tweak_data.group_ai.flash_grenade.light_color)
	light:set_position(self._unit:position())
	light:set_specular_multiplier(tweak_data.group_ai.flash_grenade.light_specular)
	light:set_enable(true)
	light:set_multiplier(0)
	light:set_falloff_exponent(0.5)

	self._light = light
	self._light_multiplier = 0
end

function QuickFlashGrenade:_beep()		
	if SystemFS:exists("assets/mod_overrides/Old Sound Effects Restoration - 2015") then
		self._unit:sound_source():post_event("ecm_jammer_ready")
		
		self._beep_t = self:_get_next_beep_time()
		self._light_multiplier = tweak_data.group_ai.flash_grenade.beep_multi
	else	
		self._unit:sound_source():post_event("pfn_beep")
		
		self._beep_t = self:_get_next_beep_time()
		self._light_multiplier = tweak_data.group_ai.flash_grenade.beep_multi
   end
end
