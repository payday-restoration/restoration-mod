local idealVersion = Application:version()
local GameVersion = Application:version()

if restoration.Options:GetValue("OTHER/Notify") then
local _setup_item_rows_original = MenuNodeGui._setup_item_rows
function MenuNodeGui:_setup_item_rows(node, ...)
    _setup_item_rows_original(self, node, ...)
    if not Global._friendsonly_warning_shown then
        Global._friendsonly_warning_shown = true
        QuickMenu:new(
            "NEW FEATURE ALERT!",
            "Restoration Mod's Overhaul now has its own savefile!\n\nThis means that when you turn the overhaul on or off, the game will force-restart to allow the changes to take effect. Your normal, vanilla savefile will be totally unaffected in the Overhaul as of now.\n\nContact us on our Discord channel for troubleshooting and questions. Thanks!\n\n-Restoration Mod Team",
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

--Probably gonna repurpose this set of functions to talk about major updates to the mod. We'll see though, feel free to mess with stuff here.
local res_sc_text = "RESTORATION MOD NOTICE:."
local res_sc_text_desc = "Nothing here at the moment. Carry on!"

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

	--Uncomment the stuff below if you want the BLT notif to be there.
	if menu == "menu_main" then
		--DisplayNotification()
	end

end)
