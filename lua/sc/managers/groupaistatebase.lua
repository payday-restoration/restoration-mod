local mvec3_dot = mvector3.dot
local mvec3_set = mvector3.set
local mvec3_sub = mvector3.subtract
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_dir = mvector3.direction
local mvec3_l_sq = mvector3.length_sq
local tmp_vec1 = Vector3()
local job = Global.level_data and Global.level_data.level_id

-- Megaphone events must be appended to this table in order for them to be synced to clients
GroupAIStateBase.MEGAPHONE_EVENTS = {
	"mga_killed_civ_1st",
	"mga_killed_civ_2nd",
	"mga_hostage_assault_delay",
	"mga_generic_c",
	"mga_robbers_clever",
	"mga_leave"
}
table.list_append(GroupAIStateBase.EVENT_SYNC, GroupAIStateBase.MEGAPHONE_EVENTS)

function GroupAIStateBase:_calculate_difficulty_ratio()
	local ramp = tweak_data.group_ai.difficulty_curve_points

	--Use alternate curve points for skirmish difficulty ratio.
	if managers.skirmish:is_skirmish() then
		ramp = tweak_data.group_ai.skirmish_difficulty_curve_points
	end

	local diff = self._difficulty_value
	local i = 1

	while diff > (ramp[i] or 1) do
		i = i + 1
	end

	self._difficulty_point_index = i
	self._difficulty_ramp = (diff - (ramp[i - 1] or 0)) / ((ramp[i] or 1) - (ramp[i - 1] or 0))
	--log("Diff = " .. tostring(diff))
	--log("Index = " .. tostring(self._difficulty_point_index))
	--log("Value = " .. tostring(self._difficulty_ramp + self._difficulty_point_index))
end

function GroupAIStateBase:_check_assault_panic_chatter()
	if self._t and self._last_killed_cop_t and self._t - self._last_killed_cop_t < math.random(1, 3.5) then
		return true
	end
	
	return
end

function GroupAIStateBase:_post_megaphone_event(event)
	local pos = tweak_data.levels[Global.level_data.level_id].megaphone_pos or Vector3(0, 0, 0)
	local sound_source = SoundDevice:create_source("megaphone")

	sound_source:set_position(pos)
	sound_source:post_event(event)
	
	if self._is_server then
		local event_id = self:get_sync_event_id(event)
		if event_id then
			managers.network:session():send_to_peers_synched("group_ai_event", event_id, 0)
		else
			log("[RESTORATION] GroupAIStateBase:_post_megaphone_event: Tried to sync an inexistent event ID: " .. tostring(event))
		end
	end
end

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
		tank_medic = true,
		tank_mini = true,
		tank_hw = true,
		tank_titan = true,
		tank_titan_assault = true,
		spooc = true,
		spooc_titan = true,
		shield = true,
		phalanx_minion = true,
		phalanx_minion_assault = true,
		taser = true,
		taser_titan = true,
		taser_titan_reaper = true,
		boom = true,
		boom_titan = true,
		heavy_swat_sniper = true,
		boom_summers = true,
		taser_summers = true,
		medic_summers = true,
		medic = true,
		omnia_LPF = true,
		hrt_titan = true,
		phalanx_vip = true,
		spring = true,
		headless_hatman = true,
		summers = true,
		autumn = true
	}
	
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if diff_index <= 2 then
		self._weapons_hot_threshold = 0.70
		self._suspicion_threshold = 0.6
	elseif diff_index == 3 then
		self._weapons_hot_threshold = 0.65
		self._suspicion_threshold = 0.65
	elseif diff_index == 4 then
		self._weapons_hot_threshold = 0.60
		self._suspicion_threshold = 0.7
	elseif diff_index == 5 then
		self._weapons_hot_threshold = 0.55
		self._suspicion_threshold = 0.75
	elseif diff_index == 6 then
		self._weapons_hot_threshold = 0.50
		self._suspicion_threshold = 0.8
	elseif diff_index == 7 then
		self._weapons_hot_threshold = 0.50
		self._suspicion_threshold = 0.85
	else
		self._weapons_hot_threshold = 0.45
		self._suspicion_threshold = 0.9
	end
	self._blackout_units = {} --offy wuz hear
	
	self._summers_dr = 0.25
end

local sc_group_base = GroupAIStateBase.on_simulation_started
function GroupAIStateBase:on_simulation_started()
	sc_group_base(self)
	self._loud_diff_set = false --i really just dont want to take any chances
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
		tank_medic = true,
		tank_mini = true,
		tank_hw = true,
		tank_titan = true,
		tank_titan_assault = true,
		spooc = true,
		spooc_titan = true,
		shield = true,
		phalanx_minion = true,
		phalanx_minion_assault = true,
		taser = true,
		taser_titan = true,
		taser_titan_reaper = true,
		boom = true,
		boom_titan = true,
		heavy_swat_sniper = true,
		boom_summers = true,
		taser_summers = true,
		medic_summers = true,
		medic = true,
		omnia_LPF = true,
		hrt_titan = true,
		phalanx_vip = true,
		spring = true,
		headless_hatman = true,
		summers = true,
		autumn = true
	}
	
	local diff_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	
	if diff_index <= 2 then
		self._weapons_hot_threshold = 0.70
		self._suspicion_threshold = 0.6
	elseif diff_index == 3 then
		self._weapons_hot_threshold = 0.65
		self._suspicion_threshold = 0.65
	elseif diff_index == 4 then
		self._weapons_hot_threshold = 0.60
		self._suspicion_threshold = 0.7
	elseif diff_index == 5 then
		self._weapons_hot_threshold = 0.55
		self._suspicion_threshold = 0.75
	elseif diff_index == 6 then
		self._weapons_hot_threshold = 0.50
		self._suspicion_threshold = 0.8
	elseif diff_index == 7 then
		self._weapons_hot_threshold = 0.50
		self._suspicion_threshold = 0.85
	else
		self._weapons_hot_threshold = 0.45
		self._suspicion_threshold = 0.9
	end
	
	self._summers_dr = 0.25
end

function GroupAIStateBase:_get_summers_dr()	
	return self._summers_dr
end

function GroupAIStateBase:_reduce_summers_dr(amount)
	self._summers_dr = self._summers_dr + amount
end

function GroupAIStateBase:_reset_summers_dr()	
	self._summers_dr = tweak_data.character.summers.base_summers_dr
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

function GroupAIStateBase:set_point_of_no_return_timer(time, point_of_no_return_id, point_of_no_return_tweak_id)
	if time == nil or setup:has_queued_exec() then
		return
	end
	
	--No PONRs during stealth, unless the map really needs it
	--[[
	if not table.contains(restoration.stealth_ponr_behavior, job) then
		if managers.groupai:state():whisper_mode() then
			return
		end
	end
	]]--

	self._forbid_drop_in = true
	self._ponr_is_on = true
	
	managers.network.matchmake:set_server_joinable(false)

	if not self._peers_inside_point_of_no_return then
		self._peers_inside_point_of_no_return = {}
	end

	self._point_of_no_return_timer = time
	self._point_of_no_return_id = point_of_no_return_id
	self._point_of_no_return_tweak_id = point_of_no_return_tweak_id
	self._point_of_no_return_areas = nil

	managers.hud:show_point_of_no_return_timer(self._point_of_no_return_tweak_id)
	managers.hud:add_updator("point_of_no_return", callback(self, self, "_update_point_of_no_return"))
	--log("setting diff to 1!!")
	if not table.contains(restoration.alternate_ponr_behavior, job) then 
		self:set_difficulty(nil, 1)
	end
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

function GroupAIStateBase:_get_balancing_multiplier(balance_multipliers)
	local nr_players = 0
	--If stealth - count only amount of players
	if self:whisper_mode() then
		nr_players = managers.network:session():amount_of_alive_players() 
	else
	--If loud - count players + bots
	for u_key, u_data in pairs(self:all_criminals()) do
		if not u_data.status then
			nr_players = nr_players + 1
		end
	end
		nr_players = math.clamp(nr_players, 1, 22)	
	end
	--log("SC: Balance set for player count of = " .. tostring(nr_players))
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

		flashbang_unit = managers.mutators:modify_value("GroupAIStateBase:SpawnSpecialFlashbang", flashbang_unit)
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
		local smoke_grenade_id = Idstring("units/weapons/smoke_grenade_quick/smoke_grenade_quick")
		smoke_grenade_id = managers.modifiers:modify_value("GroupAIStateBase:SpawningSmoke", smoke_grenade_id)
		smoke_grenade_id = managers.mutators:modify_value("GroupAIStateBase:SpawningSmoke", smoke_grenade_id)
		local smoke_grenade = World:spawn_unit(smoke_grenade_id, det_pos, rotation)
		local shoot_from_pos = data.shooter_pos or det_pos
		--log("spawning smoke!! was it tear gas?")
		smoke_grenade:base():activate(shoot_from_pos, data.duration)

		local voice_line = "g40x_any"
		voice_line = managers.modifiers:modify_value("GroupAIStateBase:CheckingVoiceLine", voice_line)
		voice_line = managers.mutators:modify_value("GroupAIStateBase:CheckingVoiceLine", voice_line)
		managers.groupai:state():teammate_comment(nil, voice_line, det_pos, true, 2000, false)

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

--No longer increases with more players, also ignores converts.
function GroupAIStateBase:has_room_for_police_hostage()
	local nr_hostages_allowed = 4

	return nr_hostages_allowed > self._police_hostage_headcount
end

function GroupAIStateBase:sync_hostage_headcount(nr_hostages)
	if nr_hostages and self._hostage_headcount < nr_hostages then
		managers.player:captured_hostage()
	end

	if nr_hostages then
		self._hostage_headcount = nr_hostages
	elseif Network:is_server() then
		managers.network:session():send_to_peers_synched("sync_hostage_headcount", math.min(self._hostage_headcount, 63))
	end

	if managers.player:has_team_category_upgrade("damage", "hostage_absorption") then
		local hostage_count = math.min(self._hostage_headcount + (self._num_converted_police or managers.player:num_local_minions() or 0), tweak_data.upgrades.values.team.damage.hostage_absorption_limit)
		local absorption = managers.player:team_upgrade_value("damage", "hostage_absorption", 0) * hostage_count

		managers.player:set_damage_absorption("hostage_absorption", absorption)
	end

	managers.hud:set_control_info({
		nr_hostages = self._hostage_headcount
	})
	self:check_gameover_conditions()
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
		]]--
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

	local objective = unit:brain():objective()

	if objective and objective.fail_clbk then
		local fail_clbk = objective.fail_clbk
		objective.fail_clbk = nil

		fail_clbk(unit)
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

	local tags = unit:base().get_tags and unit:base():get_tags() or {}

	for special_tag, is_set in pairs(self._special_unit_types) do
		if is_set and tags[special_tag] then
			self:unregister_special_unit(u_key, special_tag)
		end
	end

	local dead = unit:character_damage():dead()

	if e_data.group then
		self:_remove_group_member(e_data.group, u_key, dead)
		if dead and self._task_data and self._task_data.assault and self._task_data.assault.active then
			self:_voice_friend_dead(e_data.group)
			self._last_killed_cop_t = self._t
		end
	end
	
	--Only guards with pagers increase suspicion
	local char_tweak = tweak_data.character[unit:base()._tweak_table]
	
	if dead and char_tweak.has_alarm_pager and managers.groupai:state():whisper_mode() then
		self._next_whisper_susp_mul_t = self._t + 5
		self._old_guard_detection_mul_raw = self._old_guard_detection_mul_raw + 0.05
		self._decay_target = self._old_guard_detection_mul_raw * 0.75			
		self._guard_detection_mul_raw = self._old_guard_detection_mul_raw 
		self._guard_delay_deduction = self._guard_delay_deduction + 0.05
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
		self._old_guard_detection_mul_raw = self._old_guard_detection_mul_raw + 0.05
		self._decay_target = self._old_guard_detection_mul_raw * 0.75			
		self._guard_detection_mul_raw = self._old_guard_detection_mul_raw 
		self._guard_delay_deduction = self._guard_delay_deduction + 0.05
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

function GroupAIStateBase:criminal_spotted(unit)
	local u_key = unit:key()
	local u_sighting = self._criminals[u_key]

	u_sighting.undetected = nil
	u_sighting.det_t = self._t

	mvector3.set(u_sighting.pos, u_sighting.m_det_pos)

	local seg = u_sighting.tracker:nav_segment()
	u_sighting.seg = seg

	local prev_area = u_sighting.area
	local area = nil

	if prev_area and prev_area.nav_segs[seg] then
		area = prev_area
	else
		area = self:get_area_from_nav_seg_id(seg)
	end

	if prev_area ~= area then
		u_sighting.area = area

		if prev_area then
			prev_area.criminal.units[u_key] = nil
		end

		area.criminal.units[u_key] = u_sighting
	end

	if area.is_safe then
		area.is_safe = nil

		self:_on_area_safety_status(area, {
			reason = "criminal",
			record = u_sighting
		})
	end
end

function GroupAIStateBase:on_criminal_nav_seg_change(unit, nav_seg_id)
	local u_key = unit:key()
	local u_sighting = self._criminals[u_key]

	if not u_sighting then
		return
	end

	local seg = nav_seg_id

	u_sighting.seg = seg

	local prev_area = u_sighting.area
	local area = nil

	if prev_area and prev_area.nav_segs[seg] then
		area = prev_area
	else
		area = self:get_area_from_nav_seg_id(seg)
	end

	if prev_area ~= area then
		u_sighting.area = area

		if prev_area then
			prev_area.criminal.units[u_key] = nil
		end

		area.criminal.units[u_key] = u_sighting
	end
end

function GroupAIStateBase:on_criminal_suspicion_progress(u_suspect, u_observer, status, client_id)
	if not self._ai_enabled or not self._whisper_mode or self._stealth_hud_disabled then
		return
	end

	local ignore_suspicion = u_observer:brain() and u_observer:brain()._ignore_suspicion
	local observer_is_dead = u_observer:character_damage() and u_observer:character_damage():dead()

	if ignore_suspicion or observer_is_dead then
		return
	end

	local obs_key = u_observer:key()

	if managers.groupai:state():all_AI_criminals()[obs_key] then
		return
	end

	local susp_data = self._suspicion_hud_data
	local susp_key = u_suspect and u_suspect:key()

	local function _sync_status(sync_status_code)
		if Network:is_server() and managers.network:session() then
			if client_id then
				managers.network:session():send_to_peers_synched_except(client_id, "suspicion_hud", u_observer, sync_status_code)
			else
				managers.network:session():send_to_peers_synched("suspicion_hud", u_observer, sync_status_code)
			end
		end
	end

	local obs_susp_data = susp_data[obs_key]

	if status == "called" then
		if obs_susp_data then
			if status == obs_susp_data.status then
				return
			else
				obs_susp_data.suspects = nil
			end
		else
			local icon_id = "susp1" .. tostring(obs_key)
			local icon_pos = self._create_hud_suspicion_icon(obs_key, u_observer, "wp_calling_in", tweak_data.hud.suspicion_color, icon_id)
			obs_susp_data = {
				u_observer = u_observer,
				icon_id = icon_id,
				icon_pos = icon_pos
			}
			susp_data[obs_key] = obs_susp_data
		end

		managers.hud:change_waypoint_icon(obs_susp_data.icon_id, "wp_calling_in")
		managers.hud:change_waypoint_arrow_color(obs_susp_data.icon_id, tweak_data.hud.detected_color)

		if obs_susp_data.icon_id2 then
			managers.hud:remove_waypoint(obs_susp_data.icon_id2)

			obs_susp_data.icon_id2 = nil
			obs_susp_data.icon_pos2 = nil
		end

		obs_susp_data.status = "called"
		obs_susp_data.alerted = true
		obs_susp_data.expire_t = self._t + 8
		obs_susp_data.persistent = true

		_sync_status(4)
	elseif status == "calling" then
		if obs_susp_data then
			if status == obs_susp_data.status then
				return
			else
				obs_susp_data.suspects = nil
			end
		else
			local icon_id = "susp1" .. tostring(obs_key)
			local icon_pos = self._create_hud_suspicion_icon(obs_key, u_observer, "wp_calling_in", tweak_data.hud.detected_color, icon_id)
			obs_susp_data = {
				u_observer = u_observer,
				icon_id = icon_id,
				icon_pos = icon_pos
			}
			susp_data[obs_key] = obs_susp_data
		end

		if not obs_susp_data.icon_id2 then
			local hazard_icon_id = "susp2" .. tostring(obs_key)
			local hazard_icon_pos = self._create_hud_suspicion_icon(obs_key, u_observer, "wp_calling_in_hazard", tweak_data.hud.detected_color, hazard_icon_id)
			obs_susp_data.icon_id2 = hazard_icon_id
			obs_susp_data.icon_pos2 = hazard_icon_pos
		end

		managers.hud:change_waypoint_icon(obs_susp_data.icon_id, "wp_calling_in")
		managers.hud:change_waypoint_arrow_color(obs_susp_data.icon_id, tweak_data.hud.detected_color)
		managers.hud:change_waypoint_icon(obs_susp_data.icon_id2, "wp_calling_in_hazard")
		managers.hud:change_waypoint_arrow_color(obs_susp_data.icon_id2, tweak_data.hud.detected_color)

		obs_susp_data.status = "calling"
		obs_susp_data.alerted = true

		_sync_status(3)
	elseif status == true or status == "call_interrupted" then
		if obs_susp_data then
			if obs_susp_data.status == status then
				return
			else
				obs_susp_data.suspects = nil
			end
		else
			local icon_id = "susp1" .. tostring(obs_key)
			local icon_pos = self._create_hud_suspicion_icon(obs_key, u_observer, "wp_detected", tweak_data.hud.detected_color, icon_id)
			obs_susp_data = {
				u_observer = u_observer,
				icon_id = icon_id,
				icon_pos = icon_pos
			}
			susp_data[obs_key] = obs_susp_data
		end

		managers.hud:change_waypoint_icon(obs_susp_data.icon_id, "wp_detected")
		managers.hud:change_waypoint_arrow_color(obs_susp_data.icon_id, tweak_data.hud.detected_color)

		if obs_susp_data.icon_id2 then
			managers.hud:remove_waypoint(obs_susp_data.icon_id2)

			obs_susp_data.icon_id2 = nil
			obs_susp_data.icon_pos2 = nil
		end

		obs_susp_data.status = status
		obs_susp_data.alerted = true

		_sync_status(2)
	elseif not status then
		if obs_susp_data then
			if obs_susp_data.suspects and susp_key then
				obs_susp_data.suspects[susp_key] = nil

				if not next(obs_susp_data.suspects) then
					obs_susp_data.suspects = nil
				end
			end

			if not susp_key or not obs_susp_data.alerted and (not obs_susp_data.suspects or not next(obs_susp_data.suspects)) then
				managers.hud:remove_waypoint(obs_susp_data.icon_id)

				if obs_susp_data.icon_id2 then
					managers.hud:remove_waypoint(obs_susp_data.icon_id2)
				end

				susp_data[obs_key] = nil

				_sync_status(0)
			end
		end
	else
		if obs_susp_data then
			if obs_susp_data.alerted then
				return
			end

			_sync_status(1)
		elseif not obs_susp_data then
			local icon_id = "susp1" .. tostring(obs_key)
			local icon_pos = self._create_hud_suspicion_icon(obs_key, u_observer, "wp_suspicious", tweak_data.hud.suspicion_color, icon_id)
			obs_susp_data = {
				u_observer = u_observer,
				icon_id = icon_id,
				icon_pos = icon_pos
			}
			susp_data[obs_key] = obs_susp_data

			managers.hud:change_waypoint_icon(obs_susp_data.icon_id, "wp_suspicious")
			managers.hud:change_waypoint_arrow_color(obs_susp_data.icon_id, tweak_data.hud.suspicion_color)

			if obs_susp_data.icon_id2 then
				managers.hud:remove_waypoint(obs_susp_data.icon_id2)

				obs_susp_data.icon_id2 = nil
				obs_susp_data.icon_pos2 = nil
			end

			_sync_status(1)
		end

		if susp_key then
			obs_susp_data.suspects = obs_susp_data.suspects or {}

			if obs_susp_data.suspects[susp_key] then
				obs_susp_data.suspects[susp_key].status = status
			else
				obs_susp_data.suspects[susp_key] = {
					status = status,
					u_suspect = u_suspect
				}
			end
		end
	end
end

function GroupAIStateBase:set_whisper_mode(state)
	state = state and true or false

	if state == self._whisper_mode then
		return
	end

	self._whisper_mode = state
	self._whisper_mode_change_t = TimerManager:game():time()

	self:set_ambience_flag()

	if Network:is_server() then
		if state then
			self:chk_register_removed_attention_objects()
		else
			self:chk_unregister_irrelevant_attention_objects()

			if not self._switch_to_not_cool_clbk_id then
				self._switch_to_not_cool_clbk_id = "GroupAI_delayed_not_cool"

				managers.enemy:add_delayed_clbk(self._switch_to_not_cool_clbk_id, callback(self, self, "_clbk_switch_enemies_to_not_cool"), self._t + 1)
			end
		end
	end

	self:_call_listeners("whisper_mode", state)

	if not state then
		self:_clear_criminal_suspicion_data()
	end
end

function GroupAIStateBase:chk_say_teamAI_combat_chatter(unit)
	if not self:is_detection_persistent() then
		return
	end

	local drama_amount = self._drama_data.amount
	local frequency_lerp = drama_amount
	local delay_tweak = tweak_data.sound.criminal_sound.combat_callout_delay
	local delay = math.lerp(delay_tweak[1], delay_tweak[2], frequency_lerp)
	local delay_t = self._teamAI_last_combat_chatter_t + delay

	if self._t < delay_t then
		return
	end

	self._teamAI_last_combat_chatter_t = self._t

	local frequency_lerp_clamp = math.clamp(frequency_lerp ^ 2, 0, 1)
	local chance_tweak = tweak_data.sound.criminal_sound.combat_callout_chance
	local chance = math.lerp(chance_tweak[1], chance_tweak[2], frequency_lerp_clamp)

	if chance < math.random() then
		return
	end

	unit:sound():say("g90", true, true)
end

function GroupAIStateBase:register_AI_attention_object(unit, handler, nav_tracker, team, SO_access)
	local store_instead = nil

	if Network:is_server() and not self:whisper_mode() then
		if not nav_tracker and not unit:vehicle_driving() or unit:in_slot(1) or unit:in_slot(17) and unit:character_damage() then
			store_instead = true
		end
	end

	if store_instead then
		local attention_info = {
			unit = unit,
			handler = handler,
			nav_tracker = nav_tracker,
			team = team,
			SO_access = SO_access
		}

		self:store_removed_attention_object(unit:key(), attention_info)

		return
	end

	self._attention_objects.all[unit:key()] = {
		unit = unit,
		handler = handler,
		nav_tracker = nav_tracker,
		team = team,
		SO_access = SO_access
	}

	self:on_AI_attention_changed(unit:key())
end

function GroupAIStateBase:chk_register_removed_attention_objects()
	if not self._removed_attention_objects then
		return
	end

	local all_attention_objects = self:get_all_AI_attention_objects()

	for u_key, att_info in pairs (self._removed_attention_objects) do
		if all_attention_objects[u_key] then
			self._removed_attention_objects[u_key] = nil
		elseif alive(att_info.unit) then
			self:register_AI_attention_object(att_info.unit, att_info.handler, att_info.nav_tracker, att_info.team, att_info.SO_access)
			self._removed_attention_objects[u_key] = nil
		end
	end

	self._removed_attention_objects = nil
end

function GroupAIStateBase:store_removed_attention_object(u_key, attention_info)
	self._removed_attention_objects = self._removed_attention_objects or {}

	self._removed_attention_objects[u_key] = attention_info
end

function GroupAIStateBase:chk_unregister_irrelevant_attention_objects()
	local all_attention_objects = self:get_all_AI_attention_objects()

	for u_key, att_info in pairs (all_attention_objects) do
		if not att_info.nav_tracker and not att_info.unit:vehicle_driving() or att_info.unit:in_slot(1) or att_info.unit:in_slot(17) and att_info.unit:character_damage() then
			self:store_removed_attention_object(u_key, att_info)
			att_info.handler:set_attention(nil)
		end
	end
end

--setup for host to set diff based on events
--probably fine if clients run it, but better safe than sorry
if Network:is_server() then
	--increase diff by x amount for each hostage killed (only by players)
	Hooks:PostHook(GroupAIStateBase, "hostage_killed", "res_hostage_killed", function(self, killer_unit)
		--vanilla checks to make sure its a player
		if not alive(killer_unit) then
			return
		end

		if killer_unit:base() and killer_unit:base().thrower_unit then
			killer_unit = killer_unit:base():thrower_unit()

			if not alive(killer_unit) then
				return
			end
		end

		local key = killer_unit:key()
		local criminal = self._criminals[key]
		if not criminal then
			return
		end

		self:set_difficulty(nil, 0.1) --Diff increase when killing a civ

		if not self._hunt_mode and self._assault_number and self._assault_number >= 1 then
			self._megaphone_hostages_killed = (self._megaphone_hostages_killed or 0) + 1 -- have to track separately to self._hostages_killed because some may be killed before going loud

			if self._megaphone_hostages_killed == 1 then
				self:_post_megaphone_event("mga_killed_civ_1st")
			elseif self._megaphone_hostages_killed == 4 then
				self:_post_megaphone_event("mga_killed_civ_2nd")
			end
		end
	end)
end

--this function has been repurposed. instead of overriding any previous value, this ADDS diff
--this is set to 0.5 on loud, while other events increase it
--+0.05 on civilian kill (watch your fire!), +0.3 on assault end
--script value is used by the base game, we usually ignore it after the beginning of a level
--thanks (again) to hoxi for helping out with this
--perhaps modify these values at one point in crime spree? who knows
function GroupAIStateBase:set_difficulty(script_value, manual_value)
	if managers.skirmish:is_skirmish() then
		self:set_skirmish_difficulty()
		return
	end

    if self._difficulty_value == 1 then
        return
    end

	if script_value then
		if script_value == 0 then
			self._difficulty_value = 0
			--if diff is set to 0 in the middle of a mission, heists cannot start assaults. this ensures that we can set diff to default 0.5 again if a script sets it to 0
			--i dont think any heists do this but there's no harm in having this check here
			self._loud_diff_set = false 
            self:_calculate_difficulty_ratio()

			return
		elseif not self._loud_diff_set and script_value > 0  then
			local starting_diff = 0.1
			starting_diff = managers.modifiers:modify_value("GroupAIStateBase:CheckingDiff", starting_diff)
			starting_diff = managers.mutators:modify_value("GroupAIStateBase:CheckingDiff", starting_diff)
			--hopefully better way to do it. when game tries to set diff to anything that isnt 0, we add 0.1
			--only do this once (or when value is set to false as said below). otherwise we'll set diff to 1 super fast and that's mean
			--should fix armored transport and its jank mission scripts	(ovk why)
			--also, add 0.1 here instead of setting so you cant bypass civ penalty on some heists
			self._difficulty_value = self._difficulty_value + starting_diff
			self:_calculate_difficulty_ratio()
			--please kill me
			self._loud_diff_set = true

			return
        end
    end

    if not manual_value then
        return
    end

	--note that this ADDS, not replaces. only way to replace is with a script_value of 0
    self._difficulty_value = math.min(self._difficulty_value + manual_value, 1)

    self:_calculate_difficulty_ratio()
end

--Skirmish's custom diff scaling.
--First 10 waves correspond directly to array values in its groupai tweakdata, after that it switches to an infinite scaling function.
function GroupAIStateBase:set_skirmish_difficulty()
	--Current_wave_number is always 1 lower than the actual wave number for a new assault.
	local wave = managers.skirmish:current_wave_number() + 1
	local skirmish_ramp = tweak_data.group_ai.skirmish_difficulty_curve_points

	if not self._difficulty_value or self._difficulty_value < skirmish_ramp[10] then
		self._difficulty_value = wave * 0.05
	else
		self._difficulty_value = 1 - (1/(0.2*wave)) --Get infinitely closer to 1 over time.
	end

	self:_calculate_difficulty_ratio()
end

--below stuff is used to handle autumn's deployable blackout effect
function GroupAIStateBase:register_blackout_source(unit)
	if unit and alive(unit) then 
		self._blackout_units[unit:key()] = unit
		self:do_blackout(true)
	end
end

function GroupAIStateBase:unregister_blackout_source(unit)
	if unit and alive(unit) then
		self._blackout_units[unit:key()] = nil
	end
	self:check_blackout()
end

function GroupAIStateBase:check_blackout()
	local any_active = false
	for key,unit in pairs(self._blackout_units) do 
		if unit and alive(unit) then 
			any_active = true
			break
		else
			--remove any invalid units from the list, in case their destroy method was not called properly
			self._blackout_units[key] = nil
		end
	end
	self:do_blackout(any_active)
end

function GroupAIStateBase:do_blackout(state)
	local all_eq = World:find_units_quick("all",14,25,26)
	if state then 
		for k,unit in pairs(all_eq) do
			if unit and alive(unit) and unit:base() then
				if unit:interaction() and unit:interaction()._tweak_data and unit:interaction()._tweak_data.blackout_vulnerable then 
					--todo add a cool timed callback thing so that they all die with a bit of an offset from each other but all within x seconds
					if unit:base().get_name_id then 
						local eq_id = unit:base():get_name_id() or ""
						if eq_id == "sentry_gun" then --perish
							unit:character_damage():die()
						elseif eq_id == "ecm_jammer" then 
							unit:base():set_battery_empty()
							unit:base():_set_feedback_active(false)
						end
					end
					
					if unit.contour and unit:contour() then 
						unit:contour():add("deployable_blackout")
					end
					unit:base().blackout_active = true
				end
			end
		end
	else
		for k,unit in pairs(all_eq) do
			if unit and alive(unit) and unit:base() then
				if unit:interaction() and unit:interaction()._tweak_data and unit:interaction()._tweak_data.blackout_vulnerable then 
					if unit.contour and unit:contour() then 
						unit:contour():remove("deployable_blackout")
					end
					unit:base().blackout_active = false
				end
			end
		end
	end
end

local _upd_criminal_suspicion_progress_original = GroupAIStateBase._upd_criminal_suspicion_progress
 
function GroupAIStateBase:_upd_criminal_suspicion_progress(...)
	if self._ai_enabled then
		for obs_key, obs_susp_data in pairs(self._suspicion_hud_data or {}) do
			local unit = obs_susp_data.u_observer
			
			if managers.enemy:is_civilian(unit) then
				local waypoint = managers.hud._hud.waypoints["susp1" .. tostring(obs_key)]
				
				if waypoint then
					if unit:anim_data().drop then
						if not obs_susp_data._subdued_civ then
							obs_susp_data._alerted_civ = nil
							obs_susp_data._subdued_civ = true
							waypoint.bitmap:set_color(Color(0.0, 1.0, 0.0))
							waypoint.arrow:set_color(Color(0.75, 0, 0.3, 0))
						end
					elseif obs_susp_data.alerted then
						if not obs_susp_data._alerted_civ then
							obs_susp_data._subdued_civ = nil
							obs_susp_data._alerted_civ = true
							waypoint.bitmap:set_color(Color.white)
							waypoint.arrow:set_color(tweak_data.hud.detected_color:with_alpha(0.75))
						end
					end
				end
			end
		end
	end
	
	return _upd_criminal_suspicion_progress_original(self, ...)
end

--Procs Enduring (Down restore with bots) at end of assaults for host.
Hooks:PreHook(GroupAIStateBase, "set_assault_mode" , "TriggerEnduringHost" , function(self, enabled)
	if self._assault_mode ~= enabled and enabled == false then
		managers.player:check_enduring()
	end
end)

--Procs Enduring at end of assaults for clients.
Hooks:PreHook(GroupAIStateBase, "sync_assault_mode" , "TriggerEnduringHost" , function(self, enabled)
	if self._assault_mode ~= enabled and enabled == false then
		managers.player:check_enduring()
	end
end)

--[[
Unused?

Hooks:PostHook(GroupAIStateBase, "_init_misc_data", "sh__init_misc_data", register_special_types)
Hooks:PostHook(GroupAIStateBase, "on_simulation_started", "sh_on_simulation_started", register_special_types)

-- Fix cloaker spawn noise for host, disabled as we don't want that noise for Cloakers
local _process_recurring_grp_SO_original = GroupAIStateBase._process_recurring_grp_SO
function GroupAIStateBase:_process_recurring_grp_SO(...)
	if _process_recurring_grp_SO_original(self, ...) then
		managers.hud:post_event("cloaker_spawn")
		return true
	end
end

]]--

-- Delay spawn points when enemies die close to them
Hooks:PostHook(GroupAIStateBase, "on_enemy_unregistered", "sh_on_enemy_unregistered", function (self, unit)
	if not Network:is_server() or not unit:character_damage():dead() then
		return
	end

	local e_data = self._police[unit:key()]
	if not e_data.group or not e_data.group.has_spawned then
		return
	end

	local spawn_point = unit:unit_data().mission_element
	if not spawn_point then
		return
	end

	local u_pos = e_data.m_pos
	local spawn_pos = spawn_point:value("position")
	local dist_sq = mvector3.distance_sq(spawn_pos, u_pos)
	local max_dist_sq = 1000000
	if dist_sq > max_dist_sq then
		return
	end

	for _, area in pairs(self._area_data) do
		if area.spawn_groups then
			for _, group in pairs(area.spawn_groups) do
				if group.spawn_pts then
					for _, point in pairs(group.spawn_pts) do
						if point.mission_element == spawn_point then
							local delay_t = self._t + math.lerp(8, 0, dist_sq / max_dist_sq)
							group.delay_t = math.max(group.delay_t, delay_t)
							return
						end
					end
				end
			end
		end
	end
end)

-- Check nav segment safety directly instead of area safety
function GroupAIStateBase:is_nav_seg_safe(nav_seg)
	for _, u_data in pairs(self._criminals) do
		if u_data.tracker:nav_segment() == nav_seg then
			return
		end
	end

	return true
end

local sync_event_orig = GroupAIStateBase.sync_event
function GroupAIStateBase:sync_event(event_id, ...)
	local event_name = self.EVENT_SYNC[event_id]
	if table.contains(self.MEGAPHONE_EVENTS, event_name) then
		self:_post_megaphone_event(event_name)
	elseif event_name ~= "cloaker_spawned" then
		return sync_event_orig(self, event_id, ...)
	end
end

-- Fix this function doing nothing
function GroupAIStateBase:_merge_coarse_path_by_area(coarse_path)
	local i_nav_seg = #coarse_path
	local area, last_area
	while i_nav_seg > 0 and #coarse_path > 2 do
		area = self:get_area_from_nav_seg_id(coarse_path[i_nav_seg][1])
		if last_area and last_area == area then
			table.remove(coarse_path, i_nav_seg)
		else
			last_area = area
		end
		i_nav_seg = i_nav_seg - 1
	end
end

-- Make specials not take up importance slots (they're already always counted as important)
local set_importance_weight_original = GroupAIStateBase.set_importance_weight
function GroupAIStateBase:set_importance_weight(u_key, ...)
	if self._police[u_key] and self._police[u_key].unit:brain()._forced_important then
		return
	end
	return set_importance_weight_original(self, u_key, ...)
end

-- Don't count recon as assault force and vice versa
function GroupAIStateBase:_count_police_force(task_name)
	local amount = 0
	local objective_type = task_name .. "_area"
	for _, group in pairs(self._groups) do
		if group.objective.type == objective_type then
			amount = amount + (group.has_spawned and group.size or group.initial_size)
		end
	end
	return amount
end
