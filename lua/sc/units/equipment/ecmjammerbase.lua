function ECMJammerBase._detect_and_give_dmg(hit_pos, device_unit, user_unit, range)
	--[[local enemies_in_range = nil

	if device_unit then
		enemies_in_range = World:find_units_quick("sphere", hit_pos, range, managers.slot:get_mask("enemies"))
	else
		enemies_in_range = World:find_units_quick("all", managers.slot:get_mask("enemies")) --affect enemies on the entire map, to match the Pocket ECM's ingame description for meme purposes
	end]]

	local enemies_in_range = World:find_units_quick("sphere", hit_pos, range, managers.slot:get_mask("enemies"))
	local enemies_to_stun = {}

	if #enemies_in_range > 0 then
		for _, enemy in ipairs(enemies_in_range) do
			if not table.contains(enemies_to_stun, enemy) and enemy:character_damage() and enemy:character_damage().damage_explosion and not enemy:character_damage():dead() then
				if enemy:base():char_tweak().ecm_vulnerability then
					local stun = true

					if enemy:brain() then
						if enemy:brain().is_hostage and enemy:brain():is_hostage() or enemy:brain().surrendered and enemy:brain():surrendered() then
							stun = false
						end
					end

					if stun then
						if enemy:anim_data() and enemy:anim_data().act then
							stun = false
						elseif enemy:base():char_tweak().ecm_vulnerability <= math.random() then
							stun = false
						end
					end

					if stun then
						table.insert(enemies_to_stun, enemy)
					end
				end
			end
		end
	end

	for _, enemy in ipairs(enemies_to_stun) do
		local e_head_pos = mvector3.copy(enemy:movement():m_head_pos())
		local attack_dir = Vector3()

		mvector3.direction(attack_dir, hit_pos, e_head_pos)
		mvector3.normalize(attack_dir)

		local attack_data = {
			damage = 0,
			variant = "stun",
			attacker_unit = alive(user_unit) and user_unit or nil,
			weapon_unit = device_unit,
			col_ray = {
				position = mvector3.copy(enemy:movement():m_head_pos()),
				ray = attack_dir
			}
		}

		enemy:character_damage():damage_explosion(attack_data)
	end
end