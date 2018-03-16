if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

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
						if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_increase") then
							modifier = managers.player:upgrade_value("player", "silencer_concealment_increase", 0)
						end
						if silencer and managers.player:has_category_upgrade("player", "silencer_concealment_penalty_decrease") then
							local stats = managers.weapon_factory:get_perk_stats("silencer", factory_id, blueprint)
							if stats and stats.concealment then
								modifier = modifier + math.min(managers.player:upgrade_value("player", "silencer_concealment_penalty_decrease", 0), math.abs(stats.concealment))
							end
						end
					elseif stat.name == "fire_rate" then
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
				end
			end
		end
		return mods_stats
	end

end