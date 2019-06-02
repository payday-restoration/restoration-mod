if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	TeamAIMovement.update = TeamAIMovement.super.update
	
	function TeamAIMovement:on_jump_SPOOCed(enemy_unit)		
		if self._unit:character_damage()._god_mode then
			return
		end
		
		self._unit:brain():set_logic("surrender")
		self._unit:network():send("arrested")
		self._unit:character_damage():on_arrested()
		
		return true
	end	
	
	function TeamAIMovement:on_SPOOCed(enemy_unit)			
		self._unit:character_damage():on_incapacitated()

		return true
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