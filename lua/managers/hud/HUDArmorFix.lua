if not restoration.Options:GetValue("HUD/Extra/ArmorFix") and not restoration:all_enabled("HUD/MainHUD", "HUD/Teammate") then return end

RestorationCoreHooks:Post(HUDTeammate, "init", function(self)
  local radial_health_panel = self._player_panel:child("radial_health_panel")
  local radial_health = radial_health_panel:child("damage_indicator")
  local damage_indicator = radial_health_panel:child("damage_indicator")
  radial_health:configure({
    texture = "guis/textures/restoration/hud_radialbg_base_fix",
    texture_rect = {
      128,
      0,
      -128,
      128
    }
  })
  damage_indicator:configure({
    texture = "guis/textures/restoration/hud_radial_rim_base_fix",
    texture_rect = {
			128,
			0,
			-128,
			128
		}
  })
end)