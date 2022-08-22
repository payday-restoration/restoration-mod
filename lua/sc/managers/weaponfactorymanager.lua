--Gets any animation weights from attachments (vertical grip, drum mag, etc)
function WeaponFactoryManager:get_animation_weights_from_weapon(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local t = {}

	for _, id in ipairs(self:get_assembled_blueprint(factory_id, blueprint)) do
		local part = self:_part_data(id, factory_id)

		if part.fps_animation_weight then
			t[id] = part.fps_animation_weight
		end
	end

	return t
end


function WeaponFactoryManager:get_weapon_id_by_factory_id(factory_id)
	local factory = tweak_data.weapon.factory
	local real_factory_id = factory[factory_id] and factory[factory_id].real_factory_id
	if real_factory_id then
		factory_id = real_factory_id
	end

	local upgrade = managers.upgrades:weapon_upgrade_by_factory_id(factory_id)


	if not upgrade then
		Application:error("[WeaponFactoryManager:get_weapon_id_by_factory_id] Found no upgrade for factory id", factory_id)

		return
	end

	return upgrade.weapon_id
end