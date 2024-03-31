function ECMJammerBase._detect_and_give_dmg(hit_pos, device_unit, user_unit, range, activation)
	--[[local enemies_in_range = nil

	if device_unit then
		enemies_in_range = World:find_units_quick("sphere", hit_pos, range, managers.slot:get_mask("enemies"))
	else
		enemies_in_range = World:find_units_quick("all", managers.slot:get_mask("enemies")) --affect enemies on the entire map, to match the Pocket ECM's ingame description for meme purposes
	end]]

	local enemies_in_range = World:find_units_quick("sphere", hit_pos, range, managers.slot:get_mask("enemies"))
	local enemies_to_stun = {}

	if #enemies_in_range > 0 then
		for _, enemy in ipairs(enemies_in_range) do
			if not table.contains(enemies_to_stun, enemy) and enemy:character_damage() and enemy:character_damage().damage_explosion and not enemy:character_damage():dead() then
				if enemy:base():char_tweak().ecm_vulnerability and enemy:base():char_tweak().ecm_vulnerability > 0 then
					local stun = true

					if enemy:brain() then
						if enemy:brain().is_hostage and enemy:brain():is_hostage() or enemy:brain().surrendered and enemy:brain():surrendered() then
							stun = false
						end
					end

					if stun then
						if enemy:anim_data() and enemy:anim_data().act then
							stun = false
						elseif enemy:base():char_tweak().ecm_vulnerability <= math.random() and not activation then
							stun = false
						end
					end

					if stun then
						table.insert(enemies_to_stun, enemy)
					end
				end
			end
		end
	end

	for _, enemy in ipairs(enemies_to_stun) do
		local e_head_pos = mvector3.copy(enemy:movement():m_head_pos())
		local attack_dir = Vector3()

		mvector3.direction(attack_dir, hit_pos, e_head_pos)
		mvector3.normalize(attack_dir)

		local attack_data = {
			damage = 0,
			variant = "stun",
			attacker_unit = alive(user_unit) and user_unit or nil,
			weapon_unit = device_unit,
			col_ray = {
				position = mvector3.copy(enemy:movement():m_head_pos()),
				ray = attack_dir
			}
		}

		enemy:character_damage():damage_explosion(attack_data)
	end
end

function ECMJammerBase:clbk_feedback()
	local t = TimerManager:game():time()
	self._feedback_clbk_id = "ecm_feedback" .. tostring(self._unit:key())

	if not managers.groupai:state():enemy_weapons_hot() then
		managers.groupai:state():propagate_alert({
			"vo_cbt",
			self._position,
			10000,
			self._alert_filter,
			self._unit
		})
	end

	print("PUKING!!!!!")
	local activation = self._feedback_expire_t - t > self._feedback_duration - (self._feedback_interval)
	self._detect_and_give_dmg(self._position + self._unit:rotation():y() * 15, self._unit, self:owner(), self._feedback_range, activation)

	if self._feedback_expire_t < t then
		self._feedback_clbk_id = nil

		self:_set_feedback_active(false)
	else
		if self._feedback_expire_t - t < self._feedback_duration * 0.1 then
			self._g_glow_feedback_red:set_visibility(true)
			self._g_glow_feedback_green:set_visibility(false)

			if not self._unit:contour():is_flashing() then
				self._unit:contour():flash("deployable_active", 0.15)

				if Network:is_server() then
					self:_send_net_event(self._NET_EVENTS.feedback_flash)
				end
			end
		end

		managers.enemy:add_delayed_clbk(self._feedback_clbk_id, callback(self, self, "clbk_feedback"), t + self._feedback_interval)
	end
end

--Sync outline when feedback is ready so every player can see ECM and activate it
Hooks:PostHook(ECMJammerBase, "contour_interaction", "contour_interaction_feedback_ready_outline_sync", function(self)
	if managers.player:has_category_upgrade("ecm_jammer", "can_activate_feedback") and managers.network:session() and self._unit:contour() then
		self._unit:contour():add("deployable_interactable", true)
	end
end)

Hooks:PostHook(ECMJammerBase, "_set_feedback_active", "_set_feedback_active_ready_outline_sync", function(self,state)
	if state then
		self._unit:contour():remove("deployable_interactable", true)
		self._unit:contour():add("deployable_active")
	else
		if self._unit:contour() then
			self._unit:contour():remove("deployable_interactable", true)
			self._unit:contour():remove("deployable_active")
		end
	end
end)

--[[
Hooks:PostHook(ECMJammerBase, "sync_net_event", "sync_net_event_no_outlines", function(self,event_id)
	local disable_outlines = managers.mutators:modify_value("ECMJammerBase:DisableOutlines", false)
	if disable_outlines then
	local net_events = self._NET_EVENTS
		if event_id == net_events.feedback_flash then
			self._unit:contour():remove("deployable_active")
		end
	end
end)

Hooks:PostHook(ECMJammerBase, "set_active", "set_active_no_outlines", function(self,active)
	local disable_outlines = managers.mutators:modify_value("ECMJammerBase:DisableOutlines", false)
	if disable_outlines then
		if active then
			self._unit:contour():remove("deployable_active")
		end
	end
end)

Hooks:PostHook(ECMJammerBase, "_set_battery_low", "_set_battery_low_no_outlines", function(self)
	local disable_outlines = managers.mutators:modify_value("ECMJammerBase:DisableOutlines", false)
	if disable_outlines then
		if not self._unit:contour():is_flashing() then
			self._unit:contour():remove("deployable_active")
		end
	end
end)

Hooks:PostHook(ECMJammerBase, "_set_feedback_active", "_set_feedback_active_no_outlines", function(self,state)
	local disable_outlines = managers.mutators:modify_value("ECMJammerBase:DisableOutlines", false)
	if disable_outlines then
		if state then
			self._unit:contour():remove("deployable_active")
		end
	end
end)

Hooks:PostHook(ECMJammerBase, "contour_interaction", "contour_interaction_no_outlines", function(self)
	local disable_outlines = managers.mutators:modify_value("ECMJammerBase:DisableOutlines", false)
	if disable_outlines then
		if managers.player:has_category_upgrade("ecm_jammer", "can_activate_feedback") and managers.network:session() and self._unit:contour() and self._owner_id == managers.network:session():local_peer():id() then
			self._unit:contour():remove("deployable_interactable")
		end
	end
end)

Hooks:PostHook(ECMJammerBase, "contour_selected", "contour_selected_no_outlines", function(self)
	local disable_outlines = managers.mutators:modify_value("ECMJammerBase:DisableOutlines", false)
	if disable_outlines then
		self._unit:contour():remove("deployable_selected")
	end
end)
--]]