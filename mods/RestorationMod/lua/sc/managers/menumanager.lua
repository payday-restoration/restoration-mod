function MenuCrimeNetFiltersInitiator:update_node(node)
	if MenuCallbackHandler:is_win32() then
		local not_friends_only = not Global.game_settings.search_friends_only
		node:item("toggle_new_servers_only"):set_enabled(not_friends_only)
		node:item("toggle_server_state_lobby"):set_enabled(not_friends_only)
		node:item("toggle_job_appropriate_lobby"):set_enabled(not_friends_only)
		node:item("toggle_mutated_lobby"):set_enabled(not_friends_only)
		node:item("max_lobbies_filter"):set_enabled(not_friends_only)
		node:item("server_filter"):set_enabled(not_friends_only)
		node:item("difficulty_filter"):set_enabled(not_friends_only)
		node:item("kick_option_filter"):set_enabled(not_friends_only)
		node:item("job_id_filter"):set_enabled(not_friends_only)
		node:item("job_plan_filter"):set_enabled(not_friends_only)
		node:item("toggle_job_appropriate_lobby"):set_visible(self:is_standard() or self:is_heist_war())
		node:item("toggle_allow_safehouses"):set_visible(self:is_standard() or self:is_heist_war())
		node:item("toggle_mutated_lobby"):set_visible(self:is_standard() or self:is_heist_war())
		node:item("difficulty_filter"):set_visible(self:is_standard() or self:is_heist_war())
		node:item("job_id_filter"):set_visible(self:is_standard() or self:is_heist_war())
		node:item("max_spree_difference_filter"):set_visible(self:is_crime_spree())
	end
end

function MenuCrimeNetFiltersInitiator:is_heist_war()
	return Global.game_settings and Global.game_settings.gamemode_filter == GamemodeHeistWar.id
end