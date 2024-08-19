local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")

if difficulty >= 7 then
    Biker_Dozer = "units/payday2/characters/ene_bulldozer_biker_1/ene_bulldozer_biker_1"
    fem_biker_tank = "units/pd2_dlc_born/characters/ene_gang_biker_boss/ene_gang_biker_boss"
    biker_poker = "units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"
end

--- extra secruity on second floor 
--Biker Dozer in small toilet
return {
    [100500] = {
		values = {
            enemy = Biker_Dozer
		}
	},
-- Fem Biker Tank
[100135] = {
    values = {
        enemy = fem_biker_tank
	}
},
-- biker guards in vest playing poker (probably rng)
[101904] = {
		values = {
            enemy = biker_poker
		}
	},
    [101977] = {
		values = {
            enemy = biker_poker
		}
	},
    [101208] = {
		values = {
            enemy = biker_poker
		}
	}
}