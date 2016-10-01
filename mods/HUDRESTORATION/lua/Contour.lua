			Hooks:Add("ContourExtPreInitialize", self._ContourInit, function(contour, unit)
		for k, v in pairs(ContourExt._types) do
			if v.color ~= nil then
				v.color = Color(0, 0, 0, 0)
			end
		end
	end)

	Hooks:Add("ContourExtPreAdd", self._ContourAdd, function(contour, type, sync, multiplier)
		contour._contour_list = contour._contour_list or {}
		return true
	end)

	Hooks:Add("BaseInteractionExtPreSetContour", self._BaseInteractionSetContour, function(int, color, opacity)
		return { color = color, opacity = 0 }
	end)