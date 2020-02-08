--if not RestorationTweak then
restoration.textures = {}

-- Color Grading Changer Standalone V3 Support
if gradient_filter then
	table.insert(gradient_filter.colour_gradings, 
		"color_plus"
	)
	table.insert(gradient_filter.colour_gradings, 
		"color_force"
	)
	table.insert(gradient_filter.colour_gradings, 
		"color_e3nice"
	)
	table.insert(gradient_filter.colour_gradings, 
		"color_rvd1"
	)
	table.insert(gradient_filter.heist_colour_gradings, 
		"color_plus"
	)
	table.insert(gradient_filter.heist_colour_gradings, 
		"color_force"
	)
	table.insert(gradient_filter.heist_colour_gradings, 
		"color_e3nice"
	)
	table.insert(gradient_filter.heist_colour_gradings, 
		"color_rvd1"
	)
end

--E3 PAYDAY+
table.insert(tweak_data.color_grading, 
	{
		value = "color_plus",
		text_id = "menu_color_plus"		
	}
)
--E3 BHD
table.insert(tweak_data.color_grading,
	{
		value = "color_force",
		text_id = "menu_color_force"		
	}
)
--E3 Nice
table.insert(tweak_data.color_grading,
	{
		value = "color_e3nice",
		text_id = "menu_color_e3nice"		
	}
)

--OVERKILL had this for RVD1 for some reason, but it's just inverted default grading?
table.insert(tweak_data.color_grading,
	{
		value = "color_rvd1",
		text_id = "menu_color_rvd1"		
	}
)

if restoration.Options:GetValue("HUD/UI/DifficultyMarkers") then	
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

if restoration:all_enabled("HUD/MainHUD", "HUD/AssaultPanel") then

tweak_data.hud_icons.interaction_trade = {
		texture = "guis/textures/restoration/hud_icons",
		texture_rect = {
			432,
			144,
			48,
			48
		}
	}
end

if restoration:all_enabled("HUD/MainHUD", "HUD/Teammate") then
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
	

local d_color = Color( 0.5, 0.5, 0.5, 0.5 ) -- Color( 0.75, 1, 0.4, 0.0 )

local conversion = {
        ["guis/textures/pd2/hud_pickups"] = "guis/textures/restoration/hud_pickups",
        ["guis/textures/pd2/equipment"] = "guis/textures/restoration/equipment",
        ["guis/textures/hud_icons"] = "guis/textures/restoration/hud_icons",
    }

	local conversion2 = {
        ["guis/textures/pd2/pd2_waypoints"] = "guis/textures/restoration/pd2_waypoints",
    }
for k, icon in pairs(tweak_data.hud_icons) do
        if conversion[icon.texture] then
            icon.texture = conversion[icon.texture]
        end
		 if conversion2[icon.texture] and restoration.Options:GetValue("HUD/Waypoints") then
            icon.texture = conversion2[icon.texture]
        end
end

end


if not tweak_data then return end
if restoration.Options:GetValue("HUD/UI/PeerColors") then
--Alpha Peer Colors
	local orange = Vector3( 224, 109, 81 )/255 
	local green = Vector3( 102, 204, 51 )/255 
	local brown = Vector3( 98, 70, 43 )/255 
	local blue = Vector3( 104, 133, 161 )/255 
	local team_ai = Vector3( 0.2, 0.8, 1 ) --this has multiple different values in the code, but they're all a variety of green or yellow.  add those as a multichoice later on, but not important since they clash.

	tweak_data.peer_vector_colors = { blue, orange, green, brown, team_ai }
    tweak_data.peer_colors = { "mrblue", "mrorange", "mrgreen", "mrbrown", "mrai" } 
	
	tweak_data.chat_colors = {     
			Color( tweak_data.peer_vector_colors[1]:unpack() ),
			Color( tweak_data.peer_vector_colors[2]:unpack() ),
			Color( tweak_data.peer_vector_colors[3]:unpack() ),
			Color( tweak_data.peer_vector_colors[4]:unpack() ),
			Color( tweak_data.peer_vector_colors[5]:unpack() )
    }
	tweak_data.preplanning_peer_colors = {     
			Color( tweak_data.peer_vector_colors[1]:unpack() ),
			Color( tweak_data.peer_vector_colors[2]:unpack() ),
			Color( tweak_data.peer_vector_colors[3]:unpack() ),
			Color( tweak_data.peer_vector_colors[4]:unpack() )
    }
end
--Jackal codex entry
table.insert (tweak_data.gui.crime_net.codex,

		{
			id = "contacts",
			name_id = "menu_contacts_shatter",
			{
				id = "shatter",
				name_id = "heist_contact_shatter",
				{
					desc_id = "heist_contact_shatter_description",
					videos = {"shatter1"}
				},
				id = "shatter",
				name_id = "heist_contact_shatter",
				{
					desc_id = "heist_contact_raze_description",
					videos = {"shatter1"}
				},
				id = "shatter",
				name_id = "heist_contact_shatter",
				{
					desc_id = "heist_contact_jackal_description",
					videos = {"shatter1"}
				}
			},
			{
				id = "sina",
				name_id = "heist_contact_sin",
				{
					desc_id = "heist_contact_sin_description",
					videos = {"shatter1"}
				}
			}

		} )

--Jackal narrative entry
tweak_data.narrative.contacts.shatter				= {}
tweak_data.narrative.contacts.shatter.name_id					= "heist_contact_shatter"
tweak_data.narrative.contacts.shatter.description_id	= "heist_contact_shatter_description"
tweak_data.narrative.contacts.shatter.image		= "guis/textures/pd2/crimenet_portrait_interupt"
tweak_data.narrative.contacts.shatter.package = "packages/contact_interupt"
tweak_data.narrative.contacts.shatter.assets_gui = Idstring( "guis/mission_briefing/preload_contact_interupt" )

--Sin narrative entry
tweak_data.narrative.contacts.sina				= {}
tweak_data.narrative.contacts.sina.name_id					= "heist_contact_sin"
tweak_data.narrative.contacts.sina.description_id	= "heist_contact_shatter_description"
tweak_data.narrative.contacts.sina.image		= "guis/textures/pd2/crimenet_portrait_hector"
tweak_data.narrative.contacts.sina.package = "packages/contact_hector"
tweak_data.narrative.contacts.sina.assets_gui = Idstring( "guis/mission_briefing/preload_contact_hector" )
--District descriptions
if restoration.Options:GetValue("HUD/UI/District") then
	tweak_data.gui.crime_net.regions = {
		{closed=true, text={title_id="cn_menu_georgetown_title", sub_id="cn_menu_georgetown_sub", x=348, y=310}, {-10, 270, 293, 252, 271, 337, 341, 372, 372, 475, 475, 491, 491, 504, 503, 524, 536, 536, 542, 542, 555, 555, 598, 598, 638, 638, 657, 688, 686, 691, 701, 698, 687, 650, 634, 602, 609, 580, 576, 576, 567, 559, 558, 542, 543, 512, 512, 503, 381, 377, 348, 315, 315, 290, 290, 259, 259, 237, 237, 261, 261, 257, 224, 221, 187, 182, 163, 163, 147, 147, 133, 133, 102, 102, -10},{-10, -10, 28, 73, 122, 123, 132, 141, 145, 172, 216, 215, 180, 179, 229, 228, 244, 253, 253, 248, 247, 241, 241, 219, 219, 209, 208, 234, 241, 242, 262, 270, 277, 276, 279, 296, 300, 362, 361, 408, 416, 417, 430, 430, 477, 477, 514, 523, 523, 514, 514, 501, 493, 484, 469, 469, 465, 465, 439, 440, 434, 430, 429, 433, 433, 438, 438, 423, 423, 435, 435, 423, 423, 412, 412}},

		{closed=true, {340, 350, 350, 373, 373, 368, 368, 358, 358, 351, 351, 340}, {103, 103, 106, 106, 116, 116, 123, 123, 116, 116, 122, 121}},
		{closed=true, {564, 576, 576, 564}, {189, 189, 208, 208}},
		{closed=true, {147, 168, 164, 144}, {444, 451, 463, 457}},
		{closed=true, {168, 185, 181, 166}, {463, 468, 478, 473}},
		{closed=true, {371, 417, 417, 414, 371}, {534, 534, 554, 557, 538}},
		{closed=true, {422, 509, 509, 500, 500, 477, 477, 466, 457, 457, 447, 422}, {534, 534, 548, 559, 585, 585, 575, 581, 581, 573, 573, 557}},

		{closed=true, text={title_id="cn_menu_westend_title", sub_id="cn_menu_westend_sub", x=789, y=418}, {519, 530, 517, 528, 522, 540, 538, 544, 549, 561, 565, 571, 566, 574, 579, 609, 613, 630, 628, 644, 641, 662, 665, 703, 696, 721, 721, 756, 756, 767, 767, 736, 709, 701, 651, 651, 640, 623, 634, 608, 591, 581, 599, 599, 551, 541, 598, 598, 640, 735, 735, 751, 760, 766, 771, 831, 831, 882, 882, 922, 922, 976, 976, 1031, 1036, 1019, 1020, 994, 1063, 1063, 1068, 1098, 1104, 1113, 1123, 1132, 1175, 1175, 1184, 1184, 1171, 1171, 1161, 1161, 1169, 1169, 1185, 1185, 1168, 1168, 1175, 1175, 1193, 1193, 1175, 1175, 1170, 1170, 1190, 1190, 1171, 1171}, {-10, 13, 23, 34, 42, 57, 61, 68, 63, 75, 69, 74, 79, 87, 82, 113, 110, 128, 131, 144, 148, 169, 165, 199, 207, 226, 239, 258, 276, 284, 305, 341, 340, 331, 331, 343, 338, 364, 369, 428, 428, 452, 460, 514, 514, 540, 540, 586, 636, 636, 552, 549, 545, 539, 529, 529, 533, 533, 530, 530, 537, 537, 530, 530, 521, 483, 480, 416, 382, 345, 340, 353, 348, 346, 346, 350, 328, 297, 297, 269, 269, 247, 247, 222, 222, 182, 182, 170, 170, 116, 116, 111, 111, 85, 85, 68, 68, 60, 60, 31, 31, -10}},

		{closed=false, text={title_id="cn_menu_foggy_bottom_title", sub_id="cn_menu_foggy_bottom_sub", x=858, y=704}, {1031, 1052, 1039, 1039, 1045, 1045, 1039, 1039, 1000, 990, 972, 972, 927, 908, 901, 882, 882, 722, 693, 693, 686, 685, 676, 676, 688, 693, 730, 730, 679, 670, 664, 664, 667, 667, 673, 669, 674, 652, 652}, {530, 574, 575, 616, 616, 667, 667, 893, 893, 883, 883, 855, 855, 842, 853, 853, 906, 906, 874, 816, 816, 804, 804, 785, 785, 774, 774, 759, 759, 754, 745, 734, 726, 691, 686, 683, 677, 657, 636}},
		{closed=true, {512, 529, 516, 519, 513, 495, 498, 501, 504, 500}, {597, 616, 627, 630, 634, 609, 607, 611, 609, 604}},
		{closed=true, {559, 569, 571, 639, 631, 647, 616, 616, 610, 610, 601, 598, 589, 580, 569, 561, 557, 557, 584, 584, 580, 591, 589, 580, 570, 564, 568, 563, 558, 561, 552, 546, 550, 549}, {601, 611, 609, 666, 679, 692, 732, 792, 792, 814, 814, 822, 831, 833, 831, 825, 815, 721, 721, 710, 706, 697, 688, 686, 693, 683, 676, 658, 650, 646, 619, 614, 610, 608}},

		{closed=false, text={title_id="cn_menu_shaw_title", sub_id="cn_menu_shaw_sub", x=1426, y=310}, {2047, 1972, 1879, 1879, 1735, 1677, 1677, 1683, 1625, 1619, 1624, 1620, 1641, 1641, 1572, 1571, 1558, 1558, 1547, 1547, 1523, 1523, 1462, 1462, 1450, 1450, 1422, 1402, 1402, 1356, 1356, 1316, 1316, 1308, 1308, 1279, 1279, 1245, 1245, 1200, 1200, 1039}, {278, 311, 311, 352, 416, 416, 429, 440, 468, 461, 458, 451, 442, 420, 420, 470, 470, 467, 467, 469, 469, 518, 518, 532, 532, 547, 560, 560, 570, 569, 591, 610, 604, 604, 614, 628, 614, 614, 644, 665, 608, 608}},
		{closed=false, text={title_id="cn_menu_downtown_title", sub_id="cn_menu_downtown_sub", x=1469, y=720}, {1200, 1206, 1206, 1201, 1201, 1251, 1251, 1201, 1201, 1205, 1254, 1254, 1285, 1285, 1308, 1308, 1372, 1372, 1388, 1388, 1411, 1411, 1462, 1462, 1523, 1523, 1538, 1538, 1528, 1527, 1709, 1709, 1760, 1880, 1880, 2047}, {665, 669, 688, 688, 741, 760, 787, 787, 898, 902, 902, 896, 896, 902, 902, 896, 896, 903, 903, 896, 896, 898, 898, 889, 889, 901, 901, 920, 920, 953, 953, 902, 902, 798, 609, 609}},

	}
end
