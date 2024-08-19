local init_original = GuiTweakData.init
function GuiTweakData:init()
	init_original(self)
	--[[
	self.new_heists = {
		limit = 4,
		{
			name_id = "menu_changelog",
			texture_path = "guis/textures/restoration/discord",
			url = "https://steamcommunity.com/groups/restorationmod/announcements"
		},
		{
			name_id = "menu_discord",
			texture_path = "guis/textures/restoration/discord",
			url = "https://discord.gg/YmQkDyY"
		},
		{
			name_id = "menu_guide",
			texture_path = "guis/textures/restoration/discord",
			url = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667"
		},
		{
			name_id = "menu_captains",
			texture_path = "guis/textures/restoration/discord",
			url = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667#2485697"
		}
	}
	--]]
	--[[
	local changelog = {
		webpage = "https://steamcommunity.com/groups/restorationmod/announcements",
		name_id = "menu_changelog",
		id = "changelog",
		date_id = "menu_changelog",
		image = "guis/textures/restoration/discord_new",
		desc_id = "menu_changelog_desc"
	}
	local discord = {
		webpage = "https://discord.gg/YmQkDyY",
		name_id = "menu_discord",
		id = "discord",
		date_id = "menu_discord",
		image = "guis/textures/restoration/discord_new",
		desc_id = "menu_discord_desc"
	}
	local guide = {
		webpage = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667",
		name_id = "menu_ingame_manual",
		id = "guide",
		date_id = "menu_ingame_manual",
		image = "guis/textures/restoration/discord_new",
		desc_id = "menu_ingame_manual_help"
	}
	local captains = {
		webpage = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667#2485697",
		name_id = "menu_captains",
		id = "captains",
		date_id = "menu_captains",
		image = "guis/textures/restoration/discord_new",
		desc_id = "menu_captains_desc"
	}
	self.content_updates = {
		title_id = "menu_content_updates",
		num_items = 6,
		choice_id = "menu_content_updates_previous"
	}
	
	self.content_updates.item_list = {
		captains,
		guide,
		discord,
		changelog
	}
	--]]

	local dmc_dot_folder = "_dmc/wpn_effects_textures/"
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_lua",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_007_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_ncstar",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_006_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_eotech",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_001_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_eotech_moa",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_002_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_eotech_seggs",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_003_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_ebr_cqb",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_004_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_trijicon_chevron",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_005_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_dot_4x4",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_008_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_dot_2x2",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_009_il"
	})
	table.insert(self.weapon_texture_switches.types.sight_swap, {
		name_id = "menu_reticle_dmc_cross_holotherm",
		texture_path = dmc_dot_folder .. "wpn_sight_reticle_010_il"
	})
	self.weapon_texture_switches.types.gadget = self.weapon_texture_switches.types.sight_swap
	self.part_texture_switches = {
		wpn_fps_upg_o_45rds_v2 = "1 3",
		wpn_fps_upg_o_45rds = "1 3",
		wpn_fps_upg_o_rmr = "3 3",
		wpn_fps_upg_o_rx01 = "4 3",
		wpn_fps_upg_o_rx30 = "4 3",
		wpn_fps_upg_o_45rds = "1 3",
		wpn_fps_upg_o_spot = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 8),
		wpn_fps_upg_o_acog = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 3),
		wpn_fps_upg_o_bmg = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 3),
		wpn_fps_upg_o_eotech = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 6),
		wpn_fps_upg_o_eotech_xps = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 7),
		wpn_fps_upg_o_uh = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 4),
		wpn_fps_upg_o_hamr = "1 8",
		wpn_fps_upg_o_atibal = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 3),
		--Mod Sights
		wpn_fps_shot_tti_dracarys_eotech = "1 " .. tostring(#self.weapon_texture_switches.types.sight_swap - 7),
		wpn_fps_upg_o_mw2022_holotherm01 = "4 " .. tostring(#self.weapon_texture_switches.types.sight_swap)
	}
end