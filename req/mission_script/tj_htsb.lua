local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local asu_smoke = ((pro_job and difficulty == 8) and "units/pd2_dlc_vip/characters/ene_fbi_titan_1/ene_fbi_titan_1")
local ponr_value = (difficulty <= 5 and 720 or (difficulty == 6 or difficulty == 7) and 660) or 600

return {
	--Pro Job PONR (when the vault is open i think i forgot)
	[103669] = {
		ponr = ponr_value
	},
    -- random ass ASU having a smoke 
    [101606] = {
        values = {
         enemy =  asu_smoke
        }
    }
}