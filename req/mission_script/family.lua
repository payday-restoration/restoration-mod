local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local hunt_projob = false

	if difficulty <= 3 then
		ponr_value = 240
	elseif difficulty == 4 or difficulty == 5 then
		ponr_value = 360
	else
		ponr_value = 480
	end
	
	if pro_job then
		hunt_projob = true
	end

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