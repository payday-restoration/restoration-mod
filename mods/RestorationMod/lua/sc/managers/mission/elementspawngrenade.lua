function ElementSpawnGrenade:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	if self._values.grenade_type == "frag" then
		ProjectileBase.throw_projectile("frag", self._values.position, self._values.spawn_dir * self._values.strength)
	end
	
	if self._values.grenade_type == "molotov" then
		ProjectileBase.throw_projectile("molotov", self._values.position, self._values.spawn_dir * self._values.strength)
	end
	
	if self._values.grenade_type == "fir_com" then
		ProjectileBase.throw_projectile("fir_com", self._values.position, self._values.spawn_dir * self._values.strength)
	end	
	
	ElementSpawnGrenade.super.on_executed(self, instigator)
end