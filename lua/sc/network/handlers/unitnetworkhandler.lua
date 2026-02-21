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
--	Utils.PrintTable({unit,state,down_time,unit_id_str})
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


--TEMP

function UnitNetworkHandler:sync_vehicle_driving(action, unit, player)
	Application:debug("[DRIVING_NET] sync_vehicle_driving " .. action)

	if not alive(unit) then
		return
	end

	local ext = unit:npc_vehicle_driving()
	ext = ext or unit:vehicle_driving()

	if action == "start" then
		ext:sync_start(player)
	elseif action == "stop" then
		ext:sync_stop()
	end
end

function UnitNetworkHandler:sync_vehicle_set_input(unit, accelerate, steer, brake, handbrake, gear_up, gear_down, forced_gear)
	if not alive(unit) then
		return
	end

	unit:vehicle_driving():sync_set_input(accelerate, steer, brake, handbrake, gear_up, gear_down, forced_gear)
end

function UnitNetworkHandler:sync_vehicle_state(unit, position, rotation, velocity)
	if not alive(unit) then
		return
	end

	unit:vehicle_driving():sync_state(position, rotation, velocity)
end

function UnitNetworkHandler:sync_enter_vehicle_host(vehicle_unit, seat_name, sender_rpc)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local peer = self._verify_sender(sender_rpc)

	if not peer or not alive(peer:unit()) or peer:unit():id() == -1 then
		return
	end

	if not alive(vehicle_unit) or not vehicle_unit:vehicle_driving() then
		return
	end

	managers.player:server_enter_vehicle(vehicle_unit, peer:id(), peer:unit(), seat_name)
end

function UnitNetworkHandler:sync_vehicle_player(action, vehicle, peer_id, player, seat_name)
	Application:debug("[DRIVING_NET] sync_vehicle_player " .. action)

	if action == "enter" then
		managers.player:sync_enter_vehicle(vehicle, peer_id, player, seat_name)
	elseif action == "exit" then
		managers.player:sync_exit_vehicle(peer_id, player)
	end
end

function UnitNetworkHandler:sync_vehicle_data(vehicle, state_name, occupant_driver, occupant_left, occupant_back_left, occupant_back_right, is_trunk_open, manual_exit_disabled)
	Application:debug("[DRIVING_NET] sync_vehicles_data")

	if not alive(vehicle) then
		return
	end

	managers.vehicle:sync_vehicle_data(vehicle, state_name, occupant_driver, occupant_left, occupant_back_left, occupant_back_right, is_trunk_open, manual_exit_disabled)
end

function UnitNetworkHandler:sync_npc_vehicle_data(vehicle, state_name, target_unit)
	Application:debug("[DRIVING_NET] sync_npc_vehicle_data", vehicle, state_name)

	if not alive(vehicle) then
		return
	end

	managers.vehicle:sync_npc_vehicle_data(vehicle, state_name, target_unit)
end

function UnitNetworkHandler:sync_vehicle_loot(vehicle, carry_id1, multiplier1, carry_id2, multiplier2, carry_id3, multiplier3)
	Application:debug("[DRIVING_NET] sync_vehicle_loot")

	if not alive(vehicle) then
		return
	end

	managers.vehicle:sync_vehicle_loot(vehicle, carry_id1, multiplier1, carry_id2, multiplier2, carry_id3, multiplier3)
end

function UnitNetworkHandler:sync_ai_vehicle_action(action, vehicle, data, unit)
	Application:debug("[DRIVING_NET] sync_ai_vehicle_action: ", action, data)

	if not alive(vehicle) then
		return
	end

	if action == "health" then
		vehicle:character_damage():sync_vehicle_health(data)
	elseif action == "revive" then
		vehicle:character_damage():sync_vehicle_revive(data)
	elseif action == "state" then
		vehicle:vehicle_driving():sync_vehicle_state(data)
	else
		if not alive(unit) then
			return
		end

		vehicle:vehicle_driving():sync_ai_vehicle_action(action, data, unit)
	end
end

function UnitNetworkHandler:server_store_loot_in_vehicle(vehicle, loot_bag)
	Application:debug("[DRIVING_NET] server_store_loot_in_vehicle")

	if not alive(vehicle) or not alive(loot_bag) then
		return
	end

	vehicle:vehicle_driving():server_store_loot_in_vehicle(loot_bag)
end

function UnitNetworkHandler:sync_vehicle_change_stance(shooting_unit, stance)
	Application:debug("[DRIVING_NET] sync_vehicle_change_stance")

	if not alive(shooting_unit) then
		return
	end

	shooting_unit:movement():sync_vehicle_change_stance(stance)
end

function UnitNetworkHandler:sync_store_loot_in_vehicle(vehicle, loot_bag, carry_id, multiplier)
	Application:debug("[DRIVING_NET] sync_store_loot_in_vehicle")

	if not alive(vehicle) or not alive(loot_bag) then
		return
	end

	vehicle:vehicle_driving():sync_store_loot_in_vehicle(loot_bag, carry_id, multiplier)
end

function UnitNetworkHandler:server_give_vehicle_loot_to_player(vehicle, peer_id)
	Application:debug("[DRIVING_NET] server_give_vehicle_loot_to_player")
	vehicle:vehicle_driving():server_give_vehicle_loot_to_player(peer_id)
end

function UnitNetworkHandler:sync_give_vehicle_loot_to_player(vehicle, carry_id, multiplier, peer_id)
	Application:debug("[DRIVING_NET] sync_give_vehicle_loot_to_player")
	vehicle:vehicle_driving():sync_give_vehicle_loot_to_player(carry_id, multiplier, peer_id)
end

function UnitNetworkHandler:sync_vehicle_interact_trunk(vehicle_unit, sender_rpc)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender_rpc) then
		return
	end

	local driving_ext = alive(vehicle_unit) and vehicle_unit:vehicle_driving()

	if driving_ext and driving_ext._interact_trunk then
		driving_ext:_interact_trunk()
	end
end

--- The sync_remove_carry equivalent for the carry stack.
--- You're better off checking out the CarryStacker stuff in PlayerManager for more info.
function UnitNetworkHandler:sync_remove_carry_stacker(sender)
	local peer = self._verify_sender(sender)

	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
		return
	end

	managers.player:remove_synced_carry_stacker(peer)
end

function UnitNetworkHandler:sync_camera_rotation(cam_unit, end_yaw, duration)
	if not alive(cam_unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local target_yaw = (360 * (end_yaw / 255)) - 180

	cam_unit:base():set_target_yaw(target_yaw, duration)
end

function UnitNetworkHandler:camera_set_attention(cam_unit, target_unit)
	if not alive(cam_unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	if not alive(target_unit) then
		cam_unit:base():set_target_attention(nil)
		return
	end

	local handler = target_unit:attention()
		or target_unit:brain() and target_unit:brain().attention_handler and target_unit:brain():attention_handler()
		or target_unit:movement() and target_unit:movement().attention_handler and target_unit:movement():attention_handler()
		or target_unit:base() and target_unit:base().attention_handler and target_unit:base():attention_handler()

	cam_unit:base():set_target_attention({
		unit = target_unit,
		u_key = target_unit:key(),
		handler = handler
	})
end

function UnitNetworkHandler:camera_set_attention_pos(cam_unit, pos)
	if not alive(cam_unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	cam_unit:base():set_target_attention({ pos = pos })
end

function UnitNetworkHandler:place_ordnance_bag(pos, rot, upgrade_lvl, rpc)
	local peer = self._verify_sender(rpc)

	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not peer then
		return
	end

	local unit = GrenadeCrateDeployableBase.spawn(pos, rot, upgrade_lvl, peer:id())

	if unit then
		unit:base():set_server_information(peer:id())
	end
end

function UnitNetworkHandler:sync_ordnance_bag_setup(unit, upgrade_lvl)
	if not alive(unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	unit:base():sync_setup(upgrade_lvl)
end

LuaNetworking:AddReceiveHook("sync_intimidated_guard_data", "SyncIntimidatedGuardDataHook", function(unit_id, time, sender)
	if managers.enemy then
		managers.enemy:decode_intimidated_guard_units(unit_id, time)
	end
end)

LuaNetworking:AddReceiveHook("sync_intimidated_guard_data_delete", "SyncIntimidatedGuardDataDeleteHook", function(unit_id, sender)
	if managers.enemy then
		managers.enemy:unregister_intimidated_guard(unit_id)
	end
end)