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
	7,
	4
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
	return round_value and tostring(math.round(num)) or string.format("%.1f", num):gsub("%.?0+$", "")
end

local function format_round_2(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num)
end
local function format_round_3(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num):gsub("%.?0+$", "")
end

function BlackMarketGui:set_info_text(id, new_string, resource_color)
	local info_text = self._info_texts[id]
	local text = new_string
	self._info_texts_bg[id]:set_visible(false)
	info_text:set_blend_mode("add")
	info_text:set_color(self._info_texts_color[id] or Color.white)
	info_text:clear_range_color(0, utf8.len(info_text:text()))

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

	info_text:set_text(text)
	info_text:set_alpha(1)

	if resource_color then
		info_text:clear_range_color(1, utf8.len(text))

		if #start_ci ~= #end_ci then
			Application:error("BlackMarketGui: Missing ##'s in :set_info_text() string!", id, new_string, #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				info_text:set_range_color(start_ci[i], end_ci[i], type(resource_color) == "table" and (resource_color[i] or tweak_data.screen_colors.skill_color) or (resource_color or tweak_data.screen_colors.skill_color))
			end
		end
	end
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
			elseif managers.dlc:is_content_crimespree_locked("weapon_mods", new_data.name) then
				new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
			elseif managers.dlc:is_content_infamy_locked("weapon_mods", new_data.name) then
				new_data.lock_texture = "guis/textures/pd2/lock_infamy"
				new_data.dlc_locked = "menu_infamy_lock_info"				
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
			local show_stats = not new_data.conflict and new_data.unlocked and not is_gadget and not new_data.dlc_locked and tweak_data.weapon.factory.parts[new_data.name].type ~= "charm"
			if show_stats then
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
		
		local gmod_name = data[equipped].name
		local gmod_td = tweak_data.weapon.factory.parts[gmod_name]
		local has_customizable_gadget = (data.name == "gadget" or table.contains(gmod_td.perks or {}, "gadget")) and (gmod_td.sub_type == "laser" or gmod_td.sub_type == "flashlight")

		if not has_customizable_gadget and gmod_td.adds then
			for _, part_id in ipairs(gmod_td.adds) do
				local sub_type = tweak_data.weapon.factory.parts[part_id].sub_type

				if sub_type == "laser" or sub_type == "flashlight" then
					has_customizable_gadget = true

					break
				end
			end
		end
			
		if has_customizable_gadget then
			if not crafted.customize_locked then
				table.insert(data[equipped], "wm_customize_gadget")
			end
			local secondary_sub_type = false
			if gmod_td.adds then
				for _, part_id in ipairs(gmod_td.adds) do
					local sub_type = tweak_data.weapon.factory.parts[part_id].sub_type
					if sub_type == "laser" or sub_type == "flashlight" then
						secondary_sub_type = sub_type
						break
					end
				end
			end
			
			local colors = managers.blackmarket:get_part_custom_colors(data[equipped].category, data[equipped].slot, gmod_name)
			
			if colors then
				data[equipped].mini_colors = {}

				if gmod_td.sub_type then
					table.insert(data[equipped].mini_colors, {
						alpha = 0.8,
						blend = "add",
						color = colors[gmod_td.sub_type] or Color(1, 0, 1)
					})
				end

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

function BlackMarketGui:choose_weapon_mods_callback(data)
	local dropable_mods = managers.blackmarket:get_dropable_mods_by_weapon_id(data.name, {
		category = data.category,
		slot = data.slot
	})
	local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(data.name)
	local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
	local new_node_data = {}
	local cosmetic_instances = managers.blackmarket:get_cosmetics_instances_by_weapon_id(data.name)
	local all_cosmetics = managers.blackmarket:get_cosmetics_by_weapon_id(data.name)
	local bmm = managers.blackmarket
	local is_tam_f = bmm.is_weapon_skin_tam
	local all_skins_td = tweak_data.blackmarket.weapon_skins
	local is_steam = SystemInfo:distribution() == Idstring("STEAM")
	local cosmetic_td = nil	

	local weapon_id = data.name
	local weapon_tweak = tweak_data.weapon
	local has_type_override = weapon_tweak[ weapon_id ] and weapon_tweak[ weapon_id ].override_mod_type_name
	
	for id, data in pairs(all_cosmetics) do
		cosmetic_td = all_skins_td[id]

		if not is_steam and not cosmetic_td.is_a_color_skin and not cosmetic_td.is_a_unlockable or is_tam_f(bmm, id) then
			all_cosmetics[id] = nil
		end
	end

	if table.size(all_cosmetics) > 0 then
		local inventory_tradable = managers.blackmarket:get_inventory_tradable()
		local td = tweak_data.blackmarket.weapon_skins
		local rtd = tweak_data.economy.rarities
		local x_td, y_td, x_rar, y_rar, x_quality, y_quality, weapon_skin_id = nil

		local function sort_func_instances(x, y)
			x_td = td[inventory_tradable[x].entry]
			y_td = td[inventory_tradable[y].entry]
			x_rar = rtd[x_td.rarity]
			y_rar = rtd[y_td.rarity]

			if x_rar.index ~= y_rar.index then
				return x_rar.index < y_rar.index
			end

			if inventory_tradable[x].entry ~= inventory_tradable[y].entry then
				return inventory_tradable[y].entry < inventory_tradable[x].entry
			end

			x_quality = tweak_data.economy.qualities[inventory_tradable[x].quality]
			y_quality = tweak_data.economy.qualities[inventory_tradable[y].quality]

			if x_quality.index ~= y_quality.index then
				return y_quality.index < x_quality.index
			end

			return y < x
		end

		local function sort_func_cosmetics(x, y)
			x_td = td[x.id]
			x_rar = rtd[x_td.rarity or "common"]
			y_td = td[y.id]
			y_rar = rtd[y_td.rarity or "common"]

			if x_rar.index ~= y_rar.index then
				return y_rar.index < x_rar.index
			end

			return y.id < x.id
		end

		table.sort(cosmetic_instances, sort_func_instances)

		for _, instance_id in ipairs(cosmetic_instances) do
			weapon_skin_id = inventory_tradable[instance_id].entry
			all_cosmetics[weapon_skin_id] = nil
		end

		local all_cosmetics_sorted = {}

		for id, data in pairs(all_cosmetics) do
			if not data.is_a_color_skin then
				table.insert(all_cosmetics_sorted, {
					id = id,
					data = data
				})
			end
		end

		table.sort(all_cosmetics_sorted, sort_func_cosmetics)
		table.insert(new_node_data, {
			name = "weapon_cosmetics",
			on_create_func_name = "populate_weapon_cosmetics",
			name_localized = managers.localization:text("bm_menu_weapon_cosmetics"),
			category = data.category,
			prev_node_data = data,
			on_create_data = {
				instances = cosmetic_instances,
				cosmetics = all_cosmetics_sorted
			},
			override_slots = WEAPON_MODS_SLOTS,
			identifier = BlackMarketGui.identifiers.weapon_cosmetic
		})
	end

	local mods = {}

	for i, d in pairs(dropable_mods) do
		mods[i] = d
	end

	local sort_mods = {}

	for id, _ in pairs(mods) do
		table.insert(sort_mods, id)
	end

	table.sort(sort_mods, function (x, y)
		return x < y
	end)

	for i, id in ipairs(sort_mods) do
		local my_mods = deep_clone(mods[id])
		local crafted = managers.blackmarket:get_crafted_category(data.category)[data.slot]
		local factory_id = crafted.factory_id
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
		local default_mod = nil
		local ids_id = Idstring(id)
		
		local fake_id = nil
		
		if has_type_override and has_type_override[id] then
			fake_id = weapon_tweak[ weapon_id ].override_mod_type_name[id]
		end

		for i, d_mod in ipairs(default_blueprint) do
			if Idstring(tweak_data.weapon.factory.parts[d_mod].type) == ids_id then
				default_mod = d_mod

				break
			end
		end

		local sort_td = tweak_data.blackmarket.weapon_mods
		local x_td, y_td, x_pc, y_pc = nil

		table.sort(my_mods, function (x, y)
			x_td = sort_td[x[1]]
			y_td = sort_td[y[1]]
			x_pc = x_td.value or x_td.pc or x_td.pcs and x_td.pcs[1] or 10
			y_pc = y_td.value or y_td.pc or y_td.pcs and y_td.pcs[1] or 10
			x_pc = x_pc + (x[2] and tweak_data.lootdrop.global_values[x[2]].sort_number or 0)
			y_pc = y_pc + (y[2] and tweak_data.lootdrop.global_values[y[2]].sort_number or 0)
			x_pc = x_pc + (x_td.sort_number or 0)
			y_pc = y_pc + (y_td.sort_number or 0)

			return x_pc < y_pc or x_pc == y_pc and x[1] < y[1]
		end)

		local mod_data = {}

		for a = 1, #my_mods do
			table.insert(mod_data, {
				my_mods[a][1],
				false,
				my_mods[a][2]
			})
		end

		mod_data.default_mod = default_mod
		
		if fake_id then
			table.insert(new_node_data, {
				on_create_func_name = "populate_mods",
				name = id,
				category = data.category,
				prev_node_data = data,
				name_localized = managers.localization:text("bm_menu_" .. fake_id),
				on_create_data = mod_data,
				override_slots = WEAPON_MODS_SLOTS,
				identifier = BlackMarketGui.identifiers.weapon_mod
			})
		else
			table.insert(new_node_data, {
				on_create_func_name = "populate_mods",
				name = id,
				category = data.category,
				prev_node_data = data,
				name_localized = managers.localization:text("bm_menu_" .. id),
				on_create_data = mod_data,
				override_slots = WEAPON_MODS_SLOTS,
				identifier = BlackMarketGui.identifiers.weapon_mod
			})
		end
	end

	new_node_data.topic_id = "bm_menu_blackmarket_title"
	new_node_data.topic_params = {
		item = data.name_localized
	}
	new_node_data.selected_tab = data.selected_tab
	new_node_data.prev_node_data = data
	new_node_data.show_tabs = true
	new_node_data.panel_grid_h_mul = WEAPON_MODS_GRID_H_MUL
	new_node_data.panel_grid_top_padding = 1 - new_node_data.panel_grid_h_mul
	new_node_data.skip_blur = true
	new_node_data.use_bgs = true

	if type(new_node_data.selected_tab) == "string" then
		for i, data in ipairs(new_node_data) do
			if data.name == new_node_data.selected_tab then
				new_node_data.selected_tab = i

				break
			end
		end
	end

	new_node_data.open_callback_name = "set_equipped_comparision"
	new_node_data.open_callback_params = {
		category = data.category,
		slot = data.slot
	}
	new_node_data.blur_fade = self._data and self._data.blur_fade
	local open_node = data.open_node or self._inception_node_name or "blackmarket_node"

	self:_start_crafting_weapon(data, new_node_data)
end

function BlackMarketGui:_get_melee_weapon_stats(name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local stats_data = managers.blackmarket:get_melee_weapon_stats(name)
	local multiple_of = {}
	local has_non_special = managers.player:has_category_upgrade("player", "non_special_melee_multiplier")
	local has_special = managers.player:has_category_upgrade("player", "melee_damage_multiplier")
	local non_special = managers.player:upgrade_value("player", "non_special_melee_multiplier", 1) - 1
	local special = managers.player:upgrade_value("player", "melee_damage_multiplier", 1) - 1

	for i, stat in ipairs(self._mweapon_stats_shown) do
		local skip_rounding = stat.num_decimals
		base_stats[stat.name] = {
			value = 0,
			max_value = 0,
			min_value = 0
		}
		mods_stats[stat.name] = {
			value = 0,
			max_value = 0,
			min_value = 0
		}
		skill_stats[stat.name] = {
			value = 0,
			max_value = 0,
			min_value = 0
		}

		if stat.name == "damage" then
			local base_min = stats_data.min_damage * tweak_data.gui.stats_present_multiplier
			local base_max = stats_data.max_damage * tweak_data.gui.stats_present_multiplier
			local dmg_mul = managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[name].stats.weapon_type) .. "_damage_multiplier", 1)
			local skill_mul = dmg_mul * ((has_non_special and has_special and math.max(non_special, special) or 0) + 1) - 1
			local skill_min = skill_mul
			local skill_max = skill_mul
			base_stats[stat.name] = {
				min_value = base_min,
				max_value = base_max,
				value = (base_min + base_max) / 2
			}
			skill_stats[stat.name] = {
				min_value = skill_min,
				max_value = skill_max,
				value = (skill_min + skill_max) / 2,
				skill_in_effect = skill_min > 0 or skill_max > 0
			}
		elseif stat.name == "damage_effect" then
			local base_min = stats_data.min_damage_effect
			local base_max = stats_data.max_damage_effect
			base_stats[stat.name] = {
				min_value = base_min,
				max_value = base_max,
				value = (base_min + base_max) / 2
			}
			local dmg_mul = managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[name].stats.weapon_type) .. "_damage_multiplier", 1) - 1
			local gst_skill = managers.player:upgrade_value("player", "melee_knockdown_mul", 1) - 1
			local skill_mul = (1 + dmg_mul) * (1 + gst_skill) - 1
			local skill_min = skill_mul
			local skill_max = skill_mul
			skill_stats[stat.name] = {
				skill_min = skill_min,
				skill_max = skill_max,
				min_value = skill_min,
				max_value = skill_max,
				value = (skill_min + skill_max) / 2,
				skill_in_effect = skill_min > 0 or skill_max > 0
			}
		elseif stat.name == "charge_time" then
			local base = stats_data.charge_time
			local ignore_charge_speed = tweak_data.blackmarket.melee_weapons[name].ignore_charge_speed
			local skill = ignore_charge_speed and 0 or managers.player:upgrade_value("player", "melee_swing_multiplier", 1) - 1
			base_stats[stat.name] = {
				value = base,
				min_value = base,
				max_value = base
			}
			skill_stats[stat.name] = {
				min_value = -skill,
				max_value = -skill,
				value = -skill,
				skill_in_effect = base > 0 and skill > 0
			}
		elseif stat.name == "attack_speed" then
			local base = tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].repeat_expire_t and tweak_data.blackmarket.melee_weapons[name].repeat_expire_t / (tweak_data.blackmarket.melee_weapons[name].anim_speed_mult or 1)
			base = base / (tweak_data.blackmarket.melee_weapons[name].stats.speed_mult or 1)
			local skill = managers.player:upgrade_value("player", "melee_swing_multiplier", 1) - 1
			base_stats[stat.name] = {
				value = base,
				min_value = base,
				max_value = base
			}
			skill_stats[stat.name] = {
				min_value = -skill,
				max_value = -skill,
				value = -skill,
				skill_in_effect = base > 0 and skill > 0
			}
		elseif stat.name == "impact_delay" then
			local base = (tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].melee_damage_delay and tweak_data.blackmarket.melee_weapons[name].melee_damage_delay / (tweak_data.blackmarket.melee_weapons[name].anim_speed_mult or 1)) or 0
			base = base / (tweak_data.blackmarket.melee_weapons[name].stats.speed_mult or 1)
			local skill = managers.player:upgrade_value("player", "melee_swing_multiplier", 1) - 1
			base_stats[stat.name] = {
				value = base,
				min_value = base,
				max_value = base
			}
			skill_stats[stat.name] = {
				min_value = -skill,
				max_value = -skill,
				value = -skill,
				skill_in_effect = base > 0 and skill > 0
			}
		elseif stat.name == "cleave" then
			local base = (tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].stats.cleave) or 1
			base_stats[stat.name] = {
				min_value = base,
				max_value = base,
				value = base
			}
		elseif stat.name == "range" then
			local base_min = stats_data.range
			local base_max = stats_data.range
			base_stats[stat.name] = {
				min_value = base_min,
				max_value = base_max,
				value = (base_min + base_max) / 2
			}
		elseif stat.name == "concealment" then
			local base = managers.blackmarket:_calculate_melee_weapon_concealment(name)
			local skill = managers.blackmarket:concealment_modifier("melee_weapons")
			base_stats[stat.name] = {
				min_value = base,
				max_value = base,
				value = base
			}
			skill_stats[stat.name] = {
				min_value = skill,
				max_value = skill,
				value = skill,
				skill_in_effect = skill > 0
			}
		end

		if stat.multiple_of then
			table.insert(multiple_of, {
				stat.name,
				stat.multiple_of
			})
		end

		base_stats[stat.name].real_value = base_stats[stat.name].value
		mods_stats[stat.name].real_value = mods_stats[stat.name].value
		skill_stats[stat.name].real_value = skill_stats[stat.name].value
		base_stats[stat.name].real_min_value = base_stats[stat.name].min_value
		mods_stats[stat.name].real_min_value = mods_stats[stat.name].min_value
		skill_stats[stat.name].real_min_value = skill_stats[stat.name].min_value
		base_stats[stat.name].real_max_value = base_stats[stat.name].max_value
		mods_stats[stat.name].real_max_value = mods_stats[stat.name].max_value
		skill_stats[stat.name].real_max_value = skill_stats[stat.name].max_value
	end

	for i, data in ipairs(multiple_of) do
		local multiplier = data[1]
		local stat = data[2]
		base_stats[multiplier].min_value = base_stats[stat].real_min_value * base_stats[multiplier].real_min_value
		base_stats[multiplier].max_value = base_stats[stat].real_max_value * base_stats[multiplier].real_max_value
		base_stats[multiplier].value = (base_stats[multiplier].min_value + base_stats[multiplier].max_value) / 2
	end

	for i, stat in ipairs(self._mweapon_stats_shown) do
		if not stat.index then
			if skill_stats[stat.name].value and base_stats[stat.name].value then
				skill_stats[stat.name].value = base_stats[stat.name].value * skill_stats[stat.name].value
				base_stats[stat.name].value = base_stats[stat.name].value
			end

			if skill_stats[stat.name].min_value and base_stats[stat.name].min_value then
				skill_stats[stat.name].min_value = base_stats[stat.name].min_value * skill_stats[stat.name].min_value
				base_stats[stat.name].min_value = base_stats[stat.name].min_value
			end

			if skill_stats[stat.name].max_value and base_stats[stat.name].max_value then
				skill_stats[stat.name].max_value = base_stats[stat.name].max_value * skill_stats[stat.name].max_value
				base_stats[stat.name].max_value = base_stats[stat.name].max_value
			end
		end
	end

	return base_stats, mods_stats, skill_stats
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
			local base = managers.player:body_armor_value("regen_delay", upgrade_level, 0)
			base_stats[stat.name] = {value = base}
			if managers.player:has_category_upgrade("player", "armor_grinding") then
				skill_stats[stat.name] = {value = tweak_data.upgrades.values.player.armor_grinding[1][upgrade_level][2] - base}
			else
				skill_stats[stat.name] = {value = base * managers.player:body_armor_regen_multiplier(false, 0) - base}
			end
		elseif stat.name == "damage_shake" then
			local base = 10--tweak_data.gui.armor_damage_shake_base
			local mod = math.max(managers.player:body_armor_value("damage_shake", upgrade_level, nil, 1), 0.01)
			local skill = math.max(managers.player:upgrade_value("player", "damage_shake_multiplier", 1), 0.01)
			local base_value = base
			local mod_value = base * mod - base_value
			local skill_value = ((base * mod) / skill - base_value) - mod_value + managers.player:upgrade_value("player", "damage_shake_addend", 0)
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
		skill_stats.armor.value = skill_stats.armor.value - converted_armor
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
					name = "regen_time",
					inverted = true
				}
			}

			--Insert swap speed into weapon stats table.
			--Also make reload not use table.insert because that's stupid.
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
					inverted = true,
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

			Also add the following to the end off local BTNS
			,
			bm_modshop = {
				prio = 5,
				btn = "BTN_START",
				pc_btn = "menu_respec_tree_all",
				name = "bm_menu_btn_buy_mod",
				callback = callback(self, self, "modshop_purchase_mask_callback")
			},
			mp_modshop = {
				prio = 5,
				btn = "BTN_START",
				pc_btn = "menu_respec_tree_all",
				name = "bm_menu_btn_buy_mod",
				callback = callback(self, self, "modshop_purchase_mask_part_callback")
			}
]]
-- Or just add the name = "deflection" to the table somewhere if you don't care much for a logical layout.

function BlackMarketGui:_setup(is_start_page, component_data)
	if self.rip_can_rename_page and self:rip_can_rename_page(component_data) then
		for i, name in pairs(self.rip_page_names) do
			if component_data[i] then
				name = name == '' and managers.localization:to_upper_text('bm_menu_page', {page = tostring(i)}) or utf8.to_upper(name)
				component_data[i].name_localized = name
			end
		end
	end
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
		local info_box_size = self._panel:h() + 16
		local info_box_w = math.floor(self._panel:w() * (1 - WIDTH_MULTIPLIER) - BOX_GAP)
		local info_box_h = grid_panel_h + 75
		
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
			local h = self._extra_options_panel:h() + 88
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
				info_box_top = info_box_top + h + 75
				info_box_h = info_box_h - h - 75
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
			hnd_equip = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_equip_gloves",
				callback = callback(self, self, "equip_gloves_callback")
			},
			hnd_customize = {
                btn = "BTN_Y",
                name = "bm_menu_btn_customize_gloves",
                prio = 2,
                pc_btn = "menu_modify_item",
                callback = callback(self, self, "customize_glove_callback")
            },
            hnd_mod_equip = {
                btn = "BTN_A",
                prio = 1,
                name = "bm_menu_btn_equip_suit_variation",
                callback = callback(self, self, "equip_glove_variation_callback")
            },
            hnd_mod_preview = {
                btn = "BTN_STICK_R",
                name = "bm_menu_btn_preview_suit_variation",
                prio = 2,
                pc_btn = "menu_preview_item",
                callback = callback(self, self, "preview_glove_variation_callback")
            },
			hnd_preview = {
				btn = "BTN_STICK_R",
				name = "bm_menu_btn_preview_gloves",
				prio = 3,
				pc_btn = "menu_preview_item",
				callback = callback(self, self, "preview_gloves_callback")
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
			mp_choose_first = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_choose_color_a",
				callback = callback(self, self, "choose_mask_color_a_callback")
			},
			mp_choose_second = {
				btn = "BTN_A",
				prio = 1,
				name = "bm_menu_btn_choose_color_b",
				callback = callback(self, self, "choose_mask_color_b_callback")
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
			lo_d_sentry_ap_rounds = {
				btn = "BTN_Y",
				name = "bm_menu_btn_sentry_ap_rounds",
				prio = 3,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "set_sentry_ap_rounds_callback")
			},
			lo_d_sentry_default_rounds = {
				btn = "BTN_Y",
				name = "bm_menu_btn_sentry_default_rounds",
				prio = 3,
				pc_btn = "menu_modify_item",
				callback = callback(self, self, "set_sentry_default_rounds_callback")
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
			},
			bm_modshop = {
				prio = 5,
				btn = "BTN_START",
				pc_btn = "menu_respec_tree_all",
				name = "bm_menu_btn_buy_mod",
				callback = callback(self, self, "modshop_purchase_mask_callback")
			},
			mp_modshop = {
				prio = 5,
				btn = "BTN_START",
				pc_btn = "menu_respec_tree_all",
				name = "bm_menu_btn_buy_mod",
				callback = callback(self, self, "modshop_purchase_mask_part_callback")
			}
		}

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
		self._info_box_panel_y = info_box_panel:y() - 75
		self._weapon_info_panel = self._panel:panel({
			x = info_box_panel:x(),
			y = info_box_panel:y(),
			w = info_box_panel:w()
		})
		self._detection_panel = self._panel:panel({
			name = "suspicion_panel",
			h = 64 * 0.8,
			layer = 1,
			x = info_box_panel:x(),
			y = info_box_panel:y() + 250,
			w = info_box_panel:w() * 1
		})
		self._btn_panel = self._panel:panel({
			name = "btn_panel",
			h = 136 ,
			x = info_box_panel:x(),
			w = info_box_panel:w() * 1
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

			if alive(self._extra_options_panel) then
				BlackMarketGui.blur_panel(self._extra_options_panel)
			end
		end

		if (self._data.search_box_callback_name or self._data.search_box_disconnect_callback_name) and managers.menu:is_pc_controller() then
			self._searchbox = SearchBoxGuiObject:new(self._panel, self._ws, self._saved_search)

			self._searchbox.panel:set_right(self._box_panel:right())
			self._searchbox.panel:set_top(self._box_panel:bottom() + 5)
			self._searchbox:register_list({})

			if self._data.search_box_callback_name then
				self._searchbox:register_callback(callback(self, self, self._data.search_box_callback_name))
			end

			if self._data.search_box_disconnect_callback_name then
				self._searchbox:register_disconnect_callback(callback(self, self, self._data.search_box_disconnect_callback_name))
			end
		end

		local scale = 0.55
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
			font_size = medium_font_size * 0.75,
			font = medium_font,
			color = tweak_data.screen_colors.text
		})

		detection_value:set_x(detection_ring_left_bg:x() + detection_ring_left_bg:w() / 1.8 - medium_font_size / 2 + 2)
		detection_value:set_y(detection_ring_left_bg:y() + detection_ring_left_bg:h() / 1.8 - medium_font_size / 2 + 2)

		local detection_text = self._detection_panel:text({
			blend_mode = "add",
			name = "detection_text",
			layer = 1,
			font_size = small_font_size * 0.9,
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
			--Insert swap speed into weapon stats table.
			--Also make reload not use table.insert because that's stupid.
			self._stats_shown = {
				{
					round_value = true,
					name = "magazine",
					stat_name = "extra_ammo"
				},
				{
					inverted = true,
					name = "reload",
					append = "s"
				},
				{
					round_value = true,
					name = "totalammo",
					stat_name = "total_ammo_mod"
				},
				{
					name = "pickup"
				},
				{
					round_value = true,
					name = "fire_rate"
				},
				{
					name = "damage"
				},
				{
					round = true,
					append = "m",
					name = "standing_range" --falloff start
				},
				{
					name = "damage_min"
				},
				{
					round = true,
					append = "m",
					name = "moving_range" --falloff end
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
					inverted = true,
					name = "swap_speed",
					append = "s"
				},
				{
					round_value = true,
					inverted = true,
					name = "ads_speed",
					append = "ms"
				}
			}

			self._stats_panel = self._weapon_info_panel:panel({
				y = 52,
				x = 10,
				layer = 1,
				w = self._weapon_info_panel:w() - 20,
				h = self._weapon_info_panel:h() - 48
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
					size = 250,
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
			local scale_chart = 0.75 -- STAT CHART SCALING
			for i, stat in ipairs(self._stats_shown) do
				panel = self._rweapon_stats_panel:panel({
					name = "weapon_stats",
					h = 20 * scale_chart,
					x = 0,
					layer = 1,
					y = y + 1 * scale_chart,
					w = self._rweapon_stats_panel:w()
				})

				if math.mod(i, 2) == 0 and not panel:child(tostring(i)) then
					panel:rect({
						name = tostring(i),
						color = Color.black:with_alpha(0.3),
						h = h + 2 * scale_chart
					})
				end

				x = 2
				y = y + 20 * scale_chart
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
						font_size = (column.font_size or small_font_size) * scale_chart,
						font = column.font or small_font,
						align = column.align,
						alpha = column.alpha,
						blend_mode = column.blend,
						color = column.color or tweak_data.screen_colors.text,
						y = panel:h() - (column.font_size or small_font_size) * scale_chart
					})
					x = x + column.size + (column.offset or 0)

					if column.name == "total" then
						text_panel:set_x(190)
					end
				end
			end

			self._armor_stats_shown = {
				{
					name = "health"
				},
				{
					name = "armor"
				},
				{
					name = "regen_time",
					inverted = true,
					append = "s"
				},
				{
					name = "deflection"
				},
				{
					name = "damage_shake",
					inverted = true
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
					range = true,
					name = "cleave",
				},
				{
					inverse = true,
					name = "attack_speed",
					num_decimals = 2,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{
					inverse = true,
					name = "charge_time",
					num_decimals = 2,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{
					inverse = true,
					name = "impact_delay",
					num_decimals = 2,
					suffix = managers.localization:text("menu_seconds_suffix_short")
				},
				{
					name = "range",
					num_decimals = 2,
					suffix = "m"
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
			h = top_padding,
		})

		self._steam_inventory_extra_panel:set_width(info_box_panel:width())
		self._steam_inventory_extra_panel:set_top(info_box_panel:bottom() - 70)
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

function BlackMarketGui:show_btns(slot)
	local data = slot._data
	local btn_show_funcs = data.btn_show_funcs or {} 

	for _, btn in pairs(self._btns) do
		btn:hide()
	end

	local btns = {}
	local btn_show_func_name, btn_show_func = nil

	for i, btn in ipairs(data.buttons or data) do
		btn_show_func_name = btn_show_funcs[btn]
		btn_show_func = btn_show_func_name and callback(self, self, btn_show_func_name)

		if self._btns[btn] and (not btn_show_func or btn_show_func(data)) then
			self._btns[btn]:show()
			table.insert(btns, self._btns[btn])
		end
	end

	if not managers.menu:is_pc_controller() then
		local back_btn = self._btns.back_btn

		if back_btn then
			back_btn:show()
			table.insert(btns, back_btn)
		end
	end

	self._button_count = #btns

	table.sort(btns, function (x, y)
		return x._data.prio < y._data.prio
	end)

	self._controllers_mapping = {}
	self._controllers_pc_mapping = {}

	for i, btn in ipairs(btns) do
		if (not managers.menu:is_pc_controller() or managers.menu:is_steam_controller()) and not btn._data.no_btn then
			btn:set_text_btn_prefix(btn._data.btn)
		end

		if btn._data.pc_btn then
			self._controllers_pc_mapping[Idstring(btn._data.pc_btn):key()] = btn
		end

		self._controllers_mapping[btn._data.btn:key()] = btn

		if btn._data.name == "bm_menu_btn_sell" or btn._data.name == "bm_menu_btn_buy_selected_weapon" then
			data.btn_text_params = {
				price = managers.experience:cash_string(data.price)
			}
		end

		btn:set_text_params(data.btn_text_params)
		btn:set_order(i)
	end

	local num_btns = #btns
	local h = self._real_small_font_size or small_font_size
	local info_box_panel = self._panel:child("info_box_panel")

	if self._info_panel then
		self._info_panel:set_size(info_box_panel:w() - 20, self._info_panel:num_children() / 2 * h)
		self._info_panel:set_rightbottom(self._panel:w() - 10, self._btn_panel:top() - 10)
	end

	if managers.menu:is_pc_controller() and #btns > 0 then
		slot:set_btn_text(btns[1]:btn_text())
	else
		slot:set_btn_text("")
	end

	self._visible_btns = btns

	self:_update_borders()
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
			local append = stat.append or ""

			self._stats_texts[stat.name].equip:set_alpha(1)
			self._stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value) .. append)
			self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value) .. append)
			self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value) .. append)
			self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) .. append or "")
			self._stats_texts[stat.name].total:set_text("")
			self._stats_texts[stat.name].base:set_alpha(0.75)
			self._stats_texts[stat.name].mods:set_alpha(0.75)
			self._stats_texts[stat.name].skill:set_alpha(0.75)
			
			--Temporaryish until I can figure out how remove_stats is set up.
			if base_stats[stat.name].value == -1 then
				self._stats_texts[stat.name].equip:set_text("")
				self._stats_texts[stat.name].base:set_text("")
				self._stats_texts[stat.name].mods:set_text("")
				self._stats_texts[stat.name].skill:set_text("")
			end

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
				local append = stat.append or ""

				self._stats_texts[stat.name].equip:set_alpha(1)
				self._stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value) .. append)
				self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value) .. append)
				self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value) .. append)
				self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value)  .. append or "")
				self._stats_texts[stat.name].total:set_text("")
				self._stats_texts[stat.name].removed:set_text("")
				self._stats_texts[stat.name].base:set_alpha(0.75)
				self._stats_texts[stat.name].mods:set_alpha(0.75)
				self._stats_texts[stat.name].skill:set_alpha(0.75)

				--Temporaryish until I can figure out how remove_stats is set up.
				if base_stats[stat.name].value == -1 then
					self._stats_texts[stat.name].equip:set_text("")
					self._stats_texts[stat.name].base:set_text("")
					self._stats_texts[stat.name].mods:set_text("")
					self._stats_texts[stat.name].skill:set_text("")
				end

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
				local append = stat.append or ""

				self._stats_texts[stat.name].equip:set_alpha(0.75)
				self._stats_texts[stat.name].equip:set_text(format_round(equip, stat.round_value) .. append)
				self._stats_texts[stat.name].base:set_text("")
				self._stats_texts[stat.name].mods:set_text("")
				self._stats_texts[stat.name].skill:set_text("")
				self._stats_texts[stat.name].removed:set_text("")
				self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value) .. append)

				--Temporaryish until I can figure out how remove_stats is set up.
				if base_stats[stat.name].value == -1 then
					self._stats_texts[stat.name].equip:set_text("")
					self._stats_texts[stat.name].total:set_text("")
				end

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
			local append = stat.append or ""

			if self._slot_data.name == equipped_slot then
				local base = base_stats[stat.name].value

				self._armor_stats_texts[stat.name].equip:set_alpha(1)
				self._armor_stats_texts[stat.name].equip:set_text(format_round(value, stat.round_value) .. append)
				self._armor_stats_texts[stat.name].base:set_text(format_round(base, stat.round_value) .. append)
				self._armor_stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) .. append or "")
				self._armor_stats_texts[stat.name].total:set_text("")
				self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)

				--Allow armor stats with "inverted" flag to have inverted green/red colors.
				if value ~= 0 and base < value then
					self._armor_stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				elseif value ~= 0 and value < base then
					self._armor_stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
				else
					self._armor_stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end

				self._armor_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			else
				local equip = math.max(equip_base_stats[stat.name].value + equip_mods_stats[stat.name].value + equip_skill_stats[stat.name].value, 0)

				self._armor_stats_texts[stat.name].equip:set_alpha(0.75)
				self._armor_stats_texts[stat.name].equip:set_text(format_round(equip, stat.round_value) .. append)
				self._armor_stats_texts[stat.name].base:set_text("")
				self._armor_stats_texts[stat.name].skill:set_text("")
				self._armor_stats_texts[stat.name].total:set_text(format_round(value, stat.round_value) .. append)

				--Allow armor stats with "inverted" flag to have inverted green/red colors.
				if equip < value then
					self._armor_stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				elseif value < equip then
					self._armor_stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
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

			if stat.name == "range" then
				value = value / 100
			end
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
				if stat.name == "range" then
					base = base / 100
					skill = skill / 100
				end
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = value and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(value, stat.round_value)) or format_round(value, stat.round_value)
				local base_text = base and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(base, stat.round_value)) or format_round(base, stat.round_value)
				local skill_text = skill_stats[stat.name].value and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(skill_stats[stat.name].value, stat.round_value)) or format_round(skill_stats[stat.name].value, stat.round_value)
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
				if stat.name == "range" then
					equip = equip / 100
				end
				local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
				local equip_text = equip and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(equip, stat.round_value)) or format_round(equip, stat.round_value)
				local total_text = value and ((stat.name == "range" or stat.name == "charge_time" or stat.name == "attack_speed" or stat.name == "impact_delay") and format_round_3(value, stat.round_value)) or format_round(value, stat.round_value)
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

		--Minimal but hacky way to add custom stats to weapon mod stat changes.
		--Checks if the weapon stats with the mod (and no skills) change, and if they do, displays the difference.
		--Would write a better solution, but I hate this file.
		for name, data in pairs(unaltered_total_mods_stats) do
			if name == "damage" or name == "damage_min" then
				if format_round(unaltered_total_mods_stats[name].value) ~= format_round(total_mods_stats[name].value) then
					mod_stats.chosen[name] = (total_base_stats[name].value + (total_mods_stats[name].value + total_skill_stats[name].value))
					- (unaltered_total_base_stats[name].value + (unaltered_total_mods_stats[name].value + unaltered_total_skill_stats[name].value))
				end
			else
				if format_round(unaltered_total_mods_stats[name].value) ~= format_round(total_mods_stats[name].value) then
					mod_stats.chosen[name] = (total_base_stats[name].value + total_mods_stats[name].value)
					- (unaltered_total_base_stats[name].value + unaltered_total_mods_stats[name].value)
				end
			end
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
			local append = stat.append or ""

			self._stats_texts[stat.name].base:set_text(equip_text)
			self._stats_texts[stat.name].base:set_alpha(0.75)
			self._stats_texts[stat.name].equip:set_alpha(1)
			self._stats_texts[stat.name].equip:set_text(format_round(total_value, stat.round_value) .. append)
			self._stats_texts[stat.name].skill:set_alpha(1)
			self._stats_texts[stat.name].skill:set_text(value == 0 and "" or (value > 0 and "+" or "") .. format_round(value, stat.round_value) .. append)

			--Temporaryish until I can figure out how remove_stats is set up.
			if total_base_stats[stat.name].value == -1 then
				self._stats_texts[stat.name].equip:set_text("")
				self._stats_texts[stat.name].skill:set_text("")
			end

			if remove_stats[stat.name] and remove_stats[stat.name] ~= 0 then
				local stat_str = remove_stats[stat.name] == 0 and "" or (remove_stats[stat.name] > 0 and "+" or "") .. format_round(remove_stats[stat.name], stat.round_value)

				self._stats_texts[stat.name].removed:set_text("(" .. tostring(stat_str) .. ")")
			else
				self._stats_texts[stat.name].removed:set_text("")
			end

			equip = equip + math.round(remove_stats[stat.name] or 0)

			if (unaltered_total_value) < (total_value) then
				self._stats_texts[stat.name].skill:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
				self._stats_texts[stat.name].equip:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
			elseif (total_value) < (unaltered_total_value) then
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
	local desc_macros = {
        BTN_FIRE = managers.localization:btn_macro("primary_attack", true),
        BTN_AIM = restoration.Options:GetValue("OTHER/WeaponHandling/SeparateBowADS") and managers.localization:btn_macro("reload", true) or managers.localization:btn_macro("secondary_attack", true),
        BTN_GADGET = managers.localization:btn_macro("weapon_gadget", true),
        BTN_BIPOD = managers.localization:btn_macro("deploy_bipod", true)
    }


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
			local weapon_id = slot_data.name
			local weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]

			updated_texts[1].text = slot_data.name_localized

			if slot_data.name_color then
				updated_texts[1].text = "##" .. updated_texts[1].text .. "##"
				updated_texts[1].resource_color = {
					slot_data.name_color
				}
			end

			local resource_color = {}
			updated_texts[2].ignore_scale = true
			updated_texts[2].resource_color = resource_color

			local weapon_category = nil
			local is_akimbo = false
			local firemode_string = ""
			local add_burst, add_auto, burst_to_auto, auto_to_burst, lock_burst, lock_auto, lock_semi, lock_firemode, add_firemode, swap_firemode, firemode_modded = nil

			local crafted = managers.blackmarket:get_crafted_category_slot(slot_data.category, slot_data.slot)
			local custom_stats = crafted and managers.weapon_factory:get_custom_stats_from_weapon(crafted.factory_id, crafted.blueprint)
			if custom_stats then
				for part_id, stats in pairs(custom_stats) do
					if stats.lock_burst then
						lock_burst = true
						lock_firemode = true
						firemode_modded = true
						break
					elseif stats.lock_auto then
						lock_auto = true
						lock_firemode = true
						firemode_modded = true
						break
					elseif stats.lock_semi then
						lock_semi = true
						lock_firemode = true
						firemode_modded = true
						break
					elseif stats.burst_to_auto then
						burst_to_auto = true
						swap_firemode = true
						firemode_modded = true
						break
					elseif stats.auto_to_burst then
						auto_to_burst = true
						swap_firemode = true
						firemode_modded = true
						break
					elseif stats.add_auto then
						add_auto = true
						add_firemode = true
						firemode_modded = true
					elseif stats.add_burst then
						add_burst = true
						add_firemode = true
						firemode_modded = true
					end
				end
			end

			if weapon_tweak then
				if weapon_tweak.categories then
					if weapon_tweak.categories[1] == "akimbo" then
						is_akimbo = true
					end
					weapon_category = is_akimbo and weapon_tweak.categories[2] or weapon_tweak.categories[1]
				end
				if not lock_firemode then
					if weapon_tweak.FIRE_MODE == "single" then
						firemode_string = managers.localization:to_upper_text("st_menu_firemode_semi")
					elseif weapon_tweak.FIRE_MODE == "auto" then
						firemode_string = managers.localization:to_upper_text("st_menu_firemode_auto")
					end
					if weapon_tweak.CAN_TOGGLE_FIREMODE then
						if weapon_tweak.FIRE_MODE == "single" then
							firemode_string = managers.localization:to_upper_text("st_menu_firemode_semi") .. "+" .. managers.localization:to_upper_text("st_menu_firemode_auto")
						else
							firemode_string = managers.localization:to_upper_text(auto_to_burst and "st_menu_firemode_burst" or "st_menu_firemode_auto") .. "+" .. managers.localization:to_upper_text("st_menu_firemode_semi")
						end
					end
					if add_burst then
						firemode_string = firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_burst") 
					end
					if add_auto then
						firemode_string = firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_auto") 
					end
					if weapon_tweak.BURST_FIRE then
						local burst_type = nil --weapon_tweak.BURST_TYPE
						if weapon_tweak.BURST_ONLY then
							firemode_string = managers.localization:to_upper_text("st_menu_firemode_burst")
						else
							if is_akimbo or weapon_tweak.BURST_FIRE_DEFAULT then
								firemode_string = managers.localization:to_upper_text("st_menu_firemode_burst") .. (firemode_string ~= "" and "+" .. firemode_string) or ""
							elseif burst_to_auto then
								firemode_string = managers.localization:to_upper_text("st_menu_firemode_auto") .. "+" .. managers.localization:to_upper_text("st_menu_firemode_semi")
							elseif burst_type then
								if burst_type == "fan" then
									firemode_string = firemode_string and firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_burst_fanning") or managers.localization:	to_upper_text("st_menu_firemode_burst_fanning")
								elseif burst_type == "slam" then
									firemode_string = firemode_string and firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_burst_slamfire") or managers.localization:	to_upper_text("st_menu_firemode_burst_slamfire")
								elseif burst_type == "rapid" then
									firemode_string = firemode_string and firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_burst_rapidfire") or managers.localization:	to_upper_text("st_menu_firemode_burst_rapidfire")
								elseif burst_type == "autoburst" then
									firemode_string = firemode_string and firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_burst_autoburst") or managers.localization:	to_upper_text("st_menu_firemode_burst_autoburst")
								end
							else
								firemode_string = firemode_string and firemode_string .. "+" .. managers.localization:to_upper_text("st_menu_firemode_burst") or managers.localization:to_upper_text("st_menu_firemode_burst")
							end
						end
					end
					if weapon_tweak.fire_mode_data and weapon_tweak.fire_mode_data.volley then
						firemode_string = managers.localization:to_upper_text("st_menu_firemode_auto") .. "+" .. managers.localization:to_upper_text("st_menu_firemode_volley")
					end
					if weapon_tweak.FIRE_MODE == "volley" then
						if weapon_tweak.CAN_TOGGLE_FIREMODE then
							firemode_string = managers.localization:to_upper_text("st_menu_firemode_volley") .. "+" .. managers.localization:to_upper_text("st_menu_firemode_auto")
						else
							firemode_string = managers.localization:to_upper_text("st_menu_firemode_volley")
						end
					end
				elseif lock_firemode then
					firemode_string = lock_burst and managers.localization:to_upper_text("st_menu_firemode_burst") or lock_auto and managers.localization:to_upper_text("st_menu_firemode_auto") or managers.localization:to_upper_text("st_menu_firemode_semi")
				else
					firemode_string = "temp"
				end
			end

			--[[
			if price > 0 then
				updated_texts[2].text = managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " ##" .. managers.experience:cash_string(price) .. "##"

				table.insert(resource_color, slot_data.can_afford and tweak_data.screen_colors.skill_color or tweak_data.screen_colors.important_1)
			end
			--]]

			if weapon_category then
				if not managers.money:can_afford_weapon(slot_data.name) and price > 0 then
					updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text(slot_data.not_moddable and "st_menu_cost" or "st_menu_value") .. " ##" .. managers.experience:cash_string(price) .. "##"
					table.insert(resource_color, tweak_data.screen_colors.important_1)
				else
					updated_texts[2].text = updated_texts[2].text .. --((price > 0 and " | ") or "") .. 
					managers.localization:to_upper_text("st_menu_skill_use") .." ##" .. ((is_akimbo and managers.localization:to_upper_text("st_wpn_akimbo")) or "") .. managers.localization:to_upper_text("st_wpn_" .. tostring(weapon_category)) .. "## | " ..
					managers.localization:to_upper_text("st_menu_firemode") .. " ##" ..  firemode_string .. "##"

					table.insert(resource_color, tweak_data.screen_colors.skill_color)
					table.insert(resource_color, (lock_firemode and tweak_data.screen_colors.risk) or (add_firemode and tweak_data.screen_colors.stats_positive) or (firemode_modded and tweak_data.screen_colors.risk)  or tweak_data.screen_colors.skill_color)
				end
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

			updated_texts[4].resource_color = {}
			if slot_data.global_value and slot_data.global_value ~= "normal" then
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
				updated_texts[4].resource_color = {tweak_data.lootdrop.global_values[slot_data.global_value].color}
				updated_texts[4].below_stats = true
				if updated_texts[4].text == "## ##" then
					updated_texts[4].text = ""
					updated_texts[4].resource_color = {}
				end
			end
			
			local selection_index = tweak_data:get_raw_value("weapon", self._slot_data.name, "use_data", "selection_index") or 1
			local category = (selection_index == 1 and "secondaries") or (selection_index == 2 and "primaries") or "disabled"
			if category == slot_data.category then

				-- Ugly as fuck but this is the only way I can think of to fix the movement penalty text being excluded from description scaling is to just make it a part of descriptions and making a giant fuck off 'resource_color' table
				local crafted = managers.blackmarket:get_crafted_category_slot(slot_data.category, slot_data.slot)
				local custom_stats = crafted and  managers.weapon_factory:get_custom_stats_from_weapon(crafted.factory_id, crafted.blueprint)
				local upgrade_tweak = weapon_tweak and tweak_data.upgrades.weapon_movement_penalty[weapon_tweak.categories[1]] or 1
				local movement_penalty = weapon_tweak and weapon_tweak.weapon_movement_penalty or upgrade_tweak or 1
				local hs_mult = (weapon_tweak and weapon_tweak.hs_mult) or 1
				local hs_mult_desc = (weapon_tweak and weapon_tweak.hs_mult and true) or nil
				local ene_hs_mult = (weapon_tweak and weapon_tweak.ene_hs_mult) or 1
				local ap_desc = nil
				local sms = (weapon_tweak and weapon_tweak.sms) or 1
				local exp_ammo = nil
				local stat_sms = nil
				local stat_move = nil
				local stat_attachment_desc = nil
				local rays = (weapon_tweak and weapon_tweak.rays) or 1
				local description = nil
				if custom_stats then
					for part_id, stats in pairs(custom_stats) do
						if stats.sms then
							sms = sms + (1 * (stats.sms - 1))
							stat_sms = sms == 1 and true
						end
						if stats.movement_speed_add then
							movement_penalty = movement_penalty + stats.movement_speed_add
							stat_move = true
						end
						if stats.alt_desc then
							stat_attachment_desc = stats.alt_desc
						end
						if stats.ene_hs_mult_add then
							ene_hs_mult = ene_hs_mult + stats.ene_hs_mult_add
						end
						if stats.hs_mult then
							hs_mult = hs_mult * stats.hs_mult
						end
						if stats.hs_mult_desc then
							hs_mult_desc = true
						end
						if stats.rays then
							rays = stats.rays
						end
						if stats.ap_desc then
							ap_desc = stats.ap_desc
						end
						if stats.bullet_class == "InstantExplosiveBulletBase" then
							exp_ammo = true
						end
					end
				end

				if weapon_tweak and weapon_tweak.has_description then
					local has_pc_desc = managers.menu:is_pc_controller() and managers.localization:exists(tweak_data.weapon[slot_data.name].desc_id .. "_pc")
					local desc_id = stat_attachment_desc or tweak_data.weapon[slot_data.name].desc_id
					description = has_pc_desc and managers.localization:text(desc_id .. "_pc", desc_macros) or managers.localization:text(desc_id, desc_macros)
					for color_id in string.gmatch(description, "#%{(.-)%}#") do
						table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
					end
					description = description:gsub("#%{(.-)%}#", "##")
	
					if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" then
						if managers.menu:is_pc_controller() and managers.localization:exists(tweak_data.weapon[slot_data.name].desc_id .. "_pc") then
							updated_texts[4].text = updated_texts[4].text .. "\n" .. description
						else
							updated_texts[4].text = updated_texts[4].text .. "\n" .. description
						end
					else
						if managers.menu:is_pc_controller() and managers.localization:exists(tweak_data.weapon[slot_data.name].desc_id .. "_pc") then
							updated_texts[4].text = updated_texts[4].text .. description
						else
							updated_texts[4].text = updated_texts[4].text .. description
						end
					end
					updated_texts[4].below_stats = true
				end

				if weapon_tweak and weapon_tweak.alt_shotgunraycast and rays > 1 then
					local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(slot_data.name, slot_data.category, slot_data.slot, slot_data.default_blueprint)
					local base_damage = base_stats and base_stats.damage and base_stats.damage.value
					local mod_damage = (mods_stats and mods_stats.damage and mods_stats.damage.value) or 0
					local skill_damage = (skill_stats and skill_stats.damage and skill_stats.damage.value) or 0
					description = "#{risk}#" .. managers.localization:text("bm_menu_weapon_multishot_1") .. "## #{skirmish_color}#" .. tostring(rays) .. "## #{risk}#" .. managers.localization:text("bm_menu_weapon_multishot_2") .. "## #{skirmish_color}#" .. tostring( format_round_3((base_damage + mod_damage + skill_damage) / rays) ) .. "## #{risk}#" .. managers.localization:text("bm_menu_weapon_multishot_3") .. "##"
					for color_id in string.gmatch(description, "#%{(.-)%}#") do
						table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
					end
					description = description:gsub("#%{(.-)%}#", "##")
					if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description then
						description = "\n" .. description
					end
					updated_texts[4].text = updated_texts[4].text .. description
				else 
					rays = nil
				end

					if ap_desc then
						description = managers.localization:text( ap_desc )
						for color_id in string.gmatch(description, "#%{(.-)%}#") do
							table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
						end
						description = description:gsub("#%{(.-)%}#", "##")
						if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description or rays then
							updated_texts[4].text = updated_texts[4].text .. "\n" .. description
						else
							updated_texts[4].text = updated_texts[4].text .. description
						end
					end
					if hs_mult_desc and hs_mult ~= 1 then
						local penalty_as_string = string.format("%d%%", math.round((hs_mult - 1) * 100))
						if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description or ap_desc or rays then
							updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_hs_mult_1") .. penalty_as_string .. managers.localization:text("bm_menu_weapon_hs_mult_2") .. "##"
						else
							updated_texts[4].text = updated_texts[4].text .. "##" ..  managers.localization:text("bm_menu_weapon_hs_mult_1") .. penalty_as_string .. managers.localization:text("bm_menu_weapon_hs_mult_2") .. "##"
						end
						table.insert(updated_texts[4].resource_color, (hs_mult < 1 and tweak_data.screen_colors.important_1 or tweak_data.screen_colors.skill_color) )
					end
					if ene_hs_mult ~= 1 then
						local penalty_as_string = string.format("%d%%", math.round((ene_hs_mult) * 100))
						if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description or ap_desc or hs_mult_desc or rays then
							updated_texts[4].text = updated_texts[4].text .. "\n##" .. (ene_hs_mult < 1 and managers.localization:text("bm_menu_weapon_ene_hs_mult_sub") or managers.localization:text("	bm_menu_weapon_ene_hs_mult_add")) .. penalty_as_string .. managers.localization:text("bm_menu_weapon_ene_hs_mult_end") .. "##"
						else
							updated_texts[4].text = updated_texts[4].text .. "##" .. (ene_hs_mult < 1 and managers.localization:text("bm_menu_weapon_ene_hs_mult_sub") or managers.localization:text("	bm_menu_weapon_ene_hs_mult_add")) .. penalty_as_string .. managers.localization:text("bm_menu_weapon_ene_hs_mult_end") .. "##"
						end
						table.insert(updated_texts[4].resource_color, (ene_hs_mult < 1 and tweak_data.screen_colors.important_1 or tweak_data.screen_colors.skill_color) )
					end

				if exp_ammo then
					description = managers.localization:text("bm_menu_weapon_exp_no_hs_info")
					for color_id in string.gmatch(description, "#%{(.-)%}#") do
						table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
					end
					description = description:gsub("#%{(.-)%}#", "##")
					if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description or rays or ap_desc or (hs_mult_desc and hs_mult ~= 1) or ene_hs_mult ~= 1 then
						updated_texts[4].text = updated_texts[4].text .. "\n" .. description
					else
						updated_texts[4].text = updated_texts[4].text .. description
					end
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				end
				

				if movement_penalty < 1 then
					local penalty_as_string = string.format("%d%%", math.round((1 - movement_penalty) * 100))
					if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description then
						updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. managers.localization:text("bm_menu_weapon_movement_penalty_info_2") .. (sms < 1 and ";" or ".")  .. "##"
					else
						updated_texts[4].text = updated_texts[4].text .. "##" ..managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. managers.localization:text("bm_menu_weapon_movement_penalty_info_2") .. (sms < 1 and ";" or ".") .. "##"
					end
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				elseif movement_penalty > 1 then
					local penalty_as_string = string.format("%g%%", (movement_penalty - 1) * 100)
					if slot_data.global_value and slot_data.global_value ~= "normal" and updated_texts[4].text ~= "" or weapon_tweak.has_description then
						updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_movement_bonus_info") .. penalty_as_string .. managers.localization:text("bm_menu_weapon_movement_penalty_info_2") .. "##"
					else
						updated_texts[4].text = updated_texts[4].text .. "##" ..managers.localization:text("bm_menu_weapon_movement_bonus_info") .. penalty_as_string .. managers.localization:text("bm_menu_weapon_movement_penalty_info_2") .. "##"
					end
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.skill_color)
				end

				
				if sms < 1 then
					local penalty_as_string = string.format("%d%%", math.round((1 - sms) * 100))
					if slot_data.global_value and slot_data.global_value ~= "normal" or weapon_tweak.has_description then
						if movement_penalty < 1 then
							updated_texts[4].text = updated_texts[4].text .. " ##" .. managers.localization:text(stat_sms and "bm_menu_sms_info_cont_2" or "bm_menu_sms_info_cont") .. "##"
						else
							updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. managers.localization:text(stat_sms and "bm_menu_stat_sms_info_2" or "bm_menu_sms_info_2") .. "##"
						end
					else
						if movement_penalty < 1 then
							updated_texts[4].text = updated_texts[4].text .. " ##" .. managers.localization:text(stat_sms and "bm_menu_sms_info_cont_2" or "bm_menu_sms_info_cont") .. "##"
						else
							updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. managers.localization:text(stat_sms and "bm_menu_stat_sms_info_2" or "bm_menu_sms_info_2") .. "##"
						end
					end
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				end
	
	

				if slot_data.last_weapon then
					updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text("bm_menu_last_weapon_warning") .. "##"
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				end
			else
				updated_texts[4].text = updated_texts[4].text .. managers.localization:to_upper_text("bm_menu_weapon_slot_warning_1") .. ((category == "secondaries" and managers.localization:to_upper_text("bm_menu_weapon_slot_warning_secondary")) or (category == "primaries" and managers.localization:to_upper_text("bm_menu_weapon_slot_warning_primary")) or managers.localization:to_upper_text("bm_menu_weapon_slot_warning_disabled")) .. managers.localization:to_upper_text("bm_menu_weapon_slot_warning_2")
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
			end

			if self._slot_data.name == "empty" then
				updated_texts[4].text = managers.localization:to_upper_text("bm_menu_weapon_slot_search_empty", {
					search =  self._saved_search
				})
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
			end

			updated_texts[4].below_stats = true
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

		updated_texts[2].resource_color = {}
		updated_texts[2].text = ""
		updated_texts[2].below_stats = true

		local has_global_value = slot_data.global_value and slot_data.global_value ~= "normal"
		if has_global_value then
			updated_texts[2].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			if updated_texts[2].text ~= "## ##" then
				table.insert(updated_texts[2].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
			else
				has_global_value = nil
			end
		end


		local melee_tweak_data = tweak_data.blackmarket.melee_weapons[slot_data.name]
		local has_info_id = melee_tweak_data.info_id
		local has_attack_pattern = melee_tweak_data.attack_pattern

		if has_info_id or has_attack_pattern then
			local desc_text = has_info_id and managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].info_id) or ""
			if has_attack_pattern then
				desc_text = desc_text .. ((has_info_id and "\n\n") or "") .. managers.localization:text(tweak_data.blackmarket.melee_weapons[slot_data.name].attack_pattern)
			end

			for color_id in string.gmatch(desc_text, "#%{(.-)%}#") do
				table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			end
			desc_text = desc_text:gsub("#%{(.-)%}#", "##")

			updated_texts[2].text = ((has_global_value and updated_texts[2].text .. "\n") or "") .. desc_text
		end

		local factory_stats = managers.weapon_factory:get_stats(managers.blackmarket:equipped_primary().factory_id, managers.blackmarket:equipped_primary().blueprint)
		local wtd_range = tweak_data.weapon[managers.blackmarket:equipped_primary().weapon_id] and tweak_data.weapon[managers.blackmarket:equipped_primary().weapon_id].jab_range or 0
		local bayonet_damage = factory_stats.max_damage and (factory_stats.max_damage - tweak_data.blackmarket.melee_weapons.weapon.stats.max_damage) * 10
		local skill_damage = bayonet_damage and (bayonet_damage * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)) - bayonet_damage
		local damage_total = bayonet_damage and bayonet_damage + (skill_damage or 0)
		local bayonet_range = bayonet_damage and (factory_stats.bayonet_range and factory_stats.bayonet_range / 100)
		local jab_range = factory_stats.jab_range and factory_stats.jab_range / 100
		local range = (jab_range or bayonet_range or 0) + (wtd_range / 100)

		local factory_stats_secondary = managers.weapon_factory:get_stats(managers.blackmarket:equipped_secondary().factory_id, managers.blackmarket:equipped_secondary().blueprint)
		local wtd_range_secondary = tweak_data.weapon[managers.blackmarket:equipped_secondary().weapon_id] and tweak_data.weapon[managers.blackmarket:equipped_secondary().weapon_id].jab_range or 0
		local bayonet_damage_secondary = factory_stats_secondary.max_damage and (factory_stats_secondary.max_damage - tweak_data.blackmarket.melee_weapons.weapon.stats.max_damage) * 10
		local skill_damage_secondary = bayonet_damage_secondary and (bayonet_damage_secondary * managers.player:upgrade_value("player", "melee_damage_multiplier", 1)) - bayonet_damage_secondary
		local damage_total_secondary = bayonet_damage_secondary and bayonet_damage_secondary + (skill_damage_secondary or 0)
		local bayonet_range_secondary = bayonet_damage_secondary and (factory_stats_secondary.bayonet_range and factory_stats_secondary.bayonet_range / 100)
		local jab_range_secondary = factory_stats_secondary.jab_range and factory_stats_secondary.jab_range / 100
		local range_secondary = (jab_range_secondary or bayonet_range_secondary or 0) + (wtd_range_secondary / 100)

		-- [[
		if slot_data.name == "weapon" and (bayonet_damage or (range and range > 0)) then
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			updated_texts[2].text = (updated_texts[2].text ~= "" and updated_texts[2].text .. "\n\n" or "") .. 
				managers.localization:text("bm_menu_weapon_bayonet_header") .. 
				(damage_total and damage_total > 0 and managers.localization:text("bm_menu_weapon_bayonet_damage") .. tostring(damage_total) .. "##" or "") .. 
				(bayonet_damage and skill_damage and skill_damage > 0 and managers.localization:text("bm_menu_weapon_bayonet_damage_base") .. tostring(bayonet_damage) .. "##" or "") .. 
				(bayonet_damage and skill_damage and skill_damage > 0 and managers.localization:text("bm_menu_weapon_bayonet_damage_skill") .. tostring(skill_damage) .. "##" or "") .. 
				(range and range > 0 and managers.localization:text("bm_menu_weapon_bayonet_range") .. tostring(range) .. "m##" or "")

			updated_texts[2].below_stats = true
		end
		
		if slot_data.name == "weapon" and (bayonet_damage_secondary or (range_secondary and range_secondary > 0)) then
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			table.insert(updated_texts[2].resource_color, tweak_data.screen_colors[color_id])
			updated_texts[2].text = (updated_texts[2].text ~= "" and updated_texts[2].text .. "\n\n" or "") .. 
				managers.localization:text("bm_menu_weapon_bayonet_secondary_header") .. 
				(damage_total_secondary and damage_total_secondary > 0 and managers.localization:text("bm_menu_weapon_bayonet_damage") .. tostring(damage_total_secondary) .. "##" or "") .. 
				(bayonet_damage_secondary and skill_damage_secondary and skill_damage_secondary > 0 and managers.localization:text("bm_menu_weapon_bayonet_damage_base") .. tostring(bayonet_damage_secondary) .. "##" or "") .. 
				(bayonet_damage_secondary and skill_damage_secondary and skill_damage_secondary > 0 and managers.localization:text("bm_menu_weapon_bayonet_damage_skill") .. tostring(skill_damage_secondary) .. "##" or "") .. 
				(range_secondary and range_secondary > 0 and managers.localization:text("bm_menu_weapon_bayonet_range") .. tostring(range_secondary) .. "m##" or "")

			updated_texts[2].below_stats = true
		end
		--]]

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

		--updated_texts[4].resource_color = {}

		--if slot_data.global_value and slot_data.global_value ~= "normal" then
		--	updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
		--	table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		--end

		--updated_texts[4].below_stats = true
	elseif identifier == self.identifiers.grenade then
		local is_perk_throwable = tweak_data.blackmarket.projectiles[slot_data.name].base_cooldown and not tweak_data.blackmarket.projectiles[slot_data.name].base_cooldown_no_perk
		local amount = is_perk_throwable and 1 or math.round(tweak_data.blackmarket.projectiles[slot_data.name].max_amount *  managers.player:upgrade_value("player", "throwables_multiplier", 1))
		updated_texts[1].text = self._slot_data.name_localized .. " (x" .. tostring(amount) .. ")"

		if not slot_data.unlocked then
			local grenade_tweak = tweak_data.blackmarket.projectiles[slot_data.name]

			if grenade_tweak and grenade_tweak.unlock_id then
				updated_texts[3].text = managers.localization:to_upper_text(grenade_tweak.unlock_id)
			else
				local skill_based = slot_data.skill_based
				local level_based = slot_data.level and slot_data.level > 0
				local dlc_based = slot_data.dlc_based or tweak_data.lootdrop.global_values[slot_data.global_value] and tweak_data.lootdrop.global_values[slot_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(slot_data.global_value)
				local skill_text_id = skill_based and (slot_data.skill_name or "bm_menu_skilltree_locked") or false
				local level_text_id = level_based and "bm_menu_level_req" or false
				local dlc_text_id = slot_data.dlc_locked or false
				local text = ""

				if slot_data.install_lock then
					text = text .. managers.localization:to_upper_text(slot_data.install_lock, {}) .. "\n"
				elseif skill_text_id then
					text = text .. managers.localization:to_upper_text(skill_text_id, {
						slot_data.name_localized
					}) .. "\n"
				elseif level_text_id then
					text = text .. managers.localization:to_upper_text(level_text_id, {
						level = slot_data.level
					}) .. "\n"
				elseif dlc_text_id then
					text = text .. managers.localization:to_upper_text(dlc_text_id, {}) .. "\n"
				end

				updated_texts[3].text = text
			end
		end

		updated_texts[4].resource_color = {}
		local desc_text = managers.localization:text(tweak_data.blackmarket.projectiles[slot_data.name].desc_id)

		for color_id in string.gmatch(desc_text, "#%{(.-)%}#") do
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
		end
		desc_text = desc_text:gsub("#%{(.-)%}#", "##")

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
		updated_texts[4].resource_color = {}
		updated_texts[4].text = ""
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
			local description = (managers.player:has_category_upgrade("player", "kill_change_regenerate_speed") and 
								managers.localization:to_upper_text("bm_menu_armor_max_health_store_2", {health_stored = format_round(amount * multiplier * tweak_data.gui.stats_present_multiplier), regen_bonus = regen_speed})
									or
								managers.localization:to_upper_text("bm_menu_armor_max_health_store_1", {health_stored = format_round(amount * multiplier * tweak_data.gui.stats_present_multiplier)}))

			for color_id in string.gmatch(description, "#%{(.-)%}#") do
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
			end
			description = description:gsub("#%{(.-)%}#", "##")
			updated_texts[4].text = description .. "\n\n"
			updated_texts[4].below_stats = true
		elseif managers.player:has_category_upgrade("player", "armor_grinding") then --Add Anarchist per-armor skill information.
			local bm_armor_tweak = tweak_data.blackmarket.armors[slot_data.name]
			local upgrade_level = bm_armor_tweak.upgrade_level
			local passive_regen = format_round(10 * tweak_data.upgrades.values.player.armor_grinding[1][upgrade_level][1])
			local active_regen = format_round(10 * tweak_data.upgrades.values.player.damage_to_armor[1][upgrade_level][1])
			local description = (managers.player:has_category_upgrade("player", "damage_to_armor") and 
								managers.localization:to_upper_text("bm_menu_armor_grinding_2", {passive_armor_regen = passive_regen, active_armor_regen = active_regen})) or
								managers.localization:to_upper_text("bm_menu_armor_grinding_1", {passive_armor_regen = passive_regen})
			for color_id in string.gmatch(description, "#%{(.-)%}#") do
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
			end
			description = description:gsub("#%{(.-)%}#", "##")
			updated_texts[4].text = description .. "\n\n"
			updated_texts[4].below_stats = true
		end
		local bm_armor_tweak = tweak_data.blackmarket.armors[slot_data.name]
		local upgrade_level = bm_armor_tweak.upgrade_level
		local detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data({armors = slot_data.name}, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
		detection_risk = math.round(detection_risk * 100)
		local dodge_rating = 0
		local mod_dodge = managers.player:body_armor_value("dodge", upgrade_level)
		local skill_dodge = managers.player:skill_dodge_chance(false, false, false, slot_data.name, detection_risk)
		local current_diff = Global.game_settings.difficulty or "easy"
		local is_pro = Global.game_settings and Global.game_settings.one_down
		local difficulty_id = math.max(0, (tweak_data:difficulty_to_index(current_diff) or 0) - 2)
		dodge_rating = math.clamp((dodge_rating + mod_dodge + skill_dodge) * 1000, 0, 450)
		if dodge_rating and dodge_rating > 0 then
			local description = managers.localization:text("bm_menu_dodge_grace", { grace_bonus = dodge_rating .. managers.localization:text("bm_menu_append_milliseconds") } )
			local diff_desc = ""
			local diff_reduction = difficulty_id and ((((difficulty_id == 4 or difficulty_id == 5) and 0.35) or (difficulty_id == 6 and 0.25) or 0.45) - ((is_pro and 0.1) or 0)) or 0.45
			local grace_cap = (0.45 - (0.45 - diff_reduction)) * 1000 
			for color_id in string.gmatch(description, "#%{(.-)%}#") do
				table.insert(updated_texts[4].resource_color,  tweak_data.screen_colors[dodge_rating == 450 and "stat_maxed" or color_id])
			end
			if difficulty_id > 3 or is_pro then
				diff_desc = "\n" .. managers.localization:text("bm_menu_dodge_grace_cap", { grace_bonus_cap = grace_cap .. managers.localization:text("bm_menu_append_milliseconds") } ) .. 
				((is_pro and managers.localization:text("bm_menu_dodge_grace_jp_cap")) or "") ..
				((is_pro and difficulty_id > 3 and managers.localization:text("bm_menu_dodge_grace_both")) or "") .. 
				((difficulty_id > 3 and managers.localization:text("bm_menu_dodge_grace_diff_cap", { risk_level = managers.localization:text( tweak_data.difficulty_name_ids[tostring(current_diff)] ) } ) ) or "")

				for color_id in string.gmatch(diff_desc, "#%{(.-)%}#") do
					table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
				end
			end

			description = description:gsub("#%{(.-)%}#", "##") .. ((dodge_rating > (grace_cap + 0.01)) and diff_desc:gsub("#%{(.-)%}#", "##") or "")  
			updated_texts[4].text = updated_texts[4].text .. description
		end
		updated_texts[4].below_stats = true
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

		if player_style_tweak then
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
		end

		if self._slot_data.name == "empty" then
			updated_texts[4].text = managers.localization:to_upper_text("bm_menu_weapon_slot_search_empty", {
				search =  self._saved_search
			})
			updated_texts[4].resource_color = {}
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
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
	elseif identifier == self.identifiers.glove then
		local glove_id = slot_data.name
		local glove_tweak = tweak_data.blackmarket.gloves[glove_id]

		if glove_tweak then
			updated_texts[1].text = slot_data.name_localized

			if not slot_data.unlocked then
				updated_texts[2].text = "##" .. managers.localization:to_upper_text("bm_menu_item_locked") .. "##"
				updated_texts[2].resource_color = tweak_data.screen_colors.important_1
				updated_texts[3].text = slot_data.dlc_locked and managers.localization:to_upper_text(slot_data.dlc_locked) or managers.localization:to_upper_text("bm_menu_dlc_locked")
			end

			local desc_id = glove_tweak.desc_id
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
		end
		if self._slot_data.name == "empty" then
			updated_texts[4].text = updated_texts[4].text .. managers.localization:to_upper_text("bm_menu_weapon_slot_search_empty", {
				search =  self._saved_search
			})
			updated_texts[4].resource_color = {}
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
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
			elseif mask_id and achievement_tracker[mask_id] and (not slot_data.unlocked or type(slot_data.unlocked) == "number" and slot_data.unlocked <= 0) then
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
			elseif achievement_lock_id and (not slot_data.unlocked or type(slot_data.unlocked) == "number" and slot_data.unlocked <= 0) then
				local dlc_tweak = tweak_data.dlc[achievement_lock_id]
				local achievement = dlc_tweak and dlc_tweak.achievement_id
				local achievement_visual = tweak_data.achievement.visual[achievement]

				if achievement_visual then
					updated_texts[3].text = managers.localization:to_upper_text(achievement_visual.desc_id)

					if achievement_visual.progress then
						updated_texts[3].text = updated_texts[3].text .. " (" .. tostring(achievement_visual.progress.get()) .. "/" .. tostring(achievement_visual.progress.max) .. ")"
					end
				end
			elseif achievement_milestone_lock_id and (not slot_data.unlocked or type(slot_data.unlocked) == "number" and slot_data.unlocked <= 0) then
				for _, data in ipairs(tweak_data.achievement.milestones) do
					if data.id == achievement_milestone_lock_id then
						updated_texts[3].text = managers.localization:to_upper_text("bm_menu_milestone_reward_unlock", {
							NUM = tostring(data.at)
						})

						break
					end
				end
			elseif managers.dlc:is_content_skirmish_locked("masks", mask_id) and (not slot_data.unlocked or type(slot_data.unlocked) == "number" and slot_data.unlocked <= 0) then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_skirmish_content_reward")
			elseif managers.dlc:is_content_crimespree_locked("masks", mask_id) and (not slot_data.unlocked or type(slot_data.unlocked) == "number" and slot_data.unlocked <= 0) then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_crimespree_content_reward")
			end

			if mask_id and mask_id ~= "empty" then
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
		
		if self._slot_data.name == "empty" then
			updated_texts[4].text = updated_texts[4].text .. managers.localization:to_upper_text("bm_menu_weapon_slot_search_empty", {
				search =  self._saved_search
			})
			updated_texts[4].resource_color = {}
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.risk)
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
			elseif managers.dlc:is_content_crimespree_locked("weapon_mods", slot_data.name) then
				updated_texts[3].text = managers.localization:to_upper_text("bm_menu_crimespree_content_reward")
				updated_texts[3].below_stats = true
			end
		end

		local crafted = managers.blackmarket:get_crafted_category_slot(slot_data.category, slot_data.slot)
		local part_id = slot_data.name
		local part_data = part_id and tweak_data.weapon.factory.parts[part_id]
		local perks = part_data and part_data.perks
		local is_gadget = part_data and part_data.type == "gadget" or perks and table.contains(perks, "gadget")
		local is_second_sight = part_data and part_data.sub_type == "second_sight" or perks and table.contains(perks, "second_sight")
		local is_ammo = part_data and part_data.type == "ammo" or perks and table.contains(perks, "ammo")
		local is_bayonet = part_data and part_data.type == "bayonet" or perks and table.contains(perks, "bayonet")
		local is_bipod = part_data and part_data.type == "bipod" or perks and table.contains(perks, "bipod")
		local has_desc = part_data and part_data.has_description == true
		local has_move_speed = part_data and part_data.custom_stats and part_data.custom_stats.movement_speed_add
		local has_sms = part_data and part_data.custom_stats and part_data.custom_stats.sms
		local override_sms = has_sms and crafted and managers.weapon_factory:_part_data(slot_data.name, crafted.factory_id)
		if override_sms then
			if override_sms.custom_stats and override_sms.custom_stats.sms then
				has_sms = override_sms.custom_stats.sms
			elseif (not override_sms.custom_stats) or (override_sms.custom_stats and not override_sms.custom_stats.sms) then
				has_sms = false
			end
		end
		local has_second_sight = nil

		if crafted then
			for _, id in ipairs(managers.weapon_factory:get_assembled_blueprint(crafted.factory_id, crafted.blueprint)) do
				local part = managers.weapon_factory:_part_data(id, crafted.factory_id)
				if part and ( part.has_second_sight or part.sub_type == "second_sight" or ( part.perks and table.contains(part.perks, "second_sight") ) ) then
					has_second_sight = not restoration.Options:GetValue("OTHER/WeaponHandling/SecondSightSprint") and true
					break -- don't need to keep looking if one is present
				end
			end
		end


		local desc_color_info = part_data and part_data.desc_color_info
		updated_texts[4].resource_color = {}

		if slot_data.global_value and slot_data.global_value ~= "normal" then
			updated_texts[4].text = "##" .. managers.localization:to_upper_text(tweak_data.lootdrop.global_values[slot_data.global_value].desc_id) .. "##"
			table.insert(updated_texts[4].resource_color, tweak_data.lootdrop.global_values[slot_data.global_value].color)
		end

		if perks and table.contains(perks, "bonus") then
			if (slot_data.global_value and slot_data.global_value ~= "normal") then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text("bm_menu_disables_cosmetic_bonus") .. "##"
			else
				updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text("bm_menu_disables_cosmetic_bonus") .. "##"
			end
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.text)
		end

		crafted = managers.blackmarket:get_crafted_category_slot(prev_data.category, prev_data.slot)
		if is_gadget or is_ammo or is_bayonet or is_bipod or has_desc then
			local description = managers.weapon_factory:get_part_desc_by_part_id_from_weapon(part_id, crafted.factory_id, crafted.blueprint)
			if is_gadget and has_second_sight and not is_second_sight then
				description = description .. managers.localization:text("bm_wp_upg_fl_second_sight_warning")
			end
			for color_id in string.gmatch(description, "#%{(.-)%}#") do
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
			end
			description = description:gsub("#%{(.-)%}#", "##")

			if (slot_data.global_value and slot_data.global_value ~= "normal") and description ~= "" or (perks and table.contains(perks, "bonus")) then
				updated_texts[4].text = updated_texts[4].text .. "\n" .. description
			else
				updated_texts[4].text = updated_texts[4].text .. description
			end
		end

		if has_move_speed then
			local penalty_as_string = string.format("%d%%", math.round((has_move_speed) * 100)):gsub("-", "")
			if has_move_speed < 0 then
				if (slot_data.global_value and slot_data.global_value ~= "normal") or is_gadget or is_ammo or is_bayonet or is_bipod or has_desc or (perks and table.contains(perks, "bonus")) then
					updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. ".##"
				else
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. ".##"
				end
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
			else
				if (slot_data.global_value and slot_data.global_value ~= "normal") or is_gadget or is_ammo or is_bayonet or is_bipod or has_desc or (perks and table.contains(perks, "bonus")) then
					updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_movement_bonus_info") .. penalty_as_string .. ".##"
				else
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:text("bm_menu_weapon_movement_bonus_info") .. penalty_as_string .. ".##"
				end
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.skill_color)
			end
		end

		if has_sms then
			local penalty_as_string = string.format("%d%%", math.round((1 - has_sms) * 100)):gsub("-", "")
			if has_sms < 0 then
				if (slot_data.global_value and slot_data.global_value ~= "normal") or is_gadget or is_ammo or is_bayonet or is_bipod or has_desc or has_move_speed or (perks and table.contains(perks, "bonus")) then
					updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. managers.localization:text(stat_sms and "bm_menu_stat_sms_info_2" or "bm_menu_sms_info_2") .. "##"
				else
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:text("bm_menu_weapon_movement_penalty_info") .. penalty_as_string .. managers.localization:text(stat_sms and "bm_menu_stat_sms_info_2" or "bm_menu_sms_info_2") .. "##"
				end
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
				else

				if (slot_data.global_value and slot_data.global_value ~= "normal") or is_gadget or is_ammo or is_bayonet or is_bipod or has_desc or has_move_speed or (perks and table.contains(perks, "bonus")) then
					updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:text("bm_menu_weapon_sms_bonus_info") .. penalty_as_string .. ".##"
				else
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:text("bm_menu_weapon_sms_bonus_info") .. penalty_as_string .. ".##"
				end
				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.skill_color)
			end
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
				if (slot_data.global_value and slot_data.global_value ~= "normal") or (perks and table.contains(perks, "bonus")) or is_gadget or is_ammo or is_bayonet or is_bipod or has_desc then
					updated_texts[4].text = updated_texts[4].text .. "\n##" .. managers.localization:to_upper_text("bm_mod_equip_remove", {
						mod = removed_mods
					}) .. "##"
				else
					updated_texts[4].text = updated_texts[4].text .. "##" .. managers.localization:to_upper_text("bm_mod_equip_remove", {
						mod = removed_mods
					}) .. "##"
				end
			end
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
		elseif forbidden_parts and #forbidden_parts > 0 then
			local forbids = {}

			for i, forbidden_part in ipairs(forbidden_parts) do
				local data = tweak_data.weapon.factory.parts[forbidden_part]

				if data then
					forbids[data.type] = (forbids[data.type] or 0) + 1
				end
			end

			local text = " "

			for category, amount in pairs(forbids) do
				if droppable_mods[category] then
					if text ~= " " then
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

			if (slot_data.global_value and slot_data.global_value ~= "normal") or (perks and table.contains(perks, "bonus")) or is_gadget or is_ammo or is_bayonet or is_bipod or has_desc then
				updated_texts[4].text = updated_texts[4].text .. "\n##" .. text .. "##"
			else
				updated_texts[4].text = updated_texts[4].text .. "##" .. text .. "##"
			end
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.important_1)
		end
	elseif identifier == self.identifiers.mask_mod then
		if not managers.blackmarket:currently_customizing_mask() then
			return
		end

		local mask_mod_info = managers.blackmarket:info_customize_mask()
		local mask_base_price = managers.blackmarket:get_customize_mask_base_value()
		updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_masks") .. ": " .. self._data.topic_params.mask_name

		if mask_base_price and mask_base_price > 0 then
			updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_base_price)
		end

		updated_texts[2].text = updated_texts[2].text .. "\n"
		local resource_color = {}
		local material_text = managers.localization:to_upper_text("bm_menu_materials")
		local pattern_text = managers.localization:to_upper_text("bm_menu_textures")
		local colors_text = managers.localization:to_upper_text("bm_menu_colors")
		local color_a_text = managers.localization:to_upper_text("bm_menu_color_a")
		local color_b_text = managers.localization:to_upper_text("bm_menu_color_b")

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

		local should_show_one_color = mask_mod_info[4].is_same or mask_mod_info[3].overwritten and mask_mod_info[4].overwritten

		if should_show_one_color then
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
		else
			if mask_mod_info[3].overwritten then
				updated_texts[2].text = updated_texts[2].text .. color_a_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"

				table.insert(resource_color, tweak_data.screen_colors.risk)
			elseif mask_mod_info[3].is_good then
				updated_texts[2].text = updated_texts[2].text .. color_a_text .. ": " .. managers.localization:text(mask_mod_info[3].text)

				if mask_mod_info[3].price and mask_mod_info[3].price > 0 then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[3].price)
				end

				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. color_a_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"

				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end

			if mask_mod_info[4].overwritten then
				updated_texts[2].text = updated_texts[2].text .. color_b_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_overwritten") .. "##" .. "\n"

				table.insert(resource_color, tweak_data.screen_colors.risk)
			elseif mask_mod_info[4].is_good then
				updated_texts[2].text = updated_texts[2].text .. color_b_text .. ": " .. managers.localization:text(mask_mod_info[4].text)

				if mask_mod_info[4].price and mask_mod_info[4].price > 0 then
					updated_texts[2].text = updated_texts[2].text .. " " .. managers.experience:cash_string(mask_mod_info[4].price)
				end

				updated_texts[2].text = updated_texts[2].text .. "\n"
			else
				updated_texts[2].text = updated_texts[2].text .. color_b_text .. ": " .. "##" .. managers.localization:to_upper_text("menu_bm_not_selected") .. "##" .. "\n"

				table.insert(resource_color, tweak_data.screen_colors.important_1)
			end
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
			index.mask_colors = index.colors
			index.colors = nil
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

		local deployable_id = slot_data.name
		local deployable_uses = nil
		if deployable_id == "doctor_bag" then
			deployable_uses = tweak_data.upgrades.doctor_bag_base + (managers.player:equiptment_upgrade_value(deployable_id, "amount_increase") or 0)
		elseif deployable_id == "ammo_bag" then
			deployable_uses = tweak_data.upgrades.ammo_bag_base + (managers.player:equiptment_upgrade_value(deployable_id, "ammo_increase") or 0)
		elseif deployable_id == "ecm_jammer" then
			local mult_1 = managers.player:has_category_upgrade(deployable_id, "duration_multiplier") and managers.player:equiptment_upgrade_value(deployable_id, "duration_multiplier") or 1
			local mult_2 = managers.player:has_category_upgrade(deployable_id, "duration_multiplier_2") and managers.player:equiptment_upgrade_value(deployable_id, "duration_multiplier_2") or 1
			deployable_uses = tweak_data.upgrades.ecm_jammer_base_battery_life * mult_1 * mult_2
		elseif deployable_id == "sentry_gun_silent" then
			deployable_id = "sentry_gun"
		end

		if deployable_id == "sentry_gun" then
			local ammo_cost = { --SentryGunBase isn't loaded outside of gameplay so I gotta dupe the cost table here, maybe I'll move it to tweak_data
				0.4,
				0.35,
				0.3
			}
			local cost_reduction = managers.player:has_category_upgrade(deployable_id, "cost_reduction") and managers.player:equiptment_upgrade_value(deployable_id, "cost_reduction") or 1
			deployable_uses = ammo_cost[cost_reduction] * 100 .. "%"
		end

		updated_texts[4].resource_color = {}
		local description = managers.localization:text(tweak_data.blackmarket.deployables[slot_data.name].desc_id, {
			BTN_INTERACT = managers.localization:btn_macro("interact", true),
			BTN_USE_ITEM = managers.localization:btn_macro("use_item", true),
			deployable_uses = deployable_uses
		})
		for color_id in string.gmatch(description, "#%{(.-)%}#") do
			table.insert(updated_texts[4].resource_color, tweak_data.screen_colors[color_id])
		end
		description = description:gsub("#%{(.-)%}#", "##")

		updated_texts[4].text = description
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
				local quality_id = tweak_data.economy.qualities[cosmetic_quality] and tweak_data.economy.qualities[cosmetic_quality].name_id and cosmetic_quality or "mint"
				local quality_string = managers.localization:to_upper_text("bm_menu_weapon_color_quality", {
					quality = managers.localization:text(tweak_data.economy.qualities[quality_id].name_id)
				})
				updated_texts[4].text = updated_texts[4].text .. name_string .. "\n" .. color_index_string .. "\n" .. quality_string

				table.insert(updated_texts[4].resource_color, tweak_data.screen_colors.text)
				table.insert(updated_texts[4].resource_color, tweak_data.economy.qualities[quality_id].color or tweak_data.screen_colors.text)
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
			elseif type(slot_data.unlocked) == "number" then
				updated_texts[2].text = updated_texts[2].text .. managers.localization:to_upper_text("bm_menu_item_amount", {
					amount = tostring(math.abs(slot_data.unlocked))
				})
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
		local resmod_scale = 0.95

		info_text:set_font_size(small_font_size * resmod_scale)
		info_text:set_w((updated_texts[i].ignore_scale and 10000) or self._info_texts_panel:w())

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
		local max_h = (self._info_texts_panel:h() - info_text:top()) - 8

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

function BlackMarketGui:open_weapon_buy_menu(data, check_allowed_item_func)
	local blackmarket_items = managers.blackmarket:get_weapon_category(data.category) or {}
	local new_node_data = {}
	local weapon_tweak = tweak_data.weapon
	local x_id, y_id, x_level, y_level, x_unlocked, y_unlocked, x_skill, y_skill, x_gv, y_gv, x_sn, y_sn, x_locked_sort, y_locked_sort = nil
	local item_categories = {}
	local sorted_categories = {}
	local gui_categories = tweak_data.gui.buy_weapon_categories[data.category]

	for i = 1, #gui_categories do
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

	local function test_weapon_available(weapon_data)
		if not weapon_data.unlocked then
			local def_data = tweak_data.upgrades.definitions[weapon_data.weapon_id]

			if def_data and def_data.dlc then
				local dlc_unlocked = managers.dlc:is_dlc_unlocked(def_data.dlc)
				local gv_tweak = tweak_data.lootdrop.global_values[def_data.dlc]

				if not dlc_unlocked and gv_tweak and gv_tweak.hide_unavailable then
					return false
				end
			end
		end

		return true
	end

	for _, item in ipairs(blackmarket_items) do
		local weapon_data = tweak_data.weapon[item.weapon_id]
		
		
		local recategorize = weapon_data.recategorize
		--log(tostring(recategorize))
		
		for i, gui_category in ipairs(gui_categories) do
			if test_weapon_categories(recategorize or weapon_data.categories, gui_category) and test_weapon_available(item) then
				table.insert(item_categories[i], item)
			end
		end
	end

	for i, category in ipairs(item_categories) do
		local category_key = table.concat(gui_categories[i], "_")
		
		--log(tostring(item_categories[category_key]))
		
		item_categories[category_key] = category
		item_categories[i] = nil
		sorted_categories[i] = category_key
	end

	for category, items in pairs(item_categories) do
		local sort_table = {}

		for _, item in ipairs(items) do
			local id = item.weapon_id
			local unlocked = managers.blackmarket:weapon_unlocked(id)
			local gv = weapon_tweak[id] and weapon_tweak[id].global_value
			local dlc = gv and managers.dlc:global_value_to_dlc(gv)
			local level = item.level or 0
			local sn = gv and tweak_data.lootdrop.global_values[gv].sort_number or 0
			local skill = item.skill_based or false
			local func = item.func_based or false
			sort_table[id] = {
				unlocked = unlocked,
				locked_sort = tweak_data.gui:get_locked_sort_number(dlc, func, skill),
				level = level,
				sort_number = sn,
				skill = skill
			}
		end

		table.sort(items, function (x, y)
			if _G.IS_VR and x.vr_locked ~= y.vr_locked then
				return not x.vr_locked
			end

			x_id = x.weapon_id
			y_id = y.weapon_id
			x_unlocked = sort_table[x_id].unlocked
			y_unlocked = sort_table[y_id].unlocked

			if x_unlocked ~= y_unlocked then
				return x_unlocked
			end

			if not x_unlocked then
				x_locked_sort = sort_table[x_id].locked_sort
				y_locked_sort = sort_table[y_id].locked_sort

				if x_locked_sort ~= y_locked_sort then
					return x_locked_sort < y_locked_sort
				end
			end

			x_level = sort_table[x_id].level
			y_level = sort_table[y_id].level

			if x_level ~= y_level then
				return x_level < y_level
			end

			x_sn = sort_table[x_id].sort_number
			y_sn = sort_table[y_id].sort_number

			if x_sn ~= y_sn then
				return x_sn < y_sn
			end

			x_skill = sort_table[x_id].skill_based
			y_skill = sort_table[y_id].skill_based

			if x_skill ~= y_skill then
				return y_skill
			end

			return x_id < y_id
		end)
	end

	local item_data = nil
	local rows = tweak_data.gui.WEAPON_ROWS_PER_PAGE or 3
	local columns = tweak_data.gui.WEAPON_COLUMNS_PER_PAGE or 3

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
			on_create_func = data.on_create_func,
			on_create_func_name = not data.on_create_func and (data.on_create_func_name or "populate_buy_weapon"),
			on_create_data = item_data,
			identifier = self.identifiers.weapon,
			override_slots = {
				columns,
				rows
			}
		})
	end

	new_node_data.buying_weapon = true
	new_node_data.topic_id = "bm_menu_buy_weapon_title"
	new_node_data.topic_params = {
		weapon_category = managers.localization:text("bm_menu_" .. data.category)
	}
	new_node_data.blur_fade = self._data.blur_fade
	new_node_data.search_box_disconnect_callback_name = "on_search_item"

	managers.menu:open_node(self._inception_node_name, {
		new_node_data
	})
end


local function make_cosmetic_data(data, cosmetic_id, unlocked, quality, bonus, equipped)
	local crafted = managers.blackmarket:get_crafted_category(data.category)[data.prev_node_data and data.prev_node_data.slot]
	local my_cd = tweak_data.blackmarket.weapon_skins[cosmetic_id]
	local new_data = {
		name = cosmetic_id,
		name_localized = my_cd and my_cd.name_id and managers.localization:text(my_cd.name_id) or managers.localization:text("bm_menu_no_mod"),
		desc_id = my_cd and my_cd.desc_id,
		lock_text_id = my_cd and my_cd.lock_id,
		category = data.category or data.prev_node_data and data.prev_node_data.category,
		default_blueprint = my_cd and my_cd.default_blueprint,
		locked_cosmetics = my_cd and my_cd.locked
	}
	local bitmap_texture, bg_texture = managers.blackmarket:get_weapon_icon_path(data.prev_node_data.name, {
		id = cosmetic_id
	})
	new_data.bitmap_texture = bitmap_texture
	new_data.bg_texture = bg_texture

	if not unlocked then
		new_data.bitmap_locked_color = Color.white
		new_data.bitmap_locked_blend_mode = "normal"
		new_data.bitmap_locked_alpha = 0.6
		new_data.bg_alpha = 0.4
	end

	new_data.slot = data.slot or data.prev_node_data and data.prev_node_data.slot
	new_data.global_value = my_cd and my_cd.global_value or "normal"
	new_data.akimbo_gui_data = tweak_data.weapon[crafted.weapon_id] and tweak_data.weapon[crafted.weapon_id].akimbo_gui_data
	new_data.cosmetic_id = cosmetic_id
	new_data.cosmetic_quality = quality
	new_data.cosmetic_rarity = my_cd and my_cd.rarity or "common"
	new_data.cosmetic_bonus = bonus
	new_data.unlocked = unlocked
	new_data.equipped = equipped
	new_data.stream = true
	new_data.lock_texture = not new_data.unlocked

	if new_data.default_blueprint then
		new_data.comparision_data = managers.blackmarket:get_weapon_stats(new_data.category, new_data.slot, new_data.default_blueprint)
	end

	if new_data.unlocked then
		if managers.blackmarket:last_previewed_cosmetic() == cosmetic_id then
			table.insert(new_data, "wcc_cancel_preview")
		else
			table.insert(new_data, "wcc_preview")
		end
	end

	if new_data.equipped then
		table.insert(new_data, "wcc_remove")
	end

	if new_data.unlocked then
		if not crafted.previewing and not new_data.equipped then
			table.insert(new_data, "wcc_equip")
		end

		if managers.blackmarket:is_previewing_any_mod() then
			table.insert(new_data, "wm_clear_mod_preview")
		end
	else
		if managers.blackmarket:last_previewed_cosmetic() == cosmetic_id then
			table.insert(new_data, "wcc_cancel_preview")
		else
			table.insert(new_data, "wcc_preview")
		end

		if not crafted.previewing and not my_cd.is_a_unlockable and managers.menu:is_pc_controller() then
			table.insert(new_data, "wcc_market")
		end

		if managers.blackmarket:is_previewing_any_mod() then
			table.insert(new_data, "wm_clear_mod_preview")
		end

		local lock_icon = nil

		if managers.dlc:is_content_achievement_locked("weapon_skins", new_data.name) or managers.dlc:is_content_achievement_milestone_locked("weapon_skins", new_data.name) then
			lock_icon = "guis/textures/pd2/lock_achievement"
		end

		new_data.mini_icons = new_data.mini_icons or {}

		table.insert(new_data.mini_icons, {
			stream = true,
			layer = 2,
			h = 30,
			w = 30,
			blend_mode = "normal",
			bottom = 1,
			right = 1,
			texture = lock_icon or my_cd.is_a_unlockable and "guis/textures/pd2/skilltree/padlock" or "guis/textures/pd2/lock_dlc",
			color = tweak_data.screen_colors.important_1
		})
	end

	return new_data
end

function BlackMarketGui:populate_weapon_cosmetics(data)
	local crafted = managers.blackmarket:get_crafted_category(data.category)[data.prev_node_data and data.prev_node_data.slot]
	local cosmetics_data = tweak_data.blackmarket.weapon_skins
	local my_cd, new_data, bitmap_texture, bg_texture = nil
	local inventory_tradable = managers.blackmarket:get_inventory_tradable()
	local cosmetics_instances = data.on_create_data.instances or {}
	local all_cosmetics = data.on_create_data.cosmetics or {}
	local cosmetic_data, cosmetic_id = nil
	local index_i = 1
	cosmetic_id = tweak_data.blackmarket.weapon_color_default
	cosmetic_data = cosmetics_data[cosmetic_id]
	local unlocked = true
	local equipped = false
	local quality = "good"
	local color_index = 1
	local pattern_scale = tweak_data.blackmarket.weapon_color_pattern_scale_default
	local color_texture = nil
	local equipped_cosmetic_id = crafted and crafted.cosmetics and crafted.cosmetics.id
	local equipped_tweak = cosmetics_data[equipped_cosmetic_id]

	if equipped_tweak and equipped_tweak.is_a_color_skin then
		cosmetic_id = equipped_cosmetic_id
		cosmetic_data = equipped_tweak
		quality = crafted.cosmetics.quality
		color_index = crafted.cosmetics.color_index
		pattern_scale = crafted.cosmetics.pattern_scale
		equipped = true
		local dlc = cosmetic_data.dlc or managers.dlc:global_value_to_dlc(cosmetic_data.global_value)
		local global_value = cosmetic_data.global_value or managers.dlc:dlc_to_global_value(dlc)
		local dlc_unlocked = not dlc or managers.dlc:is_dlc_unlocked(dlc)
		local have_color = managers.blackmarket:has_item(global_value, "weapon_skins", equipped_cosmetic_id)
		unlocked = dlc_unlocked and have_color
		local guis_catalog = "guis/"
		local bundle_folder = equipped_tweak.texture_bundle_folder

		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end

		color_texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapon_color/" .. cosmetic_id
	end

	local global_value = cosmetic_data.global_value or "normal"
	new_data = make_cosmetic_data(data, cosmetic_id, unlocked, quality, nil, equipped)
	new_data.akimbo_gui_data = nil
	new_data.name_localized = managers.localization:text("bm_menu_customizable_weapon_color")
	new_data.is_a_color_skin = true
	new_data.bitmap_texture = color_texture
	new_data.cosmetic_color_index = color_index
	new_data.cosmetic_pattern_scale = pattern_scale
	new_data.mid_text_no_change_alpha = true
	new_data.mid_text = {
		selected_text = new_data.name_localized,
		selected_color = tweak_data.screen_colors.text
	}
	new_data.mid_text.noselected_text = new_data.mid_text.selected_text
	new_data.mid_text.noselected_color = tweak_data.screen_colors.text
	new_data.mid_text.font = small_font
	new_data.mid_text.font_size = small_font_size
	new_data.mid_text.vertical = "center"

	if equipped then
		table.insert(new_data, "wcs_customize_color")
	end

	local equip_index = table.get_vector_index(new_data, "wcc_equip")

	if equip_index then
		new_data[equip_index] = "wcs_equip"
	end

	data[index_i] = new_data
	index_i = index_i + 1

	for _, instance_id in ipairs(cosmetics_instances) do
		cosmetic_id = inventory_tradable[instance_id].entry
		my_cd = cosmetics_data[cosmetic_id]
		local quality = inventory_tradable[instance_id].quality
		local bonus = inventory_tradable[instance_id].bonus
		local equipped = crafted and crafted.cosmetics and crafted.cosmetics.instance_id == instance_id
		new_data = make_cosmetic_data(data, cosmetic_id, true, quality, bonus, equipped)
		new_data.name = instance_id

		if new_data.cosmetic_bonus then
			local bonuses = tweak_data.economy:get_bonus_icons(my_cd.bonus)
			local x = 0

			for _, texture_path in ipairs(bonuses) do
				new_data.mini_icons = new_data.mini_icons or {}

				table.insert(new_data.mini_icons, {
					name = "has_bonus",
					h = 16,
					layer = 1,
					w = 16,
					stream = false,
					bottom = 0,
					texture = texture_path,
					right = x
				})

				x = x + 17
			end
		end

		data[index_i] = new_data
		index_i = index_i + 1
	end

	for _, cosm_data in ipairs(all_cosmetics) do
		cosmetic_id = cosm_data.id
		cosmetic_data = cosm_data.data
		my_cd = cosmetics_data[cosmetic_id]

		if not my_cd.is_template then
			local global_value = my_cd and my_cd.global_value or "normal"
			local unlocked = managers.blackmarket:get_item_amount(global_value, "weapon_skins", cosmetic_id, true) > 0
			local equipped = crafted and crafted.cosmetics and crafted.cosmetics.instance_id == cosmetic_id
			new_data = make_cosmetic_data(data, cosmetic_id, unlocked, "mint", nil, equipped)
			data[index_i] = new_data
			index_i = index_i + 1
		end
	end

	local total_cosmetics = #cosmetics_instances + #all_cosmetics
	total_cosmetics = total_cosmetics + 1
	local new_data = nil
	local max_items = self:calc_max_items(total_cosmetics, data.override_slots or WEAPON_MODS_SLOTS)

	for i = 1, max_items do
		if not data[i] then
			new_data = {
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
end


-- Mod Shop Stuff
Hooks:RegisterHook("BlackMarketGUIOnPopulateBuyMasks")
Hooks:RegisterHook("BlackMarketGUIOnPopulateBuyMasksActionList")
function BlackMarketGui.populate_buy_mask(self, data)

	Hooks:Call("BlackMarketGUIOnPopulateBuyMasks", self, data)

	local new_data = {}
	local guis_catalog = "guis/"
	local mask_list = data.on_create_data
	mask_list = self:get_filtered_search_list(mask_list, tweak_data.blackmarket.masks, "mask_id")
	local num_prev_data = #data

	for i = 1, num_prev_data do
		data[i] = nil
	end

	local max_masks = #mask_list

	for i = 1, max_masks do
		local guis_mask_id = mask_list[i].mask_id

		if tweak_data.blackmarket.masks[guis_mask_id].guis_id then
			guis_mask_id = tweak_data.blackmarket.masks[guis_mask_id].guis_id
		end

		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.masks[guis_mask_id] and tweak_data.blackmarket.masks[guis_mask_id].texture_bundle_folder

		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end

		new_data = {
			name = mask_list[i].mask_id
		}
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket.masks[new_data.name].name_id)
		new_data.category = data.category
		new_data.slot = data.prev_node_data and data.prev_node_data.slot
		new_data.global_value = mask_list[i].global_value
		new_data.global_value_category = data.name
		new_data.unlocked = managers.blackmarket:get_item_amount(new_data.global_value, "masks", new_data.name, true) or 0
		new_data.equipped = false
		new_data.num_backs = data.prev_node_data.num_backs + 1
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/masks/" .. guis_mask_id
		new_data.stream = true

		if not new_data.global_value then
			Application:debug("BlackMarketGui:populate_buy_mask( data ) Missing global value on mask", new_data.name)
		end

		local dlc = tweak_data.blackmarket.masks[new_data.name].dlc or managers.dlc:global_value_to_dlc(new_data.global_value)

		if dlc and not managers.dlc:is_dlc_unlocked(dlc) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = self:get_lock_icon(new_data)
			local dlc_global_value = managers.dlc:dlc_to_global_value(dlc)
			new_data.dlc_locked = dlc_global_value and tweak_data.lootdrop.global_values[dlc_global_value] and tweak_data.lootdrop.global_values[dlc_global_value].unlock_id or "bm_menu_dlc_locked"
		elseif managers.dlc:is_content_achievement_locked(data.category, new_data.name) or managers.dlc:is_content_achievement_milestone_locked(data.category, new_data.name) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = "guis/textures/pd2/lock_achievement"
		elseif managers.dlc:is_content_skirmish_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
		elseif managers.dlc:is_content_crimespree_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
		elseif managers.dlc:is_content_infamy_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/lock_infamy"
			new_data.infamy_lock = true
		else
			local event_job_challenge = managers.event_jobs:get_challenge_from_reward(data.category, new_data.name)

			if event_job_challenge and not event_job_challenge.completed then
				new_data.unlocked = -math.abs(new_data.unlocked)
				new_data.lock_texture = "guis/textures/pd2/lock_achievement"
				new_data.dlc_locked = event_job_challenge.locked_id or "menu_event_job_lock_info"
			end
		end

		new_data.lock_color = self:get_lock_color(new_data)

		if tweak_data.blackmarket.masks[new_data.name].infamy_lock then
			local infamy_lock = tweak_data.blackmarket.masks[new_data.name].infamy_lock
			local is_unlocked = managers.infamy:owned(infamy_lock)

			if not is_unlocked then
				new_data.unlocked = -math.abs(new_data.unlocked)
				new_data.lock_texture = "guis/textures/pd2/lock_infamy"
				new_data.infamy_lock = infamy_lock
			end
		end

		new_data.active = true

		if new_data.unlocked and new_data.unlocked > 0 then
			if new_data.active then
				table.insert(new_data, "bm_buy")
				table.insert(new_data, "bm_preview")
			end

			if managers.money:get_mask_sell_value(new_data.name, new_data.global_value) > 0 then
				table.insert(new_data, "bm_sell")
			end
		else
			local dlc_data = Global.dlc_manager.all_dlc_data[new_data.global_value]

			if dlc_data and dlc_data.app_id and not dlc_data.external and not managers.dlc:is_dlc_unlocked(new_data.global_value) then
				table.insert(new_data, "bw_buy_dlc")
			end

			if new_data.active then
				table.insert(new_data, "bm_preview")
			end

			new_data.mid_text = ""
			new_data.lock_texture = new_data.lock_texture or true
		end

		if managers.blackmarket:got_new_drop(new_data.global_value or "normal", "masks", new_data.name) then
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
				"masks",
				new_data.name
			}
		end

		data[i] = new_data
	end

	local max_items = self:calc_max_items(max_masks, data.override_slots)

	for i = max_masks + 1, max_items do
		new_data = {
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

local populate_choose_mask_mod1 = BlackMarketGui.populate_choose_mask_mod
Hooks:RegisterHook("BlackMarketGUIOnPopulateMaskMods")
Hooks:RegisterHook("BlackMarketGUIOnPopulateMaskModsActionList")
function BlackMarketGui.populate_choose_mask_mod(self, data)
populate_choose_mask_mod1(self, data)
	Hooks:Call("BlackMarketGUIOnPopulateMaskMods", self, data)

	local new_data = {}
	local index = 1
	local equipped_mod = managers.blackmarket:customize_mask_category_id(data.category)
	local equipped_first, equipped_second = nil

	if data.category == "mask_colors" then
		equipped_first = data.is_first_color and managers.blackmarket:customize_mask_category_id("color_a")
		equipped_second = not data.is_first_color and managers.blackmarket:customize_mask_category_id("color_b")
	end
	local guis_catalog = "guis/"
	local type_func = type

	for k, mods in pairs(data.on_create_data) do

		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket[data.category][mods.id] and tweak_data.blackmarket[data.category][mods.id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end

		new_data = {}
		new_data.name = mods.id
		new_data.name_localized = managers.localization:text(tweak_data.blackmarket[data.category][new_data.name].name_id)
		new_data.category = data.category
		new_data.slot = index
		new_data.prev_slot = data.prev_node_data and data.prev_node_data.slot
		new_data.unlocked = mods.default or mods.amount
		new_data.amount = mods.amount or 0
		new_data.equipped = equipped_mod == mods.id
		new_data.equipped_text = managers.localization:text("bm_menu_chosen")
		new_data.mods = mods
		new_data.stream = data.category ~= "colors"
		new_data.global_value = mods.global_value
		local is_locked = false
		if new_data.amount < 1 and mods.id ~= "plastic" and mods.id ~= "no_color_full_material" and not mods.free_of_charge then
			if type(new_data.unlocked) == "number" then
				new_data.unlocked = -math.abs(new_data.unlocked)
			end
			new_data.lock_texture = true
			new_data.dlc_locked = "bm_menu_amount_locked"
			is_locked = true
		end
		
		if new_data.unlocked and type_func(new_data.unlocked) == "number" and tweak_data.lootdrop.global_values[new_data.global_value] and tweak_data.lootdrop.global_values[new_data.global_value].dlc and not managers.dlc:is_dlc_unlocked(new_data.global_value) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = self:get_lock_icon(new_data)
			new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or "bm_menu_dlc_locked"
			is_locked = true
		elseif managers.dlc:is_content_achievement_locked(data.category, new_data.name) or managers.dlc:is_content_achievement_milestone_locked(data.category, new_data.name) then
			new_data.unlocked = -math.abs(new_data.unlocked)
			new_data.lock_texture = "guis/textures/pd2/lock_achievement"
		elseif managers.dlc:is_content_skirmish_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
		elseif managers.dlc:is_content_crimespree_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/skilltree/padlock"
		elseif managers.dlc:is_content_infamy_locked(data.category, new_data.name) and (not new_data.unlocked or new_data.unlocked == 0) then
			new_data.lock_texture = "guis/textures/pd2/lock_infamy"
			-- new_data.infamy_lock = true
		end

		if data.category == "mask_colors" then
			new_data.equipped = equipped_first == new_data.name or equipped_second == new_data.name
			new_data.bitmap_texture = "guis/dlcs/mcu/textures/pd2/blackmarket/icons/mask_color/mask_color_icon"
			new_data.bitmap_color = tweak_data.blackmarket.mask_colors[new_data.name].color
			new_data.is_first_color = data.is_first_color
		elseif data.category == "textures" then
			new_data.bitmap_texture = tweak_data.blackmarket[data.category][mods.id].texture
			new_data.render_template = Idstring("VertexColorTexturedPatterns")
		else
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/" .. tostring(data.category) .. "/" .. new_data.name
			if mods.bitmap_texture_override then
				new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/" .. tostring(data.category) .. "/" .. mods.bitmap_texture_override
			end
		end

		if managers.blackmarket:got_new_drop(new_data.global_value or "normal", new_data.category, new_data.name) then
			new_data.mini_icons = new_data.mini_icons or {}
			table.insert(new_data.mini_icons, {
				name = "new_drop",
				texture = "guis/textures/pd2/blackmarket/inv_newdrop",
				right = 0,
				top = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false
			})
			new_data.new_drop_data = {
				new_data.global_value or "normal",
				new_data.category,
				new_data.name
			}
		end

		new_data.btn_text_params = {
			type = managers.localization:text("bm_menu_" .. data.category)
		}
		if not is_locked then

			if data.category == "mask_colors" then
				if data.is_first_color then
					table.insert(new_data, "mp_choose_first")
				else
					table.insert(new_data, "mp_choose_second")
				end
			else
				table.insert(new_data, "mp_choose")
			end
			table.insert(new_data, "mp_preview")

		end

		if managers.blackmarket:can_finish_customize_mask() and managers.blackmarket:can_afford_customize_mask() then
			table.insert(new_data, "mm_buy")
		end

		Hooks:Call("BlackMarketGUIOnPopulateMaskModsActionList", self, new_data)

		data[index] = new_data
		index = index + 1

	end

	if #data == 0 then
		new_data = {}
		new_data.name = "bm_menu_nothing"
		new_data.empty_slot = true
		new_data.category = data.category
		new_data.slot = 1
		new_data.unlocked = true
		new_data.can_afford = true
		new_data.equipped = false
		data[1] = new_data
	end

	local max_mask_mods = #data.on_create_data
	for i = 1, math.ceil(max_mask_mods / data.override_slots[1]) * data.override_slots[1] do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = data.category
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end

	end
end

BlackMarketGui.modshop_purchase_mask_callback = function(self, data)
	ModShop:AttemptItemPurchase( data )
end

BlackMarketGui.modshop_purchase_mask_part_callback = function(self, data)
	ModShop:AttemptItemPurchase( data )
end

_G.ModShop = _G.ModShop or {}

ModShop.PurchaseCurrency = "gage_coin"
ModShop.CostRegular = 6
ModShop.CostInfamous = 24
ModShop.MaskPricing = {
	["default"] = 6,
	["dlc"] = 6,
	["normal"] = 6,
	["pd2_clan"] = 6,
	["halloween"] = 12,
	["infamous"] = 24,
	["infamy"] = 24,
}

ModShop.ExclusionList = {
	["nothing"] = true,
	["no_material"] = true,
	["no_color_no_material"] = true,
	["no_color_full_material"] = true,
	["plastic"] = true,
	["character_locked"] = true,
}

ModShop.NonDLCGlobalValues = {
	["normal"] = true,
	["pd2_clan"] = true,
	["halloween"] = true,
	["infamous"] = true,
	["infamy"] = true,
}

ModShop.MaskMods = {
	["materials"] = true,
	["textures"] = true,
	["mask_colors"] = true,
}

ModShop.NamePriceOverrides = {
	["wpn_fps_upg_bonus_"] = 12,
}

function ModShop:IsItemExluded( item )
	return ModShop.ExclusionList[item] or false
end

function ModShop:IsGlobalValueDLC( gv )
	if not ModShop.NonDLCGlobalValues[gv] then
		return true
	end
	return false
end

function ModShop:IsInfamyLocked( data )

	local infamy_lock = data.tweak_data.infamy_lock
	if infamy_lock then
		local is_unlocked = managers.infamy:owned(infamy_lock)
		if not is_unlocked then
			return true
		end
	end

	return false

end

function ModShop:IsContent( data )
	for k, v in pairs( tweak_data.dlc ) do
		if managers.dlc:is_content_achievement_locked(data.category, data.name) or managers.dlc:is_content_achievement_milestone_locked(data.category, data.name) then
			return true
		elseif managers.dlc:is_content_skirmish_locked(data.category, data.name) and (not data.unlocked or data.unlocked == 0) then
			return true
		elseif managers.dlc:is_content_crimespree_locked(data.category, data.name) and (not data.unlocked or data.unlocked == 0) then
			return true
		elseif managers.dlc:is_content_infamy_locked(data.category, data.name) and (not data.unlocked or data.unlocked == 0) then
			return true
		else
			local event_job_challenge = managers.event_jobs:get_challenge_from_reward(data.category, data.name)

			if event_job_challenge and not event_job_challenge.completed then
				return true
			end
		end
	end

	return false
end

function ModShop:IsItemMaskMod( item )
	return ModShop.MaskMods[item.category] or false
end

function ModShop:GetItemPrice( data )

	if data.category == "masks" then
		local gv = self:IsGlobalValueDLC( data.global_value ) and "dlc" or data.global_value
		return ModShop.MaskPricing[ gv ]
	end

	if data.global_value == "infamy" or data.global_value == "infamous" then
		return ModShop.CostInfamous
	end

	for pattern, cost_override in pairs(self.NamePriceOverrides) do
		if data.name and string.find(data.name, pattern) then
			return cost_override
		end
	end

	return ModShop.CostRegular

end

function ModShop:_ReloadBlackMarket()
	local blackmarket_gui = managers.menu_component._blackmarket_gui
	if blackmarket_gui then
		blackmarket_gui:reload()
		blackmarket_gui:on_slot_selected( blackmarket_gui._selected_slot )
	end
end

function ModShop:AttemptItemPurchase( data, weapon_part )

	if not data then
		return
	end

	local verified, purchase_data = self:VerifyItemPurchase( data, weapon_part )
	if verified then
		if purchase_data.price <= managers.custom_safehouse:coins() then
			self:ShowItemPurchaseMenu( purchase_data )
		else
			self:ShowItemCannotAffordMenu( purchase_data )
		end
	end

end

function ModShop:VerifyItemPurchase( data, weapon_part )

	if not data then
		return
	end

	local name = data.name
	local category = weapon_part and "parts" or data.category

	local entry
	if weapon_part then
		entry = tweak_data:get_raw_value("weapon", "factory", category, name)
	else
		entry = tweak_data:get_raw_value("blackmarket", category, name)
	end

	if not entry then
		local str = "[Error] Could not retrieve tweak_data for {1} item '{2}', weapon_part: {3}"
		str = str:gsub("{1}", tostring(category))
		str = str:gsub("{2}", tostring(name))
		str = str:gsub("{3}", tostring(weapon_part or false))
		Print(str)
		return
	end

	local global_value = entry.infamous and "infamous" or entry.global_value or entry.dlc or entry.dlcs and entry.dlcs[math.random(#entry.dlcs)] or "normal"
	local purchase_data = {
		name = data.name,
		name_localized = data.name_localized,
		category = weapon_part and "weapon_mods" or data.category,
		is_weapon_part = weapon_part,
		bitmap_texture = data.bitmap_texture,
		global_value = global_value,
		tweak_data = entry,
		price = 1,
	}
	purchase_data.price = self:GetItemPrice( purchase_data )

	if self:IsItemExluded( purchase_data.name ) then
		return false
	end

	if self:IsGlobalValueDLC( purchase_data.global_value ) and not managers.dlc:is_dlc_unlocked( purchase_data.global_value ) then
		return false
	end

	if self:IsInfamyLocked( purchase_data ) then
		return false
	end

	if self:IsContent( purchase_data ) then
		return false
	end

	for k, v in pairs( tweak_data.dlc ) do
		if v.achievement_id ~= nil and v.content ~= nil and v.content.loot_drops ~= nil then
			for i, loot in pairs( v.content.loot_drops ) do
				if loot.item_entry ~= nil and loot.item_entry == purchase_data.name and loot.type_items == purchase_data.category then

					if not managers.achievment.handler:has_achievement(v.achievement_id) then

						local achievement_tracker = tweak_data.achievement[ purchase_data.is_weapon_part and "weapon_part_tracker" or "mask_tracker" ]
						local achievement_progress = achievement_tracker[purchase_data.name]
						if achievement_progress then
							return false
						end

						if not purchase_data.is_weapon_part then
							return false
						end
						
					end

				end
			end
		end
	end

	if purchase_data.tweak_data.is_a_unlockable then
		return false
	end

	return true, purchase_data

end

function ModShop:ShowItemPurchaseMenu( purchase_data )

	local currency_name = "menu_cs_coins"
	local title = managers.localization:text("dialog_bm_purchase_mod_title")
	local message = managers.localization:text("dialog_bm_purchase_mod")
	local message2 = managers.localization:text("dialog_bm_purchase_coins")
	message = message:gsub("$item;", purchase_data.name_localized)
	message2 = message2:gsub("$money;", tostring(purchase_data.price))

	local dialog_data = {}
	dialog_data.title = title
	dialog_data.text = message .. "\n\n" .. message2
	dialog_data.id = "gms_purchase_item_window"

	local ok_button = {}
	ok_button.text = managers.localization:text("dialog_yes")
	ok_button.callback_func = callback( self, self, "_PurchaseItem", purchase_data )

	local cancel_button = {}
	cancel_button.text = managers.localization:text("dialog_no")
	cancel_button.cancel_button = true

	dialog_data.button_list = {ok_button, cancel_button}
	dialog_data.purchase_data = purchase_data
	managers.system_menu:show( dialog_data )

end

function ModShop:ShowItemCannotAffordMenu( purchase_data )

	local currency_name = "menu_cs_coins"
	local title = managers.localization:text("dialog_bm_purchase_mod_cant_afford_title")
	local message = managers.localization:text("dialog_bm_purchase_mod_cant_afford")
	message = message:gsub("$name;", purchase_data.name_localized)
	message = message:gsub("$money;", tostring(purchase_data.price))

	local dialog_data = {}
	dialog_data.title = title
	dialog_data.text = message
	dialog_data.id = "gms_purchase_item_window"

	local cancel_button = {}
	cancel_button.text = managers.localization:text("dialog_ok")
	cancel_button.cancel_button = true

	dialog_data.button_list = { cancel_button }
	managers.system_menu:show( dialog_data )

end


function ModShop:_PurchaseItem( purchase_data )

	if not purchase_data then
		return
	end

	local name = purchase_data.name
	local category = purchase_data.category
	local global_value = purchase_data.global_value
	local price = purchase_data.price

	log(string.format( "Purchased item with continental coins:\n\tItem name: %s\n\tCategory: %s", tostring(name), tostring(category) ))
	managers.blackmarket:add_to_inventory(global_value, category, name, true)

	managers.custom_safehouse:deduct_coins( price )

	-- Record mask mods that were purchased so we can immediately add them to the gui when it reloads
	if self:IsItemMaskMod( purchase_data ) then
		self._purchased_mask_mods = ModShop._purchased_mask_mods or {}
		self._purchased_mask_mods[category] = self._purchased_mask_mods[category] or {}
		table.insert(self._purchased_mask_mods[category], name)
	end

	self:_ReloadBlackMarket()
	if Global.wallet_panel then
		WalletGuiObject.refresh()
	end

end

-- Hooks
Hooks:Add("BlackMarketGUIOnPopulateBuyMasksActionList", "BlackMarketGUIOnPopulateBuyMasksActionList_", function(gui, data)
	if ModShop:VerifyItemPurchase( data, false ) then
		table.insert(data, "bm_modshop")
	end
end)

Hooks:Add("BlackMarketGUIOnPopulateMaskModsActionList", "BlackMarketGUIOnPopulateMaskModsActionList_", function(gui, data)
	if ModShop:VerifyItemPurchase( data, false ) then
		table.insert(data, "mp_modshop")
	end
end)

Hooks:Add("BlackMarketGUIOnPopulateMaskMods", "BlackMarketGUIOnPopulateMaskMods_", function(gui, data)

	local category = data.category

	-- If we've purchased an item from this category then forcefully add that item when we force reload the gui
	-- That way we don't have to stop customizing the mask and reload the gui for it to appear anymore
	if data.on_create_data and ModShop._purchased_mask_mods and ModShop._purchased_mask_mods[category] then

		for k, v in pairs( ModShop._purchased_mask_mods[category] ) do

			for i, mods in pairs(data.on_create_data) do
				if mods.id == v then
					mods.amount = mods.amount + 1
				end
			end

		end

		ModShop._purchased_mask_mods[category] = nil

		-- Search compatibility, repopulate our inventory and then re-filter it
		if gui._search_bar and gui._search_bar:has_search() then
			gui._search_bar:do_search()
		end

	end

end)

Hooks:Add("BlackMarketManagerModifyGetInventoryCategory", "BlackMarketManagerModifyGetInventoryCategory_", function(blackmarket, category, data)

	local blackmarket_table = {}
	for k, v in pairs( tweak_data.blackmarket[category] ) do

		local already_in_table = blackmarket_table[v.id]
		for x, y in pairs( data ) do
			blackmarket_table[y.id] = true
			if y.id == k then
				already_in_table = true
			end
		end

		local global_value = v.infamous and "infamous" or v.global_value or v.dlc or v.dlcs and v.dlcs[math.random(#v.dlcs)] or "normal"
		if not already_in_table and not ModShop:IsItemExluded(k) then
			
			local add_item = true
			if ModShop:IsGlobalValueDLC( global_value ) and not managers.dlc:is_dlc_unlocked( global_value ) then
				add_item = false
			end

			if add_item then
				local item_data = {
					id = k,
					global_value = global_value,
					amount = 0
				}
				table.insert(data, item_data)
			end

		end
		
	end

end)