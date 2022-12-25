local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local t_rem = table.remove
local t_ins = table.insert
local tmp_vec1 = Vector3()
local world_g = World

function EnemyManager:_update_queued_tasks(t, dt)
	local i_asap_task, asap_task_t = nil

	if managers.groupai:state():whisper_mode() then
		for i_task, task_data in ipairs(self._queued_tasks) do
			if not task_data.t or task_data.t < t then
				self:_execute_queued_task(i_task)
			elseif task_data.asap then
				if not asap_task_t or task_data.t < asap_task_t then
					i_asap_task = i_task
					asap_task_t = task_data.t
				end
			end
		end
	else
		self._queue_buffer = self._queue_buffer + dt
		local tick_rate = tweak_data.group_ai.ai_tick_rate

		if tick_rate <= self._queue_buffer then
			for i_task, task_data in ipairs(self._queued_tasks) do
				if not task_data.t or task_data.t < t then
					self:_execute_queued_task(i_task)

					self._queue_buffer = self._queue_buffer - tick_rate

					if self._queue_buffer <= 0 then
						break
					end
				elseif task_data.asap then
					if not asap_task_t or task_data.t < asap_task_t then
						i_asap_task = i_task
						asap_task_t = task_data.t
					end
				end
			end
		end

		if #self._queued_tasks == 0 then
			self._queue_buffer = 0
		end
	end

	if i_asap_task and not self._queued_task_executed then
		self:_execute_queued_task(i_asap_task)
	end

	local all_clbks = self._delayed_clbks

	if all_clbks[1] and all_clbks[1][2] < t then
		local clbk = t_rem(all_clbks, 1)[3]

		clbk()
	end
end

function EnemyManager:get_nearby_medic(unit)
	if self:is_civilian(unit) then
		return nil
	end

	local enemies = nil

	if unit:base()._tweak_table == "taser_summers" or unit:base()._tweak_table == "boom_summers" then
		enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.radius_summers, managers.slot:get_mask("enemies"))

		for _, enemy in ipairs(enemies) do
			if enemy:base():has_tag("medic_summers_special") and enemy:base():has_tag("custom") then
				return enemy
			end
		end
	elseif unit:base()._tweak_table == "summers" then
		enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.radius_summers, managers.slot:get_mask("enemies"))

		for _, enemy in ipairs(enemies) do
			if enemy:base():has_tag("medic_summers") and enemy:base():has_tag("custom") then
				return enemy
			end
		end
	elseif unit:base()._tweak_table ~= "medic_summers" then
		enemies = World:find_units_quick(unit, "sphere", unit:position(), tweak_data.medic.radius, managers.slot:get_mask("enemies"))

		for _, enemy in ipairs(enemies) do
			if enemy:base():has_tag("medic")then
				return enemy
			end
		end
	end

	return nil
end

function EnemyManager:start_autumn_blackout()
	--deprecated
	restoration.log_shit("SC: HEY YOU!!!!!!!!!!!! YOU CALLED EnemyManager:start_autumn_blackout(), DON'T DO THAT!! use groupaistate:do_blackout(true) or related functions instead!")
end

function EnemyManager:end_autumn_blackout()
	--deprecated
	restoration.log_shit("SC: HEY YOU!!!!!!!!!!!! YOU CALLED EnemyManager:end_autumn_blackout(), DON'T DO THAT!! use groupaistate:do_blackout(false) or related functions instead!")
end

function EnemyManager:_update_gfx_lod()
	if self._gfx_lod_data.enabled and managers.navigation:is_data_ready() then
		local player = managers.player:player_unit()
		local pl_tracker, cam_pos, cam_fwd = nil

		if player then
			pl_tracker = player:movement():nav_tracker()
			cam_pos = player:movement():m_head_pos()
			cam_fwd = player:camera():forward()
		elseif managers.viewport:get_current_camera() then
			cam_pos = managers.viewport:get_current_camera_position()
			cam_fwd = managers.viewport:get_current_camera_rotation():y()
		end

		if cam_fwd then
			local entries = self._gfx_lod_data.entries
			local units = entries.units
			local states = entries.states
			local move_ext = entries.move_ext
			local trackers = entries.trackers
			local com = entries.com
			local chk_vis_func = pl_tracker and pl_tracker.check_visibility
			local unit_occluded = Unit.occluded
			local occ_skip_units = managers.occlusion._skip_occlusion
			local world_in_view_with_options = world_g.in_view_with_options

			for i, state in ipairs(states) do
				if not state and alive(units[i]) then
					local visible = nil

					if occ_skip_units[units[i]:key()] then
						visible = true
					elseif not unit_occluded(units[i]) then
						if not pl_tracker or chk_vis_func(pl_tracker, trackers[i]) then
							visible = true
						end
					end

					if visible and world_in_view_with_options(world_g, com[i], 0, 110, 18000) then
						states[i] = 1

						units[i]:base():set_visibility_state(1)
					end
				end
			end

			if #states > 0 then
				local anim_lod = managers.user:get_setting("video_animation_lod")
				local nr_lod_1 = self._nr_i_lod[anim_lod][1]
				local nr_lod_2 = self._nr_i_lod[anim_lod][2]
				local nr_lod_total = nr_lod_1 + nr_lod_2
				local imp_i_list = self._gfx_lod_data.prio_i
				local imp_wgt_list = self._gfx_lod_data.prio_weights
				local nr_entries = #states
				local i = self._gfx_lod_data.next_chk_prio_i

				if nr_entries < i then
					i = 1
				end

				local start_i = i

				repeat
					if states[i] and alive(units[i]) then
						local not_visible = nil

						if not occ_skip_units[units[i]:key()] then
							if unit_occluded(units[i]) or pl_tracker and not chk_vis_func(pl_tracker, trackers[i]) then
								not_visible = true
							end
						end

						if not_visible then
							states[i] = false

							units[i]:base():set_visibility_state(false)
							self:_remove_i_from_lod_prio(i, anim_lod)

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						elseif not world_in_view_with_options(world_g, com[i], 0, 120, 18000) then
							states[i] = false

							units[i]:base():set_visibility_state(false)
							self:_remove_i_from_lod_prio(i, anim_lod)

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						else
							local my_wgt = mvec3_dir(tmp_vec1, cam_pos, com[i])
							local dot = mvec3_dot(tmp_vec1, cam_fwd)
							local previous_prio = nil

							for prio, i_entry in ipairs(imp_i_list) do
								if i == i_entry then
									previous_prio = prio

									break
								end
							end

							my_wgt = my_wgt * my_wgt * (1 - dot)
							local i_wgt = #imp_wgt_list

							while i_wgt > 0 do
								if previous_prio ~= i_wgt and imp_wgt_list[i_wgt] <= my_wgt then
									break
								end

								i_wgt = i_wgt - 1
							end

							if not previous_prio or i_wgt <= previous_prio then
								i_wgt = i_wgt + 1
							end

							if i_wgt ~= previous_prio then
								if previous_prio then
									t_rem(imp_i_list, previous_prio)
									t_rem(imp_wgt_list, previous_prio)

									if previous_prio <= nr_lod_1 and nr_lod_1 < i_wgt and nr_lod_1 <= #imp_i_list then
										local promote_i = imp_i_list[nr_lod_1]
										states[promote_i] = 1

										units[promote_i]:base():set_visibility_state(1)
									elseif nr_lod_1 < previous_prio and i_wgt <= nr_lod_1 then
										local denote_i = imp_i_list[nr_lod_1]
										states[denote_i] = 2

										units[denote_i]:base():set_visibility_state(2)
									end
								elseif i_wgt <= nr_lod_total and #imp_i_list == nr_lod_total then
									local kick_i = imp_i_list[nr_lod_total]
									states[kick_i] = 3

									units[kick_i]:base():set_visibility_state(3)
									t_rem(imp_wgt_list)
									t_rem(imp_i_list)
								end

								local lod_stage = nil

								if i_wgt <= nr_lod_total then
									t_ins(imp_wgt_list, i_wgt, my_wgt)
									t_ins(imp_i_list, i_wgt, i)

									if i_wgt <= nr_lod_1 then
										lod_stage = 1
									else
										lod_stage = 2
									end
								else
									lod_stage = 3

									self:_remove_i_from_lod_prio(i, anim_lod)
								end

								if states[i] ~= lod_stage then
									states[i] = lod_stage

									units[i]:base():set_visibility_state(lod_stage)
								end
							end

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						end
					end

					if i == nr_entries then
						i = 1
					else
						i = i + 1
					end
				until i == start_i
			end
		end
	end
end

function EnemyManager:set_gfx_lod_enabled(state)
	if state then
		self._gfx_lod_data.enabled = state
	elseif self._gfx_lod_data.enabled then
		self._gfx_lod_data.enabled = state
		local entries = self._gfx_lod_data.entries
		local units = entries.units
		local states = entries.states

		for i, lod_stage in ipairs(states) do
			if not lod_stage or lod_stage ~= 1 then
				if alive(units[i]) then
					states[i] = 1

					units[i]:base():set_visibility_state(1)
				end
			end
		end
	end
end

function EnemyManager:chk_any_unit_in_slotmask_visible(slotmask, cam_pos, cam_nav_tracker)
	if self._gfx_lod_data.enabled and managers.navigation:is_data_ready() then
		local entries = self._gfx_lod_data.entries
		local units = entries.units
		local states = entries.states
		local trackers = entries.trackers
		local move_exts = entries.move_ext
		local com = entries.com
		local chk_vis_func = cam_nav_tracker and cam_nav_tracker.check_visibility
		local unit_occluded = Unit.occluded
		local occ_skip_units = managers.occlusion._skip_occlusion
		local vis_slotmask = managers.slot:get_mask("AI_visibility")

		for i, state in ipairs(states) do
			if alive(units[i]) then
				local unit = units[i]

				if unit:in_slot(slotmask) then
					local proceed = nil

					if occ_skip_units[unit:key()] then
						proceed = true
					elseif not unit_occluded(unit) then
						if not cam_nav_tracker or chk_vis_func(cam_nav_tracker, trackers[i]) then
							proceed = true
						end
					end

					if proceed then
						local distance = mvec3_dis(cam_pos, com[i])

						if distance < 300 then
							return true
						elseif distance < 2000 then
							local u_m_head_pos = move_exts[i]:m_head_pos()
							local ray = world_g:raycast("ray", cam_pos, u_m_head_pos, "slot_mask", vis_slotmask, "report")

							if not ray then
								return true
							else
								ray = world_g:raycast("ray", cam_pos, com[i], "slot_mask", vis_slotmask, "report")

								if not ray then
									return true
								end
							end
						end
					end
				end
			end
		end
	end
end

Hooks:PostHook(EnemyManager, "on_enemy_died", "ResOnEnemyDied", function(self, dead_unit)
	if Network:is_server() and managers.mutators:is_mutator_active(MutatorBirthday) and dead_unit:base():has_tag("special") and managers.mutators:is_mutator_active(MutatorBirthday) then
		local birthday_mutator = managers.mutators:get_mutator(MutatorBirthday)

		birthday_mutator:on_special_killed(dead_unit)
	end
	
	if managers.mutators:is_mutator_active(MutatorCG22) and dead_unit:base():has_tag("snowman") then
		local cg22_mutator = managers.mutators:get_mutator(MutatorCG22)

		cg22_mutator:on_snowman_killed(dead_unit, damage_info)
	end
	
end)