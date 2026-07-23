local optsBulldozer_SO = {
	SO_access = "4096",
	path_style = "none",
	scan = true,
	use_instigator = true,
	interval = 2,
	so_action = "AI_hunt",
}

return {
	elements = {
		restoration:gen_so(400001, "dozer_hunt_so", Vector3(0, 0, 0), Rotation(0, 0, 0), optsBulldozer_SO),
	},
}
