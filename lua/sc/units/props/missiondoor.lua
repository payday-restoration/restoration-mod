function MissionDoor:_initiate_c4_sequence()
	for type, device in pairs(self._devices) do
		if type ~= "c4" then
			for _, unit_data in ipairs(device.units) do
				if alive(unit_data.unit) then
					unit_data.unit:set_slot(0)
				end
			end
		end
	end

	for _, unit_data in ipairs(self._devices.c4.units) do
		MissionDoor.run_mission_door_device_sequence(unit_data.unit, "activate_explode_sequence")

		if managers.network:session() then
			managers.network:session():send_to_peers_synched("run_mission_door_device_sequence", unit_data.unit, "activate_explode_sequence")
		end
	end

	self._explode_t = Application:time() + 2

	self._unit:set_extension_update_enabled(Idstring("base"), true)
end