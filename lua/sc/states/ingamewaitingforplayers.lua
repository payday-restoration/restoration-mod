if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

local old_playerstate = IngameWaitingForPlayersState._start
function IngameWaitingForPlayersState:_start()
	old_playerstate(self)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local mark_duration = 13.5
	if difficulty_index == 8 then
		mark_duration = 6.75
	elseif difficulty_index == 7 then
		mark_duration = 10.125
	else
		mark_duration = 13.5
	end
	ContourExt._types.mark_enemy.fadeout_silent = mark_duration
	ContourExt._types.mark_enemy_damage_bonus.fadeout_silent = mark_duration
end

end