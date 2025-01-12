function PlayerSound:play_whizby(params)
	local sound_source = SoundDevice:create_source("whizby")
	sound_source:set_position(params.position) -- actually accurate position
	sound_source:post_event("bullet_whizby_medium", callback(self, self, "clbk_whizby_finished"), nil, "end_of_event")
end

function PlayerSound:clbk_whizby_finished(instance, sound_source)
	sound_source:stop() -- probably not needed, but just in case
	sound_source:delete()
end

function PlayerSound:play_footstep(foot, material_name)
	if self._last_material ~= material_name then
		self._last_material = material_name
		local material_name = tweak_data.materials[material_name:key()]

		self._unit:sound_source(Idstring("root")):set_switch("materials", material_name or "no_material")
	end

	self:_play( ((self._unit:movement():running() or self._unit:movement()._current_state._is_wallrunning ) and "footstep_run") or "footstep_walk")
end