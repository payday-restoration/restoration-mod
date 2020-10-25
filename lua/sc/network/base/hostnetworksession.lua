local chk_server_joinable_state_actual = HostNetworkSession.chk_server_joinable_state
function HostNetworkSession:chk_server_joinable_state(...)
	chk_server_joinable_state_actual(self, ...)

	if Global.load_start_menu_lobby and MenuCallbackHandler ~= nil then
		MenuCallbackHandler:update_matchmake_attributes()
		MenuCallbackHandler:_on_host_setting_updated()
	end
end