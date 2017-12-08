function CopBase:init(unit)
	UnitBase.init(self, unit, false)

	self._char_tweak = tweak_data.character[self._tweak_table]
	self._unit = unit
	self._visibility_state = true
	self._foot_obj_map = {
		right = self._unit:get_object(Idstring("RightToeBase")),
		left = self._unit:get_object(Idstring("LeftToeBase"))
	}
	self._is_in_original_material = true
	self._buffs = {}
	self.my_voice = XAudio.Source:new()
	self.voice_length = 0
	self.voice_start_time = 0
	self:play_voiceline(nil, nil)
end

function CopBase:play_voiceline(buffer, length, force)
	if buffer and length then
		local my_pos = self._unit:position()
		self.my_voice:set_position(my_pos)
		if force then
			self.my_voice:stop()
			self.voice_length = 0
		end
		local _time = math.floor(TimerManager:game():time())
		if self.voice_length == 0 or self.voice_start_time < _time then
			self.my_voice:stop()
			self.my_voice:set_buffer(buffer)
			self.my_voice:play()
			self.voice_length = length
			self.voice_start_time = _time + length
		end
	end
end


if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	
	Month = os.date("%m")
	function CopBase:_chk_spawn_gear()
		if self._tweak_table == "spooc" then
			self._unit:damage():run_sequence_simple("turn_on_spook_lights")
		end
		if self._tweak_table == "spring" or self._tweak_table == "summers" then
			GroupAIStateBesiege:set_assault_endless(true)
			managers.hud:set_buff_enabled("vip", true)
		end
		if restoration and restoration.Options:GetValue("SC/Holiday") then
			if Global.level_data.level_id == "pines" or Global.level_data.level_id == "roberts" or Global.level_data.level_id == "cane" or Global.level_data.level_id == "moon" or Month == "12" then
				PackageManager:load("packages/narr_pines")
				if self:char_tweak().tags then
					if self._tweak_table == "tank_hw" then
					else
						local align_obj_name = Idstring("Head")
						local align_obj = self._unit:get_object(align_obj_name)
						self._headwear_unit = World:spawn_unit(Idstring("units/payday2/characters/ene_acc_spook_santa_hat_sc/ene_acc_spook_santa_hat_sc"), Vector3(), Rotation())
						self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
					end
				end
			end
		end
	end

end