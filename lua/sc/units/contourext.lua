local is_pro_job = Global.game_settings and Global.game_settings.one_down

ContourExt._types.medic_show = {
	priority = 2,
	material_swap_required = true,
	fadeout = 2,
	color = tweak_data.contour.character.dangerous_color
}
ContourExt._types.omnia_heal = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = Vector3(128, 0, 128)
}
ContourExt._types.medic_buff = {
	priority = 1,
	material_swap_required = true,
	fadeout = 2,
	color = Vector3(255, 140, 0)
}
ContourExt._types.deployable_blackout = { --for autumn's deployable disabling ability
	priority = 1,
	color = Vector3(0.5,0,1)
}
ContourExt._types.mark_enemy_sixth_sense = { -- 6th sense still will be useful with new PJ contours changes
	fadeout = 4.5,
	priority = 5,
	material_swap_required = true,
	fadeout_silent = 13.5,
	--trigger_marked_event = true,
	color = tweak_data.contour.character.dangerous_color
}
ContourExt._types.mark_enemy.priority = 6 -- Need lower priority for new 6th sense outline

-- PJ modifier: Marked enemy will show contour only in LoS (unless you using any marking skills); Medic and LPF flash outlines are disabled;
if is_pro_job then
	ContourExt._types.mark_enemy.ray_check_reverse = true
	--ContourExt._types.mark_unit.ray_check_reverse = true
	ContourExt._types.medic_show.color = Vector3(0,0,0)
	ContourExt._types.medic_show.priority = 10
	ContourExt._types.omnia_heal.color = Vector3(0,0,0)
	ContourExt._types.omnia_heal.priority = 10
end

Hooks:OverrideFunction(ContourExt, "add", function(self,type, sync, multiplier, override_color, is_element)
local disable_outlines = managers.mutators:modify_value("ContourExt:DisableOutlines", false)
local do_outline = true
local enemy_contours = {
	"friendly",
	"mark_enemy",
	"mark_enemy_damage_bonus",
	"mark_enemy_damage_bonus_distance",
	"mark_unit_dangerous",
	"mark_unit_dangerous_damage_bonus",
	"mark_unit_dangerous_damage_bonus_distance"
}
if disable_outlines then
	do_outline = false
	local disable_enemy_outlines = managers.mutators:modify_value("ContourExt:DisableEnemyOutlines", false)
	if disable_outlines and not disable_enemy_outlines then
		for _, enemy_contour in ipairs(enemy_contours) do
			if type == enemy_contour then
				do_outline = true
			end	
		end		
	end
end

if do_outline then
	self._contour_list = self._contour_list or {}
	local data = self._types[type]
	local fadeout = data.fadeout

	if data.fadeout_silent and managers.groupai:state():whisper_mode() then
		fadeout = data.fadeout_silent
	end

	if fadeout and multiplier then
		fadeout = fadeout * multiplier
	end
	
	if fadeout and self.fadeout_start_percent ~= nil then
		local fadeout_start_t_dummy = math.lerp(TimerManager:game():time(), fadeout and TimerManager:game():time() + fadeout or 0, self.fadeout_start_percent)
		local fadeout_length_dummy = fadeout - fadeout_start_t_dummy
	end
	
	sync = sync and not self._is_child_contour or false

	if sync then
		local sync_unit = self._unit
		local u_id = self._unit:id()

		if u_id == -1 then
			sync_unit, u_id = nil
			local corpse_data = managers.enemy:get_corpse_unit_data_from_key(self._unit:key())

			if corpse_data then
				u_id = corpse_data.u_id
			end
		end

		if u_id then
			managers.network:session():send_to_peers_synched("sync_contour_add", sync_unit, u_id, table.index_of(ContourExt.indexed_types, type), multiplier or 1)
		else
			sync = nil

			Application:error("[ContourExt:add] Unit isn't network-synced and isn't a registered corpse, can't sync. ", self._unit)
		end
	end

	for _, setup in ipairs(self._contour_list) do
		if setup.type == type then
			if fadeout then
				setup.fadeout_t = TimerManager:game():time() + fadeout
				if self.fadeout_start_percent ~= nil then
					setup.fadeout_start_t = math.lerp(TimerManager:game():time(), setup.fadeout_t, self.fadeout_start_percent)
					setup.fadeout_length = setup.fadeout_t - setup.fadeout_start_t
				end
			elseif not setup.data.unique then
				setup.ref_c = setup.ref_c + 1
			end

			if is_element then
				setup.ref_c_element = (setup.ref_c_element or 0) + 1
			end

			local old_color = setup.color or data.color
			setup.color = override_color or nil

			if old_color ~= override_color then
				self:_upd_color()
			end

			return setup
		end
	end

	if not self._removed_occlusion then
		self._removed_occlusion = true

		managers.occlusion:remove_occlusion(self._unit)
	end

	local setup = {
		ref_c = 1,
		type = type,
		ref_c_element = is_element and 1 or nil,
		sync = sync,
		fadeout_t = fadeout and TimerManager:game():time() + fadeout or nil,
		fadeout_start_t = fadeout_start_t_dummy or nil,
		fadeout_length = fadeout_length_dummy or nil,
		color = override_color or nil,
		data = data
	}

	if data.ray_check then
		setup.upd_skip_count = ContourExt.raycast_update_skip_count
		local mov_ext = self._unit:movement()

		if mov_ext and mov_ext.m_com then
			setup.ray_pos = mov_ext:m_com()
		end
	end
	
	if data.ray_check_reverse then
		setup.upd_skip_count_reverse = ContourExt.raycast_update_skip_count
		local mov_ext = self._unit:movement()

		if mov_ext and mov_ext.m_com then
			setup.ray_pos_reverse = mov_ext:m_com()
		end
	end

	local i = 1
	local contour_list = self._contour_list
	local old_preset_type = contour_list[1] and contour_list[1].type

	while contour_list[i] and contour_list[i].data.priority <= data.priority do
		i = i + 1
	end

	table.insert(contour_list, i, setup)

	if not old_preset_type or i == 1 and old_preset_type ~= setup.type then
		self:_apply_top_preset()
	end

	if not self._update_enabled then
		self:_chk_update_state()
	end

	if data.damage_bonus or data.damage_bonus_distance then
		self:_chk_damage_bonuses()
	end

	if data.trigger_marked_event then
		self:_chk_mission_marked_events(setup)
	end
	
	--Compatibility for Smooth Contours
	if self.fadeout_start_percent ~= nil then
		local removed_occlusion = self._removed_occlusion
	
		if setup.fadeout_t then
			setup.fadeout_start_t = math.lerp(TimerManager:game():time(), setup.fadeout_t, self.fadeout_start_percent)
			setup.fadeout_length = setup.fadeout_t - setup.fadeout_start_t
		end

		if not removed_occlusion and self._removed_occlusion then
			self:_set_allow_occlusion(false)
		end
	end

	self:apply_to_linked("add", type, false, multiplier, override_color)

	return setup
end
end)

Hooks:OverrideFunction(ContourExt, "update", function(self,unit, t, dt)	
if self.fadeout_start_percent == nil then -- for Vanilla Contours
	local index = 1
	local setup, cam_pos, is_current = nil
	local ray_check_slotmask = self._slotmask_world_geometry
	while self._contour_list and index <= #self._contour_list do
		setup = self._contour_list[index]
		is_current = index == 1

		if setup.fadeout_t and setup.fadeout_t < t then
			self:remove(setup.type, false, false)
		else
			index = index + 1
			local turn_off = nil

			if is_current and setup.data.ray_check then
				if setup.upd_skip_count > 0 then
					setup.upd_skip_count = setup.upd_skip_count - 1

					if self._last_opacity == 0 then
						turn_off = true
					else
						turn_off = false
					end
				else
					setup.upd_skip_count = ContourExt.raycast_update_skip_count
					local turn_on = false
					cam_pos = cam_pos or managers.viewport:get_current_camera_position()

					if cam_pos then
						local ray_pos = setup.ray_pos

						if not ray_pos then
							ray_pos = Vector3()

							unit:m_position(ray_pos)
						end

						turn_on = mvector3.distance_sq(cam_pos, ray_pos) > 16000000 or unit:raycast("ray", cam_pos, ray_pos, "slot_mask", ray_check_slotmask, "report")
					end

					if setup.data.persistence then
						if turn_on then
							setup.last_turned_on_t = t
						else
							local last_t = setup.last_turned_on_t

							if not last_t or setup.data.persistence < t - last_t then
								turn_off = true
								setup.last_turned_on_t = nil
							end
						end
					else
						turn_off = not turn_on
					end
				end
			end
			--for PJ
			if is_current and setup.data.ray_check_reverse and not managers.groupai:state():whisper_mode() then
				if setup.upd_skip_count_reverse > 0 then
					setup.upd_skip_count_reverse = setup.upd_skip_count_reverse - 1

					if self._last_opacity == 0 then
						turn_off = false
					else
						turn_off = true
					end	
				else
					setup.upd_skip_count_reverse = ContourExt.raycast_update_skip_count
					local turn_on = false
					cam_pos = cam_pos or managers.viewport:get_current_camera_position()

					if cam_pos then
						local ray_pos = setup.ray_pos_reverse

						if not ray_pos then
							ray_pos = Vector3()

							unit:m_position(ray_pos)
						end

						turn_on = mvector3.distance_sq(cam_pos, ray_pos) > 16000000 or unit:raycast("ray", cam_pos, ray_pos, "slot_mask", ray_check_slotmask, "report")
					end
					if setup.data.persistence then
						if turn_on then
							setup.last_turned_on_t = t
						else
							local last_t = setup.last_turned_on_t

							if not last_t or setup.data.persistence < t - last_t then
								turn_off = true
								setup.last_turned_on_t = nil
							end
						end
					else
						turn_off = not turn_on
					end
				end
			end

			if setup.flash_t then
				local flash = setup.flash_on

				if setup.flash_t < t then
					setup.flash_t = setup.flash_t + setup.flash_frequency
					flash = not flash
					setup.flash_on = flash
				end

				turn_off = turn_off or not flash
			end

			if is_current then
				if setup.data.ray_check_reverse and not managers.groupai:state():whisper_mode() then
					if turn_off then
						self:_upd_opacity(self.mod_lerp_opacity and setup.fadeout_t and math.lerp(1, 0, t / setup.fadeout_t) or 1)	
					else
						self:_upd_opacity(0)
					end
				else
					if turn_off then
						self:_upd_opacity(0)	
					else
						self:_upd_opacity(self.mod_lerp_opacity and setup.fadeout_t and math.lerp(1, 0, t / setup.fadeout_t) or 1)
					end
				end
			end
		end
	end
else -- for Smooth Contours
	self._materials = nil -- lod changes seem to break the material cache, so i'm just refreshing it every frame

	local index = 1
	while self._contour_list and index <= #self._contour_list do
		local setup = self._contour_list[index]
		if setup.fadeout_t and setup.fadeout_t < t then
			self:_remove(index)
		else
			local data = setup.data
			local is_current = index == 1
			local opacity = nil
			if is_current and data.ray_check then
				local turn_on = nil
				local cam_pos = managers.viewport:get_current_camera_position()
				if cam_pos then
					turn_on = mvector3.distance_sq(cam_pos, unit:movement():m_com()) > 16000000
					turn_on = turn_on or unit:raycast("ray", unit:movement():m_com(), cam_pos, "slot_mask", self._slotmask_world_geometry, "report")
				end

				local target_opacity = turn_on and 1 or 0
				if data.persistence then
					opacity = math.step(self._last_opacity or 0, target_opacity, dt / data.persistence)
				else
					opacity = target_opacity
				end
			end
			-- for PJ
			if is_current and data.ray_check_reverse and not managers.groupai:state():whisper_mode() then
				local turn_on = nil
				local cam_pos = managers.viewport:get_current_camera_position()
				if cam_pos then
					turn_on = mvector3.distance_sq(cam_pos, unit:movement():m_com()) > 16000000
					turn_on = turn_on or unit:raycast("ray", unit:movement():m_com(), cam_pos, "slot_mask", self._slotmask_world_geometry, "report")
				end

				turn_off = not turn_on
				local target_opacity = turn_on and 1 or 0
				if data.persistence then
					opacity = math.step(self._last_opacity or 0, target_opacity, dt / data.persistence)
				else
					opacity = target_opacity
					turn_off = not turn_on
				end
			end


			if setup.flash_t then
				if t > setup.flash_t then
					setup.flash_t = t + setup.flash_frequency
					setup.flash_on = not setup.flash_on
					turn_off = turn_off or not setup.flash_on
				end

				if is_current then
					opacity = (setup.flash_t - t) / setup.flash_frequency
					opacity = setup.flash_on and 1 - opacity or opacity
				end
			elseif is_current and setup.fadeout_start_t then
				opacity = (t - setup.fadeout_start_t) / setup.fadeout_length
				opacity = 1 - math.max(opacity, 0)
				
			end
			
			

			if opacity then
				if data.ray_check_reverse and not managers.groupai:state():whisper_mode() then
					if turn_off then
						self:_upd_opacity(opacity)	
					else
						self:_upd_opacity(0)
					end
				else
					self:_upd_opacity(opacity)
				end
			end

			index = index + 1
		end
	end
end
end)