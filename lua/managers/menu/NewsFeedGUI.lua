if not restoration.Options:GetValue("HUD/UI/Newsfeed") then return end

function NewsFeedGui:update(t, dt)
	if not self._titles then
		return
	end

	if self._news and #self._titles > 0 then
		if self._title_panel:right() < 0 then
		-- if self._news.next <= t then
			-- CHANGE NEWS
			self._news.i = self._news.i + 1
			if self._news.i > #self._titles then
				self._news.i = 1
			end
			-- self._news.next = t + self._news.wait
			self._title_panel:child("title"):set_text(self._titles[self._news.i])
			local _,_,w,h = self._title_panel:child("title"):text_rect()
			self._title_panel:set_w(w + 10)
			self._title_panel:set_left(self._panel:w())
		else
			self._title_panel:set_right(self._title_panel:right() - dt * 80)
		end
	end
end

function NewsFeedGui:_create_gui()
	local size = managers.gui_data:scaled_size()
	local get_width = restoration.Options:GetValue("HUD/UI/NewsFeedStyle") == 1 and size.width / 2 + 180 or size.width
	self._panel = self._ws:panel():panel({
		name = "main",
		w = get_width,
		h = 28
	})
	self._panel:bitmap({
		name = "bg_bitmap",
		texture = "guis/textures/textboxbg",
		layer = 0,
		color = Color.black,
		w = self._panel:w(),
		h = self._panel:h()
	})
	self._title_panel = self._panel:panel({
		name = "title_panel",
		layer = 1
	})
	self._title_panel:text({
		name = "title",
		text = "hej",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		align="left",
		halign="left",
		vertical="center",
		hvertical="center",
		color = Color(0.75, 0.75, 0.75)
	})
	self._title_panel:set_right( -10 )

	self._panel:set_bottom( self._panel:parent():h() - 40 ) -- 635 )

	self._bottom_line = self._panel:bitmap({
		texture = "guis/textures/headershadow",
		rotation = 180,
		layer = 1,
		color = Color.white,
		w =  self._panel:w(),
		y = self._panel:h() - 2,
		blend_mode = "add"
	})
end

function NewsFeedGui:mouse_moved(x, y)
	local inside = self._panel:inside(x, y)
	self._title_panel:child("title"):set_color(inside and Color.white or Color( 0.75, 0.75, 0.75 ))
	return inside, inside and "link"
end