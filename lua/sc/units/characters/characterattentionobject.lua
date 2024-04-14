-- Fix issue where going from no attention data to new attention data is not being counted as changed attention
local set_settings_set_original = CharacterAttentionObject.set_settings_set
function CharacterAttentionObject:set_settings_set(...)
	local no_attention_data = not self._attention_data

	set_settings_set_original(self, ...)

	if no_attention_data and self._attention_data then
		self:_call_listeners()
		self:_chk_update_registered_state()
	end
end