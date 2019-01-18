if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	orig_firemode_interact = SentryGunFireModeInteractionExt.interact
	function SentryGunFireModeInteractionExt:interact(player)
		if self._sentry_gun_weapon._unit:base()._is_repairing or (self._sentry_gun_weapon._unit:character_damage() and self._sentry_gun_weapon._unit:character_damage():dead()) then 
			return 
		end
		return orig_firemode_interact(self,player)
	end

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