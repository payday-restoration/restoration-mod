HUDEffectScreen = HUDEffectScreen or class()
function HUDEffectScreen:init(hud)
	self._hud_panel = hud.panel
	
	self._effect_panels = {}
end

function HUDEffectScreen:_get_or_create_effect(effect_id, texture)
	effect_id = effect_id or "default"
	texture = texture or "bloodyscreen"
	
	if self._effect_panels[effect_id] then
		return self._effect_panels[effect_id]
	end
	
	local panel = self._hud_panel:bitmap({
		name = "effect_layer_" .. tostring(effect_id),
		visible = true,
		texture = "guis/textures/restoration/" .. texture,
		layer = 0,
		color = Color(1, 1, 1),
		alpha = 0,
		blend_mode = "add",
		w = self._hud_panel:w(),
		h = self._hud_panel:h(),
		x = 0,
		y = 0
	})
	
	self._effect_panels[effect_id] = {
		panel = panel,
		active = false,
		duration = 0
	}
	
	return self._effect_panels[effect_id]
end

function HUDEffectScreen:do_effect_screen(duration, color, effect_id, texture)
	if _G.is_vr then
		return
	end
	
	local effect = self:_get_or_create_effect(effect_id, texture)
	
	effect.panel:set_alpha(1)
	effect.duration = duration
	effect.panel:set_color(Color(color[1], color[2], color[3]))
	
	if effect.active then
		effect.panel:stop()
	end
	
	effect.active = true
	
	effect.panel:animate(function(panel)
		self:_fadeout_effect_screen(panel, effect_id)
	end)
end

function HUDEffectScreen:_fadeout_effect_screen(panel, effect_id)
	local effect = self._effect_panels[effect_id]
	local start_time = Application:time()
	local curr_time = start_time
	while curr_time - start_time < effect.duration do
		curr_time = Application:time()
		panel:set_alpha(1 - ((curr_time - start_time) / effect.duration))
		coroutine.yield()
	end
	panel:set_alpha(0)
	effect.active = false
end
