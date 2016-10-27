local old_init = HudIconsTweakData.init
function HudIconsTweakData:init()
    old_init(self, tweak_data)
	self.pd2_flash = {
		texture = "guis/textures/pd2/fav_video1",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
end