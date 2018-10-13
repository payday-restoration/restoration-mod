function HUDPlayerCustody:init(hud)
	self._hud = hud
	self._hud_panel = hud.panel
	if self._hud_panel:child("custody_panel") then
		self._hud_panel:remove(self._hud_panel:child("custody_panel"))
	end
	local custody_panel = self._hud_panel:panel({
		name = "custody_panel",
		halign = "grow",
		valign = "grow"
	})
	local timer_msg = custody_panel:text({
		name = "timer_msg",
		text = "something IN",
		visible = false,
		align = "center",
		vertical = "center",
		w = 400,
		h = 40,
		font = tweak_data.hud_custody.custody_font,
		font_size = tweak_data.hud_downed.timer_message_size
	})
	timer_msg:set_y( self._hud_panel:h() * 0.5 )
	timer_msg:set_text(utf8.to_upper(managers.localization:text("hud_respawning_in")))
	local _, _, w, h = timer_msg:text_rect()
	timer_msg:set_h(h)
	local timer = custody_panel:text({
		name = "timer",
		text = "00:00",
		align = "center",
		vertical = "top",
		font = "fonts/font_medium_shadow_mf",
		font_size = 32
	})

	local _, _, w, h = timer:text_rect()
	timer:set_h(h)
	self._timer = timer
	self._last_time = -1
	self._last_trade_delay_time = -1
	local civilians_killed = custody_panel:text({
		name = "civilians_killed",
		text = "Civilians killed",
		align = "center",
		vertical = "top",
		font = "fonts/font_medium_shadow_mf",
		font_size = 32
	})
	self._civ_text = "Civilians killed: 9, Negotiation delay = 12 sec."
	local trade_delay = custody_panel:text({
		name = "trade_delay",
		text = "Trade delay",
		align = "center",
		vertical = "top",
		font = "fonts/font_medium_shadow_mf",
		font_size = 32
	})
	self._hud_panel:script().text_title = self._hud_panel:child("text_title") or self._hud_panel:text({
		name = "text_title",
		color = Color.white,
		font_size = 28,
		font = "fonts/font_medium_shadow_mf",
		text = "",
		align = "right",
		vertical = "top",
		h = "32"
	})
	self._hud_panel:script().text_next_player = self._hud_panel:child("text_next_player") or self._hud_panel:text({
		name = "text_next_player",
		color = Color.white,
		font_size = 28,
		font = "fonts/font_medium_shadow_mf",
		text = "",
		align = "right",
		vertical = "top",
		h = "32"
	})
	local text_next_player = self._hud.text_next_player
	--text_next_player:set_font(Idstring(tweak_data.hud_custody.custody_font))
	--text_next_player:set_font_size(tweak_data.hud.next_player_font_size)
	local primary_attack, secondary_attack = self:_next_player_text()
	local next_player = managers.localization:text("menu_spectator_next_player", {BTN_PRIMARY = primary_attack, BTN_SECONDARY = secondary_attack})
	text_next_player:set_text(utf8.to_upper(next_player))
	local _, _, w, h = text_next_player:text_rect()
	text_next_player:set_h(h)
	text_next_player:set_right(text_next_player:parent():w())
	text_next_player:set_bottom( text_next_player:parent():h() - 152 ) -- Taken from teammate panel height
	local text_title = self._hud.text_title
	text_title:set_visible(true)
	text_title:set_text(utf8.to_upper(managers.localization:text("menu_spectator_spactating")))
	local _, _, w, h = text_title:text_rect()
	text_title:set_h(h)
	--text_title:set_font(Idstring(tweak_data.hud_custody.custody_font))
	--text_title:set_font_size(tweak_data.hud.next_player_font_size)
	text_title:set_rightbottom(text_next_player:righttop())
	text_title:set_bottom(text_title:bottom() + 4)
	local trade_text1 = self._hud.trade_text1
	--trade_text1:set_font(Idstring(tweak_data.hud_custody.custody_font))
	--trade_text1:set_font_size(tweak_data.hud_custody.font_size)
	trade_text1:set_visible(true)
	--trade_text1:set_align("right")
	--trade_text1:set_valign("bottom")
	trade_text1:set_text(utf8.to_upper(managers.localization:text("menu_spectator_being_traded")))
	local _, _, w, h = trade_text1:text_rect()
	trade_text1:set_h(h)
	trade_text1:set_y(self._hud_panel:h() / 2.5 - 32)
	local trade_text2 = self._hud.trade_text2
	--trade_text2:set_font(Idstring(tweak_data.hud_custody.custody_font))
	--trade_text2:set_font_size(tweak_data.hud_custody.font_size)
	trade_text2:set_visible(true)
	--trade_text2:set_align("right")
	--trade_text2:set_valign("bottom")
	trade_text2:set_text(utf8.to_upper(managers.localization:text("menu_spectator_being_traded_hesitant")))
	local _, _, w, h = trade_text2:text_rect()
	trade_text2:set_h(h)
	trade_text2:set_y(trade_text1:y())
	
	--[[local trade_text3 = self._hud.trade_text3
	local _,_,w,h = trade_text3:text_rect()
	trade_text3:set_h( h )
	trade_text3:set_font( Idstring( tweak_data.hud_custody.custody_font ) )
	trade_text3:set_font_size( tweak_data.hud.default_font_size )
	trade_text3:set_visible( true )
	trade_text3:set_text( utf8.to_upper( managers.localization:text( "menu_spectator_being_traded_civ_killed", {CIVS_KILLED=tostring(1), SPAWN_DELAY=tostring(12)} ) ) )
	trade_text3:set_y( self._hud_panel:h() * 0.5 )
	
	local trade_text4 = self._hud.trade_text4
	trade_text4:set_font( Idstring( tweak_data.hud_custody.custody_font ) )
	trade_text4:set_font_size( tweak_data.hud.default_font_size )
	trade_text4:set_visible( false )
	trade_text4:set_text( utf8.to_upper( managers.localization:text( "menu_spectator_respawning_in", { TIME=tostring("01:23") } ) ) )]]
	
	local _, _, w, h = civilians_killed:text_rect()
	civilians_killed:set_h(h)
	--civilians_killed:set_right(civilians_killed:parent():w())
	civilians_killed:set_y(trade_text1:bottom() + 24)
	local _, _, w, h = trade_delay:text_rect()
	trade_delay:set_h(h)
	trade_delay:set_left(civilians_killed:right())
	timer:set_y(civilians_killed:bottom() + 24)
	--trade_delay:set_y(civilians_killed:right())
end

function HUDPlayerCustody:set_negotiating_visible(visible)
	self._hud.trade_text2:set_visible(visible)
end

function HUDPlayerCustody:set_can_be_trade_visible(visible)
	self._hud.trade_text1:set_visible(visible)
end

function HUDPlayerCustody:set_civilians_killed(amount)
	self._civ_amount = amount
	local civilians_killed = self._hud_panel:child("custody_panel"):child("civilians_killed")
	
	--civilians_killed:set_text(self._civ_text)
end

function HUDPlayerCustody:set_trade_delay(time)
	if math.floor(time) == math.floor(self._last_trade_delay_time) then
		return
	end
	self._last_trade_delay_time = time
	local trade_time = time
	self._time_trade = self:_get_time_text(trade_time)
	local civilians_killed = self._hud_panel:child("custody_panel"):child("civilians_killed")
	civilians_killed:set_text( utf8.to_upper( managers.localization:text( "menu_spectator_being_traded_civ_killed", {CIVS_KILLED=tostring(self._civ_amount), SPAWN_DELAY=tostring(self._time_trade)} ) ) )
end

function HUDPlayerCustody:set_trade_delay_visible(visible)
	self._hud_panel:child("custody_panel"):child("trade_delay"):set_visible(true)
	self._hud_panel:child("custody_panel"):child("civilians_killed"):set_visible(true)
end

function HUDPlayerCustody:set_respawn_time(time)
	if math.floor(time) == math.floor(self._last_time) then
		return
	end
	self._last_time = time
	local time_text = self:_get_time_text(time)
	self._timer:set_text( utf8.to_upper( managers.localization:text( "menu_spectator_respawning_in", { TIME=tostring(time_text) } ) ) )
end
function HUDPlayerCustody:set_timer_visibility(visible)
	self._timer:set_visible(visible)
end