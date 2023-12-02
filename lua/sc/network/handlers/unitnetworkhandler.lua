-- Extends the UnitNetworkHandler class to add our own unit network calls
-- For function modifications use the original function name it will be prefixed later
-- RestorationMod__UnitNetworkHandler = RestorationMod__UnitNetworkHandler or class(UnitNetworkHandler)

-- Will add a prefix of `RestorationMod__` to all functions our definitions use
-- Required to maintain compatibility with normal lobbies.
-- restoration:rename_handler_funcs(RestorationMod__UnitNetworkHandler)

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

-- function UnitNetworkHandler:place_grenade_crate(pos, rot, rpc)
-- 	local peer = self._verify_sender(rpc)

-- 	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
-- 		return
-- 	end

-- 	if not managers.player:verify_equipment(peer:id(), "grenade_crate") then
-- 		return
-- 	end

-- 	local unit = GrenadeCrateBase.spawn(pos, rot, peer:id())

-- 	if unit then
-- 		unit:base():set_server_information(peer:id())
-- 	end
-- end

--[[
function UnitNetworkHandler:sync_medic_heal(unit, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end

	MedicActionHeal:check_achievements()

	if self._verify_character(unit) then
		unit:character_damage()._heal_cooldown_t = Application:time()

		if unit:contour() then
			unit:contour():add("medic_show")
			unit:contour():flash("medic_show", 0.2)
		end

		if unit:movement():chk_action_forbidden("action") then
			unit:sound():say("heal")
		else
			local action_data = {
				body_part = 3,
				type = "heal",
				client_interrupt = Network:is_client()
			}

			unit:movement():action_request(action_data)
		end
	end
end
]]--

--Function clients invoke just tells host to do above.
function UnitNetworkHandler:sync_spawn_extra_ammo(position, rotation)
    managers.player:spawn_extra_ammo(position, rotation)
end

--Syncs to match whatever captain type the host has active in skirmish.
function UnitNetworkHandler:sync_skm_captain(name)
	tweak_data.skirmish.captain = name
end

function UnitNetworkHandler:sync_explosion_to_client(unit, position, normal, damage, range, curve_pow, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end

	managers.explosion:give_local_player_dmg(position, range, damage, nil, unit)
	managers.explosion:explode_on_client(position, normal, unit, damage, range, curve_pow)
end 


function UnitNetworkHandler:sync_body_damage_melee(body, attacker, normal, position, direction, damage, object_damage, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end

	if not alive(body) then
		return
	end

	if not body:extension() then
		print("[UnitNetworkHandler:sync_body_damage_melee] body has no extension", body:name(), body:unit():name())

		return
	end

	if not body:extension().damage then
		print("[UnitNetworkHandler:sync_body_damage_melee] body has no damage extension", body:name(), body:unit():name())

		return
	end

	if not body:extension().damage.damage_melee then
		print("[UnitNetworkHandler:sync_body_damage_melee] body has no damage damage_melee function", body:name(), body:unit():name())

		return
	end

	if object_damage then
		body:extension().damage:damage_damage(attacker, normal, position, direction, object_damage)
	end
	body:extension().damage:damage_melee(attacker, normal, position, direction, damage)
end