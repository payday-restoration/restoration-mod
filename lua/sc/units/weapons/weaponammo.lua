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

	if self:weapon_tweak_data().AMMO_PICKUP then --Filters out npc guns.
		--Precalculate ammo pickup values.
		self._ammo_pickup = {self:weapon_tweak_data().AMMO_PICKUP[1], self:weapon_tweak_data().AMMO_PICKUP[2]} --Get base pickup % values. Make sure these are grabbed individually so you don't accidentally pass in the table by reference.
		local total_ammo = self:weapon_tweak_data().AMMO_MAX * (tweak_data.weapon[self._name_id].use_data.selection_index == 1 and 2 or 1)  --Total ammo used in pickup calcs as if the weapon was a primary. Double this if it's a secondary. 7200/total_ammo used as proxy for damage, so avoid adding mods that change this on underbarrels.

		--Pickup multiplier
		local pickup_multiplier = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1) --Skills
			* managers.player:upgrade_value("player", "fully_loaded_pick_up_multiplier", 1)
			* (1 / managers.player:upgrade_value("player", "extra_ammo_multiplier", 1)) --Compensate for fully loaded bonus ammo.

		--Set actual pickup values. Use ammo_pickup = (base% - exponent*sqrt(damage)) * pickup_multiplier * total_ammo.
		self._ammo_pickup[1] = (self._ammo_pickup[1] + tweak_data.weapon.stats.pickup_exponents.min * math.sqrt(7200/total_ammo)) * pickup_multiplier * total_ammo
		self._ammo_pickup[2] = math.max((self._ammo_pickup[2] + tweak_data.weapon.stats.pickup_exponents.max * math.sqrt(7200/total_ammo)) * pickup_multiplier * total_ammo, self._ammo_pickup[1])
	end
end

--Ensures that ensures that OICW magazine size increases don't result in broken decimal values.
function WeaponAmmo:calculate_ammo_max_per_clip()
	local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX + (self._extra_ammo or 0)
	ammo = ammo * managers.player:upgrade_value(self._name_id, "clip_ammo_increase", 1)
	if not self:upgrade_blocked("weapon", "clip_ammo_increase") then
		ammo = ammo * managers.player:upgrade_value("weapon", "clip_ammo_increase", 1)
	end
	if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "clip_ammo_increase") then
		ammo = ammo * managers.player:upgrade_value(tweak_data.weapon[self._name_id].category, "clip_ammo_increase", 1)
	end
	ammo = math.floor(ammo)
	return ammo
end

--Makes sentries take a fixed amount of ammo.
function WeaponAmmo:remove_ammo(percent)
	local total_ammo = self:get_ammo_total()
	local max_ammo = self:get_ammo_max()
	local ammo = math.max(math.floor(total_ammo - max_ammo * percent), 0)

	self:set_ammo_total(ammo)

	local ammo_in_clip = self:get_ammo_remaining_in_clip()

	if self:get_ammo_total() < ammo_in_clip then
		self:set_ammo_remaining_in_clip(ammo)
	end

	return total_ammo - ammo
end