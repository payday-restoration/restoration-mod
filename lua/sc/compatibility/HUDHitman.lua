if VoidUI and VoidUI.options and VoidUI.options.teammate_panels then --VOID UI Hud Compatability
	function HUDTeammate:update_delayed_damage()
		local damage = self._delayed_damage or 0
		local health_panel = self._custom_player_panel:child("health_panel")
		local health_bar = health_panel:child("health_bar")
		local delayed_damage_armor = health_panel:child("delayed_damage_armor_bar")
		local delayed_damage_health = health_panel:child("delayed_damage_health_bar")
		local health_max = self._health_data.total
		local health_current = self._health_data.current
		local health_ratio = health_bar:h() / self._bg_h
		local health_damage = damage < health_current and damage or health_current
		local health_damage_ratio = health_damage / health_max

		delayed_damage_armor:set_visible(false)
		delayed_damage_health:set_visible(health_damage_ratio > 0)
		delayed_damage_health:set_h(self._bg_h * health_damage_ratio)
		delayed_damage_health:set_top(health_bar:top())
		delayed_damage_health:set_texture_rect(881,((1- health_ratio) * 472),202,472 * health_damage_ratio)
	end
else
	function HUDTeammate:update_delayed_damage()
		local damage = self._delayed_damage or 0
		local health_panel = self._radial_health_panel
		local health_radial = health_panel:child("radial_health")
		local delayed_damage_panel = health_panel:child("radial_delayed_damage")
		local delayed_damage_armor = delayed_damage_panel:child("radial_delayed_damage_armor")
		local delayed_damage_health = delayed_damage_panel:child("radial_delayed_damage_health")
		local health_max = self._health_data.total
		local health_current = self._health_data.current
		local health_ratio = health_radial:color().r
		local health_damage = health_current > damage and damage or health_current
		local health_damage_ratio = health_damage / health_max

		delayed_damage_armor:set_visible(false)
		delayed_damage_health:set_visible(health_damage_ratio > 0)
		delayed_damage_health:set_color(Color(1, health_damage_ratio, 1 - health_ratio, 0))
	end
end