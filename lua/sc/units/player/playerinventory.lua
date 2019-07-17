if restoration and restoration.Options:GetValue("SC/SC") then
function PlayerInventory:add_unit_by_factory_name(factory_name, equip, instant, blueprint, cosmetics, texture_switches)
	if cosmetics then
		for _,v in pairs(cosmetics) do
			restoration.log_shit("SC: cosmetic string: " .. _ .. " " .. tostring(v))
		end
		restoration.log_shit("SC: cosmetic string: " .. tostring(cosmetics))
	end
	local factory_weapon = tweak_data.weapon.factory[factory_name]
	local ids_unit_name = Idstring(factory_weapon.unit)
	if not managers.dyn_resource:is_resource_ready(Idstring("unit"), ids_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
		managers.dyn_resource:load(Idstring("unit"), ids_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)
	end
	local new_unit = World:spawn_unit(ids_unit_name, Vector3(), Rotation())
	new_unit:base():set_factory_data(factory_name)
	new_unit:base():set_cosmetics_data(cosmetics)
	new_unit:base():set_texture_switches(texture_switches)
	if blueprint then
		new_unit:base():assemble_from_blueprint(factory_name, blueprint)
	else
		new_unit:base():assemble(factory_name)
	end
	local setup_data = {}
	setup_data.user_unit = self._unit
	setup_data.ignore_units = {
		self._unit,
		new_unit
	}
	setup_data.expend_ammo = true
	setup_data.autoaim = true
	setup_data.alert_AI = true
	setup_data.alert_filter = self._unit:movement():SO_access()
	setup_data.timer = managers.player:player_timer()
	if blueprint then
		setup_data.panic_suppression_skill = not managers.weapon_factory:has_perk("silencer", factory_name, blueprint) and managers.player:has_category_upgrade("player", "panic_suppression") or false
	end
	new_unit:base():setup(setup_data)
	self:add_unit(new_unit, equip, instant)
	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun()
	end
end
end