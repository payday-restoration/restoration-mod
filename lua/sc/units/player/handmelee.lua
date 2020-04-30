local mvec_delta = Vector3()
local mvec_bayonet_dir = Vector3()

function HandMelee:update(unit, t, dt)
	if not self:has_melee_weapon() and not self:has_weapon() and not self:has_custom_weapon() then
		if alive(self._weapon_unit) then
			self:set_melee_unit()
		else
			return
		end
	end

	local hit_point, length = self:_get_hitpoint()

	if not hit_point then
		return
	end

	local valid_hit = false
	local has_bayonet = self:has_weapon() and alive(self._bayonet_unit)

	if self:has_weapon() or self:has_custom_weapon() then
		local limit = 5
		local point = nil

		if has_bayonet then
			limit = 2.5
			point = mvector3.copy(self._hand_unit:position())
		else
			point = mvector3.copy(hit_point)
		end

		if length then
			limit = limit * length / 3
		end

		mvector3.subtract(point, managers.player:player_unit():position())

		self._avg_momentum = self._avg_momentum or Vector3()
		self._last_pos = self._last_pos or point
		local delta = mvec_delta

		mvector3.set(delta, point)
		mvector3.subtract(delta, self._last_pos)

		if has_bayonet then
			local bayonet_dir = mvec_bayonet_dir

			mvector3.set(bayonet_dir, self._bayonet_unit:rotation():y())

			local scalar = mvector3.dot(delta, bayonet_dir)

			mvector3.multiply(bayonet_dir, scalar)
			mvector3.set(delta, bayonet_dir)
		end

		mvector3.add(delta, self._avg_momentum)
		mvector3.divide(delta, 2)
		mvector3.set(self._avg_momentum, delta)

		self._last_pos = point

		if limit < mvector3.length_sq(self._avg_momentum) then
			valid_hit = true
		end
	else
		valid_hit = true
	end

	if valid_hit then
		local start_pos = self._hand_unit:position()

		if has_bayonet then
			start_pos = self._bayonet_unit:position()
		end

		local ray = self._hand_unit:raycast("ray", start_pos, hit_point, "slot_mask", managers.slot:get_mask("bullet_impact_targets"), "ray_type", "body melee")

		if ray then
			if not self._next_hit_t or self._next_hit_t < t then
				if self._next_full_hit_t and t < self._next_full_hit_t then
					local range = tweak_data.blackmarket.melee_weapons[self._entry].repeat_expire_t
					local current = range - (self._next_full_hit_t - t)
					local dmg_mul = current / range

					managers.player:mul_melee_damage(dmg_mul * dmg_mul)
				end

				managers.player:player_unit():movement():current_state():_do_melee_damage(t, has_bayonet, ray, self._entry, PlayerHand.hand_id(self._hand_unit:base():name()))

				self._next_hit_t = t + tweak_data.blackmarket.melee_weapons[self._entry].repeat_expire_t
				self._next_full_hit_t = self._next_hit_t
				self._charge_start_t = nil

				managers.player:reset_melee_dmg_multiplier()

				if self._charge_sound then
					self._charge_sound:stop()

					self._charge_sound = nil
				end
			end
		else
			self._next_hit_t = nil
		end
	end
end