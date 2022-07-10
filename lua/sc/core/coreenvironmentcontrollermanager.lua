local init_orig = CoreEnvironmentControllerManager.init
function CoreEnvironmentControllerManager:init()
    init_orig(self)
    self._GAME_DEFAULT_COLOR_GRADING = "color_payday"
end

local set_post_composite_orig = CoreEnvironmentControllerManager.set_post_composite

local ids_LUT_post = Idstring("color_grading_post")
local ids_LUT_settings = Idstring("lut_settings")
local ids_LUT_settings_a = Idstring("LUT_settings_a")
local ids_LUT_settings_b = Idstring("LUT_settings_b")
local ids_LUT_contrast = Idstring("contrast")

function CoreEnvironmentControllerManager:set_post_composite(t, dt)
    set_post_composite_orig(self, t, dt)
    if not restoration.Options:GetValue("OTHER/AltLastDownColor") then
        return set_post_composite_orig(self, t, dt)
    end
    local vp = managers.viewport:first_active_viewport()

	if not vp then
		return
    end

    if not alive(self._vp) then
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

function CoreEnvironmentControllerManager:set_chromatic_enabled(enabled)
	self._chromatic_enabled = enabled

	if self._material then
		if self._chromatic_enabled then
			self._material:set_variable(Idstring("chromatic_amount"), self._base_chromatic_amount)
		else
			self._material:set_variable(Idstring("chromatic_amount"), 0)
		end
	end
end
