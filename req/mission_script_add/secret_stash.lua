local Bain_senddozers = {
	dialogue = "Play_ban_s02_b",
	can_not_be_muted = true
}
local optsBulldozer_SO = {
    SO_access = "4096",
	path_style = "none",
	scan = true,
	interval = 2,
    so_action = "AI_hunt"
}

return {
    elements = {
		restoration:gen_dialogue(
            400001,
            "they_sending_dozers",
            Bain_senddozers
        ),
        restoration:gen_so(
            400002,
            "dozer_hunt_so",
            Vector3(-2657, -3569, -90),
            Rotation(90, -0, -0),
            optsBulldozer_SO
        ),
    }
}