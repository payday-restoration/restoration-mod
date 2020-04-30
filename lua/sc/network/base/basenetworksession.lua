BaseNetworkSession.CONNECTION_TIMEOUT = 20
BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = SystemInfo:platform() == Idstring("WIN32") and 40
BaseNetworkSession._LOAD_WAIT_TIME = 10

Hooks:PostHook(BaseNetworkSession,"on_peer_sync_complete","resmod_send_sync_env_data",function(self,peer,peer_id)
	if not self._local_peer then
		return
	end

	if not peer:ip_verified() then
		return
	end
	Hooks:Call("restoration_on_synced_peer",peer,peer_id)
end)