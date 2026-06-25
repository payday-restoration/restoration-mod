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
	elseif self._body_element._name == "shield_visor" then
		self._body_element._damage_multiplier = tweak_data.character.tank_glass_damage_mul or self._body_element._damage_multiplier
	elseif self._body_element._name == "shield_visor2" then -- this is a second breakable parts some shields may have. Right now it's just for the lower half of the Reaper Glass shield
		self._body_element._damage_multiplier = tweak_data.character.tank_glass_damage_mul or self._body_element._damage_multiplier
	end
end)

--Blocks damage towards tripmines unless it's a player
function CoreBodyDamage:damage_endurance(endurance_type, attack_unit, normal, position, direction, damage, velocity)
	--Start
	local is_tripmine = self._unit and self._unit.base and self._unit:base() and self._unit:base().is_tripmine
	local tripmine_base = is_tripmine and self._unit:base()
	if attack_unit and tripmine_base then
		local function get_peer_id(unit)
			if managers.network and managers.network:session() then
				for peer_id, peer in pairs(managers.network:session():peers()) do
					if peer:unit() == unit then
						return peer_id
					end
				end
			end
			return --if no peer_id is found then return 'nil' for the default output of managers.player:player_unit() which is just "1" - the local player unit
		end
		if managers.player:player_unit(get_peer_id(attack_unit)) ~= attack_unit then
			damage = 0
		end
	end
	--End
	if self._body_element then
		damage = damage * self._body_element._damage_multiplier
	end
	if self._endurance[endurance_type] then
		local env = CoreSequenceManager.SequenceEnvironment:new(endurance_type, attack_unit, self._unit, self._body, normal, position, direction, damage, velocity, nil, self._unit_element)

		self._endurance[endurance_type]:damage(env)
	end

	return damage
end

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