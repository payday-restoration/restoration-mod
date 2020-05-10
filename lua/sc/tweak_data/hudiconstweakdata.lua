local old_icons_init = HudIconsTweakData.init
function HudIconsTweakData:init()
	old_icons_init(self)
	local crime_spree_atlas_size = 128
	local csm_w = 280
	local csm_h = 140
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
	self.csm_peta = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 0,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_nmh = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 1,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_arena = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 2,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_shoutout_raid = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 3,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_bph = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 4,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_des = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 5,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_kenaz = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 6,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_sah = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 0,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_nightclub = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 1,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_mallcrasher = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 2,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_bex = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 3,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_vit = {
		texture = "guis/dlcs/sc/textures/pd2/crime_spree/mission_atlas_sc",
		texture_rect = {
			csm_w * 4,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
end