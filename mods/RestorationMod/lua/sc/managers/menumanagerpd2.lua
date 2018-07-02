if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function MenuCallbackHandler:on_visit_res_guide()
		if SystemInfo:distribution() == Idstring("STEAM") then
			if MenuCallbackHandler:is_overlay_enabled() then
				Steam:overlay_activate("url", "https://steamcommunity.com/sharedfiles/filedetails/?id=1366254667")
			else
				managers.menu:show_enable_steam_overlay()
			end
		end
	end

end