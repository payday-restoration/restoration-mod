Hooks:PostHook(HUDManager, "_update_name_labels", "_update_name_labels_mutator_no_outlines", function(self)
    local disable_outlines = managers.mutators:modify_value("HUDManager:DisableOutlines", false)
	if disable_outlines then
	for _, data in ipairs(self._hud.name_labels) do
        local label_panel = data.panel
        --label_panel:set_alpha(0)
		label_panel:set_visible(false)
    end
	end
end)