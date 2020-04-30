local client_on_executed_old = ElementSecurityCamera.client_on_executed

function ElementSecurityCamera:client_on_executed(...)
	client_on_executed_old(self, ...)
	if not self._values.enabled then
		return
	end
	if not self._values.camera_u_id then
		return
	end
	local camera_unit = self:_fetch_unit_by_unit_id(self._values.camera_u_id)
	if not camera_unit then
		return
	end
	local ai_state = self._values.ai_enabled and true or false
	camera_unit:base().cam_disabled = not ai_state
end