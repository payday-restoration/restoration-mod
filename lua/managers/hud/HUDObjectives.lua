if not restoration:all_enabled("HUD/MainHUD", "HUD/ObjectivesPanel") then
	return
end
restoration.log_shit("[RESTORATION] LOADED OBJECTIVES")
RestorationCoreHooks:Post(HUDObjectives, "init", function(self)
	local objectives_panel = self._hud_panel:child("objectives_panel")
	local function hide_shit(o)
		o:set_alpha(0)
		o:hide()
		o:set_size(0,0)
	end
	hide_shit(objectives_panel:child("icon_objectivebox"))
	hide_shit(self._bg_box)
	
	local t = "guis/textures/restoration/objective"
	local objectives_pad_panel = objectives_panel:panel({name = "objectives_pad_panel", h = 64, w = 200})
	objectives_pad_panel:bitmap({name = "objective_start", texture = t, texture_rect = {0, 0, 13, 64}, layer = 0})
	local objective_mid = objectives_pad_panel:bitmap({name = "objective_mid", x = objectives_pad_panel:h(), texture_rect = {19, 0, 33, 64}, layer = 0, texture = t})
	local objective_end = objectives_pad_panel:bitmap({name = "objective_end", x = objectives_pad_panel:h() * 2, texture_rect = {52, 0, 12, 64}, layer = 0, texture = t})
	
	objectives_pad_panel:bitmap({name = "objective_start_new", texture_rect = {0, 0, 13, 64}, color = Color.white:with_alpha(0), layer = 1, texture = t})
	objectives_pad_panel:bitmap({name = "objective_mid_new", x = objective_mid:x(), texture_rect = {19, 0, 33, 64}, color = Color.white:with_alpha(0), layer = 1, texture = t})
	objectives_pad_panel:bitmap({name = "objective_end_new", x = objective_end:x(), texture_rect = {52, 0, 12, 64}, color = Color.white:with_alpha(0), layer = 1, texture = t})

	local objective_text = objectives_panel:child("objective_text")
	objective_text:configure({
		font_size = 22,
		x = objectives_pad_panel:x() + 12,
		y = 21,
	})
	objectives_panel:child("amount_text"):configure({
		text= "99/99",
		font_size = 22,
		x = objectives_pad_panel:x() + 8,
		y = 21
	})
	RestorationCoreCallbacks:AddValueChangedFunc(callback(self, self, "RestorationValueChanged"))
	self:RestorationValueChanged()
end)

function HUDObjectives:RestorationValueChanged()
	local objectives_panel = self._hud_panel:child("objectives_panel")
	local pad = objectives_panel:child("objectives_pad_panel")
	if alive(pad) then
		local bgcolor = restoration.Options:GetValue("HUD/Colors/ObjectivesBG")
		local fgcolor = restoration.Options:GetValue("HUD/Colors/ObjectivesFG")
		pad:child("objective_start"):set_color(bgcolor)
		pad:child("objective_mid"):set_color(bgcolor)
		pad:child("objective_end"):set_color(bgcolor)
		objectives_panel:child("objective_text"):set_color(fgcolor)
		objectives_panel:child("amount_text"):set_color(fgcolor)
	end
end

function HUDObjectives:activate_objective(data)
	self._active_objective_id = data.id
	local objectives_panel = self._hud_panel:child("objectives_panel")
	local objective_text = objectives_panel:child("objective_text")
	local objectives_pad_panel = objectives_panel:child("objectives_pad_panel")
	local amount_text = objectives_panel:child("amount_text")
	objective_text:set_text(utf8.to_upper(data.text))
	local _,_,w,_ = objective_text:text_rect()
	local panel_w = w + 12*2 
	
	amount_text:set_x(objective_text:x() + 4 + w)
	objectives_panel:show()
		
	local w2 = 0
	amount_text:hide()
	if data.amount then
		self:update_amount_objective(data)
		local _,_,wide,_ = amount_text:text_rect()
		w2 = wide + 4
	end
	objectives_pad_panel:set_w(panel_w + w2)
	objectives_pad_panel:child("objective_start"):set_x(0)
	objectives_pad_panel:child("objective_mid"):set_x(13)
	objectives_pad_panel:child("objective_mid"):set_w((panel_w + w2 - 20))
	objectives_pad_panel:child("objective_end"):set_x(13 + (panel_w + w2 - 20))

	objectives_pad_panel:child("objective_start_new"):set_shape(objectives_pad_panel:child("objective_start"):shape())
	objectives_pad_panel:child("objective_mid_new"):set_shape(objectives_pad_panel:child("objective_mid"):shape())
	objectives_pad_panel:child("objective_end_new"):set_shape(objectives_pad_panel:child("objective_end"):shape())
	objective_text:hide()
	self:open_right_done(data.amount)
	objectives_panel:stop()
	objectives_panel:animate(callback(self, self, "_animate_activate_objective"))	
end

function HUDObjectives:remind_objective(id)
	if id == self._active_objective_id then		
		self._hud_panel:child("objectives_panel"):animate(callback(self, self, "_animate_activate_objective"))
	end	
end

RestorationCoreHooks:Post(HUDObjectives, "complete_objective", function(self, data)
	if data.id == self._active_objective_id then
		self._hud_panel:child("objectives_panel"):stop()
	end
end)

function HUDObjectives:open_right_done(uses_amount)
	local objectives_panel = self._hud_panel:child("objectives_panel")
	local objective_text = objectives_panel:child("objective_text")
	local amount_text = objectives_panel:child("amount_text")
	amount_text:set_visible(uses_amount)
	objective_text:show()
end

function HUDObjectives:_animate_show_text(objective_text, amount_text)
	objective_text:set_alpha(1)
	amount_text:set_alpha(1)
end

function HUDObjectives:_animate_activate_objective(objectives_panel)
	local objectives_pad_panel = objectives_panel:child("objectives_pad_panel")
	local objective_start_new = objectives_pad_panel:child("objective_start_new")
	local objective_mid_new = objectives_pad_panel:child("objective_mid_new")
	local objective_end_new = objectives_pad_panel:child("objective_end_new")
	local TOTAL_T = 5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local a = math.sin(t * 45 * 10) -- t / TOTAL_T
		objective_start_new:set_color(objective_start_new:color():with_alpha(a))
		objective_mid_new:set_color(objective_mid_new:color():with_alpha(a))
		objective_end_new:set_color(objective_end_new:color():with_alpha(a))
		objectives_panel:set_x(math.round((1 + math.sin((TOTAL_T - t) * 450 * 2)) * (24 * (t / TOTAL_T))))
	end
	objective_start_new:set_color(objective_start_new:color():with_alpha(0))
	objective_mid_new:set_color(objective_mid_new:color():with_alpha(0))
	objective_end_new:set_color(objective_end_new:color():with_alpha(0))
end

function HUDObjectives:_animate_complete_objective() end