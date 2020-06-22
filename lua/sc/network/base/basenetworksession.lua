BaseNetworkSession.CONNECTION_TIMEOUT = 60
BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = SystemInfo:platform() == Idstring("WIN32") and 60
BaseNetworkSession._LOAD_WAIT_TIME = 60
--above, keep the values at 60 or around 60.  that's one minute... if for some reason this causes issues, drop it to ~45s
Hooks:PostHook(BaseNetworkSession,"on_peer_sync_complete","resmod_send_sync_env_data",function(self,peer,peer_id)
	if not self._local_peer then
		return
	end

	if not peer:ip_verified() then
		return
	end
	Hooks:Call("restoration_on_synced_peer",peer,peer_id)
end)