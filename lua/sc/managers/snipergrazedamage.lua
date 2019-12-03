if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local TRAIL_EFFECT = Idstring("effects/particles/weapons/sniper_trail")
	local idstr_trail = Idstring("trail")
	local idstr_simulator_length = Idstring("simulator_length")
	local idstr_size = Idstring("size")
	local trail_length

	function SniperGrazeDamage:on_weapon_fired(weapon_unit, result)
	if not alive(weapon_unit) or not weapon_unit:base():is_category("snp") or weapon_unit ~= managers.player:equipped_weapon_unit() or not result.hit_enemy then
	  return
	end

	local player_unit = managers.player:player_unit()
	if not player_unit then
	  return
	end

	local upgrade_value = managers.player:upgrade_value("snp", "graze_damage")
	local sentry_mask = managers.slot:get_mask("sentry_gun")
	local ally_mask = managers.slot:get_mask("all_criminals")
	local enemy_mask = managers.slot:get_mask("enemies")
	local geometry_mask = managers.slot:get_mask("world_geometry")
	local hit_enemies = {}
	local ignored_enemies = {}

	for _, hit in ipairs(result.rays) do
	  local is_turret = hit.unit:in_slot(sentry_mask)
	  local is_ally = hit.unit:in_slot(ally_mask)

	  local result = hit.damage_result
	  local attack_data = result and result.attack_data
	  if attack_data and attack_data.headshot and not is_turret and not is_ally then
		local multiplier = (result.type == "death" or result.type == "healed") and upgrade_value.damage_factor_kill or upgrade_value.damage_factor
		local key = hit.unit:key()
		hit_enemies[key] = {
		  position = hit.position,
		  damage = attack_data.damage * multiplier
		}
		ignored_enemies[key] = true
	  end
	end

	local radius = upgrade_value.radius
	for _, hit in pairs(hit_enemies) do
	  self:find_closest_hit(hit, ignored_enemies, upgrade_value, enemy_mask, geometry_mask, player_unit, upgrade_value.times)
	end

	end

	function SniperGrazeDamage:find_closest_hit(hit, ignored_enemies, upgrade_value, enemy_mask, geometry_mask, player_unit, times)
	if times <= 0 then
	  return
	end

	local hit_units = World:find_units_quick("sphere", hit.position, upgrade_value.radius, enemy_mask)
	local closest
	local closest_d_sq
	for _, unit in ipairs(hit_units) do
	  if not ignored_enemies[unit:key()] then
		local d_s = mvector3.distance_sq(hit.position, unit:movement():m_head_pos())
		if not closest_d_sq or d_s < closest_d_sq then
		  if not World:raycast("ray", hit.position, unit:movement():m_head_pos(), "slot_mask", geometry_mask) then
			closest = unit
			closest_d_sq = d_s
		  end
		end
	  end
	end
	if closest then
	  ignored_enemies[closest:key()] = true

	  local hit_pos = Vector3()
	  mvector3.set(hit_pos, closest:movement():m_head_pos())

	  if not trail_length then
		trail_length = World:effect_manager():get_initial_simulator_var_vector2(TRAIL_EFFECT, idstr_trail, idstr_simulator_length, idstr_size)
	  end
	  local trail = World:effect_manager():spawn({
		effect = Idstring("effects/particles/weapons/sniper_trail"),
		position = hit.position,
		normal = hit_pos - hit.position
	  })
	  mvector3.set_y(trail_length, math.sqrt(closest_d_sq))
	  World:effect_manager():set_simulator_var_vector2(trail, idstr_trail, idstr_simulator_length, idstr_size, trail_length)

	  DelayedCalls:Add("grazehit" .. tostring(closest), 0.05, function ()
		if not alive(closest) or not alive(player_unit) then
		  return
		end
		
		local result = closest:character_damage():damage_simple({
		  variant = "graze",
		  damage = hit.damage,
		  attacker_unit = player_unit,
		  pos = hit_pos,
		  attack_dir = hit_pos - hit.position
		})

		hit = {
		  position = hit_pos,
		  damage = result and result.damage or hit.damage
		}
	  
		self:find_closest_hit(hit, ignored_enemies, upgrade_value, enemy_mask, geometry_mask, player_unit, times - 1)
	  end)

	end
	
	end

end