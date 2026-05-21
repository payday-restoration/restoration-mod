function MenuComponentManager:make_color_text(text_object, resource_color)
	local text = text_object:text()
	local start_ci, end_ci, first_ci = nil

	if resource_color then
		local text_dissected = utf8.characters(text)
		local idsp = Idstring("#")
		start_ci = {}
		end_ci = {}
		first_ci = true

		for i, c in ipairs(text_dissected) do
			if Idstring(c) == idsp then
				local next_c = text_dissected[i + 1]

				if next_c and Idstring(next_c) == idsp then
					if first_ci then
						table.insert(start_ci, i)
					else
						table.insert(end_ci, i)
					end

					first_ci = not first_ci
				end
			end
		end

		if #start_ci == #end_ci then
			for i = 1, #start_ci do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end

		text = string.gsub(text, "##", "")
	end

	text_object:set_text(text)
	text_object:clear_range_color(1, utf8.len(text))

	if resource_color then
		text_object:clear_range_color(1, utf8.len(text))

		if #start_ci ~= #end_ci then
			Application:error("BlackMarketGui: Missing ##'s in :set_info_text() string!", id, new_string, #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				text_object:set_range_color(start_ci[i], end_ci[i], type(resource_color) == "table" and (resource_color[i] or tweak_data.screen_colors.skill_color) or (resource_color or tweak_data.screen_colors.skill_color))
			end
		end
	end
end

function MenuComponentManager:create_melee_status_icon_list(melee_weapon)
	local icon_list = {}
	local melee_data = tweak_data.blackmarket.melee_weapons[melee_weapon]
	local special_weapon = melee_data and melee_data.special_weapon

	if not melee_data then
		return icon_list
	end

	local shock_weapon = special_weapon == "taser" or special_weapon == "mjolnir"
	local explosive_weapon = special_weapon == "caber" or special_weapon == "megumin"
	local jackpot_weapon = special_weapon == "hyper_crit"
	local flashlight = melee_data.flashlight
	local headshot_weapon = melee_data.headshot_damage_multiplier and melee_data.headshot_damage_multiplier > 1
	local backstab_weapon = melee_data.backstab_damage_multiplier and melee_data.backstab_damage_multiplier > 1
	local defensive_weapon = melee_data.block
	local parry_weapon = melee_data.counter_damage
	local charger_weapon = special_weapon == "charger"
	local chainsaw_weapon = not charger_weapon and melee_data.chainsaw
	local panic_weapon = special_weapon == "panic"
	local fire_weapon = false
	local poison_weapon = false
	local bleed_weapon = false

	local function check_dot(dot_name)
		if dot_name then
			local dot_data = tweak_data.dot:get_dot_data(dot_name)
			fire_weapon = fire_weapon or dot_data.variant == "fire"
			poison_weapon = poison_weapon or dot_data.variant == "poison"
			bleed_weapon = bleed_weapon or dot_data.variant == "bleed"
			--log(tostring( dot_name ) .. " <name variant> " .. tostring( dot_data.variant ))
		end
	end

	if melee_data.random_special_effects then
		for _, effect in ipairs(melee_data.random_special_effects) do
			--log(tostring( melee_weapon ))
			shock_weapon = shock_weapon or effect.tase_data

			check_dot(effect.dot_data_name)
		end
	else
		check_dot(melee_data.dot_data_name)
	end

	if shock_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/inv_mod_ammo_electric")
	end

	if fire_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/inv_mod_ammo_dragons_breath")
	end

	if poison_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/inv_mod_ammo_poison")
	end

	if bleed_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/inv_mod_ammo_bleed")
	end

	if explosive_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/inv_mod_ammo_explosive")
	end

	if defensive_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_defense")
	end

	if parry_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_parry")
	end

	if panic_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_panic")
	end

	if flashlight then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/inv_mod_flashlight")
	end

	if headshot_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_headshot")
	end

	if charger_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_charger")
	end

	if chainsaw_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_chainsaw")
	end

	if backstab_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_backstab")
	end

	if jackpot_weapon then
		table.insert(icon_list, "guis/textures/pd2/blackmarket/melee_jackpot")
	end

	return icon_list
end