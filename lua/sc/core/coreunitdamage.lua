-- Make bulldozer armor scale with difficulty and increase planks durability
Hooks:PostHook(CoreBodyDamage, "init", "sh_init", function (self)
	if not self._body_element then
		return
	end
	if self._unit:character_damage() and self._unit:character_damage().IS_TANK then
		if self._body_element._name:find("glass") then
			self._body_element._damage_multiplier = tweak_data.character.tank_glass_damage_mul or self._body_element._damage_multiplier
		else
			self._body_element._damage_multiplier = tweak_data.character.tank_armor_damage_mul or self._body_element._damage_multiplier
		end
	elseif self._body_element._name == "planks_body" then
		self._body_element._damage_multiplier = 0.4
	end
end)

-- Hook the correct class - CoreUnitDamage instead of CoreDamageExtension
Hooks:PostHook(CoreUnitDamage, "run_sequence_simple", "DebugMissingSequenceRun", function(self, name, ...)
	local unit_name = self._unit and self._unit:name() and tostring(self._unit:name()) or "UNKNOWN_UNIT"
	local unit_filepath = self._unit and self._unit:name() and self._unit:name():t() or "UNKNOWN_FILEPATH"
	
	if not self._sequences then
		log("[SEQUENCE DEBUG] Unit has no _sequences table:")
		log("  Unit Name: " .. unit_name)
		log("  Unit File: " .. unit_filepath)
	elseif not name then
		log("[SEQUENCE DEBUG] Attempted to run a NIL sequence:")
		log("  Unit Name: " .. unit_name) 
		log("  Unit File: " .. unit_filepath)
	elseif not self._sequences[name] then
		log("[SEQUENCE DEBUG] Missing sequence: '" .. tostring(name) .. "'")
		log("  Unit Name: " .. unit_name)
		log("  Unit File: " .. unit_filepath)
		log("  Available sequences: " .. table.concat(table.list_to_set(self._sequences), ", "))
	end
end)
