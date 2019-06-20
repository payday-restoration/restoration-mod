if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function UnitNetworkHandler:request_throw_projectile(projectile_type_index, position, dir, sender)
		local peer = self._verify_sender(sender)

		if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
			return
		end

		local peer_id = peer:id()
		local projectile_type = tweak_data.blackmarket:get_projectile_name_from_index(projectile_type_index)
		local no_cheat_count = true

		if not no_cheat_count and not managers.player:verify_grenade(peer_id) then
			return
		end

		ProjectileBase.throw_projectile(projectile_type, position, dir, peer_id)
	end
	
	function UnitNetworkHandler:sync_throw_projectile(unit, pos, dir, projectile_type_index, peer_id, sender)
		local peer = self._verify_sender(sender)

		if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
			print("_verify failed!!!")

			return
		end

		local projectile_type = tweak_data.blackmarket:get_projectile_name_from_index(projectile_type_index)
		local tweak_entry = tweak_data.blackmarket.projectiles[projectile_type]

		if tweak_entry.client_authoritative then
			if not unit then
				local unit_name = Idstring(tweak_entry.local_unit)
				unit = World:spawn_unit(unit_name, pos, Rotation(dir, math.UP))
			end

			unit:base():set_owner_peer_id(peer_id)
		end

		if not alive(unit) then
			print("unit is not alive!!!")

			return
		end

		local server_peer = managers.network:session():server_peer()

		if tweak_entry.throwable and not peer == server_peer then
			print("projectile is throwable, should not be thrown by client!!!")

			return
		end

		local no_cheat_count = true

		if not no_cheat_count then
			managers.player:verify_grenade(peer_id)
		end

		local member = managers.network:session():peer(peer_id)
		local thrower_unit = member and member:unit()

		if alive(thrower_unit) then
			unit:base():set_thrower_unit(thrower_unit)

			if not tweak_entry.throwable and thrower_unit:movement() and thrower_unit:movement():current_state() then
				unit:base():set_weapon_unit(thrower_unit:movement():current_state()._equipped_unit)
			end
		end

		unit:base():sync_throw_projectile(dir, projectile_type)
	end	

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