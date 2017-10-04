if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	if SystemFS:exists("mods/Better Bots/mod.txt") then
		return
	end

	TeamAIMovement.update = TeamAIMovement.super.update

	function TeamAIMovement:on_SPOOCed( enemy_unit )
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		if difficulty_index < 9 then
			if self._unit:character_damage()._god_mode then
				return
			end
			--Maybe we'll be more like PDTH again some day
			--self._unit:brain():set_logic( "surrender" )
			--self._unit:network():send( "arrested" )
			--self._unit:character_damage():on_arrested()
			self._unit:character_damage():on_incapacitated()
		else
			return "countered"
		end
	end
		
	local old_throw = TeamAIMovement.throw_bag
	function TeamAIMovement:throw_bag(...)
		local data = self._ext_brain._logic_data
		if data then
			local objective = data.objective
			if objective then
				if objective.type == "revive" then
					if managers.player:is_custom_cooldown_not_active("team", "crew_inspire") then
						return
					end
				end
			end
		end
		return old_throw(self, ...)
	end
		
end