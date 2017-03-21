if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
function SentryGunBrain:_upd_detection(t)
	if self._ext_movement:is_activating() or self._ext_movement:is_inactivating() then
		return
	end
	if t < self._next_detection_upd_t then
		return
	end
	local delay = 1
	local my_SO_access_str = self._SO_access_str
	local my_SO_access = self._SO_access
	local my_tracker = self._unit:movement():nav_tracker()
	local chk_vis_func = my_tracker.check_visibility
	local detected_objects = self._detected_attention_objects
	local my_key = self._unit:key()
	local my_team = self._ext_movement:team()
	local my_pos = self._ext_movement:m_head_pos()
	local my_tracker = self._ext_movement:nav_tracker()
	local chk_vis_func = my_tracker.check_visibility
	local max_detection_range = self._tweak_data.DETECTION_RANGE
	local all_attention_objects = managers.groupai:state():get_AI_attention_objects_by_filter(my_SO_access_str, my_team)
	local function _distance_chk(handler, settings, attention_pos)
		attention_pos = attention_pos or handler:get_detection_m_pos()
		local dis_sq = mvector3.distance_sq(my_pos, attention_pos)
		local max_dis = math.min(max_detection_range, settings.max_range or max_detection_range)
		if settings.detection and settings.detection.range_mul then
			max_dis = max_dis * settings.detection.range_mul
		end
		if dis_sq < max_dis * max_dis then
			return math.sqrt(dis_sq)
		end
	end
	local ignore_units = {
		self._unit
	}
	local function _nearly_visible_chk(attention_info, detect_pos)
		local near_pos = tmp_vec1
		if attention_info.verified_dis < 2000 and math.abs(detect_pos.z - my_pos.z) < 300 then
			mvector3.set(near_pos, detect_pos)
			mvector3.set_z(near_pos, near_pos.z + 100)
			local near_vis_ray = World:raycast("ray", my_pos, near_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision", "report")
			if near_vis_ray then
				local side_vec = tmp_vec1
				mvector3.set(side_vec, detect_pos)
				mvector3.subtract(side_vec, my_pos)
				mvector3.cross(side_vec, side_vec, math.UP)
				mvector3.set_length(side_vec, 150)
				mvector3.set(near_pos, detect_pos)
				mvector3.add(near_pos, side_vec)
				local near_vis_ray = World:raycast("ray", my_pos, near_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision", "report")
				if near_vis_ray then
					mvector3.multiply(side_vec, -2)
					mvector3.add(near_pos, side_vec)
					near_vis_ray = World:raycast("ray", my_pos, near_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision", "report")
				end
			end
			if not near_vis_ray then
				attention_info.nearly_visible = true
				attention_info.last_verified_pos = mvector3.copy(near_pos)
			end
		end
	end
	for u_key, attention_info in pairs(all_attention_objects) do
		if u_key ~= my_key and not detected_objects[u_key] and (not attention_info.nav_tracker or chk_vis_func(my_tracker, attention_info.nav_tracker)) then
			local settings = attention_info.handler:get_attention(my_SO_access, AIAttentionObject.REACT_SUSPICIOUS, nil, my_team)
			if settings then
				local attention_pos = attention_info.handler:get_detection_m_pos()
				if _distance_chk(attention_info.handler, settings, attention_pos) then
					ignore_units[2] = attention_info.unit or nil
					local vis_ray = World:raycast("ray", my_pos, attention_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")
					if not vis_ray or vis_ray.unit:key() == u_key then
						detected_objects[u_key] = CopLogicBase._create_detected_attention_object_data(t, self._unit, u_key, attention_info, settings)
					end
				end
			end
		end
	end
	local update_delay = 2
	for u_key, attention_info in pairs(detected_objects) do
		if t < attention_info.next_verify_t then
			update_delay = math.min(attention_info.next_verify_t - t, update_delay)
		else
			ignore_units[2] = attention_info.unit or nil
			attention_info.next_verify_t = t + (attention_info.identified and attention_info.verified and attention_info.settings.verification_interval or attention_info.settings.notice_interval or attention_info.settings.verification_interval)
			update_delay = math.min(update_delay, attention_info.settings.verification_interval)
			if not attention_info.identified then
				local health_ratio = self:_attention_health_ratio(attention_info)
				local objective = self:_attention_objective(attention_info)
				local noticable
				local distance = _distance_chk(attention_info.handler, attention_info.settings, nil)
				local skip = objective == "surrender" or health_ratio <= 0
				if distance then
					local attention_pos = attention_info.handler:get_detection_m_pos()
					local vis_ray = World:raycast("ray", my_pos, attention_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision", "report")
					if not vis_ray then
						noticable = true
					end
				end
				local delta_prog
				local dt = t - attention_info.prev_notice_chk_t
				if noticable and not skip then
					local min_delay = self._tweak_data.DETECTION_DELAY[1][2]
					local max_delay = self._tweak_data.DETECTION_DELAY[2][2]
					local dis_ratio = (distance - self._tweak_data.DETECTION_DELAY[1][1]) / (self._tweak_data.DETECTION_DELAY[2][1] - self._tweak_data.DETECTION_DELAY[1][1])
					local dis_mul_mod = math.lerp(min_delay, max_delay, dis_ratio)
					local notice_delay_mul = attention_info.settings.notice_delay_mul or 1
					if attention_info.settings.detection and attention_info.settings.detection.delay_mul then
						notice_delay_mul = notice_delay_mul * attention_info.settings.detection.delay_mul
					end
					local notice_delay_modified = math.lerp(min_delay * notice_delay_mul, max_delay, dis_mul_mod)
					delta_prog = notice_delay_modified > 0 and dt / notice_delay_modified or 1
				else
					delta_prog = dt * -0.125
				end
				attention_info.notice_progress = attention_info.notice_progress + delta_prog
				if 1 < attention_info.notice_progress and not skip then
					attention_info.notice_progress = nil
					attention_info.prev_notice_chk_t = nil
					attention_info.identified = true
					attention_info.release_t = t + attention_info.settings.release_delay
					attention_info.identified_t = t
					noticable = true
				elseif 0 > attention_info.notice_progress or skip then
					self:_destroy_detected_attention_object_data(attention_info)
					noticable = false
				else
					noticable = attention_info.notice_progress
					attention_info.prev_notice_chk_t = t
				end
				if noticable ~= false and attention_info.settings.notice_clbk then
					attention_info.settings.notice_clbk(self._unit, noticable)
				end
			end
			if attention_info.identified then
				update_delay = math.min(update_delay, attention_info.settings.verification_interval)
				attention_info.nearly_visible = nil
				local verified, vis_ray
				local attention_pos = attention_info.handler:get_detection_m_pos()
				local dis = mvector3.distance(my_pos, attention_info.m_head_pos)
				if dis < max_detection_range * 1.2 or attention_info.settings.max_range and dis < attention_info.settings.max_range * (attention_info.settings.detection and attention_info.settings.detection.range_mul or 1) * 1.2 then
					local detect_pos
					if attention_info.is_husk_player and attention_info.unit:anim_data().crouch then
						detect_pos = tmp_vec1
						mvector3.set(detect_pos, attention_info.m_pos)
						mvector3.add(detect_pos, tweak_data.player.stances.default.crouched.head.translation)
					else
						detect_pos = attention_pos
					end
					vis_ray = World:raycast("ray", my_pos, detect_pos, "ignore_unit", ignore_units, "slot_mask", self._visibility_slotmask, "ray_type", "ai_vision")
					if not vis_ray or vis_ray.unit:key() == u_key then
						verified = true
					end
					attention_info.verified = verified
				end
				attention_info.dis = dis
				attention_info.vis_ray = vis_ray and vis_ray.dis or nil
				if self:_attention_health_ratio(attention_info) <= 0 or self:_attention_objective(attention_info) == "surrender" then
					self:_destroy_detected_attention_object_data(attention_info)
				elseif verified then
					attention_info.release_t = nil
					attention_info.verified_t = t
					mvector3.set(attention_info.verified_pos, attention_pos)
					attention_info.last_verified_pos = mvector3.copy(attention_pos)
					attention_info.verified_dis = dis
				elseif attention_info.has_team and my_team.foes[attention_info.unit:movement():team().id] then
					if attention_info.criminal_record and attention_info.last_verified_pos and attention_info.settings.reaction >= AIAttentionObject.REACT_COMBAT then
						if dis > 1000 and mvector3.distance(attention_pos, attention_info.last_verified_pos) > 700 or max_detection_range < dis then
							self:_destroy_detected_attention_object_data(attention_info)
						else
							update_delay = math.min(0.2, update_delay)
							attention_info.verified_pos = mvector3.copy(attention_info.criminal_record.pos)
							attention_info.verified_dis = dis
							if vis_ray then
								_nearly_visible_chk(attention_info, attention_pos)
							end
						end
					elseif attention_info.release_t and t > attention_info.release_t then
						self:_destroy_detected_attention_object_data(attention_info)
					else
						attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
					end
				elseif attention_info.release_t and t > attention_info.release_t then
					self:_destroy_detected_attention_object_data(attention_info)
				else
					attention_info.release_t = attention_info.release_t or t + attention_info.settings.release_delay
				end
			end
		end
	end
	self._next_detection_upd_t = t + update_delay
end

end