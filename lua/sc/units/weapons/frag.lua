--Prevent grenades from being detonated by being shot.
--TODO: Implement the ability to set whether this function should fire via tweakdata, and allow clients to trigger it without desyncing.
function FragGrenade:bullet_hit()
end

--Hook to enable cluster grenades.
--If a grenade's tweakdata has a .cluster, then spawn the referenced grenade and throw it in a random direction.
--Use .cluster_count to determine the number spawned (defaults to 1). 
function FragGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
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
	if grenade_tweak and grenade_tweak.cluster then
		for i=1, grenade_tweak.cluster_count or 1 do
			ProjectileBase.throw_projectile(grenade_tweak.cluster, self._unit:position(), Vector3(math.random(-1, 1), math.random(-1, 1), 0.5), nil, self:thrower_unit() or self._unit, true)
		end
	end
end

function FragGrenade:_detonate_on_client()
	local pos = self._unit:position()
	local range = self._range

	managers.explosion:give_local_player_dmg(pos, range, self._player_damage, self._user_unit) --Pass in the user unit.
	managers.explosion:explode_on_client(pos, math.UP, nil, self._damage, range, self._curve_pow, self._custom_params)
end