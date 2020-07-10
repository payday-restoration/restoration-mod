--Used for underbarrel grenade launcher pickup (IE: On The Little Friend).
function WeaponAmmo:replenish()
	local ammo_max_multiplier = managers.player:upgrade_value("player", "extra_ammo_multiplier", 1)

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		ammo_max_multiplier = ammo_max_multiplier * managers.player:upgrade_value(category, "extra_ammo_multiplier", 1)
	end

	ammo_max_multiplier = managers.modifiers:modify_value("WeaponBase:GetMaxAmmoMultiplier", ammo_max_multiplier)
	local ammo_max_per_clip = self:calculate_ammo_max_per_clip()
	local ammo_max = math.round((self:weapon_tweak_data().AMMO_MAX + managers.player:upgrade_value(self._name_id, "clip_amount_increase") * ammo_max_per_clip) * ammo_max_multiplier)
	ammo_max_per_clip = math.min(ammo_max_per_clip, ammo_max)

	self:set_ammo_max(ammo_max)
	self:set_ammo_max_per_clip(ammo_max_per_clip)
	self:set_ammo_total(ammo_max)
	self:set_ammo_remaining_in_clip(ammo_max_per_clip)


	--Precalculate ammo pickup values.
	self._ammo_pickup = {self:weapon_tweak_data().AMMO_PICKUP[1], self:weapon_tweak_data().AMMO_PICKUP[2]} --Get base pickup % values. Make sure these are grabbed individually so you don't accidentally pass in the table by reference.
	local total_ammo = self:weapon_tweak_data().AMMO_MAX * (tweak_data.weapon[self._name_id].use_data.selection_index == 1 and 2 or 1) --Total ammo as if the weapon was a primary. 7200/total_ammo used as proxy for damage. Avoid adding mods that change this.

	--Pickup multiplier
	local pickup_multiplier = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1) --Skills
		* managers.player:upgrade_value("player", "fully_loaded_pick_up_multiplier", 1)

	--Set actual pickup values. Use ammo_pickup = (base% - exponent*sqrt(damage)) * pickup_multiplier * total_ammo.
	self._ammo_pickup[1] = (self._ammo_pickup[1] + tweak_data.weapon.stats.pickup_exponents.min * math.sqrt(7200/total_ammo)) * pickup_multiplier * total_ammo
	self._ammo_pickup[2] = math.max((self._ammo_pickup[2] + tweak_data.weapon.stats.pickup_exponents.max * math.sqrt(7200/total_ammo)) * pickup_multiplier * total_ammo, self._ammo_pickup[1])

	log("Pickup = " .. tostring(self._ammo_pickup[1]) .. " - " .. tostring(self._ammo_pickup[2]))
end