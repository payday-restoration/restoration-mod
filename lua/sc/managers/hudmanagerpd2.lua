HUDManager._USE_BURST_MODE = true

HUDManager.set_teammate_weapon_firemode_burst = HUDManager.set_teammate_weapon_firemode_burst or function(self, id)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
end

Hooks:PreHook(HUDManager, "show_point_of_no_return_timer", "res_show_point_of_no_return_timer", function(self)
	if managers.groupai:state():use_ponr_music() then
		local ponr_track = managers.music:jukebox_menu_track("ponr")
		local assault = managers.music:track_listen_start("music_heist_assault", ponr_track)
		managers.music:post_event(assault)
	end
end)

function HUDManager:on_ineffective_hit_confirmed(damage_scale)
	if not managers.user:get_setting("hit_indicator") then
		return
	end

	self._hud_hit_confirm:on_ineffective_hit_confirmed(damage_scale)
end

function HUDManager:on_effective_hit_confirmed(damage_scale)
	if not managers.user:get_setting("hit_indicator") then
		return
	end

	self._hud_hit_confirm:on_effective_hit_confirmed(damage_scale)
end

 