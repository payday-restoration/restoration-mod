--[[

]]--

require "lib/managers/menu/MenuBackdropGUI"

IngameManualGui = IngameManualGui or class()

function IngameManualGui:init( workspace )
	-- All of this initializes the menu, best not to touch for now
	managers.menu_component:play_transition(true)
	self._backdrop = MenuBackdropGUI:new( managers.gui_data:create_fullscreen_workspace() )
	self._backdrop:create_black_borders()

	--local res = RenderSettings.resolution
	self._active = false
	self._workspace = managers.gui_data:create_fullscreen_workspace()
	self._panel = self._workspace:panel():panel({})
	--[[self._workspace_size = {
		x = 0,
		y = 0,
		w = res.x,
		h = res.y
	}]]--

	-- Just handy variables that I'll keep adding to for convenience
	local massive_font = tweak_data.menu.pd2_massive_font
	local large_font = tweak_data.menu.pd2_large_font
	local medium_font = tweak_data.menu.pd2_medium_font
	local small_font = tweak_data.menu.pd2_small_font
	
	local massive_font_size = tweak_data.menu.pd2_massive_font_size
	local large_font_size = tweak_data.menu.pd2_large_font_size
	local medium_font_size = tweak_data.menu.pd2_medium_font_size
	local small_font_size = tweak_data.menu.pd2_small_font_size

	-- This is the green color used on the first panel
	local crime_green = Color("38ff83")
	
	self._background_layer_safe = self._backdrop:get_new_background_layer()
	self._background_layer_full = self._backdrop:get_new_background_layer()
	self._foreground_layer_safe = self._backdrop:get_new_foreground_layer()
	self._foreground_layer_full = self._backdrop:get_new_foreground_layer()
	
	self._baselayer_two = self._backdrop:get_new_base_layer()
	
	self._backdrop:set_panel_to_saferect( self._background_layer_safe )
	self._backdrop:set_panel_to_saferect( self._foreground_layer_safe )
	
	self._callback_handler = {}

	-- This index will be used for filtering difficulty stats
	self._difficulty_index = 1
	self._difficulty_highlight_index = 1 -- For when the mouse hovers over a star

	-- Creates a table for all the buttons and panels for future references
	self._manual = {}

	-- This creates the BACK button
	self._manual["back_button"] = self._foreground_layer_safe:text({ 
		name = "back_button", 
		text = utf8.to_upper( managers.localization:text("menu_back") ),
		font_size = large_font_size, 
		font = large_font, 
		color = tweak_data.screen_colors.button_stage_3 
	})
	self:make_fine_text( self._manual["back_button"] )
	self._manual["back_button"]:set_right( self._foreground_layer_safe:w() )
	self._manual["back_button"]:set_bottom( self._foreground_layer_safe:h() )
	self._manual["back_button"]:set_visible( managers.menu:is_pc_controller() )

	self._manual["back_button_bg"] = self._background_layer_safe:rect({ 
		name = "back_button_bg",
		color = tweak_data.screen_colors.button_stage_3,
		alpha = 0
	})
	
	-- This creates the 3 panels for information, they are equally divided into thirds but the 2nd panel is bigger than the 1st by 100 pxl
	self._manual["panel_1"] = self._foreground_layer_safe:panel({
		name = "panel_1",
		w = (self._foreground_layer_safe:w() / 3) - 100 - 4,
		h = self._foreground_layer_safe:h()
	})
	self._manual["panel_2"] = self._foreground_layer_safe:panel({
		name = "panel_2",
		w = (self._foreground_layer_safe:w() / 3) + 100 - 4,
		h = self._foreground_layer_safe:h()
	})
	self._manual["panel_3"] = self._foreground_layer_safe:panel({
		name = "panel_3",
		w = (self._foreground_layer_safe:w() / 3) - 4,
		h = self._foreground_layer_safe:h()
	})

	-- Sets all the panels to its corresponding positions
	self._manual["panel_1"]:set_lefttop(0, 0)
	self._manual["panel_2"]:set_lefttop(self._manual["panel_1"]:right() + 4, 0)
	self._manual["panel_3"]:set_lefttop(self._manual["panel_2"]:right() + 4, 0)

	-- Adjusts the 3rd panel's height so it doesn't overlap the back button
	self._manual["panel_3"]:set_h((self._manual["panel_3"]:h() - self._manual["back_button"]:h()) - 8)

	-- Creates the flashy backgrounds with its custom colors, added a blur background as well so it is easier to read
	self:create_borders(self._manual["panel_1"], crime_green)
	self:create_blur_background(self._manual["panel_1"], crime_green)
	self:create_blur_background(self._manual["panel_2"], Color.white:with_alpha(0))
	self:create_borders(self._manual["panel_3"], tweak_data.screen_colors.button_stage_3:with_alpha(1))
	self:create_blur_background(self._manual["panel_3"], tweak_data.screen_colors.button_stage_3:with_alpha(1))

	-- Centers the back button relative to the 3rd panel
	self._manual["back_button"]:set_center_x(self._manual["panel_3"]:center_x())
	self._manual["back_button_bg"]:set_size(self._manual["panel_3"]:w(), self._manual["back_button"]:h())
	self._manual["back_button_bg"]:set_center(self._manual["back_button"]:center())

	-- Psuedo title for the manual
	self._manual["manual_title"] = self._manual["panel_1"]:text({
		name = "manual_title",
		text = "CRIME.NET GLOBAL TRACKER v1.2.7",
		font = large_font,
		font_size = medium_font_size,
		color = crime_green,
		vertical = "top",
		align = "center"
	})
	self:make_fine_text(self._manual["manual_title"])
	self._manual["manual_title"]:set_w(self._manual["panel_1"]:w() - 8)
	self._manual["manual_title"]:set_lefttop(4, 4)

	-- Add dividers to separate items within the same panel
	self._manual["panel_1_divider_1"] = self._manual["panel_1"]:rect({
		name = "panel_1_divider_1",
		w = self._manual["panel_1"]:w(),
		h = 2,
		color = crime_green
	})
	self._manual["panel_1_divider_1"]:set_top(self._manual["manual_title"]:bottom())

	-- Add difficulty stars to filter out stats
	self._manual["risk_title"] = self._manual["panel_1"]:text({
		name = "risk_title",
		text = "DIFFICULTY: " .. managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[2]]),
		font = large_font,
		font_size = medium_font_size,
		color = Color.yellow,
		vertical = "top",
		align = "center"
	})
	self:make_fine_text(self._manual["risk_title"])
	self._manual["risk_title"]:set_w(self._manual["panel_1"]:w() - 8)
	self._manual["risk_title"]:set_lefttop(4, self._manual["panel_1_divider_1"]:bottom() + 8)

	-- Gonna add a separate panel for the stars so it can be centered with ease
	self._manual["panel_1_sub_1"] = self._manual["panel_1"]:panel({
		name = "panel_1_sub_1",
		w = (25 * (#tweak_data.difficulties - 1)) + (#tweak_data.difficulties - 1),
		h = 25
	})
	self._manual["panel_1_sub_1"]:set_top(self._manual["risk_title"]:bottom() - 2)
	self._manual["panel_1_sub_1"]:set_center_x(self._manual["panel_1"]:center_x())

	for i = 1, #tweak_data.difficulties - 1 do
		self._manual["risklevel_" .. i] = self._manual["panel_1_sub_1"]:bitmap({
			name = "risklevel_" .. i,
			texture = "guis/textures/restoration/risklevel_blackscreen",
			color = Color.yellow,
			alpha = i == 1 and 1 or 0.25,
			vertical = "top",
			align = "center"
		})
		self._manual["risklevel_" .. i]:set_size(25, 25)
		self._manual["risklevel_" .. i]:set_left(i == 1 and 0 or self._manual["risklevel_" .. (i - 1)]:right() + 1)
	end

	-- Making a sub panel for the stats to ensure that the text don't overlap
	self._manual["panel_1_sub_2"] = self._manual["panel_1"]:panel({
		name = "panel_1_sub_2",
		w = self._manual["panel_1"]:w() - 8,
		h = 400, -- The panel will only take up 400 pxls (height-wise) to ensure space for other objects
	})
	self._manual["panel_1_sub_2"]:set_lefttop(4, self._manual["panel_1_sub_1"]:bottom() + 8)

	-- This is just the filler for all the stats
	self._manual["stats_description"] = self._manual["panel_1_sub_2"]:text({
		name = "stats_description",
		text = "STATISTICS\n\n- 12345\n- abcde\n- 54321\n- edcba\n\nSo yeah... this is just a filler here! Not sure how many stats are gonna be here though.\n\nText is centered here so it should be fine. Now it's time to flood the text to see if it overlaps the divider below!\n\nText is centered here so it should be fine. Now it's time to flood the text to see if it overlaps the divider below!\n\nText is centered here so it should be fine. Now it's time to flood the text to see if it overlaps the divider below!",
		font = large_font,
		font_size = small_font_size,
		w = self._manual["panel_1_sub_2"]:w(),
		color = crime_green,
		vertical = "top",
		align = "center",
		wrap = true
	})
	self:make_fine_text(self._manual["stats_description"], true, _)

	-- Another divider for panel 1
	self._manual["panel_1_divider_2"] = self._manual["panel_1"]:rect({
		name = "panel_1_divider_2",
		color = crime_green,
		w = self._manual["panel_1"]:w(),
		h = 2
	})
	self._manual["panel_1_divider_2"]:set_top(self._manual["panel_1_sub_2"]:bottom() + 4)

	-- Now the map will be the last item for the panel
	self._manual["manual_map"] = self._manual["panel_1"]:bitmap({
		name = "manual_map",
		texture = "guis/textures/restoration/ingame_manual/page_1",
		w = self._manual["panel_1"]:w() - 8,
		h = 170, -- height for now
		color = crime_green,
		align = "center"
	})
	self._manual["manual_map"]:set_top(self._manual["panel_1_divider_2"]:bottom() + 2)
	self._manual["manual_map"]:set_center_x(self._manual["panel_1"]:center_x())

	-- This places the main image on the second panel
	self._manual["manual_image"] = self._manual["panel_2"]:bitmap({
		name = manual_image,
		texture = "guis/textures/restoration/mission_briefing/classic",
		align = "center"
	})
	self._manual["manual_image"]:set_top(10)

	-- Sets up the faction information which is placed below the image of the second panel
	self._manual["panel_2_sub_1"] = self._manual["panel_2"]:panel({
		name = "panel_2_sub_1",
		vertical = "bottom",
		w = self._manual["panel_2"]:w(),
		h = 104
	})
	self._manual["panel_2_sub_1"]:set_bottom(self._manual["panel_2"]:h())
	self:create_borders(self._manual["panel_2_sub_1"], Color.white)
	self:create_blur_background(self._manual["panel_2_sub_1"], Color.white)

	-- The image of the faction
	self._manual["faction_image"] = self._manual["panel_2_sub_1"]:bitmap({
		name = "faction_image",
		texture = "guis/textures/restoration/mission_briefing/locke",
		w = 100,
		h = 100
	})
	self._manual["faction_image"]:set_lefttop(2, 2)

	-- The faction description alongside the corresponding image
	self._manual["faction_description"] = self._manual["panel_2_sub_1"]:text({
		name = "faction_description",
		text = "This is where the faction description will be. It should be enough to fit in 140 characters or even more! The font alignment is currently at center by the way.",
		font = large_font,
		font_size = small_font_size,
		color = Color.white,
		w = self._manual["panel_2_sub_1"]:w() - 4 - (self._manual["faction_image"]:w() - 4),
		h = 100,
		vertical = "center",
		align = "center",
		wrap = true
	})
	self._manual["faction_description"]:set_lefttop(self._manual["faction_image"]:right() + 2, 2)

	-- Psuedo name for Bain's notes
	self._manual["notes_title"] = self._manual["panel_3"]:text({
		name = "notes_title",
		text = "BAIN'S NOTES: Murkywater",
		font = large_font,
		font_size = medium_font_size,
		w = self._manual["panel_3"]:w() - 8,
		color = tweak_data.screen_colors.button_stage_3:with_alpha(1),
		vertical = "top",
		align = "center"
	})
	self:make_fine_text(self._manual["notes_title"], true, _)
	self._manual["notes_title"]:set_lefttop(4, 4)

	-- Add a divider for the title of the third panel
	self._manual["panel_3_divider_1"] = self._manual["panel_3"]:rect({
		name = "panel_3_divider_1",
		color = tweak_data.screen_colors.button_stage_3:with_alpha(1),
		w = self._manual["panel_3"]:w(),
		h = 2
	})
	self._manual["panel_3_divider_1"]:set_top(self._manual["notes_title"]:bottom())

	-- Adds the unit and lore headings
	self._manual["panel_3_sub_1"] = self._manual["panel_3"]:panel({
		name = "panel_3_sub_1",
		w = self._manual["panel_3"]:w() / 2
	})
	self._manual["panel_3_sub_1"]:set_lefttop(0, self._manual["panel_3_divider_1"]:bottom() + 8)

	-- Inserts the unit title within the panel
	self._manual["unit_title"] = self._manual["panel_3_sub_1"]:text({
		name = "unit_title",
		text = "UNIT",
		font = large_font,
		font_size = medium_font_size,
		w = self._manual["panel_3_sub_1"]:w() - 8,
		color = tweak_data.screen_colors.button_stage_3:with_alpha(1),
		vertical = "top",
		align = "center"
	})
	self:make_fine_text(self._manual["unit_title"], true, _)
	self._manual["unit_title"]:set_lefttop(4, 4)
	self._manual["panel_3_sub_1"]:set_h(self._manual["unit_title"]:h())

	self._manual["panel_3_sub_2"] = self._manual["panel_3"]:panel({
		name = "panel_3_sub_2",
		w = self._manual["panel_3"]:w() / 2
	})
	self._manual["panel_3_sub_2"]:set_lefttop(self._manual["panel_3"]:w() / 2, self._manual["panel_3_divider_1"]:bottom() + 8)

	-- Inserts the lore title within the panel
	self._manual["lore_title"] = self._manual["panel_3_sub_2"]:text({
		name = "lore_title",
		text = "LORE",
		font = large_font,
		font_size = medium_font_size,
		w = self._manual["panel_3_sub_2"]:w() - 8,
		color = tweak_data.screen_colors.button_stage_3:with_alpha(1),
		vertical = "top",
		align = "center"
	})
	self:make_fine_text(self._manual["lore_title"], true, _)
	self._manual["lore_title"]:set_lefttop(4, 4)
	self._manual["panel_3_sub_2"]:set_h(self._manual["lore_title"]:h())

	-- The unit and lore description will be on its separate panel to prevent overlapping
	self._manual["panel_3_sub_3"] = self._manual["panel_3"]:panel({
		name = "panel_3_sub_3",
		w = self._manual["panel_3"]:w() / 2,
		h = 250
	})
	self._manual["panel_3_sub_3"]:set_lefttop(0, self._manual["panel_3_sub_1"]:bottom())

	self._manual["panel_3_sub_4"] = self._manual["panel_3"]:panel({
		name = "panel_3_sub_4",
		w = self._manual["panel_3"]:w() / 2,
		h = 250
	})
	self._manual["panel_3_sub_4"]:set_lefttop(self._manual["panel_3"]:w() / 2, self._manual["panel_3_sub_2"]:bottom())

	-- The unit description will be placed on the left side panel
	self._manual["unit_description"] = self._manual["panel_3_sub_3"]:text({
		name = "unit_description",
		text = "Vernon Locke heads their special cyberwarfare division, which has been tasked with infiltrating and destroying Crime.net. Locke has managed this. However, being a mercenary with no loyalties that extra money couldn't bend, Locke sees this as an opportunity.",
		font = large_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.button_stage_2:with_alpha(1),
		w = self._manual["panel_3_sub_3"]:w() - 4,
		h = self._manual["panel_3_sub_3"]:h() - 4,
		wrap = true,
		vertical = "top",
		align = "center"
	})
	self._manual["unit_description"]:set_lefttop(4, 4)

	-- The lore description will be placed on the right side panel
	self._manual["lore_description"] = self._manual["panel_3_sub_4"]:text({
		name = "lore_description",
		text = "Murkywater is a company in the PAYDAY universe. On the surface, they're a private military company but are actually what is described as an army, performing operations and moving contraband all around the globe.",
		font = large_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.button_stage_2:with_alpha(1),
		w = self._manual["panel_3_sub_4"]:w() - 4,
		h = self._manual["panel_3_sub_4"]:h() - 4,
		wrap = true,
		vertical = "top",
		align = "center"
	})
	self._manual["lore_description"]:set_lefttop(4, 4)

	-- This is REALLY IMPORTANT!! For some reason, this class does not have native mouse functions so I did a dirty workaround and attached hooks to another class and copied its mouse functions
	-- However, there was a tiny bug where the mouse position was off so I had to manually add values in order to offset the bug
	if MenuComponentManager then
		local x_off = 42
		local y_off = 22
		Hooks:PostHook(MenuComponentManager, "mouse_moved", "RestorationIngameManualGuiMouseMoved", function(s, o, x, y)
			x = x + x_off
			y = y + y_off
			self:mouse_moved(x, y)
		end)
		Hooks:PostHook(MenuComponentManager, "mouse_pressed", "RestorationIngameManualGuiMousePressed", function(s, o, button, x, y)
			x = x + x_off
			y = y + y_off
			self:mouse_pressed(button, x, y)
		end)
	end
end

function IngameManualGui:mouse_moved(x, y)
	if not self._backdrop then return end

	if self._manual["back_button_bg"]:inside(x, y) then
		if not self._back_button_highlighted then
			self._back_button_highlighted = true
			self._manual["back_button_bg"]:set_alpha(0.25)
			self._manual["back_button"]:set_color(tweak_data.screen_colors.button_stage_2)
			managers.menu_component:post_event("highlight")
		end
	elseif self._back_button_highlighted then
		self._back_button_highlighted = false
		self._manual["back_button_bg"]:set_alpha(0)
		self._manual["back_button"]:set_color(tweak_data.screen_colors.button_stage_3)
	end

	if self._manual["panel_1_sub_1"]:inside(x, y) then
		for i = 1, #tweak_data.difficulties - 1 do
			if self._difficulty_highlight_index ~= i and self._manual["risklevel_" .. i]:inside(x, y) then
				if self._difficulty_highlight_index > i then
					self:unhighlight_difficulty(i)
				end
				self._difficulty_highlight_index = i
				self:highlight_difficulty(i)
			end
		end
	elseif self._difficulty_highlight_index ~= self._difficulty_index then
		self._difficulty_highlight_index = self._difficulty_index
		self:unhighlight_difficulty()
	end
end

function IngameManualGui:mouse_pressed(button, x, y)
	if not self._backdrop then return end

	if self._manual["back_button_bg"]:inside(x, y) and button == Idstring("0") then
		managers.menu:back(true)
		return
	end

	if self._manual["panel_1_sub_1"]:inside(x, y) then
		for i = 1, #tweak_data.difficulties - 1 do
			if self._manual["risklevel_" .. i]:inside(x, y) and button == Idstring("0") and self._difficulty_index ~= i then
				self:set_difficulty(i)
			end
		end
	end
end

function IngameManualGui:highlight_difficulty(index)
	for i = 1, index do
		self._manual["risklevel_" .. i]:set_alpha(1)
	end
	self._manual["risk_title"]:set_text("DIFFICULTY: " .. managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[index + 1]]))
	managers.menu_component:post_event("highlight")
end

function IngameManualGui:unhighlight_difficulty(certain)
	for i = #tweak_data.difficulties - 1, (certain or self._difficulty_index) + 1, -1 do
		self._manual["risklevel_" .. i]:set_alpha(0.25)
	end
	if not certain then
		for i = 1, self._difficulty_index do
			self._manual["risklevel_" .. i]:set_alpha(1)
		end
		self._manual["risk_title"]:set_text("DIFFICULTY: " .. managers.localization:to_upper_text(tweak_data.difficulty_name_ids[tweak_data.difficulties[self._difficulty_index + 1]]))
	end
end

function IngameManualGui:set_difficulty(index)
	self._difficulty_index = index
	managers.menu_component:post_event("menu_enter")
end

function IngameManualGui:make_fine_text(text, no_width, no_height)
	local x,y,w,h = text:text_rect()
	text:set_size( no_width and text:w() or w, no_height and text:h() or h )
	-- text:set_position( math.round( text:x() ), math.round( text:y() ) )
	-- text:set_position( math.round( x ), math.round( y ) )
end

function IngameManualGui:create_borders(panel, pcolor)
	local thicc = 2

	panel:rect({
		name = "top_border",
		color = pcolor,
		w = panel:w(),
		layer = -1,
		h = thicc
	})
	panel:rect({
		name = "bottom_border",
		color = pcolor,
		w = panel:w(),
		layer = -1,
		h = thicc
	})
	panel:rect({
		name = "left_border",
		color = pcolor,
		layer = -1,
		w = thicc,
		h = panel:h()
	})
	panel:rect({
		name = "right_border",
		color = pcolor,
		layer = -1,
		w = thicc,
		h = panel:h()
	})

	panel:child("top_border"):set_top(0)
	panel:child("bottom_border"):set_bottom(panel:h())
	panel:child("left_border"):set_left(0)
	panel:child("right_border"):set_right(panel:w())
end

function IngameManualGui:create_blur_background(panel, bcolor)
	panel:bitmap({
		texture = "guis/textures/test_blur_df",
		w = panel:w(),
		h = panel:h(),
		layer = -3,
		render_template = "VertexColorTexturedBlur3D"
	})
	panel:rect({
		color = bcolor or Color.white,
		alpha = 0.10,
		layer = -2,
		w = panel:w(),
		h = panel:h()
	})
end

function IngameManualGui:close()
	self._backdrop:close()
	managers.menu_component:play_transition(true)
	Hooks:RemovePostHook("RestorationIngameManualGuiMouseMoved")
	Hooks:RemovePostHook("RestorationIngameManualGuiMousePressed")
	self._backdrop = nil

	dofile( SC._path .. "lua/managers/menu/IngameManualGUI.lua")
end