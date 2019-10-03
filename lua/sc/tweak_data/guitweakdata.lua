local init_original = GuiTweakData.init
function GuiTweakData:init()
    init_original(self)
    self.new_heists = {
        limit = 3,
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
            name_id = "menu_placeholder",
            texture_path = "guis/textures/restoration/discord",
            url = "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667#sectionid"
        }
    }
end