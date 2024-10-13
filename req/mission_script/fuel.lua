local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local boss_guard = ((pro_job and difficulty == 8) and "units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer")
local boss_backup_1 = ((pro_job and difficulty == 8) and "units/payday2/characters/ene_gang_mobster_enforcer/ene_gang_mobster_enforcer")
local boss_backup_2 = ((pro_job and difficulty == 8) and "units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer")

  --two heavy thug enforcers by the door before boss battle
return {
    [101205] = {
        values = {
            enemy = boss_guard
        }
    },
    [101206] = {
        values = {
			enemy = boss_guard
		}
    },
    --boss has backup guys, including boom booms
    [100948] = {
        values = {
            enemy = boss_backup_1
        }
    },
    [100947] = {
        values = {
            enemy = boss_backup_2
        }
    },
    [100960] = {
        values = {
            enemy = boss_backup_2
        }
    }
}   