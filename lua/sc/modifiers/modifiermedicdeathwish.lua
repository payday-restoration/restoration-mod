function ModifierMedicDeathwish:OnEnemyDied(unit, damage_info)
	if Network:is_client() then
		return
	end

	if unit:base():has_tag("medic") then
		local enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.radius, managers.slot:get_mask("enemies"))

		for _, enemy in ipairs(enemies) do
			local skip_enemy = nil

			if enemy:anim_data() and enemy:anim_data().act then
				skip_enemy = true
			end

			if not skip_enemy and unit:character_damage():heal_unit(enemy, true) then
				local damage_info = {
					damage = 0,
					type = "healed",
					variant = "healed",
					result = {
						variant = "healed",
						type = "healed"
					}
				}

				enemy:network():send("damage_simple", enemy, 0, 4, 1)
				enemy:character_damage():_call_listeners(damage_info)
			end
		end
	end
end
