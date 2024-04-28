function CivilianDamage:damage_bullet(attack_data)
	if not managers.groupai:state():whisper_mode() then
		if managers.player:has_category_upgrade("player", "civ_harmless_bullets") and self.no_intimidation_by_dmg and not self:no_intimidation_by_dmg() and (not self._survive_shot_t or self._survive_shot_t < TimerManager:game():time()) then
			self._survive_shot_t = TimerManager:game():time() + 2.5

			self._unit:brain():on_intimidated(1, attack_data.attacker_unit)

			return
		end
	end

	attack_data.damage = 10

	return CopDamage.damage_bullet(self, attack_data)
end


function CivilianDamage:damage_fire(attack_data)
	if not managers.groupai:state():whisper_mode() then
		if managers.player:has_category_upgrade("player", "civ_harmless_bullets") and self.no_intimidation_by_dmg and not self:no_intimidation_by_dmg() and (not self._survive_shot_t or self._survive_shot_t < TimerManager:game():time()) then
			self._survive_shot_t = TimerManager:game():time() + 2.5

			if attack_data.attacker_unit and alive(attack_data.attacker_unit) then
				self._unit:brain():on_intimidated(1, attack_data.attacker_unit)
			end

			return
		end
	end

	if attack_data.variant == "fire" then
		attack_data.damage = 10
	end

	return CopDamage.damage_fire(self, attack_data)
end


function CivilianDamage:die(variant)
	self._unit:base():set_slot(self._unit, 17)
	self:drop_pickup()

	if self._unit:unit_data().mission_element then
		self._unit:unit_data().mission_element:event("death", self._unit)

		if not self._unit:unit_data().alerted_event_called then
			self._unit:unit_data().alerted_event_called = true

			self._unit:unit_data().mission_element:event("alerted", self._unit)
		end
	end

	managers.modifiers:run_func("OnCivilianKilled", self._unit)

	if alive(managers.interaction:active_unit()) then
		managers.interaction:active_unit():interaction():selected()
	end

	variant = variant or "bullet"
	self._health = 0
	self._health_ratio = 0
	self._dead = true

	self:set_mover_collision_state(false)
	
	self._unit:sound():play(self._char_tweak.die_sound_event, nil, true)
end
