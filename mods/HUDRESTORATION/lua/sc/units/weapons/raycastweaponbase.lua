if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local init_original = RaycastWeaponBase.init
	local setup_original = RaycastWeaponBase.setup

	function RaycastWeaponBase:init(...)
		init_original(self, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)
	end

	function RaycastWeaponBase:setup(...)
		setup_original(self, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(16)
	end

	local multiplier_table = {
		phalanx_vip = 0.05,
		phalanx_minion = 0.05,
		shield = 0.6,
	}

	local _fire_raycast_original = _fire_raycast_original or RaycastWeaponBase._fire_raycast
	local on_collision_original = on_collision_original or InstantBulletBase.on_collision
	local current_penetration_multiplier = 1

	function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
		if not shoot_through_data then
			current_penetration_multiplier = 1
		end
	
		return _fire_raycast_original(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	end

	function InstantBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, ...)
		if current_penetration_multiplier == 1 and alive(user_unit) and user_unit == managers.player:player_unit() then
			local unit = col_ray.unit
			if unit:in_slot(8) and weapon_unit:base()._can_shoot_through_shield and alive(unit:parent()) and unit:parent():base() then
				current_penetration_multiplier = multiplier_table[unit:parent():base()._tweak_table] or 1
			end
		end
		
		return on_collision_original(self, col_ray, weapon_unit, user_unit, damage * current_penetration_multiplier, ...)
	end

end

if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
		local _add_ammo = function(ammo_base, ratio, add_amount_override)
			if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
				return false, 0
			end
			local multiplier_min = 1
			local multiplier_max = 1
			local ammo_min = ammo_base._ammo_data and ammo_base._ammo_data.ammo_pickup_min_mul
			local ammo_max = ammo_base._ammo_data and ammo_base._ammo_data.ammo_pickup_max_mul
			if ammo_min then
				multiplier_min = multiplier_min * ammo_min
			end
			multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_min = multiplier_min * managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1)
			
			if ammo_max then
				multiplier_max = multiplier_max * ammo_max
			end
			multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_max = multiplier_max * managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1)
			
			local add_amount = add_amount_override
			local picked_up = true

			if not add_amount then
				local rng_ammo = math.lerp(ammo_base._ammo_pickup[1] * multiplier_min, ammo_base._ammo_pickup[2] * multiplier_max, math.random())
				picked_up = rng_ammo > 0
				add_amount = math.max(0, math.round(rng_ammo))
			end
			add_amount = math.floor(add_amount * (ratio or 1))
			ammo_base:set_ammo_total(math.clamp(ammo_base:get_ammo_total() + add_amount, 0, ammo_base:get_ammo_max()))
			return picked_up, add_amount
		end
		local picked_up, add_amount
		picked_up, add_amount = _add_ammo(self, ratio, add_amount_override)
		for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
			if gadget and gadget.ammo_base then
				local p, a = _add_ammo(gadget:ammo_base(), ratio, add_amount_override)
				picked_up = p or picked_up
				add_amount = add_amount + a
			end
		end
		return picked_up, add_amount
	end

	function RaycastWeaponBase:clip_full()
		if tweak_data.weapon[self._name_id].tactical_reload == true then
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 1
		elseif tweak_data.weapon[self._name_id].tactical_akimbo == true then
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip() + 2
		else
			return self:get_ammo_remaining_in_clip() == self:get_ammo_max_per_clip()
		end
	end
	
	function RaycastWeaponBase:can_reload()
		if tweak_data.weapon[self._name_id].uses_clip == true and ( (self:get_ammo_max_per_clip() == tweak_data.weapon[self._name_id].clip_capacity and self:get_ammo_remaining_in_clip() > 0 ) or self:get_ammo_remaining_in_clip() > self:get_ammo_max_per_clip() - tweak_data.weapon[self._name_id].clip_capacity) then
			return false
		elseif self:get_ammo_total() > self:get_ammo_remaining_in_clip() then
			return true
		end
	end
	
	function RaycastWeaponBase:on_reload()
		local ammo_base = self._reload_ammo_base or self:ammo_base()
		if self:get_ammo_remaining_in_clip() > 0 and tweak_data.weapon[self._name_id].tactical_reload == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif self:get_ammo_remaining_in_clip() > 1 and tweak_data.weapon[self._name_id].tactical_akimbo == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 2))
		elseif self:get_ammo_remaining_in_clip() == 1 and tweak_data.weapon[self._name_id].tactical_akimbo == true then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip() + 1))
		elseif tweak_data.weapon[self._name_id].uses_clip == true and self:get_ammo_remaining_in_clip() <= self:get_ammo_max_per_clip()  then
			self:set_ammo_remaining_in_clip(math.min(self:get_ammo_total(), self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + tweak_data.weapon[self._name_id].clip_capacity))
		elseif self._setup.expend_ammo then
			ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), ammo_base:get_ammo_max_per_clip()))
		else
			ammo_base:set_ammo_remaining_in_clip(ammo_base:get_ammo_max_per_clip())
			ammo_base:set_ammo_total(ammo_base:get_ammo_max_per_clip())
		end
		managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
		self._reload_ammo_base = nil
	end

	local raycast_current_damage_orig = RaycastWeaponBase._get_current_damage
	function RaycastWeaponBase:_get_current_damage(dmg_mul)
	   if self._ammo_data and (self._ammo_data.bullet_class == "InstantExplosiveBulletBase") then
 	       dmg_mul = dmg_mul / managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
  	   end
  	   return raycast_current_damage_orig(self, dmg_mul)
	end

end