local optsVentBreaker = {
	trigger_list = {
        { id = 1, name = "run_sequence", notify_unit_id = 104021, notify_unit_sequence = "release_vent", time = 0 },
    }
}
local optscloakerspawned = {
	on_executed = { 
		{ id = 400001, delay = 0 }
	},
	elements = { 
		104056
	}
}

return {
    elements = {
        --Vent Fix
		restoration:objecteditor(
            400001,
            "break_le_vent",
            Vector3(-803, -1370, 3449.999),
            Rotation(-90, 0, -0),
            optsVentBreaker
        ),
		restoration:gen_dummytrigger(
            400002,
            "cloaker_spawned",
            Vector3(-2400, -3677, 375),
            Rotation(90, -0, -0),
            optscloakerspawned
        )
    }
}
