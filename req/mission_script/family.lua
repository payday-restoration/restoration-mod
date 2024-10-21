local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local ponr_value = (difficulty <= 3 and 240 or (difficulty == 4 or difficulty == 5) and 360) or 480
local hunt_projob = pro_job	

local disabled = {
	values = {
		enabled = false
	}
}	

return {
	--Pro Job PONR 
	[101095] = {
		ponr = ponr_value,
		hunt = hunt_projob
	},
	--Disable Titan Cams
	[102211] = disabled,
	-- restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	--disable the bad van escape spots
	[100754] = disabled,
	[100755] = disabled,
	--Disable the SWAT Turret, 2015 really meant the slowly removal of reinforce units
	[102124] = disabled
}	