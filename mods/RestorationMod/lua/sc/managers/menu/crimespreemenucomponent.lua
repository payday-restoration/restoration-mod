HeistWarMenuComponent = HeistWarMenuComponent or class(MenuGuiComponentGeneric)
local padding = 10
local button_size = {256, 64}
local heist_war_button = {
	btn = "BTN_START",
	pc_btn = "menu_respec_tree_all"
}
function HeistWarMenuComponent:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._init_layer = self._ws:panel():layer()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({})
	self._buttons = {}
	self:_setup()
end
function HeistWarMenuComponent:close()
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
end
function HeistWarMenuComponent:_setup()
	local parent = self._ws:panel()
	if alive(self._panel) then
		parent:remove(self._panel)
	end
	self._panel = parent:panel({
		layer = self._init_layer
	})
	self._panel:set_size(unpack(button_size))
	self._panel:set_bottom(parent:bottom() - padding * 2)
	self._panel:set_center_x(parent:center_x())
	local btn = HeistWarStartButton:new(self._panel)
	table.insert(self._buttons, btn)
	btn:set_button(crime_spree_button.btn)
	btn:set_text("Start a Heist War")
	btn:set_callback(callback(self, self, "_open_heist_war_contract"))
end

function HeistWarMenuComponent:mouse_moved(o, x, y)
	local used, pointer
	for idx, btn in ipairs(self._buttons) do
		btn:set_selected(btn:inside(x, y))
		if btn:is_selected() then
			used, pointer = true, "link"
		end
	end
	return used, pointer
end
function HeistWarMenuComponent:mouse_pressed(o, button, x, y)
	for idx, btn in ipairs(self._buttons) do
		if btn:is_selected() and btn:callback() then
			btn:callback()()
			return true
		end
	end
end
function HeistWarMenuComponent:confirm_pressed()
	self:mouse_pressed()
end
function HeistWarMenuComponent:special_btn_pressed(button)
	if button == Idstring(heist_war_button.pc_btn) then
		self:_open_heist_war_contract()
	end
end
function HeistWarMenuComponent:_open_heist_war_contract()
	managers.menu_component:post_event("menu_enter")
	local node = Global.game_settings.single_player and "crimenet_heist_war_contract_singleplayer" or "crimenet_heist_war_contract_host"
	local data = {
		{
			job_id = "run",
			professional = false,
			competitive = false,
			customize_contract = true,
			is_heist_war = true,
			contract_visuals = {}
		}
	}
	managers.menu:open_node(node, data)
end

HeistWarStartButton = HeistWarStartButton or class(MenuGuiItem)
HeistWarStartButton._type = "HeistWarStartButton"
function HeistWarStartButton:init(parent)
	self._panel = parent:panel({
		w = parent:w(),
		h = parent:h(),
		layer = 1000
	})
	self._text = self._panel:text({
		text = "",
		valign = "center",
		vertical = "center",
		align = "center",
		halign = "center",
		layer = 1,
		x = 0,
		y = 0,
		color = Color.white,
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size
	})
	self._level_text = self._panel:text({
		text = "",
		valign = "center",
		vertical = "center",
		align = "center",
		halign = "center",
		layer = 1,
		x = 0,
		y = 0,
		color = tweak_data.screen_colors.pro_color,
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_medium_large_size
	})
	self._bg = self._panel:rect({
		color = Color.black,
		alpha = 0.4,
		layer = -1
	})
	self._highlight = self._panel:rect({
		color = tweak_data.screen_colors.button_stage_3,
		blend_mode = "add",
		layer = -1
	})
	self._blur = self._panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = self._panel:w(),
		h = self._panel:h(),
		render_template = "VertexColorTexturedBlur3D",
		halign = "scale",
		valign = "scale",
		layer = -1,
		alpha = 1
	})
	BoxGuiObject:new(self._panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	self:refresh()
end
function HeistWarStartButton:refresh()
	self._bg:set_visible(not self:is_selected())
	self._highlight:set_visible(self:is_selected())
end
function HeistWarStartButton:inside(x, y)
	return self._panel:inside(x, y)
end
function HeistWarStartButton:callback()
	return self._callback
end
function HeistWarStartButton:set_callback(clbk)
	self._callback = clbk
end
function HeistWarStartButton:set_button(btn)
	self._btn = btn
end
function HeistWarStartButton:set_text(text)
	local prefix = text ~= "" and (not managers.menu:is_pc_controller() and self._btn and managers.localization:get_default_macro(self._btn) or "") or ""
	self._text:set_text(prefix .. text)
end
function HeistWarStartButton:set_level_text(text)
	self._level_text:set_text(text)
end
function HeistWarStartButton:update(t, dt)
end