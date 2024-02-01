--[[Hooks:PostHook(SentryGunContour, "_set_contour", "_set_contour_mutator_no_outlines", function(self, contour_id)
    disable_outlines = managers.mutators:modify_value("SentryGunContour:DisableOutlines", false)
	if disable_outlines then
		self._unit:contour():remove(contour_id)
	end
end)--]]