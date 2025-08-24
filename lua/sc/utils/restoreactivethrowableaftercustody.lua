Hooks:PostHook(GameStateMachine, "change_state_by_name", "change_state_by_name_restore_active_throwable_after_custody", function(self, state_name, params, ...)
	if state_name == "ingame_waiting_for_respawn" then
	    self._im_in_jail = true
	end
	
	if self._im_in_jail and (state_name == "ingame_standard" or state_name == "ingame_driving" or state_name == "ingame_mask_off" or state_name == "ingame_clean" or state_name == "ingame_civilian") then
	    self._im_in_jail = false
		DelayedCalls:Add("refresh_ins_inst", 0.01, function()
			managers.player:speed_up_grenade_cooldown(tweak_data.blackmarket.projectiles[managers.blackmarket:equipped_grenade()].base_cooldown)
	    end)
	end
end)