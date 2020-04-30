function CriminalsManager.set_character_visual_state(unit, character_name, visual_state)
	print("[CriminalsManager.set_character_visual_state]", unit, character_name, inspect(visual_state))

	local is_local_peer = visual_state.is_local_peer
	local visual_seed = visual_state.visual_seed
	local player_style = visual_state.player_style
	local suit_variation = visual_state.suit_variation
	local mask_id = visual_state.mask_id
	local armor_id = visual_state.armor_id
	local armor_skin = visual_state.armor_skin

	if not alive(unit) then
		return
	end

	if _G.IS_VR and unit:camera() then
		return
	end

	if unit:camera() and alive(unit:camera():camera_unit()) and unit:camera():camera_unit():damage() then
		unit = unit:camera():camera_unit()
	end

	local unit_damage = unit:damage()

	if not unit_damage then
		return
	end

	if unit:inventory() and unit:inventory().mask_visibility and not unit:inventory():mask_visibility() then
		mask_id = nil
	end

	local function run_sequence_safe(sequence, sequence_unit)
		if not sequence then
			return
		end

		local sequence_unit_damage = (sequence_unit or unit):damage()

		if sequence_unit_damage and sequence_unit_damage:has_sequence(sequence) then
			sequence_unit_damage:run_sequence_simple(sequence)
		else
			Application:error("[set_character_visual_state] Missing sequence:", sequence, "Character:", character_name, "Unit: ", unit:name())
		end
	end

	local function get_value_string(value)
		return is_local_peer and tostring(value) or "third_" .. tostring(value)
	end

	local time_seed = math.random(os.time())

	math.randomseed(visual_seed)
	math.random()
	math.random()
	math.random()

	local material = managers.blackmarket:character_material_by_character_name(character_name)
	local material_config = material and (is_local_peer and material.fps or material.npc)

	if not is_local_peer and material_config and armor_skin ~= "none" then
		material_config = material_config .. "_cc"
	end

	if material_config then
		unit_damage:set_variable("var_material_config", material_config)
	end

	local body_replacement = tweak_data.blackmarket:get_player_style_value(player_style, character_name, get_value_string("body_replacement")) or {}

	unit_damage:set_variable("var_head_replace", body_replacement.head and 1 or 0)
	unit_damage:set_variable("var_body_replace", body_replacement.body and 1 or 0)
	unit_damage:set_variable("var_hands_replace", body_replacement.hands and 1 or 0)
	unit_damage:set_variable("var_vest_replace", body_replacement.vest and 1 or 0)
	unit_damage:set_variable("var_armor_replace", body_replacement.armor and 1 or 0)

	local material_sequence = managers.blackmarket:character_sequence_by_character_name(character_name)

	run_sequence_safe(material_sequence)

	if not is_local_peer then
		local armor_sequence = tweak_data.blackmarket.armors[armor_id] and tweak_data.blackmarket.armors[armor_id].sequence

		run_sequence_safe(armor_sequence)
	end

	local mask_data = tweak_data.blackmarket.masks[mask_id]

	if not is_local_peer and mask_data then
		if mask_data.skip_mask_on_sequence then
			local mask_off_sequence = managers.blackmarket:character_mask_off_sequence_by_character_name(character_name)

			run_sequence_safe(mask_off_sequence)
		else
			local mask_on_sequence = managers.blackmarket:character_mask_on_sequence_by_character_name(character_name)

			run_sequence_safe(mask_on_sequence)
		end
	end

	if unit:spawn_manager() then
		unit:spawn_manager():remove_unit("char_mesh")

		local unit_name = tweak_data.blackmarket:get_player_style_value(player_style, character_name, get_value_string("unit"))
		local char_mesh_unit = nil

		if unit_name then
			unit:spawn_manager():spawn_and_link_unit("_char_joint_names", "char_mesh", unit_name)

			char_mesh_unit = unit:spawn_manager():get_unit("char_mesh")
		end

		if alive(char_mesh_unit) then
			char_mesh_unit:unit_data().original_material_config = char_mesh_unit:material_config()
			local unit_sequence = tweak_data.blackmarket:get_suit_variation_value(player_style, suit_variation, character_name, get_value_string("sequence"))

			if unit_sequence then
				run_sequence_safe(unit_sequence, char_mesh_unit)
			else
				unit_sequence = tweak_data.blackmarket:get_player_style_value(player_style, character_name, get_value_string("sequence"))

				run_sequence_safe(unit_sequence, char_mesh_unit)
			end

			local variation_material_config = tweak_data.blackmarket:get_suit_variation_value(player_style, suit_variation, character_name, get_value_string("material"))
			local wanted_config_ids = variation_material_config and Idstring(variation_material_config) or char_mesh_unit:unit_data().original_material_config

			if wanted_config_ids and char_mesh_unit:material_config() ~= wanted_config_ids then
				managers.dyn_resource:change_material_config(wanted_config_ids, char_mesh_unit, true)
			end

			char_mesh_unit:set_enabled(unit:enabled())
		end
	end
	
	--Wrist stuff (Thanks Zdann!)
	player_style = tweak_data.blackmarket.player_styles[player_style]
	keep_wrists = player_style.keep_wrists
	
	char_wrist_object = 
	{
		female_1 = "g_arms_female",
		bonnie = "g_arms_female_2",
		sydney = "g_arm_sydney"
	}
	
	wrist_object = unit:get_object(Idstring("g_arms"))
	if char_wrist_object[character_name] then
		wrist_object = unit:get_object(Idstring(char_wrist_object[character_name]))
	end
	if alive(wrist_object) and keep_wrists then
		wrist_object:set_visibility(true)
	end		

	if unit:armor_skin() and unit:armor_skin().set_armor_id then
		unit:armor_skin():set_armor_id(armor_id)
		unit:armor_skin():set_cosmetics_data(armor_skin, true)
	end

	if unit:interaction() then
		unit:interaction():refresh_material()
	end

	if unit:contour() then
		unit:contour():update_materials()
	end

	math.randomseed(time_seed)
	math.random()
	math.random()
	math.random()
end