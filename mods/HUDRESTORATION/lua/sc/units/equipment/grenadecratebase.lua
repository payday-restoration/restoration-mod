if restoration and restoration.Options:GetValue("SC/SCSkills") then

function GrenadeCrateBase:take_grenade(unit)
	if self._empty then
		return
	end
	local can_take_grenade = self:_can_take_grenade() and 1 or 0
	if can_take_grenade == 1 then
		unit:sound():play("pickup_ammo")
		if BlackMarketManager:equipped_grenade() == "wpn_prj_four" then
			managers.player:add_grenade_amount(3)
		elseif BlackMarketManager:equipped_grenade() == "wpn_prj_ace" then
			managers.player:add_grenade_amount(3)
		elseif BlackMarketManager:equipped_grenade() == "wpn_prj_jav" then
			managers.player:add_grenade_amount(2)
		elseif BlackMarketManager:equipped_grenade() == "wpn_prj_hur" then
			managers.player:add_grenade_amount(2)
		elseif BlackMarketManager:equipped_grenade() == "concussion" then
			managers.player:add_grenade_amount(2)
		elseif BlackMarketManager:equipped_grenade() == "wpn_prj_target" then
			managers.player:add_grenade_amount(3)
		else
			managers.player:add_grenade_amount(1)
		end
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)
		managers.player:register_grenade(managers.network:session():local_peer():id())
		self._grenade_amount = self._grenade_amount - 1
		print("Took " .. 1 .. " grenades, " .. self._grenade_amount .. " left")
	end
	if 0 >= self._grenade_amount then
		self:_set_empty()
	end
	self:_set_visual_stage()
	return can_take_grenade
end

end