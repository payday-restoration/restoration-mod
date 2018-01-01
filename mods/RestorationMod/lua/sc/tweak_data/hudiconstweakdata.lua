local old_icons_init = HudIconsTweakData.init
function HudIconsTweakData:init()
	old_icons_init(self)
	local crime_spree_atlas_size = 128
	self.crime_spree_titandozer = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/modifiers_atlas_sc",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}	
	self.crime_spree_ump_me_up = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/modifiers_atlas_sc",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}	
	self.crime_spree_call_me_and_tell_me_i_am_not_alone = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/modifiers_atlas_sc",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}	
	self.crime_spree_dun_dun_dun_dunna = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/modifiers_atlas_sc",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_youre_that_ninja = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/modifiers_atlas_sc",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_shotgun = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/modifiers_atlas_sc",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}	
end