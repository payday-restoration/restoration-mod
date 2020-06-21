--why is there more than fucking one of these timeouts?  fuck off
BaseNetworkSession.CONNECTION_TIMEOUT = 9001
BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = SystemInfo:platform() == Idstring("WIN32") and 9001
BaseNetworkSession._LOAD_WAIT_TIME = 9001

Hooks:PostHook(BaseNetworkSession,"on_peer_sync_complete","resmod_send_sync_env_data",function(self,peer,peer_id)
	if not self._local_peer then
		return
	end

	if not peer:ip_verified() then
		return
	end
	Hooks:Call("restoration_on_synced_peer",peer,peer_id)
end)