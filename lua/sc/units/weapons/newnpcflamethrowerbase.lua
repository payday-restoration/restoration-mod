if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

SummersFlamethrowerBase = SummersFlamethrowerBase or class(NewNPCFlamethrowerBase)
function SummersFlamethrowerBase:init(...)
	SummersFlamethrowerBase.super.init(self, ...)
	self:setup_default()
end
function SummersFlamethrowerBase:setup_default()
	self._use_shell_ejection_effect = false
	self._use_trails = false
end
function SummersFlamethrowerBase:_spawn_muzzle_effect(from_pos, direction)
	restoration.log_shit("SC: Making flames")
	self._unit:set_extension_update_enabled(Idstring("base"), true)
	self._unit:flamethrower_effect_extension():_spawn_muzzle_effect(from_pos, direction)
end
function SummersFlamethrowerBase:update(unit, t, dt)
	if self._check_shooting_expired and t > self._check_shooting_expired.check_t then
		self._check_shooting_expired = nil
		self._unit:set_extension_update_enabled(Idstring("base"), false)
		SawWeaponBase._stop_sawing_effect(self)
		self:play_tweak_data_sound("stop_fire")
	end
end
function SummersFlamethrowerBase:fire_blank(direction, impact)
	if not self._check_shooting_expired then
		self:play_tweak_data_sound("fire")
	end
	self._check_shooting_expired = {
		check_t = Application:time() + 0.3
	}
end
function SummersFlamethrowerBase:auto_fire_blank(direction, impact)
	self:fire_blank(direction, impact)
end
function SummersFlamethrowerBase:_sound_autofire_start(nr_shots)
	local tweak_sound = tweak_data.weapon[self._name_id].sounds or {}
	self._sound_fire:stop()
	local sound = self._sound_fire:post_event(tweak_sound.fire, callback(self, self, "_on_auto_fire_stop"), nil, "end_of_event")
	sound = sound or self._sound_fire:post_event(tweak_sound.fire)
end
function SummersFlamethrowerBase:_sound_autofire_end()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds or {}
	local sound = self._sound_fire:post_event(tweak_sound.stop_fire)
	sound = sound or self._sound_fire:post_event(tweak_sound.stop_fire)
end
function SummersFlamethrowerBase:third_person_important()
	return NewFlamethrowerBase.third_person_important(self)
end

end