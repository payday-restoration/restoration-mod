local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local biker_poker = (difficulty >= 7 and "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1")
local guard_biker = {
	values = {
         enemy = biker_poker
	}
}

return {
-- biker guards in vest playing poker (probably rng)
	[101904] = guard_biker,
    [101977] = guard_biker,
    [101208] = guard_biker
}