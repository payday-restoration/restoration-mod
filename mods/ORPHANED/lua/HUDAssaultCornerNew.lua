if Restoration.options.restoration_assault_global == true then

HUDAssaultCorner._custom_lines_casing = {
        "GUYS, THE THERMAL DRILL - GO GET IT",
        "I'M NOT HERE FOR YOUR ENTERTAINMENT",
        "DO YOU PLAN ON MASKING UP ANYTIME SOON?",
        "NOBODY CARED WHO I WAS, CAUSE I STILL HADN'T MASKED UP",
        "CREDITS    ///    CGNICK, KAILLUS, WILKO, I AM NOT A SPY, BATTLE DOG, ZDANN, SUPER MUFFIN, WOLFY, GREAT BIG BUSHY BEARD, WILLCARIO, OLIPRO, INSANO-MAN, MELONIOUS, BENEDICT, SEVEN, PORKY-DA-CORGI, DOKTOR AKCEL, A.J. VALENTINE, TOM SEA, MUD, KRYMXON, SC, ELYSIUM, GARRETT, WHITE3DESIGNER, BMSTU_HEDGEHOG, SIX-DEMON BAG, SOME NAME HERE, REZULUX, BANGL, TONIS, FENDERMCBENDER, VICIOUSWALRUS, EDISLEADO, EVIL BOB, KARL LAKNER, AND EVERYONE ELSE AT OVERKILL SOFTWARE AND STARBREEZE AB    ///    THANK YOU EVERYONE <3",
        "CONGRATULATIONS!  YOU ARE OUR 1000TH VISITOR!",
		"WOW.. THAT CREDITS SURE IS LONG, AIN'T IT?  CAN WE GET IT LONGER...?",
		"BEGINNING VIRTUOUS MISSION...",
		"73 69 6e 67 75 6c 61 72 69 74 79",
		"FEAR IS THE MINDKILLER",
		"FLÄSHYN!",
}
HUDAssaultCorner._custom_lines_assault = {
        "DON'T DIE",
        "JUST KEEP TAPPING",
		"JUST KEEP TAPDANCING",
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
		"GUNS THAT WEAR VESTS IT",
		"GUNS THAT HATE TEXAS",
		"GUNS WITH 6 SENSES",
		"GUNS THAT STRAIGHT FESTIVE",
		"GUNS THAT MAKE BREAKFAST",
		"GUNS THAT SEND TEXTSES",
		"GUNS FOR FAKE NECKLACE",
		"AMATEUR HOUR IS OVER",
		"LIKE KEVIN COSTNER",
}
HUDAssaultCorner._custom_lines_phalanx = {
        "AVENGERS ASSEMBLE!",
        "WINTERS IS COMING",
		"POINT OF NO RETURN IN... HAHA JUST KIDDING",
		"IT'S NOT FAIR, IT'S NOT RIGHT",
}
HUDAssaultCorner._custom_lines_civilian = {
        "I AM TEXT BLOCK.",
		"NOTHING UNUSUAL HERE",
		"YOU ARE IN CASING MODE.  MASK UP TO START THE... WAIT, SHIT",
		"ALWAYS WEAR DRY SOCKS",
		"NO POPO",
}
HUDAssaultCorner._custom_lines_ponr = {
		"OH MY GOD, JC A BOMB",
		"GOTTA GO FAST",
		"RUN, RUN GOD DAMN IT",
		"IT'S A BEAUTIFUL DAY, BIRDS ARE SINGING, FLOWERS ARE BLOOMING... ON DAYS LIKE THESE, HEISTERS LIKE YOU DESERVE TO ROT IN JAIL",
		"THEY CAN'T CHASE YOU FOREVER",
		"YOU DESERVE THIS",
		"THE W.P.D. IS LOOKING FOR YOU",
		"NEVER LOOK BACK",
		"THEY'RE GETTING CLOSER",
		"KEEP MOVING",
		"NEVER STOP",
		"NEVER SLOW DOWN",
		"ANOTHER WORLD LOST",
}
HUDAssaultCorner._custom_line_chance = 2 -- Chance of a new line, between 0-100

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
	self:_set_hostage_offseted(false)
	
	managers.hud._hud_assault_corner.TAPE_SPEED = 90
end


HUDAssaultCorner = HUDAssaultCorner or class()
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
	local assault_corner = self._hud_panel:panel({
		visible = false,
		name = "assault_corner",
		w = 400,
		h = 100
	})
	assault_corner:set_top(0)
	assault_corner:set_right(self._hud_panel:w())
	self._assault_mode = "normal"
	self._assault_color = Color(1, 0.8, 0)
	self._assault_color_corner = Color.red
	self._assault_color_corner2 = Color.blue
	self._vip_assault_color = Color(1, 1, 0.5019608, 0)
	self._current_assault_color = self._assault_color
	
	--self._bg_box:set_right(icon_assaultbox:left() - 3)
	local yellow_tape = assault_panel:rect({
		visible = true,
		name = "yellow_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = Color(1, 0.8, 0),
		layer = 1
	})
	--yellow_tape:set_center(10, 10)
	yellow_tape:set_rotation(30)
	yellow_tape:set_blend_mode("add")
	---CORNER---
	local corner = assault_corner:rect({
		visible = true,
		name = "corner",
		h = tweak_data.hud.location_font_size * 6,
		w = size * 3,
		color = self._assault_color_corner,
		layer = 0,
		x = 50,
		y = 50
	})
	local cornertext = assault_corner:rect({
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
	local corner2 = assault_corner:rect({
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
	local assault_title = assault_corner:text({
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
	----------------
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
		color = self._noreturn_color,
		layer = 1
	})
	red_tape:set_rotation(30)
	red_tape:set_blend_mode("add")
	local w = point_of_no_return_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	
	point_of_no_return_panel:panel({
		name = "text_panel",
		layer = 1,
		w = red_tape:w()
	}):set_center(red_tape:center())
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
	local white_tape = casing_panel:rect({
		visible = false,
		name = "white_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = Color(0.8, 0.8, 0.8, 0.8),
		layer = 1
	})
	white_tape:set_rotation(30)
	white_tape:set_blend_mode("add")
	local w = casing_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	casing_panel:panel({
		name = "text_panel",
		layer = 1,
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
	if self._hud_panel:child("buffs_panel") then
		self._hud_panel:remove(self._hud_panel:child("buffs_panel"))
	end
	local width = 200
	local x = assault_panel:left() + yellow_tape:left() - 3 - width
	self._vip_bg_box_bg_color = Color(1, 0, 0.6666667, 1)
	local buffs_panel = self._hud_panel:panel({
		visible = false,
		name = "buffs_panel",
		w = 400,
		h = 100
	})
	buffs_panel:set_top(0)
	buffs_panel:set_right(self._hud_panel:w())
	local vip_icon = buffs_panel:bitmap({
		halign = "center",
		valign = "center",
		color = Color.white,
		name = "vip_icon",
		blend_mode = "add",
		visible = true,
		layer = 3,
		texture = "guis/textures/pd2/hud_buff_shield",
		x = 0,
		y = 0,
		w = 38,
		h = 38
	})
	--vip_icon:set_center(buffs_panel:w() / 2, buffs_panel:h() / 2)
	if Restoration.options.restoration_assault_style == 2 then
		vip_icon:set_rotation(45)
		vip_icon:set_right(buffs_panel:w())
		vip_icon:set_bottom(buffs_panel:h() - 38)
	else
		vip_icon:set_right(buffs_panel:w())
		vip_icon:set_rotation(30)
		vip_icon:set_top(0)
	end
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
			if self._assault_mode == "phalanx" then
				tab = self._custom_lines_phalanx
			end
			if self._casing_mode == "civilian" then -- NEED TO FIND A WAY TO ENABLE THIS - D.A.
				tab = self._custom_lines_civilian
			end
			if #tab > 0 and text_id ~= "hud_assault_end_line" and text_id ~= "hud_assault_padlock" and self._custom_line_chance > math.random(100) then
				text_string = tab[math.random(#tab)]
			else
				text_string = managers.localization:to_upper_text(text_id)
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
			font_size = tweak_data.hud_corner.assault_size * 1.2,
			font = "fonts/font_large_mf",
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

function HUDAssaultCorner:set_buff_enabled(buff_name, enabled)
	local assault_panel = self._hud_panel:child("assault_panel")
	local buffs_panel = self._hud_panel:child("buffs_panel")
	local vip_icon = buffs_panel:child("vip_icon")
	--if enabled then
		buffs_panel:set_visible(enabled)
	--end
	if Restoration.options.restoration_assault_style == 2 then
			vip_icon:set_rotation(45)
			vip_icon:set_right(buffs_panel:w())
			vip_icon:set_bottom(buffs_panel:h() - 38)
	else
			vip_icon:set_right(buffs_panel:w())
			vip_icon:set_rotation(30)
			vip_icon:set_top(0)
	end
end

function HUDAssaultCorner:get_assault_mode()
	return self._assault_mode
end

function HUDAssaultCorner:sync_set_assault_mode(mode)
	if self._assault_mode == mode then
		return
	end
	self._assault_mode = mode
	local color = self._assault_color
	if mode == "phalanx" then
		color = self._vip_assault_color
	end
	self._current_assault_color = color

	self._hud_panel:child("assault_panel"):child("yellow_tape"):set_color(color)
	self:_set_text_list(self:_get_assault_strings())
	local assault_panel = self._hud_panel:child("assault_panel")

end

function HUDAssaultCorner:sync_start_assault(data)
	if self._point_of_no_return or self._casing then
		return
	end
	self._start_assault_after_hostage_offset = true
	self:_set_hostage_offseted(true)
end
function HUDAssaultCorner:start_assault_callback()
	self:_start_assault(self:_get_assault_strings())
end
function HUDAssaultCorner:_get_assault_strings()
	if self._assault_mode == "normal" then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_cover",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_cover",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_cover",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_cover",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_cover"
			}
		else
			return {
				"hud_assault_assault",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_end_line",
				"hud_assault_assault",
				"hud_assault_end_line"
			}
		end
	end
	if self._assault_mode == "phalanx" then
		if managers.job:current_difficulty_stars() > 0 then
			local ids_risk = Idstring("risk")
			return {
				"hud_assault_vip",
				"hud_assault_padlock",
				ids_risk,
				"hud_assault_padlock",
				"hud_assault_vip",
				"hud_assault_padlock",
				ids_risk,
				"hud_assault_padlock"
			}
		else
			return {
				"hud_assault_vip",
				"hud_assault_padlock",
				"hud_assault_vip",
				"hud_assault_padlock",
				"hud_assault_vip",
				"hud_assault_padlock",
				"hud_assault_vip",
				"hud_assault_padlock"				
			}
		end
	end
end

function HUDAssaultCorner:sync_end_assault(result)
	if self._point_of_no_return or self._casing then
		return
	end
	self:_end_assault()
	if self._remove_hostage_offset then
		self:_set_hostage_offseted(false)
	end
end

function HUDAssaultCorner:_set_text_list(text_list)
	local assault_panel = self._hud_panel:child("assault_panel")
	local text_panel = assault_panel:child("text_panel")
	text_panel:script().text_list = text_panel:script().text_list or {}
	--while #text_panel:script().text_list > 0 do
	--	table.remove(text_panel:script().text_list)
	--end
	assault_panel:script().text_list = assault_panel:script().text_list or {}
	--while 0 < #assault_panel:script().text_list do
	--	table.remove(assault_panel:script().text_list)
	--end
	for _, text_id in ipairs(text_list) do
		table.insert(text_panel:script().text_list, text_id)
		table.insert(assault_panel:script().text_list, text_id)
		--table.insert(self._bg_box:script().text_list, text_id)
	end
end
function HUDAssaultCorner:_start_assault(text_list)
	if self._assault then
	return end
	text_list = text_list or {""}
	local assault_panel = self._hud_panel:child("assault_panel")
	local assault_corner = self._hud_panel:child("assault_corner")
	local text_panel = assault_panel:child("text_panel")
	self:_set_text_list(text_list)
	self._assault = true
	if self._hud_panel:child("assault_panel"):child("text_panel") then
		self._hud_panel:child("assault_panel"):child("text_panel"):stop()
		self._hud_panel:child("assault_panel"):child("text_panel"):clear()
	else
		self._hud_panel:child("assault_panel"):panel({name = "text_panel"})
	end
	--self._bg_box:child("bg"):stop()
	assault_panel:set_visible(true)
	assault_corner:set_visible(true)
	if Restoration.options.restoration_assault_style == 2 then
		assault_panel:set_visible(false)
	else
		assault_corner:set_visible(false)
	end
	assault_corner:animate(callback(self, self, "_animate_assault_corner"))
	assault_panel:child("yellow_tape"):animate( callback( assault_panel:child("yellow_tape"), self, "HUDBGBox_animate_tape_in" ) )
	local text_panel = assault_panel:child("text_panel")
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"))
	self:_set_feedback_color(self._assault_color)
end

function HUDAssaultCorner:_end_assault()
	if not self._assault then
		self._start_assault_after_hostage_offset = nil
		return
	end
	local assault_panel = self._hud_panel:child("assault_panel")
	local assault_corner = self._hud_panel:child("assault_corner")
	self:_set_feedback_color(nil)
	self._assault = false
	--self._bg_box:child("text_panel"):stop()
	--self._bg_box:child("text_panel"):clear()
	self._remove_hostage_offset = true
	self._start_assault_after_hostage_offset = nil
	if Restoration.options.restoration_assault_style == 2 then
		assault_corner:stop()
		assault_corner:set_visible(false)
		self:_show_hostages()
	else
		assault_panel:child("yellow_tape"):animate( callback( assault_panel:child("yellow_tape"), self, "HUDBGBox_animate_tape_out" ), close_done)
		--assault_panel:set_visible(false)
	end
	local function close_done()
		self:sync_set_assault_mode("normal")
		assault_panel:child("vip_icon"):set_visible(false)
		--self:_set_hostage_offseted(false)
	end
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
	local TOTAL_T = 1
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.cos(t * 360 * 2))))
		icon_assaultbox:set_alpha(alpha)
		if self._remove_hostage_offset and t < 0.03 then
			self:_set_hostage_offseted(false)
		end
	end
	if self._remove_hostage_offset then
		self:_set_hostage_offseted(false)
	end
	icon_assaultbox:set_alpha(0)
	if not self._casing then
		self:_show_hostages()
	end
end
function HUDAssaultCorner:_show_hostages()
	if not self._point_of_no_return then
		self._hud_panel:child("hostages_panel"):show()
	end
end
function HUDAssaultCorner:_hide_hostages()
	self._hud_panel:child("hostages_panel"):hide()
end
function HUDAssaultCorner:_set_hostage_offseted(is_offseted)
	local hostage_panel = self._hud_panel:child("hostages_panel")
	self._remove_hostage_offset = nil
	hostage_panel:stop()
	hostage_panel:animate(callback(self, self, "_offset_hostage", is_offseted))
end
function HUDAssaultCorner:_offset_hostage(is_offseted, hostage_panel)
	local TOTAL_T = 0.18
	local OFFSET = self._hud_panel:child("assault_panel"):h() + 8
	if Restoration.options.restoration_assault_style == 2 then
		OFFSET = self._hud_panel:child("assault_panel"):h() + 38
	end
	local from_y = is_offseted and 0 or OFFSET
	local target_y = is_offseted and OFFSET or 0
	local t = (1 - math.abs(hostage_panel:y() - target_y) / OFFSET) * TOTAL_T
	while TOTAL_T > t do
		local dt = coroutine.yield()
		t = math.min(t + dt, TOTAL_T)
		local lerp = t / TOTAL_T
		hostage_panel:set_y(math.lerp(from_y, target_y, lerp))
		if self._start_assault_after_hostage_offset and lerp > 0.4 then
			self._start_assault_after_hostage_offset = nil
			self:start_assault_callback()
		end
	end
	if self._start_assault_after_hostage_offset then
		self._start_assault_after_hostage_offset = nil
		self:start_assault_callback()
	end
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
	local delay_time = self._assault and 1.2 or 0
	self:_end_assault()
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	local text_panel = point_of_no_return_panel:child("text_panel")
	local red_tape = point_of_no_return_panel:child("red_tape")
	--red_tape:set_visible(true)  
	red_tape:animate( callback( red_tape, self, "HUDBGBox_animate_tape_in" ) )
	
	
	point_of_no_return_panel:script().text_list = {}
	text_panel:script().text_list = {}
   
	for _, text_id in ipairs({
		"hud_assault_point_no_return_in",
		"hud_assault_end_line",
		"hud_assault_point_no_return_in",
		"hud_assault_end_line",
		"hud_assault_point_no_return_in",
		"hud_assault_end_line",
		"hud_assault_point_no_return_in",
		"hud_assault_end_line"
	}) do
		table.insert(point_of_no_return_panel:script().text_list, text_id)
		table.insert(text_panel:script().text_list, text_id)
	end
	
	self:_hide_hostages()
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self:_set_feedback_color(self._noreturn_color)
	self._point_of_no_return = true
end
function HUDAssaultCorner:hide_point_of_no_return_timer()
	self._hud_panel:child("point_of_no_return_panel"):set_visible(false)
	self._point_of_no_return = false
	self:_show_hostages()
	self:_set_feedback_color(nil)
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
function HUDAssaultCorner:show_casing(mode)
	local delay_time = self._assault and 2 or 0
	self:_end_assault()
	local casing_panel = self._hud_panel:child("casing_panel")
	local white_tape = casing_panel:child("white_tape")
	self._casing_mode = mode
	white_tape:set_visible(true)
	white_tape:animate( callback( white_tape, self, "HUDBGBox_animate_tape_in" ) )
	local text_panel = casing_panel:child("text_panel")
	text_panel:script().text_list = {}
	casing_panel:script().text_list = {}
	local msg
	if mode == "civilian" then
		msg = {
			"hud_casing_mode_ticker_clean",
			"hud_assault_end_line",
			"hud_casing_mode_ticker_clean",
			"hud_assault_end_line"
		}
	else
		msg = {
			"hud_casing_mode_ticker",
			"hud_assault_end_line",
			"hud_casing_mode_ticker",
			"hud_assault_end_line"
		}
	end
	for _, text_id in ipairs(msg) do
		table.insert(text_panel:script().text_list, text_id)
		table.insert(casing_panel:script().text_list, text_id)
	end
	if casing_panel:child("text_panel") then
		casing_panel:child("text_panel"):stop()
		casing_panel:child("text_panel"):clear()
	else
		casing_panel:panel({name = "text_panel"})
	end
	self:_hide_hostages()
	casing_panel:stop()
	casing_panel:animate(callback(self, self, "_animate_show_casing"), delay_time)
	self._casing = true
end
function HUDAssaultCorner:hide_casing()
	local casing_panel = self._hud_panel:child("casing_panel")
	if casing_panel:child("text_panel") then
		casing_panel:child("text_panel"):stop()
		casing_panel:child("text_panel"):clear()
	end

	local white_tape = casing_panel:child("white_tape")
	--casing_panel:child("text_panel"):stop()
	--casing_panel:child("text_panel"):clear()
	white_tape:animate( callback( white_tape, self, "HUDBGBox_animate_tape_out" ) )
	--icon_casingbox:stop()
	--local function close_done()
		--self._casing_bg_box:set_visible(false)
		--local icon_casingbox = self._hud_panel:child("casing_panel"):child("icon_casingbox")
		--icon_casingbox:stop()
		--icon_casingbox:animate(callback(self, self, "_hide_icon_assaultbox"))
	--end
	--self._casing_bg_box:stop()
	--self._casing_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_close_left"), close_done)
	--self:_show_hostages()
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
	--local icon_casingbox = casing_panel:child("icon_casingbox")
	wait(delay_time)
	casing_panel:set_visible(true)
	--icon_casingbox:stop()
	--icon_casingbox:animate(callback(self, self, "_show_icon_assaultbox"))
	local open_done = function()
	end
	local text_panel = casing_panel:child("text_panel")
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"))
end
function HUDAssaultCorner:_animate_show_noreturn(point_of_no_return_panel, delay_time)
	--local icon_noreturnbox = point_of_no_return_panel:child("icon_noreturnbox")
	local point_of_no_return_text = point_of_no_return_panel:child("text_panel")
	--point_of_no_return_text:set_visible(false)
	--local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
	--point_of_no_return_timer:set_visible(false)
	wait(delay_time)
	point_of_no_return_panel:set_visible(true)
	point_of_no_return_text:stop()
	point_of_no_return_text:animate(callback(self, self, "_animate_text"))
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
function HUDAssaultCorner:_set_feedback_color(color)
	if self._feedback_color ~= color then
		self._feedback_color = color
		if color then
			self._feedback_color_t = 2.8
			managers.hud:add_updator("feedback_color", callback(self, self, "_update_feedback_alpha"))
		else
			managers.hud:remove_updator("feedback_color")
			managers.platform:set_feedback_color(nil)
		end
	end
end
function HUDAssaultCorner:_update_feedback_alpha(t, dt)
	self._feedback_color_t = self._feedback_color_t - dt
	local alpha_curve = math.sin(self._feedback_color_t * 180)
	local alpha = math.abs(alpha_curve)
	local color = self._feedback_color
	if color == self._assault_color then
		if alpha_curve < 0 then
			color = Color.blue
		else
			color = Color.red
		end
	end
	managers.platform:set_feedback_color(color:with_alpha(alpha))
end


function HUDAssaultCorner:_style_changed()
	local assault_panel = self._hud_panel:child("assault_panel")
	local assault_corner = self._hud_panel:child("assault_corner")
	local buffs_panel = self._hud_panel:child("buffs_panel")
	local vip_icon = buffs_panel:child("vip_icon")
	if self._assault then
		if Restoration.options.restoration_assault_style == 2 then
			assault_panel:set_visible(false)
			assault_corner:set_visible(true)
			vip_icon:set_rotation(45)
			vip_icon:set_right(buffs_panel:w())
			vip_icon:set_bottom(buffs_panel:h() - 38)
		else
			assault_corner:set_visible(false)
			assault_panel:set_visible(true)
			vip_icon:set_right(buffs_panel:w())
			vip_icon:set_rotation(30)
			vip_icon:set_top(0)
		end
	end
end

end