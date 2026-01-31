local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dis = mvector3.distance
local mvec3_dir = mvector3.direction
local mvec3_cross = mvector3.cross
local mvec3_neg = mvector3.negate
local mvec3_norm = mvector3.normalize
local mvec3_lerp = mvector3.lerp
local mrot_y = mrotation.y
local math_up = math.UP
local mvec_to = Vector3()
local mvec_dir = Vector3()
local mvec_offset = Vector3()
local mvec_offset2 = Vector3()

function NPCBossFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local result = {}
	local ignore_units = self._setup.ignore_units
	local slotmask = self._bullet_slotmask
	local flame_radius = self._flame_radius
	local damage = self._damage * (dmg_mul or 1)
	local capsule_offset = self._extra_capsule_offset
	local orig_damage_range = self._flame_max_range or self._range or 1000

	local function find_bodies_and_adjust_vecs()
		local damage_range = orig_damage_range

		mvec3_set(mvec_to, mvec_dir)
		mvec3_mul(mvec_to, damage_range)
		mvec3_add(mvec_to, from_pos)

		local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", slotmask, "ignore_unit", ignore_units)

		if col_ray then
			local col_dis = col_ray.distance

			if col_dis < damage_range then
				damage_range = col_dis or damage_range
			end

			mvec3_set(mvec_to, mvec_dir)
			mvec3_mul(mvec_to, damage_range)
			mvec3_add(mvec_to, from_pos)
		end

		return World:find_bodies("intersect", "capsule", from_pos, mvec_to, flame_radius, slotmask)
	end

	mvec3_set(mvec_dir, direction)

	local hit_bodies1 = find_bodies_and_adjust_vecs()
	local can_spawn_effects = self:_spawn_flame_effect(mvec_to, mvec_dir)

	mvec3_cross(mvec_offset, direction, math_up)
	mvec3_norm(mvec_offset)
	mvec3_set(mvec_offset2, mvec_offset)
	mvec3_mul(mvec_offset, capsule_offset)
	mvec3_mul(mvec_offset2, -capsule_offset)
	mvec3_set(mvec_dir, direction)
	mvec3_add(mvec_dir, mvec_offset)

	local hit_bodies2 = find_bodies_and_adjust_vecs()

	if can_spawn_effects then
		self:_spawn_flame_effect(mvec_to, mvec_dir, true)
	end

	mvec3_set(mvec_dir, direction)
	mvec3_add(mvec_dir, mvec_offset2)

	local hit_bodies3 = find_bodies_and_adjust_vecs()

	if can_spawn_effects then
		self:_spawn_flame_effect(mvec_to, mvec_dir, true)
	end

	local hit_body, hit_unit, hit_u_key = nil
	local units_hit = {}
	local valid_hit_bodies = {}
	local t_contains = table.contains

	for _, hit_bodies in ipairs({
		hit_bodies1,
		hit_bodies2,
		hit_bodies3
	}) do
		for i = 1, #hit_bodies do
			hit_body = hit_bodies[i]
			hit_unit = hit_body:unit()

			if not t_contains(ignore_units, hit_unit) then
				hit_u_key = hit_unit:key()

				if not units_hit[hit_u_key] then
					units_hit[hit_u_key] = true
					valid_hit_bodies[#valid_hit_bodies + 1] = hit_body
				end
			end
		end
	end

	local bullet_class = self:bullet_class()
	local fake_ray_dir, fake_ray_dis, hit_base_ext = nil

	for i = 1, #valid_hit_bodies do
		hit_body = valid_hit_bodies[i]
		hit_unit = hit_body:unit()

		local hit_player_pos = hit_unit and hit_unit.camera and hit_unit:camera() and hit_unit:camera().position and hit_unit:camera():position()

		local has_player_los = hit_player_pos and World:raycast("ray", from_pos, hit_player_pos, "slot_mask", slotmask, "ignore_unit", ignore_units)
		
		if not has_player_los then
			fake_ray_dir = hit_body:center_of_mass()
			fake_ray_dis = mvec3_dir(fake_ray_dir, from_pos, fake_ray_dir)
			local hit_pos = hit_body:position()
			local fake_ray = {
				body = hit_body,
				unit = hit_unit,
				ray = fake_ray_dir,
				normal = fake_ray_dir,
				distance = fake_ray_dis,
				position = hit_pos,
				hit_position = hit_pos
			}
			hit_base_ext = hit_unit:base()

			if hit_base_ext and hit_base_ext.is_local_player then
				bullet_class:on_hit_player(fake_ray, self._unit, user_unit, damage)
			else
				bullet_class:on_collision(fake_ray, self._unit, user_unit, damage, self._fires_blanks)
			end
		end
	end

	if target_unit and not shoot_player and not units_hit[target_unit:key()] and target_unit:character_damage() and target_unit:character_damage().build_suppression then
		target_unit:character_damage():build_suppression(tweak_data.weapon[self._name_id].suppression)
	end

	if self._alert_events then
		result.rays = {
			{
				position = from_pos
			}
		}
	end

	return result
end