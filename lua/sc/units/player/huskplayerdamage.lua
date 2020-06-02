function HuskPlayerDamage:_send_damage_to_owner(attack_data)
	local peer_id = managers.criminals:character_peer_id_by_unit(self._unit)
    local damage = managers.mutators:modify_value("HuskPlayerDamage:FriendlyFireDamage", attack_data.damage)
    damage = managers.modifiers:modify_value("HuskPlayerDamage:FriendlyFireDamageCS", attack_data.damage)

	managers.network:session():send_to_peers("sync_friendly_fire_damage", peer_id, attack_data.attacker_unit, damage, attack_data.variant)

	if attack_data.attacker_unit == managers.player:player_unit() then
		managers.hud:on_hit_confirmed()
	end

	managers.job:set_memory("trophy_flawless", true, false)
end