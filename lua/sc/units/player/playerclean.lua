function PlayerClean:init(unit)
	PlayerClean.super.init(self, unit)

	self._mask_off_attention_settings = {
		"pl_mask_off_friend_combatant",
		"pl_mask_off_friend_non_combatant",
		"pl_mask_off_foe_combatant",
		"pl_mask_off_foe_non_combatant"
	}
end

function PlayerClean:_upd_attention()
	self._ext_movement:set_attention_settings(self._mask_off_attention_settings)
end

function PlayerClean:_enter(enter_data)
	local equipped_selection = self._unit:inventory():equipped_selection()

	if equipped_selection ~= 1 then
		self._previous_equipped_selection = equipped_selection

		self._ext_inventory:equip_selection(1, false)
		managers.upgrades:setup_current_weapon()
	end

	for _, selection in ipairs(self._unit:inventory():available_selections()) do
		local weapon_unit = selection.unit

		if weapon_unit then
			weapon_unit:base():set_gadget_on(0, false)
		end
	end

	self._unit:network():send("set_weapon_gadget_state", 0)

	if self._unit:camera():anim_data().equipped then
		self._unit:camera():play_redirect(self:get_animation("unequip"))
	end

	self._unit:base():set_slot(self._unit, 4)
	self._ext_movement:set_attention_settings(self._mask_off_attention_settings)

	if not managers.groupai:state():enemy_weapons_hot() then
		self._enemy_weapons_hot_listen_id = "PlayerClean" .. tostring(self._unit:key())

		managers.groupai:state():add_listener(self._enemy_weapons_hot_listen_id, {
			"enemy_weapons_hot"
		}, callback(self, self, "clbk_enemy_weapons_hot"))
	end

	self._ext_network:send("set_stance", 1, false, false)

	if _G.IS_VR then
		managers.hud:belt():set_visible(false)

		self._weapon_hand_id = self._unit:hand():get_active_hand_id("weapon")

		self._unit:hand():_set_hand_state(PlayerHand.RIGHT, "idle")
		self._unit:hand():_set_hand_state(PlayerHand.LEFT, "idle")
	end
end
