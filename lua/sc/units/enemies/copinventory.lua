function CopInventory:add_unit_by_name(new_unit_name, equip)
	managers.dyn_resource:load(Idstring("unit"), new_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE)

	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())

	managers.mutators:modify_value("CopInventory:add_unit_by_name", self)
	self:_chk_spawn_shield(new_unit)

	local setup_data = {
		user_unit = self._unit,
		ignore_units = {
			self._unit,
			new_unit,
			self._shield_unit
		},
		expend_ammo = false,
		hit_slotmask = managers.slot:get_mask("bullet_impact_targets"),
		hit_player = true,
		user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice,
		alert_AI = true,
		alert_filter = self._unit:brain():SO_access()
	}

	new_unit:base():setup(setup_data)

	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun(new_unit_name)
	end

	self:add_unit(new_unit, equip)	
end

-- Add left hand align place for akimbo weapons
Hooks:PostHook(CopInventory, "init", "sh_init", function (self)
	self._align_places.left_hand = self._align_places.left_hand or {
		on_body = true,
		obj3d_name = Idstring("a_weapon_left_front")
	}
end)