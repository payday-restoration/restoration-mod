
local ids_LUT_post = Idstring("color_grading_post")
local ids_LUT_settings = Idstring("lut_settings")
local ids_LUT_settings_a = Idstring("LUT_settings_a")
local ids_LUT_settings_b = Idstring("LUT_settings_b")
local ids_LUT_contrast = Idstring("contrast")

local set_post_composite_original = CoreEnvironmentControllerManager.set_post_composite

function CoreEnvironmentControllerManager:set_post_composite( t, dt )
        if not restoration.Options:GetValue("OTHER/AltLastDownColor") then
            return set_post_composite_original(self, t, dt)
        end
		local hurt_mod = 1-self._health_effect_value
		
		local last_life = 0
		if(self._last_life) then
        self._vp:vp():set_post_processor_effect("World", Idstring("color_grading_post"), Idstring("color_sin"))
        self._ignore_user_color_grading = true
			last_life = math.clamp((hurt_mod - 0.5) * 2, 0, 1);
		end
end
