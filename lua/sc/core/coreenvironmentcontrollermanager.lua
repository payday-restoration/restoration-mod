if not restoration.Options:GetValue("OTHER/AltLastDownColor") then return end

local ids_dof_near_plane = Idstring("near_plane")
local ids_dof_far_plane = Idstring("far_plane")
local ids_dof_settings = Idstring("settings")
local ids_radial_pos = Idstring("radial_pos")
local ids_radial_offset = Idstring("radial_offset")
local ids_tgl_r = Idstring("tgl_r")
local hit_feedback_rlu = Idstring("hit_feedback_rlu")
local hit_feedback_d = Idstring("hit_feedback_d")
local ids_hdr_post_processor = Idstring("hdr_post_processor")
local ids_hdr_post_composite = Idstring("post_DOF")
local ids_anti_aliasing_processor = Idstring("anti_aliasing_post_processor")
local ids_ao_post_processor = Idstring("ao_post_processor")
local ids_ao_mask_post_processor = Idstring("ao_mask_post_processor")
local mvec1 = Vector3()
local mvec2 = Vector3()
local new_cam_fwd = Vector3()
local new_cam_up = Vector3()
local new_cam_right = Vector3()
local ids_LUT_post = Idstring("color_grading_post")
local ids_LUT_settings = Idstring("lut_settings")
local ids_LUT_settings_a = Idstring("LUT_settings_a")
local ids_LUT_settings_b = Idstring("LUT_settings_b")
local ids_LUT_contrast = Idstring("contrast")

function CoreEnvironmentControllerManager:set_post_composite(t, dt)
	local vp = managers.viewport:first_active_viewport()

	if not vp then
		return
	end

	if self._occ_dirty then
		self._occ_dirty = false

		self:_refresh_occ_params(vp)
	end

	if self._fov_ratio_dirty then
		self:_refresh_fov_ratio_params(vp)

		self._fov_ratio_dirty = false
	end

	if self._vp ~= vp or not alive(self._material) then
		local hdr_post_processor = vp:vp():get_post_processor_effect("World", ids_hdr_post_processor)

		if hdr_post_processor then
			local post_composite = hdr_post_processor:modifier(ids_hdr_post_composite)

			if not post_composite then
				return
			end

			self._material = post_composite:material()

			if not self._material then
				return
			end

			self._vp = vp

			self:_update_post_effects()
		end
	end

	local camera = vp:camera()
	local color_tweak = mvec1

	if camera then
		-- Nothing
	end

	if self._old_vp ~= vp then
		self._occ_dirty = true
		self._fov_ratio_dirty = true

		self:refresh_render_settings()

		self._old_vp = vp
	end

	local blur_zone_val = 0
	blur_zone_val = self:_blurzones_update(t, dt, camera:position())

	if self._hit_some > 0 then
		local hit_fade = dt * 1.5
		self._hit_some = math.max(self._hit_some - hit_fade, 0)
		self._hit_right = math.max(self._hit_right - hit_fade, 0)
		self._hit_left = math.max(self._hit_left - hit_fade, 0)
		self._hit_up = math.max(self._hit_up - hit_fade, 0)
		self._hit_down = math.max(self._hit_down - hit_fade, 0)
		self._hit_front = math.max(self._hit_front - hit_fade, 0)
		self._hit_back = math.max(self._hit_back - hit_fade, 0)
	end

	local flashbang = 0
	local flashbang_flash = 0

	if self._current_flashbang > 0 then
		local flsh = self._current_flashbang
		self._current_flashbang = math.max(self._current_flashbang - dt * 0.08 * self._flashbang_multiplier * self._flashbang_duration, 0)
		flashbang = math.min(self._current_flashbang, 1)
		self._current_flashbang_flash = math.max(self._current_flashbang_flash - dt * 0.9, 0)
		flashbang_flash = math.min(self._current_flashbang_flash, 1)
	end

	local concussion = 0

	if self._current_concussion > 0 then
		self._current_concussion = math.max(self._current_concussion - dt * 0.08 * self._concussion_multiplier * self._concussion_duration, 0)
		concussion = math.min(self._current_concussion, 1)
	end

	local hit_some_mod = 1 - self._hit_some
	hit_some_mod = hit_some_mod * hit_some_mod * hit_some_mod
	hit_some_mod = 1 - hit_some_mod
	local downed_value = self._downed_value / 100
	local death_mod = math.max(1 - self._health_effect_value - 0.5, 0) * 2
	local blur_zone_flashbang = blur_zone_val + flashbang
	local flash_1 = math.pow(flashbang, 0.4)
	flash_1 = flash_1 + math.pow(concussion, 0.4)
	local flash_2 = math.pow(flashbang, 16) + flashbang_flash

	if self._custom_dof_settings then
		self._material:set_variable(ids_dof_settings, self._custom_dof_settings)
	elseif flash_1 > 0 then
		self._material:set_variable(ids_dof_settings, Vector3(math.min(self._hit_some * 10, 1) + blur_zone_flashbang * 0.4, math.min(blur_zone_val + downed_value * 2 + flash_1, 1), 10 + math.abs(math.sin(t * 10) * 40) + downed_value * 3))
	else
		self._material:set_variable(ids_dof_settings, Vector3(math.min(self._hit_some * 10, 1) + blur_zone_flashbang * 0.4, math.min(blur_zone_val + downed_value * 2, 1), 1 + downed_value * 3))
	end

	self._material:set_variable(ids_radial_offset, Vector3((self._hit_left - self._hit_right) * 0.2, (self._hit_up - self._hit_down) * 0.2, self._hit_front - self._hit_back + blur_zone_flashbang * 0.1))
	self._material:set_variable(Idstring("contrast"), self._base_contrast + self._hit_some * 0.25)

	if self._chromatic_enabled then
		self._material:set_variable(Idstring("chromatic_amount"), self._base_chromatic_amount + blur_zone_val * 0.3 + flash_1 * 0.5)
	else
		self._material:set_variable(Idstring("chromatic_amount"), 0)
	end

	self:_update_dof(t, dt)

	local lut_post = vp:vp():get_post_processor_effect("World", ids_LUT_post)

	if lut_post then
		local lut_modifier = lut_post:modifier(ids_LUT_settings)

		if not lut_modifier then
			return
		end

		self._lut_modifier_material = lut_modifier:material()

		if not self._lut_modifier_material then
			return
		end
	end

	local hurt_mod = 1 - self._health_effect_value
	local health_diff = math.clamp((self._old_health_effect_value - self._health_effect_value) * 4, 0, 1)
	self._old_health_effect_value = self._health_effect_value

	if self._health_effect_value_diff < health_diff then
		self._health_effect_value_diff = health_diff
	end

	self._health_effect_value_diff = math.max(self._health_effect_value_diff - dt * 0.5, 0)

	self._lut_modifier_material:set_variable(ids_LUT_settings_a, Vector3(math.clamp(self._health_effect_value_diff * 1.3 * (1 + hurt_mod * 1.3), 0, 1.2), 0, math.min(blur_zone_val + self._HE_blinding, 1)))

	local last_life = 0

    if self._last_life then
        self._vp:vp():set_post_processor_effect("World", Idstring("color_grading_post"), Idstring("color_sin_classic"))
        last_life = math.clamp((hurt_mod - 0.5) * 2, 0, 1)
	end

	self._lut_modifier_material:set_variable(ids_LUT_settings_b, Vector3(last_life, flash_2 + math.clamp(hit_some_mod * 2, 0, 1) * 0.25 + blur_zone_val * 0.15, 0))
	self._lut_modifier_material:set_variable(ids_LUT_contrast, flashbang * 0.5)
end