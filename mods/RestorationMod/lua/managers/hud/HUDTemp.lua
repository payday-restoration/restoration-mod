if restoration.Options:GetValue("HUD/Bag") then
function HUDTemp:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("temp_panel") then
		self._hud_panel:remove(self._hud_panel:child("temp_panel"))
	end
	self._temp_panel = self._hud_panel:panel({
		visible = true,
		name = "temp_panel",
		y = 0,
		valign = "scale",
		layer = 0
	})
	
--Missing lines start here
	local throw_instruction = self._temp_panel:text({
		visible = false,
		vertical = "bottom",
		h = 40,
		w = 300,
		alpha = 0.85,
		align = "right",
		name = "throw_instruction",
		layer = 1,
		text = "",
		font = "fonts/font_medium_mf",
		y = 2,
		halign = "right",
		font_size = 24,
		x = 8,
		valign = "bottom",
		color = Color.white
	})

	self:set_throw_bag_text()
--Missing lines end here
	
	local bag_panel = self._temp_panel:panel({
		visible = false,
		name = "bag_panel",
		halign = "right",
		valign = "bottom",
		layer = 10
	})
	
	local carry_bag = bag_panel:bitmap( { name = "carry_bag", texture_rect = { 28, 52, 201, 161 }, layer = 1, visible = true, halign = "scale", valign = "scale", texture = "guis/textures/restoration/icon_carrybag", color = Color.white, alpha = 1} )
	carry_bag:set_size( carry_bag:w() * 0.5, carry_bag:h() * 0.5 )
	bag_panel:set_size( carry_bag:size() )
	local bag_text = bag_panel:text({
		name = "bag_text",
		visible = true,
		text = "JEWELRY\n$250,000",
		font = "fonts/font_medium_noshadow_mf",
		align = "center",
		vertical = "center",
		font_size = 42,
		layer = 2,
		halign = "scale",
		valign = "scale",
		color = Color.black,
		w = 256,
		h = 128
	})
	bag_text:set_size(bag_panel:size())
	bag_text:set_position( 0, 4 )
	self._bag_panel_w = bag_panel:w()
	self._bag_panel_h = bag_panel:h()
	carry_bag:set_size( bag_panel:size() )
	bag_panel:set_right(self._temp_panel:w())
	bag_panel:set_bottom( self._temp_panel:h() - 152 )
	self._curr_stamina = 0
	self._max_stamina = 0
	self._stamina_panel = self._temp_panel:panel({
		visible = true,
		name = "stamina_panel",
		layer = 0,
		w = 16,
		h = 128,
		halign = "right",
		valign = "center",
		alpha = 1
	})
	local stamina_bar_bg = self._stamina_panel:rect({
		name = "stamina_bar_bg",
		color = Color(0.6, 0.6, 0.6),
		alpha = 0.25
	})
	local low_stamina_bar = self._stamina_panel:rect({
		name = "low_stamina_bar",
		color = Color(0.6, 0.6, 0.6),
		alpha = 0
	})
	local stamina_bar = self._stamina_panel:rect({
		name = "stamina_bar",
		color = Color(0.6, 0.6, 0.6),
		layer = 1
	})
	local stamina_threshold = self._stamina_panel:rect({
		name = "stamina_threshold",
		color = Color(1, 1, 1),
		layer = 2,
		h = 2
	})
	self._stamina_panel:rect({
		name = "top_border",
		color = Color(),
		layer = 3,
		h = 2
	}):set_top(0)
	self._stamina_panel:rect({
		name = "bottom_border",
		color = Color(),
		layer = 3,
		h = 2
	}):set_bottom(128)
	self._stamina_panel:rect({
		name = "left_border",
		color = Color(),
		layer = 3,
		w = 2
	}):set_left(0)
	self._stamina_panel:rect({
		name = "right_border",
		color = Color(),
		layer = 3,
		w = 2
	}):set_right(16)
	self._stamina_panel:set_right(self._temp_panel:w())
	self._stamina_panel:set_center_y(self._temp_panel:center_y())
end

--Missing function
function HUDTemp:set_throw_bag_text()
	self._temp_panel:child("throw_instruction"):set_text(utf8.to_upper(managers.localization:text("hud_instruct_throw_bag", {BTN_USE_ITEM = managers.localization:btn_macro("use_item")})))
end

end
