local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
local pro_job = Global.game_settings and Global.game_settings.one_down
local chance_dozer_var = math.random()
local chance_dozer = 25

	--Increase chance of spawning scripted dozer
	if difficulty == 5 or difficulty == 6 then
		chance_dozer = 50
	elseif difficulty == 7 or difficulty == 8 then
		chance_dozer = 75
	end
	
	--If we're in Pro Job, then increase the chance even further
	if pro_job then
	if difficulty == 5 or difficulty == 6 then
		chance_dozer = 75
	elseif difficulty == 7 or difficulty == 8 then
		chance_dozer = 100
	end
end
	
	if difficulty <= 5 then
		ponr_value = 300	
	elseif difficulty == 6 or difficulty == 7 then
		ponr_value = 270
	else
		ponr_value = 240	
	end

return {
	--Pro Job PONR 
	[101374] = {
		ponr = ponr_value
	},
	[102218] = {
		values = {
            chance = chance_dozer
		}
	}
}