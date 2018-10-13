--local assault_enabled = function() return RestorationMenu._data.res_ass_global end
--log("ASSAULT IN PROGRESS" .. assault_enabled())
--if assault_enabled() == true then
if Restoration.options.restoration_assault_global == true then
HUDAssaultCorner = HUDAssaultCorner or class()

HUDAssaultCorner._custom_lines_casing = {
        "GUYS, THE THERMAL DRILL - GO GET IT",
        "I'M NOT HERE FOR YOUR ENTERTAINMENT",
        "DO YOU PLAN ON MASKING UP ANYTIME SOON?",
        "NOBODY CARED WHO I WAS, CAUSE I STILL HADN'T MASKED UP",
        "CREDITS   ///   LEGO, CGNICK, KAIL, SHATTER, SUPER MUFFIN, WOLFY, BUSHY, OLIPRO, INSANO, MELONIOUS, LAZYOZZY, PORKY-DA-CORGI, DOKTOR AKCEL, A.J. VALENTINE, TOM SEA, MUD, AND KRYMXON   ///   THANK YOU EVERYONE <3",
        "CONGRATULATIONS!  YOU ARE OUR 1000TH VISITOR!",
}
HUDAssaultCorner._custom_lines_assault = {
        "DON'T DIE",
        "JUST KEEP TAPPING",
        "SONG NAME?",
        "HOW LONG IS THIS TAPE ANYWAY?",
        "THE COPS NEED THEIR PAYDAY TOO, YOU KNOW",
        "THE SAFEWORD IS POLICE BRUTALITY",
        "IS THAT A CLOAKER BEHIND YOU",
        "TIP #003: MASK UP TO BEGIN THE HEIST",
        "TIP #021: SHOOTING COPS KILLS THEM... MOST OF THE TIME",
        "TIP #045: SHOOT THE BULLDOZER UNTIL IT DIES",
        "TIP #053: DON'T FORGET THE THERMAL DRILL",
        "TIP #069: HE-HE-HE-HE-HE",
        "TIP #081: STOP LOOKING AT ME AND SHOOT THE COPS",
        "TIP #099: THERE AREN'T ANY TIPS BEYOND 99, YOU HAVE BEEN LIED TO",
		"DRILL JAMMING IN PROGRESS",
}
HUDAssaultCorner._custom_lines_ponr = {
		"OH MY GOD, JC A BOMB",
		"GOTTA GO FAST",
		"RUN, RUN GOD DAMN IT",
}
HUDAssaultCorner._custom_line_chance = 1 -- Chance of a new line, between 0-100

HUDAssaultCorner.TAPE_SPEED = 90

function HUDAssaultCorner:HUDBGBox_animate_tape_in( tape )
	local TOTAL_T = 2
	local t = TOTAL_T
	tape:set_visible(true)
	
	local hud_panel = tape:parent():parent()
	
	managers.hud._hud_assault_corner.TAPE_SPEED = 90
	
	hud_panel:child("assault_panel"):child("text_panel"):stop()
	hud_panel:child("assault_panel"):child("text_panel"):clear()
	hud_panel:child("casing_panel"):child("text_panel"):stop()
	hud_panel:child("casing_panel"):child("text_panel"):clear()
	hud_panel:child("hostages_panel"):hide()
	
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		
		local rott = math.min( TOTAL_T - 1, t - 1 )
		local val = math.sin( math.max(rott * 180, 90) )
		
		tape:set_x(500 - val * 500)
		tape:set_y(-100 + val * 100)
		
		tape:set_rotation(val * 30)
		
		if t < (TOTAL_T-0.4) then
			managers.hud._hud_assault_corner.TAPE_SPEED = 90 + t * 400
		end
	end
	tape:set_rotation(30)
	
	tape:set_x(0)
	tape:set_y(0)
	managers.hud._hud_assault_corner.TAPE_SPEED = 90
end

function HUDAssaultCorner:HUDBGBox_animate_tape_out( tape )
	local TOTAL_T = 2
	local t = 0
	
	local hud_panel = tape:parent():parent()
	hud_panel:child("hostages_panel"):hide()
	
	managers.hud._hud_assault_corner.TAPE_SPEED = 90
	
	while t < TOTAL_T do
		local dt = coroutine.yield()
		t = t + dt
		
		local rott = math.min( TOTAL_T - 1, t - 1 )
		local val = math.sin( math.max(rott * 180, 90) )
		
		tape:set_x(500 - val * 500)
		tape:set_y(-100 + val * 100)
		
		tape:set_rotation(val * 30)
		
		if t < (TOTAL_T-0.4) then
			managers.hud._hud_assault_corner.TAPE_SPEED = 90 - (t * 1000)
		end
	end
	tape:set_visible(false)
	tape:set_rotation(30)
	
	tape:set_x(0)
	tape:set_y(0)
	
	hud_panel:child("assault_panel"):child("text_panel"):stop()
	hud_panel:child("assault_panel"):child("text_panel"):clear()
	hud_panel:child("casing_panel"):child("text_panel"):stop()
	hud_panel:child("casing_panel"):child("text_panel"):clear()
	hud_panel:child("hostages_panel"):show()
	
	managers.hud._hud_assault_corner.TAPE_SPEED = 90
end


function HUDAssaultCorner:init(hud, full_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel
	if self._hud_panel:child("assault_panel") then
		self._hud_panel:remove(self._hud_panel:child("assault_panel"))
	end
	local size = 200
	local assault_panel = self._hud_panel:panel({
		visible = false,
		name = "assault_panel",
		w = 400,
		h = 100
	})
	assault_panel:set_top(0)
	assault_panel:set_right(self._hud_panel:w())
	self._assault_color = Color( 1, 255/255, 224/255, 50/255 )
	self._assault_color_corner = Color.red
	self._assault_color_corner2 = Color.blue
	local icon_assaultbox = assault_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._assault_color:with_alpha(0.8),
		name = "icon_assaultbox",
		blend_mode = "alpha",
		visible = false,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_assaultbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_assaultbox:set_right(icon_assaultbox:parent():w())
	self._bg_box = HUDBGBox_create(assault_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0,
		visible = false
	}, {
		color = self._assault_color:with_alpha(0.8),
		blend_mode = "alpha"
	})
	self._bg_box:set_right(icon_assaultbox:left() - 3)
	local yellow_tape = assault_panel:rect({
		visible = false,
		name = "yellow_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = self._assault_color:with_alpha(0.8),
		layer = 1
	})
	--yellow_tape:set_center(300, 100)
	yellow_tape:set_rotation(30)
	yellow_tape:set_blend_mode("alpha")
	---CORNER---
	local corner = assault_panel:rect({
		visible = true,
		name = "corner",
		h = tweak_data.hud.location_font_size * 6,
		w = size * 3,
		color = self._assault_color_corner,
		layer = 0,
		x = 50,
		y = 50
	})
	local cornertext = assault_panel:rect({
		visible = false,
		name = "cornertext",
		h = tweak_data.hud.location_font_size * 1.2,
		w = size * 3,
		color = Color( 1, 255/255, 224/255, 50/255 ):with_alpha(0.5),
		layer = 0,
		x = 50,
		y = 50
	})
	corner:set_rotation(45)
	cornertext:set_rotation(45)
	local corner2 = assault_panel:rect({
		visible = true,
		name = "corner2",
		h = tweak_data.hud.location_font_size * 5,
		w = size * 3,
		color = self._assault_color_corner2,
		layer = 0,
		x = 50,
		y = 50
	})
	corner2:set_rotation(45)
	corner2:set_bottom(cornertext:top() - 35)
	corner:set_bottom(cornertext:bottom() - 30)
	local assault_title = assault_panel:text({
		name = "assault_title",
		text = managers.localization:text("menu_assault"),
		layer = 1,
		align = "center",
        vertical = "center",
		color = self._assault_color_corner2,
        font_size = tweak_data.hud_corner.assault_size,
        font = tweak_data.hud_corner.assault_font,
		visible = true
	})
    assault_title:set_rotation(45)
    assault_title:set_center(cornertext:center())
	
	assault_panel:panel({
		name = "text_panel",
		layer = 1,
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
	if self._hud_panel:child("hostages_panel") then
		self._hud_panel:remove(self._hud_panel:child("hostages_panel"))
	end
	local hostages_panel = self._hud_panel:panel({
		name = "hostages_panel",
		w = size,
		h = size,
		x = self._hud_panel:w() - size
	})
	local num_hostages = hostages_panel:text({
		name = "num_hostages",
		text = "0",
		valign = "center",
		align = "center",
		vertical = "center",
		w = 40, 
		h = 48,
		layer = 1,
		x = 0,
		y = 0,
		color = Color.white,
		font = tweak_data.menu.default_font,
		font_size = tweak_data.hud_corner.numhostages_size + 4
	})
	num_hostages:set_right(hostages_panel:w())
	local hostages_icon = hostages_panel:bitmap({
		name = "hostages_icon",
		texture = "guis/textures/pd2/hud_icon_hostage",
		valign = "top",
		layer = 1,
		x = 0,
		y = 0
	})
	hostages_icon:set_right(num_hostages:left())
	hostages_icon:set_center_y(num_hostages:h() / 2)
	if self._hud_panel:child("point_of_no_return_panel") then
		self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
	end
	local size = 200
	local point_of_no_return_panel = self._hud_panel:panel({
		visible = false,
		name = "point_of_no_return_panel",
		w = 400,
		h = 100,
	})
	self._noreturn_color = Color(1, 1, 0, 0)
   
	point_of_no_return_panel:set_top(0)
	point_of_no_return_panel:set_right(self._hud_panel:w())
   
	local red_tape = point_of_no_return_panel:rect({
		visible = false,
		name = "red_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = self._noreturn_color:with_alpha(0.8),
		layer = 1
	})
	red_tape:set_rotation(30)
	red_tape:set_blend_mode("alpha")
   
	local icon_noreturnbox = point_of_no_return_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._noreturn_color:with_alpha(0.80),
		name = "icon_noreturnbox",
		blend_mode = "alpha",
		visible = false,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_noreturnbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_noreturnbox:set_right(icon_noreturnbox:parent():w())
	self._noreturn_bg_box = HUDBGBox_create(point_of_no_return_panel, {
		w = 0,
		h = 38,
		x = 0,
		y = 0,
		visible = false
	}, {
		color = self._noreturn_color:with_alpha(0.80),
		blend_mode = "alpha"
	})
	self._noreturn_bg_box:set_right(icon_noreturnbox:left() - 3)
	local w = point_of_no_return_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
   
	point_of_no_return_panel:panel({
		name = "text_panel",
		layer = 1,
		w = red_tape:w()
	}):set_center(red_tape:center())
   
	local point_of_no_return_text = point_of_no_return_panel:text({
		name = "point_of_no_return_text",
		text = "",
		blend_mode = "alpha",
		layer = 1,
		valign = "center",
		align = "right",
		vertical = "center",
		x = 0,
		y = 0,
		color = self._noreturn_color:with_alpha(0.80),
		font_size = tweak_data.hud_corner.noreturn_size * 2,
		font = tweak_data.hud_corner.assault_font
	})
	point_of_no_return_text:set_text(utf8.to_upper(managers.localization:text("hud_assault_point_no_return_in", {time = ""})))
	point_of_no_return_text:set_size(self._noreturn_bg_box:w(), self._noreturn_bg_box:h())
	local point_of_no_return_timer = point_of_no_return_panel:text({
		name = "point_of_no_return_timer",
		text = "",
		blend_mode = "alpha",
		layer = 1,
		valign = "center",
		align = "center",
		vertical = "center",
		rotation = 30,
		x = 0,
		y = 0,
		color = self._noreturn_color:with_alpha(0.80),
		font = tweak_data.hud_custody.custody_font_large,
		font_size = 42
	})
	local _, _, w, h = point_of_no_return_timer:text_rect()
	point_of_no_return_timer:set_size(28, 28)
	point_of_no_return_timer:set_right(point_of_no_return_timer:parent():w() + 12)
	point_of_no_return_text:set_right(math.round(point_of_no_return_timer:left()))
	if self._hud_panel:child("casing_panel") then
		self._hud_panel:remove(self._hud_panel:child("casing_panel"))
	end
	local size = 200
	local casing_panel = self._hud_panel:panel({
		visible = false,
		name = "casing_panel",
		w = 400,
		h = 100,
		x = self._hud_panel:w()
	})
	casing_panel:set_top(0)
	casing_panel:set_right(self._hud_panel:w())
	self._casing_color = Color.white
	local icon_casingbox = casing_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._casing_color:with_alpha(0.80),
		name = "icon_casingbox",
		blend_mode = "alpha",
		visible = false,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_stealthbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
   
	local white_tape = casing_panel:rect({
		visible = false,
		name = "white_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = Color(0.8, 0.8, 0.8, 0.8),
		layer = 1
	})
	white_tape:set_rotation(30)
	white_tape:set_blend_mode("alpha")
   
	self._casing_bg_box = HUDBGBox_create(casing_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0,
		visible = false
	}, {
		color = self._casing_color:with_alpha(0.80),
		blend_mode = "alpha"
	})
	self._casing_bg_box:set_right(icon_casingbox:left() - 3)
	local w = casing_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	casing_panel:panel({
		name = "text_panel",
		layer = 1,
		w = white_tape:w()
	}):set_center(white_tape:center())
end

function HUDAssaultCorner:_animate_assault_corner(assault_panel)
	local corner = assault_panel:child( "corner" )
	local corner2 = assault_panel:child( "corner2" )
	local assault_title = assault_panel:child( "assault_title" )
	while true do
		local a = 0.25 + (math.sin( Application:time()*750 )+1)/4
		-- print( "a", a, 1 - a )
		corner:set_color( corner:color():with_alpha( a ) )
		corner2:set_color( corner2:color():with_alpha( 0.25 ) )
		assault_title:set_color( Color( a, 0, 0.8-a ) )
		-- o:set_color( o:color():with_alpha( 0.5 + (math.sin( Application:time()*750 )+1)/4 ) )
		coroutine.yield()
	end
end

function HUDAssaultCorner:_animate_assault(bg_box)
	local assault_panel = self._hud_panel:child("assault_panel")
	local yellow_tape = assault_panel:child("yellow_tape")
	yellow_tape:set_visible(true)
	--[[icon_assaultbox:stop()
	icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
	self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_left"), 0.75, 242, function()
	end, {
		attention_color = self._assault_color,
		attention_forever = true
	})]]
	local text_panel = assault_panel:child("text_panel")
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"))
end
function HUDAssaultCorner:_animate_text(text_panel, bg_box, color)
	local text_list = (text_panel or self._hud_panel:child("assault_panel")):script().text_list
	local text_index = 0
	local texts = {}
	local padding = 10
	local y = 15
   
	local function create_new_text(text_panel, text_list, text_index, texts)
		if texts[text_index] and texts[text_index].text then
			text_panel:remove(texts[text_index].text)
			texts[text_index] = nil
		end
		local text_id = text_list[text_index]
		local text_string = ""
		if type(text_id) == "string" then
			
			local tab = {}
			
			if self._casing then
				tab = self._custom_lines_casing
			elseif self._assault then
				tab = self._custom_lines_assault
			elseif self._point_of_no_return then
				tab = self._custom_lines_ponr
			end
			
			if #tab > 0 and text_id ~= managers.localization:to_upper_text("hud_assault_end_line") and self._custom_line_chance > math.random(100) then
				text_string = tab[math.random(#tab)]
			else
				text_string = text_id
			end
		elseif text_id == Idstring("risk") then
			for i = 1, managers.job:current_difficulty_stars() do
				text_string = text_string .. managers.localization:get_default_macro("BTN_SKULL")
			end
		end
	   
		local text = text_panel:text({
			text = text_string,
			layer = 1,
			align = "center",
			vertical = "center",
			--blend_mode = "add",
			color = Color("000000") or self._assault_color,
			font_size = tweak_data.hud_corner.assault_size * 1.1,
			font = tweak_data.hud_corner.assault_font,
			w = 10,
			h = 10
		})
		local _, _, w, h = text:text_rect()
		text:set_size(w, h)
		text:set_rotation(30)
		texts[text_index] = {
			x = text_panel:w() + w * 0.5 + padding * 2,
			text = text
		}
	end
	while true do
		local dt = coroutine.yield()
		local last_text = texts[text_index]
		if last_text and last_text.text then
			if last_text.x + last_text.text:w() * 0.5 + padding < text_panel:w() then
				text_index = text_index % #text_list + 1
				create_new_text(text_panel, text_list, text_index, texts)
			end
		else
			text_index = text_index % #text_list + 1
			create_new_text(text_panel, text_list, text_index, texts)
		end
		local speed = self.TAPE_SPEED
		for i, data in pairs(texts) do
			if data.text then
				data.x = data.x - dt * speed
				data.text:set_center_x( math.cos(30) * (data.x + 15) )
				data.text:set_center_y( math.sin(30) * (data.x - text_panel:w()*0.5 + 100) - y )
				--data.text:set_center_y(text_panel:h() * 0.5)
				if data.x + data.text:w() * math.cos(30) < 0 then
					text_panel:remove(data.text)
					data.text = nil
				end
			end
		end
	end
end
function HUDAssaultCorner:sync_start_assault(data)
	if self._point_of_no_return then
			return
	end
	self:_hide_hostages()
	if managers.job:current_difficulty_stars() > 0 then
		local ids_risk = Idstring("risk")
		self:_start_assault({
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_cover"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			ids_risk,
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_cover"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_cover"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			ids_risk,
			managers.localization:to_upper_text("hud_assault_end_line"),
		})
	else
		self:_start_assault({
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
			managers.localization:to_upper_text("hud_assault_assault"),
			managers.localization:to_upper_text("hud_assault_end_line"),
		})
	end
end
function HUDAssaultCorner:sync_end_assault(result)
	if self._point_of_no_return then
		return
	end
	self:_end_assault()
end
function HUDAssaultCorner:_start_assault(text_list)
	if self._assault then
	return end
	text_list = text_list or {""}
	local assault_panel = self._hud_panel:child("assault_panel")
	local text_panel = assault_panel:child("text_panel")
	text_panel:script().text_list = {}
	assault_panel:script().text_list = {}
	for _, text_id in ipairs(text_list) do
		table.insert(text_panel:script().text_list, text_id)
		table.insert(assault_panel:script().text_list, text_id)
	end
	self._assault = true
	if self._hud_panel:child("assault_panel"):child("text_panel") then
		self._hud_panel:child("assault_panel"):child("text_panel"):stop()
		self._hud_panel:child("assault_panel"):child("text_panel"):clear()
	else
		self._hud_panel:child("assault_panel"):panel({name = "text_panel"})
	end
	self._bg_box:child("bg"):stop()
	self._bg_box:stop()
	assault_panel:set_visible(true)
	if Restoration.options.restoration_assault_style == 2 then
		assault_panel:child("corner"):set_visible(true)
		assault_panel:child("corner2"):set_visible(true)
		assault_panel:child("assault_title"):set_visible(true)
		assault_panel:child("yellow_tape"):set_visible(false)
		assault_panel:child("text_panel"):set_visible(false)
		assault_panel:animate(callback(self, self, "_animate_assault_corner"))
	else
		assault_panel:child("corner"):set_visible(false)
		assault_panel:child("corner2"):set_visible(false)
		assault_panel:child("assault_title"):set_visible(false)
		assault_panel:child("yellow_tape"):set_visible(true)
		assault_panel:child("text_panel"):set_visible(true)
		assault_panel:child("yellow_tape"):animate( callback( assault_panel:child("yellow_tape"), self, "HUDBGBox_animate_tape_in" ) )
		self._bg_box:animate(callback(self, self, "_animate_assault"))
	end
end
function HUDAssaultCorner:_end_assault()
	if not self._assault then
		return
	end
	self._assault = false
	--local yellow_tape = self._hud_panel:child("assault_panel"):child("yellow_tape")
	--yellow_tape:set_visible(false)
	
	local assault_panel = self._hud_panel:child("assault_panel")

	if Restoration.options.restoration_assault_style == 2 then
		assault_panel:stop()
		assault_panel:set_visible(false)
		self:_show_hostages()
	else
		assault_panel:child("yellow_tape"):animate( callback( assault_panel:child("yellow_tape"), self, "HUDBGBox_animate_tape_out" ) )
		--assault_panel:set_visible(false)
	end
	--self._hud_panel:child("assault_panel"):child("text_panel"):stop()
	--self._hud_panel:child("assault_panel"):child("text_panel"):clear()
end
function HUDAssaultCorner:_show_icon_assaultbox(icon_assaultbox)
	local TOTAL_T = 2
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.sin(t * 360 * 2))))
		icon_assaultbox:set_alpha(alpha)
	end
	icon_assaultbox:set_alpha(1)
end
function HUDAssaultCorner:_hide_icon_assaultbox(icon_assaultbox)
	local TOTAL_T = 2
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.cos(t * 360 * 2))))
		icon_assaultbox:set_alpha(alpha)
	end
	icon_assaultbox:set_alpha(0)
	self:_show_hostages()
end
function HUDAssaultCorner:_show_hostages()
	if not self._point_of_no_return then
		self._hud_panel:child("hostages_panel"):show()
	end
end
function HUDAssaultCorner:_hide_hostages()
	self._hud_panel:child("hostages_panel"):hide()
end
function HUDAssaultCorner:set_control_info(data)
	self._hud_panel:child("hostages_panel"):child("num_hostages"):set_text("" .. data.nr_hostages)
end
function HUDAssaultCorner:feed_point_of_no_return_timer(time, is_inside)
	time = math.floor(time)
	local minutes = math.floor(time / 60)
	local seconds = math.round(time - minutes * 60)
	local text = (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)
	self._hud_panel:child("point_of_no_return_panel"):child("point_of_no_return_timer"):set_text(text)
end
function HUDAssaultCorner:show_point_of_no_return_timer()
	local delay_time = self._assault and 2 or 0
	self:_end_assault()
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	local text_panel = point_of_no_return_panel:child("text_panel")
	local red_tape = point_of_no_return_panel:child("red_tape")
	--red_tape:set_visible(true)  
	red_tape:animate( callback( red_tape, self, "HUDBGBox_animate_tape_in" ) )
   
	point_of_no_return_panel:script().text_list = {}
	text_panel:script().text_list = {}
   
	for _, text_id in ipairs({
		managers.localization:to_upper_text("hud_assault_point_no_return_in"),
		managers.localization:to_upper_text("hud_assault_end_line"),
		managers.localization:to_upper_text("hud_assault_point_no_return_in"),
		managers.localization:to_upper_text("hud_assault_end_line"),
		managers.localization:to_upper_text("hud_assault_point_no_return_in"),
		managers.localization:to_upper_text("hud_assault_end_line"),
		managers.localization:to_upper_text("hud_assault_point_no_return_in"),
		managers.localization:to_upper_text("hud_assault_end_line"),
	}) do
		table.insert(point_of_no_return_panel:script().text_list, text_id)
		table.insert(text_panel:script().text_list, text_id)
	end
   
	self._hud_panel:child("hostages_panel"):set_visible(false)
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self._point_of_no_return = true
end
function HUDAssaultCorner:hide_point_of_no_return_timer()
	--self._noreturn_bg_box:stop()
	self._hud_panel:child("point_of_no_return_panel"):set_visible(false)
	self._hud_panel:child("hostages_panel"):set_visible(true)
	self._point_of_no_return = false
end
function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
	local function flash_timer(o)
		local t = 0
		while t < 0.5 do
			t = t + coroutine.yield()
			local n = 1 - math.sin(t * 180)
			local r = math.lerp(1 or self._point_of_no_return_color.r, 1, n)
			local g = math.lerp(0 or self._point_of_no_return_color.g, 0.8, n)
			local b = math.lerp(0 or self._point_of_no_return_color.b, 0.2, n)
			o:set_color(Color(r, g, b))
			o:set_font_size(math.lerp(tweak_data.hud_corner.noreturn_size, tweak_data.hud_corner.noreturn_size * 1.25, n))
		end
	end
	--local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
	--point_of_no_return_timer:animate(flash_timer)
end
function HUDAssaultCorner:show_casing()
	local delay_time = self._assault and 2 or 0
	self:_end_assault()
	local casing_panel = self._hud_panel:child("casing_panel")
	local white_tape = casing_panel:child("white_tape")
	white_tape:set_visible(true)
	white_tape:animate( callback( white_tape, self, "HUDBGBox_animate_tape_in" ) )
	local text_panel = casing_panel:child("text_panel")
	text_panel:script().text_list = {}
	self._casing_bg_box:script().text_list = {}
	for _, text_id in ipairs({
		managers.localization:to_upper_text("hud_casing_mode_ticker"),
		managers.localization:to_upper_text("hud_assault_end_line"),
		managers.localization:to_upper_text("hud_casing_mode_ticker"),
		managers.localization:to_upper_text("hud_assault_end_line"),
		managers.localization:to_upper_text("hud_casing_mode_ticker"),
		managers.localization:to_upper_text("hud_assault_end_line"),
		managers.localization:to_upper_text("hud_casing_mode_ticker"),
		managers.localization:to_upper_text("hud_assault_end_line"),
	}) do
		table.insert(text_panel:script().text_list, text_id)
		table.insert(self._casing_bg_box:script().text_list, text_id)
	end
	if self._casing_bg_box:child("text_panel") then
		self._casing_bg_box:child("text_panel"):stop()
		self._casing_bg_box:child("text_panel"):clear()
	else
		self._casing_bg_box:panel({name = "text_panel"})
	end
	self._casing_bg_box:child("bg"):stop()
	self._hud_panel:child("hostages_panel"):set_visible(false)
	casing_panel:stop()
	casing_panel:animate(callback(self, self, "_animate_show_casing"), delay_time)
	self._casing = true
end
function HUDAssaultCorner:hide_casing()
	if self._casing_bg_box:child("text_panel") then
		self._casing_bg_box:child("text_panel"):stop()
		self._casing_bg_box:child("text_panel"):clear()
	end
	local casing_panel = self._hud_panel:child("casing_panel")
	local icon_casingbox = casing_panel:child("icon_casingbox")
	local white_tape = casing_panel:child("white_tape")
	--casing_panel:child("text_panel"):stop()
	--casing_panel:child("text_panel"):clear()
	white_tape:animate( callback( white_tape, self, "HUDBGBox_animate_tape_out" ) )
	icon_casingbox:stop()
	local function close_done()
		self._casing_bg_box:set_visible(false)
		local icon_casingbox = self._hud_panel:child("casing_panel"):child("icon_casingbox")
		icon_casingbox:stop()
		icon_casingbox:animate(callback(self, self, "_hide_icon_assaultbox"))
	end
	self._casing_bg_box:stop()
	self._casing_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_close_left"), close_done)
	self._casing = false
end
function HUDAssaultCorner:_animate_simple_text(text)
	local _, _, w, _ = text:text_rect()
	text:set_w(w + 10)
	text:set_visible(true)
	text:set_x(text:parent():w())
	local x = text:x()
	local t = 0
	local speed = 90
	while true do
		local dt = coroutine.yield()
		t = t + dt
		x = x - speed * dt
		text:set_x(x)
		if 0 > text:right() then
			text:set_x(text:parent():w())
			x = text:x()
		end
	end
end
function HUDAssaultCorner:_animate_show_casing(casing_panel, delay_time)
	local icon_casingbox = casing_panel:child("icon_casingbox")
	wait(delay_time)
	casing_panel:set_visible(true)
	icon_casingbox:stop()
	icon_casingbox:animate(callback(self, self, "_show_icon_assaultbox"))
	local open_done = function()
	end
	--[[self._casing_bg_box:stop()
	self._casing_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_left"), 0.75, 242, open_done, {
		attention_color = self._casing_color,
		attention_forever = true
	})]]
	local text_panel = casing_panel:child("text_panel")
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"))
end
function HUDAssaultCorner:_animate_show_noreturn(point_of_no_return_panel, delay_time)
	--local icon_noreturnbox = point_of_no_return_panel:child("icon_noreturnbox")
	local point_of_no_return_text = point_of_no_return_panel:child("text_panel")
	--[[point_of_no_return_text:set_visible(false)
	local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
	point_of_no_return_timer:set_visible(false)]]
	wait(delay_time)
	point_of_no_return_panel:set_visible(true)
	--icon_noreturnbox:stop()
	--icon_noreturnbox:animate(callback(self, self, "_show_icon_assaultbox"))
	point_of_no_return_text:stop()
	point_of_no_return_text:animate(callback(self, self, "_animate_text"))
	--[[self._noreturn_bg_box:stop()
	self._noreturn_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_left"), 0.75, 242, open_done, {
			attention_color = self._casing_color,
			attention_forever = true
	})]]
end
function HUDAssaultCorner:_animate_show_texts(anim_object, texts)
	for _, text in ipairs(texts) do
		text:set_visible(true)
	end
	local TOTAL_T = 0.5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.sin(t * 360 * 3))))
		for _, text in ipairs(texts) do
				text:set_alpha(alpha)
		end
	end
	for _, text in ipairs(texts) do
		text:set_alpha(1)
	end
end
function HUDAssaultCorner:test()
	self._hud_panel:child("point_of_no_return_panel"):animate(callback(self, self, "_animate_test_point_of_no_return"))
end
function HUDAssaultCorner:_animate_test_point_of_no_return(panel)
	managers.hud:show_point_of_no_return_timer()
	local t = 15
	local prev_time = t
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local sec = math.floor(t)
		if sec < math.floor(prev_time) then
			prev_time = sec
			managers.hud:flash_point_of_no_return_timer(sec <= 10)
		end
		managers.hud:feed_point_of_no_return_timer(math.max(t, 0), false)
	end
	managers.hud:hide_point_of_no_return_timer()
end

end