require("lib/managers/menu/WalletGuiObject")
require("lib/utils/InventoryDescription")

local is_win32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not is_win32
local WIDTH_MULTIPLIER = NOT_WIN_32 and 0.68 or 0.71
local BOX_GAP = 13.5
local GRID_H_MUL = (NOT_WIN_32 and 6.9 or 6.95) / 8
local ITEMS_PER_ROW = 3
local ITEMS_PER_COLUMN = 3
local BUY_MASK_SLOTS = {
	6,
	3
}
local WEAPON_MODS_SLOTS = {
	6,
	1
}
local WEAPON_MODS_GRID_H_MUL = 0.126
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local tiny_font = tweak_data.menu.tiny_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local tiny_font_size = tweak_data.menu.pd2_tiny_font_size

local function format_round(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num):gsub("%.?0+$", "")
end

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
			if managers.dlc:is_content_achievement_locked("weapon_mods", new_data.name) or managers.dlc:is_content_achievement_milestone_locked("weapon_mods", new_data.name) then
				new_data.lock_texture = "guis/textures/pd2/lock_achievement"
			elseif managers.dlc:is_content_skirmish_locked("weapon_mods", new_data.name) then
				new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
			else
				local selected_text = managers.localization:text("bm_menu_no_items")
				new_data.corner_text = {
					selected_text = selected_text,
					noselected_text = selected_text
				}
			end
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
			if weapon_mod_tweak and weapon_mod_tweak.is_a_unlockable ~= true and can_apply and managers.custom_safehouse:unlocked() then
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
		elseif stat.name == "deflection" then
			local base = 0
			local mod = managers.player:body_armor_value("deflection", upgrade_level, 0)
			base_stats[stat.name] = {value = (base + mod) * 100}
			skill_stats[stat.name] = {value = managers.player:get_deflection_from_skills() * 100}
		elseif stat.name == "regen_time" then
			local base = tweak_data.player.damage.REGENERATE_TIME
			base_stats[stat.name] = {value = base}
			if managers.player:has_category_upgrade("player", "armor_grinding") then
				skill_stats[stat.name] = {value = tweak_data.upgrades.values.player.armor_grinding[1][upgrade_level][2] - base}
			else
				skill_stats[stat.name] = {value = base * managers.player:body_armor_regen_multiplier(false, 0) - base}
			end
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

--If this breaks then copy the vanilla version and change the value of self._armor_stats_shown to be
--[[
			self._armor_stats_shown = {
				{
					name = "armor"
				},
				{
					name = "health"
				},
				{
					name = "deflection"
				},
				{
					revert = true,
					name = "dodge"
				},
				{
					index = true,
					name = "concealment"
				},
				{
					name = "movement"
				},
				{
					name = "stamina"
				},
				{
					name = "regen_time"
				},
				{
					name = "damage_shake"
				}
			}
]]
-- Or just add the name = "deflection" to the table somewhere if you don't care much for a logical layout.
function BlackMarketGui:_setup(is_start_page, component_data)
	self._in_setup = true

	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end

	MenuCallbackHandler:chk_dlc_content_updated()

	self._item_bought = nil
	self._panel = self._ws:panel():panel({})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({
		layer = 40
	})

	self:set_layer(45)

	self._disabled_panel = self._fullscreen_panel:panel({
		layer = 100
	})

	WalletGuiObject.set_wallet(self._panel)

	self._data = component_data or self:_start_page_data()
	self._node:parameters().menu_component_data = self._data
	self._requested_textures = {}

	if self._data.init_callback_name then
		local clbk_func = callback(self, self, self._data.init_callback_name, self._data.init_callback_params)

		if clbk_func then
			clbk_func()
		end

		if self._data.init_callback_params and self._data.init_callback_params.run_once then
			self._data.init_callback_name = nil
			self._data.init_callback_params = nil
		end
	end

	if not self._data.skip_blur then
		self._data.blur_fade = self._data.blur_fade or 0
		local blur = self._fullscreen_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = -1,
			w = self._fullscreen_ws:panel():w(),
			h = self._fullscreen_ws:panel():h()
		})

		local function func(o, component_data)
			local start_blur = component_data.blur_fade

			over(0.6 - 0.6 * component_data.blur_fade, function (p)
				component_data.blur_fade = math.lerp(start_blur, 1, p)

				o:set_alpha(component_data.blur_fade)
			end)
		end

		blur:animate(func, self._data)
	end

	self._panel:text({
		vertical = "bottom",
		name = "back_button",
		align = "right",
		text = utf8.to_upper(managers.localization:text("menu_back")),
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.button_stage_3
	})
	self:make_fine_text(self._panel:child("back_button"))
	self._panel:child("back_button"):set_right(self._panel:w())
	self._panel:child("back_button"):set_bottom(self._panel:h())
	self._panel:child("back_button"):set_visible(managers.menu:is_pc_controller())

	self._pages = #self._data > 1 or self._data.show_tabs
	local grid_size = self._panel:h() - 70
	local grid_h_mul = self._data.panel_grid_h_mul or GRID_H_MUL
	local grid_panel_w = self._panel:w() * WIDTH_MULTIPLIER * (self._data.panel_grid_w_mul or 1)
	local grid_panel_h = grid_size * grid_h_mul
	local items_per_row = self._data[1] and self._data[1].override_slots and self._data[1].override_slots[1] or ITEMS_PER_ROW
	local items_per_column = self._data[1] and self._data[1].override_slots and self._data[1].override_slots[2] or ITEMS_PER_COLUMN
	grid_panel_w = math.ceil(grid_panel_w / items_per_row) * items_per_row
	grid_panel_h = math.ceil(grid_panel_h / items_per_column) * items_per_column
	local square_w = grid_panel_w / items_per_row
	local square_h = grid_panel_h / items_per_column
	local padding_w = 0
	local padding_h = 0
	local left_padding = 0
	local top_padding = 55 + (GRID_H_MUL - grid_h_mul) * grid_size
	local size_data = {
		grid_w = math.floor(grid_panel_w),
		grid_h = math.floor(grid_panel_h),
		items_per_row = items_per_row,
		items_per_column = items_per_column,
		square_w = math.floor(square_w),
		square_h = math.floor(square_h),
		padding_w = math.floor(padding_w),
		padding_h = math.floor(padding_h),
		left_padding = math.floor(left_padding),
		top_padding = math.floor(top_padding)
	}

	if grid_h_mul ~= GRID_H_MUL then
		self._no_input_panel = self._panel:panel({
			y = 60,
			w = grid_panel_w,
			h = top_padding - 60
		})
	end

	if self._data.use_bgs then
		local blur_panel = self._panel:panel({
			layer = -1,
			x = size_data.left_padding,
			y = size_data.top_padding + 33,
			w = size_data.grid_w,
			h = size_data.grid_h - 1
		})

		BlackMarketGui.blur_panel(blur_panel)
	end

	self._inception_node_name = self._node:parameters().menu_component_next_node_name or "blackmarket_node"
	self._preview_node_name = self._node:parameters().menu_component_preview_node_name or "blackmarket_preview_node"
	self._crafting_node_name = self._node:parameters().menu_component_crafting_node_name or "blackmarket_crafting_node"
	self._tabs = {}
	self._btns = {}
	self._title_text = self._panel:text({
		name = "title_text",
		text = managers.localization:to_upper_text(self._data.topic_id, self._data.topic_params),
		font_size = large_font_size,
		font = large_font,
		color = tweak_data.screen_colors.text
	})

	self:make_fine_text(self._title_text)

	if self._data.topic_colors then
		managers.menu_component:add_colors_to_text_object(self._title_text, self._data.topic_colors)
	elseif self._data.topic_color then
		managers.menu_component:make_color_text(self._title_text, self._data.topic_color)
	end

	self._tab_scroll_panel = self._panel:panel({
		w = grid_panel_w,
		y = top_padding + 1
	})
	self._tab_area_panel = self._panel:panel({
		w = grid_panel_w,
		y = top_padding + 1
	})
	self._tab_scroll_table = {
		panel = self._tab_scroll_panel
	}

	for i, data in ipairs(self._data) do
		if data.on_create_func_name then
			data.on_create_func = callback(self, self, data.on_create_func_name)
		end

		local new_tab_class = BlackMarketGuiTabItem

		if data.unique_tab_class then
			new_tab_class = _G[data.unique_tab_class]
		end

		local new_tab = new_tab_class:new(self._panel, data, self._node, size_data, not self._pages, self._tab_scroll_table, self)

		table.insert(self._tabs, new_tab)
	end

	if self._data.open_callback_name then
		local clbk_func = callback(self, self, self._data.open_callback_name, self._data.open_callback_params)

		if clbk_func then
			clbk_func()
		end
	end

	if #self._tabs > 0 then
		self._tab_area_panel:set_h(self._tabs[#self._tabs]._tab_panel:h())
	end

	self._selected = self._data.selected_tab or self._node:parameters().menu_component_selected or 1
	self._node:parameters().menu_component_selected = self._selected
	self._data.selected_tab = nil
	self._select_rect = self._panel:panel({
		name = "select_rect",
		layer = 8,
		w = square_w,
		h = square_h
	})

	if self._tabs[self._selected] then
		self._tabs[self._selected]:select(true)

		local slot_dim_x = self._tabs[self._selected].my_slots_dimensions[1]
		local slot_dim_y = self._tabs[self._selected].my_slots_dimensions[2]
		local _, any_slot = next(self._tabs[self._selected]._slots)

		if any_slot then
			self._select_rect:set_size(any_slot._panel:size())
		end

		self._select_rect_box = BoxGuiObject:new(self._select_rect, {
			sides = {
				2,
				2,
				2,
				2
			}
		})

		self._select_rect_box:set_clipping(false)

		self._box_panel = self._panel:panel()

		self._box_panel:set_shape(self._tabs[self._selected]._grid_panel:shape())

		self._box = BoxGuiObject:new(self._box_panel, {
			sides = {
				1,
				1,
				1 + (#self._tabs > 1 and 1 or 0),
				1
			}
		})
		local info_box_top = 88
		local info_box_size = self._panel:h() - 70
		local info_box_w = math.floor(self._panel:w() * (1 - WIDTH_MULTIPLIER) - BOX_GAP)
		local info_box_h = grid_panel_h

		if self._data.panel_grid_h_mul then
			info_box_h = math.floor(info_box_size * GRID_H_MUL)
		end

		self._extra_options_data = self._data.extra_options_data

		if self._data.extra_options_panel then
			self._extra_options_panel = self._panel:panel({
				name = "extra_options_panel"
			})

			self._extra_options_panel:set_size(info_box_w, self._data.extra_options_panel.height or self._data.extra_options_panel.h or 50)
			self._extra_options_panel:set_right(self._panel:w())
			self._extra_options_panel:set_top(info_box_top)

			local panel = self._extra_options_panel:panel()

			if self._data.extra_options_panel.on_create_func_name then
				if self._extra_options_data then
					self._extra_options_data.selected = math.min(self._extra_options_data.selected or 1, managers.blackmarket:num_preferred_characters() + 1, CriminalsManager.get_num_characters())
				end

				local selected = math.min(self._extra_options_data and self._extra_options_data.selected or 1, managers.blackmarket:num_preferred_characters() + 1, CriminalsManager.get_num_characters())
				self._extra_options_data = callback(self, self, self._data.extra_options_panel.on_create_func_name)(panel)
				self._extra_options_data.selected = selected
				local num_panels = 0

				for i = 1, #self._extra_options_data do
					if self._extra_options_data[i].panel then
						num_panels = num_panels + 1
					end
				end

				self._extra_options_data.num_panels = num_panels
			end

			self._extra_options_box = BoxGuiObject:new(self._extra_options_panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})
			local h = self._extra_options_panel:h() + 5
			info_box_top = info_box_top + h
			info_box_h = info_box_h - h
			self._data.extra_options_data = self._extra_options_data

			if is_win32 then
				self._ws:connect_keyboard(Input:keyboard())
				self._panel:key_press(callback(self, self, "extra_option_key_press"))

				self._keyboard_connected = true
			end
		end

		if self._data.add_market_panel then
			self._market_panel = self._panel:panel({
				visible = true,
				name = "market_panel",
				h = 140,
				layer = 1,
				y = info_box_top,
				w = info_box_w
			})

			self._market_panel:set_right(self._panel:w())
			self._market_panel:rect({
				alpha = 0.25,
				layer = -1,
				color = Color.black
			})

			self._market_border = BoxGuiObject:new(self._market_panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})
			local h = self._market_panel:h() + 5
			local market_bundles = {}

			for entry, safe in pairs(tweak_data.economy.safes) do
				if not safe.promo then
					table.insert(market_bundles, {
						content = safe.content or "NONE",
						safe = entry,
						drill = safe.drill,
						prio = safe.prio or 0
					})
				end
			end

			local loc_sort = {}

			table.sort(market_bundles, function (x, y)
				if x.prio ~= y.prio then
					return (x.prio or 0) < (y.prio or 0)
				end

				if not loc_sort[x.safe] then
					loc_sort[x.safe] = managers.localization:text(tweak_data.economy.safes[x.safe].name_id)
				end

				if not loc_sort[y.safe] then
					loc_sort[y.safe] = managers.localization:text(tweak_data.economy.safes[y.safe].name_id)
				end

				return loc_sort[x.safe] < loc_sort[y.safe]
			end)

			local num_market_bundles = #market_bundles

			if managers.menu:is_pc_controller() and num_market_bundles > 0 then
				info_box_top = info_box_top + h
				info_box_h = info_box_h - h
				local title_text = self._panel:text({
					text = managers.localization:to_upper_text("menu_steam_market_inspect_title"),
					font = small_font,
					font_size = small_font_size,
					color = tweak_data.screen_colors.text
				})

				self:make_fine_text(title_text)
				title_text:set_left(self._market_panel:left())
				title_text:set_bottom(self._market_panel:top())

				local padding = 10
				local w = self._market_panel:w() - 2 * padding
				local h = self._market_panel:h() - 2 * padding
				local size = math.min(w / 2, h - 2 * small_font_size - padding * 0.5)
				local panel, safe_panel, drill_panel, safe_text, drill_text, safe_market_panel, drill_market_panel, title_text = nil
				self._market_bundles = {}
				self._data.active_market_bundle = self._data.active_market_bundle or 1
				local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar_arrow")
				local select_bg = self._market_panel:rect({
					blend_mode = "add",
					layer = -2,
					color = tweak_data.screen_colors.button_stage_3:with_alpha(0.2)
				})
				local arrow_left = self._market_panel:bitmap({
					blend_mode = "add",
					texture = "guis/textures/menu_arrows",
					texture_rect = {
						24,
						0,
						24,
						24
					},
					color = tweak_data.screen_colors.button_stage_3,
					y = padding
				})
				local arrow_right = self._market_panel:bitmap({
					texture = "guis/textures/menu_arrows",
					blend_mode = "add",
					rotation = 180,
					texture_rect = {
						24,
						0,
						24,
						24
					},
					color = tweak_data.screen_colors.button_stage_3,
					y = padding
				})

				arrow_left:set_world_y(math.round(arrow_left:world_y()))
				arrow_right:set_world_y(math.round(arrow_right:world_y()) + 1)
				arrow_right:set_right(self._market_panel:w() - padding)
				arrow_left:set_left(padding)
				select_bg:set_shape(arrow_left:left(), arrow_left:top(), arrow_right:right() - arrow_left:left(), arrow_left:h())

				self._market_bundles.arrow_left = arrow_left
				self._market_bundles.arrow_right = arrow_right
				self._market_bundles.num_bundles = num_market_bundles
				self._market_bundles.market_bundles = market_bundles

				for i, bundle in ipairs(market_bundles) do
					panel = self._market_panel:panel({
						name = tostring(i),
						x = padding,
						y = padding,
						w = w,
						h = h,
						visible = i == self._data.active_market_bundle
					})
					title_text = panel:text({
						vertical = "center",
						h = 24,
						align = "center",
						halign = "center",
						valign = "center",
						text = managers.localization:to_upper_text("menu_steam_market_content_" .. bundle.content),
						font = small_font,
						font_size = small_font_size,
						color = tweak_data.screen_colors.button_stage_2
					})

					self:make_fine_text(title_text)
					title_text:set_center(panel:w() / 2, 12)

					local guis_catalog = "guis/"
					local bundle_folder = tweak_data.economy.safes[bundle.safe].texture_bundle_folder

					if bundle_folder then
						guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
					end

					local path = "safes/"
					local texture_path = guis_catalog .. path .. bundle.safe
					safe_panel = panel:panel({
						alpha = 0.9,
						name = "safe",
						y = small_font_size + padding * 0.5,
						w = size,
						h = size
					})

					safe_panel:set_center_x(w * 0.5)
					self:request_texture(texture_path, safe_panel, true, "normal")

					safe_text = panel:text({
						blend_mode = "add",
						text = managers.localization:to_upper_text("menu_steam_market_show_content"),
						font = small_font,
						font_size = small_font_size,
						x = safe_panel:x(),
						y = safe_panel:bottom() + 1,
						color = tweak_data.screen_colors.button_stage_3
					})

					self:make_fine_text(safe_text)
					safe_text:set_center_x(safe_panel:center_x())

					safe_market_panel = panel:panel({
						x = safe_panel:x(),
						y = safe_panel:y(),
						w = safe_panel:w(),
						h = safe_panel:h() + small_font_size
					})
					local guis_catalog = "guis/"
					local bundle_folder = tweak_data.economy.drills[bundle.drill].texture_bundle_folder

					if bundle_folder then
						guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
					end

					if not tweak_data.economy.safes[bundle.safe].free then
						local path = "drills/"
						local texture_path = guis_catalog .. path .. bundle.drill
						drill_panel = panel:panel({
							alpha = 0.9,
							name = "drill",
							y = small_font_size + padding * 0.5,
							w = size,
							h = size
						})

						drill_panel:set_center_x(w * 0.75)
						self:request_texture(texture_path, drill_panel, true, "normal")

						drill_text = panel:text({
							text = managers.localization:to_upper_text("menu_steam_market_buy_drill"),
							font = small_font,
							font_size = small_font_size,
							x = drill_panel:x(),
							y = drill_panel:bottom() + 1,
							color = tweak_data.screen_colors.button_stage_3
						})

						self:make_fine_text(drill_text)
						drill_text:set_center_x(drill_panel:center_x())
						drill_text:set_x(math.round(drill_text:x()))

						drill_market_panel = panel:panel({
							x = drill_panel:x(),
							y = drill_panel:y(),
							w = drill_panel:w(),
							h = drill_panel:h() + small_font_size
						})
					else
						drill_text = nil
						drill_panel = nil
						drill_market_panel = nil
					end

					self._market_bundles[i] = {
						panel = panel,
						safe = {
							entry = bundle.safe,
							image = safe_panel,
							text = safe_text,
							select = safe_market_panel
						},
						drill = {
							entry = bundle.drill,
							image = drill_panel,
							text = drill_text,
							select = drill_market_panel
						}
					}
				end
			else
				self._market_panel:hide()
				self._market_panel:set_h(0)
			end
		end

		local info_box_panel = self._panel:panel({
			name = "info_box_panel"
		})

		info_box_panel:set_size(info_box_w, info_box_h)
		info_box_panel:set_right(self._panel:w())
		info_box_panel:set_top(info_box_top)

		self._selected_slot = self._tabs[self._selected]:select_slot(nil, true)
		self._slot_data = self._selected_slot._data
		local x, y = self._tabs[self._selected]:selected_slot_center()

		self._select_rect:set_world_center(x, y)

		local BTNS = {
			w_move = {
				btn = "BTN_A",
				name = "bm_menu_btn_move_weapon",
				prio = managers.menu:is_pc_controller() and 5 or 1,
				callback = callback(self, self, "pickup_crafted_item_callback")
			},
			w_place = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_place_weapon",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			w_swap = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_swap_weapon",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			m_move = {
				btn = "BTN_A",
				prio = 5,
				name = "bm_menu_btn_move_mask",
				callback = callback(self, self, "pickup_crafted_item_callback")
			},
			m_place = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_place_mask",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			m_swap = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_swap_mask",
				callback = callback(self, self, "place_crafted_item_callback")
			},
			i_stop_move = {
				btn = "BTN_X",
				name = "bm_menu_btn_stop_move",
				prio = 2,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "drop_hold_crafted_item_callback")
			},
			i_rename = {
				btn = "BTN_BACK",
				name = "bm_menu_btn_rename_item",
				prio = 2,
				pc_btn = "toggle_chat",
				callback = callback(self, self, "rename_item_with_gamepad_callback")
			},
			w_mod = {
				btn = "BTN_Y",
				name = "bm_menu_btn_mod",
				prio = 2,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "choose_weapon_mods_callback")
			},
			w_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_weapon",
				callback = callback(self, self, "equip_weapon_callback")
			},
			w_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_weapon_callback")
			},
			w_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell",
				prio = 4,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "sell_item_callback")
			},
			w_skin = {
				btn = "BTN_STICK_L",
				name = "bm_menu_btn_skin",
				prio = 5,
				pc_btn = "menu_edit_skin",
				callback = callback(self, self, "edit_weapon_skin_callback")
			},
			w_unequip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_unequip_weapon",
				callback = function ()
				end
			},
			ew_unlock = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_weapon_slot",
				callback = callback(self, self, "choose_weapon_slot_unlock_callback")
			},
			ew_buy = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_new_weapon",
				callback = callback(self, self, "choose_weapon_buy_callback")
			},
			bw_buy = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_selected_weapon",
				callback = callback(self, self, "buy_weapon_callback")
			},
			bw_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_buy_weapon_callback")
			},
			bw_available_mods = {
				btn = "BTN_Y",
				name = "bm_menu_available_mods",
				prio = 2,
				pc_btn = "menu_preview_item_alt",
				callback = callback(self, self, "show_available_mods_callback")
			},
			bw_buy_dlc = {
				btn = "BTN_X",
				name = "bm_menu_buy_dlc",
				prio = 4,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "show_buy_dlc_callback")
			},
			bw_preview_mods = {
				btn = "BTN_Y",
				name = "bm_menu_preview_mods",
				prio = 2,
				pc_btn = "menu_preview_item_alt",
				callback = callback(self, self, "preview_weapon_mods_callback")
			},
			mt_choose = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_choose",
				callback = callback(self, self, "choose_mod_callback")
			},
			wm_buy = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_craft_mod",
				callback = callback(self, self, "buy_mod_callback")
			},
			wm_preview = {
				btn = "BTN_Y",
				name = "bm_menu_btn_preview",
				prio = 3,
				pc_btn = "menu_preview_item_alt",
				callback = callback(self, self, "preview_weapon_mod_callback")
			},
			wm_preview_mod = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_with_mod",
				prio = 4,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_weapon_with_mod_callback")
			},
			wm_remove_buy = {
				btn = "BTN_X",
				name = "bm_menu_btn_remove_mod",
				prio = 2,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "remove_mod_callback")
			},
			wm_remove_preview_mod = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_with_mod",
				prio = 4,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_weapon_mod_callback")
			},
			wm_remove_preview = {
				btn = "BTN_Y",
				name = "bm_menu_btn_preview_no_mod",
				prio = 3,
				pc_btn = "menu_preview_item_alt",
				callback = callback(self, self, "preview_weapon_without_mod_callback")
			},
			wm_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell",
				prio = 2,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "sell_weapon_mods_callback")
			},
			wm_reticle_switch_menu = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_switch_reticle",
				callback = callback(self, self, "open_reticle_switch_menu")
			},
			wm_buy_mod = {
				btn = "BTN_BACK",
				name = "bm_menu_btn_buy_mod",
				prio = 4,
				pc_btn = "toggle_chat",
				callback = callback(self, self, "purchase_weapon_mod_callback")
			},
			wm_clear_mod_preview = {
				btn = "BTN_Y",
				name = "bm_menu_btn_clear_mod_preview",
				prio = 3,
				pc_btn = "menu_preview_item_alt",
				callback = callback(self, self, "clear_weapon_mod_preview_callback")
			},
			wm_customize_gadget = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_customize_gadget",
				callback = callback(self, self, "open_customize_gadget_menu")
			},
			wcs_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_weapon_cosmetic",
				callback = callback(self, self, "equip_weapon_color_callback")
			},
			wcs_customize_color = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_customize_weapon_color",
				callback = callback(self, self, "open_customize_weapon_color_menu")
			},
			wcc_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_weapon_cosmetic",
				callback = callback(self, self, "equip_weapon_cosmetics_callback")
			},
			wcc_choose = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_choose_weapon_cosmetic",
				callback = callback(self, self, "choose_weapon_cosmetics_callback")
			},
			wcc_remove = {
				btn = "BTN_X",
				name = "bm_menu_btn_remove_weapon_cosmetic",
				prio = 1,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "remove_weapon_cosmetics_callback")
			},
			wcc_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_weapon_cosmetic",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_cosmetic_on_weapon_callback")
			},
			wcc_buy_equip_weapon = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_new_weapon",
				callback = callback(self, self, "buy_equip_weapon_cosmetics_callback")
			},
			wcc_cancel_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_stop_preview_weapon_cosmetic",
				prio = 4,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "cancel_preview_cosmetic_on_weapon_callback")
			},
			wcc_market = {
				btn = "BTN_X",
				name = "bm_menu_btn_buy_tradable",
				prio = 5,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "purchase_market_cosmetic_on_weapon_callback")
			},
			it_wcc_choose_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_weapon_cosmetic",
				callback = callback(self, self, "choose_equip_weapon_cosmetics_callback")
			},
			it_wcc_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_weapon_cosmetic",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_weapon_cosmetics_callback")
			},
			it_copen = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_open_container",
				callback = callback(self, self, "start_open_tradable_container_callback")
			},
			it_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell_tradable",
				prio = 4,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "sell_tradable_item")
			},
			it_wcc_armor_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_armor_skin",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_armor_skin_callback")
			},
			a_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_armor",
				callback = callback(self, self, "equip_armor_callback")
			},
			a_mod = {
				btn = "BTN_Y",
				name = "bm_menu_btn_customize_armor",
				prio = 2,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "open_armor_skins_menu_callback")
			},
			as_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_armor_skin",
				callback = callback(self, self, "equip_armor_skin_callback")
			},
			as_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_armor_skin",
				prio = 1,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_armor_skin_callback")
			},
			as_workshop = {
				btn = "BTN_STICK_L",
				name = "bm_menu_btn_skin",
				prio = 5,
				pc_btn = "menu_edit_skin",
				callback = callback(self, self, "edit_armor_skin_callback")
			},
			trd_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_player_style",
				callback = callback(self, self, "equip_player_style_callback")
			},
			trd_customize = {
				btn = "BTN_Y",
				name = "bm_menu_btn_customize_player_style",
				prio = 2,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "customize_player_style_callback")
			},
			trd_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_player_style",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_player_style_callback")
			},
			trd_mod_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_suit_variation",
				callback = callback(self, self, "equip_suit_variation_callback")
			},
			trd_mod_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_suit_variation",
				prio = 2,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_suit_variation_callback")
			},
			m_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_mask",
				callback = callback(self, self, "equip_mask_callback")
			},
			m_mod = {
				btn = "BTN_Y",
				name = "bm_menu_btn_mod_mask",
				prio = 2,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "mask_mods_callback")
			},
			m_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_mask_callback")
			},
			m_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell_mask",
				prio = 4,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "sell_mask_callback")
			},
			m_remove = {
				btn = "BTN_X",
				name = "bm_menu_btn_remove_mask",
				prio = 4,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "remove_mask_callback")
			},
			em_gv = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_new_mask",
				callback = callback(self, self, "choose_mask_global_value_callback")
			},
			em_buy = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_new_mask",
				callback = callback(self, self, "choose_mask_buy_callback")
			},
			em_unlock = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_mask_slot",
				callback = callback(self, self, "choose_mask_slot_unlock_callback")
			},
			em_available_mods = {
				btn = "BTN_Y",
				name = "bm_menu_buy_mask_title",
				prio = 3,
				pc_btn = "menu_preview_item_alt",
				callback = callback(self, self, "show_available_mask_mods_callback")
			},
			mm_choose_textures = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_choose_pattern",
				callback = callback(self, self, "choose_mask_mod_callback", "textures")
			},
			mm_choose_materials = {
				btn = "BTN_A",
				prio = 2,
				name = "bm_menu_choose_material",
				callback = callback(self, self, "choose_mask_mod_callback", "materials")
			},
			mm_choose_colors = {
				btn = "BTN_A",
				prio = 3,
				name = "bm_menu_choose_color",
				callback = callback(self, self, "choose_mask_mod_callback", "colors")
			},
			mm_choose = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_choose_mask_mod",
				callback = callback(self, self, "choose_mask_type_callback")
			},
			mm_buy = {
				btn = "BTN_Y",
				name = "bm_menu_btn_customize_mask",
				prio = 5,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "buy_customized_mask_callback")
			},
			mm_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				prio = 4,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_choose = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_choose_mask_mod",
				callback = callback(self, self, "choose_mask_part_callback")
			},
			mp_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				prio = 2,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_customized_mask_callback")
			},
			mp_preview_mod = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				prio = 2,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_customized_mask_with_mod_callback")
			},
			bm_buy = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_buy_selected_mask",
				callback = callback(self, self, "buy_mask_callback")
			},
			bm_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_mask",
				prio = 2,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_buy_mask_callback")
			},
			bm_sell = {
				btn = "BTN_X",
				name = "bm_menu_btn_sell_mask",
				prio = 4,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "sell_stashed_mask_callback")
			},
			c_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_set_preferred",
				callback = callback(self, self, "set_preferred_character_callback")
			},
			c_swap_slots = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_swap_preferred_slots",
				callback = callback(self, self, "swap_preferred_character_to_slot_callback")
			},
			c_equip_to_slot = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_set_preferred_to_slot",
				callback = callback(self, self, "set_preferred_character_to_slot_callback")
			},
			c_clear_slots = {
				btn = "BTN_X",
				name = "bm_menu_btn_clear_preferred",
				prio = 2,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "clear_preferred_characters_callback")
			},
			lo_w_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_weapon",
				callback = callback(self, self, "equip_weapon_callback")
			},
			lo_d_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_deployable",
				callback = callback(self, self, "lo_equip_deployable_callback")
			},
			lo_d_equip_primary = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_primary_deployable",
				callback = callback(self, self, "lo_equip_deployable_callback")
			},
			lo_d_equip_secondary = {
				btn = "BTN_X",
				name = "bm_menu_btn_equip_secondary_deployable",
				prio = 2,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "lo_equip_deployable_callback_secondary")
			},
			lo_d_unequip = {
				btn = "BTN_X",
				name = "bm_menu_btn_unequip_deployable",
				prio = 1,
				pc_btn = "menu_remove_item",
				callback = callback(self, self, "lo_unequip_deployable_callback")
			},
			lo_mw_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_melee_weapon",
				callback = callback(self, self, "lo_equip_melee_weapon_callback")
			},
			lo_mw_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_melee_weapon",
				prio = 2,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_melee_weapon_callback")
			},
			lo_mw_add_favorite = {
				btn = "BTN_Y",
				name = "bm_menu_btn_add_favorite",
				prio = 3,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "add_melee_weapon_favorite")
			},
			lo_mw_remove_favorite = {
				btn = "BTN_Y",
				name = "bm_menu_btn_remove_favorite",
				prio = 3,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "remove_melee_weapon_favorite")
			},
			lo_g_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_grenade",
				callback = callback(self, self, "lo_equip_grenade_callback")
			},
			lo_g_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_grenade",
				prio = 2,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_grenade_callback")
			},
			custom_select = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_select",
				callback = function ()
				end
			},
			custom_unselect = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_unselect",
				callback = function ()
				end
			},
			ci_unlock = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_unlock_crew_item",
				callback = callback(self, self, "buy_crew_item_callback")
			}
		}

		--[[
			--Extended Continental Coin Shop Goonmod Standalone support
			if GageModShop then
				local bm_modshop = {
					prio = 5,
					btn = "BTN_BACK",
					pc_btn = "toggle_chat",
					name = "gm_gms_purchase",
					callback = callback(self, self, "modshop_purchase_mask_callback")
				}
			
				local mp_modshop = {
					prio = 5,
					btn = "BTN_BACK",
					pc_btn = "toggle_chat",
					name = "gm_gms_purchase",
					callback = callback(self, self, "modshop_purchase_mask_part_callback")
				}
			end
		]]
		for btn, data in pairs(BTNS) do
			data.callback = callback(self, self, "overridable_callback", {
				button = btn,
				callback = data.callback
			})
		end

		local get_real_font_sizes = false
		local real_small_font_size = small_font_size

		if get_real_font_sizes then
			local test_text = self._panel:text({
				visible = false,
				font = small_font,
				font_size = small_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L")
			})
			local x, y, w, h = test_text:text_rect()
			real_small_font_size = h

			self._panel:remove(test_text)

			test_text = nil
		end

		self._real_small_font_size = real_small_font_size
		local real_medium_font_size = medium_font_size

		if get_real_font_sizes then
			local test_text = self._panel:text({
				visible = false,
				font = medium_font,
				font_size = medium_font_size,
				text = "TeWqjI-" .. managers.localization:get_default_macro("BTN_BOTTOM_L")
			})
			local x, y, w, h = test_text:text_rect()
			real_medium_font_size = h
			Global.test_text = test_text
		end

		self._real_medium_font_size = real_medium_font_size
		self._info_box_panel_y = info_box_panel:y()
		self._weapon_info_panel = self._panel:panel({
			x = info_box_panel:x(),
			y = info_box_panel:y(),
			w = info_box_panel:w()
		})
		self._detection_panel = self._panel:panel({
			name = "suspicion_panel",
			h = 64,
			layer = 1,
			x = info_box_panel:x(),
			y = info_box_panel:y() + 250,
			w = info_box_panel:w()
		})
		self._btn_panel = self._panel:panel({
			name = "btn_panel",
			h = 136,
			x = info_box_panel:x(),
			w = info_box_panel:w()
		})

		self._weapon_info_panel:set_h(info_box_panel:h() - self._btn_panel:h() - 8 - self._detection_panel:h() - 8)
		self._detection_panel:set_top(self._weapon_info_panel:bottom() + 8)
		self._btn_panel:set_top(self._detection_panel:bottom() + 8)

		self._weapon_info_border = BoxGuiObject:new(self._weapon_info_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._detection_border = BoxGuiObject:new(self._detection_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		self._button_border = BoxGuiObject:new(self._btn_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		if self._data.use_bgs then
			BlackMarketGui.blur_panel(self._weapon_info_panel)
			BlackMarketGui.blur_panel(self._detection_panel)
			BlackMarketGui.blur_panel(self._btn_panel)
		end

		local scale = 0.75
		local detection_ring_left_bg = self._detection_panel:bitmap({
			blend_mode = "add",
			name = "detection_left_bg",
			h = 64,
			w = 64,
			alpha = 0.2,
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			x = 8,
			layer = 1
		})
		local detection_ring_right_bg = self._detection_panel:bitmap({
			blend_mode = "add",
			name = "detection_right_bg",
			h = 64,
			w = 64,
			alpha = 0.2,
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			x = 8,
			layer = 1
		})

		detection_ring_left_bg:set_size(detection_ring_left_bg:w() * scale, detection_ring_left_bg:h() * scale)
		detection_ring_right_bg:set_size(detection_ring_right_bg:w() * scale, detection_ring_right_bg:h() * scale)
		detection_ring_right_bg:set_texture_rect(64, 0, -64, 64)
		detection_ring_left_bg:set_center_y(self._detection_panel:h() / 2)
		detection_ring_right_bg:set_center_y(self._detection_panel:h() / 2)

		local detection_ring_left = self._detection_panel:bitmap({
			blend_mode = "add",
			name = "detection_left",
			h = 64,
			x = 8,
			w = 64,
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			render_template = "VertexColorTexturedRadial",
			layer = 1
		})
		local detection_ring_right = self._detection_panel:bitmap({
			blend_mode = "add",
			name = "detection_right",
			h = 64,
			x = 8,
			w = 64,
			texture = "guis/textures/pd2/blackmarket/inv_detection_meter",
			render_template = "VertexColorTexturedRadial",
			layer = 1
		})

		detection_ring_left:set_size(detection_ring_left:w() * scale, detection_ring_left:h() * scale)
		detection_ring_right:set_size(detection_ring_right:w() * scale, detection_ring_right:h() * scale)
		detection_ring_right:set_texture_rect(64, 0, -64, 64)
		detection_ring_left:set_center_y(self._detection_panel:h() / 2)
		detection_ring_right:set_center_y(self._detection_panel:h() / 2)

		local detection_value = self._detection_panel:text({
			blend_mode = "add",
			name = "detection_value",
			layer = 1,
			font_size = medium_font_size,
			font = medium_font,
			color = tweak_data.screen_colors.text
		})

		detection_value:set_x(detection_ring_left_bg:x() + detection_ring_left_bg:w() / 2 - medium_font_size / 2 + 2)
		detection_value:set_y(detection_ring_left_bg:y() + detection_ring_left_bg:h() / 2 - medium_font_size / 2 + 2)

		local detection_text = self._detection_panel:text({
			blend_mode = "add",
			name = "detection_text",
			layer = 1,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_detection"))
		})

		detection_text:set_left(detection_ring_left:right() + 8)
		detection_text:set_y(detection_ring_left:y() + detection_ring_left_bg:h() / 2 - medium_font_size / 2 + 2)

		self._buttons = self._btn_panel:panel({
			y = 8
		})
		local btn_x = 10

		for btn, btn_data in pairs(BTNS) do
			local new_btn = BlackMarketGuiButtonItem:new(self._buttons, btn_data, btn_x)
			self._btns[btn] = new_btn
		end

		self._armor_info_panel = self._weapon_info_panel:panel({
			layer = 10,
			w = self._weapon_info_panel:w(),
			h = self._weapon_info_panel:h()
		})
		local armor_info_panel = self._armor_info_panel
		local armor_image = armor_info_panel:bitmap({
			texture = "guis/textures/pd2/endscreen/exp_ring",
			name = "armor_image",
			h = 96,
			y = 10,
			w = 96,
			blend_mode = "normal",
			x = 10
		})
		local armor_name = armor_info_panel:text({
			name = "armor_name_text",
			wrap = true,
			word_wrap = true,
			text = "Improved Combined Tactical Vest",
			y = 10,
			layer = 1,
			font_size = medium_font_size,
			font = medium_font,
			color = tweak_data.screen_colors.text,
			x = armor_image:right() + 10,
			w = armor_info_panel:w() - armor_image:right() - 20,
			h = medium_font_size * 2
		})
		local equip_text = armor_info_panel:text({
			name = "armor_equipped",
			layer = 1,
			font_size = small_font_size * 0.9,
			font = small_font,
			color = tweak_data.screen_colors.text,
			text = managers.localization:to_upper_text("bm_menu_equipped"),
			x = armor_image:right() + 10,
			y = armor_name:bottom(),
			w = armor_info_panel:w() - armor_image:right() - 20,
			h = small_font_size
		})
		self._info_texts = {}
		self._info_texts_panel = self._weapon_info_panel:panel({
			x = 10,
			y = 10,
			w = self._weapon_info_panel:w() - 20,
			h = self._weapon_info_panel:h() - 20 - real_small_font_size * 3
		})

		table.insert(self._info_texts, self._info_texts_panel:text({
			text = "",
			name = "info_text_1",
			layer = 1,
			font_size = medium_font_size,
			font = medium_font,
			color = tweak_data.screen_colors.text
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			text = "",
			wrap = true,
			name = "info_text_2",
			word_wrap = true,
			layer = 1,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			name = "info_text_3",
			blend_mode = "add",
			wrap = true,
			word_wrap = true,
			text = "",
			layer = 1,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.important_1
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			text = "",
			wrap = true,
			name = "info_text_4",
			word_wrap = true,
			layer = 1,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.text
		}))
		table.insert(self._info_texts, self._info_texts_panel:text({
			text = "",
			wrap = true,
			name = "info_text_5",
			word_wrap = true,
			layer = 1,
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.important_1
		}))

		self._info_texts_color = {}
		self._info_texts_bg = {}

		for i, info_text in ipairs(self._info_texts) do
			self._info_texts_color[i] = info_text:color()
			self._info_texts_bg[i] = self._info_texts_panel:rect({
				alpha = 0.2,
				visible = false,
				layer = 0,
				color = Color.black
			})

			self._info_texts_bg[i]:set_shape(info_text:shape())
		end

		local h = real_small_font_size
		local longest_text_w = 0

		if self._data.info_callback then
			self._info_panel = self._panel:panel({
				name = "info_panel",
				layer = 1,
				w = self._btn_panel:w()
			})
			local info_table = self._data.info_callback()

			for i, info in ipairs(info_table) do
				local info_name = info.name or ""
				local info_string = info.text or ""
				local info_color = info.color or tweak_data.screen_colors.text
				local category_text = self._info_panel:text({
					w = 0,
					layer = 1,
					name = "category_" .. tostring(i),
					y = (i - 1) * h,
					h = h,
					font_size = h,
					font = small_font,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_" .. tostring(info_name)))
				})
				local status_text = self._info_panel:text({
					w = 0,
					layer = 1,
					name = "status_" .. tostring(i),
					y = (i - 1) * h,
					h = h,
					font_size = h,
					font = small_font,
					color = info_color,
					text = utf8.to_upper(managers.localization:text(info_string))
				})

				if info_string == "" then
					category_text:set_color(info_color)
				end

				local _, _, w, _ = category_text:text_rect()

				if longest_text_w < w then
					longest_text_w = w + 10
				end
			end

			for name, text in ipairs(self._info_panel:children()) do
				if string.split(text:name(), "_")[1] == "category" then
					text:set_w(longest_text_w)
					text:set_x(0)
				else
					local _, _, w, _ = text:text_rect()

					text:set_w(w)
					text:set_x(math.round(longest_text_w + 5))
				end
			end
		else
			self._stats_shown = {
				{
					round_value = true,
					name = "magazine",
					stat_name = "extra_ammo"
				},
				{
					round_value = true,
					name = "totalammo",
					stat_name = "total_ammo_mod"
				},
				{
					round_value = true,
					name = "fire_rate"
				},
				{
					name = "damage"
				},
				{
					percent = true,
					name = "spread",
					offset = true,
					revert = true
				},
				{
					percent = true,
					name = "recoil",
					offset = true,
					revert = true
				},
				{
					index = true,
					name = "concealment"
				},
				{
					percent = false,
					name = "suppression",
					offset = true
				},
				{
					inverted = true,
					name = "reload"
				},
				{
					inverted = true,
					name = "swap_speed"
				}
			}

			self._stats_panel = self._weapon_info_panel:panel({
				y = 58,
				x = 10,
				layer = 1,
				w = self._weapon_info_panel:w() - 20,
				h = self._weapon_info_panel:h() - 84
			})
			local panel = self._stats_panel:panel({
				h = 20,
				layer = 1,
				w = self._stats_panel:w()
			})

			panel:rect({
				color = Color.black:with_alpha(0.5)
			})

			self._stats_titles = {
				equip = self._stats_panel:text({
					x = 120,
					layer = 2,
					font_size = small_font_size,
					font = small_font,
					color = tweak_data.screen_colors.text
				}),
				base = self._stats_panel:text({
					alpha = 0.75,
					x = 170,
					layer = 2,
					font_size = small_font_size,
					font = small_font,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))
				}),
				mod = self._stats_panel:text({
					alpha = 0.75,
					x = 215,
					layer = 2,
					font_size = small_font_size,
					font = small_font,
					color = tweak_data.screen_colors.stats_mods,
					text = utf8.to_upper(managers.localization:text("bm_menu_stats_mod"))
				}),
				skill = self._stats_panel:text({
					alpha = 0.75,
					x = 260,
					layer = 2,
					font_size = small_font_size,
					font = small_font,
					color = tweak_data.screen_colors.resource,
					text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))
				}),
				total = self._stats_panel:text({
					x = 200,
					layer = 2,
					font_size = small_font_size,
					font = small_font,
					color = tweak_data.screen_colors.text,
					text = utf8.to_upper(managers.localization:text("bm_menu_chosen"))
				})
			}
			local x = 0
			local y = 20
			local text_panel = nil
			local text_columns = {
				{
					size = 100,
					name = "name"
				},
				{
					align = "right",
					name = "equip",
					blend = "add",
					alpha = 0.75,
					size = 45
				},
				{
					align = "right",
					name = "base",
					blend = "add",
					alpha = 0.75,
					size = 45
				},
				{
					align = "right",
					name = "mods",
					blend = "add",
					alpha = 0.75,
					size = 45,
					color = tweak_data.screen_colors.stats_mods
				},
				{
					size = 45,
					name = "removed",
					blend = "add",
					alpha = 0.75,
					align = "right",
					offset = -40,
					color = tweak_data.screen_colors.important_1,
					font_size = tiny_font_size
				},
				{
					align = "right",
					name = "skill",
					blend = "add",
					alpha = 0.75,
					size = 45,
					color = tweak_data.screen_colors.resource
				},
				{
					size = 45,
					name = "total",
					align = "right"
				}
			}
			self._stats_texts = {}
			self._rweapon_stats_panel = self._stats_panel:panel()

			for i, stat in ipairs(self._stats_shown) do
				panel = self._rweapon_stats_panel:panel({
					name = "weapon_stats",
					h = 20,
					x = 0,
					layer = 1,
					y = y,
					w = self._rweapon_stats_panel:w()
				})

				if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
					panel:rect({
						name = tostring(i),
						color = Color.black:with_alpha(0.3)
					})
				end

				x = 2
				y = y + 20
				self._stats_texts[stat.name] = {}

				for _, column in ipairs(text_columns) do
					text_panel = panel:panel({
						layer = 0,
						x = x + (column.offset or 0),
						w = column.size,
						h = panel:h()
					})
					self._stats_texts[stat.name][column.name] = text_panel:text({
						layer = 1,
						font_size = column.font_size or small_font_size,
						font = column.font or small_font,
						align = column.align,
						alpha = column.alpha,
						blend_mode = column.blend,
						color = column.color or tweak_data.screen_colors.text,
						y = panel:h() - (column.font_size or small_font_size)
					})
					x = x + column.size + (column.offset or 0)

					if column.name == "total" then
						text_panel:set_x(190)
					end
				end
			end

			self._armor_stats_shown = {
				{
					name = "armor"
				},
				{
					name = "health"
				},
				{
					name = "deflection"
				},
				{
					revert = true,
					name = "dodge"
				},
				{
					index = true,
					name = "concealment"
				},
				{
					name = "movement"
				},
				{
					name = "stamina"
				},
				{
					name = "regen_time",
					inverted = true
				},
				{
					name = "damage_shake"
				}
			}
			local x = 0
			local y = 20
			local text_panel = nil
			self._armor_stats_texts = {}
			local text_columns = {
				{
					size = 100,
					name = "name"
				},
				{
					align = "right",
					name = "equip",
					blend = "add",
					alpha = 0.75,
					size = 45
				},
				{
					align = "right",
					name = "base",
					blend = "add",
					alpha = 0.75,
					size = 60
				},
				{
					align = "right",
					name = "skill",
					blend = "add",
					alpha = 0.75,
					size = 60,
					color = tweak_data.screen_colors.resource
				},
				{
					size = 45,
					name = "total",
					align = "right"
				}
			}
			self._armor_stats_panel = self._stats_panel:panel()

			for i, stat in ipairs(self._armor_stats_shown) do
				panel = self._armor_stats_panel:panel({
					h = 20,
					x = 0,
					layer = 1,
					y = y,
					w = self._armor_stats_panel:w()
				})

				if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
					panel:rect({
						name = tostring(i),
						color = Color.black:with_alpha(0.3)
					})
				end

				x = 2
				y = y + 20
				self._armor_stats_texts[stat.name] = {}

				for _, column in ipairs(text_columns) do
					text_panel = panel:panel({
						layer = 0,
						x = x,
						w = column.size,
						h = panel:h()
					})
					self._armor_stats_texts[stat.name][column.name] = text_panel:text({
						layer = 1,
						font_size = small_font_size,
						font = small_font,
						align = column.align,
						alpha = column.alpha,
						blend_mode = column.blend,
						color = column.color or tweak_data.screen_colors.text
					})
					x = x + column.size

					if column.name == "total" then
						text_panel:set_x(190)
					end
				end
			end

			self._mweapon_stats_shown = {
				{
					range = true,
					name = "damage"
				},
				{
					range = true,
					name = "damage_effect",
					multiple_of = "damage"
				},
				{
					inverse = true,
					name = "charge_time",
					num_decimals = 1,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{
					range = true,
					name = "range"
				},
				{
					index = true,
					name = "concealment"
				}
			}
			local x = 0
			local y = 20
			local text_panel = nil
			self._mweapon_stats_texts = {}
			local text_columns = {
				{
					size = 100,
					name = "name"
				},
				{
					align = "right",
					name = "equip",
					blend = "add",
					alpha = 0.75,
					size = 55
				},
				{
					align = "right",
					name = "base",
					blend = "add",
					alpha = 0.75,
					size = 60
				},
				{
					align = "right",
					name = "skill",
					blend = "add",
					alpha = 0.75,
					size = 65,
					color = tweak_data.screen_colors.resource
				},
				{
					size = 55,
					name = "total",
					align = "right"
				}
			}
			self._mweapon_stats_panel = self._stats_panel:panel()

			for i, stat in ipairs(self._mweapon_stats_shown) do
				panel = self._mweapon_stats_panel:panel({
					h = 20,
					x = 0,
					layer = 1,
					y = y,
					w = self._mweapon_stats_panel:w()
				})

				if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
					panel:rect({
						name = tostring(i),
						color = Color.black:with_alpha(0.3)
					})
				end

				x = 2
				y = y + 20
				self._mweapon_stats_texts[stat.name] = {}

				for _, column in ipairs(text_columns) do
					text_panel = panel:panel({
						layer = 0,
						x = x,
						w = column.size,
						h = panel:h()
					})
					self._mweapon_stats_texts[stat.name][column.name] = text_panel:text({
						layer = 1,
						font_size = small_font_size,
						font = small_font,
						align = column.align,
						alpha = column.alpha,
						blend_mode = column.blend,
						color = column.color or tweak_data.screen_colors.text
					})
					x = x + column.size

					if column.name == "total" then
						text_panel:set_x(190)
					end
				end
			end

			panel = self._stats_panel:panel({
				name = "modslist_panel",
				layer = 0,
				y = y + 20,
				w = self._stats_panel:w(),
				h = self._stats_panel:h()
			})
			self._stats_text_modslist = panel:text({
				word_wrap = true,
				wrap = true,
				layer = 1,
				font_size = small_font_size,
				font = small_font,
				color = tweak_data.screen_colors.text
			})
		end

		if self._info_panel then
			self._info_panel:set_size(info_box_panel:w() - 20, self._info_panel:num_children() / 2 * h)
			self._info_panel:set_rightbottom(self._panel:w() - 10, self._btn_panel:top() - 10)
		end

		local tab_x = 0

		if (not managers.menu:is_pc_controller() or managers.menu:is_steam_controller()) and #self._tabs > 1 then
			local button = managers.menu:is_steam_controller() and managers.localization:steam_btn("bumper_l") or managers.localization:get_default_macro("BTN_BOTTOM_L")
			local prev_page = self._panel:text({
				y = 0,
				name = "prev_page",
				layer = 2,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.text,
				text = button
			})
			local _, _, w, h = prev_page:text_rect()

			prev_page:set_size(w, h)
			prev_page:set_top(top_padding)
			prev_page:set_left(tab_x)
			prev_page:set_visible(self._selected > 1)
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end

		for _, tab in ipairs(self._tabs) do
			tab_x = tab:set_tab_position(tab_x)
		end

		if (not managers.menu:is_pc_controller() or managers.menu:is_steam_controller()) and #self._tabs > 1 then
			local button = managers.menu:is_steam_controller() and managers.localization:steam_btn("bumper_r") or managers.localization:get_default_macro("BTN_BOTTOM_R")
			local next_page = self._panel:text({
				y = 0,
				name = "next_page",
				layer = 2,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.text,
				text = button
			})
			local _, _, w, h = next_page:text_rect()

			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)
			next_page:set_visible(self._selected < #self._tabs)
			self._tab_scroll_panel:grow(-(w + 15), 0)
		end

		if managers.menu:is_pc_controller() and not managers.menu:is_steam_controller() and self._tab_scroll_table.panel:w() < self._tab_scroll_table[#self._tab_scroll_table]:right() then
			local prev_page = self._panel:text({
				name = "prev_page",
				w = 0,
				align = "center",
				text = "<",
				y = 0,
				layer = 2,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local _, _, w, h = prev_page:text_rect()

			prev_page:set_size(w, h)
			prev_page:set_top(top_padding)
			prev_page:set_left(0)
			prev_page:set_text(" ")
			self._tab_scroll_panel:move(w + 15, 0)
			self._tab_scroll_panel:grow(-(w + 15), 0)

			local next_page = self._panel:text({
				name = "next_page",
				w = 0,
				align = "center",
				text = ">",
				y = 0,
				layer = 2,
				font_size = medium_font_size,
				font = medium_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local _, _, w, h = next_page:text_rect()

			next_page:set_size(w, h)
			next_page:set_top(top_padding)
			next_page:set_right(grid_panel_w)

			self._tab_scroll_table.left = prev_page
			self._tab_scroll_table.right = next_page
			self._tab_scroll_table.left_klick = false
			self._tab_scroll_table.right_klick = true

			if self._selected > 1 then
				self._tab_scroll_table.left_klick = true

				self._tab_scroll_table.left:set_text("<")
			else
				self._tab_scroll_table.left_klick = false

				self._tab_scroll_table.left:set_text(" ")
			end

			if self._selected < #self._tab_scroll_table then
				self._tab_scroll_table.right_klick = true

				self._tab_scroll_table.right:set_text(">")
			else
				self._tab_scroll_table.right_klick = false

				self._tab_scroll_table.right:set_text(" ")
			end

			self._tab_scroll_panel:grow(-(w + 15), 0)
		end
	else
		self._select_rect:hide()
	end

	if MenuBackdropGUI then
		local bg_text = self._fullscreen_panel:text({
			vertical = "top",
			h = 90,
			align = "left",
			alpha = 0.4,
			text = self._title_text:text(),
			font_size = massive_font_size,
			font = massive_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(self._title_text:world_x(), self._title_text:world_center_y())

		bg_text:set_world_left(x)
		bg_text:set_world_center_y(y)
		bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, bg_text)

		if managers.menu:is_pc_controller() then
			local bg_back = self._fullscreen_panel:text({
				name = "back_button",
				vertical = "bottom",
				h = 90,
				alpha = 0.4,
				align = "right",
				layer = 0,
				text = utf8.to_upper(managers.localization:text("menu_back")),
				font_size = massive_font_size,
				font = massive_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back_button"):world_right(), self._panel:child("back_button"):world_center_y())

			bg_back:set_world_right(x)
			bg_back:set_world_center_y(y)
			bg_back:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_back)
		end
	end

	if self._selected_slot then
		self:on_slot_selected(self._selected_slot)
	end

	local black_rect = self._data.skip_blur or self._fullscreen_panel:rect({
		layer = 1,
		color = Color(0.4, 0, 0, 0)
	})

	if is_start_page then
		-- Nothing
	end

	if self._data.create_steam_inventory_extra then
		self._indicator_alpha = self._indicator_alpha or managers.network.account:inventory_is_loading() and 1 or 0
		self._indicator = self._panel:bitmap({
			texture = "guis/textures/icon_loading",
			name = "indicator",
			layer = 1,
			alpha = self._indicator_alpha
		})

		self._indicator:set_left(self._title_text:right() + 10)
		self._indicator:set_center_y(self._title_text:center_y())
		self._indicator:animate(function (o)
			local dt = nil

			while true do
				dt = coroutine.yield()

				self._indicator:rotate(180 * dt)

				self._indicator_alpha = math.lerp(self._indicator_alpha, managers.network.account:inventory_is_loading() and 1 or 0, 15 * dt)

				self._indicator:set_alpha(self._indicator_alpha)
			end
		end)

		local info_box_panel = self._panel:child("info_box_panel")
		self._steam_inventory_extra_panel = self._panel:panel({
			h = top_padding
		})

		self._steam_inventory_extra_panel:set_width(info_box_panel:width())
		self._steam_inventory_extra_panel:set_top(info_box_panel:bottom() + 5)
		self._steam_inventory_extra_panel:set_world_right(self._tabs[self._selected]._grid_panel:world_right())

		self._steam_inventory_extra_data = {}
		local extra_data = self._steam_inventory_extra_data
		extra_data.choices = {}

		for _, name in ipairs(tweak_data.gui.tradable_inventory_sort_list) do
			table.insert(extra_data.choices, managers.localization:to_upper_text("bm_menu_ti_sort_option", {
				sort = managers.localization:text("bm_menu_ti_" .. name)
			}))
		end

		local gui_panel = self._steam_inventory_extra_panel:panel({
			h = medium_font_size + 5
		})
		extra_data.bg = gui_panel:rect({
			alpha = 0.5,
			color = Color.black:with_alpha(0.5)
		})

		BoxGuiObject:new(gui_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		local choice_panel = gui_panel:panel({
			layer = 1
		})
		local choice_text = choice_panel:text({
			halign = "center",
			vertical = "center",
			layer = 1,
			align = "center",
			blend_mode = "add",
			y = 0,
			x = 0,
			valign = "center",
			font_size = small_font_size,
			font = small_font,
			color = tweak_data.screen_colors.button_stage_2,
			text = extra_data.choices[Global.blackmarket_manager.tradable_inventory_sort or 1],
			render_template = Idstring("VertexColorTextured")
		})
		local arrow_left, arrow_right = nil

		if managers.menu:is_pc_controller() and not managers.menu:is_steam_controller() then
			local texture, rect = tweak_data.hud_icons:get_icon_data("scrollbar_arrow")
			arrow_left = gui_panel:bitmap({
				texture = "guis/textures/menu_arrows",
				layer = 1,
				blend_mode = "add",
				visible = true,
				texture_rect = {
					24,
					0,
					24,
					24
				},
				color = tweak_data.screen_colors.button_stage_3
			})
			arrow_right = gui_panel:bitmap({
				texture = "guis/textures/menu_arrows",
				layer = 1,
				blend_mode = "add",
				visible = true,
				rotation = 180,
				texture_rect = {
					24,
					0,
					24,
					24
				},
				color = tweak_data.screen_colors.button_stage_3
			})
		else
			local BTN_TOP_L = managers.menu:is_steam_controller() and managers.localization:steam_btn("trigger_l") or managers.localization:get_default_macro("BTN_TOP_L")
			local BTN_TOP_R = managers.menu:is_steam_controller() and managers.localization:steam_btn("trigger_r") or managers.localization:get_default_macro("BTN_TOP_R")
			arrow_left = gui_panel:text({
				blend_mode = "add",
				layer = 1,
				text = BTN_TOP_L,
				color = managers.menu:is_steam_controller() and tweak_data.screen_colors.button_stage_3,
				font = small_font,
				font_size = small_font_size
			})
			arrow_right = gui_panel:text({
				blend_mode = "add",
				layer = 1,
				text = BTN_TOP_R,
				color = managers.menu:is_steam_controller() and tweak_data.screen_colors.button_stage_3,
				font = small_font,
				font_size = small_font_size
			})

			self:make_fine_text(arrow_left)
			self:make_fine_text(arrow_right)
		end

		arrow_left:set_left(5)
		arrow_left:set_center_y(gui_panel:h() / 2)
		arrow_right:set_right(gui_panel:w() - 5)
		arrow_right:set_center_y(gui_panel:h() / 2)

		extra_data.gui_panel = gui_panel
		extra_data.arrow_left = arrow_left
		extra_data.arrow_right = arrow_right
		extra_data.choice_text = choice_text
		extra_data.arrow_left_highlighted = false
		extra_data.arrow_right_highlighted = false
	end

	self:set_tab_positions()
	self:_round_everything()

	self._in_setup = nil
end

function BlackMarketGui:show_stats()
	if not self._stats_panel or not self._rweapon_stats_panel or not self._armor_stats_panel or not self._mweapon_stats_panel then
		return
	end

	self._stats_panel:hide()
	self._rweapon_stats_panel:hide()
	self._armor_stats_panel:hide()
	self._mweapon_stats_panel:hide()

	if not self._slot_data then
		return
	end

	if not self._slot_data.comparision_data then
		return
	end

	local weapon = managers.blackmarket:get_crafted_category_slot(self._slot_data.category, self._slot_data.slot)
	local name = weapon and weapon.weapon_id or self._slot_data.name
	local category = self._slot_data.category
	local slot = self._slot_data.slot
	local hide_stats = false
	local value = 0
	local tweak_stats = tweak_data.weapon.stats
	local modifier_stats = tweak_data.weapon[name] and tweak_data.weapon[name].stats_modifiers

	if self._slot_data.dont_compare_stats then
		local selection_index = tweak_data:get_raw_value("weapon", self._slot_data.weapon_id, "use_data", "selection_index") or 1
		local category = selection_index == 1 and "secondaries" or "primaries"
		modifier_stats = tweak_data.weapon[self._slot_data.weapon_id] and tweak_data.weapon[self._slot_data.weapon_id].stats_modifiers
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(self._slot_data.weapon_id, nil, nil, self._slot_data.default_blueprint)

		self:set_weapons_stats_columns()
		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		self:set_stats_titles({
			x = 170,
			name = "base"
		}, {
			name = "mod",
			x = 215,
			text_id = "bm_menu_stats_mod",
			color = tweak_data.screen_colors.stats_mods
		}, {
			alpha = 0.75,
			name = "skill"
		})

		for _, title in pairs(self._stats_titles) do
			title:show()
		end

		self:set_stats_titles({
			hide = true,
			name = "total"
		}, {
			alpha = 1,
			name = "equip",
			x = 120,
			text_id = "bm_menu_stats_total"
		})

		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			local base = base_stats[stat.name].value

			self._stats_texts[stat.name].equip:set_alpha(1)
			self._stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value))
			self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
			self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
			self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
			self._stats_texts[stat.name].total:set_text("")
			self._stats_texts[stat.name].base:set_alpha(0.75)
			self._stats_texts[stat.name].mods:set_alpha(0.75)
			self._stats_texts[stat.name].skill:set_alpha(0.75)

			if base < value then
				self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
			elseif value < base then
				self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
			end

			self._stats_texts[stat.name].skill:set_color(tweak_data.screen_colors.resource)
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)

			if stat.percent then
				if math.round(value) >= 100 then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stat_maxed)
				end
			elseif stat.name == "concealment" then --Sets concealment text to purple when maxed.
				if base_stats.concealment.value + mods_stats.concealment.value + skill_stats.concealment.value >= tweak_data.concealment_cap then
					self._stats_texts.concealment.equip:set_color(tweak_data.screen_colors.stat_maxed)
				end
			elseif stat.index then
				--nothing
			elseif tweak_stats[stat.name] then
				local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
				local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)

				if stat.offset then
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
					max_stat = max_stat - offset
				end

				if without_skill >= max_stat then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stat_maxed)
				end
			end
		end
	elseif tweak_data.weapon[self._slot_data.name] or self._slot_data.default_blueprint then
		self:set_weapons_stats_columns()

		local equipped_item = managers.blackmarket:equipped_item(category)
		local equipped_slot = self._slot_data.equipped_slot or managers.blackmarket:equipped_weapon_slot(category)
		local equipped_name = self._slot_data.equipped_name or equipped_item.weapon_id

		if self._slot_data.default_blueprint then
			equipped_slot = slot
			equipped_name = name
		end

		local equip_base_stats, equip_mods_stats, equip_skill_stats = WeaponDescription._get_stats(equipped_name, category, equipped_slot)
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(name, category, slot, self._slot_data.default_blueprint)

		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		self:set_stats_titles({
			x = 170,
			name = "base"
		}, {
			alpha = 0.75,
			name = "mod",
			text_id = "bm_menu_stats_mod",
			x = 215,
			color = tweak_data.screen_colors.stats_mods
		}, {
			alpha = 0.75,
			name = "skill"
		})

		if slot ~= equipped_slot then
			for _, title in pairs(self._stats_titles) do
				title:hide()
			end

			self:set_stats_titles({
				show = true,
				name = "total"
			}, {
				name = "equip",
				text_id = "bm_menu_equipped",
				alpha = 0.75,
				x = 105,
				show = true
			})
		else
			for _, title in pairs(self._stats_titles) do
				title:show()
			end

			self:set_stats_titles({
				hide = true,
				name = "total"
			}, {
				alpha = 1,
				name = "equip",
				x = 120,
				text_id = "bm_menu_stats_total"
			})
		end

		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)

			if slot == equipped_slot then
				local base = base_stats[stat.name].value

				self._stats_texts[stat.name].equip:set_alpha(1)
				self._stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value))
				self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
				self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
				self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
				self._stats_texts[stat.name].total:set_text("")
				self._stats_texts[stat.name].removed:set_text("")
				self._stats_texts[stat.name].base:set_alpha(0.75)
				self._stats_texts[stat.name].mods:set_alpha(0.75)
				self._stats_texts[stat.name].skill:set_alpha(0.75)

				if base < value then
					self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				elseif value < base then
					self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end

				self._stats_texts[stat.name].skill:set_color(tweak_data.screen_colors.resource)
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)

				if stat.percent then
					if math.round(value) >= 100 then
						self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stat_maxed)
					end
				elseif stat.name == "concealment" then --Sets concealment text to purple when maxed.
					if base_stats.concealment.value + mods_stats.concealment.value + skill_stats.concealment.value >= tweak_data.concealment_cap then
						self._stats_texts.concealment.equip:set_color(tweak_data.screen_colors.stat_maxed)
					end
				elseif stat.index then
					--nothing
				elseif tweak_stats[stat.name] then
					local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
					local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)

					if stat.offset then
						local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
						max_stat = max_stat - offset
					end

					if without_skill >= max_stat then
						self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stat_maxed)
					end
				end
			else
				local equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)

				self._stats_texts[stat.name].equip:set_alpha(0.75)
				self._stats_texts[stat.name].equip:set_text(format_round(equip, stat.round_value))
				self._stats_texts[stat.name].base:set_text("")
				self._stats_texts[stat.name].mods:set_text("")
				self._stats_texts[stat.name].skill:set_text("")
				self._stats_texts[stat.name].removed:set_text("")
				self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))

				if equip < value then
					self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				elseif value < equip then
					self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				end

				self._stats_texts[stat.name].skill:set_color(tweak_data.screen_colors.resource)
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)

				if stat.percent then
					if math.round(value) >= 100 then
						self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
					end
				elseif stat.index then
					--nothing
				elseif tweak_stats[stat.name] then
					local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
					local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)

					if stat.offset then
						local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
						max_stat = max_stat - offset
					end

					if without_skill >= max_stat then
						self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
					end
				end
			end
		end
	elseif tweak_data.blackmarket.armors[self._slot_data.name] then
		local equipped_item = managers.blackmarket:equipped_item(category)
		local equipped_slot = managers.blackmarket:equipped_armor_slot()
		local equip_base_stats, equip_mods_stats, equip_skill_stats = self:_get_armor_stats(equipped_item)
		local base_stats, mods_stats, skill_stats = self:_get_armor_stats(self._slot_data.name)

		self._armor_stats_panel:show()
		self:hide_weapon_stats()
		self:hide_melee_weapon_stats()
		self:set_stats_titles({
			x = 185,
			name = "base"
		}, {
			name = "mod",
			x = 245,
			text_id = "bm_menu_stats_skill",
			color = tweak_data.screen_colors.resource
		}, {
			alpha = 0,
			name = "skill"
		})

		if self._slot_data.name ~= equipped_slot then
			for _, title in pairs(self._stats_titles) do
				title:hide()
			end

			self:set_stats_titles({
				show = true,
				name = "total"
			}, {
				name = "equip",
				text_id = "bm_menu_equipped",
				alpha = 0.75,
				x = 105,
				show = true
			})
		else
			for title_name, title in pairs(self._stats_titles) do
				title:show()
			end

			self:set_stats_titles({
				hide = true,
				name = "total"
			}, {
				alpha = 1,
				name = "equip",
				x = 120,
				text_id = "bm_menu_stats_total"
			})
		end

		for _, stat in ipairs(self._armor_stats_shown) do
			self._armor_stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)

			if self._slot_data.name == equipped_slot then
				local base = base_stats[stat.name].value

				self._armor_stats_texts[stat.name].equip:set_alpha(1)
				self._armor_stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value))
				self._armor_stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
				self._armor_stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
				self._armor_stats_texts[stat.name].total:set_text("")
				self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)

				if value ~= 0 and base < value then
					self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
				elseif value ~= 0 and value < base then
					self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end

				self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				local inverted = stat.inverted or false

				self._armor_stats_texts[stat.name].equip:set_alpha(0.75)
				self._armor_stats_texts[stat.name].equip:set_text(format_round(equip, stat.round_value))
				self._armor_stats_texts[stat.name].base:set_text("")
				self._armor_stats_texts[stat.name].skill:set_text("")
				self._armor_stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))

				if equip < value and not inverted or value < equip and inverted then
					self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
				elseif value < equip and not inverted or equip < value and inverted then
					self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				end

				self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
			end
		end
	elseif tweak_data.economy.armor_skins[self._slot_data.name] then
		self:hide_melee_weapon_stats()
		self:hide_armor_stats()
		self:hide_weapon_stats()

		for _, title in pairs(self._stats_titles) do
			title:hide()
		end

		hide_stats = true
	elseif tweak_data.blackmarket.melee_weapons[self._slot_data.name] then
		self:hide_armor_stats()
		self:hide_weapon_stats()
		self._mweapon_stats_panel:show()
		self:set_stats_titles({
			x = 185,
			name = "base"
		}, {
			name = "mod",
			x = 245,
			text_id = "bm_menu_stats_skill",
			color = tweak_data.screen_colors.resource
		}, {
			alpha = 0,
			name = "skill"
		})

		local equipped_item = managers.blackmarket:equipped_item(category)
		local equip_base_stats, equip_mods_stats, equip_skill_stats = self:_get_melee_weapon_stats(equipped_item)
		local base_stats, mods_stats, skill_stats = self:_get_melee_weapon_stats(self._slot_data.name)

		if self._slot_data.name ~= equipped_item then
			for _, title in pairs(self._stats_titles) do
				title:hide()
			end

			self:set_stats_titles({
				show = true,
				name = "total"
			}, {
				name = "equip",
				text_id = "bm_menu_equipped",
				alpha = 0.75,
				x = 105,
				show = true
			})
		else
			for title_name, title in pairs(self._stats_titles) do
				title:show()
			end

			self:set_stats_titles({
				hide = true,
				name = "total"
			}, {
				alpha = 1,
				name = "equip",
				x = 120,
				text_id = "bm_menu_stats_total"
			})
		end

		local value_min, value_max, skill_value_min, skill_value_max, skill_value = nil

		for _, stat in ipairs(self._mweapon_stats_shown) do
			self._mweapon_stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			if stat.range then
				value_min = math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
				value_max = math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
			end

			value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)

			if self._slot_data.name == equipped_item then
				local base, base_min, base_max, skill, skill_min, skill_max = nil

				if stat.range then
					base_min = base_stats[stat.name].min_value
					base_max = base_stats[stat.name].max_value
					skill_min = skill_stats[stat.name].min_value
					skill_max = skill_stats[stat.name].max_value
				end

				base = base_stats[stat.name].value
				skill = skill_stats[stat.name].value
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = value and format_round(value, stat.round_value)
				local base_text = base and format_round(base, stat.round_value)
				local skill_text = skill_stats[stat.name].value and format_round(skill_stats[stat.name].value, stat.round_value)
				local base_min_text = base_min and format_round(base_min, true)
				local base_max_text = base_max and format_round(base_max, true)
				local value_min_text = value_min and format_round(value_min, true)
				local value_max_text = value_max and format_round(value_max, true)
				local skill_min_text = skill_min and format_round(skill_min, true)
				local skill_max_text = skill_max and format_round(skill_max, true)

				if stat.range then
					if base_min ~= base_max then
						base_text = base_min_text .. " (" .. base_max_text .. ")"
					end

					if value_min ~= value_max then
						equip_text = value_min_text .. " (" .. value_max_text .. ")"
					end

					if skill_min ~= skill_max then
						skill_text = skill_min_text .. " (" .. skill_max_text .. ")"
					end
				end

				if stat.suffix then
					base_text = base_text .. tostring(stat.suffix)
					equip_text = equip_text .. tostring(stat.suffix)
					skill_text = skill_text .. tostring(stat.suffix)
				end

				if stat.prefix then
					base_text = tostring(stat.prefix) .. base_text
					equip_text = tostring(stat.prefix) .. equip_text
					skill_text = tostring(stat.prefix) .. skill_text
				end

				self._mweapon_stats_texts[stat.name].equip:set_alpha(1)
				self._mweapon_stats_texts[stat.name].equip:set_text(equip_text)
				self._mweapon_stats_texts[stat.name].base:set_text(base_text)
				self._mweapon_stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. skill_text or "")
				self._mweapon_stats_texts[stat.name].total:set_text("")
				self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)

				local positive = value ~= 0 and base < value
				local negative = value ~= 0 and value < base

				if stat.inverse then
					local temp = positive
					positive = negative
					negative = temp
				end

				if stat.range then
					if positive then
						self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
					elseif negative then
						self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
					end
				elseif positive then
					self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
				elseif negative then
					self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end

				self._mweapon_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip, equip_min, equip_max = nil

				if stat.range then
					equip_min = math.max(equip_base_stats[stat.name].min_value + equip_mods_stats[stat.name].min_value + equip_skill_stats[stat.name].min_value, 0)
					equip_max = math.max(equip_base_stats[stat.name].max_value + equip_mods_stats[stat.name].max_value + equip_skill_stats[stat.name].max_value, 0)
				end

				equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = equip and format_round(equip, stat.round_value)
				local total_text = value and format_round(value, stat.round_value)
				local equip_min_text = equip_min and format_round(equip_min, true)
				local equip_max_text = equip_max and format_round(equip_max, true)
				local total_min_text = value_min and format_round(value_min, true)
				local total_max_text = value_max and format_round(value_max, true)
				local color_ranges = {}

				if stat.range then
					if equip_min ~= equip_max then
						equip_text = equip_min_text .. " (" .. equip_max_text .. ")"
					end

					if value_min ~= value_max then
						total_text = total_min_text .. " (" .. total_max_text .. ")"
					end
				end

				if stat.suffix then
					equip_text = equip_text .. tostring(stat.suffix)
					total_text = total_text .. tostring(stat.suffix)
				end

				if stat.prefix then
					equip_text = tostring(stat.prefix) .. equip_text
					total_text = tostring(stat.prefix) .. total_text
				end

				self._mweapon_stats_texts[stat.name].equip:set_alpha(0.75)
				self._mweapon_stats_texts[stat.name].equip:set_text(equip_text)
				self._mweapon_stats_texts[stat.name].base:set_text("")
				self._mweapon_stats_texts[stat.name].skill:set_text("")
				self._mweapon_stats_texts[stat.name].total:set_text(total_text)

				if stat.range then
					local positive = equip_min < value_min
					local negative = value_min < equip_min

					if stat.inverse then
						local temp = positive
						positive = negative
						negative = temp
					end

					local color_range_min = {
						start = 0,
						stop = utf8.len(total_min_text)
					}

					if positive then
						color_range_min.color = tweak_data.screen_colors.stats_positive
					elseif negative then
						color_range_min.color = tweak_data.screen_colors.stats_negative
					else
						color_range_min.color = tweak_data.screen_colors.text
					end

					table.insert(color_ranges, color_range_min)

					positive = equip_max < value_max
					negative = value_max < equip_max

					if stat.inverse then
						local temp = positive
						positive = negative
						negative = temp
					end

					local color_range_max = {
						start = color_range_min.stop + 1
					}
					color_range_max.stop = color_range_max.start + 3 + utf8.len(total_max_text)

					if positive then
						color_range_max.color = tweak_data.screen_colors.stats_positive
					elseif negative then
						color_range_max.color = tweak_data.screen_colors.stats_negative
					else
						color_range_max.color = tweak_data.screen_colors.text
					end

					table.insert(color_ranges, color_range_max)
				else
					local positive = equip < value
					local negative = value < equip

					if stat.inverse then
						local temp = positive
						positive = negative
						negative = temp
					end

					local color_range = {
						start = 0,
						stop = utf8.len(total_text)
					}

					if positive then
						color_range.color = tweak_data.screen_colors.stats_positive
					elseif negative then
						color_range.color = tweak_data.screen_colors.stats_negative
					else
						color_range.color = tweak_data.screen_colors.text
					end

					table.insert(color_ranges, color_range)
				end

				self._mweapon_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				self._mweapon_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)

				for _, color_range in ipairs(color_ranges) do
					self._mweapon_stats_texts[stat.name].total:set_range_color(color_range.start, color_range.stop, color_range.color)
				end
			end
		end
	else
		local equip, stat_changed = nil
		local tweak_parts = tweak_data.weapon.factory.parts[self._slot_data.name]
		local blueprint = clone(managers.blackmarket:get_weapon_blueprint(category, slot))
		local unaltered_total_base_stats, unaltered_total_mods_stats, unaltered_total_skill_stats = WeaponDescription._get_stats(name, category, slot, blueprint)

		managers.weapon_factory:change_part_blueprint_only(weapon.factory_id, self._slot_data.name, blueprint, false)

		local total_base_stats, total_mods_stats, total_skill_stats = WeaponDescription._get_stats(name, category, slot, blueprint)
		local mod_stats = WeaponDescription.get_stats_for_mod(self._slot_data.name, name, category, slot)
		local hide_equip = mod_stats.equip.name == mod_stats.chosen.name
		local remove_stats = {}

		--Minimal but hacky way to add swap_speed to weapon mod stat changes.
		--Checks if the weapon stats with the mod (and no skills) change, and if they do, displays the difference.
		--Would write a better solution, but I hate this file.
		--Also, enjoy those rounded values.
		if unaltered_total_mods_stats.swap_speed.value ~= total_mods_stats.swap_speed.value then
			mod_stats.chosen.swap_speed = (total_base_stats.swap_speed.value + total_mods_stats.swap_speed.value)
				- (unaltered_total_base_stats.swap_speed.value + unaltered_total_mods_stats.swap_speed.value)
		end

		if self._slot_data.removes then
			for _, part_id in ipairs(self._slot_data.removes) do
				local part_stats = WeaponDescription.get_stats_for_mod(part_id, name, category, slot)

				for category, value in pairs(part_stats.chosen or {}) do
					if type(value) == "number" then
						remove_stats[category] = (remove_stats[category] or 0) + value
					end
				end
			end
		end

		self._rweapon_stats_panel:show()
		self:hide_armor_stats()
		self:hide_melee_weapon_stats()
		self:set_weapon_mods_stats_columns()

		for _, title in pairs(self._stats_titles) do
			title:hide()
		end

		self:set_stats_titles({
			alpha = 1,
			name = "total",
			text_id = "bm_menu_stats_total",
			x = 120,
			show = true,
			color = tweak_data.screen_colors.text
		}, {
			alpha = 0.75,
			name = "equip",
			text_id = "bm_menu_equipped",
			x = 170,
			show = not not mod_stats.equip.name,
			color = tweak_data.screen_colors.text
		}, {
			name = "removed",
			alpha = 0.75,
			x = 200,
			show = true,
			color = tweak_data.screen_colors.text
		}, {
			alpha = 1,
			name = "mod",
			text_id = "bm_menu_chosen",
			x = 245,
			show = true,
			color = tweak_data.screen_colors.text
		})

		local total_value, total_index, unaltered_total_value = nil

		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			value = mod_stats.chosen[stat.name]
			equip = mod_stats.equip[stat.name]
			total_value = math.max(total_base_stats[stat.name].value + total_mods_stats[stat.name].value + total_skill_stats[stat.name].value, 0)
			unaltered_total_value = math.max(unaltered_total_base_stats[stat.name].value + unaltered_total_mods_stats[stat.name].value + unaltered_total_skill_stats[stat.name].value, 0)
			stat_changed = tweak_parts and tweak_parts.stats and tweak_parts.stats[stat.stat_name or stat.name] and value ~= 0
			stat_changed = stat_changed or remove_stats[stat.name] and remove_stats[stat.name] ~= 0

			for stat_name, stat_text in pairs(self._stats_texts[stat.name]) do
				if stat_name ~= "name" then
					stat_text:set_text("")
				end
			end

			for name, column in pairs(self._stats_texts[stat.name]) do
				column:set_alpha(stat_changed and 1 or 0.5)
			end

			local equip_text = equip == 0 and "" or (equip > 0 and "+" or "") .. format_round(equip, stat.round_value)

			self._stats_texts[stat.name].base:set_text(equip_text)
			self._stats_texts[stat.name].base:set_alpha(0.75)
			self._stats_texts[stat.name].equip:set_alpha(1)
			self._stats_texts[stat.name].equip:set_text(format_round(total_value, stat.round_value))
			self._stats_texts[stat.name].skill:set_alpha(1)
			self._stats_texts[stat.name].skill:set_text(value == 0 and "" or (value > 0 and "+" or "") .. format_round(value, stat.round_value))

			if remove_stats[stat.name] and remove_stats[stat.name] ~= 0 then
				local stat_str = remove_stats[stat.name] == 0 and "" or (remove_stats[stat.name] > 0 and "+" or "") .. format_round(remove_stats[stat.name], stat.round_value)

				self._stats_texts[stat.name].removed:set_text("(" .. tostring(stat_str) .. ")")
			else
				self._stats_texts[stat.name].removed:set_text("")
			end

			equip = equip + math.round(remove_stats[stat.name] or 0)

			if unaltered_total_value < total_value then
				self._stats_texts[stat.name].skill:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
			elseif total_value < unaltered_total_value then
				self._stats_texts[stat.name].skill:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
				self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].skill:set_color(tweak_data.screen_colors.text)
				self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
			end

			if stat.percent then
				if math.round(total_value) >= 100 then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stat_maxed)
				end
			elseif stat.name == "concealment" then --Sets concealment text to purple when maxed.
				if total_base_stats.concealment.value + total_mods_stats.concealment.value + total_skill_stats.concealment.value >= tweak_data.concealment_cap then
					self._stats_texts.concealment.equip:set_color(tweak_data.screen_colors.stat_maxed)
				end
			elseif stat.index then
				--nothing
			elseif tweak_stats[stat.name] then
				local without_skill = math.round(total_base_stats[stat.name].value + total_mods_stats[stat.name].value)
				local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)

				if stat.offset then
					local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
					max_stat = max_stat - offset
				end

				if without_skill >= max_stat then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stat_maxed)
				end
			end

			self._stats_texts[stat.name].base:set_color(tweak_data.screen_colors.text)
		end
	end

	local modslist_panel = self._stats_panel:child("modslist_panel")
	local y = 0

	if self._rweapon_stats_panel:visible() then
		for i, child in ipairs(self._rweapon_stats_panel:children()) do
			y = math.max(y, child:bottom())
		end
	elseif self._armor_stats_panel:visible() then
		for i, child in ipairs(self._armor_stats_panel:children()) do
			y = math.max(y, child:bottom())
		end
	elseif self._mweapon_stats_panel:visible() then
		for i, child in ipairs(self._mweapon_stats_panel:children()) do
			y = math.max(y, child:bottom())
		end
	end

	modslist_panel:set_top(y + 10)

	if not hide_stats then
		self._stats_panel:show()
	end
end

function BlackMarketGui:update_info_text()
	local slot_data = self._slot_data
	local tab_data = self._tabs[self._selected]._data
	local prev_data = tab_data.prev_node_data
	local ids_category = Idstring(slot_data.category)
	local identifier = tab_data.identifier
	local updated_texts = {
		{
			text = ""
		},
		{
			text = ""
		},
		{
			text = ""
		},
		{
			text = ""
		},
		{
			text = ""
		}
	}
	local ignore_lock = false

	self._stats_text_modslist:set_text("")

	local suspicion, max_reached, min_reached = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)

	self:_set_detection(suspicion, max_reached, min_reached)
	self:_set_rename_info_text(nil)

	local is_renaming_this = self._renaming_item and not self._data.is_loadout and self._renaming_item.category == slot_data.category and self._renaming_item.slot == slot_data.slot

	self._armor_info_panel:set_visible(identifier == self.identifiers.armor)

	if identifier == self.identifiers.weapon then
		local price = slot_data.price or 0

		if slot_data.ignore_slot then
			-- Nothing
		elseif not slot_data.empty_slot then
			updated_texts[1].text = slot_data.name_localized

			if slot_data.name_color then
				updated_texts[1].text = "##" .. updated_texts[1].text .. "##"
				updated_texts[1].resource_color = {
					slot_data.name_color
				}
			end

			local resource_color = {}
			updated_texts[2].resource_color = resource_color

			if price > 0 then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##"

				table.insert(resource_color, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
			end

			if not slot_data.not_moddable and not self._data.is_loadout then
				self:_set_rename_info_text(1)
			end

			if not slot_data.unlocked then
				if slot_data.lock_text then
					updated_texts[3].text = slot_data.lock_text
					updated_texts[3].below_stats = true
				else
					local skill_based = slot_data.skill_based
					local func_based = slot_data.func_based
					local level_based = slot_data.level and slot_data.level > 0
					local dlc_based = tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
					local part_dlc_locked = slot_data.part_dlc_lock
					local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
					local level_text_id = level_based and "bm_menu_level_req" or false
					local dlc_text_id = dlc_based and slot_data.dlc_locked or false
					local part_dlc_text_id = part_dlc_locked and "bm_menu_part_dlc_locked"
					local funclock_text_id = false

					if func_based then
						local unlocked, text_id = BlackMarketGui.get_func_based(func_based)

						if not unlocked then
							funclock_text_id = text_id
						end
					end

					local vr_lock_text = slot_data.vr_locked and "bm_menu_vr_locked"
					local text = ""

					if slot_data.install_lock then
						text = text .. managers.localization:to_upper_text(slot_data.install_lock, {}) .. "\n"
					elseif vr_lock_text then
						text = text .. managers.localization:to_upper_text(vr_lock_text) .. "\n"
					elseif dlc_text_id then
						text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
					elseif part_dlc_text_id then
						text = text .. managers.localization:to_upper_text(part_dlc_text_id, {}) .. "\n"
					elseif funclock_text_id then
						text = text .. managers.localization:to_upper_text(funclock_text_id, {
							slot_data.name_localized
						}) .. "\n"
					elseif skill_text_id then
						text = text .. managers.localization:to_upper_text(skill_text_id, {
							slot_data.name_localized
						}) .. "\n"
					elseif level_text_id then
						text = text .. managers.localization:to_upper_text(level_text_id, {
							level = slot_data.level
						}) .. "\n"
					end

					updated_texts[3].text = text
					updated_texts[3].below_stats = true
				end
			elseif self._slot_data.can_afford == false then
				-- Nothing
			end

			if slot_data.last_weapon then
				updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "\n"
			end

			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				updated_texts[4].resource_color = tweak_data.lootdrop.global_values[slot_data.global_value].color
				updated_texts[4].below_stats = true
			end

			if slot_data.not_moddable then
				local weapon_id = slot_data.name
				local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]
				local movement_penalty = weapon_tweak and tweak_data.upgrades.weapon_movement_penalty[weapon_tweak.categories[1]] or 1

				if movement_penalty < 1 then
					local penalty_as_string = string.format("%d%%", math.round((1 - movement_penalty) * 100))
					updated_texts[5].text = updated_texts[5].text .. managers.localization:to_upper_text("bm_menu_weapon_movement_penalty_info", {
						penalty = penalty_as_string
					})
				end

				if weapon_tweak.has_description then
					updated_texts[4].text = updated_texts[4].text .. "\n\n" .. managers.localization:to_upper_text(tweak_data.weapon[slot_data.name].desc_id)
					updated_texts[4].below_stats = true
				end
			end

			updated_texts[5].below_stats = true
		elseif slot_data.locked_slot then
			ignore_lock = true
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_weapon_slot")

			if slot_data.cannot_buy then
				updated_texts[3].text = slot_data.dlc_locked
			else
				updated_texts[2].text = slot_data.dlc_locked
			end

			updated_texts[4].text = managers.localization:text("bm_menu_locked_weapon_slot_desc")
		elseif not slot_data.is_loadout then
			local prefix = ""

			if not managers.menu:is_pc_controller() then
				prefix = managers.localization:get_default_macro("BTN_A")
			end

			updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_weapon")
			updated_texts[4].text = managers.localization:text("bm_menu_empty_weapon_slot_buy_info")
		end
	elseif identifier == self.identifiers.melee_weapon then
		updated_texts[1].text = self._slot_data.name_localized

		if tweak_data.blackmarket.melee_weapons[slot_data.name].info_id then
			updated_texts[2].text = managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].info_id)
			updated_texts[2].below_stats = true
		end

		if not slot_data.unlocked then
			local skill_based = slot_data.skill_based
			local level_based = slot_data.level and slot_data.level > 0
			local dlc_based = slot_data.dlc_based or tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
			local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
			local level_text_id = level_based and "bm_menu_level_req" or false
			local dlc_text_id = dlc_based and slot_data.dlc_locked or false
			local text = ""
			local vr_lock_text = slot_data.vr_locked and "bm_menu_vr_locked"

			if slot_data.install_lock then
				text = text .. managers.localization:to_upper_text(slot_data.install_lock, {}) .. "\n"
			elseif vr_lock_text then
				text = text .. managers.localization:to_upper_text(vr_lock_text) .. "\n"
			elseif skill_text_id then
				text = text .. managers.localization:to_upper_text(skill_text_id, {
					slot_data.name_localized
				}) .. "\n"
			elseif dlc_text_id then
				text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
			elseif level_text_id then
				text = text .. managers.localization:to_upper_text(level_text_id, {
					level = slot_data.level
				}) .. "\n"
			end

			updated_texts[3].text = text
			updated_texts[3].below_stats = true
		end

		updated_texts[4].resource_color = {}
		local desc_text = managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].desc_id)

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"

			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end

		updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.grenade then
		updated_texts[1].text = self._slot_data.name_localized

		if not slot_data.unlocked then
			local skill_based = slot_data.skill_based
			local level_based = slot_data.level and slot_data.level > 0
			local dlc_based = slot_data.dlc_based or tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
			local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
			local level_text_id = level_based and "bm_menu_level_req" or false
			local dlc_text_id = dlc_based and slot_data.dlc_locked or false
			local text = ""

			if slot_data.install_lock then
				text = text .. managers.localization:to_upper_text(slot_data.install_lock, {}) .. "\n"
			elseif skill_text_id then
				text = text .. managers.localization:to_upper_text(skill_text_id, {
					slot_data.name_localized
				}) .. "\n"
			elseif dlc_text_id then
				text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
			elseif level_text_id then
				text = text .. managers.localization:to_upper_text(level_text_id, {
					level = slot_data.level
				}) .. "\n"
			end

			updated_texts[3].text = text
		end

		updated_texts[4].resource_color = {}
		local desc_text = managers.localization:text(tweak_data.blackmarket.projectiles[slot_data.name].desc_id)
		updated_texts[4].text = desc_text .. "\n"

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"

			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end

		updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.armor then
		local armor_name_text = self._armor_info_panel:child("armor_name_text")
		local armor_image = self._armor_info_panel:child("armor_image")
		local armor_equipped = self._armor_info_panel:child("armor_equipped")

		armor_name_text:set_text(self._slot_data.name_localized)
		armor_name_text:set_w(self._armor_info_panel:w() - armor_image:right() - 20)
		self:make_fine_text(armor_name_text)
		armor_name_text:grow(2, 0)
		armor_equipped:set_visible(self._slot_data.equipped)
		armor_equipped:set_top(armor_name_text:bottom())
		armor_image:set_image(self._slot_data.bitmap_texture)
		self._armor_info_panel:set_h(armor_image:bottom())

		if not self._slot_data.unlocked then
			updated_texts[3].text = utf8.to_upper(managers.localization:text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
				level = slot_data.level,
				SKILL = slot_data.name
			}))
			updated_texts[3].below_stats = true
		elseif managers.player:has_category_upgrade("player", "damage_to_hot") and not table.contains(tweak_data:get_raw_value("upgrades", "damage_to_hot_data", "armors_allowed") or {}, self._slot_data.name) then
			updated_texts[3].text = managers.localization:to_upper_text("bm_menu_disables_damage_to_hot")
			updated_texts[3].below_stats = true
		elseif managers.player:has_category_upgrade("player", "armor_health_store_amount") then --Add Ex-Pres per-kill armor regen bonus.
			local bm_armor_tweak = tweak_data.blackmarket.armors[slot_data.name]
			local upgrade_level = bm_armor_tweak.upgrade_level
			local amount = managers.player:body_armor_value("skill_max_health_store", upgrade_level, 1)
			local multiplier = managers.player:upgrade_value("player", "armor_max_health_store_multiplier", 1)
			local regen_speed = format_round((managers.player:body_armor_value("skill_kill_change_regenerate_speed", upgrade_level, 1) - 1) * 100)
			if managers.player:has_category_upgrade("player", "skill_kill_change_regenerate_speed") then
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_armor_max_health_store_1", 
					{health_stored = format_round(amount * multiplier * tweak_data.gui.stats_present_multiplier)})
			else
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_armor_max_health_store_2", 
					{health_stored = format_round(amount * multiplier * tweak_data.gui.stats_present_multiplier), regen_bonus = regen_speed})
			end
			updated_texts[2].below_stats = true
		elseif managers.player:has_category_upgrade("player", "armor_grinding") then --Add Anarchist per-armor skill information.
			local bm_armor_tweak = tweak_data.blackmarket.armors[slot_data.name]
			local upgrade_level = bm_armor_tweak.upgrade_level
			local passive_regen = format_round(10 * tweak_data.upgrades.values.player.armor_grinding[1][upgrade_level][1])
			local active_regen = format_round(10 * tweak_data.upgrades.values.player.damage_to_armor[1][upgrade_level][1])
			if managers.player:has_category_upgrade("player", "damage_to_armor") then
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_armor_grinding_2", 
					{passive_armor_regen = passive_regen, active_armor_regen = active_regen})
			else
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_armor_grinding_1", 
					{passive_armor_regen = passive_regen})
			end
			updated_texts[2].below_stats = true
		end
	elseif identifier == self.identifiers.armor_skins then
		local skin_tweak = tweak_data.economy.armor_skins[self._slot_data.name]
		updated_texts[1].text = self._slot_data.name_localized
		local desc = ""
		local desc_colors = {}

		if self._slot_data.equipped then
			updated_texts[2].text = "##" .. managers.localization:to_upper_text("bm_menu_equipped") .. "##"
			updated_texts[2].resource_color = tweak_data.screen_colors.text
		elseif not self._slot_data.cosmetic_unlocked then
			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			else
				updated_texts[2].text = "##" .. managers.localization:to_upper_text("bm_menu_item_locked") .. "##"
				updated_texts[2].resource_color = tweak_data.screen_colors.important_1
			end
		end

		if self._slot_data.cosmetic_rarity then
			local rarity_color = tweak_data.economy.rarities[self._slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text
			updated_texts[1].text = "##" .. self._slot_data.name_localized .. "##"
			updated_texts[1].resource_color = rarity_color
			local rarity = managers.localization:to_upper_text("bm_menu_steam_item_rarity", {
				rarity = managers.localization:text(tweak_data.economy.rarities[self._slot_data.cosmetic_rarity].name_id)
			})
			desc = desc .. rarity .. "\n\n"

			table.insert(desc_colors, rarity_color)
		end

		if skin_tweak.desc_id then
			local desc_text = managers.localization:text(skin_tweak.desc_id)

			if desc_text ~= " " then
				desc = desc .. desc_text
				desc = desc .. "\n\n"
			end
		end

		if skin_tweak.challenge_id then
			desc = desc .. "##" .. managers.localization:to_upper_text("menu_unlock_condition") .. "##\n"

			table.insert(desc_colors, tweak_data.screen_colors.challenge_title)

			desc = desc .. managers.localization:text(skin_tweak.challenge_id)
		elseif not skin_tweak.free then
			if skin_tweak.unlock_id then
				desc = desc .. managers.localization:text(skin_tweak.unlock_id) .. "\n"

				table.insert(desc_colors, tweak_data.screen_colors.challenge_title)
			else
				local safe = self:get_safe_for_economy_item(slot_data.name)
				safe = safe and safe.name_id and managers.localization:text(safe.name_id) or "invalid skin"
				desc = desc .. managers.localization:text("bm_menu_purchase_steam", {
					safe = safe
				}) .. "\n"

				table.insert(desc_colors, tweak_data.screen_colors.challenge_title)
			end
		end

		updated_texts[4].text = desc
		updated_texts[4].resource_color = desc_colors
		updated_texts[4].below_stats = true

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"

			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end
	elseif identifier == self.identifiers.player_style then
		local player_style = slot_data.name
		local player_style_tweak = tweak_data.blackmarket.player_styles[player_style]
		updated_texts[1].text = slot_data.name_localized

		if not slot_data.unlocked then
			updated_texts[2].text = "##" .. managers.localization:to_upper_text("bm_menu_item_locked") .. "##"
			updated_texts[2].resource_color = tweak_data.screen_colors.important_1
			updated_texts[3].text = slot_data.dlc_locked and managers.localization:to_upper_text(slot_data.dlc_locked) or managers.localization:to_upper_text("bm_menu_dlc_locked")
		end

		local desc_id = player_style_tweak.desc_id
		local desc_colors = {}
		updated_texts[4].text = desc_id and managers.localization:text(desc_id) or ""

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			local gvalue_tweak = tweak_data.lootdrop.global_values[slot_data.global_value]

			if gvalue_tweak.desc_id then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text(gvalue_tweak.desc_id) .. "##"

				table.insert(desc_colors, gvalue_tweak.color)
			end
		end

		if #desc_colors == 1 then
			updated_texts[4].resource_color = desc_colors[1]
		else
			updated_texts[4].resource_color = desc_colors
		end
	elseif identifier == self.identifiers.suit_variation then
		local player_style = self._data.prev_node_data.name
		local player_style_tweak = tweak_data.blackmarket.player_styles[player_style]
		local suit_variation = slot_data.name
		local suit_variation_tweak = player_style_tweak.material_variations[suit_variation]
		updated_texts[1].text = slot_data.name_localized

		if not slot_data.unlocked then
			updated_texts[2].text = "##" .. managers.localization:to_upper_text("bm_menu_item_locked") .. "##"
			updated_texts[2].resource_color = tweak_data.screen_colors.important_1
			updated_texts[3].text = slot_data.dlc_locked and managers.localization:to_upper_text(slot_data.dlc_locked) or managers.localization:to_upper_text("bm_menu_dlc_locked")
		end

		local desc_id = suit_variation_tweak and suit_variation_tweak.desc_id or "menu_default"
		local desc_colors = {}
		updated_texts[4].text = desc_id and managers.localization:text(desc_id) or ""

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			local gvalue_tweak = tweak_data.lootdrop.global_values[slot_data.global_value]

			if gvalue_tweak.desc_id then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text(gvalue_tweak.desc_id) .. "##"

				table.insert(desc_colors, gvalue_tweak.color)
			end
		end

		if #desc_colors == 1 then
			updated_texts[4].resource_color = desc_colors[1]
		else
			updated_texts[4].resource_color = desc_colors
		end
	elseif identifier == self.identifiers.mask then
		local price = slot_data.price
		price = price or (type(slot_data.unlocked) == "number" or managers.money:get_mask_slot_sell_value(slot_data.slot)) and managers.money:get_mask_sell_value(slot_data.name, slot_data.global_value)

		if not slot_data.empty_slot then
			updated_texts[1].text = slot_data.name_localized

			if not self._data.is_loadout and slot_data.slot ~= 1 and slot_data.unlocked == true then
				self:_set_rename_info_text(1)
			end

			local resource_colors = {}

			if price > 0 and slot_data.slot ~= 1 then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_value") .. " " .. managers.experience:cash_string(price) .. "##" .. "   "

				table.insert(resource_colors, slot_data.can_afford ~= false and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
			end

			if slot_data.num_backs then
				updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = math.abs(slot_data.unlocked)
				}) .. "##"

				table.insert(resource_colors, tweak_data.screen_colors.text)
			end

			if #resource_colors == 1 then
				updated_texts[2].resource_color = resource_colors[1]
			else
				updated_texts[2].resource_color = resource_colors
			end

			local achievement_tracker = tweak_data.achievement.mask_tracker
			local mask_id = slot_data.name
			local achievement_lock_id = managers.dlc:is_mask_achievement_locked(mask_id)
			local achievement_milestone_lock_id = managers.dlc:is_mask_achievement_milestone_locked(mask_id)

			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			elseif slot_data.infamy_lock then
				updated_texts[3].text = managers.localization:to_upper_text("menu_infamy_lock_info")
			elseif mask_id and achievement_tracker[mask_id] and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
				local achievement_data = achievement_tracker[mask_id]
				local max_progress = achievement_data.max_progress
				local text_id = achievement_data.text_id
				local award = achievement_data.award
				local stat = achievement_data.stat

				if stat and max_progress > 0 then
					local progress_left = max_progress - (managers.achievment:get_stat(stat) or 0)

					if progress_left > 0 then
						local progress = tostring(progress_left)
						updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id, {
							progress = progress
						}) .. "##"
						updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
					end
				elseif award and not managers.achievment:get_info(award).awarded then
					updated_texts[3].text = "##" .. managers.localization:text(achievement_data.text_id) .. "##"
					updated_texts[3].resource_color = tweak_data.screen_colors.button_stage_2
				end
			elseif achievement_lock_id and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
				local dlc_tweak = tweak_data.dlc[achievement_lock_id]
				local achievement = dlc_tweak and dlc_tweak.achievement_id
				local achievement_visual = tweak_data.achievement.visual[achievement]

				if achievement_visual then
					updated_texts[3].text = managers.localization:to_upper_text(achievement_visual.desc_id)

					if achievement_visual.progress then
						updated_texts[3].text = updated_texts[3].text .. " (" .. tostring(achievement_visual.progress.get()) .. "/" .. tostring(achievement_visual.progress.max) .. ")"
					end
				end
			elseif achievement_milestone_lock_id and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
				for _, data in ipairs(tweak_data.achievement.milestones) do
					if data.id == achievement_milestone_lock_id then
						updated_texts[3].text = managers.localization:to_upper_text("bm_menu_milestone_reward_unlock", {
							NUM = tostring(data.at)
						})

						break
					end
				end
			elseif managers.dlc:is_content_skirmish_locked("masks", mask_id) and (type(slot_data.unlocked) ~= "number" and not slot_data.unlocked or slot_data.unlocked == 0) then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_skirmish_content_reward")
			end

			if mask_id then
				local desc_id = tweak_data.blackmarket.masks[mask_id].desc_id
				updated_texts[4].text = desc_id and managers.localization:text(desc_id) or Application:production_build() and "Add ##desc_id## to ##" .. mask_id .. "## in tweak_data.blackmarket.masks" or ""

				if slot_data.global_value and slot_data.global_value ~= "normal" then
					local gvalue_tweak = tweak_data.lootdrop.global_values[slot_data.global_value]

					if gvalue_tweak.desc_id then
						updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text(gvalue_tweak.desc_id) .. "##"
						updated_texts[4].resource_color = gvalue_tweak.color
					end
				end
			end
		elseif slot_data.locked_slot then
			ignore_lock = true
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_locked_mask_slot")

			if slot_data.cannot_buy then
				updated_texts[3].text = slot_data.dlc_locked
			else
				updated_texts[2].text = slot_data.dlc_locked
			end

			updated_texts[4].text = managers.localization:text("bm_menu_locked_mask_slot_desc")
		else
			if slot_data.cannot_buy then
				updated_texts[2].text = managers.localization:to_upper_text("bm_menu_empty_mask_slot")
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_no_masks_in_stash_varning")
			else
				local prefix = ""

				if not managers.menu:is_pc_controller() then
					prefix = managers.localization:get_default_macro("BTN_A")
				end

				updated_texts[1].text = prefix .. managers.localization:to_upper_text("bm_menu_btn_buy_new_mask")
			end

			updated_texts[4].text = managers.localization:text("bm_menu_empty_mask_slot_buy_info")
		end
	elseif identifier == self.identifiers.weapon_mod then
		local price = slot_data.price or managers.money:get_weapon_modify_price(prev_data.name, slot_data.name, slot_data.global_value)
		updated_texts[1].text = slot_data.name_localized
		local resource_colors = {}

		if price > 0 then
			updated_texts[2].text = "##" .. managers.localization:to_upper_text("st_menu_cost") .. " " .. managers.experience:cash_string(price) .. "##"

			table.insert(resource_colors, slot_data.can_afford and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
		end

		local unlocked = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked or 0
		updated_texts[2].text = updated_texts[2].text .. (price > 0 and "   " or "")

		if slot_data.previewing then
			updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_mod_preview")
		elseif slot_data.free_of_charge then
			updated_texts[2].text = updated_texts[2].text .. (unlocked > 0 and managers.localization:to_upper_text("bm_menu_item_unlocked") or managers.localization:to_upper_text("bm_menu_item_locked"))
		else
			updated_texts[2].text = updated_texts[2].text .. "##" .. managers.localization:to_upper_text("bm_menu_item_amount", {
				amount = tostring(math.abs(unlocked))
			}) .. "##"

			table.insert(resource_colors, math.abs(unlocked) > 0 and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1)
		end

		if #resource_colors == 1 then
			updated_texts[2].resource_color = resource_colors[1]
		else
			updated_texts[2].resource_color = resource_colors
		end

		local can_not_afford = slot_data.can_afford == false
		local conflicted = slot_data.conflict
		local out_of_item = slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked == 0

		if slot_data.install_lock then
			updated_texts[3].text = managers.localization:to_upper_text(slot_data.install_lock)
			updated_texts[3].below_stats = true
		elseif slot_data.dlc_locked then
			updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
		elseif conflicted then
			updated_texts[3].text = managers.localization:to_upper_text("bm_menu_conflict", {
				conflict = slot_data.conflict
			})
		elseif slot_data.lock_texture then
			local achievement_lock_id = managers.dlc:is_weapon_mod_achievement_locked(slot_data.name)
			local achievement_milestone_lock_id = managers.dlc:is_weapon_mod_achievement_milestone_locked(slot_data.name)

			if achievement_lock_id then
				local dlc_tweak = tweak_data.dlc[achievement_lock_id]
				local achievement = dlc_tweak and dlc_tweak.achievement_id
				local achievement_visual = tweak_data.achievement.visual[achievement]

				if achievement_visual then
					updated_texts[3].text = managers.localization:to_upper_text(achievement_visual.desc_id)

					if achievement_visual.progress then
						updated_texts[3].text = updated_texts[3].text .. " (" .. tostring(achievement_visual.progress.get()) .. "/" .. tostring(achievement_visual.progress.max) .. ")"
					end

					updated_texts[3].below_stats = true
				end
			elseif achievement_milestone_lock_id then
				for _, data in ipairs(tweak_data.achievement.milestones) do
					if data.id == achievement_milestone_lock_id then
						updated_texts[3].text = managers.localization:to_upper_text("bm_menu_milestone_reward_unlock", {
							NUM = tostring(data.at)
						})
						updated_texts[3].below_stats = true

						break
					end
				end
			elseif managers.dlc:is_content_skirmish_locked("weapon_mods", slot_data.name) then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_skirmish_content_reward")
				updated_texts[3].below_stats = true
			end
		end

		local part_id = slot_data.name
		local part_data = part_id and tweak_data.weapon.factory.parts[part_id]
		local perks = part_data and part_data.perks
		local is_gadget = part_data and part_data.type == "gadget" or perks and table.contains(perks, "gadget")
		local is_ammo = part_data and part_data.type == "ammo" or perks and table.contains(perks, "ammo")
		local is_bayonet = part_data and part_data.type == "bayonet" or perks and table.contains(perks, "bayonet")
		local is_bipod = part_data and part_data.type == "bipod" or perks and table.contains(perks, "bipod")
		local has_desc = part_data and part_data.has_description == true
		updated_texts[4].resource_color = {}

		if is_gadget or is_ammo or is_bayonet or is_bipod or has_desc then
			local crafted = managers.blackmarket:get_crafted_category_slot(prev_data.category, prev_data.slot)
			updated_texts[4].text = managers.weapon_factory:get_part_desc_by_part_id_from_weapon(part_id, crafted.factory_id, crafted.blueprint)
		end

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			if is_gadget or is_ammo or is_bayonet or has_desc then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			else
				updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			end

			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end

		if perks and table.contains(perks, "bonus") then
			updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text("bm_menu_disables_cosmetic_bonus") .. "##"

			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.text)
		end

		updated_texts[4].below_stats = true
		local weapon_id = managers.weapon_factory:get_factory_id_by_weapon_id(prev_data.name)

		local function get_forbids(weapon_id, part_id)
			local weapon_data = tweak_data.weapon.factory[weapon_id]

			if not weapon_data then
				return {}
			end

			local default_parts = {}

			for _, part in ipairs(weapon_data.default_blueprint) do
				table.insert(default_parts, part)

				local part_data = tweak_data.weapon.factory.parts[part]

				if part_data and part_data.adds then
					for _, part in ipairs(part_data.adds) do
						table.insert(default_parts, part)
					end
				end
			end

			local weapon_mods = {}

			for _, part in ipairs(weapon_data.uses_parts) do
				if not table.contains(default_parts, part) then
					local part_data = tweak_data.weapon.factory.parts[part]

					if part_data and not part_data.unatainable then
						weapon_mods[part] = {}
					end
				end
			end

			for part, _ in pairs(weapon_mods) do
				local part_data = tweak_data.weapon.factory.parts[part]

				if part_data.forbids then
					for other_part, _ in pairs(weapon_mods) do
						local other_part_data = tweak_data.weapon.factory.parts[part]

						if table.contains(part_data.forbids, other_part) then
							table.insert(weapon_mods[part], other_part)
							table.insert(weapon_mods[other_part], part)
						end
					end
				end
			end

			return weapon_mods[part_id]
		end

		local forbidden_parts = get_forbids(weapon_id, part_id)
		local droppable_mods = managers.blackmarket:get_dropable_mods_by_weapon_id(prev_data.name)

		if slot_data.removes and #slot_data.removes > 0 then
			local removed_mods = ""

			for i, name in ipairs(slot_data.removes) do
				local mod_data = tweak_data.weapon.factory.parts[name]

				if droppable_mods[mod_data.type] then
					local mod_name = mod_data and mod_data.name_id or name
					mod_name = managers.localization:text(mod_name)
					removed_mods = string.format("%s%s%s", removed_mods, i > 1 and ", " or "", mod_name)
				end
			end

			if #removed_mods > 0 then
				updated_texts[5].text = managers.localization:to_upper_text("bm_mod_equip_remove", {
					mod = removed_mods
				})
			end
		elseif forbidden_parts and #forbidden_parts > 0 then
			local forbids = {}

			for i, forbidden_part in ipairs(forbidden_parts) do
				local data = tweak_data.weapon.factory.parts[forbidden_part]

				if data then
					forbids[data.type] = (forbids[data.type] or 0) + 1
				end
			end

			local text = ""

			for category, amount in pairs(forbids) do
				if droppable_mods[category] then
					if text ~= "" then
						text = text .. "\n"
					end

					local category_count = 0
					local weapon_data = tweak_data.weapon.factory[weapon_id]

					for _, part_name in ipairs(weapon_data.uses_parts) do
						local part_data = tweak_data.weapon.factory.parts[part_name]

						if part_data and not part_data.unatainable and part_data.type == category and not table.contains(weapon_data.default_blueprint, part_name) then
							category_count = category_count + 1
						end
					end

					local percent_forbidden = amount / category_count
					local category = managers.localization:text("bm_menu_" .. tostring(category) .. "_plural")
					local quantifier = percent_forbidden == 1 and "all" or percent_forbidden > 0.66 and "most" or "some"
					quantifier = managers.localization:text("bm_mod_incompatibility_" .. tostring(quantifier))
					text = managers.localization:to_upper_text("bm_mod_incompatibilities", {
						quantifier = quantifier,
						category = category
					})
				end
			end

			updated_texts[5].text = text
		end
	elseif identifier == self.identifiers.mask_mod then
		if not managers.blackmarket:currently_customizing_mask() then
			return
		end

		local mask_mod_info = managers.blackmarket:info_customize_mask()
		updated_texts[2].text = managers.localization:to_upper_text("bm_menu_mask_customization") .. "\n"
		local resource_color = {}
		local material_text = managers.localization:to_upper_text("bm_menu_materials")
		local pattern_text = managers.localization:to_upper_text("bm_menu_textures")
		local colors_text = managers.localization:to_upper_text("bm_menu_colors")

		if mask_mod_info[1].overwritten then
			updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"

			table.insert(resource_color, tweak_data.screen_colors.risk)
		elseif mask_mod_info[1].is_good then
			updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. managers.localization:text(mask_mod_info[1].text)

			if mask_mod_info[1].price and mask_mod_info[1].price > 0 then
				updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[1].price)
			end

			updated_texts[2].text = updated_texts[2].text .. "\n"
		else
			updated_texts[2].text = updated_texts[2].text .. material_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"

			table.insert(resource_color, tweak_data.screen_colors.important_1)
		end

		if mask_mod_info[2].overwritten then
			updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"

			table.insert(resource_color, tweak_data.screen_colors.risk)
		elseif mask_mod_info[2].is_good then
			updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. managers.localization:text(mask_mod_info[2].text)

			if mask_mod_info[2].price and mask_mod_info[2].price > 0 then
				updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[2].price)
			end

			updated_texts[2].text = updated_texts[2].text .. "\n"
		else
			updated_texts[2].text = updated_texts[2].text .. pattern_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"

			table.insert(resource_color, tweak_data.screen_colors.important_1)
		end

		if mask_mod_info[3].overwritten then
			updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"

			table.insert(resource_color, tweak_data.screen_colors.risk)
		elseif mask_mod_info[3].is_good then
			updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. managers.localization:text(mask_mod_info[3].text)

			if mask_mod_info[3].price and mask_mod_info[3].price > 0 then
				updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[3].price)
			end

			updated_texts[2].text = updated_texts[2].text .. "\n"
		else
			updated_texts[2].text = updated_texts[2].text .. colors_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"

			table.insert(resource_color, tweak_data.screen_colors.important_1)
		end

		updated_texts[2].text = updated_texts[2].text .. "\n"
		local price, can_afford = managers.blackmarket:get_customize_mask_value()

		if slot_data.global_value then
			local mask = managers.blackmarket:get_crafted_category("masks")[slot_data.prev_slot] or {}
			updated_texts[4].text = "\n\n" .. managers.localization:to_upper_text("menu_bm_highlighted") .. "\n" .. slot_data.name_localized
			local mod_price = managers.money:get_mask_part_price_modified(slot_data.category, slot_data.name, slot_data.global_value, mask.mask_id) or 0

			if mod_price > 0 then
				updated_texts[4].text = updated_texts[4].text .. " " .. managers.experience:cash_string(mod_price)
			else
				updated_texts[4].text = updated_texts[4].text
			end

			if slot_data.unlocked and slot_data.unlocked ~= true and slot_data.unlocked ~= 0 then
				updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = math.abs(slot_data.unlocked)
				})
			end

			updated_texts[4].resource_color = {}

			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"

				table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			end

			if slot_data.dlc_locked then
				updated_texts[3].text = managers.localization:to_upper_text(slot_data.dlc_locked)
			end

			local customize_mask_blueprint = managers.blackmarket:get_customize_mask_blueprint()
			local index = {
				colors = 3,
				materials = 1,
				textures = 2
			}
			index = index[slot_data.category]

			if index == 1 then
				customize_mask_blueprint.material = {
					global_value = slot_data.global_value,
					id = slot_data.name
				}
			elseif index == 2 then
				customize_mask_blueprint.pattern = {
					global_value = slot_data.global_value,
					id = slot_data.name
				}
			elseif index == 3 then
				customize_mask_blueprint.color = {
					global_value = slot_data.global_value,
					id = slot_data.name
				}
			end

			local part_info = managers.blackmarket:get_info_from_mask_blueprint(customize_mask_blueprint, mask.mask_id)
			part_info = part_info[index]

			if part_info.override then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text("menu_bm_overwrite", {
					category = managers.localization:text("bm_menu_" .. part_info.override)
				}) .. "##"

				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
			end
		end

		if price and price > 0 then
			updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("menu_bm_total_cost", {
				cost = (not can_afford and "##" or "") .. managers.experience:cash_string(price) .. (not can_afford and "##" or "")
			})

			if not can_afford then
				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end
		end

		if #resource_color == 1 then
			updated_texts[2].resource_color = resource_color[1]
		else
			updated_texts[2].resource_color = resource_color
		end

		if not managers.blackmarket:can_finish_customize_mask() then
			local list_of_mods = ""
			local missed_mods = {}

			for _, data in ipairs(mask_mod_info) do
				if not data.is_good and not data.overwritten then
					table.insert(missed_mods, managers.localization:text(data.text))
				end
			end

			if #missed_mods > 1 then
				for i = 1, #missed_mods do
					list_of_mods = list_of_mods .. missed_mods[i]

					if i < #missed_mods - 1 then
						list_of_mods = list_of_mods .. ", "
					elseif i == #missed_mods - 1 then
						list_of_mods = list_of_mods .. ", "
					end
				end
			elseif #missed_mods == 1 then
				list_of_mods = missed_mods[1]
			end

			if slot_data.dlc_locked then
				updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {
					missed_mods = list_of_mods
				}) .. "\n"
			else
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_missing_to_finalize_mask", {
					missed_mods = list_of_mods
				}) .. "\n"
			end
		elseif price and managers.money:total() < price then
			if slot_data.dlc_locked then
				updated_texts[3].text = updated_texts[3].text .. "\n" .. managers.localization:to_upper_text("bm_menu_not_enough_cash") .. "\n"
			else
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_not_enough_cash") .. "\n"
			end
		end
	elseif identifier == self.identifiers.deployable then
		updated_texts[1].text = slot_data.name_localized

		if not self._slot_data.unlocked then
			updated_texts[3].text = managers.localization:to_upper_text(slot_data.level == 0 and (slot_data.skill_name or "bm_menu_skilltree_locked") or "bm_menu_level_req", {
				level = slot_data.level,
				SKILL = slot_data.name
			})
			updated_texts[3].text = updated_texts[3].text .. "\n"
		end

		updated_texts[4].text = managers.localization:text(tweak_data.blackmarket.deployables[slot_data.name].desc_id, {
			BTN_INTERACT = managers.localization:btn_macro("interact", true),
			BTN_USE_ITEM = managers.localization:btn_macro("use_item", true)
		})
	elseif identifier == self.identifiers.character then
		updated_texts[1].text = slot_data.name_localized

		if not slot_data.unlocked then
			local dlc_text_id = slot_data.dlc_locked or "ERR"
			local text = managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
			updated_texts[3].text = text
		end

		updated_texts[4].text = managers.localization:text(slot_data.name .. "_desc")
	elseif identifier == self.identifiers.weapon_cosmetic then
		updated_texts[1].text = managers.localization:to_upper_text("bm_menu_steam_item_name", {
			type = managers.localization:text("bm_menu_" .. slot_data.category),
			name = slot_data.name_localized
		})
		updated_texts[1].resource_color = tweak_data.screen_colors.text

		if slot_data.weapon_id then
			updated_texts[2].text = managers.weapon_factory:get_weapon_name_by_weapon_id(slot_data.weapon_id)
		end

		updated_texts[4].resource_color = {}
		local cosmetic_rarity = slot_data.cosmetic_rarity
		local cosmetic_quality = slot_data.cosmetic_quality
		local cosmetic_bonus = slot_data.cosmetic_bonus

		if slot_data.is_a_color_skin then
			if slot_data.equipped then
				local color_id = slot_data.name
				local color_tweak = tweak_data.blackmarket.weapon_skins[color_id]

				if not slot_data.unlocked then
					local global_value = slot_data.global_value
					local gvalue_tweak = tweak_data.lootdrop.global_values[global_value]
					local dlc = color_tweak.dlc or managers.dlc:global_value_to_dlc(global_value)
					local unlocked = not dlc or managers.dlc:is_dlc_unlocked(dlc)
					local have_color = managers.blackmarket:has_item(global_value, "weapon_skins", color_id)

					if not unlocked then
						updated_texts[5].text = managers.localization:text(gvalue_tweak and gvalue_tweak.unlock_id or "bm_menu_dlc_locked")
					elseif not have_color then
						local achievement_locked_content = managers.dlc:weapon_color_achievement_locked_content(color_id)
						local dlc_tweak = tweak_data.dlc[achievement_locked_content]
						local achievement = dlc_tweak and dlc_tweak.achievement_id

						if achievement and managers.achievment:get_info(achievement) then
							local achievement_visual = tweak_data.achievement.visual[achievement]
							updated_texts[5].text = managers.localization:text(achievement_visual and achievement_visual.desc_id or "achievement_" .. tostring(achievement) .. "_desc" or "bm_menu_dlc_locked")
						else
							updated_texts[5].text = managers.localization:text("bm_menu_dlc_locked")
						end
					end
				end

				local name_string = managers.localization:to_upper_text(color_tweak.name_id)
				local color_index_string = managers.localization:to_upper_text("bm_menu_weapon_color_index", {
					variation = managers.localization:text(tweak_data.blackmarket:get_weapon_color_index_string(slot_data.cosmetic_color_index))
				})
				local quality_string = managers.localization:to_upper_text("bm_menu_weapon_color_quality", {
					quality = managers.localization:text(tweak_data.economy.qualities[cosmetic_quality].name_id)
				})
				updated_texts[4].text = updated_texts[4].text .. name_string .. "\n" .. color_index_string .. "\n" .. quality_string

				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.text)
				table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[cosmetic_quality].color or tweak_data.screen_colors.text)
			else
				updated_texts[4].text = updated_texts[4].text .. managers.localization:text("bm_menu_customizable_weapon_color_desc")
			end
		else
			if not slot_data.unlocked then
				local safe = self:get_safe_for_economy_item(slot_data.name)
				safe = safe and safe.name_id or "invalid skin"
				local macros = {
					safe = managers.localization:text(safe)
				}
				local lock_text_id = slot_data.lock_text_id or "bm_menu_wcc_not_owned"
				updated_texts[5].text = (slot_data.default_blueprint and "" or "\n") .. managers.localization:text(lock_text_id, macros)
			end

			if cosmetic_rarity then
				updated_texts[4].text = updated_texts[4].text .. managers.localization:to_upper_text("bm_menu_steam_item_rarity", {
					rarity = managers.localization:text(tweak_data.economy.rarities[cosmetic_rarity].name_id)
				})

				table.insert(updated_texts[4].resource_color, tweak_data.economy.rarities[cosmetic_rarity].color or tweak_data.screen_colors.text)
			end

			if cosmetic_quality then
				updated_texts[4].text = updated_texts[4].text .. (cosmetic_rarity and "\n" or "") .. managers.localization:to_upper_text("bm_menu_steam_item_quality", {
					quality = managers.localization:text(tweak_data.economy.qualities[cosmetic_quality].name_id)
				})

				table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[cosmetic_quality].color or tweak_data.screen_colors.text)
			end

			if cosmetic_bonus then
				local bonus = tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id] and tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id].bonus

				if bonus then
					local bonus_tweak = tweak_data.economy.bonuses[bonus]
					local bonus_value = bonus_tweak.exp_multiplier and bonus_tweak.exp_multiplier * 100 - 100 .. "%" or bonus_tweak.money_multiplier and bonus_tweak.money_multiplier * 100 - 100 .. "%"
					updated_texts[4].text = updated_texts[4].text .. ((cosmetic_quality or cosmetic_rarity) and "\n" or "") .. managers.localization:text("dialog_new_tradable_item_bonus", {
						bonus = managers.localization:text(bonus_tweak.name_id, {
							team_bonus = bonus_value
						})
					})
				end
			end
		end

		if slot_data.desc_id and slot_data.unlocked then
			updated_texts[4].text = updated_texts[4].text .. "\n" .. managers.localization:text(slot_data.desc_id)
		end

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"

			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end

		updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.inventory_tradable then
		if slot_data.name ~= "empty" then
			updated_texts[1].text = managers.localization:to_upper_text("bm_menu_steam_item_name", {
				type = managers.localization:text("bm_menu_" .. slot_data.category),
				name = slot_data.name_localized
			})
			updated_texts[1].resource_color = tweak_data.screen_colors.text

			if slot_data.category == "weapon_skins" then
				updated_texts[1].text = ""
				local name_string = ""

				if slot_data.weapon_id then
					name_string = utf8.to_upper(managers.weapon_factory:get_weapon_name_by_weapon_id(slot_data.weapon_id)) .. " | "
				end

				name_string = name_string .. slot_data.name_localized
				local stat_bonus, team_bonus = nil

				if slot_data.cosmetic_quality then
					name_string = name_string .. ", " .. managers.localization:text(tweak_data.economy.qualities[slot_data.cosmetic_quality].name_id)
				end

				if slot_data.cosmetic_bonus then
					local bonus = tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id] and tweak_data.blackmarket.weapon_skins[slot_data.cosmetic_id].bonus

					if bonus then
						name_string = name_string .. ", " .. managers.localization:text("menu_bm_inventory_bonus")
					end
				end

				updated_texts[2].text = "##" .. name_string .. "##"

				if slot_data.cosmetic_rarity then
					updated_texts[2].resource_color = tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text
				end

				updated_texts[4].text, updated_texts[4].resource_color = InventoryDescription.create_description_item({
					category = "weapon_skins",
					instance_id = 0,
					entry = slot_data.name,
					quality = slot_data.cosmetic_quality,
					bonus = slot_data.cosmetic_bonus
				}, tweak_data.blackmarket.weapon_skins[slot_data.name], {
					default = tweak_data.screen_colors.text,
					mods = tweak_data.screen_colors.text
				}, true)
				updated_texts[4].below_stats = true
			elseif slot_data.category == "armor_skins" then
				updated_texts[1].text = "##" .. updated_texts[1].text .. "##"

				if slot_data.cosmetic_rarity then
					updated_texts[1].resource_color = tweak_data.economy.rarities[slot_data.cosmetic_rarity].color or tweak_data.screen_colors.text
				end

				updated_texts[2].text = managers.localization:text(slot_data.desc_id)
			elseif slot_data.safe_entry then
				local content_text, color_ranges = InventoryDescription.create_description_safe(slot_data.safe_entry, {}, true)
				updated_texts[2].text = content_text
				updated_texts[2].resource_color = color_ranges
			elseif slot_data.desc_id then
				updated_texts[2].text = managers.localization:text(slot_data.desc_id)
			end
		end
	elseif identifier == self.identifiers.custom then
		if self._data.custom_update_text_info then
			self._data.custom_update_text_info(slot_data, updated_texts, self)
		end
	elseif Application:production_build() then
		updated_texts[1].text = identifier:s()
	end

	if identifier == self.identifiers.armor then
		self._stats_panel:set_top(self._armor_info_panel:bottom() + 10)
	end

	if self._desc_mini_icons then
		for _, gui_object in pairs(self._desc_mini_icons) do
			self._panel:remove(gui_object[1])
		end
	end

	self._desc_mini_icons = {}
	local desc_mini_icons = self._slot_data.desc_mini_icons
	local info_box_panel = self._panel:child("info_box_panel")

	if desc_mini_icons and table.size(desc_mini_icons) > 0 then
		for _, mini_icon in pairs(desc_mini_icons) do
			local new_icon = self._panel:bitmap({
				layer = 1,
				texture = mini_icon.texture,
				x = info_box_panel:left() + 10 + mini_icon.right,
				w = mini_icon.w or 32,
				h = mini_icon.h or 32
			})

			table.insert(self._desc_mini_icons, {
				new_icon,
				2
			})
		end

		updated_texts[2].text = string.rep("     ", table.size(desc_mini_icons)) .. updated_texts[2].text
	end

	if not ignore_lock and slot_data.lock_texture and slot_data.lock_texture ~= true then
		local new_icon = self._panel:bitmap({
			h = 20,
			blend_mode = "add",
			w = 20,
			layer = 1,
			texture = slot_data.lock_texture,
			texture_rect = slot_data.lock_rect or nil,
			x = info_box_panel:left() + 10,
			color = self._info_texts[3]:color()
		})
		updated_texts[3].text = "     " .. updated_texts[3].text

		table.insert(self._desc_mini_icons, {
			new_icon,
			3
		})
	end

	if is_renaming_this and self._rename_info_text then
		local text = self._renaming_item.custom_name ~= "" and self._renaming_item.custom_name or "##" .. tostring(slot_data.raw_name_localized) .. "##"
		updated_texts[self._rename_info_text].text = text
		updated_texts[self._rename_info_text].resource_color = tweak_data.screen_colors.text:with_alpha(0.35)
	end

	for id, _ in ipairs(self._info_texts) do
		self:set_info_text(id, updated_texts[id].text, updated_texts[id].resource_color)
	end

	local _, _, _, th = self._info_texts[1]:text_rect()

	self._info_texts[1]:set_h(th)

	local y = self._info_texts[1]:bottom()
	local title_offset = y
	local bg = self._info_texts_bg[1]

	if alive(bg) then
		bg:set_shape(self._info_texts[1]:shape())
	end

	local below_y = nil

	for i = 2, #self._info_texts do
		local info_text = self._info_texts[i]

		info_text:set_font_size(small_font_size)
		info_text:set_w(self._info_texts_panel:w())

		_, _, _, th = info_text:text_rect()

		info_text:set_y(y)
		info_text:set_h(th)

		if updated_texts[i].below_stats then
			if slot_data.comparision_data and alive(self._stats_text_modslist) then
				info_text:set_world_y(below_y or self._stats_text_modslist:world_top())

				below_y = (below_y or info_text:world_y()) + th
			else
				info_text:set_top((below_y or info_text:top()) + 20)

				below_y = (below_y or info_text:top()) + th
			end
		end

		local scale = 1
		local attempts = 5
		local max_h = self._info_texts_panel:h() - info_text:top()

		if not updated_texts[i].below_stats and slot_data.comparision_data and alive(self._stats_panel) then
			max_h = self._stats_panel:world_top() - info_text:world_top()
		end

		if info_text:h() ~= 0 and max_h > 0 and max_h < info_text:h() then
			local font_size = info_text:font_size()
			local wanted_h = max_h

			while info_text:h() ~= 0 and not math.within(math.ceil(info_text:h()), wanted_h - 10, wanted_h) and attempts > 0 do
				scale = wanted_h / info_text:h()
				font_size = math.clamp(font_size * scale, 0, small_font_size)

				info_text:set_font_size(font_size)

				_, _, _, th = info_text:text_rect()

				info_text:set_h(th)

				attempts = attempts - 1
			end

			if info_text:h() ~= 0 and info_text:h() > self._info_texts_panel:h() - info_text:top() then
				print("[BlackMarketGui] Info text dynamic font sizer failed")

				scale = (self._info_texts_panel:h() - info_text:top()) / info_text:h()

				info_text:set_font_size(font_size * scale)

				_, _, _, th = info_text:text_rect()

				info_text:set_h(th)
			end
		end

		local bg = self._info_texts_bg[i]

		if alive(bg) then
			bg:set_shape(info_text:shape())
		end

		y = info_text:bottom()
	end

	for _, desc_mini_icon in ipairs(self._desc_mini_icons) do
		desc_mini_icon[1]:set_y(title_offset)
		desc_mini_icon[1]:set_world_top(self._info_texts[desc_mini_icon[2]]:world_top() + 1)
	end

	if is_renaming_this and self._rename_info_text and self._rename_caret then
		local info_text = self._info_texts[self._rename_info_text]
		local x, y, w, h = info_text:text_rect()

		if self._renaming_item.custom_name == "" then
			w = 0
		end

		self._rename_caret:set_w(2)
		self._rename_caret:set_h(h)
		self._rename_caret:set_world_position(x + w, y)
	end
end