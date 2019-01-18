if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	function AmmoBagBase:take_ammo(unit)
		if self._empty then
			return false, false
		end

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

end