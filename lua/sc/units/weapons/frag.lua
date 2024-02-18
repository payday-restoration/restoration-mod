function FragGrenade:_setup_from_tweak_data()
	local grenade_entry = self._tweak_projectile_entry or "frag"
	local tweak_entry = tweak_data.projectiles[grenade_entry]
	self._init_timer = tweak_entry.init_timer or 2.5
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	self._range = tweak_entry.range
	self._effect_name = tweak_entry.effect_name or "effects/payday2/particles/explosions/grenade_explosion"
	self._curve_pow = tweak_entry.curve_pow or 3
	self._damage = tweak_entry.damage
	self._player_damage = tweak_entry.player_damage
	self._alert_radius = tweak_entry.alert_radius
	self._idstr_decal = tweak_entry.idstr_decal
	self._idstr_effect = tweak_entry.idstr_effect
	local sound_event = tweak_entry.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		idstr_decal = self._idstr_decal,
		idstr_effect = self._idstr_effect,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}
	self._dot_data = tweak_entry.dot_data_name and tweak_data.dot:get_dot_data(tweak_entry.dot_data_name)

	return tweak_entry
end

--Prevent grenades from being detonated by being shot.
--TODO: Implement the ability to set whether this function should fire via tweakdata, and allow clients to trigger it without desyncing.
function FragGrenade:bullet_hit()
end

--Hook to enable cluster grenades.
--If a grenade's tweakdata has a .cluster, then spawn the referenced grenade and throw it in a random direction.
--Use .cluster_count to determine the number spawned (defaults to 1). 
function FragGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range
	local slot_mask = managers.slot:get_mask("explosion_targets")
	local grenade_tweak = tweak_data.projectiles[self._tweak_projectile_entry]

	managers.explosion:give_local_player_dmg(pos, range, self._damage, self:thrower_unit() or self._unit, self._curve_pow) --Pass in the user unit.
	managers.explosion:play_sound_and_effects(pos, normal, range, self._custom_params)

	local hit_units, splinters = managers.explosion:detect_and_give_dmg({
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
	})

	if self._unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
	end

	--Do fun cluster grenade stuff.
	if grenade_tweak then 
		if grenade_tweak.cluster then
			for i=1, grenade_tweak.cluster_count or 1 do
				ProjectileBase.throw_projectile(grenade_tweak.cluster, self._unit:position(), Vector3(math.random(-1, 1), math.random(-1, 1), 0.5), nil, self:thrower_unit() or self._unit, true)
			end
		elseif grenade_tweak.incendiary then
			self:_spawn_environment_fire(normal)
			managers.network:session():send_to_peers_synched("sync_detonate_incendiary_grenade", self._unit, "base", GrenadeBase.EVENT_IDS.detonate, normal)
		end
	end

	self:_handle_hiding_and_destroying(true, nil)
end

function FragGrenade:sync_detonate_incendiary_grenade(event_id, normal)
	if event_id == GrenadeBase.EVENT_IDS.detonate then
		self:_detonate_incendiary_on_client(normal)
	end
end

function FragGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = tweak_data.env_effect:ray_fire()
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

function FragGrenade:_detonate_incendiary_on_client(normal)
	local pos = self._unit:position()
	local range = self._range
	local explosion_normal = math.UP
	
	managers.explosion:give_local_player_dmg(pos, range, self._player_damage or self._damage, self:thrower_unit() or self._unit, self._curve_pow)
	managers.fire:client_damage_and_push(pos, explosion_normal, nil, self._damage, range, self._curve_pow)

	local destruction_delay = self:_spawn_environment_fire(normal)

	self:_handle_hiding_and_destroying(true, destruction_delay)
end