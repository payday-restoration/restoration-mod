--if not RestorationTweak then
restoration.textures = {}

if restoration.Options:GetValue("HUD/DifficultyMarkers") then	
tweak_data.hud_icons.risk_swat = {
		texture = "guis/textures/restoration/hud_difficultymarkers",
		texture_rect = {
			0,
			64,
			49,
			32
		}
	}
tweak_data.hud_icons.risk_fbi = {
		texture = "guis/textures/restoration/hud_difficultymarkers",
		texture_rect = {
			49,
			64,
			35,
			32
		}
	}
tweak_data.hud_icons.risk_death_squad = {
		texture = "guis/textures/restoration/hud_difficultymarkers",
		texture_rect = {
			85,
			64,
			31,
			32
		}
	}
tweak_data.hud_icons.risk_murder_squad = {
		texture = "guis/textures/restoration/hud_difficultymarkers",
		texture_rect = {
			121,
			64,
			60,
			32
		}
	}
end

tweak_data.hud_icons.interaction_trade = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			432,
			144,
			48,
			48
		}
	}

if restoration.Options:GetValue("HUD/MainHud") then
--[[tweak_data.hud_icons.equipment_cable_ties = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			384,
			96,
			48,
			48
		}
	}

	
tweak_data.hud_icons.equipment_ammo_bag = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			48,
			96,
			48,
			48
		}
	}
	
tweak_data.hud_icons.equipment_doctor_bag = {
	texture = "guis/textures/restoration/hud_icons",
	texture_rect = {
		96,
		96,
		48,
		48
	}
}

tweak_data.hud_icons.equipment_sentry = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			320,
			288,
			48,
			48
		}
	}

tweak_data.hud_icons.equipment_trip_mine = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			0,
			96,
			48,
			48
		}
	}

	
tweak_data.hud_icons.equipment_ecm_jammer = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			272,
			288,
			48,
			48
		}
	}]]

---------------- equipment icons --------------

tweak_data.hud_icons.frag_grenade = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
tweak_data.hud_icons.molotov_grenade = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			32,
			0,
			32,
			32
		}
	}
tweak_data.hud_icons.dynamite_grenade = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			64,
			0,
			32,
			32
		}
	}
tweak_data.hud_icons.four_projectile = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			96,
			0,
			32,
			32
		}
	}
tweak_data.hud_icons.ace_projectile = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			0,
			32,
			32,
			32
		}
	}
tweak_data.hud_icons.jav_projectile = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			32,
			32,
			32,
			32
		}
	}
tweak_data.hud_icons.throwing_axe = {
		texture = "guis/textures/restoration/throwables",
		texture_rect = {
			64,
			32,
			32,
			32
		}
	}

tweak_data.hud_icons.equipment_saw = {
		texture = "guis/textures/restoration/hud_pickups",
		texture_rect = {
			96,
			128,
			32,
			32
		}
	}	
	



local conversion = {
        ["guis/textures/pd2/pd2_waypoints"] = "guis/textures/restoration/pd2_waypoints",
        ["guis/textures/pd2/hud_pickups"] = "guis/textures/restoration/hud_pickups",
        ["guis/textures/pd2/equipment"] = "guis/textures/restoration/equipment",
        ["guis/textures/hud_icons"] = "guis/textures/restoration/hud_icons",
    }

for k, icon in pairs(tweak_data.hud_icons) do
        if conversion[icon.texture] then
            icon.texture = conversion[icon.texture]
        end
end

end


if not tweak_data then return end

table.insert (tweak_data.gui.crime_net.codex,

		{
			id = "contacts",
			name_id = "menu_contacts_shatter",
			{
				id = "shatter",
				name_id = "heist_contact_shatter",
				{
					desc_id = "heist_contact_shatter_description",
					videos = { }
				}
			}

		} )

tweak_data.narrative.contacts.shatter				= {}
tweak_data.narrative.contacts.shatter.name_id					= "heist_contact_shatter"
tweak_data.narrative.contacts.shatter.description_id	= "heist_contact_shatter_description"
tweak_data.narrative.contacts.shatter.image		= "guis/textures/pd2/crimenet_portrait_interupt"
tweak_data.narrative.contacts.shatter.package = "packages/contact_interupt"
tweak_data.narrative.contacts.shatter.assets_gui = Idstring( "guis/mission_briefing/preload_contact_interupt" )