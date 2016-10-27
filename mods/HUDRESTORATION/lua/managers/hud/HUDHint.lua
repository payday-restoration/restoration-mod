if restoration.Options:GetValue("HUD/MainHud") then
function HUDHint:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("hint_panel") then
		self._hud_panel:remove(self._hud_panel:child("hint_panel"))
	end
	self._hint_panel = self._hud_panel:panel({
		visible = false,
		name = "hint_panel",
		h = 30,
		y = 0,
		valign = {0.3125, 0},
		layer = 3
	})
	local y = self._hud_panel:h()/2.7
	self._hint_panel:set_center_y( y )
	self._hint_panel:text({
		name = "hint_text",
		text = "",
		font_size = 32,
		font = tweak_data.menu.medium_font_no_outline,
		color = Color.white,
		align = "center",
		vertical = "center",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._hint_panel:text( { name = "hint_shadow_text", text = "", font_size = 32, font = tweak_data.menu.medium_font_no_outline, color = Color.black, align = "center", vertical = "center", layer = 0, wrap = false, word_wrap = false, y = 1, x = 1 } )
end

function HUDHint:show(params)
	local text = params.text
	--local clip_panel = self._hint_panel:child("clip_panel")
	self._hint_panel:child("hint_text"):set_text(utf8.to_upper(""))
	self._stop = false
	self._hint_panel:stop()
	self._hint_panel:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), params.time or 3, utf8.to_upper(text))
end

function HUDHint:_animate_show(hint_panel, done_cb, seconds, text)
	local split = {}
	for i = 1, string.len( text ) do
		table.insert( split, string.sub( text, i, i ) )
	end
	local hint = ""
	-- print( inspect( split ) )
	hint_panel:set_visible( true )
	hint_panel:set_alpha( 1 )
	--local clip_panel = hint_panel:child( "clip_panel" )
	local hint_text = hint_panel:child( "hint_text" )
	local hint_shadow_text = hint_panel:child( "hint_shadow_text" )
	--local hint_text = clip_panel:child( "hint_text" )
	--local hint_shadow_text = clip_panel:child( "hint_shadow_text" )
	local t = seconds
	local cs = 0.0
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		if t < 0.5 then
			hint_panel:set_alpha( t/0.5 )
		end
		
		cs = cs - dt
		if cs < 0 and #split > 0 then
			hint = hint..table.remove( split, 1 )
			-- hint_text:set_text( string.upper( hint.."" ) )
			-- hint_shadow_text:set_text( string.upper( hint.."" ) )
			hint_text:set_text( hint.."" )
			hint_shadow_text:set_text( hint.."" )
			cs = 0.025
		end
	end
	hint_panel:set_visible( false )
	done_cb()
end

end