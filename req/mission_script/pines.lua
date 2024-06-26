local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local bravos_inbound = false

       if pro_job then
		bravos_inbound = true
       end

return {
	--Call in Bravos on PJs once Vlad's bro-in law gets to the chopper
	--[[
	[106282] = {
	       spawn_bravos = bravos_inbound
	},
	]]
	--There's no cops in White Xmas, yes i'm serious
	[100288] = {
		values = {
            sound_event = "earthquake_siren"
		}
	},
	[104193] = {
		values = {
            sound_event = "earthquake_siren"
		}
	},
	[106309] = {
		values = {
            enabled = false
		}
	}
}
