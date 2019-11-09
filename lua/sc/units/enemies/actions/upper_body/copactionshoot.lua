if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local mvec3_set = mvector3.set
	local mvec3_set_z = mvector3.set_z
	local mvec3_sub = mvector3.subtract
	local mvec3_norm = mvector3.normalize
	local mvec3_dir = mvector3.direction
	local mvec3_set_l = mvector3.set_length
	local mvec3_add = mvector3.add
	local mvec3_dot = mvector3.dot
	local mvec3_cross = mvector3.cross
	local mvec3_rot = mvector3.rotate_with
	local mvec3_rand_orth = mvector3.random_orthogonal
	local mvec3_lerp = mvector3.lerp
	local mrot_axis_angle = mrotation.set_axis_angle
	local temp_vec1 = Vector3()
	local temp_vec2 = Vector3()
	local temp_vec3 = Vector3()
	local temp_rot1 = Rotation()
	local bezier_curve = {
		0,
		0,
		1,
		1
	}
 
	local _f_CopActionShoot__get_target_pos = CopActionShoot._get_target_pos
	
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)	

	function CopActionShoot:_get_target_pos(shoot_from_pos, ...)
		local target_pos, target_vec, target_dis, autotarget
		local _time = math.floor(TimerManager:game():time())
		self._throw_projectile_time = self._throw_projectile_time or 0
		if self._unit:base()._tweak_table == "boom" and self._throw_projectile_time < _time then
			if self._shooting_player then
				self._throw_projectile_time = _time + math.round_with_precision(10, 2)
				shoot_from_pos = shoot_from_pos + Vector3(50, 50, 0)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
				local roll = math.rand(1, 100)
				local chance_gas = 35
				if roll <= chance_gas then
					self._unit:sound():say("use_gas", true, nil, true)
					deploy_gas(shoot_from_pos, target_vec)	
				end
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end
		elseif self._unit:base()._tweak_table == "autumn" and self._throw_projectile_time < _time then
			if self._shooting_player then
				GroupAIStateBesiege:set_assault_endless(true)
				managers.hud:set_buff_enabled("vip", true)			
				local cloak_roll = math.rand(1, 100)
				local chance_uncloak = 20		
				if cloak_roll <= chance_uncloak then
					self._unit:damage():run_sequence_simple("decloak")
				end
				self._throw_projectile_time = _time + math.round_with_precision(10, 2)
				shoot_from_pos = shoot_from_pos + Vector3(50, 50, 0)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
				local roll = math.rand(1, 100)
				local chance_gas = 20
				if roll <= chance_gas then
					self._unit:sound():say("i03", true, nil, true)
					deploy_gas(shoot_from_pos, target_vec)	
				end
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end
		elseif self._unit:base()._tweak_table == "spooc_titan" and self._throw_projectile_time < _time then
			if self._shooting_player then
				local cloak_roll = math.rand(1, 100)
				local chance_uncloak = 40	
				if cloak_roll <= chance_uncloak then
					self._unit:damage():run_sequence_simple("decloak")
				end
				self._throw_projectile_time = _time + math.round_with_precision(10, 2)
				shoot_from_pos = shoot_from_pos + Vector3(50, 50, 0)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end			
		elseif self._unit:base()._tweak_table == "boom_summers" and self._throw_projectile_time < _time then
			if self._shooting_player then
				self._throw_projectile_time = _time + math.round_with_precision(10, 2)
				shoot_from_pos = shoot_from_pos + Vector3(50, 50, 0)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
				throw_molly(shoot_from_pos, target_vec)
				self._ext_movement:play_redirect("throw_grenade")
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end
		elseif self._unit:base()._tweak_table == "rboom" and self._throw_projectile_time < _time then
			if self._shooting_player then
				self._throw_projectile_time = _time + math.round_with_precision(10, 2)
				shoot_from_pos = shoot_from_pos + Vector3(50, 50, 0)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
				local roll = math.rand(1, 100)
				local chance_gas = 25
				if roll <= chance_gas then
					deploy_gas(shoot_from_pos, target_vec)
				end
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end
		elseif self._unit:base()._tweak_table == "spring" and self._throw_projectile_time < _time then
			if self._shooting_player then
				self._throw_projectile_time = _time + math.round_with_precision(30, 2)
				shoot_from_pos = shoot_from_pos + Vector3(50, 50, 0)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
				if difficulty_index <= 4 then
					--Could maybe have him do something else, leaving it like this for now
				else
					throw_frag(shoot_from_pos, target_vec)
					self._ext_movement:play_redirect("throw_grenade")
				end
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end
		elseif self._unit:base()._tweak_table == "taser_titan" and self._throw_projectile_time < _time then
			if self._shooting_player then
				self._throw_projectile_time = _time + math.round_with_precision(5, 2)
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
				self._unit:sound():play("taser_charge", nil, true)
			else
				target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
			end			
		else
			target_pos, target_vec, target_dis, autotarget = _f_CopActionShoot__get_target_pos(self, shoot_from_pos, ...)
		end
		return target_pos, target_vec, target_dis, autotarget
	end

	function deploy_gas(shoot_from_pos, target_vec)
		local Net = _G.LuaNetworking
		local z_fix = {-0.05, -0.02, -0.05, -0.02, -0.07, -0.07, -0.1}
		target_vec = target_vec + Vector3(0, 0, z_fix[math.random(7)])
		local detonate_pos = managers.player:player_unit():position()
		managers.groupai:state():detonate_cs_grenade(detonate_pos, nil, 7.5)
	end

	function deploy_flash(shoot_from_pos, target_vec)
		local Net = _G.LuaNetworking
		local z_fix = {-0.05, -0.02, -0.05, -0.02, -0.07, -0.07, -0.1}
		target_vec = target_vec + Vector3(0, 0, z_fix[math.random(7)])
		local detonate_pos = managers.player:player_unit():position()
		managers.groupai:state():detonate_smoke_grenade(detonate_pos, nil, 15, true)
	end

	function throw_frag(shoot_from_pos, target_vec)
		local Net = _G.LuaNetworking
		local z_fix = {-0.05, -0.02, -0.05, -0.02, -0.07, -0.07, -0.1}
		target_vec = target_vec + Vector3(0, 0, z_fix[math.random(7)])
		if Network:is_server() then
			ProjectileBase.throw_projectile("frag", shoot_from_pos, target_vec)
		end
	end

	function throw_molly(shoot_from_pos, target_vec)
		local Net = _G.LuaNetworking
		local z_fix = {-0.05, -0.02, -0.05, -0.02, -0.07, -0.07, -0.1}
		target_vec = target_vec + Vector3(0, 0, z_fix[math.random(7)])
		if Network:is_server() then
			ProjectileBase.throw_projectile("molotov", shoot_from_pos, target_vec)
		end
	end
	
	function CopActionShoot:update(t)
		local vis_state = self._ext_base:lod_stage()
		vis_state = vis_state or 4

		if vis_state == 1 then
			-- Nothing
		elseif self._skipped_frames < vis_state * 3 then
			self._skipped_frames = self._skipped_frames + 1

			return
		else
			self._skipped_frames = 1
		end

		local shoot_from_pos = self._shoot_from_pos
		local ext_anim = self._ext_anim
		local target_vec, target_dis, autotarget, target_pos = nil

		if self._attention then
			target_pos, target_vec, target_dis, autotarget = self:_get_target_pos(shoot_from_pos, self._attention, t)
			local tar_vec_flat = temp_vec2

			mvec3_set(tar_vec_flat, target_vec)
			mvec3_set_z(tar_vec_flat, 0)
			mvec3_norm(tar_vec_flat)

			local fwd = self._common_data.fwd
			local fwd_dot = mvec3_dot(fwd, tar_vec_flat)

			if self._turn_allowed then
				local active_actions = self._common_data.active_actions
				local queued_actions = self._common_data.queued_actions

				if (not active_actions[2] or active_actions[2]:type() == "idle") and (not queued_actions or not queued_actions[1] and not queued_actions[2]) and not self._ext_movement:chk_action_forbidden("walk") then
					local fwd_dot_flat = mvec3_dot(tar_vec_flat, fwd)

					if fwd_dot_flat < 0.96 then
						local spin = tar_vec_flat:to_polar_with_reference(fwd, math.UP).spin
						local new_action_data = {
							body_part = 2,
							type = "turn",
							angle = spin
						}

						self._ext_movement:action_request(new_action_data)
					end
				end
			end

			target_vec = self:_upd_ik(target_vec, fwd_dot, t)
		end

		if not ext_anim.reload and not ext_anim.equip and not ext_anim.melee then
				if ext_anim.equip then
					-- Nothing
				elseif self._weapon_base:clip_empty() then
					if self._autofiring then
						self._weapon_base:stop_autofire()
						self._ext_movement:play_redirect("up_idle")

						self._autofiring = nil
						self._autoshots_fired = nil
					end
					
					local res = CopActionReload._play_reload(self)

					if res then
						self._machine:set_speed(res, self._reload_speed)
					end

					if Network:is_server() then
						managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
					end
			elseif self._autofiring then
				if not target_vec or not self._common_data.allow_fire then
					self._weapon_base:stop_autofire()

					self._shoot_t = t + 0.6
					self._autofiring = nil
					self._autoshots_fired = nil

					self._ext_movement:play_redirect("up_idle")
				else
					local spread = self._spread
					local falloff, i_range = self:_get_shoot_falloff(target_dis, self._falloff)
					local dmg_buff = self._unit:base():get_total_buff("base_damage")
					local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul
					local new_target_pos = self._shoot_history and self:_get_unit_shoot_pos(t, target_pos, target_dis, self._w_usage_tweak, falloff, i_range, autotarget)

					if new_target_pos then
						target_pos = new_target_pos
					else
						spread = math.min(20, spread)
					end

					local spread_pos = temp_vec2

					mvec3_rand_orth(spread_pos, target_vec)
					mvec3_set_l(spread_pos, spread)
					mvec3_add(spread_pos, target_pos)

					target_dis = mvec3_dir(target_vec, shoot_from_pos, spread_pos)
					local fired = self._weapon_base:trigger_held(shoot_from_pos, target_vec, dmg_mul, self._shooting_player, nil, nil, nil, self._attention.unit)

					if fired then
						if fired.hit_enemy and fired.hit_enemy.type == "death" and self._unit:unit_data().mission_element then
							self._unit:unit_data().mission_element:event("killshot", self._unit)
						end

						if not ext_anim.recoil and vis_state == 1 and not ext_anim.base_no_recoil and not ext_anim.move and not self._common_data.char_tweak.no_recoil then
							self._ext_movement:play_redirect("recoil_auto")
						end

						if not self._autofiring or self._autofiring - 1 <= self._autoshots_fired then
							self._autofiring = nil
							self._autoshots_fired = nil

							self._weapon_base:stop_autofire()
							self._ext_movement:play_redirect("up_idle")

							if vis_state == 1 then
								self._shoot_t = t + (self._common_data.is_suppressed and 1.5 or 1) * math.lerp(falloff.recoil[1], falloff.recoil[2], self:_pseudorandom())
							else
								self._shoot_t = t + falloff.recoil[2]
							end
						else
							self._autoshots_fired = self._autoshots_fired + 1
						end
					end
				end
			elseif target_vec and self._common_data.allow_fire and self._shoot_t < t and self._mod_enable_t < t then
				local shoot = nil

				if autotarget or self._shooting_husk_player and self._next_vis_ray_t < t then
					if self._shooting_husk_player then
						self._next_vis_ray_t = t + 2
					end

					local fire_line = World:raycast("ray", shoot_from_pos, target_pos, "slot_mask", self._verif_slotmask, "ray_type", "ai_vision")

					if fire_line then
						if t - self._line_of_sight_t > 3 then
							local aim_delay_minmax = self._w_usage_tweak.aim_delay
							local lerp_dis = math.min(1, target_vec:length() / self._falloff[#self._falloff].r)
							local aim_delay = math.lerp(aim_delay_minmax[1], aim_delay_minmax[2], lerp_dis)
							aim_delay = aim_delay + self:_pseudorandom() * aim_delay * 0.3

							if self._common_data.is_suppressed then
								aim_delay = aim_delay * 1.5
							end

							self._shoot_t = t + aim_delay
						elseif fire_line.distance > 300 then
							shoot = true
						end
					else
						if t - self._line_of_sight_t > 1 and not self._last_vis_check_status then
							local shoot_hist = self._shoot_history
							local displacement = mvector3.distance(target_pos, shoot_hist.m_last_pos)
							local focus_delay = self._w_usage_tweak.focus_delay * math.min(1, displacement / self._w_usage_tweak.focus_dis)
							shoot_hist.focus_start_t = t
							shoot_hist.focus_delay = focus_delay
							shoot_hist.m_last_pos = mvector3.copy(target_pos)
						end

						self._line_of_sight_t = t
						shoot = true
					end

					self._last_vis_check_status = shoot
				else
					shoot = self._shooting_husk_player and self._last_vis_check_status or true
				end

				if self._common_data.char_tweak.no_move_and_shoot and self._common_data.ext_anim and self._common_data.ext_anim.move then
					shoot = false
					self._shoot_t = t + (self._common_data.char_tweak.move_and_shoot_cooldown or 1)
				end

				if shoot then
					local melee = nil

					if autotarget and (not self._common_data.melee_countered_t or t - self._common_data.melee_countered_t > 15) and target_dis < 120 and self._w_usage_tweak.melee_speed and self._melee_timeout_t < t then
						melee = self:_chk_start_melee(target_vec, target_dis, autotarget, target_pos)
					end

					if not melee then
						local falloff, i_range = self:_get_shoot_falloff(target_dis, self._falloff)
						local dmg_buff = self._unit:base():get_total_buff("base_damage")
						local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul
						local firemode = nil

						if self._automatic_weap then
							firemode = falloff.mode and falloff.mode[1] or 1
							local random_mode = self:_pseudorandom()

							for i_mode, mode_chance in ipairs(falloff.mode) do
								if random_mode <= mode_chance then
									firemode = i_mode

									break
								end
							end
						else
							firemode = 1
						end

						if firemode > 1 then
							self._weapon_base:start_autofire(firemode < 4 and firemode)

							if self._w_usage_tweak.autofire_rounds then
								if firemode < 4 then
									self._autofiring = firemode
								elseif falloff.autofire_rounds then
									local diff = falloff.autofire_rounds[2] - falloff.autofire_rounds[1]
									self._autofiring = math.round(falloff.autofire_rounds[1] + self:_pseudorandom() * diff)
								else
									local diff = self._w_usage_tweak.autofire_rounds[2] - self._w_usage_tweak.autofire_rounds[1]
									self._autofiring = math.round(self._w_usage_tweak.autofire_rounds[1] + self:_pseudorandom() * diff)
								end
							else
								Application:stack_dump_error("autofire_rounds is missing from weapon usage tweak data!", self._weap_tweak.usage)
							end

							self._autoshots_fired = 0

							if vis_state == 1 and not ext_anim.base_no_recoil and not ext_anim.move and not self._common_data.char_tweak.no_recoil then
								self._ext_movement:play_redirect("recoil_auto")
							end
						else
							local spread = self._spread

							if autotarget then
								local new_target_pos = self._shoot_history and self:_get_unit_shoot_pos(t, target_pos, target_dis, self._w_usage_tweak, falloff, i_range, autotarget)

								if new_target_pos then
									target_pos = new_target_pos
								else
									spread = math.min(20, spread)
								end
							end

							local spread_pos = temp_vec2

							mvec3_rand_orth(spread_pos, target_vec)
							mvec3_set_l(spread_pos, spread)
							mvec3_add(spread_pos, target_pos)

							target_dis = mvec3_dir(target_vec, shoot_from_pos, spread_pos)
							local fired = self._weapon_base:singleshot(shoot_from_pos, target_vec, dmg_mul, self._shooting_player, nil, nil, nil, self._attention.unit)

							if fired and fired.hit_enemy and fired.hit_enemy.type == "death" and self._unit:unit_data().mission_element then
								self._unit:unit_data().mission_element:event("killshot", self._unit)
							end

							if vis_state == 1 then
								if not ext_anim.base_no_recoil and not ext_anim.move then
									self._ext_movement:play_redirect("recoil_single")
								end

								self._shoot_t = t + (self._common_data.is_suppressed and 1.5 or 1) * math.lerp(falloff.recoil[1], falloff.recoil[2], self:_pseudorandom())
							else
								self._shoot_t = t + falloff.recoil[2]
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
		
end
