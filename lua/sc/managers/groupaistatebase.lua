local mvec3_dot = mvector3.dot
local mvec3_set = mvector3.set
local mvec3_sub = mvector3.subtract
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_dir = mvector3.direction
local mvec3_l_sq = mvector3.length_sq
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

local sc_group_misc_data = GroupAIStateBase._init_misc_data
function GroupAIStateBase:_init_misc_data()
	sc_group_misc_data(self)
	self._ponr_is_on = nil
	self._decay_target = 1
	self._min_detection_threshold = 1
	self._old_guard_detection_mul = 1
	self._guard_detection_mul = 1
	self._guard_detection_mul_raw = 0
	self._old_guard_detection_mul_raw = 0
	self._played_stealth_warning = 0
	self._guard_delay_deduction = 0		
	self._special_unit_types = {
		tank = true,
		spooc = true,
		shield = true,
		taser = true,
		boom = true,
		boom_summers = true,
		taser_summers = true,
		medic_summers = true,
		medic = true,
		omnia_LPF = true,
		phalanx_vip = true,
		spring = true,
		summers = true,
		autumn = true
	}
	
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if diff_index <= 2 then
		self._weapons_hot_threshold = 0.90
		self._suspicion_threshold = 0.6
	elseif diff_index == 3 then
		self._weapons_hot_threshold = 0.80
		self._suspicion_threshold = 0.65
	elseif diff_index == 4 then
		self._weapons_hot_threshold = 0.70
		self._suspicion_threshold = 0.7
	elseif diff_index == 5 then
		self._weapons_hot_threshold = 0.60
		self._suspicion_threshold = 0.75
	elseif diff_index == 6 then
		self._weapons_hot_threshold = 0.50
		self._suspicion_threshold = 0.8
	elseif diff_index == 7 then
		self._weapons_hot_threshold = 0.40
		self._suspicion_threshold = 0.85
	else
		self._weapons_hot_threshold = 0.30
		self._suspicion_threshold = 0.9
	end
	
end

local sc_group_base = GroupAIStateBase.on_simulation_started
function GroupAIStateBase:on_simulation_started()
	sc_group_base(self)
	self._ponr_is_on = nil
	self._min_detection_threshold = 1
	self._old_guard_detection_mul = 1
	self._guard_detection_mul = 1
	self._guard_detection_mul_raw = 0
	self._old_guard_detection_mul_raw = 0
	self._guard_delay_deduction = 0
	self._played_stealth_warning = 0
	self._special_unit_types = {
		tank = true,
		spooc = true,
		shield = true,
		taser = true,
		boom = true,
		boom_summers = true,
		taser_summers = true,
		medic_summers = true,
		medic = true,
		omnia_LPF = true,
		phalanx_vip = true,
		spring = true,
		summers = true,
		autumn = true
	}
	
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if diff_index <= 2 then
		self._weapons_hot_threshold = 0.90
		self._suspicion_threshold = 0.6
	elseif diff_index == 3 then
		self._weapons_hot_threshold = 0.80
		self._suspicion_threshold = 0.65
	elseif diff_index == 4 then
		self._weapons_hot_threshold = 0.70
		self._suspicion_threshold = 0.7
	elseif diff_index == 5 then
		self._weapons_hot_threshold = 0.60
		self._suspicion_threshold = 0.75
	elseif diff_index == 6 then
		self._weapons_hot_threshold = 0.50
		self._suspicion_threshold = 0.8
	elseif diff_index == 7 then
		self._weapons_hot_threshold = 0.40
		self._suspicion_threshold = 0.85
	else
		self._weapons_hot_threshold = 0.30
		self._suspicion_threshold = 0.9
	end
	
end

function GroupAIStateBase:chk_guard_detection_mul()
	self._guard_detection_mul = 1 + self._guard_detection_mul_raw
	if self._hostages_killed then
		return self._guard_detection_mul * (self._hostages_killed + 1)
	else
		return self._guard_detection_mul * 1
	end
end

function GroupAIStateBase:chk_guard_delay_deduction()
	if self._hostages_killed then
		return self._guard_delay_deduction * (self._hostages_killed * 0.25)
	else
		return self._guard_delay_deduction * 1
	end
end	

function GroupAIStateBase:set_point_of_no_return_timer(time, point_of_no_return_id)
	if time == nil or setup:has_queued_exec() then
		return
	end

	self._forbid_drop_in = true
	self._ponr_is_on = true
	
	managers.network.matchmake:set_server_joinable(false)

	if not self._peers_inside_point_of_no_return then
		self._peers_inside_point_of_no_return = {}
	end

	self._point_of_no_return_timer = time
	self._point_of_no_return_id = point_of_no_return_id
	self._point_of_no_return_areas = nil

	managers.hud:show_point_of_no_return_timer()
	managers.hud:add_updator("point_of_no_return", callback(self, self, "_update_point_of_no_return"))
end

local old_update_point_of_no_return = GroupAIStateBase._update_point_of_no_return

function GroupAIStateBase:_update_point_of_no_return(t, dt)
	local get_mission_script_element = function(id)
		for name, script in pairs(managers.mission:scripts()) do
			if script:element(id) then
				return script:element(id)
			end
		end
	end
	
		
	if not self._point_of_no_return_id or not get_mission_script_element(self._point_of_no_return_id) then
	
		local prev_time = self._point_of_no_return_timer
		self._point_of_no_return_timer = self._point_of_no_return_timer - dt
		local sec = math.floor(self._point_of_no_return_timer)

		if sec < math.floor(prev_time) then
			managers.hud:flash_point_of_no_return_timer(sec <= 10)
		end
			
		if self._point_of_no_return_timer <= 0 then
			managers.network:session():send_to_peers("mission_ended", false, 0)
			game_state_machine:change_state_by_name("gameoverscreen")
		else
			managers.hud:feed_point_of_no_return_timer(self._point_of_no_return_timer)
		end
	else
		old_update_point_of_no_return(self, t, dt)
	end
end
		
function GroupAIStateBase:_radio_chatter_clbk()
	if self._ai_enabled and not self:whisper_mode() then
		local optimal_dist = 500
		local best_dist, best_cop, radio_msg = nil

		for _, c_record in pairs(self._player_criminals) do
			for i, e_key in ipairs(c_record.important_enemies) do
				local cop = self._police[e_key]
				local use_radio = cop.char_tweak.use_radio

				if use_radio then
					if cop.char_tweak.radio_prefix then
						use_radio = cop.char_tweak.radio_prefix .. use_radio
					end

					local dist = math.abs(mvector3.distance(cop.m_pos, c_record.m_pos))

					if not best_dist or dist < best_dist then
						best_dist = dist
						best_cop = cop
						radio_msg = use_radio
					end
				end
			end
		end

		if best_cop then
			best_cop.unit:sound():play(radio_msg, nil, true)
		end
	end

	self._radio_clbk = callback(self, self, "_radio_chatter_clbk")

	managers.enemy:add_delayed_clbk("_radio_chatter_clbk", self._radio_clbk, Application:time() + 30 + math.random(0, 20))
end	

function GroupAIStateBase:_draw_current_logics()
	for key, data in pairs(self._police) do
		if data.unit:brain() and data.unit:brain().is_current_logic then
			local brain = data.unit:brain()
			
			if brain:is_current_logic("arrest") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.blue:with_alpha(1), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("attack") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.red:with_alpha(1), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("base") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.white:with_alpha(0.5), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("flee") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.orange:with_alpha(0.5), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("guard") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.blue:with_alpha(0.1), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("idle") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.green:with_alpha(0.5), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("inactive") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.black:with_alpha(0.5), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("intimidated") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.black:with_alpha(0.5), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("sniper") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.red:with_alpha(0.1), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			elseif brain:is_current_logic("travel") then
				local draw_duration = 0.1
				local new_brush = Draw:brush(Color.yellow:with_alpha(0.5), draw_duration)
				new_brush:sphere(data.unit:movement():m_head_pos(), 20)
			end
		end
	end
end

function GroupAIStateBase:find_followers_to_unit(leader_key, leader_data)
	local leader_u_data = self._police[leader_key]
	if not leader_u_data then
		return
	end
	leader_u_data.followers = leader_u_data.followers or {}
	local followers = leader_u_data.followers
	local nr_followers = #followers
	local max_nr_followers = leader_data.max_nr_followers
	if nr_followers >= max_nr_followers then
		return
	end
	local wanted_nr_new_followers = max_nr_followers - nr_followers
	local leader_unit = leader_u_data.unit
	local leader_nav_seg = leader_u_data.tracker:nav_segment()
	local objective = {
		type = "follow",
		follow_unit = leader_unit,
		scan = true,
		nav_seg = leader_nav_seg,
		stance = "cbt",
		distance = 600
	}
	local candidates = {}
	for u_key, u_data in pairs(self._police) do
		if u_data.assigned_area and not u_data.follower and u_data.char_tweak.follower and u_data.tracker:nav_segment() == leader_nav_seg and u_data.unit:brain():is_available_for_assignment(objective) then
			table.insert(followers, u_key)
			u_data.follower = leader_key
			local new_follow_objective = clone(objective)
			new_follow_objective.fail_clbk = callback(self, self, "clbk_follow_objective_failed", {
				leader_u_data = leader_u_data,
				follower_unit = u_data.unit
			})
			u_data.unit:brain():set_objective(new_follow_objective)
			if #candidates == wanted_nr_new_followers then
				break
			end
		end
	end
end

function GroupAIStateBase:chk_has_followers(leader_key)
	local leader_u_data = self._police[leader_key]
	if leader_u_data and next(leader_u_data.followers) then
		return true
	end
end

function GroupAIStateBase:are_followers_ready(leader_key)
	local leader_u_data = self._police[leader_key]
	if not leader_u_data or not leader_u_data.followers then
		return true
	end
	for i, follower_key in ipairs(leader_u_data.followers) do
		local follower_u_data = self._police[follower_key]
		local objective = follower_u_data.unit:brain():objective()
		if objective and not objective.in_place then
			return
		end
	end
	return true
end

function GroupAIStateBase:clbk_follow_objective_failed(data)
	local leader_u_data = data.leader_u_data
	local follower_unit = data.follower_unit
	local follower_key = follower_unit:key()
	for i, _follower_key in ipairs(leader_u_data.followers) do
		if _follower_key == follower_key then
			table.remove(leader_u_data.followers, i)
			break
		end
	end
	local follower_u_data = self._police[follower_key]
	if follower_u_data then
		follower_u_data.follower = nil
	end
end

function GroupAIStateBase:_get_balancing_multiplier(balance_multipliers)
	local nr_players = 0
	for u_key, u_data in pairs(self:all_criminals()) do
		if not u_data.status then
			nr_players = nr_players + 1
		end
	end
	nr_players = math.clamp(nr_players, 1, 4)
	return balance_multipliers[nr_players]
end

function GroupAIStateBase:queue_smoke_grenade(id, detonate_pos, shooter_pos, duration, ignore_control, flashbang)
	self._smoke_grenades = self._smoke_grenades or {}
	local data = {
		id = id,
		detonate_pos = detonate_pos,
		shooter_pos = shooter_pos,
		duration = duration,
		ignore_control = ignore_control,
		flashbang = flashbang
	}
	self._smoke_grenades[id] = data
end

function GroupAIStateBase:detonate_world_smoke_grenade(id)
	self._smoke_grenades = self._smoke_grenades or {}

	if not self._smoke_grenades[id] then
		--Application:error("Could not detonate smoke grenade as it was not queued!", id)
		return
	end

	local job = Global.level_data and Global.level_data.level_id

	if job == "haunted" then
		self._smoke_grenades = nil --delete queue

		return
	end

	local data = self._smoke_grenades[id]

	if data.flashbang then
		if Network:is_client() then
			return
		end

		local det_pos = data.detonate_pos
		local ray_to = mvector3.copy(det_pos) + math.UP * 5

		mvector3.set_z(ray_to, ray_to.z - 50)

		local ground_ray = World:raycast("ray", det_pos, ray_to, "slot_mask", managers.slot:get_mask("world_geometry, statics"))

		if ground_ray then
			det_pos = ground_ray.hit_position
			mvector3.set_z(det_pos, det_pos.z + 3)
			data.detonate_pos = det_pos
		end

		local rotation = Rotation(math.random() * 360, 0, 0)
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local flashbang_unit = nil

		if difficulty_index == 8 then
			flashbang_unit = "units/payday2/weapons/wpn_frag_sc_flashbang/wpn_frag_sc_flashbang"
		else
			flashbang_unit = "units/payday2/weapons/wpn_frag_flashbang/wpn_frag_flashbang"
		end

		local flash_grenade = World:spawn_unit(Idstring(flashbang_unit), det_pos, rotation)
		local shoot_from_pos = data.shooter_pos or det_pos
		flash_grenade:base():activate(shoot_from_pos, data.duration)

		self._smoke_grenades[id] = nil
	else
		data.duration = data.duration == 0 and 15 or data.duration
		local det_pos = data.detonate_pos
		local ray_to = mvector3.copy(det_pos) + math.UP * 5

		mvector3.set_z(ray_to, ray_to.z - 50)

		local ground_ray = World:raycast("ray", det_pos, ray_to, "slot_mask", managers.slot:get_mask("world_geometry, statics"))

		if ground_ray then
			det_pos = ground_ray.hit_position
			mvector3.set_z(det_pos, det_pos.z + 3)
			data.detonate_pos = det_pos
		end

		local rotation = Rotation(math.random() * 360, 0, 0)
		local smoke_grenade = World:spawn_unit(Idstring("units/weapons/smoke_grenade_quick/smoke_grenade_quick"), det_pos, rotation)
		local shoot_from_pos = data.shooter_pos or det_pos
		smoke_grenade:base():activate(shoot_from_pos, data.duration)

		managers.groupai:state():teammate_comment(nil, "g40x_any", det_pos, true, 2000, false)

		data.grenade = smoke_grenade
		self._smoke_end_t = Application:time() + data.duration
	end
end

function GroupAIStateBase:sync_smoke_grenade(detonate_pos, shooter_pos, duration, flashbang)
	self._smoke_grenades = self._smoke_grenades or {}
	local id = #self._smoke_grenades

	self:queue_smoke_grenade(id, detonate_pos, shooter_pos, duration, true, flashbang)
	self:detonate_world_smoke_grenade(id)
end

function GroupAIStateBase:sync_smoke_grenade_kill()
	if self._smoke_grenades then
		for id, data in pairs(self._smoke_grenades) do
			if alive(data.grenade) and data.grenade:base() and data.grenade:base().preemptive_kill then
				data.grenade:base():preemptive_kill()
			end
		end

		self._smoke_grenades = {}
		self._smoke_end_t = nil
	end
end

function GroupAIStateBase:smoke_and_flash_grenades()
	return self._smoke_grenades
end

function GroupAIStateBase:has_room_for_police_hostage()
	local nr_hostages_allowed = 4
	for u_key, u_data in pairs(self._player_criminals) do
		if u_data.unit:base().is_local_player then
			if managers.player:has_category_upgrade("player", "intimidate_enemies") then
				if Global.game_settings.single_player then
					nr_hostages_allowed = 4
				else
					nr_hostages_allowed = 4
				end
			end
		elseif u_data.unit:base():upgrade_value("player", "intimidate_enemies") then
			if Global.game_settings.single_player then
				nr_hostages_allowed = 4
			else
				nr_hostages_allowed = 4
			end
		end
	end
	return nr_hostages_allowed > self._police_hostage_headcount + table.size(self._converted_police)
end

function GroupAIStateBase:sync_event(event_id, blame_id)
	local event_name = self.EVENT_SYNC[event_id]
	local blame_name = self.BLAME_SYNC[blame_id]
	if event_name == "police_called" then
		self._police_called = true
		self:_call_listeners("police_called")
	elseif event_name == "enemy_weapons_hot" then
		self._police_called = true
		self._enemy_weapons_hot = true
		managers.music:post_event(tweak_data.levels:get_music_event("control"))
		self:_call_listeners("enemy_weapons_hot")
		managers.enemy:add_delayed_clbk("notify_bain_weapons_hot", callback(self, self, "notify_bain_weapons_hot", blame_name), Application:time() + 0)
		managers.enemy:set_corpse_disposal_enabled(true)
	elseif event_name == "phalanx_spawned" then
		managers.game_play_central:announcer_say("cpa_a02_01")
	end
end

function GroupAIStateBase:propagate_alert(alert_data)
	if managers.network:session() and Network and not Network:is_server() then
		managers.network:session():send_to_host("propagate_alert", alert_data[1], alert_data[2], alert_data[3], alert_data[4], alert_data[5], alert_data[6])

		return
	end

	local nav_manager = managers.navigation
	local access_func = nav_manager.check_access
	local alert_type = alert_data[1]
	local all_listeners = self._alert_listeners
	local listeners_by_type = all_listeners[alert_type]

	if listeners_by_type then
		local proximity_chk_func = nil
		local alert_epicenter = alert_data[2]

		if alert_epicenter then
			local alert_rad_sq = alert_data[3] * alert_data[3]
			if self._enemy_weapons_hot then
				alert_rad_sq = 4500 * 4500
			end


			function proximity_chk_func(listener_pos)
				return mvec3_dis_sq(alert_epicenter, listener_pos) < alert_rad_sq
			end
		else

			function proximity_chk_func()
				return true
			end
		end

		local alert_filter = alert_data[4]
		local clbks = nil

		for filter_str, listeners_by_type_and_filter in pairs(listeners_by_type) do
			local key, listener = next(listeners_by_type_and_filter, nil)
			local filter_num = listener.filter

			if access_func(nav_manager, filter_num, alert_filter, nil) then
				for id, listener in pairs(listeners_by_type_and_filter) do
					if proximity_chk_func(listener.m_pos) then
						clbks = clbks or {}

						table.insert(clbks, listener.clbk)
					end
				end
			end
		end

		if clbks then
			for _, clbk in ipairs(clbks) do
				clbk(alert_data)
			end
		end
	end
end

--Gameover now happens after ~30 seconds instead of 10 seconds, allowing Stockholm Syndrome and Messiah to function correctly
function GroupAIStateBase:check_gameover_conditions()
	if not Network:is_server() or managers.platform:presence() ~= "Playing" or setup:has_queued_exec() then
		return false
	end

	if game_state_machine:current_state().game_ended and game_state_machine:current_state():game_ended() then
		return false
	end

	if Global.load_start_menu or Application:editor() then
		return false
	end

	if not self:whisper_mode() and self._super_syndrome_peers and self:hostage_count() > 0 then
		for _, active in pairs(self._super_syndrome_peers) do
			if active then
				return false
			end
		end
	end

	local plrs_alive = false
	local plrs_disabled = true

	for u_key, u_data in pairs(self._player_criminals) do
		plrs_alive = true

		if u_data.status ~= "dead" and u_data.status ~= "disabled" then
			plrs_disabled = false

			break
		end
	end

	local ai_alive = false
	local ai_disabled = true

	for u_key, u_data in pairs(self._ai_criminals) do
		ai_alive = true

		if u_data.status ~= "dead" and u_data.status ~= "disabled" then
			ai_disabled = false

			break
		end
	end

	local gameover = false

	if not plrs_alive and not self:is_ai_trade_possible() then
		gameover = true
	elseif plrs_disabled and not ai_alive then
		gameover = true
	elseif plrs_disabled and ai_disabled then
		gameover = true
	end

	gameover = gameover or managers.skirmish:check_gameover_conditions()

	if gameover then
		if not self._gameover_clbk then
			self._gameover_clbk = callback(self, self, "_gameover_clbk_func")

			managers.enemy:add_delayed_clbk("_gameover_clbk", self._gameover_clbk, Application:time() + 25)
		end
	elseif self._gameover_clbk then
		managers.enemy:remove_delayed_clbk("_gameover_clbk")

		self._gameover_clbk = nil
	end

	return gameover
end

Hooks:Add("NetworkReceivedData", "restoration_sync_level_suspicion_from_host", function(sender, message, data)
	if message == "restoration_sync_level_suspicion" then 
		if sender == 1 then 
			local data_tbl = string.split(data,":")
			if data_tbl and #data_tbl > 0 then 
				local groupai_state = managers.groupai:state()
				if data_tbl[1] and data_tbl[2] and groupai_state then
					groupai_state._dummy_old_guard_detection_mul_raw = tonumber(data_tbl[1])
					groupai_state._dummy_alarm_threshold = tonumber(data_tbl[2])
				end
			end
		end
	elseif message == "restoration_drop_ammo" then
		--[[
		if Network:is_server() then
			local data_tbl = string.split(data,":") or {}
			if data_tbl and #data_tbl > 0 then 
				local upgrade_level = 0
				local bullet_storm_level = 0
				local loss_rate = 0.0
				local placement_cost = 0.3
				local pos = Vector3(tonumber(data_tbl[1]) or 0,tonumber(data_tbl[2]) or 0, tonumber(data_tbl[3]) or 0)
				local rot = Rotation(tonumber(data_tbl[4]) or 0,tonumber(data_tbl[5]) or 0, tonumber(data_tbl[6]) or 0)
				local ammo_ratio_taken = tonumber(data_tbl[7]) or 1
				if ammo_ratio_taken < 1 then 
					local unit = AmmoBagBase.spawn(pos, rot, upgrade_level, sender or managers.network:session():local_peer():id(), bullet_storm_level)
					unit:base()._ammo_amount = math.floor(math.min(ammo_ratio_taken,placement_cost) * (1 - loss_rate) * 100) / 100
					local current_amount = unit:base()._ammo_amount
					unit:base():_set_visual_stage()
					managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", unit, current_amount - ammo_ratio_taken)						
				end
			end
		end
		]]
	end
end)


function GroupAIStateBase:update(t, dt)
	self._t = t
	self:_upd_criminal_suspicion_progress()
	
	local is_whisper_mode = managers.groupai:state():whisper_mode()
	
	local level_suspicion,alarm_threshold
	if Network:is_server() then 
		--use suspicion values
		level_suspicion = self._old_guard_detection_mul_raw
		alarm_threshold = self._weapons_hot_threshold
		--self:_draw_current_logics()
	else
		--use suspicion values synced from host
		level_suspicion = self._dummy_old_guard_detection_mul_raw or 0
		alarm_threshold = self._dummy_alarm_threshold or 0
	end
	
	if self._suspicion_interpolated then
		local delta_suspicion = level_suspicion - self._suspicion_interpolated
		if delta_suspicion < 0.0001 then 
			--has caught up to actual value (or close enough)
			self._suspicion_interpolated = level_suspicion
		else
			local animate_duration = 1 --approximate time in seconds for interpolated value to catch up to actual value
			self._suspicion_interpolated = math.min(level_suspicion,0.0005 + self._suspicion_interpolated + (delta_suspicion * (dt / animate_duration)))
		end
	else
		--init value
		self._suspicion_interpolated = level_suspicion
	end
	managers.hud:_upd_animate_level_suspicion(t,level_suspicion,alarm_threshold,self._suspicion_interpolated,is_whisper_mode)
	if self._last_detection_mul and self._last_detection_mul ~= self._old_guard_detection_mul_raw and Network:is_server() then 
		LuaNetworking:SendToPeers("restoration_sync_level_suspicion",tostring(self._old_guard_detection_mul_raw) .. ":" .. tostring(self._weapons_hot_threshold))
	end
			
	
	
	if is_whisper_mode then
		local warning_1_threshold = self._weapons_hot_threshold * 0.25
		local warning_2_threshold = self._weapons_hot_threshold * 0.5
		local warning_3_threshold = self._weapons_hot_threshold * 0.75
			
		if self._played_stealth_warning < 1 and self._old_guard_detection_mul_raw >= warning_1_threshold then
			log("warning1")
			self._played_stealth_warning = 1 
		end
			
		if self._played_stealth_warning < 2 and self._old_guard_detection_mul_raw >= warning_2_threshold then
			log("warning2")
			self._played_stealth_warning = 2 
		end
			
		if self._played_stealth_warning < 3 and self._old_guard_detection_mul_raw >= warning_3_threshold then
			log("warning3")
			self._played_stealth_warning = 3
		end
			
		if self._old_guard_detection_mul_raw >= self._weapons_hot_threshold then
			if not self._alarm_t then 
				self._alarm_t = self._t + 60
			end
				
			if self._played_stealth_warning < 4 then
				managers.dialog:queue_dialog("Play_pln_pat_03", {})
				self._played_stealth_warning = 4
			end
				
			if self._played_stealth_warning < 5 and self._alarm_t - 30 < t then
				managers.dialog:queue_dialog("Play_pln_pat_04", {})
				self._played_stealth_warning = 5
			end
				
			if self._played_stealth_warning < 6 and self._alarm_t - 50 < t then
				managers.dialog:queue_dialog("Play_pln_pat_05", {})
				self._played_stealth_warning = 6
			end
				
			if self._alarm_t < t then
				self:on_police_called("sys_police_alerted")
				--log("uhohstinkyyyy")
			end
		end
		
		if self._decay_target and self._next_whisper_susp_mul_t and self._next_whisper_susp_mul_t < t then
			self:_upd_whisper_suspicion_mul_decay(t)
		end
	end
	
	if self._draw_drama then
		self:_debug_draw_drama(t)
	end

	self:_upd_debug_draw_attentions()
	self:upd_team_AI_distance()
	self._last_detection_mul = self._old_guard_detection_mul_raw --used purely for suspicion meter syncing
end

function GroupAIStateBase:_upd_whisper_suspicion_mul_decay(t)
	if not self._decay_target or self._next_whisper_susp_mul_t and self._next_whisper_susp_mul_t > t then
		--log("why did this execute")
		return
	end
	
	if self._next_whisper_susp_mul_t and self._next_whisper_susp_mul_t < t then
		if self._guard_detection_mul_raw > self._decay_target then
			self._decay_target = self._old_guard_detection_mul_raw * self._suspicion_threshold
			self._guard_detection_mul_raw = self._guard_detection_mul_raw - 0.01
			self._next_whisper_susp_mul_t = t + 5
			--log("coolcoolcool")
		end
	end	
end

function GroupAIStateBase:_delay_whisper_suspicion_mul_decay()
	self._next_whisper_susp_mul_t = self._t + 5
end

function GroupAIStateBase:on_enemy_unregistered(unit)
	if self:is_unit_in_phalanx_minion_data(unit:key()) then
		self:unregister_phalanx_minion(unit:key())
		CopLogicPhalanxMinion:chk_should_breakup()
		CopLogicPhalanxMinion:chk_should_reposition()
	end

	self._police_force = self._police_force - 1
	local u_key = unit:key()

	self:_clear_character_criminal_suspicion_data(u_key)

	if not Network:is_server() then
		return
	end

	local e_data = self._police[u_key]

	if e_data.importance > 0 then
		for c_key, c_data in pairs(self._player_criminals) do
			local imp_keys = c_data.important_enemies

			for i, test_e_key in ipairs(imp_keys) do
				if test_e_key == u_key then
					table.remove(imp_keys, i)
					table.remove(c_data.important_dis, i)

					break
				end
			end
		end
	end

	for crim_key, record in pairs(self._ai_criminals) do
		record.unit:brain():on_cop_neutralized(u_key)
	end

	local unit_type = unit:base()._tweak_table

	if self._special_unit_types[unit_type] then
		self:unregister_special_unit(u_key, unit_type)
	end

	local dead = unit:character_damage():dead()

	if e_data.group then
		self:_remove_group_member(e_data.group, u_key, dead)
	end
	
	--Only guards with pagers increase suspicion
	local char_tweak = tweak_data.character[unit:base()._tweak_table]
	
	if dead and char_tweak.has_alarm_pager and managers.groupai:state():whisper_mode() then
		self._next_whisper_susp_mul_t = self._t + 5
		self._old_guard_detection_mul_raw = self._old_guard_detection_mul_raw + 0.04
		self._decay_target = self._old_guard_detection_mul_raw * 0.75			
		self._guard_detection_mul_raw = self._old_guard_detection_mul_raw 
		self._guard_delay_deduction = self._guard_delay_deduction + 0.04
	end		

	if e_data.assigned_area and dead then
		local spawn_point = unit:unit_data().mission_element

		if spawn_point then
			local spawn_pos = spawn_point:value("position")
			local u_pos = e_data.m_pos

			if mvector3.distance(spawn_pos, u_pos) < 700 and math.abs(spawn_pos.z - u_pos.z) < 300 then
				local found = nil

				for area_id, area_data in pairs(self._area_data) do
					local area_spawn_points = area_data.spawn_points

					if area_spawn_points then
						for _, sp_data in ipairs(area_spawn_points) do
							if sp_data.spawn_point == spawn_point then
								found = true
								sp_data.delay_t = math.max(sp_data.delay_t, self._t + math.random(30, 60))

								break
							end
						end

						if found then
							break
						end
					end

					local area_spawn_points = area_data.spawn_groups

					if area_spawn_points then
						for _, sp_data in ipairs(area_spawn_points) do
							if sp_data.spawn_point == spawn_point then
								found = true
								sp_data.delay_t = math.max(sp_data.delay_t, self._t + math.random(30, 60))

								break
							end
						end

						if found then
							break
						end
					end
				end
			end
		end
	end
end

function GroupAIStateBase:on_civilian_unregistered(unit)
	local u_key = unit:key()

	self:_clear_character_criminal_suspicion_data(u_key)

	local u_data = managers.enemy:all_civilians()[u_key]

	if u_data and u_data.hostage_following then
		self:on_hostage_follow(u_data.hostage_following, unit, false)
	end
	
	local dead = unit:character_damage():dead()
	
	--*Big* suspicion increase from dead civs. Watch your background!--
	if dead and managers.groupai:state():whisper_mode() then
		self._next_whisper_susp_mul_t = self._t + 5
		self._old_guard_detection_mul_raw = self._old_guard_detection_mul_raw + 0.1
		self._decay_target = self._old_guard_detection_mul_raw * 0.75			
		self._guard_detection_mul_raw = self._old_guard_detection_mul_raw 
		self._guard_delay_deduction = self._guard_delay_deduction + 0.1
	end		
	
end	

function GroupAIStateBase:_get_anticipation_duration(anticipation_duration_table, is_first)
	local anticipation_duration = anticipation_duration_table[1][1]

	if not is_first then
		local rand = math.random()
		local accumulated_chance = 0

		for i, setting in pairs(anticipation_duration_table) do
			accumulated_chance = accumulated_chance + setting[2]

			if rand <= accumulated_chance then
				anticipation_duration = setting[1]

				break
			end
		end
	end
	
	if not managers.skirmish:is_skirmish() then
		if is_first or self._assault_number and self._assault_number == 1 then
			return 45
		elseif self._assault_number and self._assault_number == 2 then
			return 45
		elseif self._assault_number and self._assault_number == 3 then
			return 35
		elseif self._assault_number and self._assault_number >= 4 then
			return 25
		else
			return 45
		end
	else
		return anticipation_duration
	end
	
end	

local _remove_group_member_ori = GroupAIStateBase._remove_group_member
function GroupAIStateBase:_remove_group_member(group, u_key, is_casualty)
	_remove_group_member_ori(self, group, u_key, is_casualty)
	if is_casualty then
		local unit_to_scream = group.units[math.random(#group.units)]
		if unit_to_scream then
			unit_to_scream:sound():say("buddy_died", true)
		end
	end
end
