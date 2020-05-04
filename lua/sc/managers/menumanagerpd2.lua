function MenuCallbackHandler:on_visit_res_guide()
	if SystemInfo:distribution() == Idstring("STEAM") and Idstring("english"):key() == SystemInfo:language():key() then
		if MenuCallbackHandler:is_overlay_enabled() then
			Steam:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667")
		else
			managers.menu:show_enable_steam_overlay()
		end
	elseif SystemInfo:distribution() == Idstring("STEAM") and Idstring("russian"):key() == SystemInfo:language():key() then
		if MenuCallbackHandler:is_overlay_enabled() then
			Steam:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=1923528592")
		else
			managers.menu:show_enable_steam_overlay()
		end
	end
end

function MenuCallbackHandler:open_crew_management()
	managers.menu:open_node("crew_management")
end

function MenuCallbackHandler:open_side_jobs()
	managers.menu:open_node("side_jobs")
end

function MenuCallbackHandler:SCEnabled()
	return true
end

function MenuManager:keep_overhaul_on()
	local option = true
	--restoration.Options:SetValue("SC/SC", option)
	managers.menu:post_event("menu_enter")
end

function MenuManager:keep_overhaul_off()
	local option = false
	--restoration.Options:SetValue("SC/SC", option)
end

function MenuManager:close_game()
	managers.menu:post_event("menu_enter")
	Application:close()
end

function MenuManager:show_overhaul_dialog(func)
	local count = 60
	local dialog_data = {
		title = managers.localization:text("Warning_overhaul_title"),
		text = managers.localization:text("dialog_show_overhaul_dialog", {
			TIME = count
		}),
		id = "accept_changes"
	}
	-- local cancel_button = {
	-- 	text = managers.localization:text("dialog_cancel"),
	-- 	callback_func = callback(self, self, "keep_overhaul_on"),
	-- 	cancel_button = true
	-- }
	local ok_button = {
		text = managers.localization:text("dialog_ok"),
		callback_func = callback(self, self, "close_game")
	}
	dialog_data.button_list = {
		ok_button
	}
	dialog_data.counter = {
		1,
		function ()
			count = count - 1

			if count < 0 then
				self:close_game()
				managers.system_menu:close(dialog_data.id)
			else
				local dlg = managers.system_menu:get_dialog(dialog_data.id)

				if dlg then
					dlg:set_text(managers.localization:text("dialog_show_overhaul_dialog", {
						TIME = count
					}), true)
				end
			end
		end
	}

	managers.system_menu:show(dialog_data)
end

function MenuManager:enable_overhaul_dialog(func)
	local count = 60
	local dialog_data = {
		title = managers.localization:text("Warning_overhaul_title"),
		text = managers.localization:text("dialog_enable_overhaul_dialog", {
			TIME = count
		}),
		id = "accept_changes"
	}
	local ok_button = {
		text = managers.localization:text("dialog_ok"),
		callback_func = callback(self, self, "close_game")
	}
	dialog_data.button_list = {
		ok_button
	}
	dialog_data.counter = {
		1,
		function ()
			count = count - 1

			if count < 0 then
				self:close_game()
				managers.system_menu:close(dialog_data.id)
			else
				local dlg = managers.system_menu:get_dialog(dialog_data.id)

				if dlg then
					dlg:set_text(managers.localization:text("dialog_enable_overhaul_dialog", {
						TIME = count
					}), true)
				end
			end
		end
	}

	managers.system_menu:show(dialog_data)
end