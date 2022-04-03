--Default function for vanilla HUD. If using a custom HUD that alters fire mode HUD components, make sure to implement this function in it
HUDTeammate.set_weapon_firemode_burst = HUDTeammate.set_weapon_firemode_burst or function(self, id, firemode, burst_fire)

	If _G.IS_VR then

	local is_secondary = id == 1
	local secondary_weapon_panel = self._ammo_panel:child("secondary_weapon_panel")
	local primary_weapon_panel = self._ammo_panel:child("primary_weapon_panel")
	local weapon_selection = is_secondary and secondary_weapon_panel:child("weapon_selection") or primary_weapon_panel:child("weapon_selection")

	if alive(weapon_selection) then
		local firemode_single = weapon_selection:child("firemode_single")
		local firemode_auto = weapon_selection:child("firemode_auto")

		if alive(firemode_single) and alive(firemode_auto) then
			self:set_weapon_firemode_active(firemode_single, firemode == "single")
			self:set_weapon_firemode_active(firemode_auto, firemode ~= "single")
		end
	end


HUDTeammateVR.default_recreate_weapon_firemode = HUDTeammate.recreate_weapon_firemode

	else

		local is_secondary = id == 1
		local secondary_weapon_panel = self._player_panel:child("weapons_panel"):child("secondary_weapon_panel")
		local primary_weapon_panel = self._player_panel:child("weapons_panel"):child("primary_weapon_panel")
		local weapon_selection = is_secondary and secondary_weapon_panel:child("weapon_selection") or primary_weapon_panel:child("weapon_selection")
		if alive(weapon_selection) then
			local firemode_single = weapon_selection:child("firemode_single")
			local firemode_auto = weapon_selection:child("firemode_auto")
			if alive(firemode_single) and alive(firemode_auto) then
				firemode_single:show()
				firemode_auto:show()
			end
		end
	end
end

function HUDTeammateVR:recreate_weapon_firemode()
	self:setup_firemode(0, self._ammo_panel:child("primary_weapon_panel"):child("weapon_selection"))
	self:setup_firemode(1, self._ammo_panel:child("secondary_weapon_panel"):child("weapon_selection"))
end
