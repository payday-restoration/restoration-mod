require("lib/managers/menu/MenuBackdropGUI")

function MenuBackdropGUI:animate_bg_text( text )
	local animate_text = function(o)
		local left = true
		local target_speed = 10
		local speed = 15
		local dt = 0
		
		local start_x = o:x()
		while(true) do
			dt = coroutine.yield()
			dt = (self._fixed_dt and 1/30) or dt
			speed = speed + ( target_speed - speed ) * dt * 20
			
			o:move( speed * dt * (left and -1 or 1), 0 )
			if( math.abs( o:x() - start_x  ) > 10 ) then
				left = not left
				speed = 50
			end
		end
	end
	
	text:animate( animate_text )
end