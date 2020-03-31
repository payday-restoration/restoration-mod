if not restoration.Options:GetValue("HUD/UI/Crimenet") then return end

local function round_gui_object(object)
    if alive(object) then
        local x, y = object:world_position()

        object:set_world_position(math.round(x), math.round(y))

        if object.children then
            for i, d in ipairs(object:children()) do
                round_gui_object(d)
            end
        end
    end
end

function MenuNodeCrimenetGui:init( node, layer, parameters )
	
	parameters.font = tweak_data.menu.default_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "normal"
	parameters.row_item_color = tweak_data.screen_color_yellow:with_alpha(0.6)
	parameters.row_item_hightlight_color = tweak_data.screen_color_yellow --/0.6
	parameters.marker_alpha = 0.1
	parameters.to_upper = false
	
	MenuNodeCrimenetGui.super.init( self, node, layer, parameters )
end

function MenuNodeCrimenetFiltersGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_medium_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	--parameters.halign = "center"
	parameters.row_item_blend_mode = "normal"
	parameters.row_item_color = tweak_data.screen_color_yellow:with_alpha(0.6)
	parameters.row_item_hightlight_color = tweak_data.screen_color_yellow
	parameters.marker_alpha = 0.1
	parameters.to_upper = false
	self.static_y = node:parameters().static_y
	MenuNodeCrimenetFiltersGui.super.init(self, node, layer, parameters)
end
function MenuNodeCrimenetFiltersGui:_setup_item_panel(safe_rect, res)
	MenuNodeCrimenetFiltersGui.super._setup_item_panel(self, safe_rect, res)
	local max_layer = 10000
	local min_layer = 0
	local child_layer = 0
	for _, child in ipairs(self.item_panel:children()) do
		child:set_halign("right")
		child_layer = child:layer()
		if child_layer > 0 then
			min_layer = math.min(min_layer, child_layer)
		end
		max_layer = math.max(max_layer, child_layer)
	end
	for _, child in ipairs(self.item_panel:children()) do
	end
	self.item_panel:set_w(safe_rect.width * (1 - self._align_line_proportions))
	self.item_panel:set_center(self.item_panel:parent():w() / 2, self.item_panel:parent():h() / 2)
	local static_y = self.static_y and safe_rect.height * self.static_y
	if static_y and static_y < self.item_panel:y() then
		self.item_panel:set_y(static_y)
	end
	self.item_panel:set_position(math.round(self.item_panel:x()), math.round(self.item_panel:y()))
	round_gui_object(self.item_panel)
	if alive(self.box_panel) then
		self.item_panel:parent():remove(self.box_panel)
		self.box_panel = nil
	end
	self.box_panel = self.item_panel:parent():panel()
	self.box_panel:set_x(self.item_panel:x())
	self.box_panel:set_w(self.item_panel:w())
	if self.item_panel:h() > self._align_data.panel:h() then
		self.box_panel:set_y(0)
		self.box_panel:set_h(self.item_panel:parent():h())
	else
		self.box_panel:set_y(self.item_panel:top())
		self.box_panel:set_h(self.item_panel:h())
	end
	self.box_panel:grow(20, 20)
	self.box_panel:move(-10, -10)
	self.box_panel:set_layer(51)
	self.boxgui = BoxGuiObject:new(self.box_panel, {
		sides = {
			0,
			0,
			0,
			0
		}
	})
	self.boxgui:set_clipping(false)
	self.boxgui:set_layer(1000)
	self.box_panel:rect({
		color = Color.black,
		alpha = 0.8,
		rotation = 360
	})
	self._align_data.panel:set_left(self.box_panel:left())
	self._list_arrows.up:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.up:set_world_top(self._align_data.panel:world_top() - 10)
	self._list_arrows.up:set_width(self.box_panel:width())
	self._list_arrows.up:set_rotation(360)
	self._list_arrows.up:set_layer(1050)
	self._list_arrows.down:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.down:set_world_bottom(self._align_data.panel:world_bottom() + 10)
	self._list_arrows.down:set_width(self.box_panel:width())
	self._list_arrows.down:set_rotation(360)
	self._list_arrows.down:set_layer(1050)
	self:_set_topic_position()
	self.box_panel:polyline( { 
	color=tweak_data.screen_color_blue:with_alpha(0.5), 
	blend_mode="add", 
	line_width=1, 
	closed=true, 
	points={ Vector3( 0, 0, 0 ), 
	Vector3( self.box_panel:w(), 0, 0 ), 
	Vector3( self.box_panel:w(), self.box_panel:h(), 0 ), 
	Vector3( 0, self.box_panel:h(), 0 ) } } )
	
	self.item_panel:polyline( { 
	color=tweak_data.screen_color_blue:with_alpha(0.5), 
	blend_mode="add", 
	line_width=1, 
	closed=true, 
	points={ Vector3( 0, 0, 0 ), 
	Vector3( self.item_panel:w(), 0, 0 ), 
	Vector3( self.item_panel:w(), self.item_panel:h(), 0 ), 
	Vector3( 0, self.item_panel:h(), 0 ) } } )
end

--[[function MenuNodeCrimenetSpecialGui:_setup_item_panel(safe_rect, res)
	MenuNodeCrimenetSpecialGui.super._setup_item_panel(self, safe_rect, res)
	if alive(self.item_panel:parent():child("special_title_text")) then
		self.item_panel:parent():remove(self.item_panel:parent():child("special_title_text"))
	end
	local title_text = self.item_panel:parent():text({
		name = "special_title_text",
		text = managers.localization:to_upper_text("menu_cn_contract_broker_title"),
		font = tweak_data.menu.medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = tweak_data.screen_color_yellow,
		blend_mode = "add",
		layer = 51
	})
	self:make_fine_text(title_text)
	title_text:set_left(self.box_panel:left())
	title_text:set_bottom(self.box_panel:top())
	local active_menu = managers.menu:active_menu()
	if active_menu then
		active_menu.input:set_force_input(true)
	end
end]]


function MenuNodeCrimenetContactInfoGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.default_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "normal"
	parameters.row_item_color = tweak_data.screen_color_yellow:with_alpha(0.6)
	parameters.row_item_hightlight_color = tweak_data.screen_color_yellow
	parameters.marker_alpha = 0.1
	parameters.to_upper = true
	self._codex_text = managers.localization:to_upper_text(self.CODEX_TEXT_ID)
	self._current_file = 0
	self._sound_source = SoundDevice:create_source(self.SOUND_SOURCE_NAME)
	local active_menu = managers.menu:active_menu()
	if active_menu then
		active_menu.input:set_force_input(true)
	end
	self._file_icons = {}
	self._file_icons.selected = {
		0,
		0,
		17,
		23
	}
	self._file_icons.unselected = {
		20,
		0,
		17,
		23
	}
	self._file_icons.locked = {
		40,
		0,
		17,
		23
	}
	MenuNodeCrimenetContactInfoGui.super.init(self, node, layer, parameters)
	managers.menu_component:disable_crimenet()
	self:_setup_layout()
	if not managers.menu:is_pc_controller() then
		managers.menu:active_menu().input:deactivate_controller_mouse()
	end
end

function MenuNodeCrimenetContactInfoGui:gui_node_custom(row_item)
	row_item.gui_panel = self._item_panel_parent:panel({
		layer = self.layers.items,
		w = 3,
		h = 3
	})
	row_item.gui_pd2_panel = self.ws:panel():panel({
		layer = self.layers.items
	})
	local row_item_panel = row_item.gui_pd2_panel
	row_item.gui_text = row_item_panel:text({
		font_size = tweak_data.menu.pd2_small_font_size,
		x = 0,
		y = 0,
		align = "left",
		vertical = "bottom",
		font = tweak_data.menu.default_font,
		color = tweak_data.screen_color_yellow,
		layer = 0,
		text = utf8.to_upper(row_item.text),
		blend_mode = "normal",
		render_template = Idstring("VertexColorTextured")
	})
	local _, _, w, h = row_item.gui_text:text_rect()
	row_item.gui_text:set_size(math.round(w), math.round(h))
	self._back_row_item = row_item
end
