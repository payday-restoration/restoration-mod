if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function EnemyManager:add_magazine(magazine, collision)
		self._magazines = self._magazines or {}
		table.insert(self._magazines, {magazine, collision})
	end

	function EnemyManager:shield_limit()
		return self:corpse_limit()
	end

	function EnemyManager:get_nearby_medic(unit)
		if self:is_civilian(unit) then
			return nil
		end
		local enemies
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
	
	--for internal testing only
	function EnemyManager:start_autumn_blackout()
		local all_eq = World:find_units_quick("all",14,25,26)
		for k,unit in pairs(all_eq) do 
			if unit:base() then 
				unit:base().blackout_active = true
			end
			if unit.contour and unit:contour() then 
				unit:contour():add("deployable_blackout")
			end
		end
	end
	
	--lol idk where to put this so i guess it goes in enemymanager
	--this function is called on autumn's death, and removes the un-interactable blackout effect on all deployables
	function EnemyManager:end_autumn_blackout()
		local all_eq = World:find_units_quick("all",14,25,26)
		for k,unit in pairs(all_eq) do 
			if unit:base() then 
				unit:base().blackout_active = false
			end
			if unit.contour and unit:contour() then 
				unit:contour():remove("deployable_blackout")
			end
		end
	end
	
	function EnemyManager:_update_gfx_lod()
	if self._gfx_lod_data.enabled and managers.navigation:is_data_ready() and dont then --dont for testing purposes
		local camera_rot = managers.viewport:get_current_camera_rotation()

		if camera_rot then
			local pl_tracker, cam_pos = nil
			local pl_fwd = camera_rot:y()
			local player = managers.player:player_unit()

			if player then
				pl_tracker = player:movement():nav_tracker()
				cam_pos = player:movement():m_head_pos()
			else
				pl_tracker = false
				cam_pos = managers.viewport:get_current_camera_position()
			end

			local entries = self._gfx_lod_data.entries
			local units = entries.units
			local states = entries.states
			local move_ext = entries.move_ext
			local trackers = entries.trackers
			local com = entries.com
			local chk_vis_func = pl_tracker and pl_tracker.check_visibility
			local unit_occluded = Unit.occluded
			local occ_skip_units = managers.occlusion._skip_occlusion
			local world_in_view_with_options = World.in_view_with_options

			for i, state in ipairs(states) do
				if not state and alive(units[i]) and (occ_skip_units[units[i]:key()] or (not pl_tracker or chk_vis_func(pl_tracker, trackers[i])) and not unit_occluded(units[i])) and world_in_view_with_options(World, com[i], 0, 110, 18000) then
					states[i] = 1

					units[i]:base():set_visibility_state(1)
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
						if not occ_skip_units[units[i]:key()] and (pl_tracker and not chk_vis_func(pl_tracker, trackers[i]) or unit_occluded(units[i])) then
							states[i] = false

							units[i]:base():set_visibility_state(false)
							self:_remove_i_from_lod_prio(i, anim_lod)

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						elseif not world_in_view_with_options(World, com[i], 0, 120, 18000) then
							states[i] = false

							units[i]:base():set_visibility_state(false)
							self:_remove_i_from_lod_prio(i, anim_lod)

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						else
							local my_wgt = mvec3_dir(tmp_vec1, cam_pos, com[i])
							local dot = mvec3_dot(tmp_vec1, pl_fwd)
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

									lod_stage = i_wgt <= nr_lod_1 and 1 or 2
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
	
end
