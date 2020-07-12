RaidWW2MiniGame = RaidWW2MiniGame or class()
function RaidWW2MiniGame:init(parent, object)
    self._parent = parent
    local data = RaidMinigame.data
	self._target_unit = object
	self._tweak_data = tweak_data.interaction[object:interaction().tweak_data]
	self._tweak_data.sounds = self._tweak_data.sounds or data.sounds

    self._tweak_data.number_of_circles = self._tweak_data.number_of_circles or data.num_of_circles

	self._tweak_data.circle_radius = self._tweak_data.circle_radius or data.circle_radius
	self._tweak_data.circle_difficulty = self._tweak_data.circle_difficulty or data.difficulty
	self._tweak_data.circle_rotation_speed = self._tweak_data.circle_rotation_speed or data.speed
	self._tweak_data.circle_rotation_direction = self._tweak_data.circle_rotation_direction or data.direction

	if self._tweak_data.uses_timer then
		self._fail_t = TimerManager:game():time() + self._tweak_data.uses_timer
		self._max_fail_t = self._tweak_data.uses_timer + self._tweak_data.lap_add_seconds
    end

	if self._tweak_data.is_lockpicking then
		self:say(self._tweak_data.sounds.start)
    end

	self._cooldown = 0.1
    self._completed = false

	self._hud = HUDRaidWW2MiniGame:new(self, self._tweak_data)
end

function RaidWW2MiniGame:leave(success)
	self._parent:cb_leave(success)
end

function RaidWW2MiniGame:say(event, no_sound_chance)
	if not restoration.Options:GetValue("RaidLockPickingVO") then
		return
	end
	if event then
		local player = managers.player:player_unit()
		if alive(player) and player:sound() then
			if type(event) == "table" then
				local rnd = math.random(1, #event+(no_sound_chance or 2))
				if event[rnd] then
					player:sound():say(event[rnd])
				end
			else
				player:sound():say(event)
			end
		end
	end
end

function RaidWW2MiniGame:destroy()
    self._hud:destroy(self._completed)
    self._hud = nil

    if self._completed then
		self:say(self._tweak_data.sounds.complete)
    end
    if self._tweak_data.grows_each_interaction then
        self._tweak_data.number_of_circles = math.min(self._tweak_data.number_of_circles + 1, self._tweak_data.grows_each_interaction_max, RaidMinigame.data.max_circles)
    end
end

function RaidWW2MiniGame:update(t, dt)
	if not self._hud then
		return false
    end

	if alive(self._target_unit) and self._target_unit:unit_data()._interaction_done then
        self:leave()
        return false
    end

    self._hud:update(t, dt)

    if self._fail_t then
		if self._fail_t > t then
            self._hud:set_timer(self._fail_t-t, self._max_fail_t)
        else
            self._hud:set_timer(0, self._max_fail_t)
            self:_check_stage_complete(true)
            self:_check_all_complete()
			self._fail_t = nil
			self._failed = true
        end
    end

	if self._cooldown > 0 then
		self._cooldown = self._cooldown - dt

		if self._cooldown <= 0 then
			self._cooldown = 0

			if self._invalid_stage then
				self._hud:set_bar_valid(self._invalid_stage, true)

				self._invalid_stage = nil
                if self._tweak_data.failable or self._failed then
                    self:leave()
                    return
                end
			end
		end
	end

	if self._completed then
		self._end_t = self._end_t - dt

		if self._end_t <= 0 then
			self._end_t = 0
            self:leave(true)
		end
	end
end

function RaidWW2MiniGame:interact()
    if self._cooldown > 0 or self._completed then
		return
	end

	self:_check_stage_complete()
	self:_check_all_complete()
end

function RaidWW2MiniGame:_check_all_complete()
	local completed = true

	for _, stage_data in pairs(self._hud:circles()) do
		completed = completed and stage_data.completed
	end

	self._completed = completed

	if completed then
		self._end_t = RaidMinigame.data.completed_delay
	end
end

function RaidWW2MiniGame:_check_stage_complete(fail)
	local current_stage_data, current_stage = nil

	for stage, stage_data in pairs(self._hud:circles()) do
		if not stage_data.completed then
			current_stage = stage
			current_stage_data = stage_data

			break
		end
	end

	if not current_stage then
		return
	end

	self._current_stage = current_stage
	local circle_difficulty = self._tweak_data.circle_difficulty[current_stage]
	local diff_degrees = 360 * (1 - circle_difficulty) - 3
	local circle = current_stage_data.circle._circle
	local current_rot = circle:rotation()

    if not fail and current_rot < diff_degrees then
		if self._tweak_data.uses_timer and self._tweak_data.lap_add_seconds then
			self._fail_t = math.min(self._fail_t+self._tweak_data.lap_add_seconds, TimerManager:game():time()+self._max_fail_t)
        end

		self._hud:complete_stage(current_stage)

		local circles = self._hud:circles()
		if self._current_stage == #circles / 2 then
			self:say(self._tweak_data.sounds.halfway)
		elseif self._current_stage ~= #circles then
			self:say(self._tweak_data.sounds.success)
		end

    else
		self._hud:set_bar_valid(current_stage, false)
		circle:set_rotation(math.random() * 360)

		self._cooldown = RaidMinigame.data.failed_cooldown
		self._invalid_stage = current_stage

		self:say(self._tweak_data.sounds.fail)
	end
end