function HuskCivilianDamage:damage_fire(attack_data)
	if not managers.groupai:state():whisper_mode() then
		if managers.player:has_category_upgrade("player", "civ_harmless_bullets") and self.no_intimidation_by_dmg and not self:no_intimidation_by_dmg() and (not self._survive_shot_t or self._survive_shot_t < TimerManager:game():time()) then
			self._survive_shot_t = TimerManager:game():time() + 2.5

			self._unit:brain():on_intimidated(1, attack_data.attacker_unit)

			return
		end
	end


	if attack_data.variant == "fire" then
		attack_data.damage = 10
	end

	return CopDamage.damage_fire(self, attack_data)
end