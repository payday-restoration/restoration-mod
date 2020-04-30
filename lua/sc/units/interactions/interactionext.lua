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
				text = "Disabled by Captain Autumn!"
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


--offy's sentry repair stuff
local function sentry_gun_interaction_add_string_macros(macros, ammo_ratio) --identical, copypasted from vanilla
	macros.BTN_INTERACT = managers.localization:btn_macro("interact", true)

	if ammo_ratio == 1 then
		macros.AMMO_LEFT = 100
	elseif ammo_ratio > 0 then
		local ammo_left = string.format("%.2f", tostring(ammo_ratio))
		ammo_left = string.sub(ammo_left, 3, 4)
		macros.AMMO_LEFT = ammo_left
	else
		macros.AMMO_LEFT = 0
	end
end


--	"hud_interact_sentry_gun_switch_fire_mode" : "Press $BTN_INTERACT to switch fire mode. $AMMO_LEFT ammo left",
function SentryGunFireModeInteractionExt:_add_string_macros(macros)
-- used a localization workaround in order to hide the localization text, since there are issues with
--deleting the firemode unit object and recreating it as client
	local sentryweapon = self._sentry_gun_weapon
	local sentry = sentryweapon._unit:base()
	if sentry._is_repairing then 
		macros.AMMO_LEFT = ""
		macros.BTN_INTERACT = ""
	elseif sentry._unit:character_damage() and sentry._unit:character_damage():dead() then 
	--don't show interaction text when dead. todo replace interaction text with "you must repair this sentry" or something?
		macros.AMMO_LEFT = ""
		macros.BTN_INTERACT = ""
	else
		local ammo_ratio = Network:is_server() and sentryweapon:ammo_ratio() or sentryweapon:get_virtual_ammo_ratio()
		sentry_gun_interaction_add_string_macros(macros, ammo_ratio)
		local new_macro	= string.gsub(managers.localization:text("firemode_sentry_macro"),"$BTN_INTERACT",macros.BTN_INTERACT)
		new_macro = string.gsub(new_macro,"$AMMO_LEFT",macros.AMMO_LEFT)
		macros.AMMO_LEFT = new_macro
		macros.BTN_INTERACT = ""
	end
end

--	"hud_interact_sentry_gun_switch_fire_mode" : "$AMMO_LEFT ammo left",
--	"hud_interact_pickup_sentry_gun" : "Hold $BTN_INTERACT to retrieve sentry gun. $AMMO_LEFT",
--"Hold $BTN_INTERACT to start sentry auto-repair sequence $AMMO_LEFT"	
function SentryGunInteractionExt:_add_string_macros(macros)
	local sentry = self._unit:base()--self._sentry_gun_weapon._unit:base() 
	macros.BTN_INTERACT = managers.localization:btn_macro("interact", true)
	if sentry._is_repairing then
	
		macros.BTN_INTERACT = ""
		local repair_ratio = 1 - ((sentry._repair_done_t - Application:time())/sentry._repair_time_total)
		local new_macro	= string.gsub(managers.localization:text("fixing_sentry_macro"),"$BTN_INTERACT",macros.BTN_INTERACT)
		new_macro = string.gsub(new_macro,"$AMMO_LEFT",math.floor(tostring(repair_ratio * 100))) --todo use string.format
		macros.AMMO_LEFT = new_macro
--		"[Repair progress:] " .. tostring(math.floor(100*repair_ratio)) .. "%"--string.format("%2f.0",tostring(100 * repair_ratio)) .. "%"
--		local repair_ratio = math.floor(sentry._repair_done_t - Application:time()) --todo use string.format etc
--		macros.AMMO_LEFT = "[Repair progress:] " .. tostring(repair_ratio) .. "%"
	elseif self._unit:character_damage() and self._unit:character_damage():dead() then
		macros.BTN_INTERACT = string.gsub(managers.localization:text("repair_sentry_macro"),"$BTN_INTERACT",macros.BTN_INTERACT)	
		macros.AMMO_LEFT = ""
	else
		local ammo_ratio = Network:is_server() and self._unit:weapon():ammo_ratio() or self._unit:weapon():get_virtual_ammo_ratio()
		sentry_gun_interaction_add_string_macros(macros, ammo_ratio)
	end
end

function SentryGunInteractionExt:_on_death_event() --don't remove interaction on death; instead, replace it
--		self:set_tweak_data("start_sentrygun_repairmode")
--	self:set_active(false, false)
end

function SentryGunInteractionExt:interact(player)

	local rip = (self.tweak_data == "start_sentrygun_repairmode") or self._unit:character_damage():dead()

	SentryGunInteractionExt.super.super.interact(self, player)
	self._unit:base():on_interaction(rip) -- i could make a new function. meh. it works fine this way

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
