Hooks:PostHook( WeaponFactoryTweakData, "init", "socomInit", function(self)
self.wpn_fps_pis_x_socom.override = {	
		wpn_fps_pis_socom_mag = {
			animations = {
				reload_not_empty = "reload_not_empty_right",
				reload = "reload_right",
				reload_left = "reload_left",
				reload_not_empty_left = "reload_not_empty_left"
			}			
		},
		wpn_fps_pis_socom_slide = {
			animations = {
				reload_left = "reload_left",
				fire = "recoil",
				fire_steelsight = "recoil",
				reload = "reload_right",
				magazine_empty = "last_recoil"
			}
		}
	}
	
end )