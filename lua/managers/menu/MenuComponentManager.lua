if not restoration.Options:GetValue("HUD/UI/Newsfeed") then return end

local init_original = MenuComponentManager.init

function MenuComponentManager:init()
	init_original(self)
	if restoration.Options:GetValue("HUD/UI/NewsFeedStyle") == 2 then
		self._active_components.new_heists = {create = callback(self, self, "close_new_heists_gui"), close = callback(self, self, "close_new_heists_gui")}
	end
end