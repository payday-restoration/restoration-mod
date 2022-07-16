if _G.IS_VR then
	return
end
if not restoration:all_enabled("HUD/MainHUD", "HUD/Hint") then
	return
end

RestorationCoreHooks:Post(HUDHint, "init", function(self)
	self._hint_panel:set_center_y(self._hud_panel:h() / 2.7)
	local function hide_shit(o)
		o:set_alpha(0)
		o:hide()
		o:set_size(0,0)
	end
	hide_shit(self._hint_panel:child("marker"))
	hide_shit(self._hint_panel:child("clip_panel"))
	self._hint_panel:text({
		name = "hint_text",
		font_size = 32,
		font = tweak_data.menu.medium_font_no_outline,
		align = "center",
		vertical = "center",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._hint_panel:text({name = "hint_shadow_text", font_size = 32, font = tweak_data.menu.medium_font_no_outline, color = Color.black, align = "center", vertical = "center", layer = 0, wrap = false, word_wrap = false, y = 1, x = 1})
	RestorationCoreCallbacks:AddValueChangedFunc(callback(self, self, "RestorationValueChanged"))
	self:RestorationValueChanged()
end)

function HUDHint:RestorationValueChanged()
	self._hint_panel:child("hint_text"):set_color(restoration.Options:GetValue("HUD/Colors/HintText"))
	--maybe also shadow color?
end

RestorationCoreHooks:Post(HUDHint, "show", function(self, params)
	local text = params.text
	self._hint_panel:child("hint_text"):set_text(utf8.to_upper(""))
end)

function HUDHint:_animate_show(hint_panel, done_cb, seconds, text)
	local split = {}
	for i = 1, string.len(text) do
		table.insert(split, string.sub(text, i, i))
	end
	local hint = ""
	hint_panel:show()
	hint_panel:set_alpha(1)
	local hint_text = hint_panel:child("hint_text")
	local hint_shadow_text = hint_panel:child("hint_shadow_text")
	local t = seconds
	local cs = 0.0
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		if t < 0.5 then
			hint_panel:set_alpha(t/0.5)
		end
		cs = cs - dt
		if cs < 0 and #split > 0 then
			hint = hint..table.remove(split, 1)
			hint_text:set_text(hint.."")
			hint_shadow_text:set_text(hint.."")
			cs = 0.025
		end
	end
	hint_panel:hide()
	done_cb()
end