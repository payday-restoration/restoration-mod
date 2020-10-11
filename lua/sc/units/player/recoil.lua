function FPCameraPlayerBase:stop_shooting(wait)
	self._recoil_kick.to_reduce = self._recoil_kick.accumulated * 0
	self._recoil_kick.h.to_reduce = self._recoil_kick.h.accumulated * 0
	self._recoil_wait = wait or 0
end

function FPCameraPlayerBase:recoil_kick(up, down, left, right)
	local v = math.lerp(up, down, math.random())
	self._recoil_kick.accumulated = (self._recoil_kick.accumulated or 0) + v

	local h = math.lerp(left, right, math.random())
	self._recoil_kick.h.accumulated = (self._recoil_kick.h.accumulated or 0) + h
end

--Makes recoil track horizontal-ness more aggressively.
--Otherwise, it may cancel itself out without introducing as much movement as vertical recoil.
function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	local player_state = managers.player:current_state()

	if player_state == "bipod" then
		return 0
	end

	local r_value = 0

	if self._recoil_kick.h.current and self._episilon < math.abs(self._recoil_kick.h.accumulated - self._recoil_kick.h.current) then
		local n = math.step(self._recoil_kick.h.current, self._recoil_kick.h.accumulated, 80 * dt)
		r_value = n - self._recoil_kick.h.current
		self._recoil_kick.h.current = n
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt

		if self._recoil_wait < 0 then
			self._recoil_wait = nil
		end
	elseif self._recoil_kick.h.to_reduce then
		self._recoil_kick.h.current = nil
		local n = math.lerp(self._recoil_kick.h.to_reduce, 0, 10 * dt)
		r_value = -(self._recoil_kick.h.to_reduce - n)
		self._recoil_kick.h.to_reduce = n

		if self._recoil_kick.h.to_reduce == 0 then
			self._recoil_kick.h.to_reduce = nil
		end
	end

	return r_value
end
