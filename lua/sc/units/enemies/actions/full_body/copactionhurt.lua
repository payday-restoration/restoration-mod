local ids_empty = Idstring("")
local ids_base = Idstring("base")
local ids_upper_body = Idstring("upper_body")
local ids_bone_spine = Idstring("Spine")
local ids_root_follow = Idstring("root_follow")
local ids_hips = Idstring("Hips")
local ids_dragons_breath_effect = Idstring("effects/payday2/particles/impacts/sparks/dragons_breath_hit_effect")
local ids_look_head = Idstring("look_head")
local ids_aim_r_arm = Idstring("aim_r_arm")
local ids_action_upper_body = Idstring("action_upper_body")
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_set_l = mvector3.set_length
local mvec3_sub = mvector3.subtract
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_rand_orth = mvector3.random_orthogonal
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_copy = mvector3.copy
local mvec3_lerp = mvector3.lerp
local mrot_set = mrotation.set_yaw_pitch_roll
local math_abs = math.abs
local math_lerp = math.lerp
local math_floor = math.floor
local math_random = math.random
local math_randomseed = math.randomseed
local math_round = math.round
local math_UP = math.UP
local math_clamp = math.clamp
local math_min = math.min
local math_pow = math.pow
local math_bezier = math.bezier
local table_insert = table.insert
local table_index_of = table.index_of
local table_remove = table.remove
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()
local bezier_curve = {
	0,
	0,
	1,
	1
}

CopActionHurt._ik_presets = {
	spine_head_r_arm = {
		update = "_update_spine_head_r_arm",
		start = "_begin_spine_head_r_arm",
		get_blend = "_get_blend_spine_head_r_arm",
		stop = "_stop_spine_head_r_arm"
	},
	r_arm = {
		update = "_update_ik_r_arm",
		start = "_begin_ik_r_arm",
		get_blend = "_get_blend_ik_r_arm",
		stop = "_stop_ik_r_arm"
	}
}

CopActionHurt.network_allowed_hurt_types = {
	light_hurt = true,
	shield_knock = true,
	hurt = true,
	heavy_hurt = true,
	death = true,
	fatal = true,
	fire_hurt = true,
	poison_hurt = true,
	bleedout = true,
	knock_down = true,
	expl_hurt = true,
	stagger = true,
	hurt_sick = true,
	counter_tased = true,
	taser_tased = true,
	concussion = true,
	healed = true
}

function CopActionHurt:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_base = common_data.ext_base
	self._ext_brain = common_data.ext_brain
	self._ext_damage = common_data.ext_damage
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._attention = common_data.attention
	self._action_desc = action_desc
	self._is_server = Network:is_server()
	local t = TimerManager:game():time()
	local is_civilian = CopDamage.is_civilian(common_data.ext_base._tweak_table)
	local is_female, uses_shield_anims, taser_tased_tasing = nil
	local is_stealth = managers.groupai:state():whisper_mode()

	if common_data.machine:get_global("female") == 1 then
		is_female = true
	end

	if common_data.machine:get_global("shield") == 1 then
		uses_shield_anims = true
	end

	local death_type = action_desc.death_type
	local crouching = common_data.ext_anim.crouch or common_data.ext_anim.hurt and common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "crh") > 0
	local redir_res = nil
	local action_type = action_desc.hurt_type

	if action_type == "knock_down" or action_type == "stagger" then
		action_type = "heavy_hurt"
	end

	if action_type == "fatal" then
		redir_res = common_data.ext_movement:play_redirect("fatal")

		if not redir_res then
			--debug_pause("[CopActionHurt:init] fatal redirect failed in", common_data.machine:segment_state(ids_base))

			return
		end

		managers.hud:set_mugshot_downed(common_data.unit:unit_data().mugshot_id)
	elseif action_type == "bleedout" then
		redir_res = common_data.ext_movement:play_redirect("bleedout")

		if not redir_res then
			--debug_pause("[CopActionHurt:init] bleedout redirect failed in", common_data.machine:segment_state(ids_base))

			return
		end
	elseif action_desc.variant == "tase" then
		redir_res = common_data.ext_movement:play_redirect("tased")

		if not redir_res then
			--debug_pause("[CopActionHurt:init] tased redirect failed in", common_data.machine:segment_state(ids_base))

			return
		end

		managers.hud:set_mugshot_tased(common_data.unit:unit_data().mugshot_id)
	elseif action_type == "fire_hurt" or action_type == "light_hurt" and action_desc.variant == "fire" then
		--[[local use_animation_on_fire_damage = nil

		if common_data.char_tweak.use_animation_on_fire_damage == nil then
			use_animation_on_fire_damage = true
		else
			use_animation_on_fire_damage = common_data.char_tweak.use_animation_on_fire_damage
		end

		if not use_animation_on_fire_damage then
			return
		end

		local start_dot_dance_antimation = action_desc.fire_dot_data and action_desc.fire_dot_data.start_dot_dance_antimation

		if not start_dot_dance_antimation then
			return
		end]]

		redir_res = common_data.ext_movement:play_redirect("fire_hurt")

		if not redir_res then
			return
		end

		if common_data.ext_damage.set_last_time_unit_got_fire_damage then
			common_data.ext_damage:set_last_time_unit_got_fire_damage(t)
		end

		if action_desc.ignite_character == "dragonsbreath" then
			self:_dragons_breath_sparks()
		end

		local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)
		local right_dot = action_desc.direction_vec:dot(common_data.right)
		local dir_str = nil

		if math_abs(right_dot) < math_abs(fwd_dot) then
			if fwd_dot < 0 then
				dir_str = "fwd"
			else
				dir_str = "bwd"
			end
		elseif right_dot > 0 then
			dir_str = "l"
		else
			dir_str = "r"
		end

		common_data.machine:set_parameter(redir_res, dir_str, 1)
	elseif action_type == "taser_tased" then
		local can_be_tased = nil

		--[[if common_data.char_tweak.can_be_tased == nil then
			can_be_tased = true
		else
			can_be_tased = common_data.char_tweak.can_be_tased
		end

		if not can_be_tased then
			return
		end

		if common_data.ext_brain and common_data.ext_brain.surrendered and common_data.ext_brain:surrendered() then
			return
		end]]

		local tase_time = not uses_shield_anims and common_data.ext_damage._tased_time

		if tase_time then
			self._tased_time = t + tase_time
			common_data.ext_damage._tased_time = nil

			--[[local down_time = common_data.ext_damage._tased_down_time

			if down_time then
				self._tased_down_time = t + down_time
				common_data.ext_damage._tased_down_time = nil
			end]]

			redir_res = self._ext_movement:play_redirect("tased")

			if not redir_res then
				--debug_pause("[CopActionHurt:init] tased redirect failed in", self._machine:segment_state(ids_base))

				return
			end

			taser_tased_tasing = true
		else
			redir_res = common_data.ext_movement:play_redirect("taser")

			if not redir_res then
				return
			end

			local anim_roll = self:_pseudorandom(4)
			local anim_parameter = "var" .. tostring(anim_roll)

			common_data.machine:set_parameter(redir_res, anim_parameter, 1)
		end

		if self._tased_effect then
			World:effect_manager():fade_kill(self._tased_effect)

			self._tased_effect = nil
		end

		local tase_effect_table = common_data.ext_damage._tase_effect_table

		if tase_effect_table then
			self._tased_effect = World:effect_manager():spawn(tase_effect_table)
		end
	elseif action_type == "light_hurt" then
		if common_data.ext_anim.upper_body_active and not common_data.ext_anim.upper_body_empty and not common_data.ext_anim.recoil then
			return
		end

		redir_res = common_data.ext_movement:play_redirect(action_type)

		if not redir_res then
			--debug_pause("[CopActionHurt:init] light_hurt redirect failed in", common_data.machine:segment_state(ids_upper_body))

			return
		end

		local dir_str = nil
		local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)

		if fwd_dot < 0 then
			if action_desc.direction_vec:dot(common_data.right) > 0 then
				dir_str = "l"
			else
				dir_str = "r"
			end
		else
			dir_str = "bwd"
		end

		common_data.machine:set_parameter(redir_res, dir_str, 1)

		local height_str = common_data.ext_movement:m_com().z < action_desc.hit_pos.z and "high" or "low"

		common_data.machine:set_parameter(redir_res, height_str, 1)

		self._expired = true

		return true
	elseif action_type == "concussion" then
		redir_res = common_data.ext_movement:play_redirect("concussion_stun")

		if not redir_res then
			return
		end

		local rnd_anim = nil
		local dir_str = nil
		local variant = "var"

		if uses_shield_anims then
			self._sick_time = t + 2.5
			rnd_anim = self:_pseudorandom(4)
			variant = "shield_var"
		else
			self._sick_time = t + 3
			variant = "var"

			local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)
			local right_dot = action_desc.direction_vec:dot(common_data.right)

			if math_abs(right_dot) < math_abs(fwd_dot) then
				if fwd_dot < 0 then
					rnd_anim = self:_pseudorandom(5)

					if rnd_anim == 1 then
						dir_str = "1"
						rnd_anim = nil
					else
						rnd_anim = rnd_anim + 4
					end
				else
					dir_str = "2"
				end
			elseif right_dot > 0 then
				dir_str = "4"
			else
				dir_str = "3"
			end
		end

		local anim_str = nil

		if rnd_anim then
			anim_str = variant .. tostring(rnd_anim)
		else
			anim_str = variant .. dir_str
		end

		common_data.machine:set_parameter(redir_res, anim_str, 1)
	elseif action_type == "hurt_sick" then
		local ecm_hurts_table = common_data.char_tweak.ecm_hurts

		if not ecm_hurts_table then
			--debug_pause_unit(common_data.unit, "[CopActionHurt:init] Unit missing ecm_hurts in Character Tweak Data", common_data.unit)

			return
		end

		redir_res = common_data.ext_movement:play_redirect("hurt_sick")

		if not redir_res then
			--debug_pause("[CopActionHurt:init] hurt_sick redirect failed in", common_data.machine:segment_state(ids_base))

			return
		end

		local sick_variants = {}

		for i, d in pairs(ecm_hurts_table) do
			table_insert(sick_variants, i)
		end

		local variant = #sick_variants == 1 and sick_variants[1] or sick_variants[self:_pseudorandom(#sick_variants)]
		local duration_diff = ecm_hurts_table[variant].max_duration - ecm_hurts_table[variant].min_duration
		local duration = ecm_hurts_table[variant].min_duration + duration_diff * self:_pseudorandom()

		for _, hurt_sick in ipairs(sick_variants) do
			local global_parameter = hurt_sick == variant and 1 or 0

			common_data.machine:set_global(hurt_sick, global_parameter)
		end

		self._sick_time = t + duration
	elseif action_type == "poison_hurt" then
		redir_res = common_data.ext_movement:play_redirect("hurt_poison")

		if not redir_res then
			--debug_pause("[CopActionHurt:init] hurt_sick redirect failed in", common_data.machine:segment_state(ids_base))

			return
		end

		self._sick_time = t + 2
	else
		local keep_checking = true

		if action_type == "death" then
			if common_data.char_tweak.death_animation then
				keep_checking = nil
				self._skip_ragdoll_sequence = true
				redir_res = self._ext_movement:play_redirect(common_data.char_tweak.death_animation)

				if not redir_res then
					--debug_pause("[CopActionHurt:init] death redirect failed in", self._machine:segment_state(Idstring("base")))

					return
				end

				local anim_vars = common_data.char_tweak.death_animation_vars or {"var1"}

				for _, anim_var in pairs(anim_vars) do
					self._machine:set_parameter(redir_res, anim_var, 1)
				end

				if self._ext_anim.repel_loop then
					self._unit:sound():anim_clbk_play_sound(self._unit, "repel_end")
				end
			elseif action_desc.variant == "fire" then
				keep_checking = nil

				local variant = nil

				if common_data.ext_anim.ragdoll or common_data.ext_movement:died_on_rope() then
					self:force_ragdoll()
				else
					redir_res = common_data.ext_movement:play_redirect("death_fire")

					if not redir_res then
						--debug_pause("[CopActionHurt:init] death_fire redirect failed in", common_data.machine:segment_state(ids_base))

						return
					end

					self:_prepare_ragdoll()

					variant = 1
					local variant_count = #CopActionHurt.fire_death_anim_variants_length or 5

					if variant_count > 1 then
						variant = self:_pseudorandom(variant_count)
					end

					for i = 1, variant_count, 1 do
						local state_value = 0

						if i == variant then
							state_value = 1
						end

						common_data.machine:set_parameter(redir_res, "var" .. tostring(i), state_value)
					end
				end

				if not variant then
					variant = 0
				end

				self:_start_enemy_fire_effect_on_death(variant)
				managers.fire:check_achievemnts(common_data.unit, t)
			elseif action_desc.variant == "poison" or action_desc.variant == "dot" then
				keep_checking = nil
				self:force_ragdoll()
			elseif not common_data.char_tweak.no_run_death_anim then
				if common_data.ext_anim.run and common_data.ext_anim.move_fwd or common_data.ext_anim.sprint then
					keep_checking = nil

					redir_res = common_data.ext_movement:play_redirect("death_run")

					if not redir_res then
						--debug_pause("[CopActionHurt:init] death_run redirect failed in", common_data.machine:segment_state(ids_base))

						return
					end

					self:_prepare_ragdoll()

					local variant_type = is_female and "female" or "male"
					local variant = self.running_death_anim_variants[variant_type] or 1

					if variant > 1 then
						variant = self:_pseudorandom(variant)
					end

					common_data.machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
				end
			end

			if keep_checking then
				if common_data.ext_anim.run or common_data.ext_anim.ragdoll then
					keep_checking = nil
					self:force_ragdoll()
				end
			end
		elseif action_type == "heavy_hurt" then
			if common_data.ext_anim.run and common_data.ext_anim.move_fwd or common_data.ext_anim.sprint then
				if not common_data.is_suppressed and not crouching then
					keep_checking = nil
					redir_res = common_data.ext_movement:play_redirect("heavy_run")

					if not redir_res then
						--debug_pause("[CopActionHurt:init] heavy_run redirect failed in", common_data.machine:segment_state(ids_base))

						return
					end

					local variant = self.running_hurt_anim_variants.fwd or 1

					if variant > 1 then
						variant = self:_pseudorandom(variant)
					end

					common_data.machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
				end
			end
		end

		if keep_checking then
			local variant, height, old_variant, old_info = nil

			if action_type == "hurt" or action_type == "heavy_hurt" then
				if common_data.ext_anim.hurt then
					for i = 1, self.hurt_anim_variants_highest_num, 1 do
						if common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "var" .. i) then
							old_variant = i

							break
						end
					end

					if old_variant ~= nil then
						old_info = {
							fwd = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "fwd"),
							bwd = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "bwd"),
							l = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "l"),
							r = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "r"),
							high = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "high"),
							low = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "low"),
							crh = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "crh"),
							mod = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "mod"),
							hvy = common_data.machine:get_parameter(common_data.machine:segment_state(ids_base), "hvy")
						}
					end
				end
			end

			local redirect = action_type

			if action_type == "shield_knock" then
				local rand = self:_pseudorandom(CopActionHurt.shield_knock_variants) - 1
				redirect = "shield_knock_var" .. tostring(rand)
			end

			if redirect then
				if redirect == "death" and common_data.ext_anim.bleedout_loop then
					redir_res = common_data.ext_movement:play_state("std/fatal/to_dead")
				else
					redir_res = common_data.ext_movement:play_redirect(redirect)
				end
			--[[else
				Application:stack_dump_error("There's no redirect in CopActionHurt!")]]
			end

			if not redir_res then
				--debug_pause_unit(common_data.unit, "[CopActionHurt:init]", redirect, "redirect failed in", common_data.machine:segment_state(ids_base), common_data.unit)

				return
			end

			if action_desc.variant ~= "bleeding" then
				local nr_variants = common_data.ext_anim.base_nr_variants

				if nr_variants then
					if action_type == "death" then
						variant = 1

						if nr_variants > 1 then
							variant = self:_pseudorandom(0, nr_variants)
						end
					else
						variant = 1

						if nr_variants > 1 then
							variant = self:_pseudorandom(nr_variants)
						end
					end
				else
					local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)
					local right_dot = action_desc.direction_vec:dot(common_data.right)
					local dir_str = nil

					if math_abs(right_dot) < math_abs(fwd_dot) then
						if fwd_dot < 0 then
							dir_str = "fwd"
						else
							dir_str = "bwd"
						end
					elseif right_dot > 0 then
						dir_str = "l"
					else
						dir_str = "r"
					end

					common_data.machine:set_parameter(redir_res, dir_str, 1)

					local hit_z = action_desc.hit_pos.z
					height = common_data.ext_movement:m_com().z < hit_z and "high" or "low"

					if action_type == "death" then
						if is_civilian then
							death_type = "normal"
						end

						local pose_type = crouching and "crouching" or "not_crouching"

						if is_female then
							variant = self.death_anim_fe_variants[death_type][pose_type][dir_str][height]
						else
							variant = self.death_anim_variants[death_type][pose_type][dir_str][height]
						end

						if variant > 1 then
							variant = self:_pseudorandom(0, variant)
						end

						self:_prepare_ragdoll()
					elseif action_type == "counter_tased" then
						if self._tased_effect then
							World:effect_manager():fade_kill(self._tased_effect)

							self._tased_effect = nil
						end

						local tase_effect_table = common_data.ext_damage._tase_effect_table

						if tase_effect_table then
							self._tased_effect = World:effect_manager():spawn(tase_effect_table)
						end
					elseif action_type ~= "shield_knock" and action_type ~= "taser_tased" then
						if old_variant then
							if old_info[dir_str] == 1 and old_info[height] == 1 and old_info.mod == 1 and action_type == "hurt" or old_info.hvy == 1 and action_type == "heavy_hurt" then
								variant = old_variant
							end
						end

						if not variant then
							if action_type == "expl_hurt" then
								variant = self.hurt_anim_variants[action_type][dir_str]
							else
								variant = self.hurt_anim_variants[action_type].not_crouching[dir_str][height]
							end

							if variant > 1 then
								variant = self:_pseudorandom(variant)
							end
						end
					end
				end

				variant = variant or 1

				if variant then
					common_data.machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
				end

				if height then
					common_data.machine:set_parameter(redir_res, height, 1)
				end

				if crouching then
					common_data.machine:set_parameter(redir_res, "crh", 1)
				end

				if action_type == "hurt" then
					common_data.machine:set_parameter(redir_res, "mod", 1)
				elseif action_type == "heavy_hurt" then
					common_data.machine:set_parameter(redir_res, "hvy", 1)
				elseif action_type == "death" then
					if not is_civilian then
						if death_type == "heavy" or action_desc.death_type == "heavy" then
							common_data.machine:set_parameter(redir_res, "heavy", 1)
						end
					end
				elseif action_type == "expl_hurt" then
					common_data.machine:set_parameter(redir_res, "expl", 1)
				end
			end
		end
	end

	if common_data.ext_anim.upper_body_active and not self._ragdolled then
		common_data.ext_movement:play_redirect("up_idle")
	end

	self._last_vel_z = 0
	self._hurt_type = action_type
	self._variant = action_desc.variant

	if action_type == "bleedout" then
		self.update = self._upd_bleedout

		if common_data.ext_inventory then
			--[[if self._is_server then
				common_data.ext_inventory:equip_selection(1, true)
			end]]

			local weapon_unit = common_data.ext_inventory:equipped_unit()
			self._weapon_unit = weapon_unit
			self._weapon_base = weapon_unit:base()
			local weap_tweak = weapon_unit:base():weapon_tweak_data()
			local weapon_usage_tweak = common_data.char_tweak.weapon[weap_tweak.usage]
			self._weap_tweak = weap_tweak
			self._w_usage_tweak = weapon_usage_tweak
			self._aim_delay_minmax = weapon_usage_tweak.aim_delay or {0, 0}
			self._focus_delay = weapon_usage_tweak.focus_delay or 0
			self._focus_displacement = weapon_usage_tweak.focus_dis or 500
			self._spread = weapon_usage_tweak.spread or 20
			self._miss_dis = weapon_usage_tweak.miss_dis or 30
			self._automatic_weap = weap_tweak.auto and weapon_usage_tweak.autofire_rounds and true or nil
			self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
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
			self._anim = redir_res
			self._shoot_t = t + 1

			local shoot_from_pos = common_data.ext_movement:m_head_pos()
			self._shoot_from_pos = shoot_from_pos
			self._shield_slotmask = managers.slot:get_mask("enemy_shield_check")

			local preset_name = "r_arm"
			local preset_data = self._ik_presets[preset_name]
			self._ik_preset = preset_data
			self[preset_data.start](self)
			self._skipped_frames = 1
		end
	elseif action_type == "hurt_sick" or action_type == "poison_hurt" or action_type == "concussion" then
		self.update = self._upd_sick
	elseif taser_tased_tasing or action_desc.variant == "tase" then
		self.update = self._upd_tased
	elseif not self._ragdolled then
		if common_data.unit:anim_data().skip_force_to_graph then
			self.update = self._upd_empty
		else
			self.update = self._upd_hurt
		end
	end

	local shoot_chance = nil
	local tase_shooting = nil

	if not uses_shield_anims and common_data.ext_inventory and not self._weapon_dropped and not common_data.ext_movement:cool() then
		local weapon_unit = common_data.ext_inventory:equipped_unit()

		if weapon_unit then
			if not weapon_unit:base().clip_empty or not weapon_unit:base():clip_empty() then
				if taser_tased_tasing or action_desc.variant == "tase" then
					shoot_chance = 1
					tase_shooting = true
				elseif action_type == "counter_tased" or action_type == "taser_tased" then
					shoot_chance = 1
				else
					if not is_stealth then
						if action_type == "death" then
							if common_data.char_tweak.shooting_death then
								shoot_chance = 0.1
							end
						elseif action_type == "hurt" or action_type == "heavy_hurt" or action_type == "expl_hurt" or action_type == "fire_hurt" then
							shoot_chance = 0.1
						end
					end
				end
			end
		end
	end

	if shoot_chance then
		if shoot_chance == 1 or self:_pseudorandom() <= shoot_chance then
			local equipped_weapon = common_data.ext_inventory:equipped_unit()
			self._weapon_unit = equipped_weapon
			self._weapon_base = equipped_weapon:base()

			common_data.unit:movement():set_friendly_fire(true)
			self._friendly_fire = true

			if self._is_server and not common_data.ext_base.nick_name then
				if action_type == "death" then
					local shooting_death_mask = managers.slot:get_mask("bullet_impact_targets_shooting_death")
					local civilian_mask = managers.slot:get_mask("civilians")
					local hostage_mask = 22
					shooting_death_mask = shooting_death_mask - civilian_mask - hostage_mask

					self._weapon_base:set_bullet_hit_slotmask(shooting_death_mask)
				else
					self._original_slot_mask = self._original_slot_mask or deep_clone(self._weapon_base._bullet_slotmask)

					local civilian_mask = managers.slot:get_mask("civilians")
					local hostage_mask = 22
					local new_slot_mask = self._original_slot_mask - civilian_mask - hostage_mask
					self._weapon_base:set_bullet_hit_slotmask(new_slot_mask)
					self._changed_slot_mask = true
				end
			end

			if tase_shooting then
				self._shooting_hurt_tase = true

				local weap_tweak = equipped_weapon:base():weapon_tweak_data()
				local weapon_usage_tweak = common_data.char_tweak.weapon[weap_tweak.usage]
				self._weap_tweak = weap_tweak
				self._w_usage_tweak = weapon_usage_tweak
				self._aim_delay_minmax = weapon_usage_tweak.aim_delay or {0, 0}
				self._focus_delay = weapon_usage_tweak.focus_delay or 0
				self._focus_displacement = weapon_usage_tweak.focus_dis or 500
				self._spread = weapon_usage_tweak.spread or 20
				self._miss_dis = weapon_usage_tweak.miss_dis or 30
				self._automatic_weap = weap_tweak.auto and weapon_usage_tweak.autofire_rounds and true or nil
				self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
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
				self._anim = redir_res
				self._shoot_t = t + 1

				local shoot_from_pos = common_data.ext_movement:m_head_pos()
				self._shoot_from_pos = shoot_from_pos

				local preset_name = "spine_head_r_arm"
				local preset_data = self._ik_presets[preset_name]
				self._ik_preset = preset_data
				self[preset_data.start](self)
				self._skipped_frames = 1
				self:on_attention(common_data.attention)
			elseif equipped_weapon:base():weapon_tweak_data().auto then
				equipped_weapon:base():start_autofire()

				self._shooting_hurt = true
			else
				self._delayed_shooting_hurt_clbk_id = "shooting_hurt" .. tostring(common_data.unit:key())

				managers.enemy:add_delayed_clbk(self._delayed_shooting_hurt_clbk_id, callback(self, self, "clbk_shooting_hurt"), TimerManager:game():time() + math_lerp(0.2, 0.4, self:_pseudorandom()))
			end
		end
	end

	if not common_data.ext_base.nick_name then
		if action_desc.variant == "fire" then
			if action_type == "fire_hurt" then
				common_data.unit:sound():say("burnhurt")
			elseif action_type == "death" then
				if common_data.ext_base:has_tag("tank") then
					common_data.unit:sound():say("x02a_any_3p")
				else
					common_data.unit:sound():say("burndeath")
				end
			end
		elseif action_type == "death" then
			common_data.unit:sound():say("x02a_any_3p")
		elseif action_type == "counter_tased" or action_type == "taser_tased" or action_desc.variant == "tase" then
			if common_data.ext_base:has_tag("taser") or common_data.ext_base:has_tag("taser_titan") then
				common_data.unit:sound():say("tasered")
			else
				common_data.unit:sound():say("x01a_any_3p")
			end
		elseif action_type == "hurt_sick" then
			if common_data.ext_base:has_tag("medic") or common_data.ext_base:has_tag("taser") or common_data.ext_base:has_tag("spooc") then
				common_data.unit:sound():say("burndeath")
			else
				if common_data.ext_base:has_tag("law") and not common_data.ext_base:has_tag("special") then
					common_data.unit:sound():say("ch3")
				else
					common_data.unit:sound():say("x01a_any_3p")
				end
			end
		else
			common_data.unit:sound():say("x01a_any_3p")
		end

		if action_type == "death" and common_data.ext_base:has_tag("tank") then
			local unit_id = common_data.unit:id()

			managers.fire:remove_dead_dozer_from_overgrill(unit_id)
		end

		if self._is_server then
			local radius, filter_name = nil

			if is_stealth then
				local default_radius = tweak_data.upgrades.cop_hurt_alert_radius_whisper

				if action_desc.attacker_unit and alive(action_desc.attacker_unit) and action_desc.attacker_unit:base() then
					if action_desc.attacker_unit:base().upgrade_value then
						radius = action_desc.attacker_unit:base():upgrade_value("player", "silent_kill") or default_radius
					elseif action_desc.attacker_unit:base().is_local_player then
						radius = managers.player:upgrade_value("player", "silent_kill", default_radius)
					end
				end

				if not radius then
					radius = default_radius
				end
			else
				radius = tweak_data.upgrades.cop_hurt_alert_radius
			end

			local new_alert = {
				"vo_distress",
				common_data.ext_movement:m_head_pos(),
				radius,
				common_data.ext_brain:SO_access(),
				common_data.unit
			}

			managers.groupai:state():propagate_alert(new_alert)
		end
	end

	if action_type == "death" and not action_desc.variant == "fire" or action_type == "bleedout" or action_type == "fatal" then
		self._floor_normal = self:_get_floor_normal(common_data.pos, common_data.fwd, common_data.right)
	end

	CopActionAct._create_blocks_table(self, action_desc.blocks)
	common_data.ext_movement:enable_update()

	if self._is_server then
		if action_desc.body_part == 1 or action_desc.body_part == 2 then
			local stand_rsrv = common_data.ext_brain:get_pos_rsrv("stand")

			if not stand_rsrv or mvec3_dis_sq(stand_rsrv.position, common_data.pos) > 400 then
				common_data.ext_brain:add_pos_rsrv("stand", {
					radius = 30,
					position = mvec3_copy(common_data.pos)
				})
			end
		end
	end

	if self:is_network_allowed(action_desc) then
		local params = {
			CopActionHurt.hurt_type_to_idx(action_type),
			action_desc.body_part,
			CopActionHurt.death_type_to_idx(death_type),
			CopActionHurt.type_to_idx(action_desc.type),
			CopActionHurt.variant_to_idx(action_desc.variant),
			action_desc.direction_vec or Vector3(),
			action_desc.hit_pos or Vector3()
		}

		common_data.ext_network:send("action_hurt_start", unpack(params))
	end

	return true
end

function CopActionHurt:is_network_allowed(action_desc)
	if not CopActionHurt.network_allowed_hurt_types[action_desc.hurt_type] then
		return false
	end

	if action_desc.allow_network == false then
		return false
	end

	return true
end

function CopActionHurt:_pseudorandom(a, b)
	local mult = 10
	local ht = managers.game_play_central:get_heist_timer()

	if ht < 0 then
		ht = -ht
	end

	while ht < 60 do
		ht = ht + ht
	end

	local is_host = self._is_server or Global.game_settings.single_player

	if not is_host then
		self._host_peer = self._host_peer or managers.network:session():peer(1)

		if self._host_peer then
			ht = ht + Network:qos(self._host_peer:rpc()).ping / 1000
		end
	end

	local t = math_floor(ht * mult + 0.5) / mult
	local r = math_random() * 999 + 1
	local uid = self._unit:id()
	local seed = uid^(t / 183.62) * 100 % 100000

	math_randomseed(seed)

	local ret = nil

	if a and b then
		ret = math_random(a, b)
	elseif a then
		ret = math_random(a)
	else
		ret = math_random()
	end

	math_randomseed(ht / r + ht)
	math_random()

	return ret
end

CopActionHurt.idx_to_hurt_type_map = {
	"bleedout",
	"light_hurt",
	"heavy_hurt",
	"expl_hurt",
	"hurt",
	"hurt_sick",
	"shield_knock",
	"knock_down",
	"stagger",
	"counter_tased",
	"taser_tased",
	"death",
	"fatal",
	"fire_hurt",
	"poison_hurt",
	"concussion",
	"healed"
}

function CopActionHurt.hurt_type_to_idx(hurt_type)
	local res = nil

	for idx, hurt in pairs(CopActionHurt.idx_to_hurt_type_map) do
		if hurt == hurt_type then
			res = idx

			break
		end
	end

	if not res then
		--Application:error("No idx for hurt type! ", hurt_type)

		return table_index_of(CopActionHurt.idx_to_hurt_type_map, "death")
	end

	return res
end

function CopActionHurt.death_type_to_idx(death)
	return table_index_of(CopActionHurt.idx_to_death_type_map, death)
end

CopActionHurt.idx_to_type_map = {
	"hurt",
	"heavy_hurt",
	"hurt_sick",
	"poison_hurt",
	"death",
	"healed"
}

function CopActionHurt.type_to_idx(hurt_type)
	return table_index_of(CopActionHurt.idx_to_type_map, hurt_type)
end

CopActionHurt.idx_to_variant_map = {
	"bullet",
	"melee",
	"explosion",
	"fire",
	"tase",
	"stun",
	"graze",
	"counter_spooc",
	"bleeding",
	"poison",
	"dot",
	"counter_tased",
	"other"
}

function CopActionHurt.variant_to_idx(var)
	local idx = table_index_of(CopActionHurt.idx_to_variant_map, var)

	if idx < 0 then
		return 4
	else
		return idx
	end
end

local tmp_used_flame_objects = nil

function CopActionHurt:_start_enemy_fire_effect_on_death(death_variant)
	local effect_tbl = tweak_data.fire.fire_death_anims[death_variant] or tweak_data.fire.fire_death_anims[0]
	local num_objects = #tweak_data.fire.fire_bones
	local num_effects = math_random(3, num_objects)

	if not tmp_used_flame_objects then
		tmp_used_flame_objects = {}

		for _, effect in ipairs(tweak_data.fire.fire_bones) do
			table_insert(tmp_used_flame_objects, false)
		end
	end

	local idx = 1
	local effect_id = nil
	local effects_table = {}

	for i = 1, num_effects, 1 do
		while tmp_used_flame_objects[idx] do
			idx = math_random(1, num_objects)
		end

		local bone = self._unit:get_object(Idstring(tweak_data.fire.fire_bones[idx]))

		if bone then
			local effect_name = tweak_data.fire.effects[effect_tbl.effect][tweak_data.fire.effects_cost[i]]
			effect_id = World:effect_manager():spawn({
				effect = Idstring(effect_name),
				parent = bone
			})

			table_insert(effects_table, effect_id)
		end

		tmp_used_flame_objects[idx] = true
	end

	self._fire_death_effects_table = effects_table

	for idx, _ in ipairs(tmp_used_flame_objects) do
		tmp_used_flame_objects[idx] = false
	end

	self._fire_death_sound_source_table = {enemy_unit = self._unit}

	managers.fire:start_burn_body_sound(self._fire_death_sound_source_table, effect_tbl.duration)
end

function CopActionHurt:_dragons_breath_sparks()
	local bone_spine = self._unit:get_object(ids_bone_spine)

	if bone_spine then
		World:effect_manager():spawn({
			effect = ids_dragons_breath_effect,
			parent = bone_spine
		})
	end
end

function CopActionHurt:_get_floor_normal(at_pos, fwd, right)
	local padding_height = 150
	local center_pos = at_pos + math_UP

	mvec3_set_z(center_pos, center_pos.z + padding_height)

	local fall = 100
	local down_vec = Vector3(0, 0, -fall - padding_height)
	local dis = 50
	local fwd_pos, bwd_pos, r_pos, l_pos = nil
	local from_pos = fwd * dis

	mvec3_add(from_pos, center_pos)

	local to_pos = from_pos + down_vec
	local down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		fwd_pos = down_ray.position
	else
		fwd_pos = to_pos:with_z(at_pos.z)
	end

	mvec3_set(from_pos, fwd)
	mvec3_mul(from_pos, -dis)
	mvec3_add(from_pos, center_pos)
	mvec3_set(to_pos, from_pos)
	mvec3_add(to_pos, down_vec)

	down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		bwd_pos = down_ray.position
	else
		bwd_pos = to_pos:with_z(at_pos.z)
	end

	mvec3_set(from_pos, right)
	mvec3_mul(from_pos, dis)
	mvec3_add(from_pos, center_pos)
	mvec3_set(to_pos, from_pos)
	mvec3_add(to_pos, down_vec)

	down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		r_pos = down_ray.position
	else
		r_pos = to_pos:with_z(at_pos.z)
	end

	mvec3_set(from_pos, right)
	mvec3_mul(from_pos, -dis)
	mvec3_add(from_pos, center_pos)
	mvec3_set(to_pos, from_pos)
	mvec3_add(to_pos, down_vec)

	down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		l_pos = down_ray.position
	else
		l_pos = to_pos

		mvec3_set_z(l_pos, at_pos.z)
	end

	local pose_fwd = fwd_pos

	mvec3_sub(pose_fwd, bwd_pos)

	local pose_l = l_pos

	mvec3_sub(pose_l, r_pos)

	local ground_normal = pose_fwd:cross(pose_l)

	mvec3_norm(ground_normal)

	return ground_normal
end

function CopActionHurt:on_exit()
	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	elseif self._shooting_hurt then
		self._shooting_hurt = false

		self._weapon_unit:base():stop_autofire()
	end

	if self._autofiring then
		self._weapon_base:stop_autofire()

		self._autofiring = nil
		self._autoshots_fired = nil
	end

	if self._friendly_fire then
		self._unit:movement():set_friendly_fire(false)

		self._friendly_fire = nil

		if self._changed_slot_mask then
			self._weapon_base:set_bullet_hit_slotmask(self._original_slot_mask)
		end
	end

	if self._modifier_on then
		self[self._ik_preset.stop](self)
	end

	if self._shooting_player and alive(self._attention.unit) then
		self._attention.unit:movement():on_targetted_for_attack(false, self._unit)
	end

	if self._expired then
		CopActionWalk._chk_correct_pose(self)
	end

	if self._tased_effect then
		World:effect_manager():fade_kill(self._tased_effect)
	end

	if self._is_server and not self._expired then
		if self._hurt_type == "bleedout" or self._hurt_type == "fatal" or self._variant == "tase" then
			self._common_data.ext_network:send("action_hurt_end")
		end

		--[[if self._hurt_type == "bleedout" or self._hurt_type == "fatal" then
			self._ext_inventory:equip_selection(2, true)
		end]]
	end

	if self._hurt_type == "fatal" or self._variant == "tase" then
		managers.hud:set_mugshot_normal(self._unit:unit_data().mugshot_id)
	end

	if self._unit and alive(self._unit) and self._ext_damage.character_damage and self._ext_damage.call_listener then
		self._ext_damage:call_listener("on_exit_hurt")
	end
end

function CopActionHurt:_get_pos_clamped_to_graph(test_head)
	local tracker = self._ext_movement:nav_tracker()
	local r = tracker:field_position()
	local new_pos = tmp_vec1

	mvec3_set(new_pos, self._unit:get_animation_delta_position())
	mvec3_set_z(new_pos, 0)
	mvec3_add(new_pos, r)

	local ray_params = nil

	if test_head then
		local h = tmp_vec2

		mvec3_set(h, self._common_data.ext_movement._obj_head:position())
		mvec3_set_z(h, new_pos.z)

		ray_params = {
			trace = true,
			tracker_from = tracker,
			pos_to = h
		}
		local hit = managers.navigation:raycast(ray_params)
		local nh = ray_params.trace[1]
		local collision_side = ray_params.trace[2]

		if hit and collision_side then
			mvec3_set(tmp_vec3, managers.navigation._dir_str_to_vec[collision_side])
			mvec3_sub(h, nh)
			mvec3_set_z(h, 0)

			local error_amount = -mvec3_dot(tmp_vec3, h)

			mvec3_mul(tmp_vec3, error_amount)
			mvec3_add(new_pos, tmp_vec3)
		end
	else
		ray_params = {
			tracker_from = tracker
		}
	end

	ray_params.pos_to = new_pos
	ray_params.trace = true

	managers.navigation:raycast(ray_params)
	mvec3_set(new_pos, ray_params.trace[1])

	return new_pos
end

function CopActionHurt:_upd_empty(t)
end

function CopActionHurt:_upd_sick(t)
	local dt = TimerManager:game():delta_time()

	self._last_pos = self:_get_pos_clamped_to_graph(true)

	CopActionWalk._set_new_pos(self, dt)

	local new_rot = self._unit:get_animation_delta_rotation()
	new_rot = self._common_data.rot * new_rot

	mrot_set(new_rot, new_rot:yaw(), 0, 0)

	self._ext_movement:set_rotation(new_rot)

	if not self._sick_time or self._sick_time < t then
		self._expired = true
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end

function CopActionHurt:_upd_tased(t)
	local dt = TimerManager:game():delta_time()

	if self._ext_anim.tased or self._ext_anim.tased_loop then
		if self._shooting_hurt_tase then
			self:_upd_tase_shooting(t)
		end

		self._last_pos = self:_get_pos_clamped_to_graph(true)

		CopActionWalk._set_new_pos(self, dt)

		local new_rot = self._unit:get_animation_delta_rotation()
		new_rot = self._common_data.rot * new_rot

		mrot_set(new_rot, new_rot:yaw(), 0, 0)

		self._ext_movement:set_rotation(new_rot)
	else
		self._shooting_hurt_tase = nil

		if self._autofiring then
			self._weapon_base:stop_autofire()

			self._autofiring = nil
			self._autoshots_fired = nil
		end
	end

	if self._tased_time and self._tased_time < t then
		if self._tased_down_time and t < self._tased_down_time then
			self._ext_movement:play_redirect("fatal")
			self.update = self._upd_tased_down
			self._shooting_hurt_tase = nil

			if self._autofiring then
				self._weapon_base:stop_autofire()

				self._autofiring = nil
				self._autoshots_fired = nil
			end
		else
			self._expired = true
		end
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end

function CopActionHurt:_upd_tased_down(t)
	if not self._tased_down_time or self._tased_down_time < t then
		self._expired = true
	end
end

function CopActionHurt:_upd_hurt(t)
	local dt = TimerManager:game():delta_time()

	if self._ext_anim.hurt or self._ext_anim.death then
		if self._shooting_hurt then
			local weap_unit = self._weapon_unit
			local weap_unit_base = weap_unit:base()
			local shoot_from_pos = weap_unit:position()
			local shoot_fwd = weap_unit:rotation():y()
			local dmg_buff = self._ext_base:get_total_buff("base_damage")
			local dmg_mul = 1 + dmg_buff

			weap_unit_base:trigger_held(shoot_from_pos, shoot_fwd, dmg_mul, nil, 1.2)

			if weap_unit_base.clip_empty and weap_unit_base:clip_empty() then
				self._shooting_hurt = false

				weap_unit_base:stop_autofire()
			end
		end

		self._last_pos = self:_get_pos_clamped_to_graph(true)

		CopActionWalk._set_new_pos(self, dt)

		local new_rot = self._unit:get_animation_delta_rotation()
		new_rot = self._common_data.rot * new_rot

		mrot_set(new_rot, new_rot:yaw(), 0, 0)

		if self._ext_anim.death then
			local rel_prog = math_clamp(self._machine:segment_relative_time(ids_base), 0, 1)

			if self._floor_normal == nil then
				self._floor_normal = Vector3(0, 0, 1)
			end

			local normal = math_lerp(math_UP, self._floor_normal, rel_prog)
			local fwd = new_rot:y()

			mvec3_cross(tmp_vec1, fwd, normal)
			mvec3_cross(fwd, normal, tmp_vec1)

			new_rot = Rotation(fwd, normal)
		end

		self._ext_movement:set_rotation(new_rot)

		if self._ext_anim.base_need_upd then
			self._ext_movement:upd_m_head_pos()
		end
	else
		if self._shooting_hurt then
			self._shooting_hurt = false

			self._weapon_unit:base():stop_autofire()
		end

		if self._delayed_shooting_hurt_clbk_id then
			managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

			self._delayed_shooting_hurt_clbk_id = nil
		end

		if self._hurt_type == "death" then
			self._died = true
		else
			self._expired = true
		end
	end
end

function CopActionHurt:_upd_tase_shooting(t)
	local vis_state = self._ext_base:lod_stage()
	vis_state = vis_state or 4

	if not self._autofiring and vis_state ~= 1 then
		if self._skipped_frames < vis_state * 3 then
			self._skipped_frames = self._skipped_frames + 1

			return
		else
			self._skipped_frames = 1
		end
	end

	if self._weapon_base.clip_empty and self._weapon_base:clip_empty() then
		if self._autofiring then
			self._weapon_base:stop_autofire()

			self._autofiring = nil
			self._autoshots_fired = nil
		end

		if self._modifier_on then
			self._modifier_on = nil

			self._machine:allow_modifier(self._spine_modifier_name)
			self._machine:allow_modifier(self._head_modifier_name)
			self._machine:allow_modifier(self._r_arm_modifier_name)
		end

		self._shooting_hurt_tase = nil

		return
	end

	local shoot_from_pos = self._shoot_from_pos
	local target_pos, target_vec, target_dis, autotarget = nil

	if self._attention then
		target_pos, target_vec, target_dis, autotarget = self:_get_target_pos(shoot_from_pos, self._attention, t)

		local tar_vec_flat = temp_vec2

		mvec3_set(tar_vec_flat, target_vec)
		mvec3_set_z(tar_vec_flat, 0)
		mvec3_norm(tar_vec_flat)

		local fwd = self._common_data.fwd
		local fwd_dot = mvec3_dot(fwd, tar_vec_flat)

		target_vec = self:_upd_ik(target_vec, fwd_dot, t)
	elseif self._modifier_on then
		self._modifier_on = nil

		self._machine:allow_modifier(self._spine_modifier_name)
		self._machine:allow_modifier(self._head_modifier_name)
		self._machine:allow_modifier(self._r_arm_modifier_name)
	end

	if self._autofiring then
		if target_vec then
			local spread = self._spread
			local falloff, i_range = CopActionShoot._get_shoot_falloff(self, target_dis, self._falloff)
			local dmg_buff = self._ext_base:get_total_buff("base_damage")
			local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul
			local new_target_pos = self._shoot_history and CopActionShoot._get_unit_shoot_pos(self, t, target_pos, target_dis, falloff, i_range, autotarget)

			if new_target_pos then
				target_pos = new_target_pos
			else
				spread = math_min(20, spread)
			end

			local spread_pos = temp_vec2

			mvec3_rand_orth(spread_pos, target_vec)
			mvec3_set_l(spread_pos, spread)
			mvec3_add(spread_pos, target_pos)
			mvec3_dir(target_vec, shoot_from_pos, spread_pos)

			local fired = self._weapon_base:trigger_held(shoot_from_pos, target_vec, dmg_mul, autotarget, 1.2, nil, nil, self._attention.unit)

			if fired then
				if not self._autofiring or self._autofiring - 1 <= self._autoshots_fired then
					self._autofiring = nil
					self._autoshots_fired = nil

					self._weapon_base:stop_autofire()

					self._shoot_t = t + math_lerp(1, 1.2, self:_pseudorandom())
				else
					self._autoshots_fired = self._autoshots_fired + 1
				end
			end
		else
			local spread = self._spread
			local dmg_buff = self._ext_base:get_total_buff("base_damage")
			local dmg_mul = 1 + dmg_buff
			shoot_from_pos = self._weapon_unit:position()
			target_vec = self._weapon_unit:rotation():y()

			local target_pos = mvec3_copy(shoot_from_pos) + target_vec * 500
			local spread_pos = temp_vec2
			mvec3_rand_orth(spread_pos, target_vec)
			mvec3_set_l(spread_pos, spread)
			mvec3_add(spread_pos, target_pos)
			mvec3_dir(target_vec, shoot_from_pos, spread_pos)

			local fired = self._weapon_base:trigger_held(shoot_from_pos, target_vec, dmg_mul, nil, 1.2)

			if fired then
				if not self._autofiring or self._autofiring - 1 <= self._autoshots_fired then
					self._autofiring = nil
					self._autoshots_fired = nil

					self._weapon_base:stop_autofire()

					self._shoot_t = t + math_lerp(1, 1.2, self:_pseudorandom())
				else
					self._autoshots_fired = self._autoshots_fired + 1
				end
			end
		end
	elseif self._shoot_t < t then
		if target_vec then
			local falloff, i_range = CopActionShoot._get_shoot_falloff(self, target_dis, self._falloff)
			local dmg_buff = self._ext_base:get_total_buff("base_damage")
			local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul

			if self._automatic_weap then
				self._weapon_base:start_autofire()

				if self._w_usage_tweak.autofire_rounds then
					if falloff.autofire_rounds then
						self._autofiring = falloff.autofire_rounds[1] + self:_pseudorandom(falloff.autofire_rounds[1])
					else
						self._autofiring = self._w_usage_tweak.autofire_rounds[1] + self:_pseudorandom(self._w_usage_tweak.autofire_rounds[1])
					end
				end

				self._autoshots_fired = 0
			else
				local spread = self._spread
				local new_target_pos = self._shoot_history and CopActionShoot._get_unit_shoot_pos(self, t, target_pos, target_dis, falloff, i_range, autotarget)

				if new_target_pos then
					target_pos = new_target_pos
				else
					spread = math_min(20, spread)
				end

				local spread_pos = temp_vec2

				mvec3_rand_orth(spread_pos, target_vec)
				mvec3_set_l(spread_pos, spread)
				mvec3_add(spread_pos, target_pos)
				mvec3_dir(target_vec, shoot_from_pos, spread_pos)

				local fired = self._weapon_base:singleshot(shoot_from_pos, target_vec, dmg_mul, autotarget, 1.2, nil, nil, self._attention.unit)

				if fired then
					local recoil_1 = nil
					local recoil_2 = nil

					if self._weap_tweak.custom_single_fire_rate then
						recoil_1 = self._weap_tweak.custom_single_fire_rate
						recoil_2 = self._weap_tweak.custom_single_fire_rate * 1.5
					else
						recoil_1 = 1
						recoil_2 = 1.2
					end

					self._shoot_t = t + math_lerp(recoil_1, recoil_2, self:_pseudorandom())
				end
			end
		else
			local dmg_buff = self._ext_base:get_total_buff("base_damage")
			local dmg_mul = 1 + dmg_buff

			if self._automatic_weap then
				self._weapon_base:start_autofire()

				if self._w_usage_tweak.autofire_rounds then
					self._autofiring = math_round(math_lerp(self._w_usage_tweak.autofire_rounds[1], self._w_usage_tweak.autofire_rounds[2], self:_pseudorandom()))
				end

				self._autoshots_fired = 0
			else
				local spread = self._spread
				local dmg_buff = self._ext_base:get_total_buff("base_damage")
				local dmg_mul = 1 + dmg_buff
				shoot_from_pos = self._weapon_unit:position()
				target_vec = self._weapon_unit:rotation():y()

				local target_pos = mvec3_copy(shoot_from_pos) + target_vec * 500
				local spread_pos = temp_vec2
				mvec3_rand_orth(spread_pos, target_vec)
				mvec3_set_l(spread_pos, spread)
				mvec3_add(spread_pos, target_pos)
				mvec3_dir(target_vec, shoot_from_pos, spread_pos)

				local fired = self._weapon_base:singleshot(shoot_from_pos, target_vec, dmg_mul, nil, 1.2)

				if fired then
					local recoil_1 = nil
					local recoil_2 = nil

					if self._weap_tweak.custom_single_fire_rate then
						recoil_1 = self._weap_tweak.custom_single_fire_rate
						recoil_2 = self._weap_tweak.custom_single_fire_rate * 1.5
					else
						recoil_1 = 1
						recoil_2 = 1.2
					end

					self._shoot_t = t + math_lerp(recoil_1, recoil_2, self:_pseudorandom())
				end
			end
		end
	end
end

function CopActionHurt:_upd_bleedout(t)
	if self._floor_normal then
		local normal = nil

		if self._ext_anim.bleedout_enter then
			local rel_t = self._machine:segment_relative_time(ids_base)
			rel_t = math_min(1, rel_t + 0.5)
			local rel_prog = math_clamp(rel_t, 0, 1)
			normal = math_lerp(math_UP, self._floor_normal, rel_prog)

			self._ext_movement:set_m_pos(self._common_data.pos)
		else
			normal = self._floor_normal
			self._floor_normal = nil
		end

		mvec3_cross(tmp_vec1, self._common_data.fwd, normal)
		mvec3_cross(tmp_vec2, normal, tmp_vec1)

		local new_rot = Rotation(tmp_vec2, normal)

		self._ext_movement:set_rotation(new_rot)
	end

	if not self._ext_anim.bleedout_enter and self._weapon_unit then
		if not self._initial_attention_set then
			self:on_attention(self._common_data.attention)
			self._initial_attention_set = true

			return
		end

		local vis_state = self._ext_base:lod_stage()
		vis_state = vis_state or 4

		if not self._autofiring and vis_state ~= 1 then
			if self._skipped_frames < vis_state * 3 then
				self._skipped_frames = self._skipped_frames + 1

				return
			else
				self._skipped_frames = 1
			end
		end

		local shoot_from_pos = self._shoot_from_pos
		local target_pos, target_vec, target_dis, autotarget = nil

		if self._attention and not self._ext_anim.reload and not self._ext_anim.equip then
			target_pos, target_vec, target_dis, autotarget = self:_get_target_pos(shoot_from_pos, self._attention, t)
			target_vec = self:_upd_ik(target_vec, nil, t)

			local aim_polar = target_vec:to_polar_with_reference(self._common_data.fwd, math_UP)
			local aim_spin_d90 = aim_polar.spin / 90
			local anim = self._machine:segment_state(ids_base)
			local fwd = 1 - math_clamp(math_abs(aim_spin_d90), 0, 1)

			self._machine:set_parameter(anim, "angle0", fwd)

			local bwd = math_clamp(math_abs(aim_spin_d90), 1, 2) - 1

			self._machine:set_parameter(anim, "angle180", bwd)

			local l = 1 - math_clamp(math_abs(aim_spin_d90 - 1), 0, 1)

			self._machine:set_parameter(anim, "angle90neg", l)

			local r = 1 - math_clamp(math_abs(aim_spin_d90 + 1), 0, 1)

			self._machine:set_parameter(anim, "angle90", r)

			if self._weapon_base:clip_empty() then
				if self._autofiring then
					self._weapon_base:stop_autofire()

					self._autofiring = nil
					self._autoshots_fired = nil
				end

				local res = self._ext_movement:play_redirect("reload")

				if res then
					self._machine:set_speed(res, self._reload_speed)
					self._weapon_base:on_reload()
				end

				if self._is_server then
					managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
				end
			elseif self._autofiring then
				if not self._common_data.allow_fire or not target_vec then
					self._weapon_base:stop_autofire()

					self._shoot_t = t + 0.6
					self._autofiring = nil
					self._autoshots_fired = nil
				else
					local spread = self._spread
					local falloff, i_range = CopActionShoot._get_shoot_falloff(self, target_dis, self._falloff)
					local dmg_buff = self._ext_base:get_total_buff("base_damage")
					local dmg_mul = (1 + dmg_buff) * falloff.dmg_mul
					local new_target_pos = self._shoot_history and CopActionShoot._get_unit_shoot_pos(self, t, target_pos, target_dis, falloff, i_range, autotarget)

					if new_target_pos then
						target_pos = new_target_pos
					else
						spread = math_min(20, spread)
					end

					local spread_pos = temp_vec2

					mvec3_rand_orth(spread_pos, target_vec)
					mvec3_set_l(spread_pos, spread)
					mvec3_add(spread_pos, target_pos)
					mvec3_dir(target_vec, shoot_from_pos, spread_pos)

					local fired = self._weapon_base:trigger_held(shoot_from_pos, target_vec, dmg_mul, autotarget, nil, nil, nil, self._attention.unit)

					if fired then
						if not self._autofiring or self._autofiring - 1 <= self._autoshots_fired then
							self._autofiring = nil
							self._autoshots_fired = nil

							self._weapon_base:stop_autofire()

							local lerp_dis = math_min(1, target_dis / self._falloff[#self._falloff].r)
							local shoot_delay = math_lerp(falloff.recoil[1], falloff.recoil[2], lerp_dis)

							if self._common_data.is_suppressed then
								shoot_delay = shoot_delay * 1.5
							end

							self._shoot_t = t + shoot_delay
						else
							self._autoshots_fired = self._autoshots_fired + 1
						end
					end
				end
			elseif self._common_data.allow_fire and target_vec and self._mod_enable_t < t then
				local shoot = nil

				if self._line_of_sight_t then
					if not self._shooting_husk_unit or self._next_vis_ray_t < t then
						if self._shooting_husk_unit then
							self._next_vis_ray_t = t + 2
						end

						local fire_line_is_obstructed = self._unit:raycast("ray", shoot_from_pos, target_pos, "slot_mask", managers.slot:get_mask("AI_visibility"), "ray_type", "ai_vision")

						if fire_line_is_obstructed then
							if t - self._line_of_sight_t > 3 then
								local aim_delay = 0
								local aim_delay_minmax = self._aim_delay_minmax

								if aim_delay_minmax[1] ~= 0 or aim_delay_minmax[2] ~= 0 then
									if aim_delay_minmax[1] == aim_delay_minmax[2] then
										aim_delay = aim_delay_minmax[1]
									else
										local lerp_dis = math_min(1, target_dis / self._falloff[#self._falloff].r)

										aim_delay = math_lerp(aim_delay_minmax[1], aim_delay_minmax[2], lerp_dis)
									end

									aim_delay = aim_delay + self:_pseudorandom() * aim_delay * 0.3

									if self._common_data.is_suppressed then
										aim_delay = aim_delay * 1.5
									end
								end

								self._shoot_t = t + aim_delay
							elseif fire_line_is_obstructed.distance > 300 then
								shoot = true
							end
						else
							local shield_in_the_way = nil

							if not self._weapon_base._use_armor_piercing or self._shooting_player then
								if self._shield then
									shield_in_the_way = self._unit:raycast("ray", shoot_from_pos, target_pos, "slot_mask", self._shield_slotmask, "ignore_unit", self._shield, "report")
								else
									shield_in_the_way = self._unit:raycast("ray", shoot_from_pos, target_pos, "slot_mask", self._shield_slotmask, "report")
								end
							end

							if not shield_in_the_way then
								shoot = true
							end

							if not self._last_vis_check_status and t - self._line_of_sight_t > 1 then
								self._shoot_history.focus_start_t = t
							end

							self._shoot_history.m_last_pos = mvec3_copy(target_pos)
							self._line_of_sight_t = t
						end

						self._last_vis_check_status = shoot
					elseif self._shooting_husk_unit then
						shoot = self._last_vis_check_status
					end
				else
					shoot = true
				end

				if shoot and self._shoot_t < t then
					local falloff, i_range = CopActionShoot._get_shoot_falloff(self, target_dis, self._falloff)
					local dmg_buff = self._ext_base:get_total_buff("base_damage")
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
								self._autofiring = math_round(falloff.autofire_rounds[1] + self:_pseudorandom() * diff)
							else
								local diff = self._w_usage_tweak.autofire_rounds[2] - self._w_usage_tweak.autofire_rounds[1]
								self._autofiring = math_round(self._w_usage_tweak.autofire_rounds[1] + self:_pseudorandom() * diff)
							end
						--[[else
							Application:stack_dump_error("autofire_rounds is missing from weapon usage tweak data!", self._weap_tweak.usage)]]
						end

						self._autoshots_fired = 0
					else
						local spread = self._spread
						local new_target_pos = self._shoot_history and CopActionShoot._get_unit_shoot_pos(self, t, target_pos, target_dis, falloff, i_range, autotarget)

						if new_target_pos then
							target_pos = new_target_pos
						else
							spread = math_min(20, spread)
						end

						local spread_pos = temp_vec2

						mvec3_rand_orth(spread_pos, target_vec)
						mvec3_set_l(spread_pos, spread)
						mvec3_add(spread_pos, target_pos)
						mvec3_dir(target_vec, shoot_from_pos, spread_pos)

						local fired = self._weapon_base:singleshot(shoot_from_pos, target_vec, dmg_mul, autotarget, nil, nil, nil, self._attention.unit)

						if fired then
							local recoil_1 = nil
							local recoil_2 = nil

							if self._weap_tweak.custom_single_fire_rate then
								recoil_1 = self._weap_tweak.custom_single_fire_rate
								recoil_2 = self._weap_tweak.custom_single_fire_rate * #self._falloff * 1.5
							else
								recoil_1 = falloff.recoil[1]
								recoil_2 = falloff.recoil[2]
							end

							local lerp_dis = math_min(1, target_dis / self._falloff[#self._falloff].r)
							local shoot_delay = math_lerp(recoil_1, recoil_2, lerp_dis)

							if self._common_data.is_suppressed then
								shoot_delay = shoot_delay * 1.5
							end

							self._shoot_t = t + shoot_delay
						end
					end
				end
			end
		else
			if self._autofiring then
				self._weapon_base:stop_autofire()

				self._autofiring = nil
				self._autoshots_fired = nil
			end

			if self._modifier_on then
				self._modifier_on = nil

				self._machine:allow_modifier(self._head_modifier_name)
				self._machine:allow_modifier(self._r_arm_modifier_name)
			end
		end

		if self._ext_anim.base_need_upd then
			self._ext_movement:upd_m_head_pos()
		end
	end
end

function CopActionHurt:_upd_ragdolled(t)
	local dt = TimerManager:game():delta_time()

	if self._shooting_hurt then
		local weap_unit = self._weapon_unit
		local weap_unit_base = weap_unit:base()
		local shoot_from_pos = weap_unit:position()
		local shoot_fwd = weap_unit:rotation():y()
		local dmg_buff = self._ext_base:get_total_buff("base_damage")
		local dmg_mul = 1 + dmg_buff

		weap_unit_base:trigger_held(shoot_from_pos, shoot_fwd, dmg_mul, nil, 1.2)

		if weap_unit_base.clip_empty and weap_unit_base:clip_empty() then
			self._shooting_hurt = false

			weap_unit_base:stop_autofire()
		end
	end

	if self._ragdoll_active then
		self._hips_obj:m_position(tmp_vec1)
		self._ext_movement:set_position(tmp_vec1)
	end

	if not self._ragdoll_freeze_clbk_id and not self._shooting_hurt then
		self._died = true
	end
end

function CopActionHurt:chk_block(action_type, t)
	if action_type == "death" then
		return false
	elseif action_type == "turn" or CopActionAct.chk_block(self, action_type, t) then
		return true
	elseif action_type ~= "bleedout" and action_type ~= "fatal" and self._variant ~= "tase" and not self._ext_anim.hurt_exit then
		return true
	end
end

function CopActionHurt:on_attention(attention, old_attention)
	if self._shooting_player and old_attention and alive(old_attention.unit) then
		old_attention.unit:movement():on_targetted_for_attack(false, self._common_data.unit)
	end

	self._shooting_player = nil

	if self._hurt_type ~= "bleedout" then
		if self._shooting_hurt_tase then
			if attention then
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

				if attention.unit and attention.unit:base() and attention.unit:base().is_local_player then
					self._shooting_player = true
					attention.unit:movement():on_targetted_for_attack(true, self._unit)
				end

				local target_pos, _, target_dis = self:_get_target_pos(self._shoot_from_pos, attention, t)
				local shoot_hist = self._shoot_history

				if shoot_hist then
					self._shoot_t = t
					shoot_hist.focus_start_t = t
					shoot_hist.m_last_pos = mvec3_copy(target_pos)
				else
					self._shoot_t = t

					shoot_hist = {
						focus_start_t = t,
						focus_delay = self._focus_delay,
						m_last_pos = mvec3_copy(target_pos)
					}
					self._shoot_history = shoot_hist
				end
			else
				self[self._ik_preset.stop](self)

				if self._aim_transition then
					self._aim_transition = nil
					self._get_target_pos = nil
				end
			end
		end

		self._attention = attention

		return
	end

	self._shooting_husk_unit = nil
	self._next_vis_ray_t = nil

	if attention then
		local t = TimerManager:game():time()

		self[self._ik_preset.start](self)

		local vis_state = self._ext_base:lod_stage()

		if vis_state and vis_state < 3 then
			self._aim_transition = {
				duration = 0.5,
				start_t = t,
				start_vec = mvec3_copy(self._common_data.look_vec)
			}
			self._get_target_pos = self._get_transition_target_pos
		else
			self._aim_transition = nil
			self._get_target_pos = nil
		end

		self._mod_enable_t = t

		if attention.unit then
			if attention.unit:base() and attention.unit:base().is_local_player then
				self._shooting_player = true
				attention.unit:movement():on_targetted_for_attack(true, self._unit)
			else
				if self._is_server then
					if attention.unit:base() and attention.unit:base().is_husk_player then
						self._shooting_husk_unit = true
						self._next_vis_ray_t = t - 1
					end
				else
					self._shooting_husk_unit = true
					self._next_vis_ray_t = t - 1
				end
			end

			self._line_of_sight_t = t - 2

			local target_pos, _, target_dis = self:_get_target_pos(self._shoot_from_pos, attention, t)
			local usage_tweak = self._w_usage_tweak
			local shoot_hist = self._shoot_history
			local aim_delay = 0
			local aim_delay_minmax = self._aim_delay_minmax

			if shoot_hist then
				local displacement = mvec3_dis(target_pos, shoot_hist.m_last_pos)

				if displacement > self._focus_displacement then
					if aim_delay_minmax[1] ~= 0 or aim_delay_minmax[2] ~= 0 then
						if aim_delay_minmax[1] == aim_delay_minmax[2] then
							aim_delay = aim_delay_minmax[1]
						else
							local lerp_dis = math_min(1, self._focus_displacement / displacement)

							aim_delay = math_lerp(aim_delay_minmax[2], aim_delay_minmax[1], lerp_dis)
						end

						if self._common_data.is_suppressed then
							aim_delay = aim_delay * 1.5
						end
					end

					self._shoot_t = self._mod_enable_t + aim_delay
					shoot_hist.focus_start_t = t
				end

				shoot_hist.m_last_pos = mvec3_copy(target_pos)
			else
				if aim_delay_minmax[1] ~= 0 or aim_delay_minmax[2] ~= 0 then
					if aim_delay_minmax[1] == aim_delay_minmax[2] then
						aim_delay = aim_delay_minmax[1]
					else
						local lerp_dis = math_min(1, target_dis / self._falloff[#self._falloff].r)

						aim_delay = math_lerp(aim_delay_minmax[1], aim_delay_minmax[2], lerp_dis)
					end

					if self._common_data.is_suppressed then
						aim_delay = aim_delay * 1.5
					end
				end

				self._shoot_t = self._mod_enable_t + aim_delay

				shoot_hist = {
					focus_start_t = t,
					focus_delay = self._focus_delay,
					m_last_pos = mvec3_copy(target_pos)
				}
				self._shoot_history = shoot_hist
			end
		end
	else
		self[self._ik_preset.stop](self)

		if self._aim_transition then
			self._aim_transition = nil
			self._get_target_pos = nil
		end
	end

	self._attention = attention
end

function CopActionHurt:on_death_exit()
	if self._shooting_hurt then
		self._shooting_hurt = false

		self._weapon_unit:base():stop_autofire()
	end

	if self._autofiring then
		self._weapon_base:stop_autofire()

		self._autofiring = nil
		self._autoshots_fired = nil
	end

	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if not self._ragdolled then
		self._unit:set_animations_enabled(false)
	end
end

function CopActionHurt:on_death_drop(unit, stage)
	if self._weapon_dropped then
		return
	end

	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if self._autofiring then
		self._weapon_base:stop_autofire()

		self._autofiring = nil
		self._autoshots_fired = nil
	end

	if self._shooting_hurt then
		if stage == 2 then
			self._weapon_unit:base():stop_autofire()
			self._ext_inventory:drop_weapon()

			self._weapon_dropped = true
			self._shooting_hurt = false
		end
	elseif self._ext_inventory then
		self._ext_inventory:drop_weapon()

		self._weapon_dropped = true
	end
end

function CopActionHurt:on_inventory_event(event)
	local weapon_unit = self._ext_inventory:equipped_unit()

	if weapon_unit then
		local weap_tweak = weapon_unit:base():weapon_tweak_data()
		local weapon_usage_tweak = self._common_data.char_tweak.weapon[weap_tweak.usage]
		self._weapon_unit = weapon_unit
		self._weapon_base = weapon_unit:base()
		self._weap_tweak = weap_tweak
		self._w_usage_tweak = weapon_usage_tweak
		self._aim_delay_minmax = weapon_usage_tweak.aim_delay or {0, 0}
		self._focus_delay = weapon_usage_tweak.focus_delay or 0
		self._focus_displacement = weapon_usage_tweak.focus_dis or 500
		self._spread = weapon_usage_tweak.spread or 20
		self._miss_dis = weapon_usage_tweak.miss_dis or 30
		self._automatic_weap = weap_tweak.auto and weapon_usage_tweak.autofire_rounds and true or nil
		self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
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
	else
		self._weapon_unit = false
		self._shooting_hurt = false
	end
end

function CopActionHurt:_start_ragdoll(reset_momentum)
	if self._skip_ragdoll_sequence then
		if not reset_momentum then
			self:on_death_drop(self._unit, 2)
		end

		return
	end

	if self._ragdolled then
		return true
	end

	if reset_momentum and self._unit:damage() and self._unit:damage():has_sequence("leg_arm_hitbox") then
		self._unit:damage():run_sequence_simple("leg_arm_hitbox")
	end

	if self._unit:damage() and self._unit:damage():has_sequence("switch_to_ragdoll") then
		self:on_death_drop(self._unit, 2)

		self._ragdolled = true

		self._ext_base:set_visibility_state(1)
		self._unit:set_driving("orientation_object")
		self._machine:set_enabled(false)
		self._unit:set_animations_enabled(false)

		local res = self._unit:damage():run_sequence_simple("switch_to_ragdoll")

		self._unit:add_body_activation_callback(callback(self, self, "clbk_body_active_state"))

		self._root_act_tags = {}
		local hips_body = self._unit:body("rag_Hips")
		local tag = hips_body:activate_tag()

		if tag == ids_empty then
			tag = ids_root_follow

			hips_body:set_activate_tag(tag)
		end

		self._root_act_tags[tag:key()] = true
		tag = hips_body:deactivate_tag()

		if tag == ids_empty then
			tag = ids_root_follow

			hips_body:set_deactivate_tag(tag)
		end

		self._root_act_tags[tag:key()] = true
		self._hips_obj = self._unit:get_object(ids_hips)
		self._ragdoll_active = true

		self._ext_movement:enable_update()

		local hips_pos = self._hips_obj:position()
		self._rag_pos = hips_pos
		self._ragdoll_freeze_clbk_id = "freeze_rag" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._ragdoll_freeze_clbk_id, callback(self, self, "clbk_chk_freeze_ragdoll"), TimerManager:game():time() + 3)

		if self._ext_anim.repel_loop then
			self._unit:sound():anim_clbk_play_sound(self._unit, "repel_end")
		end

		return true
	end
end

function CopActionHurt:clbk_chk_freeze_ragdoll()
	if not alive(self._unit) then
		self._ragdoll_freeze_clbk_id = nil

		return
	end

	self._hips_obj:m_position(tmp_vec1)

	local cur_dis = mvec3_dis(self._rag_pos, tmp_vec1)

	if cur_dis < 30 then
		self:_freeze_ragdoll()

		self._ragdoll_freeze_clbk_id = nil
	else
		mvec3_set(self._rag_pos, tmp_vec1)
		managers.enemy:add_delayed_clbk(self._ragdoll_freeze_clbk_id, callback(self, self, "clbk_chk_freeze_ragdoll"), TimerManager:game():time() + 1.5)
	end
end

function CopActionHurt:clbk_shooting_hurt()
	self._delayed_shooting_hurt_clbk_id = nil

	if not alive(self._weapon_unit) then
		return
	end

	local weap_unit = self._weapon_unit
	local weap_base = weap_unit:base()
	local shoot_from_pos = weap_unit:position()
	local shoot_fwd = weap_unit:rotation():y()
	local dmg_buff = self._ext_base:get_total_buff("base_damage")
	local dmg_mul = 1 + dmg_buff

	weap_base:singleshot(shoot_from_pos, shoot_fwd, dmg_mul, nil, 1.2)
end

function CopActionHurt:on_destroy()
	if self._shooting_hurt then
		self._shooting_hurt = false

		self._weapon_unit:base():stop_autofire()
	end

	if self._autofiring then
		self._weapon_base:stop_autofire()

		self._autofiring = nil
		self._autoshots_fired = nil
	end

	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if self._fire_death_effects_table then
		for _, fire_effect_id in ipairs(self._fire_death_effects_table) do
			World:effect_manager():fade_kill(fire_effect_id)
		end
	end

	if self._fire_death_sound_source_table and self._fire_death_sound_source_table.sound_source then
		managers.fire:_stop_burn_body_sound(self._fire_death_sound_source_table.sound_source)
	end
end

function CopActionHurt:_get_transition_target_pos(shoot_from_pos, attention, t)
	local transition = self._aim_transition
	local prog = (t - transition.start_t) / transition.duration

	if prog > 1 then
		self._aim_transition = nil
		self._get_target_pos = nil

		return self:_get_target_pos(shoot_from_pos, attention)
	end

	prog = math_bezier(bezier_curve, prog)
	local target_pos, target_vec, target_dis, autotarget = nil

	if attention.handler then
		target_pos = temp_vec1

		mvec3_set(target_pos, attention.handler:get_attention_m_pos())

		if self._shooting_player then
			autotarget = true
		end
	elseif attention.unit then
		if self._shooting_player then
			autotarget = true
		end

		target_pos = temp_vec1

		attention.unit:character_damage():shoot_pos_mid(target_pos)
	else
		target_pos = attention.pos
	end

	target_vec = temp_vec3
	target_dis = mvec3_dir(target_vec, shoot_from_pos, target_pos)

	self._mod_enable_t = t + math_lerp(0.5, 0, prog)
	mvec3_lerp(target_vec, transition.start_vec, target_vec, prog)

	return target_pos, target_vec, target_dis, autotarget
end

function CopActionHurt:_get_target_pos(shoot_from_pos, attention)
	local target_pos, target_vec, target_dis, autotarget = nil

	if attention.handler then
		target_pos = temp_vec1

		mvec3_set(target_pos, attention.handler:get_attention_m_pos())

		if self._shooting_player then
			autotarget = true
		end
	elseif attention.unit then
		if self._shooting_player then
			autotarget = true
		end

		target_pos = temp_vec1

		attention.unit:character_damage():shoot_pos_mid(target_pos)
	else
		target_pos = attention.pos
	end

	target_vec = temp_vec3
	target_dis = mvec3_dir(target_vec, shoot_from_pos, target_pos)

	return target_pos, target_vec, target_dis, autotarget
end

function CopActionHurt:set_ik_preset(preset_name)
	self[self._ik_preset.stop](self)

	local preset_data = self._ik_presets[preset_name]
	self._ik_preset = preset_data

	self[preset_data.start](self)
end

function CopActionHurt:_begin_spine_head_r_arm()
	if self._spine_modifier then
		return
	end

	self._spine_modifier_name = ids_action_upper_body
	self._spine_modifier = self._machine:get_modifier(self._spine_modifier_name)
	self._head_modifier_name = ids_look_head
	self._head_modifier = self._machine:get_modifier(self._head_modifier_name)
	self._r_arm_modifier_name = ids_aim_r_arm
	self._r_arm_modifier = self._machine:get_modifier(self._r_arm_modifier_name)

	self._modifier_on = nil
	self._mod_enable_t = nil

	self:_set_ik_updator("_upd_spine_head_r_arm")
end

function CopActionHurt:_stop_spine_head_r_arm()
	if not self._spine_modifier then
		return
	end

	self._machine:allow_modifier(self._spine_modifier_name)
	self._machine:allow_modifier(self._head_modifier_name)
	self._machine:allow_modifier(self._r_arm_modifier_name)

	self._spine_modifier_name = nil
	self._spine_modifier = nil
	self._head_modifier_name = nil
	self._head_modifier = nil
	self._r_arm_modifier_name = nil
	self._r_arm_modifier = nil
	self._modifier_on = nil
end

function CopActionHurt:_upd_spine_head_r_arm(target_vec, fwd_dot, t)
	if fwd_dot > 0.5 then
		if not self._modifier_on then
			self._modifier_on = true

			self._machine:force_modifier(self._spine_modifier_name)
			self._machine:force_modifier(self._head_modifier_name)
			self._machine:force_modifier(self._r_arm_modifier_name)
		end

		self._spine_modifier:set_target_y(target_vec)
		self._head_modifier:set_target_z(target_vec)
		self._r_arm_modifier:set_target_y(target_vec)
		mvec3_set(self._common_data.look_vec, target_vec)

		return target_vec
	else
		if self._modifier_on then
			self._modifier_on = nil

			self._machine:allow_modifier(self._spine_modifier_name)
			self._machine:allow_modifier(self._head_modifier_name)
			self._machine:allow_modifier(self._r_arm_modifier_name)
		end

		return nil
	end
end

function CopActionHurt:_get_blend_spine_head_r_arm()
	return self._r_arm_modifier:blend()
end

function CopActionHurt:_begin_ik_r_arm()
	if self._head_modifier then
		return
	end

	self._head_modifier_name = ids_look_head
	self._head_modifier = self._machine:get_modifier(self._head_modifier_name)
	self._r_arm_modifier_name = ids_aim_r_arm
	self._r_arm_modifier = self._machine:get_modifier(self._r_arm_modifier_name)
	self._modifier_on = nil
	self._mod_enable_t = false

	self:_set_ik_updator("_upd_ik_r_arm")
end

function CopActionHurt:_stop_ik_r_arm()
	if not self._head_modifier then
		return
	end

	self._machine:allow_modifier(self._head_modifier_name)
	self._machine:allow_modifier(self._r_arm_modifier_name)

	self._head_modifier_name = nil
	self._head_modifier = nil
	self._r_arm_modifier_name = nil
	self._r_arm_modifier = nil
	self._modifier_on = nil
end

function CopActionHurt:_upd_ik_r_arm(target_vec, fwd_dot, t)
	if fwd_dot then
		if fwd_dot > 0.5 then
			if not self._modifier_on then
				self._modifier_on = true

				self._machine:force_modifier(self._head_modifier_name)
				self._machine:force_modifier(self._r_arm_modifier_name)
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

	if not self._modifier_on then
		self._modifier_on = true

		self._machine:force_modifier(self._head_modifier_name)
		self._machine:force_modifier(self._r_arm_modifier_name)
	end

	self._head_modifier:set_target_z(target_vec)
	self._r_arm_modifier:set_target_y(target_vec)
	mvec3_set(self._common_data.look_vec, target_vec)

	return target_vec
end

function CopActionHurt:_get_blend_ik_r_arm()
	return self._r_arm_modifier:blend()
end

function CopActionHurt:_set_ik_updator(name)
	self._upd_ik = self[name]
end