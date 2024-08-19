--Modify class to function as a timed molotov.
IncendiaryBurstGrenade = IncendiaryBurstGrenade or class(GrenadeBase)

function IncendiaryBurstGrenade:init(unit)
	IncendiaryBurstGrenade.super.super.init(self, unit)
	self._detonated = false
end

function IncendiaryBurstGrenade:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	self:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
end

--Make Incendiary nades AOE use ExplosionManager instead of FireManager to solve buggy (double/triple dipping damage on Dozers WHOOPS) and missing (curve_pow pls) interactions
function IncendiaryBurstGrenade:_detonate(normal)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range
	local slot_mask = managers.slot:get_mask("explosion_targets")

	managers.explosion:give_local_player_dmg(pos, range, self._player_damage or self._damage, self:thrower_unit() or self._unit, self._curve_pow)
	managers.explosion:play_sound_and_effects(pos, normal, range, self._custom_params)

	local params = {
		player_damage = 0,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = self._curve_pow,
		damage = self._damage,
		ignore_unit = self._unit,
		alert_radius = self._alert_radius,
		user = self:thrower_unit() or self._unit,
		owner = self._unit,
		dot_data = self._dot_data
	}
	local hit_units, splinters = managers.explosion:detect_and_give_dmg(params)
	self:remove_trail_effect()
	self:_spawn_environment_fire(normal)

	if self._unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("sync_detonate_molotov_grenade", self._unit, "base", GrenadeBase.EVENT_IDS.detonaten, normal)
	end

	local destruction_delay = self._dot_data and self._dot_data.dot_length + 1

	self:_handle_hiding_and_destroying(true, destruction_delay)
end

function IncendiaryBurstGrenade:sync_detonate_molotov_grenade(event_id, normal)
	if event_id == GrenadeBase.EVENT_IDS.detonate then
		self:_detonate_on_client(normal)
	end
end

function IncendiaryBurstGrenade:_detonate_on_client(normal)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local range = self._range
	local normal = normal or math.UP

	managers.explosion:give_local_player_dmg(pos, range, self._player_damage or self._damage, self:thrower_unit() or self._unit, self._curve_pow)
	managers.fire:client_damage_and_push(pos, normal, nil, self._damage, range, self._curve_pow)

	local destruction_delay = self:_spawn_environment_fire(normal)

	self:_handle_hiding_and_destroying(true, destruction_delay)
end

function IncendiaryBurstGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = tweak_data.env_effect:incendiary_burst_fire()
	local tweak = tweak_data.projectiles[self._tweak_projectile_entry] or {}
	data.burn_duration = tweak.burn_duration or data.burn_duration or 15
	data.sound_event_impact_duration = tweak.sound_event_impact_duration or data.sound_event_impact_duration or 0
	local groundfire_unit, time_until_destruction = EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, self._unit, 0, 1)

	if self._dot_data then
		local explosion_dot_length = self._dot_data.dot_length + 1
		time_until_destruction = time_until_destruction and math.max(time_until_destruction, explosion_dot_length) or explosion_dot_length
	end

	return time_until_destruction
end

function IncendiaryBurstGrenade:bullet_hit()
end

function IncendiaryBurstGrenade:add_damage_result(unit, is_dead, damage_percent)
	if not alive(self._thrower_unit) or self._thrower_unit ~= managers.player:player_unit() then
		return
	end

	local unit_type = unit:base()._tweak_table
	local is_civlian = unit:character_damage().is_civilian(unit_type)
	local is_gangster = unit:character_damage().is_gangster(unit_type)
	local is_cop = unit:character_damage().is_cop(unit_type)

	if is_civlian then
		return
	end

	if is_dead then
		self:_check_achievements(unit, is_dead, damage_percent, 1, 1)
	end
end