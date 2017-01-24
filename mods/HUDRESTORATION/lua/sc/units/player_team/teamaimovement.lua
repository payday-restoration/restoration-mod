if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function TeamAIMovement:on_SPOOCed( enemy_unit )
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	if difficulty_index < 6 then
		if self._unit:character_damage()._god_mode then
			return
		end

		self._unit:brain():set_logic( "surrender" )
		self._unit:network():send( "arrested" )
		self._unit:character_damage():on_arrested()
	else
		return "countered"
	end
end

end