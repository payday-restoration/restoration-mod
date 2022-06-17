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

	managers.explosion:give_local_player_dmg(pos, range, self._player_damage, self:thrower_unit() or self._unit) --Pass in the user unit.
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
		owner = self._unit
	})

	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
	self._unit:set_slot(0)

	--Do fun cluster grenade stuff.
	local grenade_tweak = tweak_data.projectiles[self._tweak_projectile_entry]
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

end

function FragGrenade:sync_detonate_incendiary_grenade(event_id, normal)
	if event_id == GrenadeBase.EVENT_IDS.detonate then
		self:_detonate_on_client(normal)
	end
end

function FragGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = tweak_data.env_effect:incendiary_fire()
	local tweak = tweak_data.projectiles[self._tweak_projectile_entry].incendiary or {}

	data.damage = tweak.damage or data.damage or 6
	data.player_damage = tweak.player_damage or data.player_damage or 3
	data.burn_duration = tweak.burn_duration or data.burn_duration or 10
	data.sound_event_impact_duration = tweak.sound_event_impact_duration or data.sound_event_impact_duration or 1

	EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, 0, 1)
	self._unit:set_visible(false)

	if Network:is_server() then
		self.burn_stop_time = TimerManager:game():time() + data.burn_duration + data.fire_dot_data.dot_length + 1
	end
end

function FragGrenade:_detonate_on_client(normal)
	if self._detonated then
		return
	end
	self._detonated = true
	local pos = self._unit:position()
	local range = self._range
	
	managers.explosion:give_local_player_dmg(pos, range, self._player_damage, self._user_unit) --Pass in the user unit.
	managers.explosion:explode_on_client(pos, math.UP, nil, self._damage, range, self._curve_pow, self._custom_params)

	local grenade_tweak = tweak_data.projectiles[self._tweak_projectile_entry]
	if grenade_tweak and grenade_tweak.incendiary then
		self:_spawn_environment_fire(normal)
	end
end