if not ModCore then
	log("[ERROR] Unable to find ModCore from BeardLib! Is BeardLib installed correctly?")
	return
end
RestorationCore = RestorationCore or class(ModCore)

function RestorationCore:init()
	self.super.init(self, ModPath .. "config.xml", true, true)
end

if not _G.restoration then
	local success, err = pcall(function() _G.restoration = RestorationCore:new() end)
	if not success then
		log("[ERROR] Something bad happened with Restoration. " .. tostring(err))
	end
end