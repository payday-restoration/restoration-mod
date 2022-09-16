function GageAssignmentInteractionExt:interact(player)
	GageAssignmentInteractionExt.super.super.interact(self, player)

	if alive(player) and player:sound() and not (managers.groupai:state() and managers.groupai:state():whisper_mode()) then
		player:sound():say("g92", true, false)
	end

	return self._unit:base():pickup(player)
end

function BaseInteractionExt:_get_timer()
	local modified_timer = self:_get_modified_timer()

	if modified_timer then
		return modified_timer
	end

	local multiplier = 1

	multiplier = multiplier * managers.player:crew_ability_upgrade_value("crew_interact", 1)

	if self._tweak_data.upgrade_timer_multiplier then
		multiplier = multiplier * managers.player:upgrade_value(self._tweak_data.upgrade_timer_multiplier.category, self._tweak_data.upgrade_timer_multiplier.upgrade, 1)
	end

	if self._tweak_data.upgrade_timer_multipliers then
		for _, upgrade_timer_multiplier in pairs(self._tweak_data.upgrade_timer_multipliers) do
			multiplier = multiplier * managers.player:upgrade_value(upgrade_timer_multiplier.category, upgrade_timer_multiplier.upgrade, 1)
		end
	end

	if managers.player:has_category_upgrade("player", "level_interaction_timer_multiplier") then
		local data = managers.player:upgrade_value("player", "level_interaction_timer_multiplier") or {}
		local player_level = managers.experience:current_level() or 0
		multiplier = multiplier * (1 - (data[1] or 0) * math.ceil(player_level / (data[2] or 1)))
	end

	return self:_timer_value() * multiplier * managers.player:toolset_value()
end

--	local orig_blocked = BaseInteractionExt._interact_blocked
function BaseInteractionExt:_interact_blocked(player) --sentry blocking goes here
	local name = tostring(self.tweak_data or "nil")
	if self._unit and self._unit:base() and self._unit:base().blackout_active then --autumn blackout
		return true
	end
	if name == "sentry_gun_fire_mode" then 
		if self._sentry_gun_weapon and self._sentry_gun_weapon._unit then
			if self._sentry_gun_weapon._unit:base()._is_repairing then
				return true
			end
		end
	elseif name == "start_sentrygun_repairmode" then
		if self._unit and self._unit:base() then 
			if self._unit:base().get_name_id then 
				if self._unit:base().is_repairmode then
					local is_repairmode = self._unit:base():is_repairmode()
					if is_repairmode then 
						return true
					end
				end
			end
		end
	end		
	return false
end

local orig_selected = BaseInteractionExt.selected
function BaseInteractionExt:selected(player, locator, hand_id,...)
	local result = orig_selected(self,player,locator,hand_id,...) 

	if result and alive(self._unit) then
		local tid = self.tweak_data or "none"
		if self._unit:base() and self._unit:base().blackout_active then 
			managers.hud:show_interact({
				text = managers.localization:text("hud_interact_autumn_disable")
			})
		end
	end
	
	return result
end

local orig_interact_start = BaseInteractionExt.interact_start
function BaseInteractionExt:interact_start(player, data,...)
	if self._sentry_gun_weapon then
		if self._sentry_gun_weapon._unit:base()._is_repairing then
			return false
		elseif self._sentry_gun_weapon._unit:character_damage():dead() then
			return false
		end
	end
	if self._unit and self._unit:base() and self._unit:base().blackout_active then 
		return false
	else
		return orig_interact_start(self,player,data,...)
	end
end


--Sets up the AMMO_LEFT macro. Similar to vanilla but without the useless branching. It adjustes the AMMO_LEFT to match the actual number of bullets in the gun.
local function sentry_gun_interaction_add_string_macros(macros, ammo_ratio)
	macros.BTN_INTERACT = managers.localization:btn_macro("interact")
	macros.AMMO_LEFT = tostring(math.max(math.floor(tweak_data.upgrades.sentry_gun_base_ammo * ammo_ratio), 0))
end

--Fill in macros to generate string to display on screen, workaround to avoid more complicated stuff.
--String concatenation is used for macros.BTN_INTERACT because otherwise it displays as controller prompts all the time.
--If this gets to be a performance problem (IE: Notable frame drops while sentry text is on-screen), look into caching the strings.
function SentryGunFireModeInteractionExt:_add_string_macros(macros)
	local sentryweapon = self._sentry_gun_weapon
	local sentry = sentryweapon._unit:base()
	if sentry._is_repairing then --Repair progress indicator.
		local repair_ratio = 1 - ((sentry._repair_done_t - Application:time())/sentry._repair_time_total)
		local new_macro	= managers.localization:text("fixing_sentry_macro")
		new_macro = string.gsub(new_macro,"$AMMO_LEFT",math.floor(tostring(repair_ratio * 100))) --todo use string.format
		macros.AMMO_LEFT = new_macro
	elseif sentry._unit:character_damage() and sentry._unit:character_damage():dead() then --Repairs needed indicator.
		macros.AMMO_LEFT = managers.localization:text("far_repair_sentry_macro")
	else
		local ammo_ratio = Network:is_server() and sentryweapon:ammo_ratio() or sentryweapon:get_virtual_ammo_ratio()
		sentry_gun_interaction_add_string_macros(macros, ammo_ratio)
		local new_macro	= "Press " .. macros.BTN_INTERACT .. managers.localization:text("firemode_sentry_macro")
		new_macro = string.gsub(new_macro,"$AMMO_LEFT",macros.AMMO_LEFT)
		macros.AMMO_LEFT = new_macro
	end
end

function SentryGunInteractionExt:_add_string_macros(macros)
	local sentry = self._unit:base()
	if sentry._is_repairing then --Repair progress indicator
		macros.BTN_INTERACT = managers.localization:btn_macro("interact")
		local repair_ratio = 1 - ((sentry._repair_done_t - Application:time())/sentry._repair_time_total)
		local new_macro	= managers.localization:text("fixing_sentry_macro")
		new_macro = string.gsub(new_macro,"$AMMO_LEFT",math.floor(tostring(repair_ratio * 100))) --Repair progress indicator
		macros.AMMO_LEFT = new_macro
	elseif self._unit:character_damage() and self._unit:character_damage():dead() then --Prompt to repair sentry.
		macros.BTN_INTERACT = managers.localization:btn_macro("interact")
		macros.AMMO_LEFT = "Hold " .. macros.BTN_INTERACT .. managers.localization:text("repair_sentry_macro")
	else --Pickup sentry dialogue. Also displays ammo count + % of health remaining.
		local ammo_ratio = Network:is_server() and self._unit:weapon():ammo_ratio() or self._unit:weapon():get_virtual_ammo_ratio()
		sentry_gun_interaction_add_string_macros(macros, ammo_ratio)
		local health_ratio = math.floor(100 * sentry._unit:character_damage():health_ratio()) --% of health remaining.
		local new_macro = "Hold " .. macros.BTN_INTERACT .. managers.localization:text("pickup_sentry_macro") .. tostring(health_ratio) .. "% Health Remaining."
		new_macro = string.gsub(new_macro,"$AMMO_LEFT",macros.AMMO_LEFT) --# of bullets remaining.
		--new_macro = string.gsub(new_macro,"$BTN_INTERACT",macros.BTN_INTERACT) --Using macros to add the health_ratio ate the entire string. Will investigate later.
		macros.AMMO_LEFT = new_macro
	end
end

--Don't remove interaction on death, since we want to be able to interact with sentries to repair them.
function SentryGunInteractionExt:_on_death_event()
end

--If interacting with a dead (rip) sentry, put it in repair mode.
function SentryGunInteractionExt:interact(player)
	local rip = (self.tweak_data == "start_sentrygun_repairmode") or self._unit:character_damage():dead()

	SentryGunInteractionExt.super.super.interact(self, player)
	self._unit:base():on_interaction(rip)

	return true
end

if Global.game_settings and Global.game_settings.single_player then

	local can_select=BaseInteractionExt.can_select
	local can_interact=BaseInteractionExt.can_interact
	local can_interact_multi=MultipleChoiceInteractionExt.can_interact
	
	function can_pickup(player, item)
		return Network:is_server() and item
			and managers.player:player_unit()==player
			and managers.player:can_pickup_equipment(item)
		end

	function BaseInteractionExt:can_select(player)
		return can_select(self, player) or can_pickup(player, self._tweak_data.special_equipment_block)
	end

	function BaseInteractionExt:can_interact(player)
		return can_interact(self, player) or can_pickup(player, self._tweak_data.special_equipment_block)
	end

	function MultipleChoiceInteractionExt:can_interact(player)
		return can_interact_multi(self, player) or can_pickup(player, self._tweak_data.special_equipment_block)
	end

end

--All this just to make it so civilians not fleeing is not tied to stockholm syndrome trading.
function IntimitateInteractionExt:interact(player)
	if not self:can_interact(player) then
		return
	end

	local player_manager = managers.player
	local has_equipment = managers.player:has_special_equipment(self._tweak_data.special_equipment)

	if self._tweak_data.equipment_consume and has_equipment then
		managers.player:remove_special(self._tweak_data.special_equipment)
	end

	if self._tweak_data.sound_event then
		player:sound():play(self._tweak_data.sound_event)
	end

	if self._unit:damage() and self._unit:damage():has_sequence("interact") then
		self._unit:damage():run_sequence_simple("interact")
	end

	if self.tweak_data == "corpse_alarm_pager" then
		if Network:is_server() then
			self._nbr_interactions = 0

			if self._unit:character_damage():dead() then
				local u_id = managers.enemy:get_corpse_unit_data_from_key(self._unit:key()).u_id

				managers.network:session():send_to_peers_synched("alarm_pager_interaction", u_id, self.tweak_data, 3)
			else
				managers.network:session():send_to_peers_synched("sync_interacted", self._unit, self._unit:id(), self.tweak_data, 3)
			end

			self._unit:brain():on_alarm_pager_interaction("complete", player)

			if alive(managers.interaction:active_unit()) then
				managers.interaction:active_unit():interaction():selected()
			end
		else
			managers.groupai:state():sync_alarm_pager_bluff()

			if managers.enemy:get_corpse_unit_data_from_key(self._unit:key()) then
				local u_id = managers.enemy:get_corpse_unit_data_from_key(self._unit:key()).u_id

				managers.network:session():send_to_host("alarm_pager_interaction", u_id, self.tweak_data, 3)
			else
				managers.network:session():send_to_host("sync_interacted", self._unit, self._unit:id(), self.tweak_data, 3)
			end
		end

		if tweak_data.achievement.nothing_to_see_here and managers.player:local_player() == player then
			local achievement_data = tweak_data.achievement.nothing_to_see_here
			local achievement = "nothing_to_see_here"
			local memory = managers.job:get_memory(achievement, true)
			local t = Application:time()
			local new_memory = {
				value = 1,
				time = t
			}

			if memory then
				table.insert(memory, new_memory)

				for i = #memory, 1, -1 do
					if achievement_data.timer <= t - memory[i].time then
						table.remove(memory, i)
					end
				end
			else
				memory = {
					new_memory
				}
			end

			managers.job:set_memory(achievement, memory, true)

			local total_memory_value = 0

			for _, m_data in ipairs(memory) do
				total_memory_value = total_memory_value + m_data.value
			end

			if achievement_data.total_value <= total_memory_value then
				managers.achievment:award(achievement_data.award)
			end
		end

		self:remove_interact()
	elseif self.tweak_data == "corpse_dispose" then
		managers.player:set_carry("person", 0)
		managers.player:on_used_body_bag()

		local u_id = managers.enemy:get_corpse_unit_data_from_key(self._unit:key()).u_id

		if Network:is_server() then
			self:remove_interact()
			self:set_active(false, true)
			self._unit:set_slot(0)
			managers.network:session():send_to_peers_synched("remove_corpse_by_id", u_id, true, managers.network:session():local_peer():id())
			managers.player:register_carry(managers.network:session():local_peer(), "person")
		else
			managers.network:session():send_to_host("sync_interacted_by_id", u_id, self.tweak_data)
			player:movement():set_carry_restriction(true)
		end

		managers.mission:call_global_event("player_pickup_bodybag")
		managers.custom_safehouse:award("corpse_dispose")
	elseif self._tweak_data.dont_need_equipment and not has_equipment then
		self:set_active(false)
		self._unit:brain():on_tied(player, true)
	elseif self.tweak_data == "hostage_trade" then
		self._unit:brain():on_trade(player:position(), player:rotation(), true)

		if managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.relation_with_bulldozer.mask then
			managers.achievment:award_progress(tweak_data.achievement.relation_with_bulldozer.stat)
		end

		managers.statistics:trade({
			name = self._unit:base()._tweak_table
		})
	elseif self.tweak_data == "hostage_convert" then
		if Network:is_server() then
			self:remove_interact()
			self:set_active(false, true)
			managers.groupai:state():convert_hostage_to_criminal(self._unit)
		else
			managers.network:session():send_to_host("sync_interacted", self._unit, self._unit:id(), self.tweak_data, 1)
		end
	elseif self.tweak_data == "hostage_move" then
		if Network:is_server() then
			if self._unit:brain():on_hostage_move_interaction(player, "move") then
				self:remove_interact()
			end
		else
			managers.network:session():send_to_host("sync_interacted", self._unit, self._unit:id(), self.tweak_data, 1)
		end
	elseif self.tweak_data == "hostage_stay" then
		if Network:is_server() then
			if self._unit:brain():on_hostage_move_interaction(player, "stay") then
				self:remove_interact()
			end
		else
			managers.network:session():send_to_host("sync_interacted", self._unit, self._unit:id(), self.tweak_data, 1)
		end
	else
		self:remove_interact()
		self:set_active(false)
		player:sound():play("cable_tie_apply")
		self._unit:brain():on_tied(player, false, managers.player:has_category_upgrade("player", "civilians_dont_flee")) --No longer uses super_syndrome.
	end
end

function CarryInteractionExt:sync_interacted(peer, player, status, skip_alive_check)
	local no_player = player == nil
	player = player or peer:unit()

	if peer and not managers.player:register_carry(peer, self._unit:carry_data() and self._unit:carry_data():carry_id()) then
		return
	end

	if self._unit:damage():has_sequence("interact") then
		self._unit:damage():run_sequence_simple("interact", {
			unit = player
		})
	end

	if self._unit:damage():has_sequence("load") then
		self._unit:damage():run_sequence_simple("load", {
			unit = player
		})
	end

	if self._global_event then
		managers.mission:call_global_event(self._global_event, player)
	end

	if Network:is_server() then
		if self._remove_on_interact then
			if self._unit == managers.interaction:active_unit() then
				self:interact_interupt(managers.player:player_unit(), false)
			end

			self:remove_interact()
			self:set_active(false, true)

			if alive(player) then
				self._unit:carry_data():trigger_load(player)
			end

			self._unit:set_slot(0)
		end

		if peer then
			managers.player:set_carry_approved(peer)
		end
	elseif self._remove_on_interact then
		self._unit:set_visible(false) -- hide the bag until the host despawns it so it doesn't stick around for a split second after pickup
	end

	if no_player then
		managers.mission:call_global_event("on_picked_up_carry", self._unit)
	end
end

--Overriden so Leech players won't get revived for real when saving a dude
function ReviveInteractionExt:interact(reviving_unit)
	if reviving_unit and reviving_unit == managers.player:player_unit() then
		if not self:can_interact(reviving_unit) then
			return
		end

		if self._tweak_data.equipment_consume then
			managers.player:remove_special(self._tweak_data.special_equipment)
		end

		if self._tweak_data.sound_event then
			reviving_unit:sound():play(self._tweak_data.sound_event)
		end

		ReviveInteractionExt.super.interact(self, reviving_unit)
		managers.achievment:set_script_data("player_reviving", false)
		managers.player:activate_temporary_upgrade("temporary", "combat_medic_damage_multiplier")
		managers.player:activate_temporary_upgrade("temporary", "combat_medic_enter_steelsight_speed_multiplier")
	end

	self:remove_interact()

	if self._unit:damage() and self._unit:damage():has_sequence("interact") then
		self._unit:damage():run_sequence_simple("interact")
	end

	if self._unit:base().is_husk_player then
		local revive_rpc_params = {
			"revive_player",
			managers.player:upgrade_value("player", "revive_health_boost", 0),
			managers.player:upgrade_value("player", "revive_damage_reduction_level", 0)
		}

		managers.statistics:revived({
			npc = false,
			reviving_unit = reviving_unit
		})
		self._unit:network():send_to_unit(revive_rpc_params)
	else
		self._unit:character_damage():revive(reviving_unit)
		managers.statistics:revived({
			npc = true,
			reviving_unit = reviving_unit
		})
	end

	if reviving_unit:in_slot(managers.slot:get_mask("criminals")) then
		local hint = self.tweak_data == "revive" and 2 or 3

		managers.network:session():send_to_peers_synched("sync_teammate_helped_hint", hint, self._unit, reviving_unit)
		managers.trade:sync_teammate_helped_hint(self._unit, reviving_unit, hint)
	end

	if managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.witch_doctor.mask then
		managers.achievment:award_progress(tweak_data.achievement.witch_doctor.stat)
	end

	local event_listener = reviving_unit:event_listener()

	if event_listener then
		event_listener:call("on_revive_interaction_success")
	end
end