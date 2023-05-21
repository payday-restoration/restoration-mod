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

-- Allow flashes through corpses and debris to make them more consistent
-- Also removes inconsistent flashes through random light bounces
Hooks:PostHook(QuickFlashGrenade, "init", "sh_init", function (self)
	self._slotmask = managers.slot:get_mask("bullet_impact_targets") - World:make_slot_mask(17)
end)

local offset_pos = Vector3()
function QuickFlashGrenade:_chk_dazzle_local_player(detonate_pos, range, ignore_units)
	local player = managers.player:player_unit()

	if not alive(player) then
		return
	end

	detonate_pos = detonate_pos or self._unit:position()

	local m_pl_head_pos = player:movement():m_head_pos()
	local linear_dis = mvector3.direction(offset_pos, detonate_pos, m_pl_head_pos)

	if linear_dis > range then
		return
	end

	mvector3.multiply(offset_pos, 50)
	mvector3.add(offset_pos, detonate_pos)

	if ignore_units then
		if not World:raycast("ray", m_pl_head_pos, offset_pos, "ignore_unit", ignore_units, "slot_mask", self._slotmask, "report") then
			return true, true, nil, linear_dis
		end
	elseif not World:raycast("ray", m_pl_head_pos, offset_pos, "slot_mask", self._slotmask, "report") then
		return true, true, nil, linear_dis
	end
end

