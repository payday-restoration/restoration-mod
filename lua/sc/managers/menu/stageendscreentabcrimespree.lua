-- Display bags as additional earned crime spree levels
Hooks:PostHook(CrimeSpreeResultTabItem, "_create_level", "sh__create_level", function (self, total_w)
	local bonus_bags = math.min(managers.loot:get_secured_bags_amount(), 10)
	if not self:success() or bonus_bags <= 0 then
		return
	end

	local gain = self._level_panel:child("gain")
	local gain_x = gain:center_x()

	local font = tweak_data.menu.pd2_small_font
	local font_size = tweak_data.menu.pd2_small_font_size
	local color = tweak_data.screen_colors.regular_color
	local bonus = self._level_panel:text({
		blend_mode = "add",
		vertical = "center",
		alpha = 0,
		align = "center",
		layer = 10,
		text = managers.localization:text("hud_stats_bags_secured"):pretty(true),
		h = font_size,
		font_size = font_size,
		font = font,
		color = color
	})

	self:make_fine_text(bonus)
	bonus:set_center_x(gain_x)
	bonus:set_top(gain:bottom() + 10)

	local bonus_amt = self._level_panel:text({
		vertical = "center",
		blend_mode = "add",
		w = 200,
		align = "center",
		alpha = 0,
		layer = 10,
		text = "+" .. managers.localization:text("menu_cs_level", {
			level = bonus_bags
		}),
		h = font_size,
		font_size = font_size,
		font = font,
		color = color
	})

	bonus_amt:set_center_x(gain_x)
	bonus_amt:set_top(bonus:bottom())

	table.insert(self._levels.bonuses, math.max(#self._levels.bonuses - 1, 1), {
		bonus,
		bonus_amt,
		bonus_bags
	})
end)