MenuItemChallenge.TYPE = "challenge"

if not PackageManager:loaded("packages/custom_fonts") then
	PackageManager:load("packages/custom_fonts")
end

function MenuItemChallenge:make_fine_text(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

function MenuItemChallenge:setup_gui( node, row_item )
	local font_check
	local russian = Idstring("russian"):key() == SystemInfo:language():key()
	local english = Idstring("english"):key() == SystemInfo:language():key()
	local korean = Idstring("korean"):key() == SystemInfo:language():key()

	if russian or korean then
		font_check = tweak_data.menu.pd2_small_font
	else
		font_check = "fonts/pdth_challenge"
	end
	
	--Definitions
	local safe_rect = managers.gui_data:scaled_size()

	local challenge_data = managers.challenges_res:challenge( self:parameter( "challenge" ) )
	local progress_data = managers.challenges_res:active_challenge( self:parameter( "challenge" ) )

	if not progress_data then
		progress_data = { amount = challenge_data.count }
	end

	row_item.marker_color = tweak_data.screen_colors.challenge_completed_color:with_alpha(1)
	node._marker_data.gradient:set_alpha(1)

	do --Main Item Panel
		row_item.gui_panel = node.item_panel:panel({
			w = node.item_panel:w(),
			layer = 5
		})
		row_item.gui_panel:set_right(node.item_panel:w())

		row_item.challenge_name = node._text_item_part(node, row_item, row_item.gui_panel, node._left_align(node), "left")
		row_item.challenge_name:set_layer(node.layers.items + 1)
		row_item.challenge_name:set_font(Idstring(font_check))
		row_item.challenge_name:set_font_size(tweak_data.menu.small_font_size + 3)
		row_item.challenge_name:set_x(row_item.challenge_name:x() + tweak_data.menu.info_padding)
		row_item.challenge_name:set_blend_mode("normal")
		row_item.challenge_name:set_color(Color.white)
		self:make_fine_text(row_item.challenge_name)

		row_item.gui_panel:set_height(row_item.challenge_name:h())
	end

	do --Progress Panel
		local progress_h = row_item.challenge_name:h() - 2
		row_item.progress_panel = row_item.gui_panel:panel({
			h = progress_h,
			w = progress_h * (255/22),
			layer = node.layers.items + 1
		})
		row_item.progress_panel:set_right(row_item.challenge_name:left() - tweak_data.menu.info_padding)

		local bg = row_item.progress_panel:bitmap({
			name = "background",
			blend_mode = "normal",
			layer = 0,
			texture = "guis/textures/restoration/challenge_progress",
			texture_rect = {0, 414, 360, 22},
			w = row_item.progress_panel:w(),
			h = row_item.progress_panel:h()
		})

		row_item.progress_bitmap = row_item.progress_panel:bitmap({
			name = "foreground",
			blend_mode = "normal",
			layer = 1,
			texture = "guis/textures/restoration/challenge_progress",
			color = Color.white:with_alpha(0.5),
			texture_rect = {0, 392, 360, 22},
			w = row_item.progress_panel:w(),
			h = row_item.progress_panel:h()
		})

		row_item.progress_text = row_item.progress_panel:text( {
			font_size = row_item.challenge_name:font_size() - 2,
			font = font_check,
			layer = 2
		})
		if challenge_data.count then
			row_item.progress_text:set_text(progress_data.amount .. "/" .. challenge_data.count)
			local frac = progress_data.amount / challenge_data.count
			row_item.progress_bitmap:set_w(frac * row_item.progress_panel:w())
			local rect = {0, 392, 360, 22}
			row_item.progress_bitmap:set_texture_rect(rect[1], rect[2], rect[3] * frac, rect[4])
		else
			row_item.progress_panel:set_visible(false)
		end
		self:make_fine_text(row_item.progress_text)
		row_item.progress_text:set_center(bg:center())
	end
	do -- Info Panel
		local gui_info_w = 500
		row_item.gui_info_panel = node.safe_rect_panel:panel({
			visible = false,
			layer = node.layers.items,
			w = gui_info_w,
			h = gui_info_w * (4/10),
		})

		row_item.gui_info_panel:set_center_x(safe_rect.width / 4)
		row_item.gui_info_panel:set_top(row_item.gui_info_panel:left() / 2)

		local bg_box = row_item.gui_info_panel:rect({
			name = "bg_box",
			color = Color.black:with_alpha(0.25),
			layer = 0,
			w = row_item.gui_info_panel:w(),
			h = row_item.gui_info_panel:h()
		})
		row_item.bg_box = bg_box

		row_item.challenge_hl = row_item.gui_info_panel:text({
			text = row_item.text,
			layer = 1,
			font = font_check,
			font_size = tweak_data.menu.challenges_font_size,
			wrap = true,
			word_wrap = true
		})
		self:make_fine_text(row_item.challenge_hl)
		row_item.challenge_hl:set_w(row_item.gui_info_panel:w() - (tweak_data.menu.info_padding * 2))
		row_item.challenge_hl:set_lefttop(tweak_data.menu.info_padding, tweak_data.menu.info_padding)

		row_item.description_text = row_item.gui_info_panel:text({
			text = self:parameter("description"),
			layer = 1,
			font = font_check,
			font_size = tweak_data.menu.small_font_size,
			wrap = true,
			word_wrap = true
		})
		self:make_fine_text(row_item.description_text)
		row_item.description_text:set_w(row_item.gui_info_panel:w() - (tweak_data.menu.info_padding * 2))
		row_item.description_text:set_top(row_item.challenge_hl:bottom() + tweak_data.menu.info_padding)
		row_item.description_text:set_left(tweak_data.menu.info_padding)

		BoxGuiObject:new(row_item.gui_info_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
	end

	return true
end

function MenuItemChallenge:highlight_row_item( node, row_item, mouse_over )
	row_item.gui_info_panel:set_visible(true)
	row_item.challenge_name:set_color(Color.black)
	row_item.progress_bitmap:set_color(Color.white)
	return true
end

function MenuItemChallenge:fade_row_item( node, row_item )
	row_item.gui_info_panel:set_visible(false)
	row_item.challenge_name:set_color(Color.white)
	row_item.progress_bitmap:set_color(Color.white:with_alpha(0.5))

	return true
end

function MenuItemChallenge:_layout( node, row_item )
end