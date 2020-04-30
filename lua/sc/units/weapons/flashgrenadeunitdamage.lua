function FlashGrenadeUnitDamage:add_damage(endurance_type, attack_unit, dest_body, normal, position, direction, damage, velocity)
	local already_destroyed = self:get_damage() > 0
	local destroyed, damage = UnitDamage.add_damage(self, endurance_type, attack_unit, dest_body, normal, position, direction, damage, velocity)

	if destroyed and not already_destroyed then
		local send_destroy = true

		if attack_unit and alive(attack_unit) then
			if Network:is_server() then
				if attack_unit:base() and attack_unit:base().is_husk_player then
					send_destroy = nil
				end
			elseif attack_unit ~= managers.player:player_unit() then
				send_destroy = nil
			end
		else
			send_destroy = nil
		end

		if send_destroy then
			managers.player:send_message("flash_grenade_destroyed", nil, attack_unit)
		end
	end

	return destroyed, damage
end
