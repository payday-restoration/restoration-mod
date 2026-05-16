SentryGunWeapon._AP_ROUNDS_FIRE_RATE = 4 --Multiplies the delay between shots while in AP mode.
SentryGunWeapon._AP_ROUNDS_DAMAGE_MULTIPLIER = 3


--attempt at an autofire sound fix for sentries
--DelayedCalls are used as the timing of the gunshot actually being audible is late vs the actual soundbyte starting
--Using the standard autofire fix setup just leads to the sentry gunshot SFX being cut off early (or not playing at all for the AP mode gunshots as the audible sound for those starts even later)
--I'm also inclined to believe that sentry gunshot SFX is a singular looping soundbyte and not individual soundbytes set to play at a fixed rate (of fire)
--As using the "end"/"stop" sounds to stop sentry shooting SFX loops early just cuts the audio outright vs player weapon SFX still having the "tail"/reverb when their firing loop is ended
--only applicable to player deployed ones as the enemy turret variety sounds really bad with it given how fast those shoot (the looping SFX is sync'd well enough to the actual fire rate anyways)
function SentryGunWeapon:_sound_autofire_start()
	--autofire fix
	if self._name_id == "sentry_gun" then return end

	self._autofire_sound_event = self._unit:sound_source():post_event(self:auto_fire_start_event())
end

function SentryGunWeapon:_sound_autofire_end()
	--autofire fix
	if self._name_id == "sentry_gun" and alive(self._unit) then 
		DelayedCalls:Add("delay_fire_end" .. tostring(self._unit:key()), self._use_armor_piercing and 0.15 or 0.1, function()
			if alive(self._unit) then
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event)
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event_ap)
			end
		end)
		return
	end

 	if self._autofire_sound_event then
		self._autofire_sound_event:stop()

		self._autofire_sound_event = nil
	end

	self._unit:sound_source():post_event(self:auto_fire_end_event())
end

function SentryGunWeapon:_sound_autofire_end_empty()
	if self._depleted_snd_event then
		self._unit:sound_source():post_event(self._depleted_snd_event)
	end

	--autofire fix
	if self._name_id == "sentry_gun" and alive(self._unit) then 
		DelayedCalls:Add("delay_fire_end" .. tostring(self._unit:key()), self._use_armor_piercing and 0.15 or 0.1, function()
			if alive(self._unit) then
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event)
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event_ap)
			end
		end)
		return
	end

	if self._autofire_sound_event then
		self._autofire_sound_event:stop()

		self._autofire_sound_event = nil
	end

end

function SentryGunWeapon:_sound_autofire_end_cooldown()
	--moved this up here so the cooldown hiss plays correctly
	self._unit:sound_source():post_event(self._fire_cooldown_snd_event)

	--autofire fix
	if self._name_id == "sentry_gun" and alive(self._unit) then 
		DelayedCalls:Add("delay_fire_end".. tostring(self._unit:key()), self._use_armor_piercing and 0.15 or 0.1, function()
			if alive(self._unit) then
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event)
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event_ap)
			end
		end)
		return
	end

	if self._autofire_sound_event then
		self._autofire_sound_event:stop()

		self._autofire_sound_event = nil
	end

	self._unit:sound_source():post_event(self._fire_stop_snd_event)
end

function SentryGunWeapon:armor_piercing_chance()
	return self._use_armor_piercing and 1 or 0
end

function SentryGunWeapon:fire(blanks, expend_ammo, shoot_player, target_unit)
	if expend_ammo then
		if self._ammo_total <= 0 then
			return
		end
		--scale ammo usage depending on fire mode
		local ammo_use = math.min(math.abs(self._use_armor_piercing and 3 or 1), self._ammo_total)
		self:change_ammo(-ammo_use)
	end

	local fire_obj = self._effect_align[self._interleaving_fire]
	local from_pos = fire_obj:position()
	local direction = fire_obj:rotation():y()

	mvector3.spread(direction, tweak_data.weapon[self._name_id].SPREAD * self._spread_mul)
	World:effect_manager():spawn(self._muzzle_effect_table[self._interleaving_fire])

	if self._use_shell_ejection_effect then
		World:effect_manager():spawn(self._shell_ejection_effect_table)
	end

	if self._unit:damage() and self._unit:damage():has_sequence("anim_fire_seq") then
		self._unit:damage():run_sequence_simple("anim_fire_seq")
	end

	--autofire fix
	if self._name_id == "sentry_gun" and alive(self._unit) then
		local sound_use = self._use_armor_piercing and self._fire_start_snd_event_ap or self._fire_start_snd_event
		self._autofire_sound_event = self._unit:sound_source():post_event(sound_use)
		DelayedCalls:Add("delay_fire_end" .. tostring(self._unit:key()), self._use_armor_piercing and 0.15 or 0.1, function()
			if alive(self._unit) then
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event)
				self._autofire_sound_event = self._unit:sound_source():post_event(self._fire_stop_snd_event_ap)
			end
		end)
	end

	local ray_res = self:_fire_raycast(from_pos, direction, shoot_player, target_unit)

	if self._alert_events and ray_res.rays then
		RaycastWeaponBase._check_alert(self, ray_res.rays, from_pos, direction, self._unit)
	end
	
	self._unit:movement():give_recoil()
	self._unit:event_listener():call("on_fire")

	return ray_res
end