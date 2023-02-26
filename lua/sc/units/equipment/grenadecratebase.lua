function GrenadeCrateBase:take_grenade(unit)
	if self._empty then
		return
	end

	local can_take_grenade = self:_can_take_grenade() and 1 or 0

	if can_take_grenade == 1 then
		unit:sound():play("pickup_ammo")
		--Guarantees a fill up
		managers.player:add_grenade_amount(21)
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)
		managers.player:register_grenade(managers.network:session():local_peer():id())

		self._grenade_amount = self._grenade_amount - 1

		print("Took " .. 1 .. " grenades, " .. self._grenade_amount .. " left")
	end

	if self._grenade_amount <= 0 then
		self:_set_empty()
	end

	self:_set_visual_stage()

	return can_take_grenade
end

--Overkill Grenade Case
function GrenadeCrateDeployableBase:setup()
	self._max_grenade_amount = 4
	
	GrenadeCrateDeployableBase.super.setup(self)
end

function GrenadeCrateDeployableBase:take_grenade(unit)
	local inventory = unit:inventory()

	local can_take = self:_can_take_grenade() or inventory:need_ammo()

	if self._empty or not can_take or not managers.network:session() then
		return
	end

	unit:sound():play("pickup_ammo")

	local grenade_amount = (managers.blackmarket:equipped_grenade_allows_pickups() and managers.player:add_grenade_amount(1, true)) or nil

	--So you take some ammo back too
	if inventory then
		for id, weapon in pairs(inventory:available_selections()) do
			local took = self:round_value(weapon.unit:base():add_ammo_from_bag(0.25))
			managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
		end
	end
	
	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)

	self._grenade_amount = self._grenade_amount - 1

	if self._grenade_amount <= 0 then
		self:_set_empty()
	end

	self:_set_visual_stage()

	return grenade_amount
end

local dec_mul = 10000
function GrenadeCrateDeployableBase:round_value(val)
	return math.floor(val * dec_mul) / dec_mul
end