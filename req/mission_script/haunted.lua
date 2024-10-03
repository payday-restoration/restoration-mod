local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local vault_guardian = (difficulty == 8 and "units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4") or "units/payday2/characters/ene_bulldozer_2_hw/ene_bulldozer_2_hw"

return {
	--PONR/Restores unused cloaker vault spawn that spawns a dozer as a *BOOO* mechanic
	[100546] = {
	ponr = 360,
	on_executed = {
		{ id = 102689, delay = 3 }
		}
	},
	--Proper spawngroups
	[100454] = { 
		on_executed = {
		--be gone
			{id = 101669, remove = true},
			{id = 102710, remove = true},
		--trigger spawngroups after 10 seconds
			{id = 400001, delay = 0}
		}
	},
	--Spawn ambush cloakers
	[102204] = { 
		on_executed = {
			{id = 400039, delay = 0.5},
			{id = 400040, delay = 0.5}
		}
	},
	--Disables the AI Remover to prevent vault spawn from despawning after few seconds
	[102690] = {
		values = {
            enabled = false
		}
	},
	[102689] = {
		values = {
            enemy = vault_guardian
		}
	}
}