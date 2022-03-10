function PlayerSound:play_whizby(params)
	local sound_source = SoundDevice:create_source("whizby")
	sound_source:set_position(params.position) -- actually accurate position
	sound_source:post_event("bullet_whizby_medium", callback(self, self, "clbk_whizby_finished"), nil, "end_of_event")
end

function PlayerSound:clbk_whizby_finished(instance, sound_source)
	sound_source:stop() -- probably not needed, but just in case
	sound_source:delete()
end
