function PlayerBase:set_suspicion_multiplier(reason, multiplier)
	self._suspicion_settings.multipliers[reason] = multiplier
	local buildup_mul = self._suspicion_settings.init_buildup_mul
	local range_mul = self._suspicion_settings.init_range_mul

	for reason, mul in pairs(self._suspicion_settings.multipliers) do
		buildup_mul = buildup_mul * mul

		if mul > 1 then
			range_mul = range_mul * math.sqrt(mul)
		end
	end

	self._suspicion_settings.buildup_mul = buildup_mul * (managers.groupai:state():chk_guard_detection_mul() or 1)
	self._suspicion_settings.range_mul = range_mul
end

function PlayerBase:set_detection_multiplier(reason, multiplier)
	self._detection_settings.multipliers[reason] = multiplier
	local delay_mul = self._detection_settings.init_delay_mul
	local range_mul = self._detection_settings.init_range_mul

	for reason, mul in pairs(self._detection_settings.multipliers) do
		delay_mul = delay_mul * 1 / mul
		range_mul = range_mul * math.sqrt(mul)
	end

	self._detection_settings.delay_mul = delay_mul - (managers.groupai:state():chk_guard_delay_deduction() or 0)
	self._detection_settings.range_mul = range_mul 
end

function PlayerBase:update(unit, t, dt)
	self:set_detection_multiplier(reason, multiplier)
	self:set_suspicion_multiplier(reason, multiplier)
	self:update_concealment()
	if self._wanted_controller_enabled_t then
		if self._wanted_controller_enabled_t <= 0 then
			if self._wanted_controller_enabled then
				self._controller:set_enabled(true)

				self._wanted_controller_enabled = nil
				self._wanted_controller_enabled_t = nil
			end

			self._unit:set_extension_update_enabled(Idstring("base"), false)
		else
			self._wanted_controller_enabled_t = self._wanted_controller_enabled_t - 1
		end
	end
end

function PlayerBase:_setup_suspicion_and_detection_data()
	self._suspicion_settings = deep_clone(tweak_data.player.suspicion)
	self._suspicion_settings.multipliers = {}
	local gamemode_chk = game_state_machine:gamemode() 
	self._suspicion_settings.init_buildup_mul = self._suspicion_settings.buildup_mul
	self._suspicion_settings.init_range_mul = self._suspicion_settings.range_mul
	if gamemode_chk == "crime_spree" then
		if managers.crime_spree then
			local copdetmult = managers.crime_spree:get_cop_det_mult()
			self._suspicion_settings.init_buildup_mul = self._suspicion_settings.init_buildup_mul + copdetmult
		end
	end

	self:setup_hud_offset()

	self._detection_settings = {
		multipliers = {},
		init_delay_mul = 1,
		init_range_mul = 1
	}
end