if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	if SystemFS:exists("mods/restoration-mod-dev/mod.txt") then
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "restoration_dev"
		log(NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY)
	elseif SystemFS:exists("mods/restoration-mod-gold/mod.txt") then
		NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = "restoration_gold"
		log(NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY)
	end
end
