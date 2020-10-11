local original_init = PlayerStandard.init
function PlayerStandard:init(unit)
	original_init(self, unit)

	if Global.game_settings and Global.game_settings.one_down then
		self._slotmask_bullet_impact_targets = self._slotmask_bullet_impact_targets + 3
	else
		self._slotmask_bullet_impact_targets = managers.mutators:modify_value("PlayerStandard:init:melee_slot_mask", self._slotmask_bullet_impact_targets)
		self._slotmask_bullet_impact_targets = managers.modifiers:modify_value("PlayerStandard:init:melee_slot_mask", self._slotmask_bullet_impact_targets)
	end
	
	--Getting rid of unique underbarrel anim states. Unnecessary and only causes custom underbarrel animations to break.
	PlayerStandard.ANIM_STATES.underbarrel = {
		equip = Idstring("equip"),
		unequip = Idstring("unequip"),
		start_running = Idstring("start_running"),
		stop_running = Idstring("stop_running"),
		melee = Idstring("melee"),
		melee_miss = Idstring("melee_miss"),
		idle = Idstring("idle")
	}
end

--Allows night vision to be used with any mask.
function PlayerStandard:set_night_vision_state(state)
	local mask_id = managers.blackmarket:equipped_mask().mask_id
	local mask_tweak = tweak_data.blackmarket.masks[mask_id]
	local night_vision = mask_tweak.night_vision 

	--If mask doesn't have night vision, it does.
	if not night_vision then
		night_vision = {
			effect = "color_night_vision",
			light = not _G.IS_VR and 0.3 or 0.1
		}
	end

	--This conditional is hilarious in vanilla btw.
	if self._state_data.night_vision_active == state then
		return
	end

	local ambient_color_key = CoreEnvironmentFeeder.PostAmbientColorFeeder.DATA_PATH_KEY
	--Use a proper fallback env instead of whatever vanilla does if there's an issue.
	local level_id = Global.game_settings.level_id
	local env_setting = gradient_filter and tweak_data.levels[level_id].env_params and tweak_data.levels[level_id].env_params.color_grading
	local level_check = env_setting or managers.user:get_setting("video_color_grading")
	local effect = state and night_vision.effect or level_check

	if state then
		local function light_modifier(handler, feeder)
			local base_light = feeder._target and mvector3.copy(feeder._target) or Vector3()
			local light = night_vision.light

			return base_light + Vector3(light, light, light)
		end

		managers.viewport:create_global_environment_modifier(ambient_color_key, true, light_modifier)
	else
		managers.viewport:destroy_global_environment_modifier(ambient_color_key)
	end

	self._unit:sound():play(state and "night_vision_on" or "night_vision_off", nil, false)
	managers.environment_controller:set_default_color_grading(effect, state)
	managers.environment_controller:refresh_render_settings()

	self._state_data.night_vision_active = state
end	

--Stops disabled cameras from being markable.
local add_unit_to_char_table_old = PlayerStandard._add_unit_to_char_table
function PlayerStandard:_add_unit_to_char_table(char_table, unit, unit_type, ...)
	if unit_type ~= 3 or unit:base()._detection_delay or (Network:is_client() and unit:base().cam_disabled ~= true) then
		add_unit_to_char_table_old(self, char_table, unit, unit_type, ...)
	end
end

function PlayerStandard:_activate_mover(mover, velocity)
	self._unit:activate_mover(mover, velocity)
	
	if not self._original_damping_standard then
		self._original_damping_standard = self._unit:mover():damping() --PLEASE DO NOT CHANGE THIS!!! WILL PROBABLY CAUSE WEIRD BEHAVIOR IN LADDERS!!!
	end

	if self._state_data.on_ladder then
		self._unit:mover():set_gravity(Vector3(0, 0, 0))
		self._unit:mover():set_damping(self._original_damping_standard)
	else
		self._unit:mover():set_gravity(Vector3(0, 0, -982)) --sets the actual gravity, you can set this to funny values if you want moon-jumping or something
		self._unit:mover():set_damping(self._tweak_data.gravity / self._tweak_data.terminal_velocity) --sets how fast the player accelerates downwards in the air, i have no clue what the value for this actually represents since its something like 0.14-ish.
	end

	if self._is_jumping then
		self._unit:mover():jump()
		self._unit:mover():set_velocity(velocity)
	end
end

function PlayerStandard:_start_action_ladder(t, ladder_unit)
	self._state_data.on_ladder = true

	self:_interupt_action_running(t)
	self._unit:mover():set_velocity(Vector3())
	self._unit:mover():set_gravity(Vector3(0, 0, 0))
	self._unit:mover():set_damping(self._original_damping_standard)
	self._unit:mover():jump()
	self._unit:movement():on_enter_ladder(ladder_unit)
end

function PlayerStandard:_end_action_ladder(t, input)
	if not self._state_data.on_ladder then
		return
	end

	self._state_data.on_ladder = false

	if self._unit:mover() then
		self._unit:mover():set_gravity(Vector3(0, 0, -982))
		self._unit:mover():set_damping(self._tweak_data.gravity / self._tweak_data.terminal_velocity)
	end

	self._unit:movement():on_exit_ladder()
end	

--If stop bots option is enabled, replace vanilla version with a version with bot stopping support.
local orig_check_interact = PlayerStandard._check_action_interact
function PlayerStandard:_check_action_interact(t, input,...)
	if not (self._start_shout_all_ai_t or (input and input.btn_interact_secondary_press)) or not restoration.Options:GetValue("OTHER/StopAllBots") then
		return orig_check_interact(self,t,input,...)
	end
	local keyboard = self._controller.TYPE == "pc" or managers.controller:get_default_wrapper_type() == "pc"
	local new_action, timer, interact_object = nil

	if input.btn_interact_press then
		if _G.IS_VR then
			self._interact_hand = input.btn_interact_left_press and PlayerHand.LEFT or PlayerHand.RIGHT
		end

		if not self:_action_interact_forbidden() then
			new_action, timer, interact_object = self._interaction:interact(self._unit, input.data, self._interact_hand)

			if new_action then
				self:_play_interact_redirect(t, input)
			end

			if timer then
				new_action = true

				self._ext_camera:camera_unit():base():set_limits(80, 50)
				self:_start_action_interact(t, input, timer, interact_object)
			end

			if not new_action then
				self._start_intimidate = true
				self._start_intimidate_t = t
			end
		end
	end

	local secondary_delay = tweak_data.team_ai.stop_action.delay
	local force_secondary_intimidate = false
	local HOLD_TO_STOP_ALL_AI_DURATION = 1.5 --seconds to hold down to direct all ai instead of just the one
	local skip_intimidate_action = false 
	if self._start_shout_all_ai_t and self._start_shout_all_ai_t + HOLD_TO_STOP_ALL_AI_DURATION <= t then
		self._start_shout_all_ai_t = nil
		
		--tell all ai to stop
		for i, char_data in pairs(managers.criminals._characters) do
			if char_data.data.ai then
				local ai_unit = char_data.unit
				if alive(ai_unit) then 
					ai_unit:brain():on_long_dis_interacted(0, ai_unit, true)
					skip_intimidate_action = true
				end
			end
		
		end
		if skip_intimidate_action then 
			self:say_line("f48x_any", false)
			--play a voiceline if any ai were actually stopped
		end
	elseif self._controller:get_input_released("interact_secondary") then 
		--if release before the full duration required to call all ai then do normal single-target "stop ai" action
		self._start_shout_all_ai_t = nil
		force_secondary_intimidate = true
	elseif input.btn_interact_secondary_press then 
		--if pressing for the first time (not holding), start timer, do not do normal single-target "stop ai" until key release
		self._start_shout_all_ai_t = t
		skip_intimidate_action = true
	end

	if input.btn_interact_release then
		local released = true

		if _G.IS_VR then
			local release_hand = input.btn_interact_left_release and PlayerHand.LEFT or PlayerHand.RIGHT
			released = release_hand == self._interact_hand
		end

		if released then
			if self._start_intimidate and not self:_action_interact_forbidden() then
				if t < self._start_intimidate_t + secondary_delay then
					self:_start_action_intimidate(t)

					self._start_intimidate = false
				end
			else
				self:_interupt_action_interact()
			end
		end
	end
	
	if (self._start_intimidate or force_secondary_intimidate) and not (self:_action_interact_forbidden() or skip_intimidate_action) and (not keyboard and t > self._start_intimidate_t + secondary_delay or force_secondary_intimidate) then
		--don't do normal shout action if doing the "shout at ai" action with separate keybind
		self:_start_action_intimidate(t, true)

		self._start_intimidate = false
	end

	return new_action
end

function PlayerStandard:_start_action_intimidate(t, secondary)
	if not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t then
		local skip_alert = managers.groupai:state():whisper_mode()
		local voice_type, plural, prime_target = self:_get_unit_intimidation_action(not secondary, not secondary, true, false, true, nil, nil, nil, secondary)
		
		if prime_target and prime_target.unit and prime_target.unit.base and (
				prime_target.unit:base().unintimidateable
				or prime_target.unit:anim_data() and prime_target.unit:anim_data().unintimidateable 
				--Stops undommable enemies from being shouted at.
				or tweak_data.character[prime_target.unit:base()._tweak_table] and tweak_data.character[prime_target.unit:base()._tweak_table].unintimidateable and prime_target.unit:movement() and not prime_target.unit:movement():cool()
			) then
			return
		end
		
		local interact_type, sound_name = nil
		local sound_suffix = plural and "plu" or "sin"
		if voice_type == "stop" then
			interact_type = "cmd_stop"
			sound_name = "f02x_" .. sound_suffix
		elseif voice_type == "stop_cop" then
			interact_type = "cmd_stop"
			sound_name = "l01x_" .. sound_suffix
		elseif voice_type == "mark_cop" or voice_type == "mark_cop_quiet" then
			interact_type = "cmd_point"
			if voice_type == "mark_cop_quiet" then
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
			elseif tweak_data.character[prime_target.unit:base()._tweak_table].custom_shout then --Special boss shoutouts.
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout
			else
				sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
				sound_name = managers.modifiers:modify_value("PlayerStandart:_start_action_intimidate", sound_name, prime_target.unit)
			end

			if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
				prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
				managers.network:session():send_to_peers_synched("spot_enemy", prime_target.unit)
			end
		elseif voice_type == "down" then
			interact_type = "cmd_down"
			sound_name = "f02x_" .. sound_suffix
			self._shout_down_t = t
		elseif voice_type == "down_cop" then
			interact_type = "cmd_down"
			sound_name = "l02x_" .. sound_suffix
		elseif voice_type == "cuff_cop" then
			interact_type = "cmd_down"
			sound_name = "l03x_" .. sound_suffix
		elseif voice_type == "down_stay" then
			interact_type = "cmd_down"

			if self._shout_down_t and t < self._shout_down_t + 2 then
				sound_name = "f03b_any"
			else
				sound_name = "f03a_" .. sound_suffix
			end
		elseif voice_type == "come" then
			interact_type = "cmd_come"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)

			if static_data then
				local character_code = static_data.ssuffix
				sound_name = "f21" .. character_code .. "_sin"
			else
				sound_name = "f38_any"
			end
		elseif voice_type == "revive" then
			interact_type = "cmd_get_up"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)

			if not static_data then
				return
			end

			local character_code = static_data.ssuffix
			sound_name = "f36x_any"

			if math.random() < self._ext_movement:rally_skill_data().revive_chance then
				prime_target.unit:interaction():interact(self._unit)
			end

			self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
		elseif voice_type == "boost" then
			interact_type = "cmd_gogo"
			local static_data = managers.criminals:character_static_data_by_unit(prime_target.unit)

			if not static_data then
				return
			end

			local character_code = static_data.ssuffix
			sound_name = "g18"
			self._ext_movement:rally_skill_data().morale_boost_delay_t = managers.player:player_timer():time() + (self._ext_movement:rally_skill_data().morale_boost_cooldown_t or 3.5)
		elseif voice_type == "escort" then
			interact_type = "cmd_point"
			sound_name = "f41_" .. sound_suffix
		elseif voice_type == "escort_keep" or voice_type == "escort_go" then
			interact_type = "cmd_point"
			sound_name = "f40_any"
		elseif voice_type == "bridge_codeword" then
			sound_name = "bri_14"
			interact_type = "cmd_point"
		elseif voice_type == "bridge_chair" then
			sound_name = "bri_29"
			interact_type = "cmd_point"
		elseif voice_type == "undercover_interrogate" then
			sound_name = "f46x_any"
			interact_type = "cmd_point"
		elseif voice_type == "undercover_escort" then
			sound_name = "f41_any"
			interact_type = "cmd_point"
		elseif voice_type == "mark_camera" then
			sound_name = "f39_any"
			interact_type = "cmd_point"

			prime_target.unit:contour():add("mark_unit", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		elseif voice_type == "mark_turret" then
			sound_name = "f44x_any"
			interact_type = "cmd_point"
			local type = prime_target.unit:base().get_type and prime_target.unit:base():get_type()

			prime_target.unit:contour():add(managers.player:get_contour_for_marked_enemy(type), true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		elseif voice_type == "ai_stay" then
			sound_name = "f48x_any"
			interact_type = "cmd_stop"
		end

		self:_do_action_intimidate(t, interact_type, sound_name, skip_alert)
	end
end

--Sixth sense action forbidden to let it work in loud, and only requires the player to not be moving to proc (so actions like shooting or aiming down sights no longer stop it).
function PlayerStandard:_update_omniscience(t, dt)
	local action_forbidden = not managers.player:has_category_upgrade("player", "standstill_omniscience") or managers.player:current_state() == "civilian" or self._ext_movement:has_carry_restriction() or self:_on_zipline() or self._moving or self:running() or self:in_air() or not tweak_data.player.omniscience
	if action_forbidden then
		if self._state_data.omniscience_t then
			self._state_data.omniscience_t = nil
		end

		return
	end

	self._state_data.omniscience_t = self._state_data.omniscience_t or t + tweak_data.player.omniscience.start_t

	if self._state_data.omniscience_t <= t then
		local sensed_targets = World:find_units_quick("sphere", self._unit:movement():m_pos(), tweak_data.player.omniscience.sense_radius, managers.slot:get_mask("trip_mine_targets"))

		for _, unit in ipairs(sensed_targets) do
			if alive(unit) and not unit:base():char_tweak().is_escort then
				self._state_data.omniscience_units_detected = self._state_data.omniscience_units_detected or {}

				if not self._state_data.omniscience_units_detected[unit:key()] or self._state_data.omniscience_units_detected[unit:key()] <= t then
					self._state_data.omniscience_units_detected[unit:key()] = t + tweak_data.player.omniscience.target_resense_t

					managers.game_play_central:auto_highlight_enemy(unit, true)
					break
				end
			end
		end

		self._state_data.omniscience_t = t + tweak_data.player.omniscience.interval_t
	end
end

--Allows for melee sprinting.
function PlayerStandard:_start_action_running(t)
	--Consolidated vanilla checks.
	if not self._move_dir or self:on_ladder() or self:_on_zipline() or not self:_can_run_directional() or managers.player:get_player_rule("no_run") or not self._unit:movement():is_above_stamina_threshold() then
		self._running_wanted = true
		return
	end

	if self._shooting and not self._equipped_unit:base():run_and_shoot_allowed() or self:_changing_weapon() or self._use_item_expire_t or self._state_data.in_air or self:_is_throwing_projectile() or self._state_data.ducking and not self:_can_stand() then
		self._running_wanted = true
		return
	end
				
	self._running_wanted = false

	if (not self._state_data.shake_player_start_running or not self._ext_camera:shaker():is_playing(self._state_data.shake_player_start_running)) and managers.user:get_setting("use_headbob") then
		self._state_data.shake_player_start_running = self._ext_camera:play_shaker("player_start_running" , 0.75)
	end
				
	self:set_running(true)

	self._end_running_expire_t = nil
	self._start_running_t = t
	
	--Skip sprinting animations of player is doing melee things.
	if not self:_is_charging_weapon() and not self:_is_meleeing() and (not self:_is_reloading() or not self.RUN_AND_RELOAD) then
		if not self._equipped_unit:base():run_and_shoot_allowed() then
			self._ext_camera:play_redirect(self:get_animation("start_running"))	
		else
			self._ext_camera:play_redirect(self:get_animation("idle"))	
		end	
	end
	
	if not self.RUN_AND_RELOAD then
		self:_interupt_action_reload(t)
	end
				
	self:_interupt_action_steelsight(t)
	self:_interupt_action_ducking(t)
end

function PlayerStandard:_end_action_running(t)
	if not self._end_running_expire_t then
		local speed_multiplier = self._equipped_unit:base():exit_run_speed_multiplier()
		self._end_running_expire_t = t + 0.4 / speed_multiplier
		--Adds a few melee related checks to avoid cutting off animations.
		local stop_running = not self:_is_charging_weapon() and not self:_is_meleeing() and not self._equipped_unit:base():run_and_shoot_allowed() and (not self.RUN_AND_RELOAD or not self:_is_reloading())
		
		if stop_running then
			self._ext_camera:play_redirect(self:get_animation("stop_running"), speed_multiplier)
		end
	end
end

--Stores running input, is a workaround for other things that may interrupt running.
Hooks:PreHook(PlayerStandard, "_start_action_melee", "ResPlayerStandardPreStartActionMelee", function(self, t, input, instant)
	self._state_data.melee_running_wanted = true and self._running and not self._end_running_expire_t
end)

Hooks:PostHook(PlayerStandard, "_start_action_melee", "ResPlayerStandardPostStartActionMelee", function(self, t, input, instant)
	--Passes in running input, is a workaround for other things that may interrupt running.
	if self._state_data.melee_running_wanted then
		self._running_wanted = true
	end

	--Start chainsaw timer.
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	if tweak_data.blackmarket.melee_weapons[melee_entry].chainsaw == true then
		self._state_data.chainsaw_t = t + 0.8
	end
end)

Hooks:PostHook(PlayerStandard, "_check_action_melee", "ResEndChainsaw", function(self, t, input)
	--Stop chainsaw when no longer meleeing.
	if input.btn_melee_release then
		self._state_data.chainsaw_t = nil
	end
end)


--Effectively a slightly modified version of _do_melee_damage but without charging and certain melee gimmicks.
function PlayerStandard:_do_chainsaw_damage(t)
	melee_entry = managers.blackmarket:equipped_melee_weapon()

	--Determine if attack hits.
	local sphere_cast_radius = 20
	local col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)

	if col_ray and alive(col_ray.unit) then
		local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(0)
		local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().categories and self._equipped_unit:base():weapon_tweak_data().categories[1], "melee_knockdown_mul", 1))
		damage = tweak_data.blackmarket.melee_weapons[melee_entry].stats.tick_damage or damage --Use tickdamage if possible.
		damage = damage * managers.player:get_melee_dmg_multiplier()
		damage_effect = damage_effect * damage_effect_mul
		col_ray.sphere_cast_radius = sphere_cast_radius
		local hit_unit = col_ray.unit

		if hit_unit:character_damage() then
			local hit_sfx = "hit_body"

			if hit_unit:character_damage() and hit_unit:character_damage().melee_hit_sfx then
				hit_sfx = hit_unit:character_damage():melee_hit_sfx()
			end

			self:_play_melee_sound(melee_entry, hit_sfx, self._melee_attack_var)
			self:_play_melee_sound(melee_entry, "charge", self._melee_attack_var)

			if not hit_unit:character_damage()._no_blood then
				managers.game_play_central:play_impact_flesh({
					col_ray = col_ray
				})
				managers.game_play_central:play_impact_sound_and_effects({
					no_decal = true,
					no_sound = true,
					col_ray = col_ray
				})
			end

		elseif self._on_melee_restart_drill and hit_unit:base() and (hit_unit:base().is_drill or hit_unit:base().is_saw) then
			hit_unit:base():on_melee_hit(managers.network:session():local_peer():id())
		else
			self:_play_melee_sound(melee_entry, "hit_gen", self._melee_attack_var)
			self:_play_melee_sound(melee_entry, "charge", self._melee_attack_var) -- continue playing charge sound after hit instead of silence

			managers.game_play_central:play_impact_sound_and_effects({
				no_decal = true,
				no_sound = true,
				col_ray = col_ray,
				effect = Idstring("effects/payday2/particles/impacts/fallback_impact_pd2")
			})
		end

		local custom_data = nil

		if _G.IS_VR and hand_id then
			custom_data = {
				engine = hand_id == 1 and "right" or "left"
			}
		end

		managers.game_play_central:physics_push(col_ray)

		local character_unit, shield_knock = nil
		local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock")

		if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) and not hit_unit:parent():character_damage():is_immune_to_shield_knockback() then
			shield_knock = true
			character_unit = hit_unit:parent()
		end

		character_unit = character_unit or hit_unit

		if character_unit:character_damage() and character_unit:character_damage().damage_melee then
			local dmg_multiplier = 1

			if not managers.enemy:is_civilian(character_unit) and not managers.groupai:state():is_enemy_special(character_unit) then
				dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "non_special_melee_multiplier", 1)
			else
				dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)
			end

			dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[melee_entry].stats.weapon_type) .. "_damage_multiplier", 1)

			if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
				self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
				self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {
					nil,
					0
				}
				local stack = self._state_data.stacking_dmg_mul.melee

				if stack[1] and t < stack[1] then
					dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("melee", "stacking_hit_damage_multiplier", 0) * stack[2])
				else
					stack[2] = 0
				end
			end

			local health_ratio = self._ext_damage:health_ratio()
			local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, "melee")

			if damage_health_ratio > 0 then
				local damage_ratio = damage_health_ratio
				dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("player", "melee_damage_health_ratio_multiplier", 0) * damage_ratio)
			end

			dmg_multiplier = dmg_multiplier * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
			local target_dead = character_unit:character_damage().dead and not character_unit:character_damage():dead()
			local target_hostile = managers.enemy:is_enemy(character_unit) and not tweak_data.character[character_unit:base()._tweak_table].is_escort and character_unit:brain():is_hostile()
			local life_leach_available = managers.player:has_category_upgrade("temporary", "melee_life_leech") and not managers.player:has_activate_temporary_upgrade("temporary", "melee_life_leech")

			if target_dead and target_hostile and life_leach_available then
				managers.player:activate_temporary_upgrade("temporary", "melee_life_leech")
				self._unit:character_damage():restore_health(managers.player:temporary_upgrade_value("temporary", "melee_life_leech", 1))
			end

			local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
			local action_data = {
				variant = "melee"
			}

			if special_weapon == "taser" then
				action_data.variant = "taser_tased"
			end

			if _G.IS_VR and melee_entry == "weapon" and not bayonet_melee then
				dmg_multiplier = 0.1
			end

			action_data.damage = shield_knock and 0 or damage * dmg_multiplier
			action_data.damage_effect = damage_effect
			action_data.attacker_unit = self._unit
			action_data.col_ray = col_ray

			if shield_knock then
				action_data.shield_knock = can_shield_knock
			end

			action_data.name_id = melee_entry
			action_data.charge_lerp_value = 0 --There is no charging this attack.

			if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
				self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
				self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {
					nil,
					0
				}
				local stack = self._state_data.stacking_dmg_mul.melee

				if character_unit:character_damage().dead and not character_unit:character_damage():dead() then
					stack[1] = t + managers.player:upgrade_value("melee", "stacking_hit_expire_t", 1)
					stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_melee_weapon_dmg_mul_stacks or 5)
				else
					stack[1] = nil
					stack[2] = 0
				end
			end

			local defense_data = character_unit:character_damage():damage_melee(action_data)

			self:_check_melee_dot_damage(col_ray, defense_data, melee_entry)
			self:_perform_sync_melee_damage(hit_unit, col_ray, action_data.damage)

			return defense_data
		else
			self:_perform_sync_melee_damage(hit_unit, col_ray, damage)
		end
	end

	if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
		self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
		self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {
			nil,
			0
		}
		local stack = self._state_data.stacking_dmg_mul.melee
		stack[1] = nil
		stack[2] = 0
	end

	return col_ray
end
		

Hooks:PreHook(PlayerStandard, "_update_melee_timers", "ResPlayerStandardPreUpdateMeleeTimers", function(self, t, input)
	local melee_weapon = tweak_data.blackmarket.melee_weapons[managers.blackmarket:equipped_melee_weapon()]
	local instant = melee_weapon.instant
	
	--Resume normal sprinting animations once melee attack is done.
	--Making it not cancel the equip animation will require a fair amount more work, since it doesn't set the timers. Is a job for another day.
	if self._running and not self._end_running_expire_t and not self._state_data.meleeing and self._state_data.melee_expire_t and t >= self._state_data.melee_expire_t and not self:_is_charging_weapon() and (not self:_is_reloading() or not self.RUN_AND_RELOAD) and (instant or not self._state_data.melee_repeat_expire_t) then
		if not self._equipped_unit:base():run_and_shoot_allowed() then
			self._ext_camera:play_redirect(self:get_animation("start_running"))
		else
			self._ext_camera:play_redirect(self:get_animation("idle"))
		end
	end

	--Do chainsaw stuff.
	if melee_weapon.chainsaw == true and self._state_data.chainsaw_t and self._state_data.chainsaw_t < t then
		self:_do_chainsaw_damage(t)
		self._state_data.chainsaw_t = t + 0.2
	end			

end)

Hooks:PostHook(PlayerStandard, "_interupt_action_melee", "ResPlayerStandardPostInteruptActionMelee", function(self, t)
	--Interrupting melee attacks also interrupt melee sprinting.
	self:_interupt_action_running(t)
	local running = self._running and not self._end_running_expire_t
	if running then
		self._running_wanted = true
	end
	
	--Stop chainsaw stuff if also no longer in melee.
	self._state_data.chainsaw_t = nil
end)	

function PlayerStandard:_start_action_jump(t, action_start_data)
	--Don't interrupt melee sprinting.
	if self._running and not self.RUN_AND_RELOAD and not self._equipped_unit:base():run_and_shoot_allowed() and not self._is_meleeing then
		self:_interupt_action_reload(t)
		self._ext_camera:play_redirect(self:get_animation("stop_running"), self._equipped_unit:base():exit_run_speed_multiplier())
	end

	self:_interupt_action_running(t)

	self._jump_t = t
	local jump_vec = action_start_data.jump_vel_z * math.UP

	self._unit:mover():jump()

	if self._move_dir then
		local move_dir_clamp = self._move_dir:normalized() * math.min(1, self._move_dir:length())
		self._last_velocity_xy = move_dir_clamp * action_start_data.jump_vel_xy
		self._jump_vel_xy = mvector3.copy(self._last_velocity_xy)
	else
		self._last_velocity_xy = Vector3()
	end

	self:_perform_jump(jump_vec)
end		

function PlayerStandard:_do_action_melee(t, input, skip_damage)
	self._state_data.meleeing = nil
	local melee_entry = managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	local pre_calc_hit_ray = tweak_data.blackmarket.melee_weapons[melee_entry].hit_pre_calculation
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	--Lets skills give faster melee charge and swing speeds.
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t)
	local charge_bonus_start = tweak_data.blackmarket.melee_weapons[melee_entry].charge_bonus_start or 2 --i.e. never get the bonus
	local charge_bonus_speed = tweak_data.blackmarket.melee_weapons[melee_entry].charge_bonus_speed or 1
	local speed = tweak_data.blackmarket.melee_weapons[melee_entry].speed_mult or 1
	local anim_speed = tweak_data.blackmarket.melee_weapons[melee_entry].anim_speed_mult or 1
	speed = speed * anim_speed
	speed = speed * managers.player:upgrade_value("player", "melee_swing_multiplier", 1)
	melee_damage_delay = melee_damage_delay * managers.player:upgrade_value("player", "melee_swing_multiplier_delay", 1)
	local melee_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].expire_t or 0 --Add fallbacks for certain stats.
	local melee_repeat_expire_t = tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t or 0
	melee_damage_delay = math.min(melee_damage_delay, tweak_data.blackmarket.melee_weapons[melee_entry].repeat_expire_t)
	local primary = managers.blackmarket:equipped_primary()
	local primary_id = primary.weapon_id
	local bayonet_id = managers.blackmarket:equipped_bayonet(primary_id)
	local bayonet_melee = false

	if bayonet_id and self._equipped_unit:base():selection_index() == 2 then
		bayonet_melee = true
	end
	
	if charge_lerp_value and charge_lerp_value > charge_bonus_start then
		speed = math.max(speed, speed * (charge_lerp_value * charge_bonus_speed))
		melee_damage_delay = math.min(melee_damage_delay, melee_damage_delay / (charge_lerp_value * charge_bonus_speed))
		melee_expire_t = math.min(melee_expire_t, melee_expire_t / (charge_lerp_value * charge_bonus_speed))
		melee_repeat_expire_t = math.min(melee_repeat_expire_t, melee_repeat_expire_t / (charge_lerp_value * charge_bonus_speed))
	end
	
	self._state_data.melee_expire_t = t + melee_expire_t
	self._state_data.melee_repeat_expire_t = t + math.min(melee_repeat_expire_t, melee_expire_t)
	if not instant_hit and not skip_damage then
		self._state_data.melee_damage_delay_t = t + melee_damage_delay

		if pre_calc_hit_ray then
			self._state_data.melee_hit_ray = self:_calc_melee_hit_ray(t, 20) or true
		else
			self._state_data.melee_hit_ray = nil
		end
	end

	local send_redirect = instant_hit and (bayonet_melee and "melee_bayonet" or "melee") or "melee_item"

	if instant_hit then
		managers.network:session():send_to_peers_synched("play_distance_interact_redirect", self._unit, send_redirect)
	else
		self._ext_network:send("sync_melee_discharge")
	end

	if self._state_data.melee_charge_shake then
		self._ext_camera:shaker():stop(self._state_data.melee_charge_shake)

		self._state_data.melee_charge_shake = nil
	end

	self._melee_attack_var = 0

	if instant_hit then
		local hit = skip_damage or self:_do_melee_damage(t, bayonet_melee)

		if hit then
			self._ext_camera:play_redirect(bayonet_melee and self:get_animation("melee_bayonet") or self:get_animation("melee"))
		else
			self._ext_camera:play_redirect(bayonet_melee and self:get_animation("melee_miss_bayonet") or self:get_animation("melee_miss"))
		end
	else
		local anim_attack_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_vars
		local anim_attack_charged_amount = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_amount or 0.5 --At half charge, use the charge variant
		local anim_attack_charged_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_charged_vars
		local anim_attack_left_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_left_vars
		local anim_attack_right_vars = tweak_data.blackmarket.melee_weapons[melee_entry].anim_attack_right_vars
		local timing_fix = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix
		local timing_fix_speed_mult = tweak_data.blackmarket.melee_weapons[melee_entry].timing_fix_speed_mult or 1
		self._melee_attack_var = anim_attack_vars and math.random(#anim_attack_vars)

		self:_play_melee_sound(melee_entry, "hit_air", self._melee_attack_var)

		local melee_item_tweak_anim = "attack"
		local melee_item_prefix = ""
		local melee_item_suffix = ""
		local anim_attack_param = anim_attack_vars and anim_attack_vars[self._melee_attack_var]
		
		if anim_attack_charged_vars and charge_lerp_value >= anim_attack_charged_amount then
			self._melee_attack_var = anim_attack_charged_vars and math.random(#anim_attack_charged_vars)
			anim_attack_param = anim_attack_charged_vars and anim_attack_charged_vars[self._melee_attack_var]
		elseif self._stick_move then
			local angle = mvector3.angle(self._stick_move, math.X)
			if anim_attack_left_vars and angle and (angle <= 180) and (angle >= 135) then
				self._melee_attack_var = anim_attack_left_vars and math.random(#anim_attack_left_vars)
				anim_attack_param = anim_attack_left_vars and anim_attack_left_vars[self._melee_attack_var]
			elseif anim_attack_right_vars and angle and (angle <= 45) and (angle >= 0) then
				self._melee_attack_var = anim_attack_right_vars and math.random(#anim_attack_right_vars)
				anim_attack_param = anim_attack_right_vars and anim_attack_right_vars[self._melee_attack_var]
			end
		end
		local fix_anim_timer = anim_attack_param and timing_fix and table.contains(timing_fix, anim_attack_param)
		if fix_anim_timer then
			speed = speed * timing_fix_speed_mult
		end
		local state = self._ext_camera:play_redirect(self:get_animation("melee_attack"), speed) --Apply speed mult to animation.
		if anim_attack_param then
			self._camera_unit:anim_state_machine():set_parameter(state, anim_attack_param, 1)

			melee_item_prefix = anim_attack_param .. "_"
		end

		if self._state_data.melee_hit_ray and self._state_data.melee_hit_ray ~= true then
			self._camera_unit:anim_state_machine():set_parameter(state, "hit", 1)

			melee_item_suffix = "_hit"
		end

		melee_item_tweak_anim = melee_item_prefix .. melee_item_tweak_anim .. melee_item_suffix

		self._camera_unit:base():play_anim_melee_item(melee_item_tweak_anim)
	end
end

--Updates burst fire and minigun spinup.
Hooks:PreHook(PlayerStandard, "update", "ResWeaponUpdate", function(self, t, dt)
	self:_update_burst_fire(t)
		
	local weapon = self._unit:inventory():equipped_unit():base()
	if weapon:get_name_id() == "m134" then
		weapon:update_spin()
	end
end)

--Deals with burst fire hud stuff when swapping from an underbarrel back to a weapon in burst fire.
local _check_action_deploy_underbarrel_original = PlayerStandard._check_action_deploy_underbarrel	
function PlayerStandard:_check_action_deploy_underbarrel(...)
	local new_action = _check_action_deploy_underbarrel_original(self, ...)
	
	if new_action and alive(self._equipped_unit) and self._equipped_unit:base() and self._equipped_unit:base():in_burst_mode() then
		managers.hud:set_teammate_weapon_firemode_burst(self._equipped_unit:base():selection_index())
	end
	
	return new_action
end	

--Adds burst fire check.
function PlayerStandard:_check_action_weapon_firemode(t, input)
	local wbase = self._equipped_unit:base()
	if input.btn_weapon_firemode_press and wbase.toggle_firemode then
		self:_check_stop_shooting()
		if wbase:toggle_firemode() then
			if wbase:in_burst_mode() then
				managers.hud:set_teammate_weapon_firemode_burst(self._unit:inventory():equipped_selection())
			else
				managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), wbase:fire_mode())
			end
		end
	end
end

--Fires next round in burst if needed.
function PlayerStandard:_update_burst_fire(t)
	if alive(self._equipped_unit) and self._equipped_unit:base():burst_rounds_remaining() then
		self:_check_action_primary_attack(t, { btn_primary_attack_state = true, btn_primary_attack_press = true })
	end
end

--Recoil used at the end of burst fire.
function PlayerStandard:force_recoil_kick(weap_base, shots_fired)
	local recoil_multiplier = (weap_base:recoil() + weap_base:recoil_addend()) * weap_base:recoil_multiplier() * (shots_fired or 1)
	local up, down, left, right = unpack(weap_base:weapon_tweak_data().kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
	self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
end

--Starts minigun spinup.
Hooks:PostHook(PlayerStandard, "_start_action_steelsight", "ResMinigunEnterSteelsight", function(self, t, gadget_state)
	if self._state_data.in_steelsight or self._steelsight_wanted then
		local weapon = self._unit:inventory():equipped_unit():base()
		if weapon:get_name_id() == "m134" then
			weapon:vulcan_enter_steelsight()
		end
	end
end)

--Ends minigun spinup.
Hooks:PostHook(PlayerStandard, "_end_action_steelsight", "ResMinigunExitSteelsight", function(self, t, gadget_state)
	if not self._state_data.in_steelsight then
		local weapon = self._unit:inventory():equipped_unit():base()
		if weapon:get_name_id() == "m134" then
			weapon:vulcan_exit_steelsight()
		end
	end
end)

local melee_vars = {
	"player_melee",
	"player_melee_var2"
}
function PlayerStandard:_do_melee_damage(t, bayonet_melee, melee_hit_ray, melee_entry)
	melee_entry = melee_entry or managers.blackmarket:equipped_melee_weapon()
	local instant_hit = tweak_data.blackmarket.melee_weapons[melee_entry].instant
	local melee_damage_delay = tweak_data.blackmarket.melee_weapons[melee_entry].melee_damage_delay or 0
	local charge_lerp_value = instant_hit and 0 or self:_get_melee_charge_lerp_value(t, melee_damage_delay)
	self._ext_camera:play_shaker(melee_vars[math.random(#melee_vars)], math.max(0.3, charge_lerp_value))
	local sphere_cast_radius = 20
	local col_ray = nil
	--Holds info for certain melee gimmicks (IE: Taser Shock, Psycho Knife Panic, ect)
	local special_weapon = tweak_data.blackmarket.melee_weapons[melee_entry].special_weapon
	if melee_hit_ray then
		col_ray = melee_hit_ray ~= true and melee_hit_ray or nil
	else
		col_ray = self:_calc_melee_hit_ray(t, sphere_cast_radius)
	end
	if col_ray and alive(col_ray.unit) then
		local damage, damage_effect = managers.blackmarket:equipped_melee_weapon_damage_info(charge_lerp_value)
		local damage_effect_mul = math.max(managers.player:upgrade_value("player", "melee_knockdown_mul", 1), managers.player:upgrade_value(self._equipped_unit:base():weapon_tweak_data().categories and self._equipped_unit:base():weapon_tweak_data().categories[1], "melee_knockdown_mul", 1))
		damage = damage * managers.player:get_melee_dmg_multiplier()
		damage_effect = damage_effect * damage_effect_mul
		col_ray.sphere_cast_radius = sphere_cast_radius
		local hit_unit = col_ray.unit
		if hit_unit:character_damage() then
			if bayonet_melee then
				self._unit:sound():play("fairbairn_hit_body", nil, false)
			elseif special_weapon == "taser" and charge_lerp_value ~= 1 then --Feedback for non-charged attacks with shock weapons. Might not do anything, need to verify.
				self._unit:sound():play("melee_hit_gen", nil, false)
			else
				self:_play_melee_sound(melee_entry, "hit_body")
			end
			if not hit_unit:character_damage()._no_blood then
				managers.game_play_central:play_impact_flesh({col_ray = col_ray})
				managers.game_play_central:play_impact_sound_and_effects({
					col_ray = col_ray,
					no_decal = true,
					no_sound = true
				})
			end
			self._camera_unit:base():play_anim_melee_item("hit_body")
		elseif self._on_melee_restart_drill and hit_unit:base() and (hit_unit:base().is_drill or hit_unit:base().is_saw) then
			hit_unit:base():on_melee_hit(managers.network:session():local_peer():id())
		else
			if bayonet_melee then
				self._unit:sound():play("knife_hit_gen", nil, false)
			elseif special_weapon == "taser" and charge_lerp_value ~= 1 then --Feedback for non-charged attacks with shock weapons. Might not do anything, need to verify.
					self._unit:sound():play("melee_hit_gen", nil, false)
			else
				self:_play_melee_sound(melee_entry, "hit_gen")
			end
			managers.game_play_central:play_impact_sound_and_effects({
				col_ray = col_ray,
				effect = Idstring("effects/payday2/particles/impacts/fallback_impact_pd2"),
				no_decal = true,
				no_sound = true
			})
		end

		--Out of date syncing method, reenable in case it was load bearing.
		--[[if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
			col_ray.body:extension().damage:damage_melee(self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
			if hit_unit:id() ~= -1 then
				managers.network:session():send_to_peers_synched("sync_body_damage_melee", col_ray.body, self._unit, col_ray.normal, col_ray.position, col_ray.ray, damage)
			end
		end]]

		local custom_data = nil
			
		if _G.IS_VR then
			local melee_hand_id = self._unit:hand():get_active_hand_id("melee")
			melee_hand_id = melee_hand_id or self._unit:hand():get_active_hand_id("weapon")

			if melee_hand_id then
				custom_data = {engine = melee_hand_id == 1 and "right" or "left"}
			end
		end			

		managers.rumble:play("melee_hit", nil, nil, custom_data)
		managers.game_play_central:physics_push(col_ray)
		
		local character_unit, shield_knock
		local can_shield_knock = managers.player:has_category_upgrade("player", "shield_knock")
		if can_shield_knock and hit_unit:in_slot(8) and alive(hit_unit:parent()) then
			shield_knock = true
			character_unit = hit_unit:parent()
		end
		character_unit = character_unit or hit_unit
		if character_unit:character_damage() and character_unit:character_damage().damage_melee then
			local dmg_multiplier = 1
			if not managers.enemy:is_civilian(character_unit) and not managers.groupai:state():is_enemy_special(character_unit) then
				dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "non_special_melee_multiplier", 1)
			else
				dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)
			end
			dmg_multiplier = dmg_multiplier * managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[melee_entry].stats.weapon_type) .. "_damage_multiplier", 1)
			if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
				self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
				self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
				local stack = self._state_data.stacking_dmg_mul.melee
				if stack[1] and t < stack[1] then
					dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("melee", "stacking_hit_damage_multiplier", 0) * stack[2])
				else
					stack[2] = 0
				end
			end
			local health_ratio = self._ext_damage:health_ratio()
			local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, "melee")
			if damage_health_ratio > 0 then
				local damage_ratio = damage_health_ratio
				dmg_multiplier = dmg_multiplier * (1 + managers.player:upgrade_value("player", "melee_damage_health_ratio_multiplier", 0) * damage_ratio)
			end
			dmg_multiplier = dmg_multiplier * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
			if character_unit:character_damage().dead and not character_unit:character_damage():dead() and managers.enemy:is_enemy(character_unit) and managers.player:has_category_upgrade("temporary", "melee_life_leech") and not managers.player:has_activate_temporary_upgrade("temporary", "melee_life_leech") then
				managers.player:activate_temporary_upgrade("temporary", "melee_life_leech")
				self._unit:character_damage():restore_health(managers.player:temporary_upgrade_value("temporary", "melee_life_leech", 1))
			end

			--Do melee gimmick stuff. Might be worth it to use function references instead of branching later on if we get more of these.
			local melee_weapon = tweak_data.blackmarket.melee_weapons[melee_entry]
			local action_data = {}
			action_data.variant = "melee"
			if charge_lerp_value >= 0.99 then
				if special_weapon == "taser" then
					action_data.variant = "taser_tased"
				elseif special_weapon == "panic" then
					managers.player:spread_psycho_knife_panic()
				end
			end
				
			if _G.IS_VR and melee_entry == "weapon" and not bayonet_melee then
				dmg_multiplier = 0.1
			end				
			
			action_data.damage = shield_knock and 0 or damage * dmg_multiplier
			action_data.damage_effect = damage_effect
			action_data.attacker_unit = self._unit
			action_data.col_ray = col_ray
			action_data.shield_knock = can_shield_knock --Silly vanilla code using branching when it doesn't need to.
			action_data.name_id = melee_entry
			action_data.charge_lerp_value = charge_lerp_value
			--Damage multipliers for certain melees (IE: Butterfly Knife).
			action_data.backstab_multiplier = melee_weapon.backstab_damage_multiplier or 1
			action_data.headshot_multiplier = melee_weapon.headshot_damage_multiplier or 1
			if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
				self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
				self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
				local stack = self._state_data.stacking_dmg_mul.melee
				if character_unit:character_damage().dead and not character_unit:character_damage():dead() then
					stack[1] = t + managers.player:upgrade_value("melee", "stacking_hit_expire_t", 1)
					stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_melee_weapon_dmg_mul_stacks or 5)
				else
					stack[1] = nil
					stack[2] = 0
				end
			end
			local defense_data = character_unit:character_damage():damage_melee(action_data)
			self:_check_melee_dot_damage(col_ray, defense_data, melee_entry)
			self:_perform_sync_melee_damage(hit_unit, col_ray, action_data.damage)

			return defense_data
		else
			self:_perform_sync_melee_damage(hit_unit, col_ray, damage)
		end
	else
	end
	if managers.player:has_category_upgrade("melee", "stacking_hit_damage_multiplier") then
		self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
		self._state_data.stacking_dmg_mul.melee = self._state_data.stacking_dmg_mul.melee or {nil, 0}
		local stack = self._state_data.stacking_dmg_mul.melee
		stack[1] = nil
		stack[2] = 0
	end
	return col_ray
end

--Now also returns steelsight information. Used for referencing spread values to give steelsight bonuses.
function PlayerStandard:get_movement_state()
	if self._state_data.in_steelsight then
		return self._moving and "moving_steelsight" or "steelsight"
	end

	if self._state_data.ducking then
		return self._moving and "moving_crouching" or "crouching"
	else
		return self._moving and "moving_standing" or "standing"
	end
end

--Initiate dodge stuff when player enters a state where they can begin dodging stuff.
--Crashes here indicate syntax errors in playerdamage.
Hooks:PostHook(PlayerStandard, "_enter", "ResDodgeInit", function(self, enter_data)
	self._ext_damage:set_dodge_points()
end)

--Reload functions changed to allow for shotgun per-shell reloads to take ammo picked up over their duration into account.
function PlayerStandard:_update_reload_timers(t, dt, input)
	if self._state_data.reload_enter_expire_t and self._state_data.reload_enter_expire_t <= t then
		self._state_data.reload_enter_expire_t = nil

		self:_start_action_reload(t)
	end

	--Moved earlier in function to avoid math on nil value.
	local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
	
	if self._state_data.reload_expire_t then
		local interupt = nil

		if self._equipped_unit:base():update_reloading(t, dt, self._state_data.reload_expire_t - t) then
			managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
			
			if self._queue_reload_interupt then
				self._queue_reload_interupt = nil
				interupt = true
			elseif self._state_data.reload_expire_t <= t then --Update timers in case player total ammo changes to allow for more to be reloaded.
				self._state_data.reload_expire_t = t + (self._equipped_unit:base():reload_expire_t() or 2.2) / speed_multiplier
			end
		end

		if self._state_data.reload_expire_t <= t or interupt then
			managers.player:remove_property("shock_and_awe_reload_multiplier")

			self._state_data.reload_expire_t = nil

			if self._equipped_unit:base():reload_exit_expire_t() then

				if self._equipped_unit:base():started_reload_empty() then
					self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_exit_expire_t() / speed_multiplier

					self._ext_camera:play_redirect(self:get_animation("reload_exit"), speed_multiplier)
					self._equipped_unit:base():tweak_data_anim_play("reload_exit", speed_multiplier)
				else
					self._state_data.reload_exit_expire_t = t + self._equipped_unit:base():reload_not_empty_exit_expire_t() / speed_multiplier

					self._ext_camera:play_redirect(self:get_animation("reload_not_empty_exit"), speed_multiplier)
					self._equipped_unit:base():tweak_data_anim_play("reload_not_empty_exit", speed_multiplier)
				end
			elseif self._equipped_unit then
				if not interupt then
					self._equipped_unit:base():on_reload()
				end

				managers.statistics:reloaded()
				managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())

				if input.btn_steelsight_state then
					self._steelsight_wanted = true
				elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not self._equipped_unit:base():run_and_shoot_allowed() then
					self._ext_camera:play_redirect(self:get_animation("start_running"))
				end
			end
		end
	end

	if self._state_data.reload_exit_expire_t and self._state_data.reload_exit_expire_t <= t then
		self._state_data.reload_exit_expire_t = nil

		if self._equipped_unit then
			managers.statistics:reloaded()
			managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())

			if input.btn_steelsight_state then
				self._steelsight_wanted = true
			elseif self.RUN_AND_RELOAD and self._running and not self._end_running_expire_t and not self._equipped_unit:base():run_and_shoot_allowed() then
				self._ext_camera:play_redirect(self:get_animation("start_running"))
			end

			if self._equipped_unit:base().on_reload_stop then
				self._equipped_unit:base():on_reload_stop()
			end
		end
	end
end

function PlayerStandard:_start_action_reload(t)
	local weapon = self._equipped_unit:base()

	if weapon and weapon:can_reload() then
		weapon:tweak_data_anim_stop("fire")

		local speed_multiplier = weapon:reload_speed_multiplier()
		local empty_reload = weapon:clip_empty() and 1 or 0

		if weapon._use_shotgun_reload then
			empty_reload = weapon:get_ammo_max_per_clip() - weapon:get_ammo_remaining_in_clip()
		end

		local tweak_data = weapon:weapon_tweak_data()
		local reload_anim = "reload"
		local reload_prefix = weapon:reload_prefix() or ""
		local reload_name_id = tweak_data.animations.reload_name_id or weapon.name_id
		
		weapon:start_reload() --Executed earlier to get accurate reload timers, otherwise may mess up normal and tactical for shotguns.

		if weapon:clip_empty() then
			local reload_ids = Idstring(reload_prefix .. "reload_" .. reload_name_id)
			local result = self._ext_camera:play_redirect(reload_ids, speed_multiplier)

			Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_ids)

			self._state_data.reload_expire_t = t + (tweak_data.timers.reload_empty or weapon:reload_expire_t() or 2.6) / speed_multiplier
		else
			reload_anim = "reload_not_empty"
			local reload_ids = Idstring(reload_prefix .. "reload_not_empty_" .. reload_name_id)
			local result = self._ext_camera:play_redirect(reload_ids, speed_multiplier)

			Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_ids)

			self._state_data.reload_expire_t = t + (tweak_data.timers.reload_not_empty or weapon:reload_expire_t() or 2.2) / speed_multiplier
		end


		if not weapon:tweak_data_anim_play(reload_anim, speed_multiplier) then
			weapon:tweak_data_anim_play("reload", speed_multiplier)
			Application:trace("PlayerStandard:_start_action_reload( t ): ", reload_anim)
		end

		self._ext_network:send("reload_weapon", empty_reload, speed_multiplier)
	end
end

function PlayerStandard:_get_swap_speed_multiplier()
	local multiplier = 1
	local weapon_tweak_data = self._equipped_unit:base():weapon_tweak_data()
	multiplier = multiplier * managers.player:upgrade_value("weapon", "swap_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_swap_speed_multiplier", 1)
	multiplier = multiplier * tweak_data.weapon.stats.mobility[self._equipped_unit:base():get_concealment() + 1] --Get concealment bonus/penalty.

	--Get per category multipliers (IE: Pistols swap faster, Akimbos swap slower, ect).
	for _, category in ipairs(weapon_tweak_data.categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "swap_speed_multiplier", 1)
		multiplier = multiplier * (tweak_data[category] and tweak_data[category].swap_bonus or 1)
	end

	if self._equipped_unit:base():got_silencer() then
		multiplier = multiplier * managers.player:upgrade_value("player", "silencer_swap_increase", 1)
	end

	--Get per weapon multiplier.
	multiplier = multiplier * (weapon_tweak_data.swap_speed_multiplier or 1)

	multiplier = multiplier * managers.player:upgrade_value("team", "crew_faster_swap", 1)

	if managers.player:has_activate_temporary_upgrade("temporary", "swap_weapon_faster") then
		multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "swap_weapon_faster", 1)
	end

	multiplier = managers.modifiers:modify_value("PlayerStandard:GetSwapSpeedMultiplier", multiplier)
	return multiplier
end

--Inspire no longer works through walls.
function PlayerStandard:_get_unit_intimidation_action(intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only, secondary)
	local char_table = {}
	local unit_type_enemy = 0
	local unit_type_civilian = 1
	local unit_type_teammate = 2
	local unit_type_camera = 3
	local unit_type_turret = 4
	local cam_fwd = self._ext_camera:forward()
	local my_head_pos = self._ext_movement:m_head_pos()

	if _G.IS_VR then
		local hand_unit = self._unit:hand():hand_unit(self._interact_hand)

		if hand_unit:raycast("ray", hand_unit:position(), my_head_pos, "slot_mask", 1) then
			return
		end

		cam_fwd = hand_unit:rotation():y()
		my_head_pos = hand_unit:position()
	end

	local spotting_mul = managers.player:upgrade_value("player", "marked_distance_mul", 1)
	local range_mul = managers.player:upgrade_value("player", "intimidate_range_mul", 1) * managers.player:upgrade_value("player", "passive_intimidate_range_mul", 1)
	local intimidate_range_civ = tweak_data.player.long_dis_interaction.intimidate_range_civilians * range_mul
	local intimidate_range_ene = tweak_data.player.long_dis_interaction.intimidate_range_enemies * range_mul
	local highlight_range = tweak_data.player.long_dis_interaction.highlight_range * range_mul * spotting_mul
	local intimidate_range_teammates = tweak_data.player.long_dis_interaction.intimidate_range_teammates

	if intimidate_enemies then
		local enemies = managers.enemy:all_enemies()

		for u_key, u_data in pairs(enemies) do
			if self._unit:movement():team().foes[u_data.unit:movement():team().id] and not u_data.unit:anim_data().hands_tied and not u_data.unit:anim_data().long_dis_interact_disabled and (not u_data.unit:character_damage() or not u_data.unit:character_damage():dead()) and (u_data.char_tweak.priority_shout or not only_special_enemies) then
				if managers.groupai:state():whisper_mode() then
					if u_data.char_tweak.silent_priority_shout and u_data.unit:movement():cool() then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 0.01, my_head_pos, cam_fwd)
					elseif not u_data.unit:movement():cool() then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 100, my_head_pos, cam_fwd, nil, "ai_vision mover")
					end
				elseif u_data.char_tweak.priority_shout then
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 0.01, my_head_pos, cam_fwd)
				else
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 100, my_head_pos, cam_fwd, nil, "ai_vision mover")
				end
			end
		end
	end

	if intimidate_civilians then
		local civilians = managers.enemy:all_civilians()

		for u_key, u_data in pairs(civilians) do
			if alive(u_data.unit) and u_data.unit:in_slot(21) and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort

				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001

					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
				end
			end
		end
	end

	if intimidate_teammates and not managers.groupai:state():whisper_mode() then
		local criminals = managers.groupai:state():all_char_criminals()

		for u_key, u_data in pairs(criminals) do
			local added = nil

			if u_key ~= self._unit:key() then
				local rally_skill_data = self._ext_movement:rally_skill_data()

				if rally_skill_data and rally_skill_data.long_dis_revive and mvector3.distance_sq(self._pos, u_data.m_pos) < rally_skill_data.range_sq then
					local needs_revive = nil

					if u_data.unit:base().is_husk_player then
						needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
					else
						needs_revive = u_data.unit:character_damage():need_revive()
					end

					if needs_revive then
						added = true
						--Disable "interaction_through_walls" from the char_table check to stop inspire from working through walls.
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, false, true, 5000, my_head_pos, cam_fwd)
					end
				end
			end

			if not added and not u_data.is_deployable and not u_data.unit:movement():downed() and not u_data.unit:base().is_local_player and not u_data.unit:anim_data().long_dis_interact_disabled then
				self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, intimidate_range_teammates, true, not secondary, 0.01, my_head_pos, cam_fwd)
			end
		end
	end

	if intimidate_enemies and intimidate_teammates then
		local enemies = managers.enemy:all_enemies()

		for u_key, u_data in pairs(enemies) do
			if u_data.unit:movement():team() and u_data.unit:movement():team().id == "criminal1" and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort

				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001

					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
				end
			end
		end
	end

	if intimidate_enemies then
		if managers.groupai:state():whisper_mode() then
			for _, unit in ipairs(SecurityCamera.cameras) do
				if alive(unit) and unit:enabled() and not unit:base():destroyed() then
					local dist = 2000
					local prio = 0.001

					self:_add_unit_to_char_table(char_table, unit, unit_type_camera, dist, false, false, prio, my_head_pos, cam_fwd, {
						unit
					})
				end
			end
		end

		local turret_units = managers.groupai:state():turrets()

		if turret_units then
			for _, unit in pairs(turret_units) do
				if alive(unit) and unit:movement():team().foes[self._ext_movement:team().id] then
					self:_add_unit_to_char_table(char_table, unit, unit_type_turret, 2000, false, false, 0.01, my_head_pos, cam_fwd, {
						unit
					})
				end
			end
		end
	end

	local prime_target = self:_get_interaction_target(char_table, my_head_pos, cam_fwd)

	return self:_get_intimidation_action(prime_target, char_table, intimidation_amount, primary_only, detect_only, secondary)
end

function PlayerStandard:interrupt_all_actions()
	local t = TimerManager:game():time()

	self:_interupt_action_reload(t)
	self:_interupt_action_steelsight(t)
	self:_interupt_action_running(t)
	self:_interupt_action_charging_weapon(t)
	self:_interupt_action_interact(t)
	self:_interupt_action_ladder(t)
	self:_interupt_action_melee(t)
	self:_interupt_action_throw_grenade(t)
	self:_interupt_action_throw_projectile(t)
	self:_interupt_action_use_item(t)
	self:_interupt_action_cash_inspect(t)
end

--RAID minigames.  Disabled for the time being.
--[[Hooks:PostHook(PlayerStandard, "_start_action_interact", "RaidMinigameCheckInteraction", function(self, t, input, timer, object)
	if alive(object) then
		local name = object:interaction().tweak_data
		local tweak = tweak_data.interaction[name]
		if name ~= "open_door_with_keys" then -- Crashes & is not really lockpicking in the same sense.
			if tweak and (tweak.is_lockpicking or tweak.special_interaction == "raid") then
				game_state_machine:change_state_by_name("ingame_special_interaction", {object = object, type = tweak.special_interaction or "raid"})
				self._interact_expire_t = nil
				managers.hud:hide_interaction_bar()
				object:interaction():_post_event(self._unit, "sound_interupt")
			end
		end
	end
end)]]--

--Replace coroutine with a playermanager function. The coroutine had issues with randomly not being called- or not having values get reset, and overall being jank???
function PlayerStandard:_find_pickups(t)
	local pickups = World:find_units_quick("sphere", self._unit:movement():m_pos(), self._pickup_area, self._slotmask_pickups)
	local grenade_tweak = tweak_data.blackmarket.projectiles[managers.blackmarket:equipped_grenade()]
	local may_find_grenade = not grenade_tweak.base_cooldown and managers.player:has_category_upgrade("player", "regain_throwable_from_ammo")

	for _, pickup in ipairs(pickups) do
		if pickup:pickup() and pickup:pickup():pickup(self._unit) then
			if may_find_grenade then
				managers.player:regain_throwable_from_ammo() --Replace vanilla coroutine
			end

			for id, weapon in pairs(self._unit:inventory():available_selections()) do
				managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
			end
		end
	end
end

--Allowing underbarrels to update stance
function PlayerStandard:_check_action_deploy_underbarrel(t, input)
	local new_action = nil
	local action_forbidden = false

	if not input.btn_deploy_bipod and not self._toggle_underbarrel_wanted then
		return new_action
	end
	
	--Removed the ADS check so you can swap to the underbarrel while doing that
	action_forbidden = self:_is_throwing_projectile() or self:_is_meleeing() or self:is_equipping() or self:_changing_weapon() or self:shooting() or self:_is_reloading() or self:is_switching_stances() or self:_interacting() or self:running() and not self._equipped_unit:base():run_and_shoot_allowed()

	if self._running and not self._equipped_unit:base():run_and_shoot_allowed() and not self._end_running_expire_t then
		self:_interupt_action_running(t)

		self._toggle_underbarrel_wanted = true

		return
	end

	if not action_forbidden then
		self._toggle_underbarrel_wanted = false
		local weapon = self._equipped_unit:base()
		local underbarrel_names = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("underbarrel", weapon._factory_id, weapon._blueprint)

		if underbarrel_names and underbarrel_names[1] then
			local underbarrel = weapon._parts[underbarrel_names[1]]

			if underbarrel then
				local underbarrel_base = underbarrel.unit:base()
				local underbarrel_tweak = tweak_data.weapon[underbarrel_base.name_id]

				if weapon.record_fire_mode then
					weapon:record_fire_mode()
				end

				underbarrel_base:toggle()

				new_action = true

				if weapon.reset_cached_gadget then
					weapon:reset_cached_gadget()
				end

				if weapon._update_stats_values then
					weapon:_update_stats_values(true)
				end

				local anim_ids = nil
				local switch_delay = 1

				if underbarrel_base:is_on() then
					anim_ids = Idstring("underbarrel_enter_" .. weapon.name_id)
					switch_delay = underbarrel_tweak.timers.equip_underbarrel

					self:set_animation_state("underbarrel")
				else
					anim_ids = Idstring("underbarrel_exit_" .. weapon.name_id)
					switch_delay = underbarrel_tweak.timers.unequip_underbarrel

					self:set_animation_state("standard")
				end

				if anim_ids then
					self._ext_camera:play_redirect(anim_ids, 1)
				end

				self:set_animation_weapon_hold(nil)
				self:set_stance_switch_delay(switch_delay)
				--Updates the stance when we 'deploy' the underbarrel.
				self:_stance_entered()

				if alive(self._equipped_unit) then
					managers.hud:set_ammo_amount(self._equipped_unit:base():selection_index(), self._equipped_unit:base():ammo_info())
					managers.hud:set_teammate_weapon_firemode(HUDManager.PLAYER_PANEL, self._unit:inventory():equipped_selection(), self._equipped_unit:base():fire_mode())
				end

				managers.network:session():send_to_peers_synched("sync_underbarrel_switch", self._equipped_unit:base():selection_index(), underbarrel_base.name_id, underbarrel_base:is_on())
			end
		end
	end

	return new_action
end

function PlayerStandard:_interupt_action_reload(t)
	if alive(self._equipped_unit) then
		self._equipped_unit:base():check_bullet_objects()
	end

	if self:_is_reloading() then
		self._equipped_unit:base():tweak_data_anim_stop("reload_enter")
		self._equipped_unit:base():tweak_data_anim_stop("reload")
		self._equipped_unit:base():tweak_data_anim_stop("reload_not_empty")
		self._equipped_unit:base():tweak_data_anim_stop("reload_exit")
	end

	self._state_data.reload_enter_expire_t = nil
	self._state_data.reload_expire_t = nil
	self._state_data.reload_exit_expire_t = nil
	--Fixes weapons using shotgun-style reloads occasionally only loading one shell in
	self._queue_reload_interupt = nil

	managers.player:remove_property("shock_and_awe_reload_multiplier")
	self:send_reload_interupt()
end