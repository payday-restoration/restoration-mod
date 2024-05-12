local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local enforcerKC = "units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer"
local biker_dozer = "units/payday2/characters/ene_bulldozer_biker_1/ene_bulldozer_biker_1"
local akimbo_boss = (difficulty == 8 and "units/pd2_dlc_flat/characters/ene_gang_colombian_boss/ene_gang_colombian_boss")

local enforcerKC = {
    values = {
        enemy = enforcerKC
    }
}
local surprise_flamma_dozah = {
    values = {
        enemy = biker_dozer
    }
}
local columb_baws = {
    values = {
        enemy = akimbo_boss
    }
}

return {
    --tanked enforcers and their boss
    [100821] = surprise_flamma_dozah,
    [100820] = enforcerKC,
    [100760] = enforcerKC,
    [100803] = enforcerKC,
    [100371] = columb_baws
}