-- Helper function to check if turning is allowed
function CopActionIdle:_can_turn()
	if self._ext_movement:chk_action_forbidden("turn") then
		return
	end

	local active_actions = self._common_data.active_actions
	if active_actions[1] or active_actions[2] and active_actions[2]:type() ~= "idle" then
		return
	end

	local queued_actions = self._common_data.queued_actions
	return not queued_actions or not queued_actions[1] or not queued_actions[2]
end


-- Enable client turn behavior on host
Hooks:PostHook(CopActionIdle, "on_attention", "sh_on_attention", function (self, attention)
	if not attention or self._is_cool or self._body_part ~= 3 then
		return
	end

	if attention.handler then
		self._turn_allowed = AIAttentionObject.REACT_IDLE < attention.reaction
	elseif attention.unit or attention.pos then
		self._turn_allowed = true
	end
end)