local at_enter_original = IngameAccessCamera.at_enter

function IngameAccessCamera:at_enter(old_state, ...)
    at_enter_original(self, old_state, ...)
    
	managers.enemy:set_gfx_lod_enabled(true)
end