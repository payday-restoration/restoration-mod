if not restoration.Options:GetValue("OTHER/AltLastDownColor") then return end

local set_post_composite_orig = CoreEnvironmentControllerManager.set_post_composite

local ids_LUT_post = Idstring("color_grading_post")
local ids_LUT_settings = Idstring("lut_settings")
local ids_LUT_settings_a = Idstring("LUT_settings_a")
local ids_LUT_settings_b = Idstring("LUT_settings_b")
local ids_LUT_contrast = Idstring("contrast")

function CoreEnvironmentControllerManager:set_post_composite(t, dt)
    set_post_composite_orig(self, t, dt)
    local vp = managers.viewport:first_active_viewport()

	if not vp then
		return
    end

	local last_life = 0

    if self._last_life then
        last_life = 0 and self._vp:vp():set_post_processor_effect("World", Idstring("color_grading_post"), Idstring("color_sin_classic"))
        self._ignore_user_color_grading = true
    else
        local color_grading = self._default_color_grading

        if not self._ignore_user_color_grading then
            color_grading = managers.user:get_setting("video_color_grading") or self._default_color_grading
        end
        self._vp:vp():set_post_processor_effect("World", Idstring("color_grading_post"), Idstring(color_grading))
	end
end