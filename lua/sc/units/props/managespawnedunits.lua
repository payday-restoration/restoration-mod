function ManageSpawnedUnits:spawn_unit(unit_id, align_obj_name, unit)
	local align_obj = self._unit:get_object(Idstring(align_obj_name))
	local spawn_unit = nil

	if self._unit.base and self._unit:base() and self._unit:base().nick_name then
		log("Adding outfit to: " .. self._unit:base():nick_name())
	else
		log("Adding outfit to unknown character.")
	end

	if type_name(unit) == "string" then
		log("Outfit: " .. unit)
		if Network:is_server() or self.allow_client_spawn then
			local spawn_pos = align_obj:position()

			if not spawn_pos then
				log("spawn_pos is nil, aborting")
				return
			end

			local spawn_rot = align_obj:rotation()

			if not spawn_rot then
				log("spawn_rot is nil, aborting")
				return
			end
			spawn_unit = safe_spawn_unit(Idstring(unit), spawn_pos, spawn_rot)
			if not spawn_unit then
				log("Outfit not loaded, aborting?")
				log("No clue what happens after this.")
				return
			end
			spawn_unit:unit_data().parent_unit = self._unit
		end
	else
		log("Outfit not passed in as string, trying to use data directly (probably bad)")
		spawn_unit = unit
	end

	if not spawn_unit then
		log("No unit to spawn, returning")
		return
	end

	log("Attempting link")
	self._unit:link(Idstring(align_obj_name), spawn_unit, spawn_unit:orientation_object():name())
	log("Link complete")

	log("Adding countours")
	local contour_ext = self._unit:contour()
	local spawned_contour_ext = spawn_unit:contour()

	if contour_ext and spawned_contour_ext then
		for _, contour in ipairs(contour_ext:contour_list()) do
			spawned_contour_ext:add(contour.type, nil, nil, contour.color)
		end
	end
	log("Contours added")

	log("Adding unit entry to table")
	local unit_entry = {
		align_obj_name = align_obj_name,
		unit = spawn_unit
	}
	self._spawned_units[unit_id] = unit_entry

	if Network:is_server() and not self.local_only then
		log("Syncing unit to clients")
		managers.network:session():send_to_peers_synched("sync_unit_spawn", self._unit, spawn_unit, align_obj_name, unit_id, "spawn_manager")
	end
end