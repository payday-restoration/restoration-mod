if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	function ModifierMedicDeathwish:OnEnemyDied(unit, damage_info)
		--[[if damage_info.attacker_unit and alive(damage_info.attacker_unit) then
			local attacker = damage_info.attacker_unit

			if attacker and attacker:base().thrower_unit and attacker:base():thrower_unit() then
				attacker = attacker:base():thrower_unit()
			end

			if not attacker:base().is_local_player and Network:is_client() then
				return
			end
		elseif Network:is_client() then
			return
		end]]

		if unit:base():has_tag("medic") then
			local enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.radius, managers.slot:get_mask("enemies"))

			for _, enemy in ipairs(enemies) do
				if unit:character_damage():heal_unit(enemy, true) then
					if enemy:contour() then
						enemy:contour():add("medic_heal")
						enemy:contour():flash("medic_heal", 0.2)
					end

					if enemy:base():char_tweak().ignore_medic_revive_animation then
						return
					end

					enemy:movement():action_request({
						body_part = 1,
						type = "healed"
					})
				end
			end
		end
	end
end
