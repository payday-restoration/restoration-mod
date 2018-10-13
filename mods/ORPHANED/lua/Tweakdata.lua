if not RestorationTweak then
DallasTweaking = {}

--[[	
tweak_data.hud_icons.equipment_doctor_bag = {
	texture = "guis/textures/hud_icons",
	texture_rect = {
		96,
		96,
		48,
		48
	}
}



tweak_data.hud_icons.equipment_bank_manager_key = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			288,
			144,
			48,
			48
		}
	}
]]

if Restoration.options.restoration_difficultymarker then	
tweak_data.hud_icons.risk_swat = {
		texture = "guis/textures/pd2/hud_difficultymarkers",
		texture_rect = {
			0,
			64,
			49,
			32
		}
	}
tweak_data.hud_icons.risk_fbi = {
		texture = "guis/textures/pd2/hud_difficultymarkers",
		texture_rect = {
			49,
			64,
			35,
			32
		}
	}
tweak_data.hud_icons.risk_death_squad = {
		texture = "guis/textures/pd2/hud_difficultymarkers",
		texture_rect = {
			85,
			64,
			31,
			32
		}
	}
tweak_data.hud_icons.risk_murder_squad = {
		texture = "guis/textures/pd2/hud_difficultymarkers",
		texture_rect = {
			121,
			64,
			60,
			32
		}
	}
end

RestorationTweak = true
end
