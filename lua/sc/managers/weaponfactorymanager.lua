function WeaponFactoryManager:get_part_desc_by_part_id_from_weapon(part_id, factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local override = self:_get_override_parts(factory_id, blueprint)
	local part = self:_part_data(part_id, factory_id, override)
	local desc_id = part.desc_id or tweak_data.blackmarket.weapon_mods[part_id].desc_id
	local params = {
	BTN_GADGET = managers.localization:btn_macro("weapon_gadget", true),
	BTN_BIPOD = managers.localization:btn_macro("deploy_bipod", true)
	}

	if managers.menu:is_pc_controller() and managers.localization:exists(desc_id .. "_pc")then
			return managers.localization:text(desc_id .. "_pc", params)
		else
			return managers.localization:text(desc_id, params)
		end
	return Application:production_build() and "Add ##desc_id## to ##" .. part_id .. "## in tweak_data.blackmarket.weapon_mods" or ""
end