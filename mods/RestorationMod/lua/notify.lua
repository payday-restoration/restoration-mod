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
            "Hello!\n \nRestoration Mod has been updated with a brand new feature -- SC's Mod is now a permanent part of our mod! SC's Mod is a total game re-balance, increasing difficulty across the board without resorting to artificial difficulty like just boosting damage or HP.\n \nIn order to prevent users from being unexpected to these changes and start playing without prior knowledge, SC's Mod starts disabled by default. Additionally, we have created this dialogue menu to tell all new and returning users of the feature.\n \nGo to Restoration Mod's options menu, and go to SC Mod Options, to turn on or off the complete game re-balance. You will also have to go to this menu to turn off this notification box.\n \nHappy heisting!\n \n- Martini, DoktorAkcel, SC, and the Restoration Mod team.",
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

	--Uncomment the stuff below if you want the BLT notif to be there.
	if menu == "menu_main" then
		--DisplayNotification()
	end

end)
