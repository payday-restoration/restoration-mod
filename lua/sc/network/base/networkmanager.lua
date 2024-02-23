-- Adds two new handlers for network messages to handle the `RestorationMod__` prefix modifications.
-- Hooks:PostHook( NetworkManager, "start_network", "SC_Network", function(self)
-- 	if not self._started then
-- 		self:register_handler("RestorationMod__connection", RestorationMod__ConnectionNetworkHandler)
-- 		self:register_handler("RestorationMod__unit", RestorationMod__UnitNetworkHandler)
-- 	end
-- end)
NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = "restoration_12.3.2"
NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "restoration_12.3.2"
--Compatibility for BeardLib Editor just in case.
if BLE and BLE:RunningFix() then
	NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY  = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY .. "_editor"
	NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY .. "_editor"
end