function TradeManager:_send_begin_trade(criminal)
-- this addresses crash: [string "lib/managers/trademanager.lua"]:675: attempt to index local 'criminal' (a nil value)

	if not criminal or criminal.ai == true then
		return
	end

	local peer_id = managers.criminals:character_peer_id_by_name(criminal.id)

	if peer_id == 1 then
		if game_state_machine:current_state_name() == "ingame_waiting_for_respawn" then
			game_state_machine:current_state():begin_trade()
		end
	else
		local peer = managers.network:session():peer(peer_id)

		if peer then
			peer:send_queued_sync("begin_trade")
		end
	end
end