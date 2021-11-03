local math_random = math.random

Hooks:PostHook(CopLogicAttack, "_upd_combat_movement", "RR_upd_combat_movement", function(data)
	local chatter = data.char_tweak.chatter
	if data.internal_data.flank_cover and chatter and chatter.look_for_angle and not data.is_converted and not data.unit:sound():speaking(data.t) then
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "look_for_angle") -- I'll try and flank 'em!
	end
end)

Hooks:PostHook(CopLogicAttack, "_chk_request_action_walk_to_cover_shoot_pos", "RR_chk_request_action_walk_to_cover_shoot_pos", function(data)
	local chatter = data.char_tweak.chatter
	if chatter and (chatter.push or chatter.go_go) and not data.is_converted and not data.unit:sound():speaking(data.t) and data.internal_data.advancing then
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "push" or "go_go") -- Puuuush! / Go, Go!
	end
end)

Hooks:PreHook(CopLogicAttack, "action_complete_clbk", "RR_action_complete_clbk", function(data, action)
	local chatter = data.char_tweak.chatter
	if action:type() == "walk" and data.internal_data.moving_to_cover and action:expired() and chatter and (chatter.inpos or chatter.ready) and not data.is_converted and not data.unit:sound():speaking(TimerManager:game():time()) then -- can't use data.t as this might get called outside an update
		managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, math_random() > 0.5 and "ready" or "inpos") -- Ready! / I'm in position!
	end
end)

Hooks:PostHook(CopLogicAttack, "aim_allow_fire", "RR_aim_allow_fire", function(shoot, aim, data, my_data)
	if shoot and my_data.firing and not data.unit:in_slot(16) and not data.is_converted and data.char_tweak and data.char_tweak.chatter and data.char_tweak.chatter.aggressive then
		if not data.unit:base():has_tag("special") then 
			if data.unit:base():has_tag("law") and data.unit:base()._tweak_table ~= "gensec" and data.unit:base()._tweak_table ~= "security" then
				if managers.groupai:state():chk_assault_active_atm() then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "open_fire")
				else
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "contact")
				end
			end
		elseif not data.unit:base():has_tag("tank") and data.unit:base():has_tag("medic") then
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "aggressive")
		elseif data.unit:base():has_tag("shield") and (not my_data.shield_knock_cooldown or my_data.shield_knock_cooldown < data.t) then
			if tweak_data:difficulty_to_index(Global.game_settings.difficulty) >= 8 then
				data.unit:sound():play("hos_shield_indication_sound_terminator_style", nil, true)
			else
				data.unit:sound():play("shield_identification", nil, true)
			end

			my_data.shield_knock_cooldown = data.t + math_random(6, 12)
		else
			managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "contact")
		end
	end
end)

Hooks:PostHook(CopLogicAttack, "_upd_aim", "RR_upd_aim", function(data)
	local focus_enemy = data.attention_obj
	if focus_enemy and focus_enemy.is_person and AIAttentionObject.REACT_COMBAT <= data.attention_obj.reaction and not data.unit:in_slot(16) and not data.is_converted then
		if focus_enemy.is_local_player then
			local time_since_verify = data.attention_obj.verified_t and data.t - data.attention_obj.verified_t
			local e_movement_state = focus_enemy.unit:movement():current_state()

			if e_movement_state:_is_reloading() and time_since_verify and time_since_verify < 2 then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.reload then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "reload")
				end
			end
		else
			local e_anim_data = focus_enemy.unit:anim_data()
			local time_since_verify = data.attention_obj.verified_t and data.t - data.attention_obj.verified_t

			if e_anim_data.reload and time_since_verify and time_since_verify < 2 then
				if not data.unit:in_slot(16) and data.char_tweak.chatter.reload then
					managers.groupai:state():chk_say_enemy_chatter(data.unit, data.m_pos, "reload")
				end			
			end
		end
	end
end)

-- The big stuff, cops will comment on player equipment

CopLogicAttack._cop_comment_cooldown_t = {}

Hooks:PostHook(CopLogicAttack, "update", "RR_update", function(data)
	CopLogicAttack:inform_law_enforcements(data)	
end)

function CopLogicAttack:start_inform_ene_cooldown(cooldown_t, msg_type)
	local t = TimerManager:game():time()
	self._cop_comment_cooldown_t[msg_type] = self._cop_comment_cooldown_t[msg_type] or {}
	self._cop_comment_cooldown_t[msg_type]._cooldown_t = cooldown_t + t
	self._cooldown_delay_t = t + 5
end

function CopLogicAttack:ene_inform_has_cooldown_met(msg_type)
	local t = TimerManager:game():time()

	if not self._cop_comment_cooldown_t[msg_type] then
		return true
	end

	if self._cooldown_delay_t and self._cooldown_delay_t > t then
		return false
	end

	if self._cop_comment_cooldown_t[msg_type]._cooldown_t < t then
		return true
	end

	return false
end


function CopLogicAttack:_has_deployable_type(unit, deployable)
	local peer_id = managers.criminals:character_peer_id_by_unit(unit)
	if not peer_id then
		return false
	end

	local synced_deployable_equipment = managers.player:get_synced_deployable_equipment(peer_id)

	if synced_deployable_equipment then
		if not synced_deployable_equipment.deployable or synced_deployable_equipment.deployable ~= deployable then
			return false
		end

		--[[if synced_deployable_equipment.amount and synced_deployable_equipment.amount <= 0 then
			return false
		end--]]

		return true
	end

	return false
end

function CopLogicAttack:_next_to_cops(data, amount)
	local close_peers = {}
	local range = 5000
	amount = amount or 4
	for u_key, u_data in pairs(managers.enemy:all_enemies()) do
		if data.key ~= u_key then
			if u_data.unit and alive(u_data.unit) and not u_data.unit:character_damage():dead() then
				local anim_data = u_data.unit:anim_data()
				if not anim_data.surrender and not anim_data.hands_tied and not anim_data.hands_back then
					if mvector3.distance_sq(data.m_pos, u_data.m_pos) < range * range then
						table.insert(close_peers, u_data.unit)
					end
				end
			end
		end
	end
	return #close_peers >= amount
end

function CopLogicAttack:inform_law_enforcements(data)
	if managers.groupai:state()._special_unit_types[data.unit:base()._tweak_table] then
		return
	end
	
	if data.unit:in_slot(16) or not data.char_tweak.chatter then
		return
	end

	local enemy_target = data.attention_obj
	if not enemy_target or not enemy_target.verified or enemy_target.dis > 100000 or not data.unit or self:_next_to_cops(data) then
		return
	end

	local sound_name, cooldown_t, msg_type

	if enemy_target.is_deployable then
		msg_type = "sentry_detected"
		sound_name = "ch2" -- Every voiceset except l5n (unused)
		cooldown_t = 30
	elseif enemy_target.unit:in_slot(managers.slot:get_mask("all_criminals")) then
		local weapon = enemy_target.unit.inventory and enemy_target.unit:inventory():equipped_unit()
		if weapon and weapon:base():is_category("saw") then
			msg_type = "saw_maniac"
			sound_name = "ch4" -- Every voiceset except l5n (unused)
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "doctor_bag") then
			msg_type = "doc_bag"
			sound_name = "med" -- Why do only l2n, l3n and l4n have this line :/
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "first_aid_kit") then
			msg_type = "first_aid_kit"
			sound_name = "med" -- Why do only l2n, l3n and l4n have this line :/
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "ammo_bag") then
			msg_type = "ammo_bag"
			sound_name = "amm" -- All lxn voicesets 
			cooldown_t = 30
		elseif self:_has_deployable_type(enemy_target.unit, "trip_mine") then
			msg_type = "trip_mine"
			sound_name = "ch1" -- Every voiceset except l5n (unused)
			cooldown_t = 30
		end
	end

	if msg_type and self:ene_inform_has_cooldown_met(msg_type) then
		data.unit:sound():say(sound_name, true)
		self:start_inform_ene_cooldown(cooldown_t, msg_type)
	end
end
