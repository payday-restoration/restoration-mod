if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local old_init = CopMovement.init
	local action_variants = {
		security = {
			idle = CopActionIdle,
			act = CopActionAct,
			walk = CopActionWalk,
			turn = CopActionTurn,
			hurt = CopActionHurt,
			stand = CopActionStand,
			crouch = CopActionCrouch,
			shoot = CopActionShoot,
			reload = CopActionReload,
			spooc = ActionSpooc,
			tase = CopActionTase,
			dodge = CopActionDodge,
			warp = CopActionWarp,
			healed = CopActionHealed
		}
	}
	local security_variant = action_variants.security
	function CopMovement:init(unit)
		CopMovement._action_variants.cop_civ = security_variant
		CopMovement._action_variants.fbi_female = security_variant
		CopMovement._action_variants.hrt = security_variant
		CopMovement._action_variants.fbi_swat_vet = security_variant
		CopMovement._action_variants.swat_titan = security_variant
		CopMovement._action_variants.swat_assault = security_variant
		CopMovement._action_variants.city_swat_titan = security_variant
		CopMovement._action_variants.city_swat_titan_assault = security_variant
		CopMovement._action_variants.skeleton_swat_titan = security_variant
		CopMovement._action_variants.weekend = security_variant
		CopMovement._action_variants.weekend_dmr = security_variant
		CopMovement._action_variants.weekend_lmg = security_variant
		CopMovement._action_variants.omnia = security_variant
		CopMovement._action_variants.omnia_heavy = security_variant
		CopMovement._action_variants.boom = security_variant
		CopMovement._action_variants.rboom = security_variant
		CopMovement._action_variants.fbi_vet = security_variant
		CopMovement._action_variants.vetlod = security_variant		
		CopMovement._action_variants.meme_man = security_variant		
		CopMovement._action_variants.meme_man_shield = clone(security_variant)
		CopMovement._action_variants.meme_man_shield.hurt = ShieldActionHurt
		CopMovement._action_variants.meme_man_shield.walk = ShieldCopActionWalk		
		CopMovement._action_variants.spring = clone(security_variant)
		CopMovement._action_variants.summers = clone(security_variant)
		CopMovement._action_variants.boom_summers = clone(security_variant)
		CopMovement._action_variants.boom_summers.heal = MedicActionHeal
		CopMovement._action_variants.taser_summers = clone(security_variant)
		CopMovement._action_variants.taser_summers.heal = MedicActionHeal
		CopMovement._action_variants.omnia_lpf = security_variant
		CopMovement._action_variants.medic_summers = clone(security_variant)
		CopMovement._action_variants.medic_summers.heal = MedicActionHeal
		CopMovement._action_variants.tank_titan = clone(security_variant)
		CopMovement._action_variants.tank_titan.walk = TankCopActionWalk
		CopMovement._action_variants.tank_titan_assault = clone(security_variant)
		CopMovement._action_variants.tank_titan_assault.walk = TankCopActionWalk
		CopMovement._action_variants.tank_biker = clone(security_variant)
		CopMovement._action_variants.tank_biker.walk = TankCopActionWalk
		CopMovement._action_variants.biker_guard = security_variant
		CopMovement._action_variants.phalanx_minion_assault = clone(security_variant)
		CopMovement._action_variants.phalanx_minion_assault.hurt = ShieldActionHurt
		CopMovement._action_variants.phalanx_minion_assault.walk = ShieldCopActionWalk
		CopMovement._action_variants.spooc_titan = security_variant
		CopMovement._action_variants.autumn = security_variant
		CopMovement._action_variants.taser_titan = clone(security_variant)
		
		old_init(self, unit)		
	end

	function CopMovement:post_init()
		local unit = self._unit
		self._ext_brain = unit:brain()
		self._ext_network = unit:network()
		self._ext_anim = unit:anim_data()
		self._ext_base = unit:base()
		self._ext_damage = unit:character_damage()
		self._ext_inventory = unit:inventory()
		self._tweak_data = tweak_data.character[self._ext_base._tweak_table]
		tweak_data:add_reload_callback(self, self.tweak_data_clbk_reload)
		self._machine = self._unit:anim_state_machine()
		self._machine:set_callback_object(self)
		self._stance = {
			code = 1,
			name = "ntl",
			values = {
				1,
				0,
				0,
				0
			}
		}
		if managers.navigation:is_data_ready() then
			self._nav_tracker = managers.navigation:create_nav_tracker(self._m_pos)
			self._pos_rsrv_id = managers.navigation:get_pos_reservation_id()
		else
			Application:error("[CopMovement:post_init] Spawned AI unit with incomplete navigation data.")
			self._unit:set_extension_update(ids_movement, false)
		end
		self._unit:kill_mover()
		self._unit:set_driving("script")
		self._unit:unit_data().has_alarm_pager = self._tweak_data.has_alarm_pager
		local event_list = {
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
			"concussion"
		}
		table.insert(event_list, "healed")
		self._unit:character_damage():add_listener("movement", event_list, callback(self, self, "damage_clbk"))
		self._unit:inventory():add_listener("movement", {"equip", "unequip"}, callback(self, self, "clbk_inventory"))
		restoration.log_shit("SC: ADDING WEAPONS")
		self:add_weapons()
		restoration.log_shit("SC: WEAPONS ADDED")
		if self._unit:inventory():is_selection_available(1) then
			self._unit:inventory():equip_selection(1, true)
		elseif self._unit:inventory():is_selection_available(2) then
			self._unit:inventory():equip_selection(2, true)
		end
		if self._ext_inventory:equipped_selection() == 2 and managers.groupai:state():whisper_mode() then
			restoration.log_shit("SC: Stealth with secondary equipped, disabling weapon")
			self._ext_inventory:set_weapon_enabled(false)
			restoration.log_shit("SC: Secondary disabled")
		end
		local weap_name = self._ext_base:default_weapon_name(managers.groupai:state():enemy_weapons_hot() and "primary" or "secondary")
		local fwd = self._m_rot:y()
		self._action_common_data = {
			stance = self._stance,
			pos = self._m_pos,
			rot = self._m_rot,
			fwd = fwd,
			right = self._m_rot:x(),
			unit = unit,
			machine = self._machine,
			ext_movement = self,
			ext_brain = self._ext_brain,
			ext_anim = self._ext_anim,
			ext_inventory = self._ext_inventory,
			ext_base = self._ext_base,
			ext_network = self._ext_network,
			ext_damage = self._ext_damage,
			char_tweak = self._tweak_data,
			nav_tracker = self._nav_tracker,
			active_actions = self._active_actions,
			queued_actions = self._queued_actions,
			look_vec = mvector3.copy(fwd)
		}
		self:upd_ground_ray()
		if self._gnd_ray then
			self:set_position(self._gnd_ray.position)
		end
		self._omnia_cooldown = 0
		self._aoe_heal_cooldown = 0
		self._aoe_blackout_cooldown = 0
		self:_post_init()
	end

	function CopMovement:_upd_actions(t)
		local a_actions = self._active_actions
		local has_no_action = true
		for i_action, action in ipairs(a_actions) do
			if action then
				if action.update then
					action:update(t)
				end
				if not self._need_upd and action.need_upd then
					self._need_upd = action:need_upd()
				end
				if action.expired and action:expired() then
					a_actions[i_action] = false
					if action.on_exit then
						action:on_exit()
					end
					self._ext_brain:action_complete_clbk(action)
					self._ext_base:chk_freeze_anims()
					for _, action in ipairs(a_actions) do
						if action then
							has_no_action = nil
						else
						end
					end
				else
					has_no_action = nil
				end
			end
		end
		if has_no_action and (not self._queued_actions or not next(self._queued_actions)) then
			self:action_request({type = "idle", body_part = 1})
		end
		if not a_actions[1] and not a_actions[2] and (not self._queued_actions or not next(self._queued_actions)) and not self:chk_action_forbidden("action") then
			if a_actions[3] then
				self:action_request({type = "idle", body_part = 2})
			else
				self:action_request({type = "idle", body_part = 1})
			end
		end
		self:_upd_stance(t)
		if not self._need_upd and (self._ext_anim.base_need_upd or self._ext_anim.upper_need_upd or self._stance.transition or self._suppression.transition) then
			self._need_upd = true
		end
		if self._tweak_data.do_omnia then
			if not self._unit:character_damage():dead() then			
				self:do_omnia(self)		
			end
		end
		if self._tweak_data.do_aoe_heal then
			if not self._unit:character_damage():dead() then			
				self:do_aoe_heal(self)		
			end
		end	
		if self._tweak_data.do_summers_heal then
			if not self._unit:character_damage():dead() then			
				self:do_summers_heal(self)		
			end
		end		
		if self._tweak_data.do_autumn_blackout then 
			self:do_autumn_blackout(self)
		end
	end

	function CopMovement:do_omnia(self)
		local t = TimerManager:main():time()
		if self._omnia_cooldown > t then
			return
		else
			self._omnia_cooldown = t + 0.2
		end
		if self and self._unit then
			if self._unit:base()._tweak_table == "omnia_lpf" and not self._unit:character_damage():dead() then
				local cops_to_heal = {
					"cop",
					"cop_scared",
					"cop_female",
					"fbi",
					"swat"
				}
				local enemies = World:find_units_quick(self._unit, "sphere", self._unit:position(), tweak_data.medic.lpf_radius * 1, managers.slot:get_mask("enemies"))
				if enemies then
					restoration.log_shit("SC: FOUND ENEMIES")
					for _,enemy in ipairs(enemies) do
						if enemy ~= self._unit then
							local found_dat_shit = false
							for __,enemy_type in ipairs(cops_to_heal) do
								restoration.log_shit("SC: CHECKING " .. enemy_type .. " VS " .. enemy:base()._tweak_table)
								if enemy:base()._tweak_table == enemy_type then
									restoration.log_shit("SC: ENEMY TO HEAL FOUND " .. enemy_type)
									found_dat_shit = true
								end
							end
							if found_dat_shit then
								local health_left = enemy:character_damage()._health
								restoration.log_shit("SC: health_left: " .. tostring(health_left))
								local max_health = enemy:character_damage()._HEALTH_INIT * 2
								restoration.log_shit("SC: max_health: " .. tostring(max_health))
								if health_left < max_health then
									local amount_to_heal = math.ceil(((max_health - health_left) / 20))
									restoration.log_shit("SC: HEALING FOR " .. amount_to_heal)
									if self._unit:contour() then
										self._unit:contour():add("medic_show", false)
										self._unit:contour():flash("medic_show", 0.2)
										managers.groupai:state():chk_say_enemy_chatter(self._unit, self._m_pos, "heal_chatter")
									end										
									if enemy:contour() then
										enemy:contour():add("omnia_heal", false)
									end		
									enemy:character_damage():_apply_damage_to_health((amount_to_heal * -1))
								end
							end
						end
					end
				end
			end
		else
			restoration.log_shit("SC: UNIT NOT FOUND WTF")
		end
	end

	function CopMovement:do_autumn_blackout(self)	
		local test_kicker = false 
		
	--every [cooldown] seconds:
		-- check all equipment units with equipment tweakdata tag "blackout_vulnerable"
		-- for each of these units:
			-- if (in surrounding [radius] area): set var "blackout_active" to "true
			-- else: set var "blackout_active" 
	
		local blackout_cooldown = 1
		local blackout_radius = 600000 --target equipment acquisition to apply blackout aoe to
		local t = TimerManager:main():time()
		if self._aoe_blackout_cooldown > t then
			return
		else
			self._aoe_blackout_cooldown = t + blackout_cooldown
		end
		
		if self._unit then
			if self._unit:character_damage():dead() then return end --autumn's corpse will still disable equipment otherwise
			
			local all_eq = World:find_units_quick("all",14,25,26)
			local closest = { --not currently used
				--unit = false, 
				--distance = math.huge()
			}
			for k,unit in pairs(all_eq) do 
				if unit and alive(unit) and unit:base() then
					
					local dis = mvector3.distance_sq(self._unit:position(),unit:position())
					if unit:interaction() and unit:interaction()._tweak_data and unit:interaction()._tweak_data.blackout_vulnerable then 
						if not test_kicker then 
							if dis < blackout_radius and not unit:base().blackout_active then --within blackout aoe
								if unit:base().get_name_id then 
									local eq_id = unit:base():get_name_id() or "ERROR"
									if eq_id == "sentry_gun" then --perish
										unit:character_damage():die()
									elseif eq_id == "ecm_jammer" then 
										unit:base():set_battery_empty()
										unit:base():_set_feedback_active(false)
									end
								end
								
								unit:base().blackout_active = true
								
								if unit.contour and unit:contour() then 
									unit:contour():add("deployable_blackout")
								end
							elseif dis >= blackout_radius and unit:base().blackout_active then
							
								unit:base().blackout_active = false
								
								if unit.contour and unit:contour() then 
									unit:contour():remove("deployable_blackout")
								end
							end
						elseif (dis < (closest.distance or blackout_radius)) then --do dick kickem
							closest = {
								distance = distance,
								unit = unit
							}
						end 
					end
				end
			end
			if test_kicker then  --unused

				if closest.unit then 
					local followup_objective = {
						type = "act",
						scan = true,
						action = {type = "act", body_part = 1, variant = "crouch", 
									blocks = {action = -1, walk = -1, hurt = -1, heavy_hurt = -1, aim = -1}
								}
						}
					local act = "e_so_container_kick"
					local override_objective = {
						type = act,
						follow_unit = self._unit,
						called = true,
						destroy_clbk_key = false,
						nav_seg = self._nav_tracker:nav_segment(),
						pos = closest.unit:position(),
						scan = true,
						action = {
							type = "act", 
							variant = act,
							body_part = 1,
							blocks = {action = -1, walk = -1, hurt = -1, light_hurt = -1, heavy_hurt = -1 ,aim = -1},
							align_sync = true,
							},
						action_duration = 3,
						followup_objective = followup_objective,
						complete_clbk = callback(self,self,"clbk_autumn_blackout_complete"),
						fail_clbk = callback(self,self,"clbk_autumn_blackout_cancel")
						
					}
					self._ext_brain:set_objective(override_objective)
				end
			end
		end
	end
	
	function CopMovement:clbk_autumn_blackout_cancel(self) --not used
		--OffyLib:c_log(target,"Cancelled blackout on unit")
	end
	function CopMovement:clbk_autumn_blackout_complete(self) --not used
		--OffyLib:c_log(target,"Done blackout on unit")
	end
	

	function CopMovement:do_aoe_heal(self)
		local t = TimerManager:main():time()
		if self._aoe_heal_cooldown > t then
			return
		else
			self._aoe_heal_cooldown = t + 0.4
		end
		if self and self._unit then
			if self._unit:base()._tweak_table == "omnia_lpf" and not self._unit:character_damage():dead() then
				local cops_to_heal = {
					"heavy_swat",
					"fbi_swat",
					"fbi_heavy_swat",
					"city_swat",
					"omnia",
					"sniper",
					"tank",
					"tank_hw",
					"tank_mini",
					"spooc",
					"shield",
					"taser",
					"boom",
					"rboom"
				}
				local enemies = World:find_units_quick(self._unit, "sphere", self._unit:position(), tweak_data.medic.lpf_radius * 1, managers.slot:get_mask("enemies"))
				if enemies then
					restoration.log_shit("SC: FOUND ENEMIES")
					for _,enemy in ipairs(enemies) do
						if enemy ~= self._unit then
							local found_dat_shit = false
							for __,enemy_type in ipairs(cops_to_heal) do
								restoration.log_shit("SC: CHECKING " .. enemy_type .. " VS " .. enemy:base()._tweak_table)
								if enemy:base()._tweak_table == enemy_type then
									restoration.log_shit("SC: ENEMY TO HEAL FOUND " .. enemy_type)
									found_dat_shit = true
								end
							end
							if found_dat_shit then
								local health_left = enemy:character_damage()._health
								restoration.log_shit("SC: health_left: " .. tostring(health_left))
								local max_health = enemy:character_damage()._HEALTH_INIT * 1
								restoration.log_shit("SC: max_health: " .. tostring(max_health))
								if health_left < max_health then
									local amount_to_heal = math.ceil(((max_health - health_left) / 20))
									restoration.log_shit("SC: HEALING FOR " .. amount_to_heal)
									if self._unit:contour() then
										self._unit:contour():add("medic_show", false)
										self._unit:contour():flash("medic_show", 0.2)
										managers.groupai:state():chk_say_enemy_chatter(self._unit, self._m_pos, "heal_chatter")
									end								
									if enemy:contour() then
										enemy:contour():add("medic_heal", true)
										enemy:contour():flash("medic_heal", 0.2)
									end		
									enemy:character_damage():_apply_damage_to_health((amount_to_heal * -1))							
								end
							end
						end
					end
				end
			end
		else
			restoration.log_shit("SC: UNIT NOT FOUND WTF")
		end
	end

	function CopMovement:do_summers_heal(self)
		local t = TimerManager:main():time()
		if self._aoe_heal_cooldown > t then
			return
		else
			self._aoe_heal_cooldown = t + 0.4
		end
		if self and self._unit then
			if self._unit:base()._tweak_table == "medic_summers" and not self._unit:character_damage():dead() then
				local cops_to_heal = {
					"taser_summers",
					"boom_summers",
					"summers"
				}
				local enemies = World:find_units_quick(self._unit, "sphere", self._unit:position(), tweak_data.medic.doc_radius * 1, managers.slot:get_mask("enemies"))
				if enemies then
					restoration.log_shit("SC: FOUND ENEMIES")
					for _,enemy in ipairs(enemies) do
						if enemy ~= self._unit then
							local found_dat_shit = false
							for __,enemy_type in ipairs(cops_to_heal) do
								restoration.log_shit("SC: CHECKING " .. enemy_type .. " VS " .. enemy:base()._tweak_table)
								if enemy:base()._tweak_table == enemy_type then
									restoration.log_shit("SC: ENEMY TO HEAL FOUND " .. enemy_type)
									found_dat_shit = true
								end
							end
							if found_dat_shit then
								local health_left = enemy:character_damage()._health
								restoration.log_shit("SC: health_left: " .. tostring(health_left))
								local max_health = enemy:character_damage()._HEALTH_INIT * 1
								restoration.log_shit("SC: max_health: " .. tostring(max_health))
								if health_left < max_health then
									local amount_to_heal = math.ceil(((max_health - health_left) / 20))
									restoration.log_shit("SC: HEALING FOR " .. amount_to_heal)
									if self._unit:contour() then
										self._unit:contour():add("medic_show", false)
										self._unit:contour():flash("medic_show", 0.2)
										managers.groupai:state():chk_say_enemy_chatter(self._unit, self._m_pos, "heal_chatter")
									end								
									if enemy:contour() then
										enemy:contour():add("medic_heal", true)
										enemy:contour():flash("medic_heal", 0.2)
									end		
									enemy:character_damage():_apply_damage_to_health((amount_to_heal * -1))							
								end
							end
						end
					end
				end
			end
		else
			restoration.log_shit("SC: UNIT NOT FOUND WTF")
		end
	end

	function CopMovement:add_weapons()
		if self._tweak_data.use_factory then
			local weapon_to_use = self._tweak_data.factory_weapon_id[ math.random( #self._tweak_data.factory_weapon_id ) ]
			local weapon_cosmetic = self._tweak_data.weapon_cosmetic_string
			restoration.log_shit("SC: WEAPON TO USE " .. weapon_to_use)
			if weapon_to_use then
				if weapon_cosmetic then
					self._unit:inventory():add_unit_by_factory_name(weapon_to_use, false, false, weapon_cosmetic, "")
				else
					self._unit:inventory():add_unit_by_factory_name(weapon_to_use, false, false, nil, "")
				end
				restoration.log_shit("SC: PRIMARY ADDED")
			end
		else
			local prim_weap_name = self._ext_base:default_weapon_name("primary")
			local sec_weap_name = self._ext_base:default_weapon_name("secondary")
			if prim_weap_name then
				self._unit:inventory():add_unit_by_name(prim_weap_name)
			end
			if sec_weap_name and sec_weap_name ~= prim_weap_name then
				self._unit:inventory():add_unit_by_name(sec_weap_name)
			end
		end
	end

	function CopMovement:_chk_play_equip_weapon()
		if self._stance.values[1] == 1 and not self._ext_anim.equip and not self._tweak_data.no_equip_anim and not self:chk_action_forbidden("action") then
			local redir_res = self:play_redirect("equip")
			if redir_res then
				local weapon_unit = self._ext_inventory:equipped_unit()
				if weapon_unit then
					local weap_tweak = weapon_unit:base():weapon_tweak_data()
					restoration.log_shit("SC: Weapon tweak found! " .. tostring(weap_tweak.sounds.prefix))
					local weapon_hold = weap_tweak.hold
					if type(weap_tweak.hold) == "table" then
						local num = #weap_tweak.hold + 1
						for i, hold_type in ipairs(weap_tweak.hold) do
							self._machine:set_parameter(redir_res, "to_" .. hold_type, num - i)
						end
					else
						self._machine:set_parameter(redir_res, "to_" .. weap_tweak.hold, 1)
					end
				end
			end
		end
		self._ext_inventory:set_weapon_enabled(true)
	end

	function CopMovement:play_redirect(redirect_name, at_time)
		--Not pretty but groupai didn't like me checking unit slots
		if redirect_name == "throw_grenade" then 
			if self._unit:in_slot(16) or self._unit:in_slot(22) then	
				return 
			end
		end
		
		local result = self._unit:play_redirect(Idstring(redirect_name), at_time)
		

		return result ~= Idstring("") and result
	end
	
	local mvec3_set = mvector3.set
	local mvec3_set_z = mvector3.set_z
	local mvec3_lerp = mvector3.lerp
	local mvec3_add = mvector3.add
	local mvec3_sub = mvector3.subtract
	local mvec3_mul = mvector3.multiply
	local mvec3_norm = mvector3.normalize
	local mvec3_len = mvector3.length
	local mrot_set = mrotation.set_yaw_pitch_roll
	local temp_vec1 = Vector3()
	local temp_vec2 = Vector3()
	local temp_vec3 = Vector3()

	function CopMovement:on_suppressed(state)
		local suppression = self._suppression
		local end_value = state and 1 or 0
		local vis_state = self._ext_base:lod_stage() 

		--if vis_state and end_value ~= suppression.value then
		if end_value ~= suppression.value then
			local t = TimerManager:game():time()
			local duration = 0.5 * math.abs(end_value - suppression.value)
			suppression.transition = {
				end_val = end_value,
				start_val = suppression.value,
				duration = duration,
				start_t = t,
				next_upd_t = t + 0.07
			}
		else
			suppression.transition = nil
			suppression.value = end_value

			self._machine:set_global("sup", end_value)
		end

		self._action_common_data.is_suppressed = state and true or nil

		if Network:is_server() and state then
			if self._tweak_data.allowed_poses and (self._tweak_data.allowed_poses.crouch or self._tweak_data.allowed_poses.stand) or self:chk_action_forbidden("walk") then
				--nothing
			elseif state == "panic" and not self:chk_action_forbidden("act") then
				if self._ext_anim.run and self._ext_anim.move_fwd then
					local action_desc = {
						clamp_to_graph = true,
						type = "act",
						body_part = 1,
						variant = "e_so_sup_fumble_run_fwd",
						blocks = {
							action = -1,
							walk = -1
						}
					}

					self:action_request(action_desc)
				else
					local function debug_fumble(result, from, to)
					end

					local vec_from = temp_vec1
					local vec_to = temp_vec2
					local ray_params = {
						allow_entry = false,
						trace = true,
						tracker_from = self:nav_tracker(),
						pos_from = vec_from,
						pos_to = vec_to
					}
					local allowed_fumbles = {
						"e_so_sup_fumble_inplace_3"
					}
					local allow = nil

					mvec3_set(vec_from, self:m_pos())
					mvec3_set(vec_to, self:m_rot():y())
					mvec3_mul(vec_to, -100)
					mvec3_add(vec_to, self:m_pos())

					allow = not managers.navigation:raycast(ray_params)

					debug_fumble(allow, vec_from, vec_to)

					if allow then
						table.insert(allowed_fumbles, "e_so_sup_fumble_inplace_1")
					end

					mvec3_set(vec_from, self:m_pos())
					mvec3_set(vec_to, self:m_rot():x())
					mvec3_mul(vec_to, 200)
					mvec3_add(vec_to, self:m_pos())

					allow = not managers.navigation:raycast(ray_params)

					debug_fumble(allow, vec_from, vec_to)

					if allow then
						table.insert(allowed_fumbles, "e_so_sup_fumble_inplace_2")
					end

					mvec3_set(vec_from, self:m_pos())
					mvec3_set(vec_to, self:m_rot():x())
					mvec3_mul(vec_to, -200)
					mvec3_add(vec_to, self:m_pos())

					allow = not managers.navigation:raycast(ray_params)

					debug_fumble(allow, vec_from, vec_to)

					if allow then
						table.insert(allowed_fumbles, "e_so_sup_fumble_inplace_4")
					end

					if #allowed_fumbles > 0 then
						local action_desc = {
							body_part = 1,
							type = "act",
							variant = allowed_fumbles[math.random(#allowed_fumbles)],
							blocks = {
								action = -1,
								walk = -1
							}
						}

						self:action_request(action_desc)
					end
				end
			elseif self._ext_anim.idle and (not self._active_actions[2] or self._active_actions[2]:type() == "idle") and not self:chk_action_forbidden("act") then
				local action_desc = {
					clamp_to_graph = true,
					type = "act",
					body_part = 1,
					variant = "suppressed_reaction",
					blocks = {
						walk = -1
					}
				}

				self:action_request(action_desc)
			elseif not self._ext_anim.crouch and self._tweak_data.crouch_move and (not self._tweak_data.allowed_poses or self._tweak_data.allowed_poses.crouch) and not self:chk_action_forbidden("crouch") then
				local action_desc = {
					body_part = 4,
					type = "crouch"
				}

				self:action_request(action_desc)
			elseif self._ext_anim.run and not self:chk_action_forbidden("act") and self._tweak_data.can_slide_on_suppress then  --add "and self._tweak_data.can_slide_on_suppress" to this if you follow the steps below at any point
				local action_desc = {
					clamp_to_graph = true,
					type = "act",
					body_part = 1,
					variant = "e_nl_slide_fwd_4m",
					blocks = {
						action = -1,
						walk = -1
					}
				}

				self:action_request(action_desc)
				--this will currently be done by anyone without "poses" but add stuff like 
				--can_slide_on_suppress = true
				--to charactertweakdata on the enemies that should be able to slide to further narrow it down so only certain enemies can do slides
			end
		end

		self:enable_update()

		if Network:is_server() then
			managers.network:session():send_to_peers_synched("suppressed_state", self._unit, state and true or false)
		end
	end

end
