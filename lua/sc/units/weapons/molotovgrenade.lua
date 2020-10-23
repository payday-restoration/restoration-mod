function MolotovGrenade:bullet_hit()
end

function MolotovGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local grenade_entry = self._tweak_projectile_entry or "molotov"
	local tweak_env_effect = tweak_data.projectiles[grenade_entry].env_effect or "molotov_fire"
	local data = tweak_data.env_effect[tweak_env_effect]()

	EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, 0, 1)
	self._unit:set_slot(0)
end