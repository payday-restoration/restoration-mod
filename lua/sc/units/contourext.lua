ContourExt._types.medic_show = {
	priority = 2,
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
ContourExt._types.medic_buff = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = Vector3(255, 140, 0)
}
ContourExt._types.deployable_blackout = { --for autumn's deployable disabling ability
	priority = 1,
	color = Vector3(0.5,0,1)
}

ContourExt._types.disable_outline = { --for mutator
	priority = 1,
	color = Vector3(0,0,0)
}