local infiltrator_distance = tweak_data.upgrades.infiltrator_dr_range * tweak_data.upgrades.infiltrator_dr_range
local init_original = PlayerMovement.init
function PlayerMovement:init(...)
	init_original(self, ...)
	
	self._underdog_skill_data.has_dmg_dampener = self._underdog_skill_data.has_dmg_dampener or 
		managers.player:has_category_upgrade("temporary", "dmg_dampener_close_contact")
		
	self._underdog_skill_data.chk_interval_active = 1 --temp test
end

function PlayerMovement:on_SPOOCed(enemy_unit, flying_strike)
	if managers.player:has_category_upgrade("player", "counter_strike_spooc") and self._current_state.in_melee and self._current_state:in_melee() then
		self._current_state:discharge_melee()

		return "countered"
	end

	if self._unit:character_damage()._god_mode or self._unit:character_damage():get_mission_blocker("invulnerable") then
		return
	end

	if self._current_state_name == "standard" or self._current_state_name == "carry" or self._current_state_name == "bleed_out" or self._current_state_name == "tased" or self._current_state_name == "bipod" then
        local state = "incapacitated"
        if flying_strike then
            state = "arrested"
        end
		
		state = managers.modifiers:modify_value("PlayerMovement:OnSpooked", state)
		
		managers.player:set_player_state(state)
		self._unit:character_damage():cloak_or_shock_incap(tweak_data.character.spooc.kick_damage)
		managers.achievment:award(tweak_data.achievement.finally.award)

		return true
	end
end	
	
function PlayerMovement:_upd_underdog_skill(t)
	local data = self._underdog_skill_data

	if not self._attackers or not data.has_dmg_dampener and not data.has_dmg_mul or t < self._underdog_skill_data.chk_t then
		return
	end

	local my_pos = self._m_pos
	local nr_guys = 0
	local nr_close_guys = 0
	local activated = nil

	for u_key, attacker_unit in pairs(self._attackers) do
		if not alive(attacker_unit) then
			self._attackers[u_key] = nil

			return
		end

		local attacker_pos = attacker_unit:movement():m_pos()
		local dis_sq = mvector3.distance_sq(attacker_pos, my_pos)

		if dis_sq < data.max_dis_sq and math.abs(attacker_pos.z - my_pos.z) < data.max_vert_dis then
			nr_guys = nr_guys + 1

			if data.nr_enemies <= nr_guys then
				activated = true

				if data.has_dmg_mul then
					managers.player:activate_temporary_upgrade("temporary", "dmg_multiplier_outnumbered")
				end

				if data.has_dmg_dampener then
					managers.player:activate_temporary_upgrade("temporary", "dmg_dampener_outnumbered")
					managers.player:activate_temporary_upgrade("temporary", "dmg_dampener_outnumbered_strong")
				end

				break
			end
			if dis_sq < infiltrator_distance then
				nr_close_guys = nr_close_guys + 1
			end
		end
	end

	if nr_close_guys >= 1 then
		managers.player:activate_temporary_upgrade("temporary", "dmg_dampener_close_contact")
	end

	data.chk_t = t + (activated and data.chk_interval_active or data.chk_interval_inactive)
end