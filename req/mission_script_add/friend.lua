local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local sosa_lieutenant = "units/pd2_dlc_flat/characters/ene_gang_colombian_boss/ene_gang_colombian_boss"
local pro_job = Global.game_settings and Global.game_settings.one_down
local death_sentence = difficulty == 8

local optsLieutenant = {
    enemy = sosa_lieutenant,
	participate_to_group_ai = true,
	team = "mobster1",
    enabled = (death_sentence and pro_job)
}


return {
    elements = {
        --Sosa's lieutenants
		restoration:gen_dummy(
            400001,
            "sosa_lieutenant_1",
            Vector3(889, -1006, 452.759),
            Rotation(90, 0, -0),
            optsLieutenant
        ),
		restoration:gen_dummy(
            400002,
            "sosa_lieutenant_2",
            Vector3(889, -1151, 452.759),
            Rotation(90, -0, -0),
            optsLieutenant
        )
    }
}