if restoration.Options:GetValue("HUD/MainHUD") then
function MenuBackdropGUI:animate_bg_text(text)
	local function animate_text(o)
		local left = true
		local target_speed = 10
		local speed = 15
		local dt = 0
		local start_x = o:x()
		while true do
			dt = coroutine.yield()
			dt = self._fixed_dt and 0.033333335 or dt
			speed = speed + (target_speed - speed) * dt * 20
			o:move(speed * dt * (left and -1 or 1), 0)
			if 10 < math.abs(o:x() - start_x) then
				left = not left
				speed = 50
			end
		end
	end
	text:animate( animate_text )
	end
end
