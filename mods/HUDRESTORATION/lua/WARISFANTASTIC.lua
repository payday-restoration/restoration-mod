
Hooks:Add("LocalizationManagerPostInit", "Restoration_Localization", function(loc)
	LocalizationManager:add_localized_strings({
		["heist_contact_shatter"] = "SHATTER",
		["heist_contact_remake"] = "MARTINI",
		["menu_contacts_shatter"] = "///VERITAS_ROOT_MST:.",
		["hud_assault_assault"] = "POLICE ASSAULT",
		["menu_crewpage"] = "CREW PAGE",
		["pln_esc_street_full_force_01"] = "Those snipers couldn't stop you, so the cops are preparing to move in with force.  Get ready!"



	})
end)
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
					videos = {"shatter1"},
				}
			}

		} )

tweak_data.narrative.contacts.shatter = {}
tweak_data.narrative.contacts.shatter.name_id = "heist_contact_shatter"
tweak_data.narrative.contacts.shatter.description_id = "heist_contact_shatter_description"
tweak_data.narrative.contacts.shatter.image	= "guis/textures/pd2/crimenet_portrait_interupt"
tweak_data.narrative.contacts.shatter.package = "packages/contact_interupt"
tweak_data.narrative.contacts.shatter.assets_gui = Idstring( "guis/mission_briefing/preload_contact_interupt" )

tweak_data.narrative.contacts.remake = {}
tweak_data.narrative.contacts.remake.name_id = "heist_contact_remake"
tweak_data.narrative.contacts.remake.description_id = "heist_contact_remake_description"
tweak_data.narrative.contacts.remake.image	= "guis/textures/pd2/crimenet_portrait_interupt"
tweak_data.narrative.contacts.remake.package = "packages/contact_interupt"
tweak_data.narrative.contacts.remake.assets_gui = Idstring( "guis/mission_briefing/preload_contact_interupt" )

tweak_data.menu.pd2_massive_font = "fonts/font_eroded"

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

--[[	
tweak_data.narrative.jobs.greenharvest = {}
tweak_data.narrative.jobs.greenharvest.name_id = "heist_greenharvest"
tweak_data.narrative.jobs.greenharvest.professional = true
tweak_data.narrative.jobs.greenharvest.briefing_id = "restoration_brief_data_gharv"
tweak_data.narrative.jobs.greenharvest.region = "street"
tweak_data.narrative.jobs.greenharvest.contact = "shatter"
tweak_data.narrative.jobs.greenharvest.package = "packages/job_branchbank_cash"
tweak_data.narrative.jobs.greenharvest.jc = 50
tweak_data.narrative.jobs.greenharvest.chain = {
{
			level_id = "greenharvest_stage1",
			type_id = "heist_type_assault",
			type = "d",
			mission = "standalone",
			mission_filter = {2},
		}

}
tweak_data.narrative.jobs.greenharvest.briefing_event = "Play_plt_watchdogs_stage1_03"
tweak_data.narrative.jobs.greenharvest.debrief_event = "nothing"
tweak_data.narrative.jobs.greenharvest.crimenet_callouts = {
	"Play_plt_watchdogs_stage1_05"
}
tweak_data.narrative.jobs.greenharvest.crimenet_videos = {
		"cn_ghrv"
		}
tweak_data.narrative.jobs.greenharvest.payout = {
	22000,
	25000,
	44000,
	66000,
	99000
}
tweak_data.narrative.jobs.greenharvest.contract_cost = {
	39000,
	78000,
	195000,
	390000,
	500000
}
tweak_data.narrative.jobs.greenharvest.experience_mul = {
		1.2,
		1.2,
		1.2,
		2.2,
		3.2
	}

	tweak_data.narrative.jobs.greenharvest.contract_visuals = {}
	tweak_data.narrative.jobs.greenharvest.contract_visuals.min_mission_xp = {
		30000,
		30000,
		30000,
		30000,
		30000
	}
	tweak_data.narrative.jobs.greenharvest.contract_visuals.max_mission_xp = {
		44000,
		44000,
		44000,
		44000,
		44000
	}



table.insert(tweak_data.narrative._jobs_index, "greenharvest")
table.insert(tweak_data.levels._level_index, "greenharvest_stage1")


------------------ESCAPES vvvvvvvv


table.insert(tweak_data.levels._level_index, "escape_overpass_ghrv")
table.insert(tweak_data.levels.escape_levels, "escape_overpass_ghrv")
table.insert(tweak_data.levels._level_index, "escape_garage_ghrv")
table.insert(tweak_data.levels.escape_levels, "escape_garage_ghrv")
------------------ESCAPES ^^^^^^^^]]--
