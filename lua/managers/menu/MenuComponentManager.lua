if not restoration.Options:GetValue("HUD/UI/Newsfeed") then return end

local init_original = MenuComponentManager.init

function MenuComponentManager:init()
	init_original(self)
	self._active_components.new_heists = {create = callback(self, self, "_create_newsfeed_gui"), close = callback(self, self, "close_newsfeed_gui")}
	self._active_components.news = {create = callback(self, self, "create_new_heists_gui"), close = callback(self, self, "close_new_heists_gui")}
end 