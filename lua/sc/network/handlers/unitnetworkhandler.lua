if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	-- Extends the UnitNetworkHandler class to add our own unit network calls
	-- For function modifications use the original function name it will be prefixed later
	RestorationMod__UnitNetworkHandler = RestorationMod__UnitNetworkHandler or class(UnitNetworkHandler)

	-- Will add a prefix of `RestorationMod__` to all functions our definitions use
	-- Required to maintain compatibility with normal lobbies.
	restoration:rename_handler_funcs(RestorationMod__UnitNetworkHandler)
	
	local orig_sync_player = UnitNetworkHandler.sync_player_movement_state
	function UnitNetworkHandler:sync_player_movement_state(unit, state, down_time, unit_id_str,...) --i can't reverse engineer RPC stuff and make my own unitnetworkhandler functions so... guess i'll die
	--instead, hijack this function. use "unit", since i can't/don't know how to pass a unit through BLT Lua Networking, and argument "state" as string of my choice, and the other fields i don't care about. 
	--todo see if i can pass the current time for better repair sync?
		if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
			return
		end
	--	PrintTable({unit,state,down_time,unit_id_str})
		if alive(unit) then --receive repair update status from host
			if state == "start_repair_eq_sentry" then --repair start/finish are controlled by host only, naturally
				unit:base():start_repairmode()
				return
			elseif state == "finish_repair_eq_sentry" then 
				unit:base():finish_repairmode()
				return
			end
		end
		return orig_sync_player(self,unit,state,down_time,unit_id_str,...)
	end

	function UnitNetworkHandler:picked_up_sentry_gun(unit, rpc)
		local peer = self._verify_sender(rpc)

		if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
			return
		end

		if alive(unit) then --receive client interaction request as host
			if unit:character_damage():dead() then --on received sentry interaction request -> repair
				local sentry_type = unit:base():get_type()
				local sentry_type_index = sentry_type == "sentry_gun" and 1 or sentry_type == "sentry_gun_silent" and 2

				unit:base():start_repairmode()
			else --on received sentry interaction request -> pick up
				local sentry_type = unit:base():get_type()
				local sentry_type_index = sentry_type == "sentry_gun" and 1 or sentry_type == "sentry_gun_silent" and 2

				managers.network:session():send_to_peer(peer, "picked_up_sentry_gun_response", unit:id(), unit:weapon():ammo_total(), unit:weapon():ammo_max(), sentry_type_index)
				unit:base():remove()
			end
		end
	end

end