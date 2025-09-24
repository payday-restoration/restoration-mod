function ElectricGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	self._detonated = true
	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range
	local slot_mask = managers.slot:get_mask("explosion_targets") - managers.slot:get_mask("all_criminals")
	
	managers.explosion:play_sound_and_effects(pos, normal, range, self._custom_params)

	local hit_units, splinters = managers.explosion:detect_and_tase({
		player_damage = 0,
		tase_strength = "heavy",
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = self._curve_pow,
		damage = self._damage,
		ignore_unit = self._unit,
		alert_radius = self._alert_radius,
		user = self:thrower_unit() or self._unit,
		owner = self._unit,
		verify_callback = callback(self, self, "_can_tase_unit")
	})

	if self._unit:id() ~= -1 then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
	end

	self:_tase_player()
	self:_handle_hiding_and_destroying(true, nil)
end

function ElectricGrenade:_tase_player()
	local player = managers.player:player_unit()

	if alive(player) and player == self:thrower_unit() and player:character_damage().on_self_tased then
		local detonate_pos = self._unit:position() + math.UP * 100
		local range = self._range
		local affected, line_of_sight, travel_dis, linear_dis = QuickFlashGrenade._chk_dazzle_local_player(self, detonate_pos, range)
		local los = managers.environment_controller:test_line_of_sight(detonate_pos + Vector3(0, 0, 150), 200, range / 3, range) or 0

		if affected and los > 0 then
			player:character_damage():on_self_tased(0.5)
		end
	end
end