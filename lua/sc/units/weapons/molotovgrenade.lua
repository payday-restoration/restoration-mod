--Lets mollies use the "mass_look_up_modifier" stat
function MolotovGrenade:_setup_from_tweak_data()
	local grenade_entry = self._tweak_projectile_entry or "molotov"
	local tweak_entry = tweak_data.projectiles[grenade_entry]

	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	
	--No reason to set anything else other than mass_look_up_modifier so no return
	--return tweak_entry
end

--Prevent grenades from being detonated by being shot.
--TODO: Implement the ability to set whether this function should fire via tweakdata, and allow clients to trigger it without desyncing.
function MolotovGrenade:bullet_hit()
end

--Allow for the env effect to be changed based on the specific grenade thrown, rather than using one size fits all.
function MolotovGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local grenade_entry = self._tweak_projectile_entry or "molotov"
	local tweak_env_effect = tweak_data.projectiles[grenade_entry].env_effect or "molotov_fire"
	local data = tweak_data.env_effect[tweak_env_effect]()

	EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, 0, 1)
	self._unit:set_slot(0)
end