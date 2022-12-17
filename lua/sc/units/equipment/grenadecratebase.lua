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

--Overkill Grenade Case, Omni-deployable?
GrenadeCrateDeployableBase = GrenadeCrateDeployableBase or class(GrenadeCrateBase)

function GrenadeCrateDeployableBase.spawn(pos, rot)
	local unit_name = "units/pd2_dlc_mxm/equipment/gen_equipment_grenade_crate/gen_equipment_grenade_crate"
	local unit = World:spawn_unit(Idstring(unit_name), pos, rot)

	return unit
end

function GrenadeCrateDeployableBase:init(unit)
	GrenadeCrateDeployableBase.super.init(self, unit, false)
end

function GrenadeCrateDeployableBase:setup()
	self._max_grenade_amount = 4

	GrenadeCrateDeployableBase.super.setup(self)
end

function GrenadeCrateDeployableBase:sync_net_event(event_id, peer)
	if event_id == 1 then
		self:sync_grenade_taken(1)
	else
		self:_set_dynamic()
	end
end

function GrenadeCrateDeployableBase:server_set_dynamic()
	self:_set_dynamic()

	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 2)
	end
end

function GrenadeCrateDeployableBase:take_grenade(unit)
	if self._empty or not self:_can_take_grenade() or not managers.network:session() then
		return
	end

	local max_grenades = managers.player:get_max_grenades()

	unit:sound():play("pickup_ammo")

	local grenade_amount = managers.player:add_grenade_amount(max_grenades, true)

	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)

	self._grenade_amount = self._grenade_amount - 1

	if self._grenade_amount <= 0 then
		self:_set_empty()
	end

	self:_set_visual_stage()

	return grenade_amount
end

function GrenadeCrateDeployableBase:_set_empty()
	self._grenade_amount = 0
	self._empty = true
	local unit = self._unit

	if Network:is_server() or unit:id() == -1 then
		unit:set_slot(0)
	else
		unit:set_visible(false)

		local int_ext = unit:interaction()

		if int_ext then
			int_ext:set_active(false)
		end

		unit:set_enabled(false)
	end
end