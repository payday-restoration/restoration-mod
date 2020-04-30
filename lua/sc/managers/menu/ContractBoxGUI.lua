--[[
function ContractBoxGui:init(ws, fullscreen_ws)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()
	local crewpage_text = self._panel:text({
		vertical = "top",
		name = "crewpage_text",
		align = "left",
		text = self:_crewpage_text(),
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.text
	})
	local _, _, w, h = crewpage_text:text_rect()

	crewpage_text:set_size(w, h)

	local wfs_text = nil

	if not Network:is_server() then
		wfs_text = self._panel:text({
			vertical = "bottom",
			name = "wfs",
			align = "right",
			text = managers.localization:to_upper_text("victory_client_waiting_for_server"),
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.text
		})
		local _, _, w, h = wfs_text:text_rect()

		wfs_text:set_size(w, h)
		wfs_text:set_rightbottom(self._panel:w(), self._panel:h())
	elseif not managers.job:has_active_job() then
		wfs_text = self._panel:text({
			vertical = "bottom",
			name = "wfs",
			align = "right",
			text = managers.localization:to_upper_text("menu_choose_new_contract"),
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.text
		})
		local _, _, w, h = wfs_text:text_rect()

		wfs_text:set_size(w, h)
		wfs_text:set_rightbottom(self._panel:w(), self._panel:h())
	end

	self._bg_rect = self._fullscreen_panel:rect({
		name = "lobby_bg",
		alpha = 0,
		layer = -1,
		color = Color.black
	})

	if not managers.menu:is_pc_controller() and wfs_text then
		wfs_text:set_rightbottom(self._panel:w() - 40, self._panel:h() - 150)
	end

	if MenuBackdropGUI then
		if crewpage_text then
			local bg_text = self._fullscreen_panel:text({
				name = "crewpage_text",
				vertical = "top",
				h = 90,
				alpha = 0.4,
				align = "left",
				layer = 1,
				text = self:_crewpage_text(),
				font_size = tweak_data.menu.pd2_massive_font_size,
				font = tweak_data.menu.pd2_massive_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(crewpage_text:world_x(), crewpage_text:world_center_y())

			bg_text:set_world_left(x)
			bg_text:set_world_center_y(y)
			bg_text:move(-13, 9)
			MenuBackdropGUI.animate_bg_text(self, bg_text)
		end

		if managers.menu:is_pc_controller() and wfs_text and false then
			local bg_text = self._fullscreen_panel:text({
				vertical = "bottom",
				h = 90,
				alpha = 0.4,
				align = "right",
				layer = 1,
				text = wfs_text:text(),
				font_size = tweak_data.menu.pd2_massive_font_size,
				font = tweak_data.menu.pd2_massive_font,
				color = tweak_data.screen_colors.button_stage_3
			})
			local x, y = managers.gui_data:safe_to_full_16_9(wfs_text:world_right(), wfs_text:world_center_y())

			bg_text:set_world_right(x)
			bg_text:set_world_center_y(y)
			bg_text:move(13, -9)
			MenuBackdropGUI.animate_bg_text(self, bg_text)
		end
	end

	self:create_contract_box()
	self:create_mutators_tooltip()

	self._lobby_mutators_text = self._panel:text({
		vertical = "top",
		name = "mutated_text",
		align = "left",
		text = managers.localization:to_upper_text("menu_mutators_lobby_wait_title"),
		font_size = tweak_data.menu.pd2_large_font_size * 0.75,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.mutators_color_text
	})
	local _, _, w, h = self._lobby_mutators_text:text_rect()

	self._lobby_mutators_text:set_size(w, h)
	self._lobby_mutators_text:set_top(crewpage_text:bottom())

	local job_chain = managers.job:current_job_chain_data()
	local mutators_active = managers.mutators:are_mutators_enabled() and managers.mutators:allow_mutators_in_level(job_chain and job_chain[1] and job_chain[1].level_id)

	self._lobby_mutators_text:set_visible(mutators_active)
end

function ContractBoxGui:_crewpage_text()
	return managers.localization:to_upper_text("menu_crewpage")
end
--]]

function ContractBoxGui:create_contract_box()
	if not managers.network:session() then
		return
	end

	if self._contract_panel and alive(self._contract_panel) then
		self._panel:remove(self._contract_panel)
	end

	if self._contract_text_header and alive(self._contract_text_header) then
		self._panel:remove(self._contract_text_header)
	end

	if alive(self._panel:child("pro_text")) then
		self._panel:remove(self._panel:child("pro_text"))
	end

	self._contract_panel = nil
	self._contract_text_header = nil
	local contact_data = managers.job:current_contact_data()
	local job_data = managers.job:current_job_data()
	local job_chain = managers.job:current_job_chain_data()
	local job_id = managers.job:current_job_id()
	local job_tweak = tweak_data.levels[job_id]
	self._contract_panel = self._panel:panel({
		name = "contract_box_panel",
		h = 100,
		layer = 0,
		w = self._panel:w() * 0.35
	})

	self._contract_panel:rect({
		halign = "grow",
		valign = "grow",
		layer = -1,
		color = Color(0.5, 0, 0, 0)
	})

	local font = tweak_data.menu.pd2_small_font
	local font_size = tweak_data.menu.pd2_small_font_size

	if contact_data then
		self._contract_text_header = self._panel:text({
			text = utf8.to_upper(managers.localization:text(contact_data.name_id) .. ": " .. managers.localization:text(job_data.name_id)),
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.text,
			blend_mode = "add"
		})
		local length_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_length_header"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local paygrade_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_paygrade_header"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local exp_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("menu_experience"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		local payout_text_header = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_payout_header"),
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		do
			local _, _, tw, th = self._contract_text_header:text_rect()
			self._contract_text_header:set_size(tw, th)
		end
		local w = 0
		do
			local _, _, tw, th = length_text_header:text_rect()
			w = math.max(w, tw)
			length_text_header:set_size(tw, th)
		end
		do
			local _, _, tw, th = paygrade_text_header:text_rect()
			w = math.max(w, tw)
			paygrade_text_header:set_size(tw, th)
		end
		do
			local _, _, tw, th = exp_text_header:text_rect()
			w = math.max(w, tw)
			exp_text_header:set_size(tw, th)
		end
		do
			local _, _, tw, th = payout_text_header:text_rect()
			w = math.max(w, tw)
			payout_text_header:set_size(tw, th)
		end
		w = w + 10
		length_text_header:set_right(w)
		paygrade_text_header:set_right(w)
		exp_text_header:set_right(w)
		payout_text_header:set_right(w)
		paygrade_text_header:set_top(10)
		length_text_header:set_top(paygrade_text_header:bottom())
		exp_text_header:set_top(length_text_header:bottom())
		payout_text_header:set_top(exp_text_header:bottom())
		local length_text = self._contract_panel:text({
			text = managers.localization:to_upper_text("cn_menu_contract_length", {
				stages = #job_data.chain
			}),
			align = "left",
			vertical = "top",
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text
		})
		length_text:set_position(length_text_header:right() + 5, length_text_header:top())
		local filled_star_rect = {
			0,
			32,
			32,
			32
		}
		local empty_star_rect = {
			32,
			32,
			32,
			32
		}
		local job_stars = managers.job:current_job_stars()
		local job_and_difficulty_stars = managers.job:current_job_and_difficulty_stars()
		local difficulty_stars = job_and_difficulty_stars - job_stars
		local risk_color = tweak_data.screen_colors.risk
		local cy = paygrade_text_header:center_y()
		local sx = paygrade_text_header:right() + 5
		local level_data = {
			texture = "guis/textures/pd2/mission_briefing/difficulty_icons",
			texture_rect = filled_star_rect,
			w = 16,
			h = 16,
			color = tweak_data.screen_colors.text,
			alpha = 1
		}
		local risk_data = {
			texture = "guis/textures/pd2/crimenet_skull",
			w = 16,
			h = 16,
			color = risk_color,
			alpha = 1
		}
		for i = 1, job_and_difficulty_stars do
			local x = sx + (i - 1) * 18
			local is_risk = i > job_stars
			local star_data = is_risk and risk_data or level_data
			local star = self._contract_panel:bitmap(star_data)
			star:set_x(x)
			star:set_center_y(math.round(cy))
		end
		local plvl = managers.experience:current_level()
		local player_stars = math.max(math.ceil(plvl / 10), 1)
		local contract_visuals = job_data.contract_visuals or {}
		local xp_min = contract_visuals.min_mission_xp and (type(contract_visuals.min_mission_xp) == "table" and contract_visuals.min_mission_xp[difficulty_stars + 1] or contract_visuals.min_mission_xp) or 0
		local xp_max = contract_visuals.max_mission_xp and (type(contract_visuals.max_mission_xp) == "table" and contract_visuals.max_mission_xp[difficulty_stars + 1] or contract_visuals.max_mission_xp) or 0
		local total_xp_min, _ = managers.experience:get_contract_xp_by_stars(job_id, job_stars, difficulty_stars, job_data.professional, #job_chain, {
			mission_xp = xp_min
		})
		local total_xp_max, _ = managers.experience:get_contract_xp_by_stars(job_id, job_stars, difficulty_stars, job_data.professional, #job_chain, {
			mission_xp = xp_max
		})
		local xp_text_min = managers.money:add_decimal_marks_to_string(tostring(math.round(total_xp_min)))
		local xp_text_max = managers.money:add_decimal_marks_to_string(tostring(math.round(total_xp_max)))
		local job_xp_text = total_xp_min < total_xp_max and managers.localization:text("menu_number_range", {
			min = xp_text_min,
			max = xp_text_max
		}) or xp_text_min
		local job_xp = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = job_xp_text,
			color = tweak_data.screen_colors.text
		})
		local _, _, tw, th = job_xp:text_rect()

		job_xp:set_size(tw, th)
		job_xp:set_position(math.round(exp_text_header:right() + 5), math.round(exp_text_header:top()))

		local risk_xp = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = " +" .. tostring(math.round(0)),
			color = risk_color
		})
		local _, _, tw, th = risk_xp:text_rect()

		risk_xp:set_size(tw, th)
		risk_xp:set_position(math.round(job_xp:right()), job_xp:top())
		risk_xp:hide()

		local job_ghost_mul = managers.job:get_ghost_bonus() or 0
		local ghost_xp_text = nil

		if job_ghost_mul ~= 0 then
			local job_ghost = math.round(job_ghost_mul * 100)
			local job_ghost_string = tostring(math.abs(job_ghost))
			local ghost_color = tweak_data.screen_colors.ghost_color

			if job_ghost == 0 and job_ghost_mul ~= 0 then
				job_ghost_string = string.format("%0.2f", math.abs(job_ghost_mul * 100))
			end

			local text_prefix = job_ghost_mul < 0 and "-" or "+"
			local text_string = " (" .. text_prefix .. job_ghost_string .. "%)"
			ghost_xp_text = self._contract_panel:text({
				blend_mode = "add",
				font = font,
				font_size = font_size,
				text = text_string,
				color = ghost_color
			})
			local _, _, tw, th = ghost_xp_text:text_rect()

			ghost_xp_text:set_size(tw, th)
			ghost_xp_text:set_position(math.round(risk_xp:visible() and risk_xp:right() or job_xp:right()), job_xp:top())
		end

		local job_heat = managers.job:current_job_heat() or 0
		local job_heat_mul = managers.job:heat_to_experience_multiplier(job_heat) - 1
		local heat_xp_text = nil

		if job_heat_mul ~= 0 then
			job_heat = math.round(job_heat_mul * 100)
			local job_heat_string = tostring(math.abs(job_heat))
			local heat_color = managers.job:current_job_heat_color()

			if job_heat == 0 and job_heat_mul ~= 0 then
				job_heat_string = string.format("%0.2f", math.abs(job_heat_mul * 100))
			end

			local text_prefix = job_heat_mul < 0 and "-" or "+"
			local text_string = " (" .. text_prefix .. job_heat_string .. "%)"
			heat_xp_text = self._contract_panel:text({
				blend_mode = "add",
				font = font,
				font_size = font_size,
				text = text_string,
				color = heat_color
			})
			local _, _, tw, th = heat_xp_text:text_rect()

			heat_xp_text:set_size(tw, th)
			heat_xp_text:set_position(math.round(ghost_xp_text and ghost_xp_text:right() or risk_xp:visible() and risk_xp:right() or job_xp:right()), job_xp:top())
		end
		local total_payout, stage_payout_table, job_payout_table = managers.money:get_contract_money_by_stars(job_stars, difficulty_stars, #job_chain)
		local total_stage_value = stage_payout_table[2]
		local total_stage_risk_value = stage_payout_table[4]
		local total_job_value = job_payout_table[2]
		local total_job_risk_value = job_payout_table[4]
		local job_money = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = managers.experience:cash_string(math.round(total_stage_value + total_job_value)),
			color = tweak_data.screen_colors.text
		})
		do
			local _, _, tw, th = job_money:text_rect()
			job_money:set_size(tw, th)
		end
		job_money:set_position(math.round(payout_text_header:right() + 5), math.round(payout_text_header:top()))
		local risk_money = self._contract_panel:text({
			font = font,
			font_size = font_size,
			text = " +" .. managers.experience:cash_string(math.round(total_stage_risk_value + total_job_risk_value)),
			color = risk_color
		})
		do
			local _, _, tw, th = risk_money:text_rect()
			risk_money:set_size(tw, th)
		end
		risk_money:set_position(math.round(job_money:right()), job_money:top())
		self._contract_panel:set_h(payout_text_header:bottom() + 10)
	elseif managers.menu:debug_menu_enabled() then
		local debug_start = self._contract_panel:text({
			text = "Use DEBUG START to start your level",
			font_size = font_size,
			font = font,
			color = tweak_data.screen_colors.text,
			x = 10,
			y = 10,
			wrap = true,
			word_wrap = true
		})
		debug_start:grow(-debug_start:x() - 10, debug_start:y() - 10)
	end
	self._contract_panel:set_rightbottom(self._panel:w() - 10, self._panel:h() - 50)
	if self._contract_text_header then
		self._contract_text_header:set_bottom(self._contract_panel:top())
		self._contract_text_header:set_left(self._contract_panel:left())
		local wfs_text = self._panel:child("wfs")
		if wfs_text and not managers.menu:is_pc_controller() then
			wfs_text:set_rightbottom(self._panel:w() - 20, self._contract_text_header:top())
		end
	end
	local wfs = self._panel:child("wfs")
	if wfs then
		self._contract_panel:grow(0, wfs:h() + 5)
		self._contract_panel:move(0, -(wfs:h() + 5))
		if self._contract_text_header then
			self._contract_text_header:move(0, -(wfs:h() + 5))
		end
		wfs:set_world_rightbottom(self._contract_panel:world_right() - 5, self._contract_panel:world_bottom())
	end
	BoxGuiObject:new(self._contract_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	for i = 1, 4 do
		local peer = managers.network:session():peer(i)
		if peer then
			local peer_pos = managers.menu_scene:character_screen_position(i)
			local peer_name = peer:name()
			if peer_pos then
				self:create_character_text(i, peer_pos.x, peer_pos.y, peer_name)
			end
		end
	end
	self._enabled = true
end