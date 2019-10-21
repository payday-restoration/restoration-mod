local init_original = GuiTweakData.init
function GuiTweakData:init()
    init_original(self)
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
end