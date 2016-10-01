
Hooks:Add("MenuManagerBuildCustomMenus", "BuildCreateUplink", function(menu_manager, nodes)
	local mainmenu = nodes.main
	if mainmenu == nil then
		return
	end
	if mainmenu._items == nil then
		log("Aborting...")
		return
	end

	local data = {
		type = "CoreMenuItem.Item",
	}
	local params = {
		name = "create_uplink_btn",
		text_id = "restoration_inventory_title",
		help_id = "restoration_inventory_desc",
		callback = "create_uplink"
	}
	local new_item = mainmenu:create_item(data, params)

	new_item.dirty_callback = callback(mainmenu, mainmenu, "item_dirty")
	if mainmenu.callback_handler then
		new_item:set_callback_handler(mainmenu.callback_handler)
	end

	-- Determine where the item should be inserted
	local position = 3
	for index, item in pairs(mainmenu._items) do
		if item:name() == "crimenet_offline" then
			position = index
			break
		end
	end
	table.insert(mainmenu._items, position, new_item)

end)

function MenuCallbackHandler:create_uplink()
	local dialog_data = {}
	dialog_data.title = "SATELLITE UPLINK"
	dialog_data.text = "This feature isn't done yet!"
	local ok_button = {}
	ok_button.text = "GOTCHA"
	ok_button.cancel_button = true
	dialog_data.button_list = {ok_button}
	managers.system_menu:show(dialog_data)

end

