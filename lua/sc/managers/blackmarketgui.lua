if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	function BlackMarketGui:choose_weapon_buy_callback(data)
		local blackmarket_items = managers.blackmarket:get_weapon_category(data.category) or {}
		local new_node_data = {}
		local weapon_tweak = tweak_data.weapon
		local x_id, y_id, x_level, y_level, x_unlocked, y_unlocked, x_skill, y_skill, x_gv, y_gv, x_sn, y_sn
		local item_categories = {}
		
		local sorted_categories = {}
		local gui_categories = tweak_data.gui.buy_weapon_categories[data.category]

		for i = 1, #gui_categories, 1 do
			table.insert(item_categories, {})
		end

		local function test_weapon_categories(weapon_categories, gui_weapon_categories)
			for i, weapon_category in ipairs(gui_weapon_categories) do
				if weapon_category ~= (tweak_data.gui.buy_weapon_category_aliases[weapon_categories[i]] or weapon_categories[i]) then
					return false
				end
			end

			return true
		end		
		
		for _, item in ipairs(blackmarket_items) do
			local weapon_data = tweak_data.weapon[item.weapon_id]

			for i, gui_category in ipairs(gui_categories) do
				if test_weapon_categories(weapon_data.categories, gui_category) then
					table.insert(item_categories[i], item)
				end
			end
		end

		for i, category in ipairs(item_categories) do
			local category_key = table.concat(gui_categories[i], "_")
			item_categories[category_key] = category
			item_categories[i] = nil
			sorted_categories[i] = category_key
		end
		
		for category, items in pairs(item_categories) do
			table.sort(items, function(x, y)

				if _G.IS_VR and x.vr_locked ~= y.vr_locked then
					return not x.vr_locked
				end			
			
				x_unlocked = x.unlocked
				y_unlocked = y.unlocked
				if x_unlocked ~= y_unlocked then
					return x_unlocked
				end
				x_id = x.weapon_id
				y_id = y.weapon_id
				x_gv = weapon_tweak[x_id].global_value
				y_gv = weapon_tweak[y_id].global_value
				x_sn = x_gv and tweak_data.lootdrop.global_values[x_gv].sort_number or 0
				y_sn = y_gv and tweak_data.lootdrop.global_values[y_gv].sort_number or 0
				if x_sn ~= y_sn then
					return x_sn < y_sn
				end
				x_skill = x.skill_based
				y_skill = y.skill_based
				if x_skill ~= y_skill then
					return y_skill
				end
				x_level = x.level or 0
				y_level = y.level or 0
				if x_level ~= y_level then
					return x_level < y_level
				end
				return x_id < y_id
			end)
		end

		local item_data
		for _, category in ipairs(sorted_categories) do
			local items = item_categories[category]
			item_data = {}
			for _, item in ipairs(items) do
				table.insert(item_data, item)
			end
			local name_id = managers.localization:to_upper_text("menu_" .. category)
			table.insert(new_node_data, {
				name = category,
				category = data.category,
				prev_node_data = data,
				name_localized = name_id,
				on_create_func_name = "populate_buy_weapon",
				on_create_data = item_data,
				identifier = self.identifiers.weapon
			})
		end
		new_node_data.buying_weapon = true
		new_node_data.topic_id = "bm_menu_buy_weapon_title"
		new_node_data.topic_params = {
			weapon_category = managers.localization:text("bm_menu_" .. data.category)
		}
		new_node_data.blur_fade = self._data.blur_fade
		managers.menu:open_node(self._inception_node_name, {new_node_data})
	end
	
	function BlackMarketGui:populate_mods(data)
		local new_data = {}
		local default_mod = data.on_create_data.default_mod
		local crafted = managers.blackmarket:get_crafted_category(data.prev_node_data.category)[data.prev_node_data.slot]
		local global_values = crafted.global_values or {}
		local ids_id = Idstring(data.name)
		local cosmetic_kit_mod = nil
		local cosmetics_blueprint = crafted.cosmetics and crafted.cosmetics.id and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id] and tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id].default_blueprint or {}
		for i, c_mod in ipairs(cosmetics_blueprint) do
			if Idstring(tweak_data.weapon.factory.parts[c_mod].type) == ids_id then
				cosmetic_kit_mod = c_mod
				break
			end
		end
		local gvs = {}
		local mod_t = {}
		local num_steps = #data.on_create_data
		local achievement_tracker = tweak_data.achievement.weapon_part_tracker
		local part_is_from_cosmetic = nil
		local guis_catalog = "guis/"
		for index, mod_t in ipairs(data.on_create_data) do
			local mod_name = mod_t[1]
			local mod_default = mod_t[2]
			local mod_global_value = mod_t[3] or "normal"
			part_is_from_cosmetic = cosmetic_kit_mod == mod_name
			guis_catalog = "guis/"
			local bundle_folder = tweak_data.blackmarket.weapon_mods[mod_name] and tweak_data.blackmarket.weapon_mods[mod_name].texture_bundle_folder
			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
			end
			local new_data = {
				name = mod_name or data.prev_node_data.name,
				name_localized = mod_name and managers.weapon_factory:get_part_name_by_part_id(mod_name) or managers.localization:text("bm_menu_no_mod"),
				category = data.category or data.prev_node_data and data.prev_node_data.category
			}
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/mods/" .. new_data.name
			new_data.use_icon = tweak_data.weapon.factory.parts[mod_name] and tweak_data.weapon.factory.parts[mod_name].alt_icon
			if new_data.use_icon then
				new_data.bitmap_texture = new_data.use_icon 
			end
			new_data.slot = data.slot or data.prev_node_data and data.prev_node_data.slot
			new_data.global_value = mod_global_value
			new_data.unlocked = not crafted.customize_locked and part_is_from_cosmetic and 1 or mod_default or managers.blackmarket:get_item_amount(new_data.global_value, "weapon_mods", new_data.name, true)
			new_data.equipped = false
			new_data.stream = true
			new_data.default_mod = default_mod
			new_data.cosmetic_kit_mod = cosmetic_kit_mod
			new_data.is_internal = tweak_data.weapon.factory:is_part_internal(new_data.name)
			new_data.free_of_charge = part_is_from_cosmetic or tweak_data.blackmarket.weapon_mods[mod_name] and tweak_data.blackmarket.weapon_mods[mod_name].is_a_unlockable
			new_data.unlock_tracker = achievement_tracker[new_data.name] or false
			if crafted.customize_locked then
				new_data.unlocked = type(new_data.unlocked) == "number" and -math.abs(new_data.unlocked) or new_data.unlocked
				new_data.unlocked = new_data.unlocked ~= 0 and new_data.unlocked or false
				new_data.lock_texture = "guis/textures/pd2/lock_incompatible"
				new_data.dlc_locked = "bm_menu_cosmetic_locked_weapon"
			elseif not part_is_from_cosmetic and tweak_data.lootdrop.global_values[mod_global_value] and tweak_data.lootdrop.global_values[mod_global_value].dlc and not managers.dlc:is_dlc_unlocked(mod_global_value) then
				new_data.unlocked = -math.abs(new_data.unlocked)
				new_data.unlocked = new_data.unlocked ~= 0 and new_data.unlocked or false
				new_data.lock_texture = self:get_lock_icon(new_data)
				new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or "bm_menu_dlc_locked"
			end
			local weapon_id = managers.blackmarket:get_crafted_category(new_data.category)[new_data.slot].weapon_id
			new_data.price = part_is_from_cosmetic and 0 or managers.money:get_weapon_modify_price(weapon_id, new_data.name, new_data.global_value)
			new_data.can_afford = part_is_from_cosmetic or managers.money:can_afford_weapon_modification(weapon_id, new_data.name, new_data.global_value)
			local font, font_size = nil
			local no_upper = false
			if crafted.previewing then
				new_data.previewing = true
				new_data.corner_text = {selected_text = managers.localization:text("bm_menu_mod_preview")}
				new_data.corner_text.noselected_text = new_data.corner_text.selected_text
				new_data.corner_text.noselected_color = Color.white
			elseif not new_data.lock_texture and (not new_data.unlocked or new_data.unlocked == 0) then
				local selected_text, noselected_text = nil
				if not new_data.dlc_locked and new_data.unlock_tracker then
					local text_id = "bm_menu_no_items"
					local progress = ""
					local stat = new_data.unlock_tracker.stat or false
					local max_progress = new_data.unlock_tracker.max_progress or 0
					local award = new_data.unlock_tracker.award or false
					if new_data.unlock_tracker.text_id then
						if max_progress > 0 and stat then
							local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)
							if progress_left > 0 then
								progress = tostring(progress_left)
								text_id = new_data.unlock_tracker.text_id
								font = small_font
								font_size = small_font_size
								no_upper = true
							end
						elseif award then
							local achievement = managers.achievment:get_info(award)
							text_id = new_data.unlock_tracker.text_id
							font = small_font
							font_size = small_font_size
							no_upper = true
						end
						selected_text = managers.localization:text(text_id, {progress = progress})
					end
				end
				selected_text = selected_text or managers.localization:text("bm_menu_no_items")
				noselected_text = selected_text
				new_data.corner_text = {
					selected_text = selected_text,
					noselected_text = selected_text
				}
			elseif new_data.unlocked and not new_data.can_afford then
				new_data.corner_text = {selected_text = managers.localization:text("bm_menu_not_enough_cash")}
				new_data.corner_text.noselected_text = new_data.corner_text.selected_text
			end
			local forbid = nil
			if mod_name then
				forbid = managers.blackmarket:can_modify_weapon(new_data.category, new_data.slot, new_data.name)
				if forbid then
					if type(new_data.unlocked) == "number" then
						new_data.unlocked = -math.abs(new_data.unlocked)
					else
						new_data.unlocked = false
					end
					new_data.lock_texture = self:get_lock_icon(new_data, "guis/textures/pd2/lock_incompatible")
					new_data.mid_text = nil
					new_data.conflict = managers.localization:text("bm_menu_" .. tostring(tweak_data.weapon.factory.parts[forbid] and tweak_data.weapon.factory.parts[forbid].type or forbid))
				end
				local replaces, removes = managers.blackmarket:get_modify_weapon_consequence(new_data.category, new_data.slot, new_data.name)
				new_data.removes = removes or {}
				local weapon = managers.blackmarket:get_crafted_category_slot(data.prev_node_data.category, data.prev_node_data.slot) or {}
				local gadget = nil
				local mod_td = tweak_data.weapon.factory.parts[new_data.name]
				local mod_type = mod_td.type
				local sub_type = mod_td.sub_type
				local is_auto = weapon and tweak_data.weapon[weapon.weapon_id] and tweak_data.weapon[weapon.weapon_id].FIRE_MODE == "auto"
				if mod_type == "gadget" then
					gadget = sub_type
				end
				local silencer = sub_type == "silencer" and true
				local texture = managers.menu_component:get_texture_from_mod_type(mod_type, sub_type, gadget, silencer, is_auto)
				new_data.desc_mini_icons = {}
				if DB:has(Idstring("texture"), texture) then
					table.insert(new_data.desc_mini_icons, {
						h = 16,
						w = 16,
						bottom = 0,
						right = 0,
						texture = texture
					})
				end
				local is_gadget = false
				if not new_data.conflict and new_data.unlocked and not is_gadget and not new_data.dlc_locked then
					new_data.comparision_data = managers.blackmarket:get_weapon_stats_with_mod(new_data.category, new_data.slot, mod_name)
				end
				if managers.blackmarket:got_new_drop(mod_global_value, "weapon_mods", mod_name) then
					new_data.mini_icons = new_data.mini_icons or {}
					table.insert(new_data.mini_icons, {
						texture = "guis/textures/pd2/blackmarket/inv_newdrop",
						name = "new_drop",
						h = 16,
						w = 16,
						top = 0,
						layer = 1,
						stream = false,
						right = 0
					})
					new_data.new_drop_data = {
						new_data.global_value or "normal",
						"weapon_mods",
						mod_name
					}
				end
			end
			local active = true
			local can_apply = not crafted.previewing
			local preview_forbidden = managers.blackmarket:is_previewing_legendary_skin() or managers.blackmarket:preview_mod_forbidden(new_data.category, new_data.slot, new_data.name)
			if mod_name and not crafted.customize_locked and active then
				if new_data.unlocked and (type(new_data.unlocked) ~= "number" or new_data.unlocked > 0) and can_apply then
					if new_data.can_afford then
						table.insert(new_data, "wm_buy")
					end
					if managers.blackmarket:is_previewing_any_mod() then
						table.insert(new_data, "wm_clear_mod_preview")
					end
					if not new_data.is_internal and not preview_forbidden then
						if managers.blackmarket:is_previewing_mod(new_data.name) then
							table.insert(new_data, "wm_remove_preview")
						else
							table.insert(new_data, "wm_preview_mod")
						end
					end
				else
					if managers.blackmarket:is_previewing_any_mod() then
						table.insert(new_data, "wm_clear_mod_preview")
					end
					if not new_data.is_internal and not preview_forbidden then
						if managers.blackmarket:is_previewing_mod(new_data.name) then
							table.insert(new_data, "wm_remove_preview")
						else
							table.insert(new_data, "wm_preview_mod")
						end
					end
				end
				if managers.workshop and managers.workshop:enabled() and not table.contains(managers.blackmarket:skin_editor():get_excluded_weapons(), weapon_id) then
					table.insert(new_data, "w_skin")
				end
				if new_data.unlocked then
					local weapon_mod_tweak = tweak_data.weapon.factory.parts[mod_name]
					if weapon_mod_tweak and weapon_mod_tweak.is_a_unlockable ~= true and can_apply then
						table.insert(new_data, "wm_buy_mod")
					end
				end
			end
			data[index] = new_data
		end
		for i = 1, math.max(math.ceil(num_steps / 6), 1) * 6, 1 do
			if not data[i] then
				local new_data = {
					name = "empty",
					name_localized = "",
					category = data.category,
					slot = i,
					unlocked = true,
					equipped = false
				}
				data[i] = new_data
			end
		end
		local weapon_blueprint = managers.blackmarket:get_weapon_blueprint(data.prev_node_data.category, data.prev_node_data.slot) or {}
		local equipped = nil
		for i, mod in ipairs(data) do
			for _, weapon_mod in ipairs(weapon_blueprint) do
				if mod.name == weapon_mod and (not global_values[weapon_mod] or global_values[weapon_mod] == data[i].global_value) then
					equipped = i

					break
				end
			end
		end
		if equipped then
			data[equipped].equipped = true
			data[equipped].unlocked = not crafted.customize_locked and (data[equipped].unlocked or true)
			data[equipped].mid_text = crafted.customize_locked and data[equipped].mid_text or nil
			data[equipped].lock_texture = crafted.customize_locked and data[equipped].lock_texture or nil
			data[equipped].corner_text = crafted.customize_locked and data[equipped].corner_text or nil
			for i = 1, #data[equipped], 1 do
				table.remove(data[equipped], 1)
			end
			data[equipped].price = 0
			data[equipped].can_afford = true
			if not crafted.customize_locked then
				table.insert(data[equipped], "wm_remove_buy")
				if not data[equipped].is_internal then
					local preview_forbidden = managers.blackmarket:is_previewing_legendary_skin() or managers.blackmarket:preview_mod_forbidden(data[equipped].category, data[equipped].slot, data[equipped].name)
					if managers.blackmarket:is_previewing_any_mod() then
						table.insert(data[equipped], "wm_clear_mod_preview")
					end
					if managers.blackmarket:is_previewing_mod(data[equipped].name) then
						table.insert(data[equipped], "wm_remove_preview")
					elseif not preview_forbidden then
						table.insert(data[equipped], "wm_preview_mod")
					end
				else
					table.insert(data[equipped], "wm_preview")
				end
				if managers.workshop and managers.workshop:enabled() and data.prev_node_data and not table.contains(managers.blackmarket:skin_editor():get_excluded_weapons(), data.prev_node_data.name) then
					table.insert(data[equipped], "w_skin")
				end
				local weapon_mod_tweak = tweak_data.weapon.factory.parts[data[equipped].name]
				if weapon_mod_tweak and weapon_mod_tweak.type ~= "bonus" and weapon_mod_tweak.is_a_unlockable ~= true then
					table.insert(data[equipped], "wm_buy_mod")
				end
			end
			local factory = tweak_data.weapon.factory.parts[data[equipped].name]
			if (data.name == "sight" or data.name == "gadget") and factory and factory.texture_switch then
				if not crafted.customize_locked then
					table.insert(data[equipped], "wm_reticle_switch_menu")
				end
				local reticle_texture = managers.blackmarket:get_part_texture_switch(data[equipped].category, data[equipped].slot, data[equipped].name)
				if reticle_texture and reticle_texture ~= "" then
					data[equipped].mini_icons = data[equipped].mini_icons or {}
					table.insert(data[equipped].mini_icons, {
						layer = 2,
						h = 30,
						stream = true,
						w = 30,
						blend_mode = "add",
						bottom = 1,
						right = 1,
						texture = reticle_texture
					})
				end
			end
			local mod_td = tweak_data.weapon.factory.parts[data[equipped].name]
			if (data.name == "gadget" or table.contains(mod_td.perks or {}, "gadget")) and (mod_td.sub_type == "laser" or mod_td.sub_type == "flashlight") then
				if not crafted.customize_locked then
					table.insert(data[equipped], "wm_customize_gadget")
				end
				local secondary_sub_type = false
				if mod_td.adds then
					for _, part_id in ipairs(mod_td.adds) do
						local sub_type = tweak_data.weapon.factory.parts[part_id].sub_type
						if sub_type == "laser" or sub_type == "flashlight" then
							secondary_sub_type = sub_type
							break
						end
					end
				end
				local colors = managers.blackmarket:get_part_custom_colors(data[equipped].category, data[equipped].slot, data[equipped].name)
				if colors then
					data[equipped].mini_colors = {}
					table.insert(data[equipped].mini_colors, {
						alpha = 0.8,
						blend = "add",
						color = colors[mod_td.sub_type] or Color(1, 0, 1)
					})
					if secondary_sub_type then
						table.insert(data[equipped].mini_colors, {
							alpha = 0.8,
							blend = "add",
							color = colors[secondary_sub_type] or Color(1, 0, 1)
						})
					end
				end
			end
			if not data[equipped].conflict and false then
				if data[equipped].default_mod then
					data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_with_mod(data[equipped].category, data[equipped].slot, data[equipped].default_mod)
				else
					data[equipped].comparision_data = managers.blackmarket:get_weapon_stats_without_mod(data[equipped].category, data[equipped].slot, data[equipped].name)
				end
			end
		end
	end

	function BlackMarketGui:_get_armor_stats(name)
		local base_stats = {}
		local mods_stats = {}
		local skill_stats = {}
		local detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data({armors = name}, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		detection_risk = math.round(detection_risk * 100)
		local bm_armor_tweak = tweak_data.blackmarket.armors[name]
		local upgrade_level = bm_armor_tweak.upgrade_level

		for i, stat in ipairs(self._armor_stats_shown) do
			base_stats[stat.name] = {value = 0}
			mods_stats[stat.name] = {value = 0}
			skill_stats[stat.name] = {value = 0}

			if stat.name == "armor" then
				local base = tweak_data.player.damage.ARMOR_INIT
				local mod = managers.player:body_armor_value("armor", upgrade_level)
				base_stats[stat.name] = {value = (base + mod) * tweak_data.gui.stats_present_multiplier}
				skill_stats[stat.name] = {value = (base_stats[stat.name].value + managers.player:body_armor_skill_addend(name) * tweak_data.gui.stats_present_multiplier) * managers.player:body_armor_skill_multiplier(name) - base_stats[stat.name].value}
			elseif stat.name == "health" then
				local base = tweak_data.player.damage.HEALTH_INIT
				local mod = managers.player:health_skill_addend()
				base_stats[stat.name] = {value = (base + mod) * tweak_data.gui.stats_present_multiplier}
				skill_stats[stat.name] = {value = base_stats[stat.name].value * managers.player:health_skill_multiplier() - base_stats[stat.name].value}
			elseif stat.name == "concealment" then
				base_stats[stat.name] = {value = managers.player:body_armor_value("concealment", upgrade_level)}
				skill_stats[stat.name] = {value = managers.blackmarket:concealment_modifier("armors", upgrade_level)}
			elseif stat.name == "movement" then
				local base = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 100 * tweak_data.gui.stats_present_multiplier
				local movement_penalty = managers.player:body_armor_value("movement", upgrade_level)
				local base_value = movement_penalty * base
				base_stats[stat.name] = {value = base_value}
				local skill_mod = managers.player:movement_speed_multiplier(false, false, upgrade_level, 1)
				local skill_value = skill_mod * base - base_value
				skill_stats[stat.name] = {
					value = skill_value,
					skill_in_effect = skill_value > 0
				}
			elseif stat.name == "dodge" then
				local base = 0
				local mod = managers.player:body_armor_value("dodge", upgrade_level)
				base_stats[stat.name] = {value = (base + mod) * 100}
				skill_stats[stat.name] = {value = managers.player:skill_dodge_chance(false, false, false, name, detection_risk) * 100}
			elseif stat.name == "damage_shake" then
				local base = tweak_data.gui.armor_damage_shake_base
				local mod = math.max(managers.player:body_armor_value("damage_shake", upgrade_level, nil, 1), 0.01)
				local skill = math.max(managers.player:upgrade_value("player", "damage_shake_multiplier", 1), 0.01)
				local base_value = base
				local mod_value = base / mod - base_value
				local skill_value = ((base / mod) / skill - base_value) - mod_value + managers.player:upgrade_value("player", "damage_shake_addend", 0)
				base_stats[stat.name] = {value = (base_value + mod_value) * tweak_data.gui.stats_present_multiplier}
				skill_stats[stat.name] = {value = skill_value * tweak_data.gui.stats_present_multiplier}
			elseif stat.name == "stamina" then
				local stamina_data = tweak_data.player.movement_state.stamina
				local base = stamina_data.STAMINA_INIT
				local mod = managers.player:body_armor_value("stamina", upgrade_level)
				local skill = managers.player:stamina_multiplier()
				local base_value = base
				local mod_value = base * mod - base_value
				local skill_value = (base * mod * skill - base_value) - mod_value
				base_stats[stat.name] = {value = base_value + mod_value}
				skill_stats[stat.name] = {value = skill_value}
			end

			skill_stats[stat.name].skill_in_effect = skill_stats[stat.name].skill_in_effect or skill_stats[stat.name].value ~= 0
		end

		if managers.player:has_category_upgrade("player", "armor_to_health_conversion") then
			local conversion_ratio = managers.player:upgrade_value("player", "armor_to_health_conversion") * 0.01
			local converted_armor = (base_stats.armor.value + skill_stats.armor.value) * conversion_ratio
			local skill_in_effect = converted_armor ~= 0
			skill_stats.armor.value = (base_stats.armor.value + skill_stats.armor.value) * -1
			skill_stats.health.value = skill_stats.health.value + converted_armor
			skill_stats.armor.skill_in_effect = skill_in_effect
			skill_stats.health.skill_in_effect = skill_in_effect
		end

		return base_stats, mods_stats, skill_stats
	end
end