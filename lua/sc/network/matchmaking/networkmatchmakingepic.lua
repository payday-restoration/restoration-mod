NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = "restoration_12.2.2"
--Compatibility for BeardLib Editor just in case. Maybe need shift MM key stuff in networkmanager
if BLE and BLE:RunningFix() then
NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY  = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY .. "_editor"
end