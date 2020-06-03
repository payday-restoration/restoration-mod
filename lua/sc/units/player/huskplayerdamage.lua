function HuskPlayerDamage:damage_bullet(attack_data)
	if Global.game_settings and Global.game_settings.one_down or Global.crime_spree or managers.mutators:is_mutator_active(MutatorFriendlyFire) then
		self:_send_damage_to_owner(attack_data)
	end
end

function HuskPlayerDamage:damage_melee(attack_data)
	if Global.game_settings and Global.game_settings.one_down or Global.crime_spree or managers.mutators:is_mutator_active(MutatorFriendlyFire) then
		self:_send_damage_to_owner(attack_data)
	end
end

function HuskPlayerDamage:damage_fire(attack_data)
	if Global.game_settings and Global.game_settings.one_down or Global.crime_spree or managers.mutators:is_mutator_active(MutatorFriendlyFire) then
		local apply_damage_reduction = true
		local attacker_unit = attack_data.attacker_unit

		if attacker_unit and alive(attacker_unit) then
			if attacker_unit:base() and attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
				attack_data.attacker_unit = attacker_unit
			end

			if attacker_unit:base().is_husk_player then
				apply_damage_reduction = false
			end
		end

		--if somehow something that deals fire damage that isn't a player hits a player husk, apply the reduction as usual
		if apply_damage_reduction then
			attack_data.damage = attack_data.damage * 0.2
		end

		self:_send_damage_to_owner(attack_data)
	end
end

function HuskPlayerDamage:_send_damage_to_owner(attack_data)
	local peer_id = managers.criminals:character_peer_id_by_unit(self._unit)
	local damage = attack_data.damage

	if Global.crime_spree then
		local is_enabled = false
		is_enabled = managers.modifiers:modify_value("HuskPlayerDamage:FriendlyFireDamageCSEnabled", is_enabled)

		if is_enabled then
			damage = managers.modifiers:modify_value("HuskPlayerDamage:FriendlyFireDamageCS", damage)
			log("damage is: " .. damage .. ".")
		else
			return
		end
	elseif managers.mutators:is_mutator_active(MutatorFriendlyFire) then --mutator overrides pro job setting
		damage = managers.mutators:modify_value("HuskPlayerDamage:FriendlyFireDamage", damage)
	elseif Global.game_settings and Global.game_settings.one_down then
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)

		if difficulty_index <= 5 then
			damage = damage * 0.25
		else
			damage = damage * 0.5
		end
		log("damage is: " .. damage .. ".")
	end

	managers.network:session():send_to_peers("sync_friendly_fire_damage", peer_id, attack_data.attacker_unit, damage, attack_data.variant)

	--disabling since it's not accurate, as the player can dodge/block it, maybe make a custom friendly fire indicator to use instead?
	--[[if attack_data.attacker_unit == managers.player:player_unit() then
		managers.hud:on_hit_confirmed()
	end]]

	if managers.mutators:is_mutator_active(MutatorFriendlyFire) then
		managers.job:set_memory("trophy_flawless", true, false)
	end
end
