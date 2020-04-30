local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_dot = mvector3.dot
local mvec3_copy = mvector3.copy
local mvec3_norm = mvector3.normalize
local math_min = math.min
local math_lerp = math.lerp
local math_up = math.UP
local temp_vec2 = Vector3()

CopActionTase._ik_presets = CopActionShoot._ik_presets
CopActionTase._get_transition_target_pos = CopActionShoot._get_transition_target_pos
CopActionTase._get_target_pos = CopActionShoot._get_target_pos
CopActionTase.set_ik_preset = CopActionShoot.set_ik_preset
CopActionTase._begin_ik_spine = CopActionShoot._begin_ik_spine
CopActionTase._get_blend_ik_spine = CopActionShoot._get_blend_ik_spine
CopActionTase._begin_ik_r_arm = CopActionShoot._begin_ik_r_arm
CopActionTase._stop_ik_r_arm = CopActionShoot._stop_ik_r_arm
CopActionTase._stop_ik_spine = CopActionShoot._stop_ik_spine
CopActionTase._get_blend_ik_r_arm = CopActionShoot._get_blend_ik_r_arm
CopActionTase._set_ik_updator = CopActionShoot._set_ik_updator

function CopActionTase:clbk_malfunction()
	self._malfunction_clbk_id = nil

	if self._expired then
		return
	end

	World:effect_manager():spawn({
		effect = Idstring("effects/payday2/particles/character/taser_stop"),
		position = self._ext_movement:m_com(),
		normal = math_up
	})

	local attacker_pos = managers.player:player_unit() and managers.player:player_unit():movement():m_head_pos() or self._ext_movement:m_com() + self._ext_movement:m_rot():y() * 100
	local counter_ray = World:raycast("ray", attacker_pos, self._ext_movement:m_com(), "sphere_cast_radius", 20, "target_unit", self._unit)
	local action_data = {
		damage_effect = 1,
		damage = 0,
		variant = "counter_spooc",
		attacker_unit = managers.player:player_unit() or self._unit,
		col_ray = counter_ray,
		attack_dir = counter_ray.ray,
	}

	self._unit:character_damage():damage_melee(action_data)
end

function CopActionTase:init(action_desc, common_data)
	self._common_data = common_data
	self._unit = common_data.unit
	self._ext_base = common_data.ext_base
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_brain = common_data.ext_brain
	self._ext_inventory = common_data.ext_inventory
	self._body_part = action_desc.body_part
	self._machine = common_data.machine
	self._is_server = Network:is_server()
	local attention = common_data.attention

	if not attention or not attention.unit then
		if self._is_server then
			--debug_pause("[CopActionTase:init] no attention", inspect(action_desc))

			return
		end
	end

	local weapon_unit = self._ext_inventory:equipped_unit()

	if not weapon_unit then
		return
	end

	self._weapon_unit = weapon_unit
	self._weapon_base = weapon_unit:base()

	local weap_tweak = weapon_unit:base():weapon_tweak_data()
	local weapon_usage_tweak = common_data.char_tweak.weapon[weap_tweak.usage]
	self._weap_tweak = weap_tweak
	self._w_usage_tweak = weapon_usage_tweak
	self._falloff = weapon_usage_tweak.FALLOFF or {
		{
			dmg_mul = 1,
			r = 1500,
			acc = {
				0.2,
				0.6
			},
			recoil = {
				0.45,
				0.8
			},
			mode = {
				1,
				3,
				3,
				1
			}
		}
	}
	self._tase_distance = weapon_usage_tweak.tase_distance or 1500
	self._aim_delay_minmax = weapon_usage_tweak.aim_delay_tase or {1, 1}
	self._sphere_radius = weapon_usage_tweak.tase_sphere_cast_radius or 30
	self._line_of_fire_slotmask = managers.slot:get_mask("world_geometry", "vehicles", "enemy_shield_check")
	self._weapon_obj_fire = weapon_unit:get_object(Idstring("fire"))
	self._shield = alive(self._ext_inventory._shield_unit) and self._ext_inventory._shield_unit or nil
	self._firing_at_husk = action_desc.firing_at_husk or nil

	local shoot_from_pos = self._ext_movement:m_head_pos()
	self._shoot_from_pos = shoot_from_pos

	if self._is_server then
		self._ext_movement:set_stance_by_code(3)
	else
		self._turn_allowed = true
	end

	local preset_name = self._ext_anim.base_aim_ik or "spine"
	local preset_data = self._ik_presets[preset_name]
	self._ik_preset = preset_data
	self[preset_data.start](self)

	self:on_attention(attention)

	CopActionAct._create_blocks_table(self, action_desc.block_desc)

	self._skipped_frames = 1

	return true
end

function CopActionTase:on_attention(attention)
	if self._expired then
		self._attention = attention

		return
	end

	local needs_to_expire = nil

	if self._is_server then
		if self._attention then
			needs_to_expire = true
		end
	elseif self._client_attention_set or not attention or not attention.unit then
		needs_to_expire = true
	end

	if needs_to_expire then
		self[self._ik_preset.stop](self)

		if self._aim_transition then
			self._aim_transition = nil
			self._get_target_pos = nil
		end

		if self._discharging then
			self._tasing_local_unit:movement():on_tase_ended()

			self._discharging = nil
		end

		if self._tasing_local_unit and self._tasing_player then
			self._tasing_local_unit:movement():on_targetted_for_attack(false, self._unit)
		end

		self._tasing_player = nil
		self._tasing_local_unit = nil
		self._discharging_on_husk = nil
		self._firing_at_husk = nil
		self.update = self._upd_empty
		self._attention = attention

		if self._is_server then
			self._expired = true
		end

		return
	end

	if not self._is_server then
		self._client_attention_set = true
	end

	local t = TimerManager:game():time()

	self[self._ik_preset.start](self)

	local vis_state = self._ext_base:lod_stage()

	if vis_state and vis_state < 3 and self[self._ik_preset.get_blend](self) > 0 then
		self._aim_transition = {
			duration = 0.333,
			start_t = t,
			start_vec = mvec3_copy(self._common_data.look_vec)
		}
		self._get_target_pos = self._get_transition_target_pos
	else
		self._aim_transition = nil
		self._get_target_pos = nil
	end

	self._mod_enable_t = t + 0.5

	self.update = nil
	self._attention = attention

	local shoot_delay = 0
	local aim_delay_minmax = self._aim_delay_minmax

	if aim_delay_minmax[1] ~= 0 or aim_delay_minmax[2] ~= 0 then
		if aim_delay_minmax[1] == aim_delay_minmax[2] then
			shoot_delay = aim_delay_minmax[1]
		else
			local _, __, target_dis = self:_get_target_pos(self._shoot_from_pos, self._attention, t)
			local lerp_dis = math_min(1, target_dis / self._falloff[#self._falloff].r)

			shoot_delay = math_lerp(aim_delay_minmax[1], aim_delay_minmax[2], lerp_dis)
		end
	end

	self._tasing_local_unit = nil
	self._tasing_player = nil

	local attention_unit = attention.unit

	if self._is_server then
		self._common_data.ext_network:send("action_tase_event", 1)

		if not attention_unit:base().is_husk_player then
			self._shoot_t = self._mod_enable_t + shoot_delay
			self._tasing_local_unit = attention_unit
			self._tasing_player = attention_unit:base().is_local_player and true or nil
		end
	elseif attention_unit:base().is_local_player then
		self._shoot_t = self._mod_enable_t + shoot_delay
		self._tasing_local_unit = attention_unit
		self._tasing_player = true
	end

	if self._tasing_local_unit and self._tasing_player then
		self._tasing_local_unit:movement():on_targetted_for_attack(true, self._unit)
	end
end

function CopActionTase:on_exit()
	if self._modifier_on then
		self[self._ik_preset.stop](self)
	end

	if self._tase_effect then
		World:effect_manager():fade_kill(self._tase_effect)
	end

	if self._discharging then
		self._tasing_local_unit:movement():on_tase_ended()
	end

	self._discharging_on_husk = nil
	self._firing_at_husk = nil

	if self._is_server then
		local exit_to_hos_stance = nil

		if not self._attention or not self._attention.reaction or self._attention.reaction < AIAttentionObject.REACT_AIM then
			exit_to_hos_stance = true
		end

		if exit_to_hos_stance then
			self._ext_movement:set_stance_by_code(2)
		end

		self._unit:network():send("action_tase_event", 2)

		if exit_to_hos_stance and self._expired then
			self._ext_movement:action_request({
				body_part = 3,
				type = "idle"
			})
		end
	end

	if self._tasered_sound then
		self._tasered_sound:stop()
		self._unit:sound():play("tasered_3rd_stop", nil)
	end

	if self._tasing_local_unit and self._tasing_player then
		self._tasing_local_unit:movement():on_targetted_for_attack(false, self._unit)
	end

	if self._malfunction_clbk_id then
		managers.enemy:remove_delayed_clbk(self._malfunction_clbk_id)

		self._malfunction_clbk_id = nil
	end
end

function CopActionTase:update(t)
	if self._expired then
		return
	end

	local vis_state = self._ext_base:lod_stage()
	vis_state = vis_state or 4

	if not self._discharging and vis_state ~= 1 then
		if self._skipped_frames < vis_state * 3 then
			self._skipped_frames = self._skipped_frames + 1

			return
		else
			self._skipped_frames = 1
		end
	end

	local target_pos, target_vec, target_dis = nil

	if self._attention then
		target_pos, target_vec, target_dis = self:_get_target_pos(self._shoot_from_pos, self._attention, t)
		local tar_vec_flat = temp_vec2

		mvec3_set(tar_vec_flat, target_vec)
		mvec3_set_z(tar_vec_flat, 0)
		mvec3_norm(tar_vec_flat)

		local fwd = self._common_data.fwd
		local fwd_dot = mvec3_dot(fwd, tar_vec_flat)

		if self._turn_allowed then
			local active_actions = self._common_data.active_actions

			if not active_actions[2] or active_actions[2]:type() == "idle" then
				local queued_actions = self._common_data.queued_actions

				if not queued_actions or not queued_actions[1] and not queued_actions[2] then
					if not self._ext_movement:chk_action_forbidden("turn") then
						local fwd_dot_flat = mvec3_dot(tar_vec_flat, fwd)

						if fwd_dot_flat < 0.96 then
							local spin = tar_vec_flat:to_polar_with_reference(fwd, math_up).spin
							local new_action_data = {
								body_part = 2,
								type = "turn",
								angle = spin
							}

							self._ext_movement:action_request(new_action_data)
						end
					end
				end
			end
		end

		target_vec = self:_upd_ik(target_vec, fwd_dot, t)
	end

	if not self._ext_anim.reload and not self._ext_anim.equip and not self._ext_anim.melee then
		if self._firing_at_husk then
			if self._attention.unit:movement():tased() then
				if self._tase_effect then
					World:effect_manager():fade_kill(self._tase_effect)
				end

				self._tase_effect = World:effect_manager():spawn({
					force_synch = true,
					effect = Idstring("effects/payday2/particles/character/taser_thread"),
					parent = self._weapon_obj_fire
				})

				self._tasered_sound = self._unit:sound():play("tasered_3rd", nil)

				if vis_state == 1 then
					self._ext_movement:play_redirect("recoil_single")
				end

				self._discharging_on_husk = true
				self._firing_at_husk = nil
			end
		elseif self._discharging_on_husk then
			if not self._attention.unit:movement():tased() then
				self._discharging_on_husk = nil

				if self._is_server then
					self._expired = true
				else
					self.update = self._upd_empty
				end
			end
		elseif self._discharging then
			local cancel_tase = nil

			if not self._tasing_local_unit:movement():tased() then
				cancel_tase = true
			else
				if self._shield then
					cancel_tase = self._unit:raycast("ray", self._shoot_from_pos, target_pos, "slot_mask", self._line_of_fire_slotmask, "sphere_cast_radius", self._sphere_radius, "ignore_unit", self._shield, "report")
				else
					cancel_tase = self._unit:raycast("ray", self._shoot_from_pos, target_pos, "slot_mask", self._line_of_fire_slotmask, "sphere_cast_radius", self._sphere_radius, "report")
				end
			end

			if cancel_tase then
				if self._is_server then
					self._expired = true
				else
					self._tasing_local_unit:movement():on_tase_ended()
					self._tasing_local_unit:movement():on_targetted_for_attack(false, self._unit)
					self._tasing_player = nil
					self._tasing_local_unit = nil

					self._discharging = nil
					self.update = self._upd_empty
				end
			end
		elseif target_vec and self._common_data.allow_fire then
			if not self._played_sound_this_once then
				self._played_sound_this_once = true
				self._unit:sound():play("taser_charge", nil)
			end

			if self._shoot_t and self._mod_enable_t < t and self._shoot_t < t then
				if self._tasing_local_unit and target_dis < self._tase_distance then
					local record = managers.groupai:state():criminal_record(self._tasing_local_unit:key())

					if not record or record.status or self._tasing_local_unit:movement():chk_action_forbidden("hurt") or self._tasing_local_unit:movement():zipline_unit() then
						if self._is_server then
							self._expired = true
						end
					else
						local is_obstructed = nil

						if self._shield then
							is_obstructed = self._unit:raycast("ray", self._shoot_from_pos, target_pos, "slot_mask", self._line_of_fire_slotmask, "sphere_cast_radius", self._sphere_radius, "ignore_unit", self._shield, "report")
						else
							is_obstructed = self._unit:raycast("ray", self._shoot_from_pos, target_pos, "slot_mask", self._line_of_fire_slotmask, "sphere_cast_radius", self._sphere_radius, "report")
						end

						if not is_obstructed then
							if self._tase_effect then
								World:effect_manager():fade_kill(self._tase_effect)
							end

							self._tase_effect = World:effect_manager():spawn({
								force_synch = true,
								effect = Idstring("effects/payday2/particles/character/taser_thread"),
								parent = self._weapon_obj_fire
							})

							self._common_data.ext_network:send("action_tase_event", 3)

							local attack_data = {
								attacker_unit = self._unit
							}

							self._tasing_local_unit:character_damage():damage_tase(attack_data)
							CopDamage._notify_listeners("on_criminal_tased", self._unit, self._tasing_local_unit)

							self._discharging = true

							if not self._tasing_local_unit:base().is_local_player then
								self._tasered_sound = self._unit:sound():play("tasered_3rd", nil)
							end

							if vis_state == 1 then
								self._ext_movement:play_redirect("recoil_single")
							end

							self._shoot_t = nil
						end
					end
				end
			end
		end
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end

function CopActionTase:fire_taser()
	self._firing_at_husk = true
end

function CopActionTase:get_husk_interrupt_desc()
	local action_desc = {
		block_type = "action",
		body_part = 3,
		type = "tase",
		firing_at_husk = self._firing_at_husk or self._discharging_on_husk
	}

	return action_desc
end

function CopActionTase:save(save_data)
	save_data.type = "tase"
	save_data.body_part = self._body_part
	save_data.firing_at_husk = self._discharging or self._firing_at_husk or self._discharging_on_husk
end

function CopActionTase:_upd_ik_spine(target_vec, fwd_dot, t)
	if fwd_dot > 0.7 then
		if not self._modifier_on then
			self._modifier_on = true

			self._machine:force_modifier(self._modifier_name)

			self._mod_enable_t = t + 0.5
		end

		self._modifier:set_target_y(target_vec)
		mvec3_set(self._common_data.look_vec, target_vec)

		return target_vec
	else
		if self._modifier_on then
			self._modifier_on = nil

			self._machine:allow_modifier(self._modifier_name)
		end

		return nil
	end
end

function CopActionTase:_upd_ik_r_arm(target_vec, fwd_dot, t)
	if fwd_dot > 0.7 then
		if not self._modifier_on then
			self._modifier_on = true

			self._machine:force_modifier(self._head_modifier_name)
			self._machine:force_modifier(self._r_arm_modifier_name)

			self._mod_enable_t = t + 0.5
		end

		self._head_modifier:set_target_z(target_vec)
		self._r_arm_modifier:set_target_y(target_vec)
		mvec3_set(self._common_data.look_vec, target_vec)

		return target_vec
	else
		if self._modifier_on then
			self._modifier_on = nil

			self._machine:allow_modifier(self._head_modifier_name)
			self._machine:allow_modifier(self._r_arm_modifier_name)
		end

		return nil
	end
end
