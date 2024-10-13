local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local vet_on_break = ((pro_job and difficulty == 8) and "units/payday2/characters/ene_veteran_cop_2/ene_veteran_cop_2")
local ponr_value = (difficulty <= 5 and 720 or (difficulty == 6 or difficulty == 7) and 660) or 600

return {
	--Pro Job PONR (when the vault is open i think i forgot)
	[103669] = {
		ponr = ponr_value
	},
    -- non bloddy vet cop probably smoking at the police station 
    [101606] = {
        values = {
         enemy =  vet_on_break
        }
    }
}