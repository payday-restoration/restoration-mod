function HuskTeamAIDamage:sync_damage_bullet(attacker_unit, hit_offset_height, result_index)
	if self._dead or self._fatal then
		return
	end

	managers.hud:set_mugshot_damage_taken(self._unit:unit_data().mugshot_id)

	local result_type = result_index ~= 0 and self._RESULT_NAME_TABLE[result_index] or nil
	local result = {
		variant = "bullet",
		type = result_type
	}
	local hit_pos = mvector3.copy(self._unit:movement():m_pos())

	mvector3.set_z(hit_pos, hit_pos.z + hit_offset_height)

	local attack_dir = nil

	if attacker_unit then
		attack_dir = hit_pos - attacker_unit:movement():m_head_pos()

		mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end

	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end

	local attack_data = {
		variant = "bullet",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result,
		is_synced = true
	}

	if result_type == "fatal" then
		self:_on_fatal()
	elseif result_type == "bleedout" then
		self:_on_bleedout()
	end

	self:_call_listeners(attack_data)
end

function HuskTeamAIDamage:sync_damage_explosion(attacker_unit, result_index, i_attack_variant)
	if self._dead or self._fatal then
		return
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]

	managers.hud:set_mugshot_damage_taken(self._unit:unit_data().mugshot_id)

	local result_type = result_index ~= 0 and self._RESULT_NAME_TABLE[result_index] or nil
	local result = {
		variant = variant,
		type = result_type
	}
	local hit_pos = mvector3.copy(self._unit:movement():m_pos())

	mvector3.set_z(hit_pos, hit_pos.z + 130)

	local attack_dir = nil

	if attacker_unit then
		attack_dir = hit_pos - attacker_unit:position()

		mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end

	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result,
		is_synced = true
	}

	if result_type == "fatal" then
		self:_on_fatal()
	elseif result_type == "bleedout" then
		self:_on_bleedout()
	end

	self:_call_listeners(attack_data)
end

function HuskTeamAIDamage:sync_damage_fire(attacker_unit, result_index, i_attack_variant)
	if self._dead or self._fatal then
		return
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]

	managers.hud:set_mugshot_damage_taken(self._unit:unit_data().mugshot_id)

	local result_type = result_index ~= 0 and self._RESULT_NAME_TABLE[result_index] or nil
	local result = {
		variant = variant,
		type = result_type
	}
	local hit_pos = mvector3.copy(self._unit:movement():m_pos())

	mvector3.set_z(hit_pos, hit_pos.z + 130)

	local attack_dir = nil

	if attacker_unit then
		attack_dir = hit_pos - attacker_unit:position()

		mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result,
		is_synced = true
	}

	if result_type == "fatal" then
		self:_on_fatal()
	elseif result_type == "bleedout" then
		self:_on_bleedout()
	end

	self:_call_listeners(attack_data)
end

function HuskTeamAIDamage:sync_damage_melee(attacker_unit, hit_offset_height, result_index)
	if self._dead or self._fatal then
		return
	end

	managers.hud:set_mugshot_damage_taken(self._unit:unit_data().mugshot_id)

	local result_type = result_index ~= 0 and self._RESULT_NAME_TABLE[result_index] or nil
	local result = {
		variant = "melee",
		type = result_type
	}
	local hit_pos = mvector3.copy(self._unit:movement():m_pos())

	mvector3.set_z(hit_pos, hit_pos.z + 130)

	local attack_dir = nil

	if attacker_unit then
		attack_dir = hit_pos - attacker_unit:movement():m_head_pos()

		mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()

		mvector3.negate(attack_dir)
	end

	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end

	local attack_data = {
		variant = "melee",
		attacker_unit = attacker_unit,
		attack_dir = attack_dir,
		pos = hit_pos,
		result = result,
		is_synced = true
	}

	if result_type == "fatal" then
		self:_on_fatal()
	elseif result_type == "bleedout" then
		self:_on_bleedout()
	end

	self:_call_listeners(attack_data)
end

function HuskTeamAIDamage:sync_damage_bleeding()
	local dmg_info = {
		variant = "bleeding",
		result = {
			type = "death"
		},
		is_synced = true
	}

	self:_die()
	self:_call_listeners(dmg_info)
	self:_unregister_unit()
end

function HuskTeamAIDamage:sync_damage_incapacitated()
	self._fatal = true

	self._unit:interaction():set_active(true, false)

	local dmg_info = {
		variant = "bleeding",
		result = {
			type = "fatal"
		},
		is_synced = true
	}

	self:_call_listeners(dmg_info)
end

function HuskTeamAIDamage:sync_damage_tase()
	if self:_cannot_take_damage() then
		return
	end

	self._regenerate_t = nil
	local damage_info = {
		variant = "tase",
		result = {
			type = "hurt"
		},
		is_synced = true
	}

	if self._tase_effect then
		World:effect_manager():fade_kill(self._tase_effect)
	end

	self._tase_effect = World:effect_manager():spawn(self._tase_effect_table)
	self:_call_listeners(damage_info)
end
