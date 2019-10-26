if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function PlayerTased:enter(state_data, enter_data)
		PlayerTased.super.enter(self, state_data, enter_data)
		self._ids_tased_boost = Idstring("tased_boost")
		self._ids_tased = Idstring("tased")
		self._ids_counter_tase = Idstring("tazer_counter")
		self:_start_action_tased(managers.player:player_timer():time(), state_data.non_lethal_electrocution)
		if state_data.non_lethal_electrocution then
			state_data.non_lethal_electrocution = nil
			local recover_time = Application:time() + tweak_data.player.damage.STUN_TIME * managers.player:upgrade_value("player", "electrocution_resistance_multiplier", 1)
			self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"
			managers.enemy:add_delayed_clbk(self._recover_delayed_clbk, callback(self, self, "clbk_exit_to_std"), recover_time)
		else
			self._fatal_delayed_clbk = "PlayerTased_fatal_delayed_clbk"
			local tased_time = tweak_data.player.damage.TASED_TIME
			managers.enemy:add_delayed_clbk(self._fatal_delayed_clbk, callback(self, self, "clbk_exit_to_fatal"), TimerManager:game():time() + tased_time)
		end
		self._next_shock = 0.5
		self._taser_value = 1
		self._num_shocks = 0
		managers.groupai:state():on_criminal_disabled(self._unit, "electrified")
		if Network:is_server() then
			self:_register_revive_SO()
		end
		local projectile_entry = managers.blackmarket:equipped_projectile()
		if tweak_data.blackmarket.projectiles[projectile_entry].is_a_grenade then
			self:_interupt_action_throw_grenade()
		else
			self:_interupt_action_throw_projectile()
		end
		self:_interupt_action_reload()
		self:_interupt_action_steelsight()
		self:_interupt_action_melee(managers.player:player_timer():time())
		self:_interupt_action_ladder(managers.player:player_timer():time())
		self:_interupt_action_charging_weapon(managers.player:player_timer():time())
		self._rumble_electrified = managers.rumble:play("electrified")
		self.tased = true
		self._state_data = state_data
		local player_manager = managers.player
		if player_manager:has_category_upgrade("player", "escape_taser") then
			local target_time = player_manager:upgrade_value("player", "escape_taser", 2)
			player_manager:add_coroutine("escape_tase", PlayerAction.EscapeTase, player_manager, target_time)
		end
	end

	Hooks:PostHook(PlayerTased, "clbk_exit_to_fatal", "ResTaseNoHealthChange", function(self)
		self._unit:character_damage():cloak_or_shock_incap(tweak_data.character.taser.shock_damage)
	end)
end