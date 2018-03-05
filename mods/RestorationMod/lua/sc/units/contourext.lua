if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	ContourExt._types.medic_show = {
			priority = 1,
			material_swap_required = true,
			fadeout = 2,
			color = tweak_data.contour.character.dangerous_color
		}
	ContourExt._types.omnia_heal = {
			priority = 1,
			material_swap_required = true,
			fadeout = 2,
			color = Vector3(128, 0, 128)
		}			

end