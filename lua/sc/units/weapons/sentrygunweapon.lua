SentryGunWeapon._AP_ROUNDS_FIRE_RATE = 4 --Overkill can't math. 1/3.5 != 0.25. Multiplies the delay between shots while in AP mode.
SentryGunWeapon._AP_ROUNDS_DAMAGE_MULTIPLIER = 1 --AP Rounds deal no bonus damage.

function SentryGunWeapon:change_ammo(amount)
	self._ammo_total = math.min(math.ceil(self._ammo_total + amount), self._ammo_max)
	local ammo_percent = self._ammo_total / self._ammo_max
	local resolution_step = math.ceil(ammo_percent / self._ammo_sync_resolution)
	log("Ammo: " .. tostring(self._ammo_total))
	if ammo_percent == 0 or resolution_step ~= self._ammo_sync then
		self._ammo_sync = resolution_step

		self._unit:network():send("sentrygun_ammo", self._ammo_sync)

		if self._unit:interaction() then
			self._unit:interaction():set_dirty(true)
		end
	end
end