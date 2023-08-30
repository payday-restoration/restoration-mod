NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "restoration_12.2"
--Compatibility for BeardLib Editor just in case
if BLE and BLE:RunningFix() then
NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY .. "_editor"
end