function ElementSpawnGrenade:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	if self._values.grenade_type == "frag" then
		ProjectileBase.throw_projectile(1, self._values.position, self._values.spawn_dir * self._values.strength)
	end
	
	if self._values.grenade_type == "molotov" then
		ProjectileBase.throw_projectile(4, self._values.position, self._values.spawn_dir * self._values.strength)
	end
	
	if self._values.grenade_type == "fir_com" then
		ProjectileBase.throw_projectile(38, self._values.position, self._values.spawn_dir * self._values.strength)
	end	
	
	ElementSpawnGrenade.super.on_executed(self, instigator)
end