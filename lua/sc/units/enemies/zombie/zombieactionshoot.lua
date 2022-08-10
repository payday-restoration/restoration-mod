--[[

ZombieActionShoot = ZombieActionShoot or class(CopActionShoot)

CopMovement._action_variants.zombie_light = clone(CopMovement._action_variants.security)
CopMovement._action_variants.zombie_light.shoot = ZombieActionShoot


-- Redirects to make melee charge work
CopMovement.anim_cbk_spawn_melee_item = CopMovement.anim_clbk_enemy_spawn_melee_item
CopMovement.anim_cbk_unspawn_melee_item = CopMovement.anim_clbk_enemy_unspawn_melee_item
CopMovement.anim_cbk_set_melee_start_state_vars = function (self, unit, name, segment_name)
	local tweak = tweak_data.weapon.npc_melee[self._unit:base():melee_weapon()]
	if tweak then
		local state = self._unit:anim_state_machine():segment_state(segment_name or Idstring("upper_body"))
		self._unit:anim_state_machine():set_parameter(state, tweak.animation_param, 1)
	end
end
CopMovement.anim_cbk_set_melee_charge_state_vars = CopMovement.anim_cbk_set_melee_start_state_vars


function ZombieActionShoot:init(...)
	if self.super.init(self, ...) then
		if Network:is_server() then
			self._ext_movement:set_stance("hos")
		end

		return true
	end

	return false
end

local tmp_vec = Vector3()
function ZombieActionShoot:update(t)
	local shoot_from_pos = self._shoot_from_pos
	local target_vec, target_dis

	if self._attention then
		_, target_vec, target_dis = self:_get_target_pos(shoot_from_pos, self._attention, t)
		local tar_vec_flat = tmp_vec

		mvector3.set(tar_vec_flat, target_vec)
		mvector3.set_z(tar_vec_flat, 0)
		mvector3.normalize(tar_vec_flat)

		local fwd = self._common_data.fwd
		local fwd_dot = mvector3.dot(fwd, tar_vec_flat)
		local active_actions = self._common_data.active_actions
		local queued_actions = self._common_data.queued_actions

		if (not active_actions[2] or active_actions[2]:type() == "idle") and (not queued_actions or not queued_actions[1] and not queued_actions[2]) then
			local fwd_dot_flat = mvector3.dot(tar_vec_flat, fwd)
			if fwd_dot_flat < 0.96 then
				self._ext_movement:action_request({
					body_part = 2,
					type = "turn",
					angle = tar_vec_flat:to_polar_with_reference(fwd, math.UP).spin
				})
			end
		end

		target_vec = self:_upd_ik(target_vec, fwd_dot, t)

		if self._attention.unit and target_vec and not self._ext_anim.equip and self._mod_enable_t < t then
			self:_chk_start_melee(target_dis, t)
		end
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end

function ZombieActionShoot:_chk_start_melee(target_dis, t)
	if not self._w_usage_tweak.melee_speed then
		return
	end

	local melee_weapon = self._unit:base():melee_weapon()
	local is_weapon = melee_weapon == "weapon"

	local redirect
	if target_dis < 200 and self._melee_timeout_t < t and (self._melee_charging or not self._ext_anim.melee) then
		redirect = is_weapon and "melee" or "melee_item"
		self._melee_charging = nil
	elseif target_dis < 500 and not is_weapon and not self._melee_charging and not self._ext_anim.melee then
		redirect = "melee_start"
		self._melee_charging = true
	else
		return
	end

	local state = self._ext_movement:play_redirect(redirect)
	if self._melee_charging or not state then
		return
	end

	if not is_weapon then
		local anim_attack_vars = self._common_data.char_tweak.melee_anims or { "var1", "var2" }
		local melee_var = self:_pseudorandom(#anim_attack_vars)

		self._common_data.machine:set_parameter(state, anim_attack_vars[melee_var], 1)

		self._common_data.machine:set_parameter(state, tweak_data.weapon.npc_melee[melee_weapon].animation_param, 1)
	else
		self._common_data.machine:set_speed(state, self._w_usage_tweak.melee_speed or 1)
	end
end

function ZombieActionShoot:anim_clbk_melee_strike()
	self._melee_timeout_t = TimerManager:game():time() + (self._w_usage_tweak.melee_retry_delay and math.lerp(self._w_usage_tweak.melee_retry_delay[1], self._w_usage_tweak.melee_retry_delay[2], self:_pseudorandom()) or 1) - 1

	if not self._attention or not alive(self._attention.unit) or not self._attention.unit:character_damage() or not self._attention.unit:character_damage().damage_melee then
		return
	end

	local shoot_from_pos = self._shoot_from_pos
	local max_dis = 200
	local _, target_vec, target_dis, autotarget = self:_get_target_pos(shoot_from_pos, self._attention, TimerManager:game():time())

	local melee_weapon = self._unit:base():melee_weapon()
	local melee_data = tweak_data.weapon.npc_melee[melee_weapon]

	if target_dis > max_dis then
		if melee_data and melee_data.sound_miss then
			self._unit:sound():play(melee_data.sound_miss, nil, nil)
		end
		return
	elseif self._attention.unit:sound() then
		if melee_data and melee_data.sound_hit then
			self._attention.unit:sound():play(melee_data.sound_hit, nil, nil)
		else
			self._attention.unit:sound():play("melee_hit_body", nil, nil)
		end
	end

	if not autotarget and (not Network:is_server() or self._shooting_husk_player) then
		return
	end

	local min_dot = math.lerp(0, 0.4, target_dis / max_dis)
	local tar_vec_flat = tmp_vec

	mvector3.set(tar_vec_flat, target_vec)
	mvector3.set_z(tar_vec_flat, 0)
	mvector3.normalize(tar_vec_flat)

	local fwd = self._common_data.fwd
	local fwd_dot = mvector3.dot(fwd, tar_vec_flat)

	if fwd_dot < min_dot then
		return
	end

	local push_vel = target_vec:with_z(0.1):normalized() * 600
	local is_weapon = melee_weapon == "weapon"
	local damage = is_weapon and self._w_usage_tweak.melee_dmg or melee_data.damage
	local dmg_mul = is_weapon and 1 or self._common_data.char_tweak.melee_weapon_dmg_multiplier or 1
	damage = damage * dmg_mul * (1 + self._unit:base():get_total_buff("base_damage"))

	local defense_data = self._attention.unit:character_damage():damage_melee({
		variant = "melee",
		damage = damage,
		ignore_suppression = true,
		weapon_unit = self._weapon_unit,
		attacker_unit = self._common_data.unit,
		melee_weapon = melee_weapon,
		push_vel = push_vel,
		col_ray = {
			position = shoot_from_pos + fwd * 50,
			ray = mvector3.copy(target_vec),
			body = self._attention.unit:body(0)
		}
	})

	if defense_data == "countered" then
		self._unit:character_damage():damage_melee({
			damage_effect = 1,
			damage = 0,
			variant = "counter_spooc",
			attacker_unit = self._strike_unit,
			col_ray = {
				body = self._unit:body(0),
				position = self._common_data.pos + math.UP * 100
			},
			attack_dir = -1 * target_vec:normalized(),
			name_id = managers.blackmarket:equipped_melee_weapon()
		})
	end
end

]]--