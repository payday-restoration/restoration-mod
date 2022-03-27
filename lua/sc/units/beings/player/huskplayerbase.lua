function HuskPlayerBase:pre_destroy(unit)
	UnitBase.pre_destroy(self, unit) -- if this isn't done at the start of the function, any converts with this husk player as their follow_unit can possibly crash the game, thanks Overkill!

	self._unit:movement():pre_destroy(unit)
	self._unit:inventory():pre_destroy(self._unit)
	managers.groupai:state():unregister_criminal(self._unit)

	if managers.network:session() then
		local peer = managers.network:session():peer_by_unit(self._unit)
		if peer then
			peer:set_unit(nil)
		end
	end
end