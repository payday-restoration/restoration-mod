--Initializes recoil_kick values since they start null.
function FPCameraPlayerBase:start_shooting()
	self._recoil_kick.accumulated = self._recoil_kick.accumulated or 0 --Total amount of recoil to burn through in degrees.
	self._recoil_kick.h.accumulated = self._recoil_kick.h.accumulated or 0
end

--Adds pauses between shots in full auto fire.
--No longer triggers automatic recoil compensation.
function FPCameraPlayerBase:stop_shooting(wait)
	self._recoil_wait = wait or 0
end

--Add more recoil to burn through.
--Also no longer arbitrarily caps vertical recoil.
function FPCameraPlayerBase:recoil_kick(up, down, left, right)
	local v = math.lerp(up, down, math.random())
	self._recoil_kick.accumulated = (self._recoil_kick.accumulated or 0) + v

	local h = math.lerp(left, right, math.random())
	self._recoil_kick.h.accumulated = (self._recoil_kick.h.accumulated or 0) + h
end

--Simplified vanilla function to remove auto-correction weirdness.
function FPCameraPlayerBase:_vertical_recoil_kick(t, dt)
	local player_state = managers.player:current_state()
	local r_value = 0

	if player_state == "bipod" then
		self._recoil_kick.accumulated = 0
		return 0
	end

	if self._recoil_kick.accumulated and self._episilon < self._recoil_kick.accumulated then
		local degrees_to_move = 40 * dt --Move camera 40 degrees per second, just like vanilla, but in a less fucky way.
		r_value = math.min(self._recoil_kick.accumulated, degrees_to_move)
		self._recoil_kick.accumulated = self._recoil_kick.accumulated - r_value --
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt

		if self._recoil_wait <= 0 then
			self._recoil_wait = nil
		end
	end

	return r_value
end

--Simplified vanilla function to remove auto-correction weirdness.
--Also adds more aggressive tracking for horizontal recoil.
function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
	local player_state = managers.player:current_state()
	local r_value = 0

	if player_state == "bipod" then
		self._recoil_kick.h.accumulated = 0
		return 0
	end

	if self._recoil_kick.h.accumulated and self._episilon < math.abs(self._recoil_kick.h.accumulated) then
		local degrees_to_move = 80 * dt --Track horizontal recoil twice as aggressively, since it tends to self compensate unlike vertical recoil.
		r_value = math.min(self._recoil_kick.h.accumulated, degrees_to_move)
		self._recoil_kick.h.accumulated = self._recoil_kick.h.accumulated - r_value
	elseif self._recoil_wait then
		self._recoil_wait = self._recoil_wait - dt

		if self._recoil_wait <= 0 then
			self._recoil_wait = nil
		end
	end

	return r_value
end