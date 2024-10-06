local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = pro_job
local ponr_value = (difficulty <= 5 and 600 or (difficulty == 6 or difficulty == 7) and 570) or 540

return {
	--Pro Job PONR+Hunt (Endless Assault)
	--Spawn Murkies after 2 minutes
	[101121] = {
	on_executed = {
			{id = 400001, delay = 0}
	},
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--De-Julesfiy this mission script (they really made spawn enemies early if cut the tarp)
	[101288] = {
		values = {
			enabled = false
		}
	}
}