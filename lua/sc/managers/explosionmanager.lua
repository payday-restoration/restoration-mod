local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_mul = mvector3.multiply
local mvec3_dir = mvector3.direction
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_copy = mvector3.copy
local tmp_pos = Vector3()
local tmp_vec3 = Vector3()
local push_vec = Vector3()
local math_min = math.min
local math_max = math.max
local math_round = math.round
local math_pow = math.pow
local math_clamp = math.clamp
local math_random = math.random
local math_rand = math.rand
local math_ceil = math.ceil
local table_insert = table.insert
local world_g = World

--Debug draw options.
local draw_explosion_sphere = nil
local draw_sync_explosion_sphere = nil
local draw_splinters = nil
local draw_obstructed_splinters = nil
local draw_splinter_hits = nil
local draw_shield_obstructions = nil
local draw_duration = 3

--Allow for explosives to carry DoT data since FireManager based explosions seem to really hate Dozers and also support for curve_pow
function ExplosionManager:_damage_characters(detect_results, params, variant, damage_func_name)
	local user_unit = params.user
	local owner = params.owner
	local damage = params.damage
	local hit_pos = params.hit_pos
	local col_ray = params.col_ray
	local range = params.range
	local curve_pow = params.curve_pow
	local dot_data = params.dot_data
	local verify_callback = params.verify_callback
	damage_func_name = damage_func_name or "damage_explosion"
	local counts = {
		cops = {
			kills = 0,
			hits = 0
		},
		gangsters = {
			kills = 0,
			hits = 0
		},
		civilians = {
			kills = 0,
			hits = 0
		},
		criminals = {
			kills = 0,
			hits = 0
		}
	}
	local criminal_names = CriminalsManager.character_names()

	local function get_first_body_hit(bodies_hit)
		for _, hit_body in ipairs(bodies_hit or {}) do
			if alive(hit_body) then
				return hit_body
			end
		end
	end

	local dir, len, type, count_table, hit_body = nil

	for key, unit in pairs(detect_results.characters_hit) do
		hit_body = get_first_body_hit(detect_results.bodies_hit[key])
		dir = hit_body and hit_body:center_of_mass() or alive(unit) and unit:position()
		len = mvector3.direction(dir, hit_pos, dir)
		local can_damage = not verify_callback

		if verify_callback then
			can_damage = verify_callback(unit)
		end

		if alive(unit) and can_damage then
			if unit:character_damage()[damage_func_name] then
				local action_data = {
					variant = variant or "explosion"
				}

				if damage > 0 then
					action_data.damage = math.max(damage * math.pow(math.clamp(1 - len / range, 0, 1), curve_pow), 1)
				else
					action_data.damage = 0
				end

				action_data.attacker_unit = user_unit
				action_data.weapon_unit = owner
				action_data.col_ray = col_ray or {
					position = unit:position(),
					ray = dir,
					unit = unit
				}

				local defense_data = unit:character_damage()[damage_func_name](unit:character_damage(), action_data)
				local dead_now = unit:character_damage():dead()
				if dot_data and not dead_now and defense_data and defense_data ~= "friendly_fire" and unit:character_damage().damage_dot then
					local damage_class = CoreSerialize.string_to_classtable(dot_data.damage_class)

					if damage_class then
						damage_class:start_dot_damage(action_data.col_ray, owner, dot_data, nil, user_unit, defense_data)
					end
				end
			else
				debug_pause("unit: ", unit, " is missing " .. tostring(damage_func_name) .. " implementation")
			end
		end

		if alive(unit) and unit:base() and unit:base()._tweak_table then
			type = unit:base()._tweak_table

			if table.contains(criminal_names, CriminalsManager.convert_new_to_old_character_workname(type)) then
				count_table = counts.criminals
			elseif CopDamage.is_civilian(type) then
				count_table = counts.civilians
			elseif CopDamage.is_gangster(type) then
				count_table = counts.gangsters
			else
				count_table = counts.cops
			end

			count_table.hits = count_table.hits + 1

			if unit:character_damage():dead() then
				count_table.kills = count_table.kills + 1
			end
		end
	end

	local results = {
		count_cops = counts.cops.hits,
		count_gangsters = counts.gangsters.hits,
		count_civilians = counts.civilians.hits,
		count_criminals = counts.criminals.hits,
		count_cop_kills = counts.cops.kills,
		count_gangster_kills = counts.gangsters.kills,
		count_civilian_kills = counts.civilians.kills,
		count_criminal_kills = counts.criminals.kills
	}

	return results
end

function ExplosionManager:give_local_player_dmg(pos, range, damage)
	local player = managers.player:player_unit()
	local los = managers.environment_controller:test_line_of_sight(pos + Vector3(0, 0, 150), 200, range / 3, range) or 0

	if player and los > 0 then
		player:character_damage():damage_explosion({
			attacker_unit = player,
			variant = "explosion",
			position = pos,
			range = range,
			damage = damage
		})
	end
end

--Old ExplosionManager stuff; keeping as a means of reference in case anything resmod needs is missing from updated code to support U240.3
--[[
--Alt version of vanilla _detect_hits. Kept as is to avoid crashing if Overkill adds in a new grenade type.
--Generates splinters and returns objects that might potentially be hit.
function ExplosionManager:_generate_hits(params)
	local hit_pos = params.hit_pos
	local range = params.range

	self:draw_explosion_sphere(hit_pos, range)

 	--Get bodies that may be hit.
	local bodies = {}
	local ignore_unit = params.ignore_unit
	local slotmask = params.collision_slotmask
	if ignore_unit then
		bodies = world_g:find_bodies(ignore_unit, "intersect", "sphere", hit_pos, range, slotmask)
	else
		bodies = world_g:find_bodies("intersect", "sphere", hit_pos, range, slotmask)
	end

	--Start generating splinters.
	local splinters = {
		mvec3_copy(hit_pos) --First splinter is at impact site.
	}	
	local geometry_mask = managers.slot:get_mask("world_geometry")
	local dirs = { --All other splinters will be in each dir at explosion range, constrained by geometry.
		Vector3(range, 0, 0), --Vectors to shoot raycasts in.
		Vector3(-range, 0, 0),
		Vector3(0, range, 0),
		Vector3(0, -range, 0),
		Vector3(0, 0, range),
		Vector3(0, 0, -range)
	}
	for i = 1, #dirs do --Go through each dir and see if it can create a splinter.
		local dir = dirs[i]
		mvec3_set(tmp_pos, dir) --tmp_pos stores the current splinter ray.
		mvec3_add(tmp_pos, hit_pos)

		local splinter_ray = world_g:raycast("ray", hit_pos, tmp_pos, "slot_mask", geometry_mask)

		if splinter_ray then --If a splinter ray collides with the geometry_mask, then adjust its position to be where it hit.
			tmp_pos = splinter_ray.position - dir:normalized() * math_min(splinter_ray.distance, 10)
		end

		--Ensure that the splinter isn't too close to other splinters.
		local near_splinter = false
		for i = 1, #splinters do
			local s_pos = splinters[i]
			if mvec3_dis_sq(tmp_pos, s_pos) < 900 then
				near_splinter = true

				break
			end
		end

		--If it isn't too close to any, then add it to the splinter table.
		if not near_splinter then
			self:draw_splinters(hit_pos, tmp_pos)
			table_insert(splinters, mvec3_copy(tmp_pos))
		end
	end

	return bodies, splinters
end
 
--Checks what can be hit, then applies damage to them based on the info that's passed in.
function ExplosionManager:_apply_damage(bodies, splinters, params, damage_func, variant, obstructed_by_shields)
	--Data relevant to the explosion itself.
	local hit_pos = params.hit_pos
	local user_unit = params.user
	local base_damage = params.damage
	local range = params.range
	local curve_pow = params.curve_pow
	local col_ray = params.col_ray
	local owner = params.owner
	local push_units = params.push_units or variant == "explosion" and true or false
	local geometry_mask = managers.slot:get_mask("world_geometry")
	local shield_mask = obstructed_by_shields and managers.slot:get_mask("enemy_shield_check")

	--Data used to count hits and kills.
	local criminal_names = CriminalsManager.character_names()
	local count_cops = 0
	local count_gangsters = 0
	local count_civilians = 0
	local count_criminals = 0
	local count_cop_kills = 0
	local count_gangster_kills = 0
	local count_civilian_kills = 0
	local count_criminal_kills = 0

	--Get tables of things to interact.
	local hit_units = {} --Also used to prevent splinters from hitting the same thing multiple times. 
	local units_to_push = nil
	if push_units and push_units == true then
		units_to_push = {}
	end

	for i = 1, #bodies do
		local hit_body = bodies[i]
		if alive(hit_body) then
			local hit_unit = hit_body:unit()
			local hit_unit_key = hit_unit:key()
			local hit_unit_pos = hit_body:center_of_mass()
			local hit_damage_ext = hit_unit:character_damage() 
			local hit_character = hit_damage_ext and hit_damage_ext[damage_func] and not hit_damage_ext:dead() --Whether this body is a character that can be hit.
			local hit_object = variant == "explosion" and hit_body:extension() and hit_body:extension().damage --Whether this body is a map object that can be hit. Actual explosions only.
			local ray_hit = nil --Whether the explosion hit.
			local dmg_mul = 1 --DMG mul for this unit.
			local can_damage = not params.verify_callback --Whether or not this unit can be damaged. If a verify callback exists, then check it first. Map objects ignore this value.

			--All units in the radius are pushed if the explosion can push, regardless of whether they are hit by splinters or not.
			if units_to_push then
				units_to_push[hit_unit_key] = hit_unit
			end

			if hit_character and not hit_units[hit_unit_key] then
				if params.verify_callback then --Check that callback is fine. Mostly relevant on stun grenades.
					local character_unit = hit_unit

					can_damage = params.verify_callback(character_unit)
				end

				if can_damage then --If we can damage this unit, then see if we actually hit.
					if params.no_raycast_check_characters then --No raycast == ignore splinters.
						ray_hit = true
						hit_units[hit_unit_key] = hit_unit
					else --Otherwise, see if any of the splinters has LOS.
						for i = 1, #splinters do
							local s_pos = splinters[i]
							ray_hit = not world_g:raycast("ray", s_pos, hit_unit_pos, "slot_mask", geometry_mask, "report")
							if ray_hit then
								hit_units[hit_unit_key] = hit_unit
								self:draw_splinter_raycasts(s_pos, hit_unit_pos, ray_hit)

								--If shield obstruction is enabled, then check for a shield in the way and ajust the damage multiplier as needed.
								if obstructed_by_shields and hit_unit:movement() and hit_unit:movement().m_com then
									local e_com = hit_unit:movement():m_com()
									local shield_ray = world_g:raycast("ray", hit_pos, e_com, "slot_mask", shield_mask)

									if shield_ray and alive(shield_ray.unit:parent()) then
										self:draw_shield_obstructions(hit_pos, shield_ray.position)
										local p_unit = shield_ray.unit:parent()
										local p_unit_dmg = p_unit:character_damage()

										if p_unit_dmg and p_unit_dmg.dead and not p_unit_dmg:dead() then
											if hit_unit == p_unit then
												if p_unit:base():char_tweak().damage.shield_explosion_damage_mul then
													dmg_mul = p_unit:base():char_tweak().damage.shield_explosion_damage_mul
												end
											else
												if p_unit:base():char_tweak().damage.shield_explosion_ally_damage_mul then
													dmg_mul = p_unit:base():char_tweak().damage.shield_explosion_ally_damage_mul
												end
											end
										end
									end
								end

								break
							end
						end
					end
				end
			elseif hit_object or hit_body:dynamic() then --Explosives hit non-enemy objects on the map.
				if not hit_units[hit_unit_key] then
					ray_hit = true
					hit_units[hit_unit_key] = hit_unit
				elseif hit_units[hit_unit_key] and hit_damage_ext and hit_damage_ext.damage_explosion then --Special case for Dozer Faceplates, since the dozer's key may be on the table already. Also affects many props.
					ray_hit = true --Why bother doing raycast checks on these.
				end
			end

			if ray_hit then --If we hit something, see if we can apply damage to it.
				local length = mvec3_dir(hit_unit_pos, hit_pos, hit_unit_pos)
				local damage = base_damage * math_pow(math_clamp(1 - length / range, 0, 1), curve_pow) * dmg_mul

				if hit_object then --Apply prop damage to props.
					local prop_damage = damage

					if 1 - length / range < -5 then
						prop_damage = math_max(damage, 1)
					end

					self:_apply_body_damage(true, hit_body, user_unit, hit_unit_pos, prop_damage)
				elseif hit_character and can_damage then --Apply character damage to characters.
					local action_data = {
						variant = variant,
						damage = damage,
						attacker_unit = user_unit,
						weapon_unit = owner,
						col_ray = self._col_ray or {
							position = hit_body:position(),
							ray = hit_unit_pos
						},
						ignite_character = params.ignite_character
					}

					hit_damage_ext[damage_func](hit_damage_ext, action_data)

					--Update hit/kill counters.
					if hit_unit:base() then
						local tweak_name = hit_unit:base()._tweak_table
						if tweak_name then
							local dead = hit_damage_ext:dead()

							if table.contains(criminal_names, CriminalsManager.convert_new_to_old_character_workname(tweak_name)) then
								count_criminals = count_criminals + 1
								if dead then
									count_criminal_kills = count_criminal_kills + 1
								end
							elseif CopDamage.is_civilian(tweak_name) then
								count_civilians = count_civilians + 1
								if dead then
									count_civilian_kills = count_civilian_kills + 1
								end
							elseif CopDamage.is_gangster(tweak_name) then
								count_gangsters = count_gangsters + 1
								if dead then
									count_gangster_kills = count_gangster_kills + 1
								end
							elseif hit_unit:base().has_tag and hit_unit:base():has_tag("law") then
								count_cops = count_cops + 1
								if dead then
									count_cop_kills = count_cop_kills + 1
								end
							end
						end
					end
				end
			end
		end
	end

	--Push around everything we saw in the bodies loop.
	if units_to_push then
		managers.explosion:units_to_push(units_to_push, hit_pos, range)
	end

	--Finally, gather the hit/kill counters into a table.
	local results = {}
	if owner then
		results = {
			count_cops = count_cops,
			count_criminals = count_criminals,
			count_civilians = count_civilians,
			count_gangsters = count_gangsters,
			count_cop_kills = count_cop_kills,
			count_criminal_kills = count_criminal_kills,
			count_civilian_kills = count_civilian_kills,
			count_gangster_kills = count_gangster_kills
		}
	end

	return hit_units, results
end 
 
--Sends out an alert when grenades go off.
function ExplosionManager:_send_alert(params)
	local alert_radius = params.alert_radius or 10000
	local alert_filter = params.alert_filter or managers.groupai:state():get_unit_type_filter("civilians_enemies")
	local alert_unit = user_unit

	if alive(alert_unit) and alert_unit:base() and alert_unit:base().thrower_unit then
		alert_unit = alert_unit:base():thrower_unit()
	end

	managers.groupai:state():propagate_alert({
		"explosion",
		params.hit_pos,
		alert_radius,
		alert_filter,
		alert_unit
	})
end

function ExplosionManager:detect_and_stun(params)
	local bodies, splinters = self:_generate_hits(params)
	local hit_units, results = self:_apply_damage(bodies, splinters, params, "stun_hit", "stun", false)
	self:_send_alert(params)

	return hit_units, splinters, results
end

function ExplosionManager:detect_and_give_dmg(params)
	local bodies, splinters = self:_generate_hits(params)
	local hit_units, results = self:_apply_damage(bodies, splinters, params, "damage_explosion", "explosion", true)
	self:_send_alert(params)

	return hit_units, splinters, results
end

function ExplosionManager:detect_and_tase(params)
	local bodies, splinters = self:_generate_hits(params)
	local hit_units, results = self:_apply_damage(bodies, splinters, params, "damage_tase", params.tase_strength or "light", false)
	self:_send_alert(params)

	return hit_units, splinters, results
end

function ExplosionManager:units_to_push(units_to_push, from_pos, range)
	range = math_min(range, 500)

	for u_key, unit in pairs(units_to_push) do
		if alive(unit) then
			local is_character = unit:character_damage() and unit:character_damage().damage_explosion

			if not is_character or unit:character_damage():dead() then
				if is_character and unit:movement() and unit:movement()._active_actions and unit:movement()._active_actions[1] and unit:movement()._active_actions[1]:type() == "hurt" then
					unit:movement()._active_actions[1]:force_ragdoll(true)
				end

				local nr_u_bodies = unit:num_bodies()
				local rot_acc = Vector3(1 - math_rand(2), 1 - math_rand(2), 1 - math_rand(2)) * 10
				local i_u_body = 0

				while nr_u_bodies > i_u_body do
					local u_body = unit:body(i_u_body)

					if u_body:enabled() and u_body:dynamic() then
						local body_mass = u_body:mass()
						local length = mvec3_dir(tmp_vec3, from_pos, u_body:center_of_mass())
						local body_vel = u_body:velocity()
						local vel_dot = mvec3_dot(body_vel, tmp_vec3)
						local max_vel = 800

						if vel_dot < max_vel then
							mvec3_set_z(tmp_vec3, mvector3.z(tmp_vec3) + 0.75)

							local push_vel = (1 - length / range) * (max_vel - math_max(vel_dot, 0))

							mvec3_mul(tmp_vec3, push_vel)
							world_g:play_physic_effect(Idstring("physic_effects/body_explosion"), u_body, tmp_vec3, body_mass / math_random(2), u_body:position(), rot_acc, 1)
						end
					end

					i_u_body = i_u_body + 1
				end
			end

			if unit:body("body") then
				mvec3_dir(push_vec, from_pos, unit:body("body"):center_of_mass())

				unit:push(5, push_vec * range * 2)
			end
		end
	end
end

function ExplosionManager:_apply_body_damage(is_server, hit_body, user_unit, dir, damage)
	local hit_unit = hit_body:unit()
	local local_damage = is_server or hit_unit:id() == -1
	local sync_damage = is_server and hit_unit:id() ~= -1

	if not local_damage and not sync_damage then
		--print("_apply_body_damage skipped")

		return
	end

	local normal = dir
	local prop_damage = math_min(damage, 200)

	if prop_damage < 0.25 then
		prop_damage = math_round(prop_damage, 0.25)
	end

	if prop_damage > 0 then
		local network_damage = math_ceil(prop_damage * 163.84)
		prop_damage = network_damage / 163.84

		if local_damage then
			hit_body:extension().damage:damage_explosion(user_unit, normal, hit_body:position(), dir, prop_damage)
			hit_body:extension().damage:damage_damage(user_unit, normal, hit_body:position(), dir, prop_damage)
		end

		if sync_damage and managers.network:session() then
			if alive(user_unit) then
				managers.network:session():send_to_peers_synched("sync_body_damage_explosion", hit_body, user_unit, normal, hit_body:position(), dir, math_min(32768, network_damage))
			else
				managers.network:session():send_to_peers_synched("sync_body_damage_explosion_no_attacker", hit_body, normal, hit_body:position(), dir, math_min(32768, network_damage))
			end
		end
	end
end

function ExplosionManager:client_damage_and_push(from_pos, normal, user_unit, dmg, range, curve_pow)
	self:draw_sync_explosion_sphere(from_pos, range)

	local bodies = world_g:find_bodies("intersect", "sphere", from_pos, range, managers.slot:get_mask("explosion_targets"))
	local units_to_push = {}

	for _, hit_body in ipairs(bodies) do
		if alive(hit_body) then
			local hit_unit = hit_body:unit()
			units_to_push[hit_unit:key()] = hit_unit

			local apply_dmg = hit_body:extension() and hit_body:extension().damage and hit_unit:id() == -1
			local dir, length, damage = nil

			if apply_dmg then
				dir = hit_body:center_of_mass()
				length = mvec3_dir(dir, from_pos, dir)
				damage = dmg * math_pow(math_clamp(1 - length / range, 0, 1), curve_pow)

				self:_apply_body_damage(false, hit_body, user_unit, dir, damage)
			end
		end
	end

	self:units_to_push(units_to_push, from_pos, range)
end

function ExplosionManager:give_local_player_dmg(pos, range, damage, user_unit, curve_pow)
	local player = managers.player:player_unit()

	if player then
		player:character_damage():damage_explosion({
			variant = "explosion",
			position = pos,
			range = range,
			damage = damage,
			attacker_unit = user_unit,
			ignite_character = ignite_character,
			curve_pow = curve_pow
		})
	end
end

function ExplosionManager:draw_explosion_sphere(hit_pos, range)
	if draw_explosion_sphere then
		local new_brush = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
		new_brush:sphere(hit_pos, range)
	end
end

function ExplosionManager:draw_sync_explosion_sphere(hit_pos, range)
	if draw_sync_explosion_sphere then
		local new_brush = Draw:brush(Color.red:with_alpha(0.5), draw_duration)
		new_brush:sphere(hit_pos, range)
	end
end

function ExplosionManager:draw_splinters(hit_pos, splinter_pos)
	if draw_splinters then
		log("Drawing")
		local new_brush = Draw:brush(Color.white:with_alpha(0.5), draw_duration)
		new_brush:cylinder(hit_pos, splinter_pos, 0.5)
	end
end

function ExplosionManager:draw_splinter_raycasts(splinter_pos, center_of_mass, hit)
	if hit and draw_splinter_hits then
		local new_brush = Draw:brush(Color.green:with_alpha(0.5), draw_duration)
		new_brush:cylinder(splinter_pos, center_of_mass, 0.5)
	elseif draw_obstructed_splinters then
		local new_brush = Draw:brush(Color.yellow:with_alpha(0.5), draw_duration)
		new_brush:cylinder(splinter_pos, center_of_mass, 0.5)
	end
end

function ExplosionManager:draw_shield_obstructions(hit_pos, shield_ray_pos)
	if draw_shield_obstructions then
		local new_brush = Draw:brush(Color.blue:with_alpha(0.5), draw_duration)
		new_brush:cylinder(hit_pos, shield_ray_pos, 1.5)
	end
end
--]]