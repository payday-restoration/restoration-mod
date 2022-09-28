Hooks:PostHook(SmallLootBase, "take", "res_take", function(self)
	if not self._empty and not Network:is_server() then
		self:_set_empty() -- hide on pickup
	end
end)

function SmallLootBase:_set_empty()
	self._empty = true

	if not self.skip_remove_unit then
		if Network:is_server() or self._unit:id() == -1 then
			self._unit:set_slot(0)
		else
			-- clients don't have the authority to remove network synced units
			if self._unit:interaction() then
				self._unit:interaction():set_active(false)
			end

			self._unit:set_enabled(false)
		end
	end
end
