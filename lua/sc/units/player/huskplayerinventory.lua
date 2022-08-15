--Dangerous territory
function HuskPlayerInventory._get_weapon_name_from_sync_index(w_index)
	if w_index <= #tweak_data.character.weap_unit_names_orig then
		return tweak_data.character.weap_unit_names_orig[w_index]
	end

	w_index = w_index - #tweak_data.character.weap_unit_names_orig

	HuskPlayerInventory._chk_create_w_factory_indexes()

	local fps_id = PlayerInventory._weapon_factory_indexed[w_index]
	if tweak_data.weapon.factory[fps_id .. "_npc"] then
		return fps_id .. "_npc"
	else
		return fps_id
	end
end