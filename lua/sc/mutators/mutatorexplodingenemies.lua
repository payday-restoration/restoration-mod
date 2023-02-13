MutatorExplodingEnemies.reductions = {
	money = 0,
	exp = 0
}

function MutatorExplodingEnemies:explosion_delay()
	return 0
end

function MutatorExplodingEnemies:_detonate(cop_damage, attack_data, is_cs, damage, range)
	local pos = attack_data.pos

	if self:explosion_delay() > 0 or not pos then
		if alive(cop_damage._unit) then
			pos = cop_damage._unit:get_object(Idstring("Hips")):position() or pos
		end
	end

	if not pos then
		return
	end

	local range = range or self:get_explosion_size() * 100
	local damage = damage or (attack_data.raw_damage or attack_data.damage or cop_damage._HEALTH_INIT)
	local normal = attack_data.attack_dir or math.UP
	local curve_pow = 4
	local effect_params = {
		sound_event = "grenade_explode",
		effect = "effects/particles/explosions/explosion_grenade",
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		feedback_range = range * 2
	}

	if not is_cs and self:use_nuclear_bulldozers() then
		if alive(cop_damage._unit) and cop_damage._unit:base().has_tag and cop_damage._unit:base():has_tag("tank") then
			range = 2000
			damage = damage * 2.5
			curve_pow = 6
			effect_params.effect = "effects/payday2/particles/explosions/bag_explosion"
		end
	end

    local ply_damage = damage
    
    if not is_cs then
        ply_damage = damage * 0.5
    end

	managers.explosion:give_local_player_dmg(pos, range, ply_damage)
    managers.explosion:play_sound_and_effects(pos, normal, range, effect_params)
    
    if is_cs then
        return
    end

	local deal_local_damage_and_sync = nil
	local attacker = attack_data.attacker_unit

	if Network:is_server() then
		if not attacker then
			deal_local_damage_and_sync = true
		elseif not alive(attacker) then
			attacker = nil
			deal_local_damage_and_sync = true
		elseif not attacker:base().is_husk_player then
			deal_local_damage_and_sync = true
		end
	elseif attacker and alive(attacker) and attacker:base().is_local_player then
		deal_local_damage_and_sync = true
	end

	if deal_local_damage_and_sync then
		local slot_mask = managers.slot:get_mask("explosion_targets")
		local damage_params = {
			no_raycast_check_characters = true,
			hit_pos = pos,
			range = range,
			collision_slotmask = slot_mask,
			curve_pow = curve_pow,
			damage = damage,
			player_damage = 0,
			user = attacker
		}

		managers.explosion:detect_and_give_dmg(damage_params)
		managers.network:session():send_to_peers_synched("element_explode_on_client", pos, normal, damage, range, curve_pow)
	end
end
