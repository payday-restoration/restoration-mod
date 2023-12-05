local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_norm = mvector3.normalize
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()


-- Make tasers more consistent by allowing to tase through enemies and ignoring attention when already discharging
function CopActionTase:on_attention(attention)
	if not attention then
		if self._tasing_local_unit then
			if self._discharging then
				self._tasing_local_unit:movement():on_tase_ended()
			end
			if self._tasing_player then
				self._tasing_local_unit:movement():on_targetted_for_attack(false, self._unit)
			end
		end

		self._attention = nil
		self._tasing_local_unit = nil
		self._tasing_player = nil
		self._discharging = nil

		self._expired = Network:is_server() or self._expired
		self.update = self._upd_empty
		return
	elseif self._attention then
		return
	end

	local weap_tweak = self._ext_inventory:equipped_unit():base():weapon_tweak_data()
	local weapon_usage_tweak = self._common_data.char_tweak.weapon[weap_tweak.usage]

	self._weap_tweak = weap_tweak
	self._w_usage_tweak = weapon_usage_tweak
	self._falloff = weapon_usage_tweak.FALLOFF
	self._tase_distance = weapon_usage_tweak.tase_distance
	self._tase_radius = weapon_usage_tweak.tase_sphere_cast_radius
	self._attention = attention
	self._line_of_fire_slotmask = managers.slot:get_mask("bullet_blank_impact_targets")

	local target_pos = attention.handler and attention.handler:get_attention_m_pos() or attention.unit:movement():m_head_pos()
	local target_vec = target_pos - self._ext_movement:m_head_pos()
	local lerp_dis = math.min(1, target_vec:length() / self._tase_distance)
	local aim_delay = weapon_usage_tweak.aim_delay_tase or weapon_usage_tweak.aim_delay
	local shoot_delay = math.lerp(aim_delay[1], aim_delay[2], lerp_dis)

	self._modifier:set_target_y(target_vec)
	self._mod_enable_t = TimerManager:game():time() + shoot_delay
	self._tasing_local_unit = nil
	self._tasing_player = nil
	self.update = nil

	if Network:is_server() then
		self._common_data.ext_network:send("action_tase_event", 1)
		if not attention.unit:base().is_husk_player then
			self._shoot_t = TimerManager:game():time() + shoot_delay
			self._tasing_local_unit = attention.unit
			self._tasing_player = attention.unit:base().is_local_player
		end
	elseif attention.unit:base().is_local_player then
		self._shoot_t = TimerManager:game():time() + shoot_delay
		self._tasing_local_unit = attention.unit
		self._tasing_player = true
	end

	if self._tasing_local_unit and self._tasing_player then
		self._tasing_local_unit:movement():on_targetted_for_attack(true, self._unit)
	end
end


-- Helper function
function CopActionTase.is_obstructed(from, to, slotmask, radius)
	return World:raycast("ray", from, to, "slot_mask", slotmask, "sphere_cast_radius", radius, "report")
end


-- Fix some general issues with turning
function CopActionTase:update(t)
	if self._expired then
		return
	end

	local shoot_from_pos = self._ext_movement:m_head_pos()
	local target_vec, target_pos, target_vec_flat = tmp_vec1, tmp_vec2, tmp_vec3

	self._attention.unit:character_damage():shoot_pos_mid(target_pos)

	local target_dis = mvec3_dir(target_vec, shoot_from_pos, target_pos)
	mvec3_set(target_vec_flat, target_vec)
	mvec3_set_z(target_vec_flat, 0)
	mvec3_norm(target_vec_flat)

	local fwd = self._common_data.fwd
	local fwd_dot = mvec3_dot(fwd, target_vec_flat)
	if fwd_dot > 0.7 then
		if not self._modifier_on then
			self._modifier_on = true
			self._machine:force_modifier(self._modifier_name)
			self._mod_enable_t = t + 0.5
		end

		self._modifier:set_target_y(target_vec)
	else
		if self._modifier_on then
			self._modifier_on = nil
			self._machine:allow_modifier(self._modifier_name)
		end

		-- Similar to CopActionShoot, this originally only executed client side, in addition of not checking for existing turn actions
		if CopActionIdle._can_turn(self) then
			local spin = target_vec_flat:to_polar_with_reference(fwd, math.UP).spin
			if math.abs(spin) > 25 then
				self._ext_movement:action_request({
					type = "turn",
					body_part = 2,
					angle = spin
				})
			end
		end

		target_vec = nil
	end

	if self._ext_anim.reload or self._ext_anim.equip then
		return
	end

	if self._discharging then
		if not self._tasing_local_unit:movement():tased() or self.is_obstructed(shoot_from_pos, target_pos, self._line_of_fire_slotmask, self._tase_radius) then
			if Network:is_server() then
				self._expired = true
			else
				self._tasing_local_unit:movement():on_tase_ended()
				self._attention.unit:movement():on_targetted_for_attack(false, self._unit)

				self._discharging = nil
				self._tasing_player = nil
				self._tasing_local_unit = nil
				self.update = self._upd_empty
			end
		end
	elseif target_vec and self._common_data.allow_fire and self._shoot_t and self._shoot_t < t and self._mod_enable_t < t then
		if self._tase_effect then
			World:effect_manager():fade_kill(self._tase_effect)
		end

		self._tase_effect = World:effect_manager():spawn({
			force_synch = true,
			effect = Idstring("effects/payday2/particles/character/taser_thread"),
			parent = self._ext_inventory:equipped_unit():get_object(Idstring("fire"))
		})

		if self._tasing_local_unit then
			if target_dis > self._tase_distance then
				return
			end

			local record = managers.groupai:state():criminal_record(self._tasing_local_unit:key())
			if not record or record.status or self._tasing_local_unit:movement():chk_action_forbidden("hurt") or self._tasing_local_unit:movement():zipline_unit() then
				self._expired = Network:is_server() or self._expired
				return
			end

			if self.is_obstructed(shoot_from_pos, target_pos, self._line_of_fire_slotmask, self._tase_radius) then
				return
			end

			self._common_data.ext_network:send("action_tase_event", 3)

			self._tasing_local_unit:character_damage():damage_tase({ attacker_unit = self._unit })
			CopDamage._notify_listeners("on_criminal_tased", self._unit, self._tasing_local_unit)

			self._tasered_sound = self._unit:sound():play("tasered_3rd", nil)
			if self._unit:base():lod_stage() == 1 then
				self._ext_movement:play_redirect("recoil_single")
			end
			self._shoot_t = nil
			self._discharging = true
		else
			self._tasered_sound = self._unit:sound():play("tasered_3rd", nil)
			if self._unit:base():lod_stage() == 1 then
				self._ext_movement:play_redirect("recoil_single")
			end
			self._shoot_t = nil
		end
	end
end