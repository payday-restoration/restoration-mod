function MedicDamage:heal_unit(unit, override_cooldown)
	if self._unit:anim_data() and self._unit:anim_data().act then
		return false
	end

	local t = Application:time()
	local my_tweak_data = self._unit:base()._tweak_table
	local target_tweak_table = unit:base()._tweak_table

	if not override_cooldown then
		if my_tweak_data == "medic" or my_tweak_data == "tank_medic" then
			if unit:character_damage()._healed_cooldown_t and unit:character_damage()._healed_cooldown_t > t then
				return false
			else
				local cooldown = 20
				cooldown = managers.modifiers:modify_value("MedicDamage:CooldownTime", cooldown)

				if t < self._heal_cooldown_t + cooldown then
					return false
				end
			end
		end
	end

	if my_tweak_data == "medic" or my_tweak_data == "tank_medic" then
		if table.contains(tweak_data.medic.disabled_units, target_tweak_table) then
			return false
		end
	elseif my_tweak_data == "medic_summers" then
		if not table.contains(tweak_data.medic.whitelisted_units, target_tweak_table) then
			return false
		end
	else
		if not table.contains(tweak_data.medic.whitelisted_units_summer_squad, target_tweak_table) then
			return false
		end
	end

	local team = unit:movement().team and unit:movement():team()

	if team and team.id ~= "law1" then
		if not team.friends or not team.friends.law1 then
			return false
		end
	end

	if unit:brain() then
		if unit:brain().converted then
			if unit:brain():converted() then
				return false
			end
		elseif unit:brain()._logic_data and unit:brain()._logic_data.is_converted then
			return false
		end
	end

	self._heal_cooldown_t = t

	local target_char_tweak = tweak_data.character[target_tweak_table]
	local healed_cooldown = target_char_tweak.heal_cooldown or 90

	unit:character_damage()._healed_cooldown_t = t + healed_cooldown

	if not self._unit:character_damage():dead() then
		if self._unit:contour() then
			self._unit:contour():add("medic_show", false)
			self._unit:contour():flash("medic_show", 0.2)
		end

		local action_data = {
			body_part = 1,
			type = "heal",
			client_interrupt = Network:is_client()
		}

		self._unit:movement():action_request(action_data)
	end

	--temporarily disabling buffs because there's no way to sync them properly when a client locally procs the heal
	--[[if Global.game_settings.difficulty == "sm_wish" then
		if my_tweak_data == "medic" or my_tweak_data == "tank_medic" then
			unit:base():add_buff("base_damage", 15 * 0.01)

			if unit:contour() then
				unit:contour():add("medic_buff", false)
			end
		end
	elseif Global.game_settings.difficulty == "overkill_290" then
		if my_tweak_data == "medic" or my_tweak_data == "tank_medic" then
			unit:base():add_buff("base_damage", 5 * 0.01)

			if unit:contour() then
				unit:contour():add("medic_buff", false)
			end
		end
	end]]

	managers.network:session():send_to_peers("sync_medic_heal", self._unit)
	MedicActionHeal:check_achievements()

	if self._unit:base():char_tweak()["custom_voicework"] then
		local voicelines = _G.voiceline_framework.BufferedSounds[self._unit:base():char_tweak().custom_voicework]
		if voicelines and voicelines["heal"] then
			local line_to_use = voicelines.heal[math.random(#voicelines.heal)]
			self._unit:base():play_voiceline(line_to_use)
		end
	end

	return true

end