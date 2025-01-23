table.insert(WeaponDescription._stats_shown, {
	name = "swap_speed"
})

table.insert(WeaponDescription._stats_shown, {
	name = "standing_range"
})

table.insert(WeaponDescription._stats_shown, {
	name = "moving_range"
})

table.insert(WeaponDescription._stats_shown, {
	name = "pickup"
})

table.insert(WeaponDescription._stats_shown, {
	name = "damage_min"
})
table.insert(WeaponDescription._stats_shown, {
	name = "ads_speed"
})


local per_pellet = true--restoration and restoration.Options:GetValue("OTHER/WeaponHandling/PerPelletShotguns") 

--Add support for .reload_speed_multiplier
function WeaponDescription._get_base_stats(name)
	local base_stats = {}
	local index = nil
	local tweak_stats = tweak_data.weapon.stats
	local modifier_stats = tweak_data.weapon[name].stats_modifiers

	for _, stat in pairs(WeaponDescription._stats_shown) do
		base_stats[stat.name] = {}

		if stat.name == "magazine" then
			base_stats[stat.name].index = 0
			base_stats[stat.name].value = tweak_data.weapon[name].CLIP_AMMO_MAX
		elseif stat.name == "totalammo" then
			index = math.clamp(tweak_data.weapon[name].stats.total_ammo_mod, 1, #tweak_stats.total_ammo_mod)
			base_stats[stat.name].index = tweak_data.weapon[name].stats.total_ammo_mod
			base_stats[stat.name].value = tweak_data.weapon[name].AMMO_MAX
		elseif stat.name == "fire_rate" then
			local fire_rate = 60 * (tweak_data.weapon[name].fire_rate_multiplier or 1) / tweak_data.weapon[name].fire_mode_data.fire_rate
			base_stats[stat.name].value = fire_rate / 10 * 10
		elseif stat.name == "reload" then
			index = math.clamp(tweak_data.weapon[name].stats[stat.name], 1, #tweak_stats[stat.name])
			base_stats[stat.name].index = tweak_data.weapon[name].stats[stat.name]
			local reload_time = managers.blackmarket:get_reload_time(name) / (tweak_data.weapon[name].reload_speed_multiplier or 1)
			local mult = 1 / tweak_data.weapon.stats[stat.name][index]
			base_stats[stat.name].value = reload_time * mult
		elseif tweak_stats[stat.name] then
			index = math.clamp(tweak_data.weapon[name].stats[stat.name], 1, #tweak_stats[stat.name])
			base_stats[stat.name].index = index
			base_stats[stat.name].value = stat.index and index or tweak_stats[stat.name][index] * tweak_data.gui.stats_present_multiplier
			local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

			if stat.offset then
				base_stats[stat.name].value = base_stats[stat.name].value - offset
			end

			if stat.revert then
				local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					max_stat = max_stat - offset
				end

				base_stats[stat.name].value = max_stat - base_stats[stat.name].value
			end

			if modifier_stats and modifier_stats[stat.name] then
				local mod = modifier_stats[stat.name]

				if stat.revert and not stat.index then
					local real_base_value = tweak_stats[stat.name][index]
					local modded_value = real_base_value * mod
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

					if stat.offset then
						modded_value = modded_value - offset
					end

					local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

					if stat.offset then
						max_stat = max_stat - offset
					end

					local new_value = (max_stat - modded_value) * tweak_data.gui.stats_present_multiplier

					if mod ~= 0 and (tweak_stats[stat.name][1] < modded_value or modded_value < tweak_stats[stat.name][#tweak_stats[stat.name]]) then
						new_value = (new_value + base_stats[stat.name].value / mod) / 2
					end

					base_stats[stat.name].value = new_value
				else
					base_stats[stat.name].value = base_stats[stat.name].value * mod
				end
			end

			if stat.percent then
				local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

				if stat.offset then
					max_stat = max_stat - offset
				end

				local ratio = base_stats[stat.name].value / max_stat
				base_stats[stat.name].value = ratio * 100
			end
		end
	end

	return base_stats
end

function WeaponDescription._get_skill_stats(name, category, slot, base_stats, mods_stats, silencer, single_mod, auto_mod, blueprint)
	local skill_stats = {}
	local tweak_stats = tweak_data.weapon.stats
	for _, stat in pairs(WeaponDescription._stats_shown) do
		skill_stats[stat.name] = {}
		skill_stats[stat.name].value = 0
	end
	local detection_risk = 0
	if category then
		local custom_data = {}
		custom_data[category] = managers.blackmarket:get_crafted_category_slot(category, slot)
		detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data(custom_data, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		detection_risk = detection_risk * 100
	end
	local base_value, base_index, modifier, multiplier
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
	local weapon_tweak = tweak_data.weapon[name]
	local primary_category = weapon_tweak.categories[1]
	for _, stat in ipairs(WeaponDescription._stats_shown) do
		if weapon_tweak.stats[stat.stat_name or stat.name] or stat.name == "totalammo" or stat.name == "fire_rate" then
			if stat.name == "magazine" then
				skill_stats[stat.name].value = (managers.player:upgrade_value(name, "clip_ammo_increase", 1) - 1) * (weapon_tweak.CLIP_AMMO_MAX + (mods_stats[stat.name].value or 0))
				if not weapon_tweak.upgrade_blocks or not weapon_tweak.upgrade_blocks.weapon or not table.contains(weapon_tweak.upgrade_blocks.weapon, "clip_ammo_increase") then
					skill_stats[stat.name].value = skill_stats[stat.name].value + (managers.player:upgrade_value("weapon", "clip_ammo_increase", 1) - 1) * (weapon_tweak.CLIP_AMMO_MAX + (mods_stats[stat.name].value or 0))
				end
			   
				if not weapon_tweak.upgrade_blocks or not weapon_tweak.upgrade_blocks[weapon_tweak.category] or not table.contains(weapon_tweak.upgrade_blocks[weapon_tweak.category], "clip_ammo_increase") then
					skill_stats[stat.name].value = skill_stats[stat.name].value + (managers.player:upgrade_value(weapon_tweak.category, "clip_ammo_increase", 1) - 1) * (weapon_tweak.CLIP_AMMO_MAX + (mods_stats[stat.name].value or 0))
				end
				skill_stats[stat.name].skill_in_effect = managers.player:has_category_upgrade(name, "clip_ammo_increase") or managers.player:has_category_upgrade("weapon", "clip_ammo_increase")
			elseif stat.name == "totalammo" then
			elseif stat.name == "reload" then
				local skill_in_effect = false
				local mult = 1
				for _, category in ipairs(weapon_tweak.categories) do
					if managers.player:has_category_upgrade(category, "reload_speed_multiplier") then
						mult = mult + (1 - managers.player:upgrade_value(category, "reload_speed_multiplier", 1))
						skill_in_effect = true
					end
				end	
				local is_pro = Global.game_settings and Global.game_settings.one_down
				if not is_pro then
					mult = mult / managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
					skill_in_effect = true
				end
				mult = 1 / managers.blackmarket:_convert_add_to_mul(mult)
				local diff = base_stats[stat.name].value * mult - base_stats[stat.name].value
				skill_stats[stat.name].value = skill_stats[stat.name].value + diff
				skill_stats[stat.name].skill_in_effect = skill_in_effect
			else
				base_value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value, 0)
				if base_stats[stat.name].index and mods_stats[stat.name].index then
					base_index = base_stats[stat.name].index + mods_stats[stat.name].index
				end
				multiplier = 1
				modifier = 0
				local is_single_shot = managers.weapon_factory:has_perk("fire_mode_single", factory_id, blueprint)
				if stat.name == "damage" then
					multiplier = managers.blackmarket:damage_multiplier(name, weapon_tweak.categories, silencer, detection_risk, nil, blueprint)
					modifier = math.floor(managers.blackmarket:damage_addend(name, weapon_tweak.categories, silencer, detection_risk, nil, blueprint) * tweak_data.gui.stats_present_multiplier * multiplier)
				elseif stat.name == "spread" then
					local fire_mode = single_mod and "single" or auto_mod and "auto" or weapon_tweak.FIRE_MODE or "single"
					multiplier = managers.blackmarket:accuracy_multiplier(name, weapon_tweak.categories, silencer, nil, nil, fire_mode, blueprint, nil, is_single_shot)
					modifier = managers.blackmarket:accuracy_addend(name, weapon_tweak.categories, base_index, silencer, nil, fire_mode, blueprint, nil, is_single_shot) * tweak_data.gui.stats_present_multiplier
				elseif stat.name == "recoil" then
					multiplier = managers.blackmarket:recoil_multiplier(name, weapon_tweak.categories, silencer, blueprint)
					modifier = managers.blackmarket:recoil_addend(name, weapon_tweak.categories, base_index, silencer, blueprint, nil, is_single_shot) * tweak_data.gui.stats_present_multiplier
				elseif stat.name == "suppression" then
					multiplier = managers.blackmarket:threat_multiplier(name, weapon_tweak.categories, silencer)
				elseif stat.name == "concealment" then
					if managers.player:has_category_upgrade("player", "weapon_concealment_increase") then
						modifier = managers.player:upgrade_value("player", "weapon_concealment_increase", 0)
					end
					if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_penalty_decrease") then
						local stats = managers.weapon_factory:get_perk_stats("silencer", factory_id, blueprint)
						if stats and stats.concealment then
							modifier = modifier + math.min(managers.player:upgrade_value("player", "silencer_concealment_penalty_decrease", 0), math.abs(stats.concealment))
						end
					end
				elseif stat.name == "fire_rate" then
					base_value = math.max(base_stats[stat.name].value, 0)

					if base_stats[stat.name].index then
						base_index = base_stats[stat.name].index
					end

					multiplier = managers.blackmarket:fire_rate_multiplier(name, weapon_tweak.categories, silencer, detection_risk, nil, blueprint)
				end
				if modifier ~= 0 then
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier
					if stat.revert then
						modifier = -modifier
					end
					if stat.percent then
						local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier
						if stat.offset then
							max_stat = max_stat - offset
						end
						local ratio = modifier / max_stat
						modifier = ratio * 100
					end
				end
				if stat.revert then
					multiplier = 1 / math.max(multiplier, 0.01)
				end
				skill_stats[stat.name].skill_in_effect = multiplier ~= 1 or modifier ~= 0
				skill_stats[stat.name].value = modifier + base_value * multiplier - base_value
			end
		end
	end
	return skill_stats
end

function WeaponDescription._get_mods_stats(name, base_stats, equipped_mods, bonus_stats)
	local mods_stats = {}
	local modifier_stats = tweak_data.weapon[name].stats_modifiers
	for _, stat in pairs(WeaponDescription._stats_shown) do
		mods_stats[stat.name] = {}
		mods_stats[stat.name].index = 0
		mods_stats[stat.name].value = 0
	end

	if equipped_mods then
		local tweak_stats = tweak_data.weapon.stats
		local tweak_factory = tweak_data.weapon.factory.parts
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
		if bonus_stats then
			for _, stat in pairs(WeaponDescription._stats_shown) do
				if stat.name == "magazine" then
					local ammo = mods_stats[stat.name].index
					ammo = ammo and ammo + (tweak_data.weapon[name].stats.extra_ammo or 0)
					mods_stats[stat.name].value = mods_stats[stat.name].value + (ammo and tweak_data.weapon.stats.extra_ammo[ammo] or 0)
				elseif stat.name == "totalammo" then
					local ammo = bonus_stats.total_ammo_mod
					mods_stats[stat.name].index = mods_stats[stat.name].index + (ammo or 0)
				else
					mods_stats[stat.name].index = mods_stats[stat.name].index + (bonus_stats[stat.name] or 0)
				end
			end
		end
		local part_data, reload_total_index
		for _, mod in ipairs(equipped_mods) do
			part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(mod, factory_id, default_blueprint)
			if part_data then
				for _, stat in pairs(WeaponDescription._stats_shown) do
					if part_data.stats then
						if stat.name == "magazine" then
							local ammo = part_data.stats.extra_ammo
							ammo = ammo and ammo + (tweak_data.weapon[name].stats.extra_ammo or 0)
							mods_stats[stat.name].value = mods_stats[stat.name].value + (ammo and tweak_data.weapon.stats.extra_ammo[ammo] or 0)
						elseif stat.name == "totalammo" then
							local ammo = part_data.stats.total_ammo_mod
							mods_stats[stat.name].index = mods_stats[stat.name].index + (ammo or 0)
						elseif stat.name == "reload" then
							if not base_stats[stat.name].index then
								debug_pause("weapon is missing reload stat", name)
							end
							local chosen_index = part_data.stats.reload or 0
							chosen_index = chosen_index and chosen_index + (tweak_data.weapon[name].stats.reload or 0)
							reload_total_index = (reload_total_index and reload_total_index + (chosen_index - tweak_data.weapon[name].stats.reload)) or ( chosen_index - tweak_data.weapon[name].stats.reload)
							local mult = 1 / tweak_data.weapon.stats[stat.name][tweak_data.weapon[name].stats.reload + reload_total_index]
							mods_stats[stat.name].value = base_stats[stat.name].value * mult
							mods_stats[stat.name].index = reload_total_index
						elseif stat.name == "fire_rate" then
							if part_data.custom_stats and part_data.custom_stats.rof_mult then
								mods_stats[stat.name].value = mods_stats[stat.name].value + part_data.custom_stats.rof_mult - 1
							end
						else
							mods_stats[stat.name].index = mods_stats[stat.name].index + (part_data.stats[stat.name] or 0)
						end
					end
				end
			end
		end
		local index, stat_name
		for _, stat in pairs(WeaponDescription._stats_shown) do
			stat_name = stat.name
			if mods_stats[stat.name].index and tweak_stats[stat_name] then
				if stat.name == "concealment" then
					index = base_stats[stat.name].index + mods_stats[stat.name].index
				else
					index = math.clamp(base_stats[stat.name].index + mods_stats[stat.name].index, 1, #tweak_stats[stat_name])
				end
				if stat.name ~= "reload" then
					mods_stats[stat.name].value = stat.index and index or tweak_stats[stat_name][index] * tweak_data.gui.stats_present_multiplier
				end
				local offset = math.min(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]]) * tweak_data.gui.stats_present_multiplier
				if stat.offset then
					mods_stats[stat.name].value = mods_stats[stat.name].value - offset
				end
				if stat.revert then
					local max_stat = math.max(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]]) * tweak_data.gui.stats_present_multiplier
					if stat.offset then
						max_stat = max_stat - offset
					end
					mods_stats[stat.name].value = max_stat - mods_stats[stat.name].value
				end
				if modifier_stats and modifier_stats[stat.name] then
					local mod = modifier_stats[stat.name]
					if stat.revert and not stat.index then
						local real_base_value = tweak_stats[stat_name][index]
						local modded_value = real_base_value * mod
						local offset = math.min(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]])
						if stat.offset then
							modded_value = modded_value - offset
						end
						local max_stat = math.max(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]])
						if stat.offset then
							max_stat = max_stat - offset
						end
						local new_value = (max_stat - modded_value) * tweak_data.gui.stats_present_multiplier
						if mod ~= 0 and (modded_value > tweak_stats[stat_name][1] or modded_value < tweak_stats[stat_name][#tweak_stats[stat_name]]) then
							new_value = (new_value + mods_stats[stat.name].value / mod) / 2
						end
						mods_stats[stat.name].value = new_value
					else
						mods_stats[stat.name].value = mods_stats[stat.name].value * mod
					end
				end
				if stat.percent then
					local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier
					if stat.offset then
						max_stat = max_stat - offset
					end
					local ratio = mods_stats[stat.name].value / max_stat
					mods_stats[stat.name].value = ratio * 100
				end
				mods_stats[stat.name].value = mods_stats[stat.name].value - base_stats[stat.name].value
			elseif stat.name == "fire_rate" then
				mods_stats[stat.name].value = base_stats[stat.name].value * mods_stats[stat.name].value
			end
		end
	end
	return mods_stats
end

function WeaponDescription._get_weapon_mod_stats(mod_name, weapon_name, base_stats, mods_stats, equipped_mods)
	local tweak_stats = tweak_data.weapon.stats
	local tweak_factory = tweak_data.weapon.factory.parts
	local modifier_stats = tweak_data.weapon[weapon_name].stats_modifiers
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(weapon_name)
	local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
	local part_data = nil
	local mod_stats = {
		chosen = {},
		equip = {}
	}

	for _, stat in pairs(WeaponDescription._stats_shown) do
		mod_stats.chosen[stat.name] = 0
		mod_stats.equip[stat.name] = 0
	end

	mod_stats.chosen.name = mod_name

	if equipped_mods then
		for _, mod in ipairs(equipped_mods) do
			if tweak_factory[mod] and tweak_factory[mod_name].type == tweak_factory[mod].type then
				mod_stats.equip.name = mod

				break
			end
		end
	end

	local curr_stats = base_stats
	local index, wanted_index = nil

	for _, mod in pairs(mod_stats) do
		part_data = nil

		if mod.name then
			if tweak_data.blackmarket.weapon_skins[mod.name] and tweak_data.blackmarket.weapon_skins[mod.name].bonus and tweak_data.economy.bonuses[tweak_data.blackmarket.weapon_skins[mod.name].bonus] then
				part_data = {
					stats = tweak_data.economy.bonuses[tweak_data.blackmarket.weapon_skins[mod.name].bonus].stats
				}
			else
				part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(mod.name, factory_id, default_blueprint)
			end
		end

		for _, stat in pairs(WeaponDescription._stats_shown) do
			if part_data and part_data.stats then
				if stat.name == "magazine" then
					local ammo = part_data.stats.extra_ammo
					ammo = ammo and ammo + (tweak_data.weapon[weapon_name].stats.extra_ammo or 0)
					mod[stat.name] = ammo and tweak_data.weapon.stats.extra_ammo[ammo] or 0

					if part_data.custom_stats and part_data.custom_stats.ammo_offset then
						mod[stat.name] = mod[stat.name] + part_data.custom_stats.ammo_offset
					end
				elseif stat.name == "totalammo" then
					local chosen_index = part_data.stats.total_ammo_mod or 0
					chosen_index = math.clamp(base_stats[stat.name].index + chosen_index, 1, #tweak_stats.total_ammo_mod)
					mod[stat.name] = base_stats[stat.name].value * tweak_stats.total_ammo_mod[chosen_index]
				elseif stat.name == "reload" then
					local chosen_index = part_data.stats.reload or 0
					chosen_index = math.clamp(base_stats[stat.name].index + chosen_index, 1, #tweak_stats[stat.name])
					local reload_time = managers.blackmarket:get_reload_time(weapon_name) / (tweak_data.weapon[weapon_name].reload_speed_multiplier or 1)
					local mult = 1 / tweak_data.weapon.stats[stat.name][chosen_index]
					local mod_value = reload_time * mult
					mod[stat.name] = mod_value - base_stats[stat.name].value
				elseif stat.name == "fire_rate" then
					if part_data.custom_stats and part_data.custom_stats.fire_rate_multiplier then
						mod[stat.name] = base_stats[stat.name].value * (part_data.custom_stats.fire_rate_multiplier - 1)
					end
				else
					local chosen_index = part_data.stats[stat.name] or 0

					if tweak_stats[stat.name] then
						wanted_index = curr_stats[stat.name].index + chosen_index
						index = math.clamp(wanted_index, 1, #tweak_stats[stat.name])
						mod[stat.name] = stat.index and index or tweak_stats[stat.name][index] * tweak_data.gui.stats_present_multiplier

						if wanted_index ~= index then
							print("[WeaponDescription._get_weapon_mod_stats] index went out of bound, estimating value", "mod_name", mod_name, "stat.name", stat.name, "wanted_index", wanted_index, "index", index)

							if stat.index then
								index = wanted_index
								mod[stat.name] = index
							elseif index ~= curr_stats[stat.name].index then
								local diff_value = tweak_stats[stat.name][index] - tweak_stats[stat.name][curr_stats[stat.name].index]
								local diff_index = index - curr_stats[stat.name].index
								local diff_ratio = diff_value / diff_index
								diff_index = wanted_index - index
								diff_value = diff_index * diff_ratio
								mod[stat.name] = mod[stat.name] + diff_value * tweak_data.gui.stats_present_multiplier
							end
						end

						local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

						if stat.offset then
							mod[stat.name] = mod[stat.name] - offset
						end

						if stat.revert then
							local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

							if stat.revert then
								max_stat = max_stat - offset
							end

							mod[stat.name] = max_stat - mod[stat.name]
						end

						if modifier_stats and modifier_stats[stat.name] then
							local mod_stat = modifier_stats[stat.name]

							if stat.revert and not stat.index then
								local real_base_value = tweak_stats[stat.name][index]
								local modded_value = real_base_value * mod_stat
								local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

								if stat.offset then
									modded_value = modded_value - offset
								end

								local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]])

								if stat.offset then
									max_stat = max_stat - offset
								end

								local new_value = (max_stat - modded_value) * tweak_data.gui.stats_present_multiplier

								if mod_stat ~= 0 and (tweak_stats[stat.name][1] < modded_value or modded_value < tweak_stats[stat.name][#tweak_stats[stat.name]]) then
									new_value = (new_value + mod[stat.name] / mod_stat) / 2
								end

								mod[stat.name] = new_value
							else
								mod[stat.name] = mod[stat.name] * mod_stat
							end
						end

						if stat.percent then
							local max_stat = stat.index and #tweak_stats[stat.name] or math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier

							if stat.offset then
								max_stat = max_stat - offset
							end

							local ratio = mod[stat.name] / max_stat
							mod[stat.name] = ratio * 100
						end

						mod[stat.name] = mod[stat.name] - curr_stats[stat.name].value
					end
				end
			end
		end
	end

	return mod_stats
end


function WeaponDescription._get_base_swap_speed(name, base_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local multiplier = 1
	for _, category in ipairs(weapon_tweak.categories) do
		if tweak_data[category] and tweak_data[category].swap_bonus then
			multiplier = multiplier * tweak_data[category].swap_bonus
		end
	end

	multiplier = multiplier * (weapon_tweak.swap_speed_multiplier or 1)

	multiplier = multiplier * tweak_data.weapon.stats.mobility[base_stats.concealment.value + 1]

	return (tweak_data.weapon[name].timers.equip + tweak_data.weapon[name].timers.unequip) / multiplier
end

function WeaponDescription._get_mods_swap_speed(name, base_stats, mods_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local multiplier = 1
	for _, category in ipairs(weapon_tweak.categories) do
		if tweak_data[category] and tweak_data[category].swap_bonus then
			multiplier = multiplier * tweak_data[category].swap_bonus
		end
	end

	multiplier = multiplier * (weapon_tweak.swap_speed_multiplier or 1)
	
	multiplier = multiplier * tweak_data.weapon.stats.mobility[math.max(base_stats.concealment.value + mods_stats.concealment.value, 0) + 1]
	local mod_swap_speed = (tweak_data.weapon[name].timers.equip + tweak_data.weapon[name].timers.unequip) / multiplier - base_stats.swap_speed.value

	return mod_swap_speed
end

function WeaponDescription._get_skill_swap_speed(name, base_stats, mods_stats, skill_stats, silencer)
	local weapon_tweak = tweak_data.weapon[name]
	local multiplier = 1
	multiplier = multiplier * managers.player:upgrade_value("weapon", "swap_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "mrwi_swap_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_swap_speed_multiplier", 1)

	--Get per category multipliers (IE: Pistols swap faster, Akimbos swap slower, ect).
	for _, category in ipairs(weapon_tweak.categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "swap_speed_multiplier", 1)
		multiplier = multiplier * (tweak_data[category] and tweak_data[category].swap_bonus or 1)
	end

	if silencer then
		multiplier = multiplier * managers.player:upgrade_value("player", "silencer_swap_increase", 1)
	end

	multiplier = multiplier * (weapon_tweak.swap_speed_multiplier or 1)

	local multiplier = multiplier * tweak_data.weapon.stats.mobility[math.max(base_stats.concealment.value + mods_stats.concealment.value + skill_stats.concealment.value, 0) + 1]
	local skill_swap_speed = (tweak_data.weapon[name].timers.equip + tweak_data.weapon[name].timers.unequip) / multiplier - base_stats.swap_speed.value - mods_stats.swap_speed.value
	
	if skill_swap_speed >= 0 then
		return false, 0
	else
		return true, skill_swap_speed
	end
end

function WeaponDescription._get_base_range(weapon, name, base_stats, calc_min)
	local weapon_tweak = tweak_data.weapon[name]

	local has_range = true
	local category_mul = 1
	for i = 1, #weapon_tweak.categories do
		local category = weapon_tweak.categories[i]
		if category == "rocket_frag" or category == "grenade_launcher" or category == "bow" or category == "saw" or category == "crossbow" then
			has_range = nil
		elseif tweak_data[category] and tweak_data[category].range_mul then
			category_mul = category_mul * tweak_data[category].range_mul
		end
	end

	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	for part_id, stats in pairs(custom_data) do
		if stats.rays then
			has_range = true
		end
	end

	if has_range then
		local base_range = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.start_dist or 3000
		local range = base_range
		
		if calc_min then
			base_range = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.end_dist or 6000
		end
		
		range = base_range / 100

		return range
	else
		return -1 --Set the text for this to be blank.
	end
end

function WeaponDescription._get_mods_range(weapon, name, base_stats, mods_stats, calc_min)
	local weapon_tweak = tweak_data.weapon[name]

	local has_range = true
	local category_mul = 1
	for i = 1, #weapon_tweak.categories do
		local category = weapon_tweak.categories[i]
		if category == "rocket_frag" or category == "grenade_launcher" or category == "bow" or category == "saw" or category == "crossbow" then
			has_range = nil
		end
	end

	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	for part_id, stats in pairs(custom_data) do
		if stats.rays then
			has_range = true
		end
	end

	if has_range then
		local base_range = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.start_dist or 300
		local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
		local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
		local range = base_range
		
		if calc_min then
			base_range = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.end_dist or 600
			range = base_range
			for part_id, stats in pairs(custom_data) do
				if stats.falloff_end_mult then
					range = range * stats.falloff_end_mult
					--log("MIN RANGE: " .. tostring(range))
				end
			end
		else
			for part_id, stats in pairs(custom_data) do
				if stats.falloff_start_mult then
					range = range * stats.falloff_start_mult
					--log("Max RANGE: " .. tostring(range))
				end
			end
		end
		
		return (range - base_range) / 100
	else
		return 0
	end
end

--Currently always returns false since I don't know of any passive range bonuses that can be displayed as a skill + I don't want to work on this anymore. Math big stinky
function WeaponDescription._get_skill_range(weapon, name, base_stats, mods_stats, skill_stats, calc_min)
	local weapon_tweak = tweak_data.weapon[name]

	local has_range = true
	local category_mul = 1
	for i = 1, #weapon_tweak.categories do
		local category = weapon_tweak.categories[i]
		if category == "rocket_frag" or category == "grenade_launcher" or category == "bow" or category == "saw" or category == "crossbow" then
			has_range = nil
		end
	end

	if has_range then
		local falloff_info = tweak_data.weapon.stat_info.damage_falloff
		local base_falloff = falloff_info.base
		
		local acc_bonus = falloff_info.acc_bonus * math.max(base_stats.spread.value + mods_stats.spread.value + skill_stats.spread.value, 0) * 0.2
		local stab_bonus = falloff_info.stab_bonus * (#tweak_data.weapon.stats.recoil - 1)
		local base_range = base_stats.standing_range.value
		local mods_range = mods_stats.standing_range.value

		if calc_min then
			stab_bonus = falloff_info.stab_bonus * math.max(base_stats.recoil.value + mods_stats.recoil.value + skill_stats.recoil.value, 0) * 0.2
			base_range = base_stats.moving_range.value
			mods_range = mods_stats.moving_range.value
		end

		local range = 0.01 * (base_falloff + acc_bonus + stab_bonus) * category_mul
		
		local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
		if weapon_tweak.rays and weapon_tweak.rays > 1 and not (ammo_data.rays and ammo_data.rays == 1) then
			range = range * falloff_info.shotgun_penalty
		end

		if ammo_data.damage_near_mul then
			range = range * ammo_data.damage_near_mul
		end

		local skill_range = range - base_range - mods_range

		if skill_range > 0 then
			return false, 0 --true, skill_range
		end
	end

	return false, 0
end

function WeaponDescription._get_base_pickup(weapon, name)
	local weapon_tweak = tweak_data.weapon[name]
	local average_pickup = (weapon_tweak.AMMO_PICKUP[1] + weapon_tweak.AMMO_PICKUP[2]) * 0.5
	return average_pickup
end

function WeaponDescription._get_mods_pickup(weapon, name, base_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	local min_pickup = weapon_tweak.AMMO_PICKUP[1] * (ammo_data.ammo_pickup_min_mul or 1)
	local max_pickup = weapon_tweak.AMMO_PICKUP[2] * (ammo_data.ammo_pickup_max_mul or 1)
	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	for part_id, stats in pairs(custom_data) do
		if stats.alt_ammo_pickup_min_mul then
			min_pickup = min_pickup * stats.alt_ammo_pickup_min_mul
		end
		if stats.alt_ammo_pickup_max_mul then
			max_pickup = max_pickup * stats.alt_ammo_pickup_max_mul
		end
	end
	local average_pickup = (min_pickup + max_pickup) * 0.5
	return average_pickup - base_stats.pickup.value
end

function WeaponDescription._get_skill_pickup(weapon, name, base_stats, mods_stats)
	local pickup_multiplier = managers.player:upgrade_value("player", "fully_loaded_pick_up_multiplier", 1)

	local is_pro = Global.game_settings and Global.game_settings.one_down
	local is_solo = (Global.game_settings and Global.game_settings.single_player and 2) or 1
	if not is_pro then
		pickup_multiplier = pickup_multiplier * ( ((managers.player:upgrade_value("player", "passive_pick_up_multiplier", 1) - 1) * is_solo) + 1 )
	end

	local weapon_tweak = tweak_data.weapon[name]
	for _, category in ipairs(weapon_tweak.categories) do
		pickup_multiplier = pickup_multiplier + managers.player:upgrade_value(category, "pick_up_multiplier", 1) - 1
	end

	if pickup_multiplier > 1 then
		local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
		local min_pickup = weapon_tweak.AMMO_PICKUP[1] * (ammo_data.ammo_pickup_min_mul or 1) * pickup_multiplier
		local max_pickup = weapon_tweak.AMMO_PICKUP[2] * (ammo_data.ammo_pickup_max_mul or 1) * pickup_multiplier
		local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
		for part_id, stats in pairs(custom_data) do
			if stats.alt_ammo_pickup_min_mul then
				min_pickup = min_pickup * stats.alt_ammo_pickup_min_mul
			end
			if stats.alt_ammo_pickup_max_mul then
				max_pickup = max_pickup * stats.alt_ammo_pickup_max_mul
			end
		end
		local average_pickup = (min_pickup + max_pickup) * 0.5
		return true, average_pickup - mods_stats.pickup.value - base_stats.pickup.value
	else
		return false, 0
	end
end

function WeaponDescription._get_base_damage_min(weapon, name, base_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local damage_base = base_stats.damage.value
	local damage_min_mult = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.min_mult or 0.3
	local rays = weapon_tweak and weapon_tweak.rays
	local ignore_rays = (weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.ignore_rays) or false
	local gl_buck = nil
	
	local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	for part_id, stats in pairs(custom_data) do
		if stats.gl_buck then
			gl_buck = true
		end
	end

	if ignore_rays == false and rays and rays > 1 then
		damage_min_mult = 0.05
	end

	if gl_buck and not per_pellet then
		damage_min_mult = damage_min_mult / 2
	end

	if not gl_buck then
		for i = 1, #weapon_tweak.categories do
			local category = weapon_tweak.categories[i]
			if category and category == "flamethrower" or category == "rocket_frag" or category == "grenade_launcher" or category == "bow" or category == "saw" or category == "crossbow" then
				damage_min_mult = 0
				damage_base = 0
			end
		end
	end

	return damage_base * damage_min_mult
end

function WeaponDescription._get_mods_damage_min(weapon, name, base_stats, mods_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local damage_base = base_stats.damage.value 
	local damage_mods = mods_stats.damage.value
	local damage_min_mult = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.min_mult or 0.3
	local ignore_rays = (weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.ignore_rays) or weapon_tweak.ignore_rays or false
	local rays = weapon_tweak and weapon_tweak.rays
	local gl_buck = nil

	local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	if weapon_tweak.rays and weapon_tweak.rays > 1 and not (ammo_data.rays and ammo_data.rays == 1) then
		damage_min_mult = 0.05
	end

	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	for part_id, stats in pairs(custom_data) do
		if stats.damage_min_mult then
			damage_min_mult = damage_min_mult * stats.damage_min_mult
		end
		if stats.bullet_class and stats.bullet_class == "InstantExplosiveBulletBase" then
			damage_min_mult = 1
		end
		if stats.dont_ignore_rays and stats.dont_ignore_rays == true then
			ignore_rays = false
		end
	end
	
	if ignore_rays == false and rays and rays > 1 then
		damage_mods = (damage_mods + damage_base) * damage_min_mult 
		damage_min_mult = 0.05
	else
		damage_mods = (damage_mods + damage_base) * damage_min_mult 
		damage_min_mult = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.min_mult or 0.3
	end
	
	damage_base = damage_base * damage_min_mult 

	if not gl_buck then
		for i = 1, #weapon_tweak.categories do
			local category = weapon_tweak.categories[i]
			if category and category == "flamethrower" or category == "rocket_frag" or category == "grenade_launcher" or category == "bow" or category == "saw" or category == "crossbow" then
				damage_min_mult = 0
				damage_mods = 0
				damage_base = 0
			end
		end
	end
	
	return math.round((damage_mods - damage_base) * 100) / 100
end

function WeaponDescription._get_skill_damage_min(weapon, name, base_stats, mods_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local damage_base = base_stats.damage.value
	local damage_mods = mods_stats.damage.value
	local damage_min_mult = weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.min_mult or 0.3
	local multiplier = managers.blackmarket:damage_multiplier(name, weapon_tweak.categories, silencer, detection_risk, nil, blueprint) or 1
	local ignore_rays = (weapon_tweak.damage_falloff and weapon_tweak.damage_falloff.ignore_rays) or weapon_tweak.ignore_rays or false
	local is_slug = nil
	local ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	if ignore_rays == false and weapon_tweak.rays and weapon_tweak.rays > 1 and not (ammo_data.rays and ammo_data.rays == 1) then
		damage_min_mult = 0.05
	else
		is_slug = true
	end
	
	for i = 1, #weapon_tweak.categories do
		local category = weapon_tweak.categories[i]
		if category == "flamethrower" or category == "rocket_frag" or category == "grenade_launcher" or category == "bow" or category == "saw" or category == "crossbow" then
			damage_min_mult = 0
			damage_skill = 0
			damage_mods = 0
			damage_base = 0
			break
		end
		if not is_slug then
			multiplier = multiplier * managers.player:upgrade_value(category, "damage_min_bonus", 1)
		end
	end

	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	for part_id, stats in pairs(custom_data) do
		if stats.damage_min_mult then
			damage_min_mult = damage_min_mult * stats.damage_min_mult
		end
		if stats.bullet_class and stats.bullet_class == "InstantExplosiveBulletBase" then
			damage_min_mult = 1
		end
		if stats.dont_ignore_rays then
			ignore_rays = false
		end
	end
	
	local damage_skill = (((damage_base + damage_mods) * multiplier) - ( damage_base + damage_mods ) ) * damage_min_mult 
	if damage_skill > 0 then
		return true, damage_skill
	else
		return false, 0
	end
end

function WeaponDescription._get_base_ads_speed(weapon, name)
	local weapon_tweak = tweak_data.weapon[name]
	local ads_speed = weapon_tweak.ads_speed or 0.2
	return ads_speed * 1000
end

function WeaponDescription._get_mods_ads_speed(weapon, name, base_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local custom_data = managers.weapon_factory:get_custom_stats_from_weapon(weapon.factory_id, weapon.blueprint) or {}
	local ads_speed = base_stats.ads_speed.value
	
	for part_id, stats in pairs(custom_data) do
		if stats.ads_speed_mult then
			ads_speed = ads_speed * stats.ads_speed_mult
		end
	end
	
	return ads_speed - base_stats.ads_speed.value
end

function WeaponDescription._get_skill_ads_speed(weapon, name, base_stats, mods_stats)
	local weapon_tweak = tweak_data.weapon[name]
	local ads_multiplier = 1
	local base_ads = base_stats.ads_speed.value
	local mods_ads = mods_stats.ads_speed.value
	local categories = weapon_tweak.categories

	for _, category in ipairs(categories) do
		ads_multiplier = ads_multiplier * ( 1 + 1 -  managers.player:upgrade_value(category, "enter_steelsight_speed_multiplier", 1))
	end
	ads_multiplier = ads_multiplier * ( 1 + 1 - managers.player:upgrade_value("weapon", "enter_steelsight_speed_multiplier", 1))
	if ads_multiplier < 1 then
		local skill_ads = (base_ads + mods_ads) * ads_multiplier
		return true, skill_ads - base_ads - mods_ads
	else
		return false, 0
	end
end

function WeaponDescription._get_stats(name, category, slot, blueprint)
	local equipped_mods = nil
	local silencer = false
	local single_mod = false
	local auto_mod = false
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
	local blueprint = blueprint or slot and managers.blackmarket:get_weapon_blueprint(category, slot) or managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
	local cosmetics = managers.blackmarket:get_weapon_cosmetics(category, slot)
	local bonus_stats = {}

	if cosmetics and cosmetics.id and cosmetics.bonus and not managers.job:is_current_job_competitive() and not managers.weapon_factory:has_perk("bonus", factory_id, blueprint) then
		bonus_stats = tweak_data:get_raw_value("economy", "bonuses", tweak_data.blackmarket.weapon_skins[cosmetics.id].bonus, "stats") or {}
	end

	if blueprint then
		equipped_mods = deep_clone(blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)

		if equipped_mods then
			silencer = managers.weapon_factory:has_perk("silencer", factory_id, equipped_mods)
			single_mod = managers.weapon_factory:has_perk("fire_mode_single", factory_id, equipped_mods)
			auto_mod = managers.weapon_factory:has_perk("fire_mode_auto", factory_id, equipped_mods)
		end
	end

	local base_stats = WeaponDescription._get_base_stats(name)
	local mods_stats = WeaponDescription._get_mods_stats(name, base_stats, equipped_mods, bonus_stats)
	local skill_stats = WeaponDescription._get_skill_stats(name, category, slot, base_stats, mods_stats, silencer, single_mod, auto_mod, blueprint)
	local clip_ammo, max_ammo, ammo_data = WeaponDescription.get_weapon_ammo_info(name, tweak_data.weapon[name].stats.extra_ammo, base_stats.totalammo.index + mods_stats.totalammo.index)
	base_stats.totalammo.value = ammo_data.base
	mods_stats.totalammo.value = ammo_data.mod
	skill_stats.totalammo.value = ammo_data.skill
	skill_stats.totalammo.skill_in_effect = ammo_data.skill_in_effect
	local my_clip = base_stats.magazine.value + mods_stats.magazine.value + skill_stats.magazine.value

	if max_ammo < my_clip then
		mods_stats.magazine.value = mods_stats.magazine.value + max_ammo - my_clip
	end

	--Concealment hardcap stuff. Easier than applying it elsewhere.
	local weapon = {
		factory_id = factory_id,
		blueprint = blueprint
	}
	base_stats.concealment.value = tweak_data.weapon[name].stats.concealment
	mods_stats.concealment.value = managers.blackmarket:calculate_weapon_concealment(weapon) - base_stats.concealment.value
	skill_stats.concealment.value = managers.blackmarket:get_silencer_concealment_modifiers(weapon)

	--Ditto for weapon swap speed.
	base_stats.swap_speed.value = WeaponDescription._get_base_swap_speed(name, base_stats)
	mods_stats.swap_speed.value = WeaponDescription._get_mods_swap_speed(name, base_stats, mods_stats)
	skill_stats.swap_speed.skill_in_effect, skill_stats.swap_speed.value = WeaponDescription._get_skill_swap_speed(name, base_stats, mods_stats, skill_stats, silencer)

	--and range.
	--Standing range modified for damage dropoff start range (Max damage up until x range)
	base_stats.standing_range.value = WeaponDescription._get_base_range(weapon, name, base_stats, false)
	mods_stats.standing_range.value = WeaponDescription._get_mods_range(weapon, name, base_stats, mods_stats, false)
	skill_stats.standing_range.skill_in_effect, skill_stats.standing_range.value = WeaponDescription._get_skill_range(weapon, name, base_stats, mods_stats, skill_stats, false)
	--Moving range modified for damage dropoff end range (Minimum damage at x range)
	base_stats.moving_range.value = WeaponDescription._get_base_range(weapon, name, base_stats, true)
	mods_stats.moving_range.value = WeaponDescription._get_mods_range(weapon, name, base_stats, mods_stats, true)
	skill_stats.moving_range.skill_in_effect, skill_stats.moving_range.value = WeaponDescription._get_skill_range(weapon, name, base_stats, mods_stats, skill_stats, true)

	--and also pickup.
	--God this is ugly code.
	base_stats.pickup.value = WeaponDescription._get_base_pickup(weapon, name)
	mods_stats.pickup.value = WeaponDescription._get_mods_pickup(weapon, name, base_stats)
	skill_stats.pickup.skill_in_effect, skill_stats.pickup.value = WeaponDescription._get_skill_pickup(weapon, name, base_stats, mods_stats)
	
	--Continuing the ugly
	base_stats.damage_min.value = WeaponDescription._get_base_damage_min(weapon, name, base_stats)
	mods_stats.damage_min.value = WeaponDescription._get_mods_damage_min(weapon, name, base_stats, mods_stats)
	skill_stats.damage_min.skill_in_effect, skill_stats.damage_min.value = WeaponDescription._get_skill_damage_min(weapon, name, base_stats, mods_stats, silencer, single_mod, auto_mod, blueprint) 
	
	base_stats.ads_speed.value = WeaponDescription._get_base_ads_speed(weapon, name, base_stats)
	mods_stats.ads_speed.value = WeaponDescription._get_mods_ads_speed(weapon, name, base_stats)
	skill_stats.ads_speed.skill_in_effect, skill_stats.ads_speed.value = WeaponDescription._get_skill_ads_speed(weapon, name, base_stats, mods_stats)
	
	return base_stats, mods_stats, skill_stats
end

--Identical to vanilla function, but including it somehow fixes incorrect reload speeds showing up on the attachment selection screen for weapons with reload_speed_multiplier.
--[[
function WeaponDescription.get_stats_for_mod(mod_name, weapon_name, category, slot)
	local equipped_mods = nil
	local blueprint = managers.blackmarket:get_weapon_blueprint(category, slot)

	if blueprint then
		equipped_mods = deep_clone(blueprint)
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(weapon_name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)

		for _, default_part in ipairs(default_blueprint) do
			table.delete(equipped_mods, default_part)
		end
	end

	local base_stats = WeaponDescription._get_base_stats(weapon_name)
	local mods_stats = WeaponDescription._get_mods_stats(weapon_name, base_stats, equipped_mods)

	return WeaponDescription._get_weapon_mod_stats(mod_name, weapon_name, base_stats, mods_stats, equipped_mods)
end
--]]