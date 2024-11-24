CopBrain._NET_EVENTS = {
	stopped_seeing_client_peaceful = 11,
	detected_client_peaceful_verified = 10,
	detected_client_peaceful = 9,
	client_no_longer_verified = 8,
	detected_suspected_client = 7,
	stopped_suspecting_client = 6,
	suspecting_client_verified = 5,
	suspecting_client = 4,
	detected_client = 3,
	stopped_seeing_client = 2,
	seeing_client = 1
}

function CopBrain:sync_net_event(event_id, peer)
	local peer_id = peer:id()
	local peer_unit = managers.criminals:character_unit_by_peer_id(peer_id)

	if not peer_unit then
		return
	end

	if event_id == self._NET_EVENTS.seeing_client then
		managers.groupai:state():on_criminal_suspicion_progress(peer_unit, self._unit, 1, peer_id)
	elseif event_id == self._NET_EVENTS.stopped_seeing_client then
		managers.groupai:state():on_criminal_suspicion_progress(peer_unit, self._unit, false, peer_id)
	elseif event_id == self._NET_EVENTS.detected_client then
		managers.groupai:state():on_criminal_suspicion_progress(peer_unit, self._unit, true, peer_id)

		self._unit:movement():set_cool(false, managers.groupai:state().analyse_giveaway(self._unit:base()._tweak_table, peer_unit))

		local att_obj_data = CopLogicBase.identify_attention_obj_instant(self._logic_data, peer_unit:key())

		if att_obj_data and att_obj_data.criminal_record then
			managers.groupai:state():criminal_spotted(peer_unit)
		end
	elseif event_id == self._NET_EVENTS.detected_client_peaceful or event_id == self._NET_EVENTS.detected_client_peaceful_verified then
		local t = self._logic_data.t
		local att_u_key = peer_unit:key()
		local att_obj_data = self._logic_data.detected_attention_objects[att_u_key]

		if att_obj_data then
			if not att_obj_data.client_peaceful_detection then
				mvector3.set(att_obj_data.verified_pos, att_obj_data.m_head_pos)

				att_obj_data.verified_dis = mvector3.distance(self._unit:movement():m_head_pos(), att_obj_data.m_head_pos)

				if not att_obj_data.identified then
					att_obj_data.identified = true
					att_obj_data.identified_t = t
					att_obj_data.notice_progress = nil
					att_obj_data.prev_notice_chk_t = nil
				elseif att_obj_data.uncover_progress then
					att_obj_data.uncover_progress = nil
				end
			end
		else
			local attention_info = managers.groupai:state():get_AI_attention_objects_by_filter(self._logic_data.SO_access_str)[att_u_key]

			if attention_info then
				local settings = attention_info.handler:get_attention(self._logic_data.SO_access, nil, nil, self._logic_data.team)

				if settings then
					att_obj_data = CopLogicBase._create_detected_attention_object_data(t, self._unit, att_u_key, attention_info, settings)
					att_obj_data.identified = true
					att_obj_data.identified_t = t
					att_obj_data.notice_progress = nil
					att_obj_data.prev_notice_chk_t = nil

					self._logic_data.detected_attention_objects[att_u_key] = att_obj_data
				end
			end
		end

		if att_obj_data then
			att_obj_data.client_peaceful_detection = true

			if event_id == self._NET_EVENTS.detected_client_peaceful_verified then
				att_obj_data.verified = true
			end
		end
	elseif event_id == self._NET_EVENTS.suspecting_client or event_id == self._NET_EVENTS.suspecting_client_verified then
		local t = self._logic_data.t
		local att_u_key = peer_unit:key()
		local att_obj_data = self._logic_data.detected_attention_objects[att_u_key]

		if att_obj_data then
			if not att_obj_data.client_casing_suspicion then
				mvector3.set(att_obj_data.verified_pos, att_obj_data.m_head_pos)

				att_obj_data.verified_dis = mvector3.distance(self._unit:movement():m_head_pos(), att_obj_data.m_head_pos)

				if not att_obj_data.identified then
					att_obj_data.identified = true
					att_obj_data.identified_t = t
					att_obj_data.notice_progress = nil
					att_obj_data.prev_notice_chk_t = nil
				elseif att_obj_data.uncover_progress then
					att_obj_data.uncover_progress = nil
				end
			end
		else
			local attention_info = managers.groupai:state():get_AI_attention_objects_by_filter(self._logic_data.SO_access_str)[att_u_key]

			if attention_info then
				local settings = attention_info.handler:get_attention(self._logic_data.SO_access, nil, nil, self._logic_data.team)

				if settings then
					att_obj_data = CopLogicBase._create_detected_attention_object_data(t, self._unit, att_u_key, attention_info, settings)
					att_obj_data.identified = true
					att_obj_data.identified_t = t
					att_obj_data.notice_progress = nil
					att_obj_data.prev_notice_chk_t = nil

					self._logic_data.detected_attention_objects[att_u_key] = att_obj_data
				end
			end
		end

		if att_obj_data then
			if not att_obj_data.client_casing_suspicion then
				att_obj_data.client_casing_suspicion = true

				managers.groupai:state():on_criminal_suspicion_progress(peer_unit, self._unit, 1, peer_id)
			end

			if event_id == self._NET_EVENTS.suspecting_client_verified then
				att_obj_data.verified = true
			end
		end
	elseif event_id == self._NET_EVENTS.client_no_longer_verified then
		local att_obj_data = self._logic_data.detected_attention_objects[peer_unit:key()]

		if att_obj_data then
			att_obj_data.verified = nil
		end
	elseif event_id == self._NET_EVENTS.stopped_suspecting_client or event_id == self._NET_EVENTS.stopped_seeing_client_peaceful then
		if event_id == self._NET_EVENTS.stopped_suspecting_client then
			managers.groupai:state():on_criminal_suspicion_progress(peer_unit, self._unit, false, peer_id)
		end

		local att_obj_data = self._logic_data.detected_attention_objects[peer_unit:key()]

		if att_obj_data then
			att_obj_data.handler:remove_listener("detect_" .. tostring(self._logic_data.key))

			self._logic_data.detected_attention_objects[peer_unit:key()] = nil

			local my_data = self._logic_data.internal_data

			if self._logic_data.attention_obj and self._logic_data.attention_obj.u_key == peer_unit:key() then
				CopLogicBase._set_attention_obj(self._logic_data, nil, nil)

				if my_data then
					if my_data.firing or my_data.firing_on_client then
						self._unit:movement():set_allow_fire(false)

						my_data.firing = nil
						my_data.firing_on_client = nil
					end
				end
			end

			if my_data and my_data.arrest_targets then
				my_data.arrest_targets[peer_unit:key()] = nil
			end

			local set_attention = self._unit:movement():attention()

			if set_attention and set_attention.u_key == peer_unit:key() then
				self._unit:movement():set_attention()
			end
		end
	elseif event_id == self._NET_EVENTS.detected_suspected_client then
		managers.groupai:state():on_criminal_suspicion_progress(peer_unit, self._unit, true, peer_id)

		local att_obj_data = self._logic_data.detected_attention_objects[peer_unit:key()]

		if att_obj_data then
			att_obj_data.client_casing_suspicion = nil
			att_obj_data.client_casing_detected = true
		end
	end
end

local logic_variants = CopBrain._logic_variants
local security_variant = logic_variants.security

logic_variants.dave = security_variant
logic_variants.cop_civ = security_variant
logic_variants.cop_forest = security_variant
logic_variants.gensec_guard = security_variant
logic_variants.fbi_female = security_variant
logic_variants.hrt = security_variant
logic_variants.fbi_swat_vet = security_variant
logic_variants.city_swat_guard = security_variant
logic_variants.city_swat_titan_assault = security_variant
logic_variants.skeleton_swat_titan = security_variant
logic_variants.weekend = security_variant
logic_variants.weekend_guard = security_variant
logic_variants.weekend_elite_guard = security_variant
logic_variants.boom_summers = security_variant
logic_variants.taser_summers = clone(security_variant)
logic_variants.taser_summers.attack = TaserLogicAttack
logic_variants.medic_summers = security_variant
logic_variants.fbi_vet = security_variant
logic_variants.spooc_gangster = clone(security_variant)
logic_variants.spooc_gangster.idle = SpoocLogicIdle
logic_variants.spooc_gangster.attack = SpoocLogicAttack	
logic_variants.fbi_vet_boss = security_variant
logic_variants.vetlod = security_variant	
logic_variants.meme_man = security_variant	
logic_variants.meme_man_shield = clone(security_variant)
logic_variants.meme_man_shield.attack = ShieldLogicAttack
logic_variants.meme_man_shield.intimidated = nil
logic_variants.meme_man_shield.flee = nil	
logic_variants.spring = clone(security_variant)
logic_variants.spring.attack = TankCopLogicAttack
logic_variants.enforcer = clone(security_variant)
logic_variants.enforcer.attack = TankCopLogicAttack
logic_variants.enforcer_assault = clone(security_variant)
logic_variants.enforcer_assault.attack = TankCopLogicAttack	
logic_variants.headless_hatman = clone(security_variant)
logic_variants.headless_hatman.attack = TankCopLogicAttack	
logic_variants.summers = clone(security_variant)
logic_variants.tank_hw_black = clone(security_variant)
logic_variants.tank_hw_black.attack = TankCopLogicAttack	
logic_variants.tank_titan = clone(security_variant)
logic_variants.tank_titan.attack = TankCopLogicAttack
logic_variants.tank_titan_assault = clone(security_variant)
logic_variants.tank_titan_assault.attack = TankCopLogicAttack
logic_variants.spring.phalanx = CopLogicPhalanxVip
logic_variants.headless_hatman.phalanx = CopLogicPhalanxVip
logic_variants.tank_biker = clone(security_variant)
logic_variants.tank_biker.attack = TankCopLogicAttack
logic_variants.tank_black = clone(security_variant)
logic_variants.tank_black.attack = TankCopLogicAttack
logic_variants.tank_skull = clone(security_variant)
logic_variants.tank_skull.attack = TankCopLogicAttack
logic_variants.biker_guard = security_variant
logic_variants.phalanx_vip_break = security_variant
logic_variants.phalanx_minion_assault = clone(security_variant)
logic_variants.phalanx_minion_assault.attack = ShieldLogicAttack
logic_variants.phalanx_minion_assault.intimidated = nil
logic_variants.phalanx_minion_assault.flee = nil
logic_variants.spooc_titan = clone(security_variant)
logic_variants.spooc_titan.idle = SpoocLogicIdle
logic_variants.spooc_titan.attack = SpoocLogicAttack
logic_variants.taser_titan = clone(security_variant)
logic_variants.autumn = clone(security_variant)	
logic_variants.boom_titan = clone(security_variant)

logic_variants.heavy_swat_sniper = clone(security_variant)
logic_variants.heavy_swat_sniper.attack = MarshalLogicAttack
logic_variants.heavy_swat_sniper_scripted = clone(security_variant)
logic_variants.marshal_marksman_scripted = clone(security_variant)
logic_variants.weekend_dmr = clone(security_variant)
logic_variants.weekend_dmr.attack = MarshalLogicAttack
logic_variants.weekend_dmr_scripted = clone(security_variant)
logic_variants.boom = clone(security_variant)
logic_variants.boom.attack = MarshalLogicAttack
logic_variants.hrt_titan = clone(security_variant)
logic_variants.hrt_titan.attack = MarshalLogicAttack	
logic_variants.omnia_lpf = clone(security_variant)
logic_variants.omnia_lpf.attack = MarshalLogicAttack	
logic_variants.omnia_lpf_no_heal = clone(security_variant)
logic_variants.omnia_lpf_no_heal.attack = MarshalLogicAttack		
logic_variants.city_swat_titan = clone(security_variant)
logic_variants.city_swat_titan.attack = MarshalLogicAttack
logic_variants.weekend_lmg = clone(security_variant)
logic_variants.weekend_lmg.attack = MarshalLogicAttack		
logic_variants.taser_titan_reaper = clone(security_variant)
logic_variants.taser_titan_reaper.attack = MarshalLogicAttack			

--Set up boss logics
logic_variants.mobster_boss = logic_variants.triad_boss
logic_variants.chavez_boss = logic_variants.triad_boss
logic_variants.hector_boss = logic_variants.triad_boss
logic_variants.drug_lord_boss = logic_variants.triad_boss
logic_variants.biker_boss = logic_variants.triad_boss

-- Update immediately once we have our pathing results instead of waiting for the next update
-- Not posthooking _add_pathing_result instead of these two just in case the path gets modified before navlink delays are applied in clbk_pathing_results
Hooks:PostHook(CopBrain, "clbk_pathing_results", "res_clbk_pathing_results", function(self, search_id, path)
	if path and self._current_logic.on_pathing_results then
		self._current_logic.on_pathing_results(self._logic_data)
	end
end)

Hooks:PostHook(CopBrain, "clbk_coarse_pathing_results", "res_clbk_coarse_pathing_results", function(self, search_id, path)
	if path and self._current_logic.on_pathing_results then
		self._current_logic.on_pathing_results(self._logic_data)
	end
end)

function CopBrain:on_nav_link_unregistered(element_id)
	if self._logic_data.pathing_results then
		local failed_search_ids = nil

		for path_name, path in pairs(self._logic_data.pathing_results) do
			if type(path) == "table" and path[1] and type(path[1]) ~= "table" then
				for i, nav_point in ipairs(path) do
					if not nav_point.x and nav_point.script_data and nav_point:script_data().element._id == element_id then
						failed_search_ids = failed_search_ids or {}
						failed_search_ids[path_name] = true

						break
					end
				end
			end
		end

		if failed_search_ids then
			for search_id, _ in pairs(failed_search_ids) do
				self._logic_data.pathing_results[search_id] = "failed"
			end
		end
	end

	local paths = self._current_logic._get_all_paths and self._current_logic._get_all_paths(self._logic_data)

	if not paths then
		return
	end

	local verified_paths = {}

	for path_name, path in pairs(paths) do
		local path_is_ok = true

		for i, nav_point in ipairs(path) do
			if not nav_point.x and nav_point.script_data and nav_point:script_data().element._id == element_id then
				path_is_ok = false

				break
			end
		end

		if path_is_ok then
			verified_paths[path_name] = path
		end
	end

	self._current_logic._set_verified_paths(self._logic_data, verified_paths)
end

function CopBrain:convert_to_criminal(mastermind_criminal)
	if self._logic_data.internal_data and self._logic_data.internal_data.coarse_path then
		self._logic_data.internal_data.coarse_path = nil
	end
	
	if self._alert_listen_key then
		managers.groupai:state():remove_alert_listener(self._alert_listen_key)
	else
		self._alert_listen_key = "CopBrain" .. tostring(self._unit:key())
	end

	local alert_listen_filter = managers.groupai:state():get_unit_type_filter("combatant")
	local alert_types = {
		explosion = true,
		fire = true,
		aggression = true,
		bullet = true
	}

	managers.groupai:state():add_alert_listener(self._alert_listen_key, callback(self, self, "on_alert"), alert_listen_filter, alert_types, self._unit:movement():m_head_pos())

	self._logic_data.is_converted = true
	self._unit:unit_data().is_convert = true
	
	--Ugly hack to be able to call converts
	--Kill me now
	if not SC._converts then
		SC._converts = {}
	end   
	table.insert(SC._converts, self._unit)	
	self._logic_data.group = nil
	local mover_col_body = self._unit:body("mover_blocker")

	mover_col_body:set_enabled(false)

	local attention_preset = PlayerMovement._create_attention_setting_from_descriptor(self, tweak_data.attention.settings.team_enemy_cbt, "team_enemy_cbt")

	self._attention_handler:override_attention("enemy_team_cbt", attention_preset)

	local health_multiplier = 1
	local damage_multiplier = 1

	if alive(mastermind_criminal) then
		--mastermind_criminal:sound():say("v21", false)
		health_multiplier = health_multiplier * (mastermind_criminal:base():upgrade_value("player", "convert_enemies_health_multiplier") or 1)
		health_multiplier = health_multiplier * (mastermind_criminal:base():upgrade_value("player", "passive_convert_enemies_health_multiplier") or 1)
		damage_multiplier = damage_multiplier * (mastermind_criminal:base():upgrade_value("player", "convert_enemies_damage_multiplier") or 1)
		damage_multiplier = damage_multiplier * (mastermind_criminal:base():upgrade_value("player", "passive_convert_enemies_damage_multiplier") or 1)
	else
		--managers.player:speak("v21", false, nil)
		health_multiplier = health_multiplier * managers.player:upgrade_value("player", "convert_enemies_health_multiplier", 1)
		health_multiplier = health_multiplier * managers.player:upgrade_value("player", "passive_convert_enemies_health_multiplier", 1)
		damage_multiplier = damage_multiplier * managers.player:upgrade_value("player", "convert_enemies_damage_multiplier", 1)
		damage_multiplier = damage_multiplier * managers.player:upgrade_value("player", "passive_convert_enemies_damage_multiplier", 1)
	end
	
	

	self._unit:character_damage():convert_to_criminal(health_multiplier)

	self._logic_data.attention_obj = nil

	CopLogicBase._destroy_all_detected_attention_object_data(self._logic_data)

	self._SO_access = managers.navigation:convert_access_flag(tweak_data.character.russian.access)
	self._logic_data.SO_access = self._SO_access
	self._logic_data.SO_access_str = tweak_data.character.russian.access
	self._slotmask_enemies = managers.slot:get_mask("enemies")
	self._logic_data.enemy_slotmask = self._slotmask_enemies
	local equipped_w_selection = self._unit:inventory():equipped_selection()

	if equipped_w_selection then
		self._unit:inventory():remove_selection(equipped_w_selection, true)
	end
	
	World:effect_manager():spawn({
		effect = Idstring("effects/payday2/particles/impacts/money_impact_pd2"),
		position = self._unit:movement():m_pos()
	})
	

	local weap_name = self._unit:base():default_weapon_name()

	TeamAIInventory.add_unit_by_name(self._unit:inventory(), weap_name, true)

	local weapon_unit = self._unit:inventory():equipped_unit()

	weapon_unit:base():add_damage_multiplier(damage_multiplier)
	self:set_objective(nil)
	self:set_logic("idle", nil)

	self._logic_data.objective_complete_clbk = callback(managers.groupai:state(), managers.groupai:state(), "on_criminal_objective_complete")
	self._logic_data.objective_failed_clbk = callback(managers.groupai:state(), managers.groupai:state(), "on_criminal_objective_failed")

	managers.groupai:state():on_criminal_jobless(self._unit)
	self._unit:base():set_slot(self._unit, 16)
	self._unit:movement():set_stance("hos")

	local action_data = {
		variant = "stand",
		body_part = 1,
		type = "act"
	}

	self._unit:brain():action_request(action_data)
	self._unit:sound():say("cn1", true, nil)
	managers.network:session():send_to_peers_synched("sync_unit_converted", self._unit)
end

function CopBrain:on_suppressed(state)
	self._logic_data.is_suppressed = state or nil

	if self._current_logic.on_suppressed_state then
		self._current_logic.on_suppressed_state(self._logic_data)

		if self._logic_data.char_tweak.chatter.suppress then 
			if managers.groupai:state():chk_assault_active_atm()then
			local roll = math.rand(1, 100)
			local chance_heeeeelpp = 50
				if roll <= chance_heeeeelpp then
					self._unit:sound():say("hlp", true) 
					--log(" assault panic works")
				else --hopefully some variety here now
					self._unit:sound():say("lk3a", true) 
					--log(" assault panic works")
				end	
			else		
			   self._unit:sound():say("lk3b", true) --calmer lines for when the assault is off
			   --log("between assault panic works")
			end
		end
	end
end
	
function CopBrain:on_alarm_pager_interaction(status, player)
	if not managers.groupai:state():whisper_mode() then
		return
	end

	local is_dead = self._unit:character_damage():dead()
	local pager_data = self._alarm_pager_data

	if not pager_data then
		return
	end
	
	local vanilla_behavior = managers.mutators:modify_value("CopBrain:VanillaPoliceCall", false)

	if status == "started" then
		self._unit:sound():stop()
		self._unit:interaction():set_outline_flash_state(nil, true)

		if pager_data.pager_clbk_id then
			managers.enemy:remove_delayed_clbk(pager_data.pager_clbk_id)

			pager_data.pager_clbk_id = nil
		end
	elseif status == "complete" then
		local nr_previous_bluffs = managers.groupai:state():get_nr_successful_alarm_pager_bluffs()
		local has_upgrade = nil

		if player:base().is_local_player then
			has_upgrade = managers.player:has_category_upgrade("player", "corpse_alarm_pager_bluff")
		else
			has_upgrade = player:base():upgrade_value("player", "corpse_alarm_pager_bluff")
		end

		local chance_table = tweak_data.player.alarm_pager[has_upgrade and "bluff_success_chance_w_skill" or "bluff_success_chance"]
		local chance_index = math.min(nr_previous_bluffs + 1, #chance_table)
		local is_last = chance_table[math.min(chance_index + 1, #chance_table)] == 0
		local rand_nr = math.random()
		local success = chance_table[chance_index] > 0 and rand_nr < chance_table[chance_index]

		self._unit:sound():stop()

		if success then
			managers.groupai:state():on_successful_alarm_pager_bluff()

			local cue_index = is_last and 4 or 1

			if is_dead then
				self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_fooled_" .. tostring(cue_index)), nil, true)
			else
				self._unit:sound():play(self:_get_radio_id("dsp_radio_fooled_" .. tostring(cue_index)), nil, true)
			end
			
			if is_last then
				-- Nothing
			end
		else
			self._unit:interaction():set_active(false, true)
			
			if not vanilla_behavior then			
				--Unconvincing pager response
				managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.15
				managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
				managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
				managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.15
				managers.groupai:state():_delay_whisper_suspicion_mul_decay()
			else
				managers.groupai:state():on_police_called("alarm_pager_bluff_failed")
			end

			if is_dead then
				self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_fooled_4"), nil, true)
			else
				self._unit:sound():play(self:_get_radio_id("dsp_radio_fooled_4"), nil, true)
			end
		end

		self:end_alarm_pager()
		managers.mission:call_global_event("player_answer_pager")

		if not self:_chk_enable_bodybag_interaction() then
			self._unit:interaction():set_active(false, true)
		end
	elseif status == "interrupted" then
		if not vanilla_behavior then
			--Suspicion Increase from an interrupted pager
			managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.2
			managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
			managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
			managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.2
			managers.groupai:state():_delay_whisper_suspicion_mul_decay()
		else
			managers.groupai:state():on_police_called("alarm_pager_hang_up")
		end
		
		--Tutorial Heists will sound an alarm to prevent a soft lock
		local job = Global.level_data and Global.level_data.level_id
		
		if job == "short1_stage1" or job == "short1_stage2" then 
			managers.groupai:state():on_police_called("sys_police_alerted")
			managers.groupai:state():set_point_of_no_return_timer(10, 0)
		end			
		
		self._unit:interaction():set_active(false, true)
		self._unit:sound():stop()

		if is_dead then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		end
		
		self._unit:interaction():set_tweak_data("corpse_dispose")
		self._unit:interaction():set_active(true, true)						

		self:end_alarm_pager()
	end
end	

function CopBrain:clbk_alarm_pager(ignore_this, data)
	local pager_data = self._alarm_pager_data
	local clbk_id = pager_data.pager_clbk_id
	pager_data.pager_clbk_id = nil

	if not managers.groupai:state():whisper_mode() then
		self:end_alarm_pager()

		return
	end

	if pager_data.nr_calls_made == 0 then
		if managers.groupai:state():is_ecm_jammer_active("pager") then
			self:end_alarm_pager()
			self:begin_alarm_pager(true)

			return
		end

		self._unit:sound():stop()

		if self._unit:character_damage():dead() then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_query_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_query_1"), nil, true)
		end

		self._unit:interaction():set_tweak_data("corpse_alarm_pager")
		self._unit:interaction():set_active(true, true)
	elseif pager_data.nr_calls_made < pager_data.total_nr_calls then
		self._unit:sound():stop()

		if self._unit:character_damage():dead() then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		end
	elseif pager_data.nr_calls_made == pager_data.total_nr_calls then
		self._unit:interaction():set_active(false, true)
		
		if is_dead then
			self._unit:sound():corpse_play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		else
			self._unit:sound():play(self:_get_radio_id("dsp_radio_reminder_1"), nil, true)
		end			

		local vanilla_behavior = managers.mutators:modify_value("CopBrain:VanillaPoliceCall", false)
		if not vanilla_behavior then
			--Suspicion Increase from a dropped pager
			managers.groupai:state()._old_guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw + 0.2
			managers.groupai:state()._guard_detection_mul_raw = managers.groupai:state()._old_guard_detection_mul_raw
			managers.groupai:state()._decay_target = managers.groupai:state()._old_guard_detection_mul_raw * 0.75
			managers.groupai:state()._guard_delay_deduction = managers.groupai:state()._guard_delay_deduction + 0.2
			managers.groupai:state():_delay_whisper_suspicion_mul_decay()	
		else
			managers.groupai:state():on_police_called("alarm_pager_not_answered")
		end

		--Tutorial Heists will sound an alarm to prevent a soft lock
		local job = Global.level_data and Global.level_data.level_id
		
		if job == "short1_stage1" or job == "short1_stage2" then 
			managers.groupai:state():on_police_called("sys_police_alerted")
			managers.groupai:state():set_point_of_no_return_timer(10, 0)
		end

		self._unit:sound():stop()

		self:end_alarm_pager()
		
		self._unit:interaction():set_tweak_data("corpse_dispose")
		self._unit:interaction():set_active(true, true)			
	end

	if pager_data.nr_calls_made == pager_data.total_nr_calls - 1 then
		self._unit:interaction():set_outline_flash_state(true, true)
	end

	pager_data.nr_calls_made = pager_data.nr_calls_made + 1

	if pager_data.nr_calls_made <= pager_data.total_nr_calls then
		local duration_settings = tweak_data.player.alarm_pager.call_duration[math.min(#tweak_data.player.alarm_pager.call_duration, pager_data.nr_calls_made)]
		local call_delay = math.lerp(duration_settings[1], duration_settings[2], math.random())
		self._alarm_pager_data.pager_clbk_id = clbk_id

		managers.enemy:add_delayed_clbk(self._alarm_pager_data.pager_clbk_id, callback(self, self, "clbk_alarm_pager"), TimerManager:game():time() + call_delay)
	end
end

--Fix dodge with grenade cooldown not having a cooldown as intended.
function CopBrain:_chk_use_cover_grenade(unit)
	if not Network:is_server() or not self._logic_data.char_tweak.dodge_with_grenade or not self._logic_data.attention_obj then
		return
	end

	local check_f = self._logic_data.char_tweak.dodge_with_grenade.check
	local t = TimerManager:game():time()

	if check_f then
		if (self._next_cover_grenade_chk_t or 0) > t then
			return
		end

		local result, next_t = check_f(t, self._nr_flashbang_covers_used or 0)
		self._next_cover_grenade_chk_t = next_t

		if not result then
			return
		end
	end

	local grenade_was_used = nil

	if self._logic_data.attention_obj.dis > 1000 or not self._logic_data.char_tweak.dodge_with_grenade.flash then
		if self._logic_data.char_tweak.dodge_with_grenade.smoke and not managers.groupai:state():is_smoke_grenade_active() then
			local duration = self._logic_data.char_tweak.dodge_with_grenade.smoke.duration

			managers.groupai:state():detonate_smoke_grenade(self._logic_data.m_pos + math.UP * 10, self._unit:movement():m_head_pos(), math.lerp(duration[1], duration[2], math.random()), false)

			grenade_was_used = true
		end
	elseif self._logic_data.char_tweak.dodge_with_grenade.flash then
		local duration = self._logic_data.char_tweak.dodge_with_grenade.flash.duration

		managers.groupai:state():detonate_smoke_grenade(self._logic_data.m_pos + math.UP * 10, self._unit:movement():m_head_pos(), math.lerp(duration[1], duration[2], math.random()), true)

		grenade_was_used = true
	end

	if grenade_was_used then
		self._nr_flashbang_covers_used = (self._nr_flashbang_covers_used or 0) + 1
	end
end

-- Don't trigger damage callback from poison damage as it would make enemies go into shoot action
-- when they stand inside a poison cloud, regardless of any targets being visible or not
local clbk_damage_original = CopBrain.clbk_damage
function CopBrain:clbk_damage(my_unit, damage_info, ...)
	return damage_info.variant ~= "poison" and clbk_damage_original(self, my_unit, damage_info, ...)
end