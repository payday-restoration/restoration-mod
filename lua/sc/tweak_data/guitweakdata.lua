local init_original = GuiTweakData.init
function GuiTweakData:init()
    init_original(self)
    -- self.new_heists = {
    --     limit = 4,
    --     {
    --         name_id = "menu_changelog",
    --         texture_path = "guis/textures/restoration/discord",
    --         url = "https://steamcommunity.com/groups/restorationmod/announcements"
    --     },
    --     {
    --         name_id = "menu_discord",
    --         texture_path = "guis/textures/restoration/discord",
    --         url = "https://discord.gg/YmQkDyY"
    --     },
    --     {
    --         name_id = "menu_guide",
    --         texture_path = "guis/textures/restoration/discord",
    --         url = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667"
    --     },
    --     {
    --         name_id = "menu_captains",
    --         texture_path = "guis/textures/restoration/discord",
    --         url = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667#2485697"
    --     }
    -- }
    
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
end