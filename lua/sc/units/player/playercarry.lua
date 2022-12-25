local armor_init = tweak_data.player.damage.ARMOR_INIT

function PlayerCarry:_perform_jump(jump_vec)
        mvector3.multiply(jump_vec, tweak_data.carry.types[self._tweak_data_name].jump_modifier)
	PlayerCarry.super._perform_jump(self, jump_vec)
end

function PlayerCarry:_get_max_walk_speed(...)
	local multiplier = tweak_data.carry.types[self._tweak_data_name].move_speed_modifier
	
	if managers.player:has_category_upgrade("carry", "movement_penalty_nullifier") then
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("carry", "movement_speed_multiplier", 1), 0, 1)
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("player", "mrwi_carry_speed_multiplier", 1), 0, 1)
	else
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("carry", "movement_speed_multiplier", 1), 0, 1)
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("player", "mrwi_carry_speed_multiplier", 1), 0, 1)
	end
	
	if managers.player:has_category_upgrade("player", "armor_carry_bonus") then
		local base_max_armor = armor_init + managers.player:body_armor_value("armor") + managers.player:body_armor_skill_addend()
		local mul = managers.player:upgrade_value("player", "armor_carry_bonus", 1)

		for i = 1, base_max_armor, 1 do
			multiplier = multiplier * mul
		end

		multiplier = math.clamp(multiplier, 0, 1)
	end
	

	if managers.mutators:is_mutator_active(MutatorCG22) then
		local mutator = managers.mutators:get_mutator(MutatorCG22)
		multiplier = multiplier * mutator:get_bag_speed_increase_multiplier()
	end	
		
	return PlayerCarry.super._get_max_walk_speed(self, ...) * multiplier
end

function PlayerCarry:_upd_attention()
	if managers.groupai:state():whisper_mode() and not self._state_data.ducking then
		local preset = {
			"pl_friend_combatant_cbt",
			"pl_friend_non_combatant_cbt",
			"pl_foe_combatant_cbt_stand",
			"pl_foe_non_combatant_cbt_stand"
		}

		self._ext_movement:set_attention_settings(preset)
	else
		PlayerCarry.super._upd_attention(self)
	end
end