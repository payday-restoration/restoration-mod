BaseNetworkSession.CONNECTION_TIMEOUT = 20 --not sure, 20 by default.
BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = SystemInfo:platform() == Idstring("WIN32") and 40 --what is this? 40 by default.
BaseNetworkSession._LOAD_WAIT_TIME = 15 -- this is 10 by default.  suspicion this is our package culprit, so i've increased it slightly to 15s for testing over the next couple of days.  increase it again if results aren't noticed

Hooks:PostHook(BaseNetworkSession,"on_peer_sync_complete","resmod_send_sync_env_data",function(self,peer,peer_id)
	if not self._local_peer then
		return
	end

	if not peer:ip_verified() then
		return
	end
	Hooks:Call("restoration_on_synced_peer",peer,peer_id)
end)