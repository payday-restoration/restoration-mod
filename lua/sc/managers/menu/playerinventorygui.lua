local function format_round(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.1f", num):gsub("%.?0+$", "")
end

local function format_round_2(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num)
end

local function format_round_3(num, round_value)
	return round_value and tostring(math.round(num)) or string.format("%.2f", num):gsub("%.?0+$", "")
end

--Can't figure out how "color_ranges" is read for multiple colors so have some ugly workaround
function PlayerInventoryGui:set_info_text(text, color_ranges, recursive, resource_color)
	self._info_text:set_text(text)

	local default_font_size = tweak_data.menu.pd2_small_font_size

	self._info_text:set_font_size(default_font_size)
	
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

	self._info_text:set_text(text)
	self._info_text:set_alpha(1)

	if resource_color then
		self._info_text:clear_range_color(1, utf8.len(text))

		if #start_ci ~= #end_ci then
			Application:error("BlackMarketGui: Missing ##'s in :set_info_text() string!", id, new_string, #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				self._info_text:set_range_color(start_ci[i], end_ci[i], type(resource_color) == "table" and (resource_color[i] or tweak_data.screen_colors.skill_color) or (resource_color or tweak_data.screen_colors.skill_color))
			end
		end
	end

	if color_ranges then
		if color_ranges.add_colors_to_text_object then
			managers.menu_component:add_colors_to_text_object(self._info_text, unpack(color_ranges))
		else
			for _, color_range in ipairs(color_ranges) do
				self._info_text:set_range_color(color_range.start, color_range.stop, color_range.color)
			end
		end
	end

	local _, _, _, h = self._info_text:text_rect()

	self._info_text:set_h(h)

	local min_font_size = math.max(math.min(6, default_font_size), math.ceil(default_font_size * 0.7))

	if self._info_panel:parent():h() < self._info_text:bottom() then
		local font_size = self._info_text:font_size()

		while self._info_panel:parent():h() < self._info_text:bottom() and min_font_size < font_size do
			self._info_text:set_font_size(font_size)

			local _, _, _, h = self._info_text:text_rect()

			self._info_text:set_h(h)

			font_size = font_size - 1
		end

		if not recursive and self._info_panel:parent():h() < self._info_text:bottom() then
			print("[PlayerInventoryGui] Info text dynamic font sizer failed")

			local x = self._info_text:world_left() + 1
			local y = self._info_panel:parent():world_bottom() - self._info_text:line_height()
			local index = self._info_text:point_to_index(x, y)
			local text = self._info_text:text()
			text = utf8.sub(text, 1, index)
			local last = utf8.sub(text, -1)

			while last == " " or last == "\n" do
				last = utf8.sub(text, -2, -1)

				if last ~= "." then
					text = utf8.sub(text, 1, -2)
				end
			end

			text = text .. "..."

			return self:set_info_text(text, color_ranges, true)
		end
	end

	self._info_panel:set_top(self._info_text:bottom())
	self._info_panel:set_h(self._info_panel:parent():h() - self._info_panel:top())
end

function PlayerInventoryGui:_get_melee_weapon_stats(name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local stats_data = managers.blackmarket:get_melee_weapon_stats(name)
	local multiple_of = {}
	local has_non_special = managers.player:has_category_upgrade("player", "non_special_melee_multiplier")
	local has_special = managers.player:has_category_upgrade("player", "melee_damage_multiplier")
	local non_special = managers.player:upgrade_value("player", "non_special_melee_multiplier", 1) - 1
	local special = managers.player:upgrade_value("player", "melee_damage_multiplier", 1) - 1

	for i, stat in ipairs(self._stats_shown) do
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
		elseif stat.name == "attack_speed" then
			local base = tweak_data.blackmarket.melee_weapons[name] and tweak_data.blackmarket.melee_weapons[name].repeat_expire_t and tweak_data.blackmarket.melee_weapons[name].repeat_expire_t / (tweak_data.blackmarket.melee_weapons[name].anim_speed_mult or 1)
			base = base / (tweak_data.blackmarket.melee_weapons[name].speed_mult or 1)
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
			base = base / (tweak_data.blackmarket.melee_weapons[name].speed_mult or 1)
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
		elseif stat.name == "charge_time" then
			local base = stats_data.charge_time
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

	for i, stat in ipairs(self._stats_shown) do
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

function PlayerInventoryGui:_get_armor_stats(name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data({
		armors = name
	}, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	detection_risk = math.round(detection_risk * 100)
	local bm_armor_tweak = tweak_data.blackmarket.armors[name]
	local upgrade_level = bm_armor_tweak.upgrade_level

	for i, stat in ipairs(self._stats_shown) do
		base_stats[stat.name] = {
			value = 0
		}
		mods_stats[stat.name] = {
			value = 0
		}
		skill_stats[stat.name] = {
			value = 0
		}

		if stat.name == "armor" then
			local base = tweak_data.player.damage.ARMOR_INIT
			local mod = managers.player:body_armor_value("armor", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = (base_stats[stat.name].value + managers.player:body_armor_skill_addend(name) * tweak_data.gui.stats_present_multiplier) * managers.player:body_armor_skill_multiplier(name) - base_stats[stat.name].value
			}
		elseif stat.name == "health" then
			local base = tweak_data.player.damage.HEALTH_INIT
			local mod = managers.player:health_skill_addend()
			base_stats[stat.name] = {
				value = (base + mod) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = base_stats[stat.name].value * managers.player:health_skill_multiplier() - base_stats[stat.name].value
			}
		elseif stat.name == "concealment" then
			base_stats[stat.name] = {
				value = managers.player:body_armor_value("concealment", upgrade_level)
			}
			skill_stats[stat.name] = {
				value = managers.blackmarket:concealment_modifier("armors", upgrade_level)
			}
		elseif stat.name == "movement" then
			local base = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 100 * tweak_data.gui.stats_present_multiplier
			local movement_penalty = managers.player:body_armor_value("movement", upgrade_level)
			local base_value = movement_penalty * base
			base_stats[stat.name] = {
				value = base_value
			}
			local skill_mod = managers.player:movement_speed_multiplier(false, false, upgrade_level, 1)
			local val = base * skill_mod
			val = Utl.round(val, 2)
			base_value = Utl.round(base_value, 2)
			local skill_value = val - base_value
			skill_stats[stat.name] = {
				value = skill_value,
				skill_in_effect = skill_value > 0
			}
		elseif stat.name == "dodge" then
			local base = 0
			local mod = managers.player:body_armor_value("dodge", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * 100
			}
			skill_stats[stat.name] = {
				value = managers.player:skill_dodge_chance(false, false, false, name, detection_risk) * 100
			}
		elseif stat.name == "deflection" then
			local base = 0
			local mod = managers.player:body_armor_value("deflection", upgrade_level, 0)
			base_stats[stat.name] = {value = (base + mod) * 100}
			skill_stats[stat.name] = {value = managers.player:get_deflection_from_skills() * 100}
		elseif stat.name == "damage_shake" then
			local base = tweak_data.gui.armor_damage_shake_base
			local mod = math.max(managers.player:body_armor_value("damage_shake", upgrade_level, nil, 1), 0.01)
			local skill = math.max(managers.player:upgrade_value("player", "damage_shake_multiplier", 1), 0.01)
			local base_value = base
			local mod_value = base / mod - base_value
			local skill_value = base / mod / skill - base_value - mod_value + managers.player:upgrade_value("player", "damage_shake_addend", 0)
			base_stats[stat.name] = {
				value = (base_value + mod_value) * tweak_data.gui.stats_present_multiplier
			}
			skill_stats[stat.name] = {
				value = skill_value * tweak_data.gui.stats_present_multiplier
			}
		elseif stat.name == "stamina" then
			local stamina_data = tweak_data.player.movement_state.stamina
			local base = stamina_data.STAMINA_INIT
			local mod = managers.player:body_armor_value("stamina", upgrade_level)
			local skill = managers.player:stamina_multiplier()
			local base_value = base
			local mod_value = base * mod - base_value
			local skill_value = base * mod * skill - base_value - mod_value
			base_stats[stat.name] = {
				value = base_value + mod_value
			}
			skill_stats[stat.name] = {
				value = skill_value
			}
		elseif stat.name == "crit" then
			local base = 0
			local mod = managers.player:body_armor_value("crit", upgrade_level)
			base_stats[stat.name] = {
				value = (base + mod) * 100
			}
			skill_stats[stat.name] = {
				value = managers.player:critical_hit_chance(detection_risk) * 100
			}
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

function PlayerInventoryGui:setup_player_stats(panel)
	local data = {
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
			name = "dodge",
			procent = true,
			revert = true
		},
		{
			index = true,
			name = "concealment"
		},
		{
			procent = true,
			name = "movement"
		},
		{
			name = "stamina"
		},
		{
			name = "crit",
			procent = true,
			revert = true
		}
	}
	local stats_panel = panel:child("stats_panel")

	if alive(stats_panel) then
		panel:remove(stats_panel)

		stats_panel = nil
	end

	stats_panel = panel:panel({
		name = "stats_panel"
	})
	local panel = stats_panel:panel({
		h = 20,
		layer = 1,
		w = stats_panel:w()
	})
	self._player_stats_shown = data
	self._player_stats_titles = {
		total = stats_panel:text({
			x = 135,
			layer = 2,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_total"))
		}),
		base = stats_panel:text({
			alpha = 0.75,
			x = 200,
			layer = 2,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))
		}),
		skill = stats_panel:text({
			alpha = 0.75,
			x = 259,
			layer = 2,
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.resource,
			text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))
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
			size = 60,
			name = "total",
			align = "right"
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
		}
	}
	self._player_stats_texts = {}
	self._player_stats_panel = stats_panel:panel()

	for i, stat in ipairs(data) do
		panel = self._player_stats_panel:panel({
			name = "weapon_stats",
			h = 20,
			x = 0,
			layer = 1,
			y = y,
			w = self._player_stats_panel:w()
		})

		if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
			panel:rect({
				name = tostring(i),
				color = Color.black:with_alpha(0.4)
			})
		end

		x = 2
		y = y + 20
		self._player_stats_texts[stat.name] = {}

		for _, column in ipairs(text_columns) do
			text_panel = panel:panel({
				layer = 0,
				x = x,
				w = column.size,
				h = panel:h()
			})
			self._player_stats_texts[stat.name][column.name] = text_panel:text({
				text = "0",
				layer = 1,
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				align = column.align,
				alpha = column.alpha,
				blend_mode = column.blend,
				color = column.color or tweak_data.screen_colors.text
			})
			x = x + column.size

			if column.name == "name" then
				self._player_stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("bm_menu_" .. stat.name))
			end
		end
	end
end

function PlayerInventoryGui:_update_info_weapon(name)
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = name == "primary" and "primaries" or "secondaries"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local equipped_slot = managers.blackmarket:equipped_weapon_slot(category)
	local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(equipped_item.weapon_id, category, equipped_slot)
	local text_string = string.format("##%s##  %s", player_loadout_data[name].info_text, managers.experience:cash_string(managers.money:get_weapon_slot_sell_value(category, equipped_slot)))

	self:set_info_text(text_string, {
		player_loadout_data[name].info_text_color or tweak_data.screen_colors.text,
		add_colors_to_text_object = true
	})

	local tweak_stats = tweak_data.weapon.stats
	local modifier_stats = tweak_data.weapon[equipped_item.weapon_id].stats_modifiers

	for _, stat in ipairs(self._stats_shown) do
		self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

		local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
		local base = base_stats[stat.name].value

		self._stats_texts[stat.name].total:set_alpha(1)
		self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
		self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
		self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
		self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")

		if base < value then
			self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
		elseif value < base then
			self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
		else
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end

		if stat.percent then
			if math.round(value) >= 100 then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
			end
		elseif stat.name == "concealment" then --Sets concealment text to purple when maxed.
			if base_stats.concealment.value + mods_stats.concealment.value + skill_stats.concealment.value >= tweak_data.concealment_cap then
				self._stats_texts.concealment.total:set_color(tweak_data.screen_colors.stat_maxed)
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

function PlayerInventoryGui:_update_info_melee(name)
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = "melee_weapons"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local base_stats, mods_stats, skill_stats = self:_get_melee_weapon_stats(equipped_item)
	local text_string = string.format("%s", player_loadout_data.melee_weapon.info_text)

	self:set_info_text(text_string)

	local value, value_min, value_max = nil

	for _, stat in ipairs(self._stats_shown) do
		if stat.range then
			value_min = math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
			value_max = math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
		end

		value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
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
			value = value / 100
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

		self._stats_texts[stat.name].total:set_alpha(1)
		self._stats_texts[stat.name].total:set_text(equip_text)
		self._stats_texts[stat.name].base:set_text(base_text)
		self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. skill_text or "")

		local positive = value ~= 0 and base < value
		local negative = value ~= 0 and value < base

		if stat.inverse then
			local temp = positive
			positive = negative
			negative = temp
		end

		if stat.range then
			if positive then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
			elseif negative then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
			end
		elseif positive then
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
		elseif negative then
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
		else
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end
	end
end

function PlayerInventoryGui:_update_stats(name)
	if name == self._current_stat_shown then
		return
	end

	self._current_stat_shown = name

	self:set_info_text("")
	self._info_panel:clear()

	if name == "primary" or name == "secondary" then
		local stats = {
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
			}
		}

		table.insert(stats, {
			inverted = true,
			name = "reload"
		})
		self:set_weapon_stats(self._info_panel, stats)
		self:_update_info_weapon(name)
	elseif name == "outfit_armor" then
		self:_update_info_armor(name)
	elseif name == "outfit_player_style" then
		self:_update_info_player_style(name)
	elseif name == "melee" then
		self:set_melee_stats(self._info_panel, {
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
				name = "attack_speed",
				num_decimals = 1,
				suffix = managers.localization:text("menu_seconds_suffix_short")
			},
			{
				inverse = true,
				name = "charge_time",
				num_decimals = 1,
				suffix = managers.localization:text("menu_seconds_suffix_short")
			},
			{
				inverse = true,
				name = "impact_delay",
				num_decimals = 1,
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
		})
		self:_update_info_melee(name)
	elseif name == "skilltree" then
		local skilltrees = {}

		for _, tree in ipairs(tweak_data.skilltree.skill_pages_order) do
			table.insert(skilltrees, {
				name = tree,
				name_s = managers.localization:to_upper_text(tweak_data.skilltree.skilltree[tree].name_id)
			})
		end

		self:set_skilltree_stats(self._info_panel, skilltrees)
		self:_update_info_skilltree(name)
	elseif name == "specialization" then
		self:_update_info_specialization(name)
	elseif name == "character" then
		self:_update_info_character(name)
	elseif name == "mask" then
		self:_update_info_mask(name)
	elseif name == "throwable" then
		self:_update_info_throwable(name)
	elseif name == "deployable_primary" then
		self:_update_info_deployable(name, 1)
	elseif name == "deployable_secondary" then
		self:_update_info_deployable(name, 2)
	elseif name == "infamy" then
		self:_update_info_infamy(name)
	elseif name == "crew" then
		self:_update_info_crew(name)
	else
		local box = self._boxes_by_name[name]
		local stats = {
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
			}
		}

		table.insert(stats, {
			inverted = true,
			name = "reload"
		})

		if box and box.params and box.params.mod_data then
			if box.params.mod_data.selected_tab == "weapon_cosmetics" then
				local cosmetics = managers.blackmarket:get_weapon_cosmetics(box.params.mod_data.category, box.params.mod_data.slot)

				if cosmetics then
					local c_td = tweak_data.blackmarket.weapon_skins[cosmetics.id] or {}

					if c_td.default_blueprint then
						self:set_weapon_stats(self._info_panel, stats)
					end

					self:_update_info_weapon_cosmetics(name, cosmetics)
				end
			else
				self:set_weapon_mods_stats(self._info_panel, stats)
				self:_update_info_weapon_mod(box)
			end
		else
			self:_update_info_generic(name)
		end
	end
end

function PlayerInventoryGui:_update_info_weapon_cosmetics(name, cosmetics)
	local c_td = tweak_data.blackmarket.weapon_skins[cosmetics.id] or {}
	local quality_id = tweak_data.economy.qualities[cosmetics.quality] and tweak_data.economy.qualities[cosmetics.quality].name_id and cosmetics.quality or "mint"
	local quality_text = managers.localization:text(tweak_data.economy.qualities[quality_id].name_id)
	local name_text = managers.localization:text(c_td.name_id)
	local info_text = managers.localization:to_upper_text("menu_cash_safe_result", {
		quality = quality_text,
		name = name_text
	})

	if cosmetics.bonus then
		local bonus = tweak_data.blackmarket.weapon_skins[cosmetics.id] and tweak_data.blackmarket.weapon_skins[cosmetics.id].bonus

		if bonus and not c_td.default_blueprint then
			local bonus_tweak = tweak_data.economy.bonuses[bonus]
			local bonus_value = bonus_tweak.exp_multiplier and bonus_tweak.exp_multiplier * 100 - 100 .. "%" or bonus_tweak.money_multiplier and bonus_tweak.money_multiplier * 100 - 100 .. "%"
			info_text = info_text .. "\n" .. managers.localization:text("dialog_new_tradable_item_bonus", {
				bonus = managers.localization:text(bonus_tweak.name_id, {
					team_bonus = bonus_value
				})
			})
		end
	end

	self:set_info_text(info_text, {
		tweak_data.economy.rarities[c_td.rarity].color,
		add_colors_to_text_object = true
	})

	if c_td.default_blueprint then
		local box = self._boxes_by_name[name]
		local category = box.params.mod_data.category
		local slot = box.params.mod_data.slot
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(c_td.weapon_id, category, slot, c_td.default_blueprint)
		local crafted = managers.blackmarket:get_crafted_category_slot(category, slot)
		local tweak_stats = tweak_data.weapon.stats
		local modifier_stats = tweak_data.weapon[crafted.weapon_id].stats_modifiers

		for _, stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))

			local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			local base = base_stats[stat.name].value

			self._stats_texts[stat.name].total:set_alpha(1)
			self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
			self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
			self._stats_texts[stat.name].mods:set_text(mods_stats[stat.name].value == 0 and "" or (mods_stats[stat.name].value > 0 and "+" or "") .. format_round(mods_stats[stat.name].value, stat.round_value))
			self._stats_texts[stat.name].skill:set_text(skill_stats[stat.name].skill_in_effect and (skill_stats[stat.name].value > 0 and "+" or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")

			if base < value then
				self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_negative or tweak_data.screen_colors.stats_positive)
			elseif value < base then
				self._stats_texts[stat.name].total:set_color(stat.inverted and tweak_data.screen_colors.stats_positive or tweak_data.screen_colors.stats_negative)
			else
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
			end

			if stat.percent then
				if math.round(value) >= 100 then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
				end
			elseif stat.index then
				-- Nothing
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
end

--Colored desc support
function PlayerInventoryGui:_update_info_throwable(name)
	local throwable_id, amount = managers.blackmarket:equipped_projectile()
	local projectile_data = throwable_id and tweak_data.blackmarket.projectiles[throwable_id]
	local text_string = ""

	if projectile_data then
		local is_perk_throwable = tweak_data.blackmarket.projectiles[throwable_id].base_cooldown and not tweak_data.blackmarket.projectiles[throwable_id].base_cooldown_no_perk
		local amount = is_perk_throwable and 1 or math.round(tweak_data.blackmarket.projectiles[throwable_id].max_amount *  managers.player:upgrade_value("player", "throwables_multiplier", 1))
		local has_short_desc = managers.localization:exists(projectile_data.desc_id .. "_short")

		text_string = text_string .. managers.localization:text(projectile_data.name_id) .. " (x" .. tostring(amount) .. ")" .. "\n\n"

		if self:_should_show_description() then
			text_string = text_string .. managers.localization:text((has_short_desc and projectile_data.desc_id .. "_short") or projectile_data.desc_id) .. "\n"
		end
	end

	local resource_color = {}
	for color_id in string.gmatch(text_string, "#%{(.-)%}#") do
		table.insert(resource_color, tweak_data.screen_colors[color_id])
	end
	text_string = text_string:gsub("#%{(.-)%}#", "##")

	self:set_info_text(text_string, nil, nil, resource_color)
end

function PlayerInventoryGui:_update_info_specialization(name)
	local text_string = ""
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	local specialization_data = tweak_data.skilltree.specializations[current_specialization]

	if specialization_data then
		local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
		local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
		text_string = managers.localization:text(specialization_data.name_id) .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")\n"

		if current_tier < max_tier then
			local current_points = managers.skilltree:get_specialization_value(current_specialization, "tiers", "next_tier_data", "current_points")
			local points = managers.skilltree:get_specialization_value(current_specialization, "tiers", "next_tier_data", "points")
			text_string = text_string .. managers.localization:text("menu_st_progress", {
				progress = string.format("%i/%i", current_points, points)
			}) .. "\n"
		end

		if self:_should_show_description() and specialization_data.desc_id then
			text_string = text_string .. "\n" .. managers.localization:text(specialization_data.desc_id)
		end
	end
	
	local resource_color = {}
	for color_id in string.gmatch(text_string, "#%{(.-)%}#") do
		table.insert(resource_color, tweak_data.screen_colors[color_id])
	end
	text_string = text_string:gsub("#%{(.-)%}#", "##")

	self:set_info_text(text_string, nil, nil, resource_color)
end

function PlayerInventoryGui:_update_info_deployable(name, slot)
	local deployable_id = managers.blackmarket:equipped_deployable(slot)
	local equipment_data = deployable_id and tweak_data.equipments[deployable_id]
	local deployable_data = deployable_id and tweak_data.blackmarket.deployables[deployable_id]
	local text_string = ""

	if deployable_data and equipment_data then
		local amount = equipment_data.quantity[1] or 1
		local amount_2 = nil
		local has_short_desc = managers.localization:exists(deployable_data.desc_id .. "_short")
		local deployable_uses = nil

		if deployable_id == "doctor_bag" then
			deployable_uses = tweak_data.upgrades.doctor_bag_base + (managers.player:equiptment_upgrade_value(deployable_id, "amount_increase") or 0)
		elseif deployable_id == "ammo_bag" then
			deployable_uses = tweak_data.upgrades.ammo_bag_base + (managers.player:equiptment_upgrade_value(deployable_id, "ammo_increase") or 0)
		elseif deployable_id == "trip_mine" then
			amount_2 = (equipment_data.quantity[2] or 1) + (managers.player:equiptment_upgrade_value("shape_charge", "quantity") or 0)
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

		amount = amount + (managers.player:equiptment_upgrade_value(deployable_id, "quantity") or 0)

		if slot and slot > 1 then
			amount = math.ceil(amount / 2)
			if amount_2 then
				amount_2 = math.ceil(amount_2 / 2)
			end
		end

		text_string = text_string .. managers.localization:text(deployable_data.name_id) .. " (x" .. tostring(amount) .. (amount_2 and ( "|x" .. tostring(amount_2)) or "" ) .. ")" .. "\n\n"

		if self:_should_show_description() then
			text_string = text_string .. managers.localization:text(((has_short_desc and deployable_data.desc_id .. "_short") or deployable_data.desc_id), {
				BTN_INTERACT = managers.localization:btn_macro("interact", true),
				BTN_USE_ITEM = managers.localization:btn_macro("use_item", true),
				deployable_uses = deployable_uses
			}) .. "\n"
		end
	end

	local resource_color = {}
	for color_id in string.gmatch(text_string, "#%{(.-)%}#") do
		table.insert(resource_color, tweak_data.screen_colors[color_id])
	end
	text_string = text_string:gsub("#%{(.-)%}#", "##")

	self:set_info_text(text_string, nil, nil, resource_color)
end