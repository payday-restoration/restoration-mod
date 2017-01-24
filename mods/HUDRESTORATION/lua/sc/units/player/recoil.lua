if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

function FPCameraPlayerBase:stop_shooting( wait )
    self._recoil_kick.to_reduce     = self._recoil_kick.accumulated * 0 --Enter multiplier here
    self._recoil_kick.h.to_reduce     = self._recoil_kick.h.accumulated * 0 --Enter multiplier here
    self._recoil_wait = wait or 0
end

function FPCameraPlayerBase:recoil_kick( up, down, left, right )
    if math.abs( self._recoil_kick.accumulated ) < 100 --[[This number here, default is 20]] then
        local v
            v = math.lerp( up, down, math.random() )
        self._recoil_kick.accumulated = (self._recoil_kick.accumulated or 0 ) + v
    end
    
    local h
        h = math.lerp( left, right, math.random() )
    self._recoil_kick.h.accumulated = (self._recoil_kick.h.accumulated or 0 ) + h
end

function FPCameraPlayerBase:_vertical_recoil_kick(t, dt)
    local player_state = managers.player:current_state()
    if player_state == "bipod" then
	self:break_recoil()
	return 0
    end
    local r_value = 0
    if self._recoil_kick.current and self._recoil_kick.current ~= self._recoil_kick.accumulated then
        local n = math.step(self._recoil_kick.current, self._recoil_kick.accumulated, 40 --[[this value here, 75 was the old value in the mod]] * dt)
        r_value = n - self._recoil_kick.current
        self._recoil_kick.current = n
    elseif self._recoil_wait then
    elseif self._recoil_kick.to_reduce then
        self._recoil_kick.current = nil
        local n = math.lerp(self._recoil_kick.to_reduce, 0, 9 * dt)
        r_value = -(self._recoil_kick.to_reduce - n)
        self._recoil_kick.to_reduce = n
        if self._recoil_kick.to_reduce == 0 then
            self._recoil_kick.to_reduce = nil
        end

    end

    return r_value
end

function FPCameraPlayerBase:_horizonatal_recoil_kick(t, dt)
    local player_state = managers.player:current_state()
    if player_state == "bipod" then
	self:break_recoil()
	return 0
    end
    local r_value = 0
    if self._recoil_kick.h.current and self._recoil_kick.h.current ~= self._recoil_kick.h.accumulated then
        local n = math.step(self._recoil_kick.h.current, self._recoil_kick.h.accumulated, 40 --[[this value here, 75 was the old value]] * dt)
        r_value = n - self._recoil_kick.h.current
        self._recoil_kick.h.current = n
    elseif self._recoil_wait then
        self._recoil_wait = self._recoil_wait - dt
        if 0 > self._recoil_wait then
            self._recoil_wait = nil
        end

    elseif self._recoil_kick.h.to_reduce then
        self._recoil_kick.h.current = nil
        local n = math.lerp(self._recoil_kick.h.to_reduce, 0, 5 * dt)
        r_value = -(self._recoil_kick.h.to_reduce - n)
        self._recoil_kick.h.to_reduce = n
        if self._recoil_kick.h.to_reduce == 0 then
            self._recoil_kick.h.to_reduce = nil
        end

    end

    return r_value
end

end