local tmp_vec = Vector3()

Hooks:PostHook(CoreEnvironmentControllerManager, "init", "res_init", function(self)
	self._GAME_DEFAULT_COLOR_GRADING = "color_payday"
end)

local ids_color_grading_post = Idstring("color_grading_post")
local ids_color_sin_classic = Idstring("color_sin_classic")
Hooks:PostHook(CoreEnvironmentControllerManager, "set_post_composite", "res_set_post_composite", function(self)
	if not restoration.Options:GetValue("OTHER/AltLastDownColor") then
		return
	end

	if not alive(self._vp) then
		return
	end

	if self._last_life then
		self._vp:vp():set_post_processor_effect("World", ids_color_grading_post, ids_color_sin_classic)
		self._ignore_user_color_grading = true
	else
		local color_grading = self._default_color_grading
		if not self._ignore_user_color_grading then
			color_grading = managers.user:get_setting("video_color_grading") or color_grading
		end
		self._vp:vp():set_post_processor_effect("World", ids_color_grading_post, Idstring(color_grading))
	end
end)

-- Make flashbangs scale with look direction instead of a flat reduction at some certain angle
Hooks:OverrideFunction(CoreEnvironmentControllerManager, "test_line_of_sight", function(self, test_pos, min_distance, dot_distance, max_distance)
	local tmp_vec1 = Vector3()
	local tmp_vec2 = Vector3()
	local vp = managers.viewport:first_active_viewport()
	if not vp then
		return 0
	end

	local camera = vp:camera()
	local cam_pos = tmp_vec1
	camera:m_position(cam_pos)

	local dir_to_target = tmp_vec2
	local dis = mvector3.direction(dir_to_target, cam_pos, test_pos)

	if dis > max_distance then
		return 0
	end

	if dis < min_distance then
		return 1
	end

	local ray_hit = World:raycast("ray", cam_pos, test_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision", "report")
	if ray_hit then
		return 0 
	end

	local cam_fwd = camera:rotation():y()
	local dot_mul = mvector3.dot(cam_fwd, dir_to_target)
	dot_mul = math.clamp((dot_mul + 1) / 2, 0, 1)
	local dot_effect = dis > dot_distance and 1 or dis / dot_distance

	return math.map_range_clamped(dis, min_distance, max_distance, 1, 0) * (dot_mul ^ dot_effect)
end)

-- LoS checks for explosions. Borrowed from vanilla `test_line_of_sight` function because the one from SH don't work as LoS check for this.
-- Anyway, this should prevent explosions deal dmg through walls.
function CoreEnvironmentControllerManager:test_line_of_sight_explosion(test_pos, max_distance)
	local tmp_vec1 = Vector3()
	local tmp_vec2 = Vector3()
	local tmp_vec3 = Vector3()
	local vp = managers.viewport:first_active_viewport()

	if not vp then
		return false
	end

	local camera = vp:camera()
	local cam_pos = tmp_vec1

	camera:m_position(cam_pos)

	local test_vec = tmp_vec2
	local dis = mvector3.direction(test_vec, cam_pos, test_pos)

	if max_distance < dis then
		return false
	end

	local ray_hit = World:raycast("ray", cam_pos, test_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision", "report")

	if ray_hit then
		return false
	end

	return true
end

--[[function CoreEnvironmentControllerManager:set_chromatic_enabled(enabled)
	self._chromatic_enabled = enabled

	if self._material then
		if self._chromatic_enabled then
			self._material:set_variable(Idstring("chromatic_amount"), self._base_chromatic_amount)
		else
			self._material:set_variable(Idstring("chromatic_amount"), 0)
		end
	end
end]]--

local set_default_color_grading_original = CoreEnvironmentControllerManager.set_default_color_grading
function CoreEnvironmentControllerManager:set_default_color_grading(color_grading, ...)
	color_grading = color_grading == "color_off" and "color_payday" or color_grading
	return set_default_color_grading_original(self, color_grading, ...)
end

-- No Outlines mutator. Only works when all outlines settings are disabled in mutator settings because method below nuke outlines render completely
Hooks:PostHook(CoreEnvironmentControllerManager, "refresh_render_settings", "ContourSS_refresh_render_settings", function(self, vp)
	if not alive(self._vp) then
		return
	end

	if managers.mutators:modify_value("CoreEnvironmentControllerManager:DisableOutlinesCompletely", false) then
		self._vp:vp():set_post_processor_effect("World", Idstring("bloom_combine_post_processor"), Idstring("bloom_combine_empty"))
		self._vp:vp():set_post_processor_effect("World", Idstring("bloom_combine"), Idstring("bloom_combine_empty"))
		self._vp:vp():set_post_processor_effect("World", Idstring("shadow_modifier"), Idstring("empty"))
		self._vp:vp():set_post_processor_effect("World", Idstring("shadow_rendering"), Idstring("empty"))
	end
end)