--Used for underbarrel grenade launcher pickup (IE: On The Little Friend).
local is_pro = Global.game_settings and Global.game_settings.one_down
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
	if self:weapon_tweak_data().AMMO_PICKUP then
		self._ammo_pickup = {self:weapon_tweak_data().AMMO_PICKUP[1], self:weapon_tweak_data().AMMO_PICKUP[2]} --Get base gun ammo pickup.

		--Pickup multiplier from skills.
		local pickup_multiplier = managers.player:upgrade_value("player", "fully_loaded_pick_up_multiplier", 1)
		if not is_pro then
			pickup_multiplier = pickup_multiplier * managers.player:upgrade_value("player", "passive_pick_up_multiplier", 1)
		end


		--Apply multiplier from skills and ammo.
		self._ammo_pickup[1] = self._ammo_pickup[1] * pickup_multiplier
		self._ammo_pickup[2] = self._ammo_pickup[2] * pickup_multiplier
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
	ammo = math.round(ammo)
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