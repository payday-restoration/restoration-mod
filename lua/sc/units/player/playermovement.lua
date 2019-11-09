if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local init_original = PlayerMovement.init
	function PlayerMovement:init(...)
		init_original(self, ...)
		
		self._underdog_skill_data.has_dmg_dampener = self._underdog_skill_data.has_dmg_dampener or 
			managers.player:has_category_upgrade("temporary", "dmg_dampener_close_contact")
			
		self._underdog_skill_data.chk_interval_active = 1 --temp test
	end
	
	function PlayerMovement:on_SPOOCed(enemy_unit)
		if managers.player:has_category_upgrade("player", "counter_strike_spooc") and self._current_state.in_melee and self._current_state:in_melee() then
			self._current_state:discharge_melee()

			return "countered"
		end

		if self._unit:character_damage()._god_mode or self._unit:character_damage():get_mission_blocker("invulnerable") then
			return
		end

		if self._current_state_name == "standard" or self._current_state_name == "carry" or self._current_state_name == "bleed_out" or self._current_state_name == "tased" or self._current_state_name == "bipod" then
			local state = "incapacitated"
			
			managers.player:set_player_state(state)
			self._unit:character_damage():cloak_or_shock_incap(tweak_data.character.spooc.kick_damage)
			managers.achievment:award(tweak_data.achievement.finally.award)

			return true
		end
	end	
		
	function PlayerMovement:on_jump_SPOOCed(enemy_unit)
		if managers.player:has_category_upgrade("player", "counter_strike_spooc") and self._current_state.in_melee and self._current_state:in_melee() then
			self._current_state:discharge_melee()

			return "countered"
		end

		if self._unit:character_damage()._god_mode or self._unit:character_damage():get_mission_blocker("invulnerable") then
			return
		end

		if self._current_state_name == "standard" or self._current_state_name == "carry" or self._current_state_name == "bleed_out" or self._current_state_name == "tased" or self._current_state_name == "bipod" then
			local state = "arrested"
			state = managers.modifiers:modify_value("PlayerMovement:OnJumpSpooked", state)

			managers.player:set_player_state(state)
			managers.achievment:award(tweak_data.achievement.finally.award)

			return true
		end
	end
	
end