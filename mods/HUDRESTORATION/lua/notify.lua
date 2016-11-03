local idealVersion = Application:version()
local GameVersion = Application:version()

if restoration.Options:GetValue("SC/Notify") then
local _setup_item_rows_original = MenuNodeGui._setup_item_rows
function MenuNodeGui:_setup_item_rows(node, ...)
    _setup_item_rows_original(self, node, ...)
    if not Global._friendsonly_warning_shown then
        Global._friendsonly_warning_shown = true
        QuickMenu:new(
            "NEW FEATURE ALERT!",
            "Hello!\n \nRestoration Mod has been updated with a brand new feature -- SC's Mod is now a permanent part of our mod!\n \nIn order to prevent users from having their skillpoints reset on startup, SC's Mod starts disabled by default. Additionally, we have created this dialogue menu to tell all new and returning users of the feature.\n \nGo to Restoration Mod's options menu, and go to SC Mod Options, to turn on or off the complete game re-balance. You will also have to go to this menu to turn off this notification box.\n \nHappy heisting!\n \n- Martini, DoktorAkcel, SC, and the Restoration Mod team.",
            {
                {
                    text = "GOTCHA",
                    is_cancel_button = true
                }
            },
            true
        )
    end
end
end

local res_sc_text = "RESTORATION MOD NOTICE:."
local res_sc_text_desc = "SC's Mod is officially integrated into Restoration Mod!"

local function DisplayNotification()
	
	if GameVersion == idealVersion then
		if not NotificationsManager:NotificationExists( "restoration_sc" ) then
			local id = "restoration_sc"
			local title = res_sc_text
			local message = res_sc_text_desc
			local priority = 100

			NotificationsManager:AddNotification( id, title, message, priority )	
		end
	end

end

Hooks:Add("MenuManagerOnOpenMenu", "MenuManagerOnOpenMenu_CanaryWarning", function( menu_manager, menu, position )

	if menu == "menu_main" then
		DisplayNotification()
	end

end)
