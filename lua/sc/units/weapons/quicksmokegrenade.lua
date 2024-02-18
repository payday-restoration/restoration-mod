local tmp_vec = Vector3()


-- Make smoke grenades bouncy
local _play_sound_and_effects_original = QuickSmokeGrenade._play_sound_and_effects
function QuickSmokeGrenade:_play_sound_and_effects(...)
	local body = self._unit:body(0)
	if not body then
		return _play_sound_and_effects_original(self, ...)
	end

	if self._state == 1 then
		local pos = self._unit:position()
		mvector3.set_z(pos, pos.z + 100)
		self._unit:set_position(pos)
		self._unit:set_rotation(Rotation(math.random(360), math.random(360), math.random(360)))

		mvector3.set(pos, math.UP)
		mvector3.random_orthogonal(pos)
		mvector3.multiply(pos, 200)
		body:set_enabled(true)
		body:push_at(body:mass(), pos, self._unit:position() + Vector3(math.rand(-10, 10), math.rand(-10, 10), math.rand(-10, 10)))

		if self._shoot_position then
			local sound_source = SoundDevice:create_source("grenade_fire_source")
			sound_source:set_position(self._shoot_position)
			sound_source:post_event("grenade_gas_npc_fire")
		end
	elseif self._state == 2 then
		if self._shoot_position then
			self._unit:m_position(tmp_vec)
			mvector3.lerp(tmp_vec, self._shoot_position, tmp_vec, 0.65)

			local sound_source = SoundDevice:create_source("grenade_bounce_source")
			sound_source:set_position(tmp_vec)
			sound_source:post_event("grenade_gas_bounce", callback(self, self, "sound_playback_complete_clbk"), sound_source, "end_of_event")
		else
			self._unit:sound_source():post_event("grenade_gas_bounce")
		end
	elseif self._state == 3 then
		self._unit:set_visible(true)
	elseif self._state == 4 then
		World:effect_manager():spawn({
			effect = Idstring("effects/particles/explosions/explosion_smoke_grenade"),
			position = self._unit:position(),
			normal = self._unit:rotation():y()
		})

		self._smoke_effect = World:effect_manager():spawn({
			effect = Idstring("effects/particles/explosions/smoke_grenade_smoke"),
			parent = self._unit:orientation_object()
		})

		body:push_at(body:mass(), math.UP * 100, self._unit:position() + Vector3(math.rand(-10, 10), math.rand(-10, 10), math.rand(-10, 10)))

		self._unit:sound_source():post_event("grenade_gas_explode")
	end
end