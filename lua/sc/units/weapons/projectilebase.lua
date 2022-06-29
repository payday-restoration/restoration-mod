local mvec1 = Vector3()
local mvec2 = Vector3()
local mrot1 = Rotation()

function ProjectileBase:update(unit, t, dt)
	if not self._simulated and not self._collided then
		self._unit:m_position(mvec1)
		mvector3.set(mvec2, self._velocity * dt)
		mvector3.add(mvec1, mvec2)
		self._unit:set_position(mvec1)

		if self._orient_to_vel then
			mrotation.set_look_at(mrot1, mvec2, math.UP)
			self._unit:set_rotation(mrot1)
		end

		self._velocity = Vector3(self._velocity.x, self._velocity.y, self._velocity.z - 980 * dt)
	end

	if self._sweep_data and not self._collided then
		self._unit:m_position(self._sweep_data.current_pos)

		local col_ray = nil
		local ignore_units = {}

		if alive(self._thrower_unit) then
			--to avoid colliding with the thrower, this prevents NPCs from hitting themselves with the projectile when launching it, along with player husks when FF is enabled
			table.insert(ignore_units, self._thrower_unit)

			--if the thrower has a shield equipped, ignore it as well (pretty important, even if the shield throw animation is used and the throw is timed, a collision can still easily happen)
			if alive(self._thrower_unit:inventory() and self._thrower_unit:inventory()._shield_unit) then
				table.insert(ignore_units, self._thrower_unit:inventory()._shield_unit)
			end
		end

		if #ignore_units > 0 then
			col_ray = World:raycast("ray", self._sweep_data.last_pos, self._sweep_data.current_pos, "slot_mask", self._sweep_data.slot_mask, "ignore_unit", ignore_units) --prevent husks from hitting themselves with RPGs/grenade launchers
		else
			col_ray = World:raycast("ray", self._sweep_data.last_pos, self._sweep_data.current_pos, "slot_mask", self._sweep_data.slot_mask)
		end

		if self._draw_debug_trail then
			Draw:brush(Color(1, 0, 0, 1), nil, 3):line(self._sweep_data.last_pos, self._sweep_data.current_pos)
		end

		if col_ray and col_ray.unit then
			mvector3.direction(mvec1, self._sweep_data.last_pos, self._sweep_data.current_pos)
			mvector3.add(mvec1, col_ray.position)
			self._unit:set_position(mvec1)
			self._unit:set_position(mvec1)

			if self._draw_debug_impact then
				Draw:brush(Color(0.5, 0, 0, 1), nil, 10):sphere(col_ray.position, 4)
				Draw:brush(Color(0.5, 1, 0, 0), nil, 10):sphere(self._unit:position(), 3)
			end

			col_ray.velocity = self._unit:velocity()
			self._collided = true

			self:_on_collision(col_ray)
		end

		self._unit:m_position(self._sweep_data.last_pos)
	end
end

function ProjectileBase:create_sweep_data()
	self._sweep_data = {
		slot_mask = self._slot_mask
	}

	if Global.game_settings and Global.game_settings.one_down then
		self._sweep_data.slot_mask = self._sweep_data.slot_mask + 3
	else
		self._sweep_data.slot_mask = managers.mutators:modify_value("ProjectileBase:create_sweep_data:slot_mask", self._sweep_data.slot_mask)
		self._sweep_data.slot_mask = managers.modifiers:modify_value("ProjectileBase:create_sweep_data:slot_mask", self._sweep_data.slot_mask)
	end

	self._sweep_data.current_pos = self._unit:position()
	self._sweep_data.last_pos = mvector3.copy(self._sweep_data.current_pos)
end

-- Fuck it
function ProjectileBase.check_time_cheat(projectile_type, owner_peer_id)
	return true
end


function ProjectileBase:throw(params)
	self._owner = params.owner
	local velocity = params.dir
	local adjust_z = 50
	local launch_speed = 250
	local push_at_body_index = 0

	self._unit:body(0):set_collision_script_filter(0) --This stops "impact" detonation explosives from bouncing first when shooting close-by surfaces

	if params.projectile_entry and tweak_data.projectiles[params.projectile_entry] then
		adjust_z = tweak_data.projectiles[params.projectile_entry].adjust_z or adjust_z
		launch_speed = tweak_data.projectiles[params.projectile_entry].launch_speed or launch_speed
		push_at_body_index = tweak_data.projectiles[params.projectile_entry].push_at_body_index
	end
	velocity = velocity * launch_speed
	velocity = Vector3(velocity.x, velocity.y, velocity.z + adjust_z)
	local mass_look_up_modifier = self._mass_look_up_modifier or 2
	local mass = math.max(mass_look_up_modifier * (1 + math.min(0, params.dir.z)), 1)

	if self._simulated then
		if push_at_body_index then
			self._unit:push_at(mass, velocity, self._unit:body(push_at_body_index):center_of_mass())
		else
			self._unit:push_at(mass, velocity, self._unit:position())
		end
	else
		self._velocity = velocity
	end

	if params.projectile_entry and tweak_data.blackmarket.projectiles[params.projectile_entry] then
		local tweak_entry = tweak_data.blackmarket.projectiles[params.projectile_entry]
		local physic_effect = tweak_entry.physic_effect

		if physic_effect then
			World:play_physic_effect(physic_effect, self._unit)
		end

		if tweak_entry.add_trail_effect then
			self:add_trail_effect(tweak_entry.add_trail_effect)
		end

		local unit_name = tweak_entry.sprint_unit

		if unit_name then
			local new_dir = Vector3(params.dir.y * -1, params.dir.x, params.dir.z)
			local sprint = World:spawn_unit(Idstring(unit_name), self._unit:position() + new_dir * 50, self._unit:rotation())
			local rot = Rotation(params.dir, math.UP)

			mrotation.x(rot, mvec1)
			mvector3.multiply(mvec1, 0.15)
			mvector3.add(mvec1, new_dir)
			mvector3.add(mvec1, math.UP / 2)
			mvector3.multiply(mvec1, 100)
			sprint:push_at(mass, mvec1, sprint:position())
		end

		self:set_projectile_entry(params.projectile_entry)
	end
end

-- Load npc throwables dynamically
local unit_ids = Idstring("unit")
Hooks:PreHook(ProjectileBase, "throw_projectile_npc", "sh_throw_projectile_npc", function (projectile_type)
	local tweak_entry = tweak_data.blackmarket.projectiles[projectile_type]
	local unit_name = Idstring(not Network:is_server() and tweak_entry.local_unit or tweak_entry.unit)
	if not PackageManager:has(unit_ids, unit_name) then
		managers.dyn_resource:load(unit_ids, unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)
	end
end)