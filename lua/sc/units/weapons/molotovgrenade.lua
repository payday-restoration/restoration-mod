--Lets mollies use the "mass_look_up_modifier" stat
function MolotovGrenade:_setup_from_tweak_data()
	local tweak_entry = MolotovGrenade.super._setup_from_tweak_data(self)
	self._dot_data = tweak_entry.dot_data_name and tweak_data.dot:get_dot_data(tweak_entry.dot_data_name)
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
end

--Prevent grenades from being detonated by being shot.
--TODO: Implement the ability to set whether this function should fire via tweakdata, and allow clients to trigger it without desyncing.
function MolotovGrenade:bullet_hit()
end

--Make Molotov AOE use ExplosionManager instead of FireManager to solve buggy (double/triple dipping damage on Dozers WHOOPS) and missing (curve_pow pls) interactions
function MolotovGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local explosion_normal = math.UP
	local range = self._range
	local slot_mask = managers.slot:get_mask("explosion_targets")

	managers.explosion:give_local_player_dmg(pos, range, self._player_damage or self._damage, self:thrower_unit() or self._unit, self._curve_pow)
	print("[MolotovGrenade:_detonate] dot data ", inspect(self._dot_data))

	local params = {
		player_damage = 0,
		is_molotov = true,
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
	local hit_units, splinters = managers.explosion:detect_and_give_dmg(params) --Here!!
	normal = normal or explosion_normal
	local destruction_delay = self:_spawn_environment_fire(normal)

	if self._unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("sync_detonate_molotov_grenade", self._unit, "base", GrenadeBase.EVENT_IDS.detonate, normal)
	end

	self:_handle_hiding_and_destroying(true, destruction_delay)
end


function MolotovGrenade:_detonate_on_client(normal)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local range = self._range
	local explosion_normal = math.UP
	
	managers.explosion:give_local_player_dmg(pos, range, self._player_damage or self._damage, self:thrower_unit() or self._unit, self._curve_pow)
	managers.fire:client_damage_and_push(pos, explosion_normal, nil, self._damage, range, self._curve_pow)

	local destruction_delay = self:_spawn_environment_fire(normal)

	self:_handle_hiding_and_destroying(true, destruction_delay)
end