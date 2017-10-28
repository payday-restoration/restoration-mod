if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function MedicDamage:heal_unit(unit, override_cooldown)
		local t = Application:time()
		local my_tweak_table = self._unit:base()._tweak_table
		local cooldown = tweak_data.medic.cooldown

		cooldown = managers.crime_spree:modify_value("MedicDamage:CooldownTime", cooldown)
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		if my_tweak_table == "medic" or my_tweak_table == "tank_medic" or my_tweak_table == "deathvox_medic" or my_tweak_table == "deathvox_medicdozer" then
			cooldown = tweak_data.medic.cooldown
		else
			cooldown = 0.1
		end
		if t < self._heal_cooldown_t + cooldown and not override_cooldown then
			return false
		end
		if self._unit:anim_data() and self._unit:anim_data().act then
			return false
		end
		if my_tweak_table == "medic" or my_tweak_table == "tank_medic" then
			local tweak_table = unit:base()._tweak_table
			if table.contains(tweak_data.medic.disabled_units, tweak_table) then
				return false
			end
			if unit:brain() and unit:brain()._logic_data then
				local team = unit:brain()._logic_data.team
				if team and team.id ~= "law1" and (not team.friends or not team.friends.law1) then
					return false
				end
			end
			if unit:brain() and unit:brain()._logic_data and unit:brain()._logic_data.is_converted then
				return false
			end
		elseif my_tweak_table == "medic_summers" then
			local tweak_table = unit:base()._tweak_table
			if not table.contains(tweak_data.medic.whitelisted_units, tweak_table) then
				return false
			end
			if unit:brain() and unit:brain()._logic_data then
				local team = unit:brain()._logic_data.team
				if team and team.id ~= "law1" and (not team.friends or not team.friends.law1) then
					return false
				end
			end
		else
			local tweak_table = unit:base()._tweak_table
			if not table.contains(tweak_data.medic.whitelisted_units_summer_squad, tweak_table) then
				return false
			end
			if unit:brain() and unit:brain()._logic_data then
				local team = unit:brain()._logic_data.team
				if team and team.id ~= "law1" and (not team.friends or not team.friends.law1) then
					return false
				end
			end
		end
		local cop_dmg = unit:character_damage()
		cop_dmg._health = cop_dmg._HEALTH_INIT
		cop_dmg._health_ratio = 1
		cop_dmg:_update_debug_ws()
		self._heal_cooldown_t = t
		if not self._unit:character_damage():dead() then
			local action_data = {
				type = "heal",
				body_part = 3,
				client_interrupt = Network:is_client() and true or false
			}
			self._unit:movement():action_request(action_data)
		end
		managers.crime_spree:run_func("OnEnemyHealed", self._unit, unit)
		managers.network:session():send_to_peers("sync_medic_heal", self._unit)
		if difficulty_index == 8 then
			if my_tweak_table == "deathvox_medic" or my_tweak_table == "deathvox_medicdozer" then
				local enemies = World:find_units_quick(self._unit, "sphere", self._unit:position(), tweak_data.medic.radius, managers.slot:get_mask("enemies"))
				if enemies then
					RestorationCore.log_shit("SC: DV: Found Enemies to heal")
					for _,enemy in ipairs(enemies) do
						if enemy ~= self._unit then
							RestorationCore.log_shit("SC: DV: Enemy isnt us, tweak table is " .. enemy:base()._tweak_table)
							if not enemy:character_damage():dead() then
								RestorationCore.log_shit("Enemy not dead")
								local health_left = enemy:character_damage()._health
								local max_health = enemy:character_damage()._HEALTH_INIT 
								enemy:character_damage():_apply_damage_to_health(((max_health - health_left) * -1))
								RestorationCore.log_shit("Enemy healed")
							end
						end
					end
				end
			end
		end
		return true
	end

end