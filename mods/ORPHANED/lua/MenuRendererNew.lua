if Restoration.options.restoration_mrender == true then
function MenuRenderer:show_node(node)
    local gui_class = MenuNodeGui
    if node:parameters().gui_class then
   	 gui_class = CoreSerialize.string_to_classtable(node:parameters().gui_class)
    end
    local alignment
    if node:parameters().name == "jukebox_menu_playlist" or node:parameters().name == "jukebox_heist_playlist" or node:parameters().name == "base_lua_mods_menu" then
   	 alignment = "right"
    else
   	 alignment = "left"
    end
    local parameters = {
   	 font = tweak_data.menu.default_font,
   	 row_item_color = tweak_data.menu.default_font_row_item_color,
   	 row_item_hightlight_color = tweak_data.menu.default_hightlight_row_item_color,
   	 row_item_blend_mode = "normal",
   	 font_size = tweak_data.menu.default_font_size,
   	 node_gui_class = gui_class,
   	 spacing = node:parameters().spacing,
   	 marker_alpha = 0.8,
   	 marker_color = tweak_data.menu.default_font_row_item_color,    --tweak_data.screen_colors.button_stage_3:with_alpha(0.2),
   	 align = alignment or "left",
   	 to_upper = true
    }
    MenuRenderer.super.show_node(self, node, parameters)
end

function MenuRenderer:_create_framing()
    local bh = CoreMenuRenderer.Renderer.border_height
    local scaled_size = managers.gui_data:scaled_size()
    --self._bottom_line = self._main_panel:bitmap( { texture = "guis/textures/headershadow", rotation = 180, layer = 1, color = Color.white, w = scaled_size.width, y = scaled_size.height - bh, blend_mode = "add" } )
    MenuRenderer._create_bottom_text( self )
end

function MenuRenderer:_create_bottom_text()
    local scaled_size = managers.gui_data:scaled_size()
    self._bottom_text = self._main_panel:text({
   	 text = "",
   	 wrap = false,
   	 word_wrap = false,
   	 font_size = tweak_data.menu.small_font_size,
   	 align = "left",
   	 halign = "left",
   	 vertical = "bottom",
   	 hvertical = "bottom",
   	 font = tweak_data.menu.small_font,
   	 w = scaled_size.width * 0.66,
   	 layer = 2
    })
	local bh = CoreMenuRenderer.Renderer.border_height
	self._bottom_text:set_y( scaled_size.height - bh + 2)

end
end
