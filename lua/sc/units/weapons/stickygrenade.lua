local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local mvec4 = Vector3()
local mvec5 = Vector3()
local mvec6 = Vector3()
local mvec7 = Vector3()
local mvec8 = Vector3()
local mrot1 = Rotation()

function StickyGrenade:_attach_to_hit_unit(is_remote)
	self:_check_stop_flyby_sound()
	self:_kill_trail()
	mrotation.set_look_at(mrot1, self._col_ray.velocity, math.UP)
	self._unit:set_rotation(mrot1)
	self._unit:set_enabled(true)
	self:_set_body_enabled(false)

	local hit_unit = self._col_ray.unit
	local parent_obj, child_obj, parent_body = nil
	local global_pos = mvec1
	local local_pos = mvec2
	local collision_to_parent = mvec3
	local segment_dir = mvec4
	local parent_pos = mvec5
	local child_pos = mvec6
	local projected_pos = mvec7
	local dir_from_segment = mvec8
	local rot = mrot1

	mvector3.set(global_pos, self._col_ray.position)

	if alive(hit_unit) then
		local damage_ext = hit_unit:character_damage()

		if damage_ext and damage_ext.get_impact_segment then
			parent_obj, child_obj = damage_ext:get_impact_segment(global_pos)

			if parent_obj then
				if not child_obj then
					hit_unit:link(parent_obj:name(), self._unit, self._unit:orientation_object():name())
				else
					parent_obj:m_position(parent_pos)
					child_obj:m_position(child_pos)
					mvector3.set(collision_to_parent, global_pos)
					mvector3.subtract(collision_to_parent, parent_pos)

					local segment_dist = mvector3.direction(segment_dir, parent_pos, child_pos)
					local projected_dist = mvector3.dot(collision_to_parent, segment_dir)
					projected_dist = math.clamp(projected_dist, 0, segment_dist)

					mvector3.set(projected_pos, segment_dir)
					mvector3.multiply(projected_pos, projected_dist)
					mvector3.add(projected_pos, parent_pos)

					local max_dist_from_segment = 10

					if damage_ext.impact_body_distance then
						local parent_key = parent_obj:name():key()
						local child_key = child_obj:name():key()
						local body_key = alive(self._col_ray.body) and self._col_ray.body:enabled() and self._col_ray.body:name():key()
						local parent_impact_distance = damage_ext.impact_body_distance[parent_key] or 10
						local child_impact_distance = damage_ext.impact_body_distance[child_key] or 10
						local alpha = segment_dist > 0 and projected_dist / segment_dist or 0
						max_dist_from_segment = math.lerp(parent_impact_distance, child_impact_distance, alpha)
						local ray_impact_distance = body_key and damage_ext.impact_body_distance[body_key]

						if ray_impact_distance then
							max_dist_from_segment = max_dist_from_segment + ray_impact_distance
						end
					end

					local dist_from_segment = mvector3.direction(dir_from_segment, projected_pos, global_pos)

					if max_dist_from_segment < dist_from_segment then
						mvector3.set(global_pos, dir_from_segment)
						mvector3.multiply(global_pos, max_dist_from_segment)
						mvector3.add(global_pos, projected_pos)
					end

					parent_obj:m_rotation(rot)
					mrotation.invert(rot)
					mvector3.set(local_pos, global_pos)
					mvector3.subtract(local_pos, parent_pos)
					mvector3.rotate_with(local_pos, rot)
				end
			end
			local target_base_ext = hit_unit and hit_unit.base and hit_unit:base()
			local char_tweak = target_base_ext and target_base_ext.char_tweak and target_base_ext:char_tweak()
			if char_tweak and char_tweak.use_animation_on_fire_damage ~= false and damage_ext.force_hurt then
				damage_info = {
					damage = 0,
					type = "fire_hurt",
					col_ray = self._col_ray,
					result = {
						type = "fire_hurt"
					}
				}
				damage_ext:force_hurt(damage_info)
				if not damage_ext._dead then
					damage_ext._unit:sound():say("burnhurt", nil, nil, nil, nil)
				end
			end
		elseif not alive(self._col_ray.body) or not self._col_ray.body:enabled() then
			hit_unit:m_rotation(rot)
			mrotation.invert(rot)
			hit_unit:m_position(parent_pos)
			mvector3.set(local_pos, global_pos)
			mvector3.subtract(local_pos, parent_pos)
			mvector3.rotate_with(local_pos, rot)
		else
			parent_body = self._col_ray.body
			parent_obj = self._col_ray.body:root_object()

			parent_obj:m_rotation(rot)
			mrotation.invert(rot)
			parent_obj:m_position(parent_pos)
			mvector3.set(local_pos, global_pos)
			mvector3.subtract(local_pos, parent_pos)
			mvector3.rotate_with(local_pos, rot)
		end

		local has_destroy_listener = nil
		local listener_class = hit_unit:base()

		if listener_class and listener_class.add_destroy_listener then
			has_destroy_listener = true
		else
			listener_class = hit_unit:unit_data()

			if listener_class and listener_class.add_destroy_listener then
				has_destroy_listener = true
			end
		end

		if has_destroy_listener then
			self._destroy_listener_id = "StickyGrenade_destroy" .. tostring(self._unit:key())

			listener_class:add_destroy_listener(self._destroy_listener_id, callback(self, self, "clbk_hit_unit_destroyed"))
		end
	end

	self._unit:set_position(global_pos)
	self._unit:set_position(global_pos)

	if parent_obj then
		hit_unit:link(parent_obj:name(), self._unit)
	else
		print("StickyGrenade:attach_to_hit_unit(): No parent object!!")
	end

	if alive(hit_unit) and parent_body then
		self._attached_body_disabled_clbk_data = {
			clbk = callback(self, self, "clbk_attached_body_disabled"),
			unit = hit_unit,
			body = parent_body
		}

		hit_unit:add_body_enabled_callback(self._attached_body_disabled_clbk_data.clbk)
	end

	if not is_remote and managers.network:session() then
		local dir = mvec1

		mvector3.set(dir, self._col_ray.velocity)
		mvector3.normalize(dir)

		local unit = alive(hit_unit) and hit_unit:id() ~= -1 and hit_unit

		managers.network:session():send_to_peers_synched("sync_attach_projectile", self._unit:id() ~= -1 and self._unit or nil, false, unit or nil, unit and parent_body or nil, unit and parent_obj or nil, unit and local_pos or self._unit:position(), dir, tweak_data.blackmarket:get_index_from_projectile_id(self._tweak_projectile_entry), self._owner_peer_id)
	end

	if alive(hit_unit) then
		local dir = self._col_ray.velocity

		mvector3.normalize(dir)

		if parent_body then
			local id = hit_unit:editor_id()

			if id ~= -1 then
				self._sync_attach_data = {
					parent_unit = hit_unit,
					parent_unit_id = id,
					parent_body = parent_body,
					local_pos = local_pos or self._unit:position(),
					dir = dir
				}
			end
		elseif hit_unit:id() ~= -1 then
			self._sync_attach_data = {
				character = true,
				parent_unit = hit_unit,
				parent_obj = parent_obj,
				parent_body = parent_body,
				local_pos = local_pos,
				dir = dir
			}
		end
	end

	--[[ --No more fuse reset
	if self._unit:id() ~= -1 then
		local tweak_entry = tweak_data.projectiles[self._tweak_projectile_entry]
		self._timer = tweak_entry.detonate_timer or 3
	else
		self._timer = nil
	end
	--]]
end