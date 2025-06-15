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
