HUDManager._USE_BURST_MODE = true	

HUDManager.set_teammate_weapon_firemode_burst = HUDManager.set_teammate_weapon_firemode_burst or function(self, id)
	self._teammate_panels[HUDManager.PLAYER_PANEL]:set_weapon_firemode_burst(id)
end

local show_point_of_no_return_timer_orig = HUDManager.show_point_of_no_return_timer
function HUDManager:show_point_of_no_return_timer()
	show_point_of_no_return_timer_orig(self)
	if managers.groupai:state()._ponr_is_on and Global.game_settings.one_down and restoration.Options:GetValue("OTHER/PONRTrack") and not restoration.Options:GetValue("OTHER/MusicShuffle") then
		managers.music:track_listen_start("music_heist_assault", "resmusic_ponr")
	end
end

function HUDManager:GetCategoryFromWeaponCategory(cat)
    local weapon, category, factoryid, weaponid
    if cat == "primary" then
		weapon = managers.blackmarket:equipped_primary()
		factoryid = weapon.factory_id
		weaponid = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factoryid)
		category = tweak_data.weapon[weaponid].category
	else
		weapon = managers.blackmarket:equipped_secondary()
		factoryid = weapon.factory_id
		weaponid = weapon.weapon_id or managers.weapon_factory:get_weapon_id_by_factory_id(factoryid)
		category = tweak_data.weapon[weaponid].category
	end

    return category
end