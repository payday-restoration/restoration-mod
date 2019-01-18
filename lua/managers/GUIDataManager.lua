if core then
	core:module("CoreGuiDataManager")
end

function GuiDataManager:layout_scaled_fullscreen_workspace(ws, scale, on_screen_scale)
    local data = {}
    local res = RenderSettings.resolution
    data.base_res = {x = 1280, y = 720}
    data.sc = (2 - scale)
    data.aspect_width = data.base_res.x / self:_aspect_ratio()
    data.h = math.round(data.sc * math.max(data.base_res.y, data.aspect_width))
    data.w = math.round(data.sc * math.max(data.base_res.x, data.aspect_width / data.h))

    data.safe_w = math.round(on_screen_scale * res.x)
    data.safe_h = math.round(on_screen_scale * res.y)   
    data.sh = math.min(data.safe_h, data.safe_w / (data.w / data.h))
    data.sw = math.min(data.safe_w, data.safe_h * (data.w / data.h))
    data.on_screen_width = data.sw
    data.x = res.x / 2 - data.sh * (data.w / data.h) / 2
    data.y = res.y / 2 - data.sw / (data.w / data.h) / 2
    
	data.convert_x = math.floor((self._fullrect_data.w - data.w) / 2)
	data.convert_y = math.floor((self._fullrect_data.h - data.h) / 2)
    self:_set_layout(ws, data)
    ws:set_screen(data.w, data.h, data.x, data.y, math.min(data.sw, data.sh * (data.w / data.h)))
end