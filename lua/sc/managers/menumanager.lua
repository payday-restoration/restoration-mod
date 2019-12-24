if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function MenuCallbackHandler:accept_skirmish_contract(item, node)
		managers.menu:active_menu().logic:navigate_back(true)
		managers.menu:active_menu().logic:navigate_back(true)

		local job_data = {
			difficulty = "overkill_145",
			job_id = managers.skirmish:random_skirmish_job_id()
		}

		if Global.game_settings.single_player then
			MenuCallbackHandler:start_single_player_job(job_data)
		else
			MenuCallbackHandler:start_job(job_data)
		end
	end

	function MenuCallbackHandler:accept_skirmish_weekly_contract(item, node)
		managers.menu:active_menu().logic:navigate_back(true)
		managers.menu:active_menu().logic:navigate_back(true)

		local weekly_skirmish = managers.skirmish:active_weekly()
		local job_data = {
			difficulty = "overkill_145",
			weekly_skirmish = true,
			job_id = weekly_skirmish.id
		}

		if Global.game_settings.single_player then
			MenuCallbackHandler:start_single_player_job(job_data)
		else
			MenuCallbackHandler:start_job(job_data)
		end
	end
	
	function MenuPrePlanningInitiator:set_locks_to_param(params, key, index)
		local data = tweak_data:get_raw_value("preplanning", key, index) or {}
		local enabled = params.enabled ~= false
		params.tooltip = params.tooltip or {}
		params.tooltip.errors = params.tooltip.errors or {}
	
		if data.dlc_lock and not Global.game_settings and Global.game_settings.one_down then
			local dlc_unlocked = managers.dlc:is_dlc_unlocked(data.dlc_lock)
	
			if not dlc_unlocked then
				local error_text_id = tweak_data:get_raw_value("lootdrop", "global_values", data.dlc_lock, "unlock_id")
	
				table.insert(params.tooltip.errors, managers.localization:to_upper_text(error_text_id))
	
				enabled = false
			end
		elseif data.upgrade_lock then
			local upgrade_unlocked = managers.player:has_category_upgrade(data.upgrade_lock.category, data.upgrade_lock.upgrade)
	
			if not upgrade_unlocked then
				table.insert(params.tooltip.errors, managers.localization:to_upper_text("menu_asset_lock_" .. data.upgrade_lock.upgrade))
	
				enabled = false
			end
		end
	
		params.enabled = enabled
		params.ignore_disabled = true
	end

end
