--Default function for vanilla HUD. If using a custom HUD that alters fire mode HUD components, make sure to implement this function in it
HUDTeammate.set_weapon_firemode_burst = HUDTeammate.set_weapon_firemode_burst or function(self, id, firemode, burst_fire)

	if _G.IS_VR then
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

if VoidUI and VoidUI.options.teammate_panels then
	function HUDTeammate:set_health(data)
		if self:ai() then
			data.current = (data.current / data.total) * 10
			data.total = 10
		end

		self._health_data = data
		local anim_time = self._main_player and VoidUI.options.main_anim_time or VoidUI.options.mate_anim_time
		local health_stored = self._custom_player_panel:child("health_stored")
		local health_stored_bg = self._custom_player_panel:child("health_stored_bg")
		local health_panel = self._custom_player_panel:child("health_panel")
		local health_background = health_panel:child("health_background")
		local health_bar = health_panel:child("health_bar")
		local health_value = health_panel:child("health_value")
		local show_health_value = self._main_player and VoidUI.options.main_health or VoidUI.options.mate_health
		local amount = math.clamp(data.current / data.total, 0, 1)
		if amount < math.clamp(health_bar:h() / self._bg_h, 0, 1) then self:_damage_taken() end

		if managers.player:has_activate_temporary_upgrade("temporary", "copr_ability") and self._id == HUDManager.PLAYER_PANEL then
			local static_damage_segment_size = managers.player:upgrade_value_nil("player", "copr_static_damage_ratio")

			if static_damage_segment_size then
				local static_damage_ratio = static_damage_segment_size / data.total
				amount = math.floor((amount + 0.01) / static_damage_ratio) * static_damage_ratio
			end
		end

		health_bar:stop()
		health_bar:animate(function(o)
			local s = math.clamp(health_bar:h() / self._bg_h, 0, 1)
			local c = s
			over(anim_time, function(p)
				if alive(health_bar) then
					c =	math.lerp(s, amount, p)
					health_bar:set_h(self._bg_h * c)
					health_bar:set_texture_rect(203, 0 + ((1- c) * 472),202,472 * c)
					health_bar:set_bottom(health_background:bottom())

					if show_health_value == 1 then health_value:set_text("")
					elseif show_health_value == 2 then health_value:set_text(math.clamp(self:round(c * 100), 0, 100))
					elseif show_health_value == 3 then health_value:set_text(self:round((data.total * 10) * c)) end

					health_stored_bg:set_bottom(math.clamp(health_panel:y() + health_bar:top(), health_panel:top() + health_stored_bg:h(), health_panel:bottom()))
					health_stored:set_bottom(health_stored_bg:bottom())
					health_stored_bg:set_texture_rect(811,(((health_stored_bg:y() - health_panel:y()) / self._bg_h) * 472),70,472 * (health_stored_bg:h() / self._bg_h))
					health_stored:set_texture_rect(811,(((health_stored:y() - health_panel:y()) / self._bg_h) * 472),70,472 * (health_stored:h() / self._bg_h))
					self:update_delayed_damage()
				end
			end)
		end)
	end
else
	-- All this just to make Leech's notches appear properly with the changed mechanics of segments
	-- being based on fixed HP values instead of HP percentages. :weary:
	function HUDTeammate:set_health(data)
		local prev_data = self._health_data
		self._health_data = data
		local radial_health_panel = self._radial_health_panel
		local radial_health = radial_health_panel:child("radial_health")
		local radial_rip = radial_health_panel:child("radial_rip")
		local radial_rip_bg = radial_health_panel:child("radial_rip_bg")
		local red = data.current / data.total

		if managers.player:has_activate_temporary_upgrade("temporary", "copr_ability") and self._id == HUDManager.PLAYER_PANEL then
			local static_damage_segment_size = managers.player:upgrade_value_nil("player", "copr_static_damage_ratio")

			if static_damage_segment_size then
				local static_damage_ratio = static_damage_segment_size / data.total
				red = math.floor((red + 0.01) / static_damage_ratio) * static_damage_ratio
			end

			local copr_overlay_panel = radial_health_panel:child("copr_overlay_panel")

			if alive(copr_overlay_panel) then
				for _, notch in ipairs(copr_overlay_panel:children()) do
					notch:set_visible(notch:script().red <= red + 0.01)
				end
			end
		end

		radial_health:stop()

		if data.current < prev_data.current then
			self:_damage_taken()
			radial_health:set_color(Color(1, red, 1, 1))

			if alive(radial_rip) then
				radial_rip:set_rotation((1 - radial_health:color().r) * 360)
				radial_rip_bg:set_rotation((1 - radial_health:color().r) * 360)
			end

			self:update_delayed_damage()
		else
			radial_health:animate(function (o)
				local s = radial_health:color().r
				local e = red
				local health_ratio = nil

				over(0.2, function (p)
					health_ratio = math.lerp(s, e, p)

					radial_health:set_color(Color(1, health_ratio, 1, 1))

					if alive(radial_rip) then
						radial_rip:set_rotation((1 - radial_health:color().r) * 360)
						radial_rip_bg:set_rotation((1 - radial_health:color().r) * 360)
					end

					self:update_delayed_damage()

					local copr_overlay_panel = radial_health_panel:child("copr_overlay_panel")

					if alive(copr_overlay_panel) then
						for _, notch in ipairs(copr_overlay_panel:children()) do
							notch:set_visible(notch:script().red <= health_ratio + 0.01)
						end
					end
				end)
			end)
		end
	end
end