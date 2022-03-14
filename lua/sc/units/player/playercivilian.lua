function PlayerCivilian:init(unit)
	PlayerCivilian.super.init(self, unit)

	self._civilian_attention_settings = {
		"pl_civilian"
	}
end

function PlayerCivilian:_upd_attention()
	self._ext_movement:set_attention_settings(self._civilian_attention_settings)
end

function PlayerCivilian:_enter(enter_data)
	local equipped_selection = self._unit:inventory():equipped_selection()

	if equipped_selection ~= 1 then
		self._previous_equipped_selection = equipped_selection

		self._ext_inventory:equip_selection(1, false)
		managers.upgrades:setup_current_weapon()
	end

	if self._unit:camera():anim_data().equipped then
		self:_play_unequip_animation()
	end

	self._unit:base():set_slot(self._unit, 4)
	self._ext_movement:set_attention_settings(self._civilian_attention_settings)

	if not managers.groupai:state():enemy_weapons_hot() then
		self._enemy_weapons_hot_listen_id = "PlayerCivilian" .. tostring(self._unit:key())

		managers.groupai:state():add_listener(self._enemy_weapons_hot_listen_id, {
			"enemy_weapons_hot"
		}, callback(self, self, "clbk_enemy_weapons_hot"))
	end

	self._ext_network:send("set_stance", 1, false, false)

	self._show_casing_t = Application:time() + 4

	if _G.IS_VR then
		managers.hud:belt():set_visible(false)

		self._weapon_hand_id = self._unit:hand():get_active_hand_id("weapon")

		self._unit:hand():set_default_state(PlayerHand.LEFT, "idle", true)
		self._unit:hand():set_default_state(PlayerHand.RIGHT, "idle", true)
	end
end
