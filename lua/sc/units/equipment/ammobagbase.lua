--[[
	function AmmoBagBase:setup(ammo_upgrade_lvl, bullet_storm_level)
		self._bullet_storm_level = bullet_storm_level
		self._ammo_amount = tweak_data.upgrades.ammo_bag_base + managers.player:upgrade_value_by_level("ammo_bag", "ammo_increase", ammo_upgrade_lvl)

		self:_set_visual_stage()
--		Log("upgrade level : " .. tostring(ammo_upgrade_lvl))
		if Network:is_server() and self._is_attachable then
			local from_pos = self._unit:position() + self._unit:rotation():z() * 10
			local to_pos = self._unit:position() + self._unit:rotation():z() * -10
			local ray = self._unit:raycast("ray", from_pos, to_pos, "slot_mask", managers.slot:get_mask("world_geometry"))

			if ray then
				self._attached_data = {
					body = ray.body,
					position = ray.body:position(),
					rotation = ray.body:rotation(),
					index = 1,
					max_index = 3
				}

				self._unit:set_extension_update_enabled(Idstring("base"), true)
			end
		end
	end
	--]]
--[[
	function AmmoBagBase:take_ammo(unit)
		if self._empty then
			return false, false
		end
			
		--log("before " .. self._ammo_amount)
			
		local taken = self:_take_ammo(unit)

		if taken > 0 then
			unit:sound():play("pickup_ammo")

			if self._ammo_amount <= 0 then
				taken = 1
			end

			managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, taken)
		end

		if self._ammo_amount <= 0.0005 then
			self:_set_empty()
		else
			self:_set_visual_stage()
		end

		local bullet_storm = false

		if self._bullet_storm_level and self._bullet_storm_level > 0 then
			bullet_storm = self._BULLET_STORM[self._bullet_storm_level] * taken
		end
--		Log("Bullet storm level:" .. tostring(self._bullet_storm_level))
--		log("after " .. self._ammo_amount)

		return taken > 0, bullet_storm
	end
	
	function AmmoBagBase:sync_ammo_taken(amount)
		amount = self:round_value(amount)
		self._ammo_amount = self:round_value(self._ammo_amount - amount)

		if self._ammo_amount <= 0.0005 then
			self:_set_empty()
		else
			self:_set_visual_stage()
		end
	end	
--]]