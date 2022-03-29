local old_damage_melee = TeamAIDamage.damage_melee
function TeamAIDamage:damage_melee(attack_data)
	
	if attack_data.name_id and attack_data.name_id == "fear" then
		if self._unit:base()._tweak_table == "russian" then
			self._unit:sound():say("s05x_sin", true)
		end
	end

	old_damage_melee(self, attack_data)
end