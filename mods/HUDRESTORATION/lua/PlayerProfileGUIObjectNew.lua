if Restoration.options.restoration_mrender == true then

function PlayerProfileGuiObject:init(ws)
	local panel = ws:panel():panel()
	managers.menu_component:close_contract_gui()
	local next_level_data = managers.experience:next_level_data() or {}
	local max_left_len = 0
	local max_right_len = 0
	local font = tweak_data.menu.default_font_no_outline
	local font_size = 20
	local bg_ring = panel:bitmap({
		texture = "guis/textures/pd2/level_ring_small",
		w = font_size * 4,
		h = font_size * 4,
		x = 10,
		y = 10,
		color = Color.black,
		alpha = 0.4
	})
	local exp_ring = panel:bitmap({
		texture = "guis/textures/pd2/level_ring_small",
		w = font_size * 4,
		h = font_size * 4,
		x = 10,
		y = 10,
		color =  Color((next_level_data.current_points or 1) / (next_level_data.points or 1), 1, 1),
		render_template = "VertexColorTexturedRadial",
		blend_mode = "add",
		layer = 1
	})
	local player_level = managers.experience:current_level()
	local player_rank = managers.experience:current_rank()
	local is_infamous = player_rank > 0
	local level_string = (is_infamous and managers.experience:rank_string(player_rank) .. "-" or "") .. tostring(player_level)
	local level_text = panel:text({
		font = font,
		font_size = tweak_data.menu.pd2_medium_font_size + (is_infamous and -5 or 0),
		text = level_string,
		color = tweak_data.hud.prime_color 
	})
	self:_make_fine_text(level_text)
	level_text:set_center(exp_ring:center())
	max_left_len = math.max(max_left_len, level_text:w())
	local player_text = panel:text({
		font = font,
		font_size = font_size,
		text = tostring(managers.network.account:username() or managers.blackmarket:get_preferred_character_real_name()),
		y = 10,
		color = tweak_data.screen_color_blue
	})
	self:_make_fine_text(player_text)
	player_text:set_left(math.round(exp_ring:right()))
	max_left_len = math.max(max_left_len, player_text:w())
	local money_text = panel:text({
		text = self:get_text("menu_cash", {
			money = managers.money:total_string()
		}),
		font_size = font_size,
		font = font,
		color = tweak_data.screen_color_blue 
	})
	self:_make_fine_text(money_text)
	money_text:set_left(math.round(exp_ring:right()))
	money_text:set_top(math.round(player_text:bottom()))
	max_left_len = math.max(max_left_len, money_text:w())
	local total_money_text = panel:text({
		text = self:get_text("hud_offshore_account") .. ": " .. managers.experience:cash_string(managers.money:offshore()),
		font_size = font_size,
		font = font,
		color = tweak_data.screen_color_blue
		
	})
	self:_make_fine_text(total_money_text)
	total_money_text:set_left(math.round(exp_ring:right()))
	total_money_text:set_top(math.round(money_text:bottom()))
	max_left_len = math.max(max_left_len, total_money_text:w())
	local skillpoints = managers.skilltree:points()
	local skill_text, skill_glow
	if skillpoints > 0 then
		skill_text = panel:text({
			text = self:get_text("menu_spendable_skill_points", {
				points = tostring(skillpoints)
			}),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_color_blue,
			layer = 1
		})
		self:_make_fine_text(skill_text)
		skill_text:set_left(math.round(exp_ring:right()))
		skill_text:set_top(math.round(total_money_text:bottom()))
		max_left_len = math.max(max_left_len, skill_text:w())
		local skill_icon = panel:bitmap({
			texture = "guis/textures/pd2/shared_skillpoint_symbol",
			w = 16,
			h = 16,
			layer = 1,
			color = tweak_data.screen_color_blue
		})
		skill_icon:set_right(skill_text:left())
		skill_icon:set_center_y(skill_text:center_y() + 1)
		skill_glow = panel:bitmap({
			texture = "guis/textures/pd2/crimenet_marker_glow",
			w = panel:w(),
			h = skill_text:h() * 2,
			color = tweak_data.screen_colors.button_stage_3,
			layer = 0,
			blend_mode = "add"
		})
		skill_glow:set_center_y(skill_icon:center_y())
	end
	local font_scale = 1
	local mastermind_ponts, num_skills = managers.skilltree:get_tree_progress("mastermind")
	mastermind_ponts = string.format("%02d", mastermind_ponts)
	local mastermind_text = panel:text({
		text = self:get_text("menu_profession_progress", {
			profession = self:get_text("st_menu_mastermind"),
			progress = mastermind_ponts,
			num_skills = num_skills
		}),
		font_size = font_size * font_scale,
		font = font,
		color = tweak_data.screen_color_blue,
		y = 10
	})
	self:_make_fine_text(mastermind_text)
	max_right_len = math.max(max_right_len, mastermind_text:w())
	local enforcer_ponts, num_skills = managers.skilltree:get_tree_progress("enforcer")
	enforcer_ponts = string.format("%02d", enforcer_ponts)
	local enforcer_text = panel:text({
		text = self:get_text("menu_profession_progress", {
			profession = self:get_text("st_menu_enforcer"),
			progress = enforcer_ponts,
			num_skills = num_skills
		}),
		font_size = font_size * font_scale,
		font = font,
		color = tweak_data.screen_color_blue, 
	})
	self:_make_fine_text(enforcer_text)
	enforcer_text:set_top(math.round(mastermind_text:bottom()))
	max_right_len = math.max(max_right_len, enforcer_text:w())
	local technician_ponts, num_skills = managers.skilltree:get_tree_progress("technician")
	technician_ponts = string.format("%02d", technician_ponts)
	local technician_text = panel:text({
		text = self:get_text("menu_profession_progress", {
			profession = self:get_text("st_menu_technician"),
			progress = technician_ponts,
			num_skills = num_skills
		}),
		font_size = font_size * font_scale,
		font = font,
		color = tweak_data.screen_color_blue,
	})
	self:_make_fine_text(technician_text)
	technician_text:set_top(math.round(enforcer_text:bottom()))
	max_right_len = math.max(max_right_len, technician_text:w())
	local ghost_ponts, num_skills = managers.skilltree:get_tree_progress("ghost")
	ghost_ponts = string.format("%02d", ghost_ponts)
	local ghost_text = panel:text({
		text = self:get_text("menu_profession_progress", {
			profession = self:get_text("st_menu_ghost"),
			progress = ghost_ponts,
			num_skills = num_skills
		}),
		font_size = font_size * font_scale,
		font = font,
		color = tweak_data.screen_color_blue, 
	})
	self:_make_fine_text(ghost_text)
	ghost_text:set_top(math.round(technician_text:bottom()))
	max_right_len = math.max(max_right_len, ghost_text:w())
	local hoxton_ponts, num_skills = managers.skilltree:get_tree_progress("hoxton")
	hoxton_ponts = string.format("%02d", hoxton_ponts)
	local hoxton_text = panel:text({
		text = self:get_text("menu_profession_progress", {
			profession = self:get_text("st_menu_hoxton_pack"),
			progress = hoxton_ponts,
			num_skills = num_skills
		}),
		font_size = font_size * font_scale,
		font = font,
		color = tweak_data.screen_color_blue,
	})
	self:_make_fine_text(hoxton_text)
	hoxton_text:set_top(math.round(ghost_text:bottom()))
	max_right_len = math.max(max_right_len, hoxton_text:w())
	self._panel = panel
	if not skill_text or not skill_text:bottom() then
	end
	self._panel:set_size(exp_ring:w() + max_left_len + 15 + max_right_len + 10, math.max(total_money_text:bottom(), hoxton_text:bottom()) + 8)
	self._panel:set_bottom(self._panel:parent():h() - 70)
	--[[BoxGuiObject:new(self._panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})]]
	mastermind_text:set_right(self._panel:w() - 10)
	enforcer_text:set_right(self._panel:w() - 10)
	technician_text:set_right(self._panel:w() - 10)
	ghost_text:set_right(self._panel:w() - 10)
	hoxton_text:set_right(self._panel:w() - 10)
	bg_ring:move(-5, 0)
	exp_ring:move(-5, 0)
	level_text:set_center(exp_ring:center())
	if skill_glow then
		local animate_new_skillpoints = function(o)
			while true do
				over(1, function(p)
					o:set_alpha(math.lerp(0.4, 0.85, math.sin(p * 180)))
				end)
			end
		end
		skill_glow:set_w(self._panel:w())
		skill_glow:set_center_x(skill_text and skill_text:center_x() or 0)
		skill_glow:animate(animate_new_skillpoints)
	end
	self:_rec_round_object(panel)
	
	self._panel:rect( { color=Color(0.5, 0, 0, 0), layer=-1 } )
	self._panel:polyline( { color=tweak_data.screen_color_blue:with_alpha(0.5), blend_mode="add", line_width=1, closed=true, points={ Vector3( 0, 0, 0 ), Vector3( self._panel:w(), 0, 0 ), Vector3( self._panel:w(), self._panel:h(), 0 ), Vector3( 0, self._panel:h(), 0 ) } } )
end
end
