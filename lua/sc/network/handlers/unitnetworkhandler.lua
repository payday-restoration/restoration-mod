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

function UnitNetworkHandler:action_spooc_start(unit, target_u_pos, flying_strike, action_id)
	if not self._verify_character(unit) or not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local action_desc = {
		block_type = "walk",
		type = "spooc",
		path_index = 1,
		body_part = 1,
		nav_path = {
			unit:position()
		},
		target_u_pos = target_u_pos,
		flying_strike = flying_strike,
		action_id = action_id,
		blocks = {
			act = -1,
			turn = -1,
			walk = -1
		}
	}

	if flying_strike then
		action_desc.blocks.idle = -1
		action_desc.blocks.light_hurt = -1
		action_desc.blocks.heavy_hurt = -1
		action_desc.blocks.fire_hurt = -1
		action_desc.blocks.hurt = -1
		action_desc.blocks.expl_hurt = -1
		action_desc.blocks.taser_tased = -1
	end

	unit:movement():action_request(action_desc)
end

function UnitNetworkHandler:action_aim_state(unit, state)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_character(unit) then
		return
	end

	if state then
		local shoot_action = {
			block_type = "action",
			body_part = 3,
			type = "shoot"
		}

		unit:movement():action_request(shoot_action)
	else
		unit:movement():sync_action_aim_end()
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

function UnitNetworkHandler:sync_add_doted_enemy(enemy_unit, variant, weapon_unit, dot_length, dot_damage, user_unit, is_molotov_or_hurt_animation, rpc)
	if variant == 0 then
		managers.fire:sync_add_fire_dot(enemy_unit, nil, weapon_unit, dot_length, dot_damage, user_unit, is_molotov_or_hurt_animation)
	else
		if variant == 1 then
			variant = "poison"
		elseif variant == 2 then
			variant = "bleed"
		elseif variant == 3 then
			variant = "dot"
		else
			variant = nil
		end

		if weapon_unit and alive(weapon_unit) and weapon_unit:base() then
			if weapon_unit:base().is_husk_player then
				local peer_id = managers.network:session():peer_by_unit(weapon_unit):id()
				local peer = managers.network:session():peer(peer_id)

				weapon_unit = peer:melee_id()
			else
				weapon_unit = weapon_unit:base().melee_weapon and weapon_unit:base():melee_weapon() or weapon_unit

				if weapon_unit == "weapon" then
					weapon_unit = nil
				end
			end
		end

		managers.dot:sync_add_dot_damage(enemy_unit, variant, weapon_unit, dot_length, dot_damage, user_unit, is_molotov_or_hurt_animation, variant, weapon_id)
	end
end

function UnitNetworkHandler:request_throw_projectile(projectile_type_index, position, dir, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		log("projectile throw request failed: _verify failed")
		return
	end

	local peer = self._verify_sender(sender)

	if not peer then
		log("projectile throw request failed: no peer/invalid peer?")
		return
	end

	local peer_id = peer:id()
	local projectile_type = tweak_data.blackmarket:get_projectile_name_from_index(projectile_type_index)
	local no_cheat_count = tweak_data.blackmarket.projectiles[projectile_type].no_cheat_count

	if not no_cheat_count and not managers.player:verify_grenade(peer_id) then
		log("projectile throw request failed: apparently went past the cheat count check")
		return
	end

	ProjectileBase.throw_projectile(projectile_type, position, dir, peer_id)
end

function UnitNetworkHandler:sync_throw_projectile(unit, pos, dir, projectile_type_index, peer_id, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		log("projectile throw request failed: _verify failed")
		return
	end

	local peer = self._verify_sender(sender)

	if not peer then
		log("projectile throw request failed: no peer/invalid peer?")
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
		log("projectile throw request failed: unit doesn't exist")

		return
	end

	local server_peer = managers.network:session():server_peer()

	if tweak_entry.throwable and not peer == server_peer then
		log("projectile throw request failed: projectile is throwable, should not be thrown by client")

		return
	end

	local no_cheat_count = tweak_entry.no_cheat_count

	if not no_cheat_count then
		managers.player:verify_grenade(peer_id)
	end

	local member = managers.network:session():peer(peer_id)
	local thrower_unit = member and member:unit()

	if alive(thrower_unit) then
		unit:base():set_thrower_unit(thrower_unit, true)

		if not tweak_entry.throwable and thrower_unit:movement() and thrower_unit:movement():current_state() then
			unit:base():set_weapon_unit(thrower_unit:movement():current_state()._equipped_unit)
		end
	end

	unit:base():sync_throw_projectile(dir, projectile_type)
end

function UnitNetworkHandler:action_hurt_start(unit, hurt_type_idx, body_part, death_type_idx, type_idx, variant_idx, direction_vec, hit_pos)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local hurt_type = CopActionHurt.idx_to_hurt_type(hurt_type_idx)

	if hurt_type == "death" then
		if alive(unit) then
			local action_type = CopActionHurt.idx_to_type(type_idx)
			local variant = CopActionHurt.idx_to_variant(variant_idx)
			local block_type = hurt_type
			local mov_ext = unit:movement()
			local client_interrupt = nil

			if mov_ext._queued_actions then
				mov_ext._queued_actions = {}
			end

			if mov_ext._rope then
				mov_ext._rope:base():retract()

				mov_ext._rope = nil
				mov_ext._rope_death = true

				if unit:sound().anim_clbk_play_sound then
					unit:sound():anim_clbk_play_sound(unit, "repel_end")
				end
			end

			if Network:is_server() then
				mov_ext:set_attention()
			else
				client_interrupt = true
				mov_ext:synch_attention()
			end

			local blocks = {
				act = -1,
				aim = -1,
				action = -1,
				tase = -1,
				walk = -1,
				light_hurt = -1,
				death = -1
			}

			local action_data = {
				allow_network = false,
				client_interrupt = client_interrupt,
				hurt_type = hurt_type,
				block_type = block_type,
				blocks = blocks,
				body_part = body_part,
				death_type = CopActionHurt.idx_to_death_type(death_type_idx),
				type = action_type,
				variant = variant,
				direction_vec = direction_vec,
				hit_pos = hit_pos
			}

			unit:movement():action_request(action_data)
		end
	else
		if not self._verify_character(unit) then
			return
		end

		local action_data = nil
		local action_type = CopActionHurt.idx_to_type(type_idx)

		if action_type == "healed" then
			if unit:anim_data() and unit:anim_data().act then
				return
			end

			action_data = {
				body_part = body_part,
				type = "healed",
				client_interrupt = Network:is_client()
			}
		else
			local block_type = hurt_type

			if hurt_type == "expl_hurt" or hurt_type == "fire_hurt" or hurt_type == "poison_hurt" or hurt_type == "taser_tased" then
				block_type = "heavy_hurt"
			end

			if Network:is_server() and unit:movement():chk_action_forbidden(block_type) then
				return
			end

			local variant = CopActionHurt.idx_to_variant(variant_idx)
			local client_interrupt, blocks = nil

			if variant == "tase" then
				block_type = "bleedout"
			elseif hurt_type == "expl_hurt" or hurt_type == "fire_hurt" or hurt_type == "poison_hurt" or hurt_type == "taser_tased" then
				block_type = "heavy_hurt"

				client_interrupt = Network:is_client()
			else
				block_type = hurt_type

				if hurt_type ~= "bleedout" and hurt_type ~= "fatal" then
					client_interrupt = Network:is_client()
				end
			end

			if hurt_type ~= "light_hurt" then
				blocks = {
					act = -1,
					aim = -1,
					action = -1,
					tase = -1,
					walk = -1,
					light_hurt = -1
				}

				if hurt_type == "bleedout" then
					blocks.bleedout = -1
					blocks.hurt = -1
					blocks.heavy_hurt = -1
					blocks.hurt_sick = -1
					blocks.concussion = -1
				end
			end

			action_data = {
				allow_network = false,
				client_interrupt = client_interrupt,
				hurt_type = hurt_type,
				block_type = block_type,
				blocks = blocks,
				body_part = body_part,
				death_type = CopActionHurt.idx_to_death_type(death_type_idx),
				type = action_type,
				variant = variant,
				direction_vec = direction_vec,
				hit_pos = hit_pos
			}
		end

		unit:movement():action_request(action_data)
	end
end

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

function UnitNetworkHandler:sync_friendly_fire_damage(peer_id, unit, damage, variant, sender)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) or not self._verify_sender(sender) then
		return
	end

	if managers.network:session():local_peer():id() == peer_id then
		local player_unit = managers.player:player_unit()

		if alive(player_unit) and alive(unit) then
			local attack_info = {
				ignore_suppression = true,
				attacker_unit = unit,
				damage = damage,
				armor_piercing = true,
				variant = variant,
				col_ray = {
					position = mvector3.copy(unit:movement():m_head_pos())
				}
			}

			if variant == "bullet" or variant == "projectile" then
				player_unit:character_damage():damage_bullet(attack_info)
			elseif variant == "melee" or variant == "taser_tased" then --allow melee tase to deal damage
				local push_vec = player_unit:movement():m_head_pos() - unit:movement():m_head_pos()

				attack_info.push_vel = push_vec:with_z(0.1):normalized() * 600

				player_unit:character_damage():damage_melee(attack_info)
			elseif variant == "fire" then
				player_unit:character_damage():damage_fire(attack_info)
			end
		end
	end

	if managers.mutators:is_mutator_active(MutatorFriendlyFire) then
		managers.job:set_memory("trophy_flawless", true, false)
	end
end

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


-- Ignore duplicate grenade sync
function UnitNetworkHandler:sync_smoke_grenade(detonate_pos, shooter_pos, duration, flashbang)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local t = TimerManager:game():time()
	local last_t = self._last_grenade_t
	self._last_grenade_t = t

	if last_t and last_t + 4 > t and mvector3.equal(self._last_grenade_pos, detonate_pos) then
		return
	end

	self._last_grenade_pos = mvector3.copy(detonate_pos)

	managers.groupai:state():sync_smoke_grenade(detonate_pos, shooter_pos, duration, flashbang)
end

function UnitNetworkHandler:sync_cs_grenade(detonate_pos, shooter_pos, duration)
	if not self._verify_gamestate(self._gamestate_filter.any_ingame) then
		return
	end

	local t = TimerManager:game():time()
	local last_t = self._last_grenade_t
	self._last_grenade_t = t

	if last_t and last_t + 4 > t and mvector3.equal(self._last_grenade_pos, detonate_pos) then
		return
	end

	self._last_grenade_pos = mvector3.copy(detonate_pos)

	managers.groupai:state():sync_cs_grenade(detonate_pos, shooter_pos, duration)
end