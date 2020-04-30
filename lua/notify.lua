if restoration.Options:GetValue("HUD/MainHUD") then
    require("lib/managers/menu/MenuBackdropGUI")
end
local idealVersion = Application:version()
local GameVersion = Application:version()

--[[
--///MAIN MENU STARTUP NOTIFICATION\\\--
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
]]--

--///MOD PANEL NOTIFICATION\\\--
--This isn't used currently
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

	--UNCOMMENT BELOW TO DISPLAY NOTIFICATION'S IN MOD PANEL
	if menu == "menu_main" then
		--DisplayNotification()
	end

end)
