function ArrowBase:_setup_from_tweak_data(arrow_entry)
	local arrow_entry = self._tweak_projectile_entry or "west_arrow"
	local tweak_entry = tweak_data.projectiles[arrow_entry]
	self._damage_class_string = tweak_data.projectiles[self._tweak_projectile_entry].bullet_class or "InstantBulletBase"
	self._damage_class = CoreSerialize.string_to_classtable(self._damage_class_string)
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	self._damage = tweak_entry.damage or 1
	self._slot_mask = managers.slot:get_mask("arrow_impact_targets")
	self._slot_mask = self._slot_mask - World:make_slot_mask(16)
end

local tmp_vel = Vector3()

function ArrowBase:update(unit, t, dt)
	if self._drop_in_sync_data then
		self._drop_in_sync_data.f = self._drop_in_sync_data.f - 1

		if self._drop_in_sync_data.f < 0 then
			local parent_unit = self._drop_in_sync_data.parent_unit

			if alive(parent_unit) then
				local state = self._drop_in_sync_data.state
				local parent_body = parent_unit:body(state.sync_attach_data.parent_body_index)
				local parent_obj = parent_body:root_object()

				self:sync_attach_to_unit(false, parent_unit, parent_body, parent_obj, state.sync_attach_data.local_pos, state.sync_attach_data.dir, true)
			end

			self._drop_in_sync_data = nil
		end
	end

	if not self._is_pickup then
		local autohit_dir = self:_calculate_autohit_direction()

		if autohit_dir then
			local body = self._unit:body(0)

			mvector3.set(tmp_vel, body:velocity())

			local speed = mvector3.normalize(tmp_vel)

			mvector3.step(tmp_vel, tmp_vel, autohit_dir, dt * 0.15)
			body:set_velocity(tmp_vel * speed)
		end
	end

	ArrowBase.super.update(self, unit, t, dt)

	if self._draw_debug_cone then
		local tip = unit:position()
		local base = tip + unit:rotation():y() * -35

		Application:draw_cone(tip, base, 3, 0, 0, 1)
	end
end

local tmp_vec1 = Vector3()

function ArrowBase:_calculate_autohit_direction()
	local enemies = managers.enemy:all_enemies()
	local pos = self._unit:position()
	local dir = self._unit:rotation():y()
	local closest_dis, closest_pos = nil

	for u_key, enemy_data in pairs(enemies) do
		local enemy = enemy_data.unit

		if enemy:base():lod_stage() and not enemy:in_slot(16) then
			local com = enemy:movement():m_head_pos()

			mvector3.direction(tmp_vec1, pos, com)

			local angle = mvector3.angle(dir, tmp_vec1)

			if angle < 30 then
				local dis = mvector3.distance_sq(pos, com)

				if not closest_dis or dis < closest_dis then
					closest_dis = dis
					closest_pos = com
				end
			end
		end
	end

	if closest_pos then
		mvector3.direction(tmp_vec1, pos, closest_pos)

		return tmp_vec1
	end
end	