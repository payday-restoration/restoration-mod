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

--Altered to check if the compared values are both numbers
function CoreBodyDamage:set_damage(damage_type, damage)
	self._damage[damage_type] = tonumber(damage) or 0

	local element = self._body_element._first_endurance[damage_type]

	while element do
		local endurance = tonumber(element._endurance[damage_type])

        if (type(endurance) ~= "number" or type(self._damage[damage_type]) ~= "number") then
            log("A \"damage_type\" VALUE IS NOT A NUMBER")
            log("damage_type: " .. tostring(damage_type))
            log("self._damage[damage_type] type: " .. type(self._damage[damage_type]) .. " value: " .. tostring(self._damage[damage_type]))
            log("element._endurance[damage_type] type: " .. type(element._endurance[damage_type]) .. " value: " .. tostring(element._endurance[damage_type]))
        end

		if not endurance or endurance > self._damage[damage_type] then
			break
		end

		element = element._next[damage_type]
	end

	self._endurance[damage_type] = element
end