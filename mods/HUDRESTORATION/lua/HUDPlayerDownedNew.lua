function HUDPlayerDowned:init(hud)
	self._hud = hud
	self._hud_panel = hud.panel
	if self._hud_panel:child("downed_panel") then
		self._hud_panel:remove(self._hud_panel:child("downed_panel"))
	end
	local downed_panel = self._hud_panel:panel({
		name = "downed_panel"
	})
	--self._hud.timer:set_font(tweak_data.menu.pd2_large_font_id)
	--self._hud.timer:set_font_size(42)
	local _, _, w, h = self._hud.timer:text_rect()
	self._hud.timer:set_h(h)
	--self._hud.timer:set_y(math.round(timer_msg:bottom() - 6))
	self._hud.timer:set_center_x(self._hud_panel:center_x())
	self._hud.timer:set_center_y(self._hud_panel:center_y()/1.5)
	--[[self._hud.arrest_finished_text:set_font(Idstring(tweak_data.hud.medium_font_noshadow))
	self._hud.arrest_finished_text:set_font_size(tweak_data.hud_mask_off.text_size)
	self:set_arrest_finished_text()
	local _, _, w, h = self._hud.arrest_finished_text:text_rect()
	self._hud.arrest_finished_text:set_h(h)
	self._hud.arrest_finished_text:set_y(28)
	self._hud.arrest_finished_text:set_center_x(self._hud_panel:center_x())]]
end


function HUDPlayerDowned:on_downed()
	local downed_panel = self._hud_panel:child("downed_panel")
end
function HUDPlayerDowned:on_arrested()
	local downed_panel = self._hud_panel:child("downed_panel")
end
function HUDPlayerDowned:show_timer()
	local downed_panel = self._hud_panel:child("downed_panel")
	self._hud.timer:set_visible(true)
	self._hud.timer:set_alpha(1)
end
function HUDPlayerDowned:hide_timer()
	local downed_panel = self._hud_panel:child("downed_panel")
	--self._hud.timer:set_alpha(0.65)
end
function HUDPlayerDowned:show_arrest_finished()
	self._hud.arrest_finished_text:set_visible(true)
	local downed_panel = self._hud_panel:child("downed_panel")
	self._hud.timer:set_visible(false)
end