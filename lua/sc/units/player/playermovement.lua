local infiltrator_distance = tweak_data.upgrades.infiltrator_dr_range * tweak_data.upgrades.infiltrator_dr_range
local init_original = PlayerMovement.init
function PlayerMovement:init(...)
	init_original(self, ...)
	
	self._underdog_skill_data.has_dmg_dampener = self._underdog_skill_data.has_dmg_dampener or 
		managers.player:has_category_upgrade("temporary", "dmg_dampener_close_contact")
		
	self._underdog_skill_data.chk_interval_active = 1 --temp test

	local detection_risk_stamina_regen = managers.player:upgrade_value("player", "detection_risk_stamina_regen")
	self._stamina_regen_add = managers.player:get_value_from_risk_upgrade(detection_risk_stamina_regen) or 0
end

function PlayerMovement:on_SPOOCed(enemy_unit, flying_strike)
	local can_parry = (not flying_strike and managers.player:has_category_upgrade("player", "counter_strike_spooc_sprint")) or (flying_strike and managers.player:has_category_upgrade("player", "counter_strike_spooc"))
	if can_parry and self._current_state.in_melee and self._current_state:in_melee() and not tweak_data.blackmarket.melee_weapons[managers.blackmarket:equipped_melee_weapon()].chainsaw then
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

function PlayerMovement:clbk_attention_notice_sneak(observer_unit, status, local_client_detection)
	if alive(observer_unit) then
		self:on_suspicion(observer_unit, status, local_client_detection)
	end
end

function PlayerMovement:on_suspicion(observer_unit, status, local_client_detection)
	if Network:is_server() or local_client_detection then
		self._suspicion_debug = self._suspicion_debug or {}
		self._suspicion_debug[observer_unit:key()] = {
			unit = observer_unit,
			name = observer_unit:name(),
			status = status
		}
		local visible_status = nil

		if managers.groupai:state():whisper_mode() and not managers.groupai:state():stealth_hud_disabled() then
			visible_status = status
		else
			visible_status = false
		end

		self._suspicion = self._suspicion or {}

		if visible_status == false or visible_status == true then
			self._suspicion[observer_unit:key()] = nil

			if not next(self._suspicion) then
				self._suspicion = nil
			end

			if visible_status and observer_unit:movement() and not observer_unit:movement():cool() and TimerManager:game():time() - observer_unit:movement():not_cool_t() > 1 then
				self._suspicion_ratio = false

				self:_feed_suspicion_to_hud()

				return
			end
		elseif type(visible_status) == "number" and (not observer_unit:movement() or observer_unit:movement():cool()) then
			self._suspicion[observer_unit:key()] = visible_status
		else
			return
		end

		self:_calc_suspicion_ratio_and_sync(observer_unit, visible_status, local_client_detection)
	else
		self._suspicion_ratio = status
	end

	self:_feed_suspicion_to_hud()
end

function PlayerMovement:_calc_suspicion_ratio_and_sync(observer_unit, status, local_client_detection)
	local suspicion_sync = nil

	if self._suspicion and status ~= true then
		local max_suspicion = nil

		for u_key, val in pairs(self._suspicion) do
			if not max_suspicion or max_suspicion < val then
				max_suspicion = val
			end
		end

		if max_suspicion then
			self._suspicion_ratio = max_suspicion
			suspicion_sync = math.ceil(self._suspicion_ratio * 254)
		else
			self._suspicion_ratio = false
			suspicion_sync = false
		end
	elseif type(status) == "boolean" then
		self._suspicion_ratio = status
		suspicion_sync = status and 255 or 0
	else
		self._suspicion_ratio = false
		suspicion_sync = 0
	end

	if not local_client_detection and suspicion_sync ~= self._synced_suspicion then
		self._synced_suspicion = suspicion_sync
		local peer = managers.network:session():peer_by_unit(self._unit)

		if peer then
			managers.network:session():send_to_peers_synched("suspicion", peer:id(), suspicion_sync)
		end
	end
end

function PlayerMovement:_restart_stamina_regen_timer()
	self._regenerate_timer = ((tweak_data.player.movement_state.stamina.REGENERATE_TIME or 5) + self._stamina_regen_add ) * managers.player:upgrade_value("player", "stamina_regen_timer_multiplier", 1)
end

function PlayerMovement:activate_regeneration()
	self._regenerate_timer = ((tweak_data.player.movement_state.stamina.REGENERATE_TIME or 5) + self._stamina_regen_add ) * managers.player:upgrade_value("player", "stamina_regen_timer_multiplier", 1)
end