-- Adds two new handlers for network messages to handle the `RestorationMod__` prefix modifications.
-- Hooks:PostHook( NetworkManager, "start_network", "SC_Network", function(self)
-- 	if not self._started then
-- 		self:register_handler("RestorationMod__connection", RestorationMod__ConnectionNetworkHandler)
-- 		self:register_handler("RestorationMod__unit", RestorationMod__UnitNetworkHandler)
-- 	end
-- end)
local restoration_build_key = "restoration_13_dev_ordnance2"

-- Diesel 3.0 / 64-bit does not guarantee both matchmaking implementations exist.
if NetworkMatchMakingEPIC then
	NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = restoration_build_key
end

if NetworkMatchMakingSTEAM then
	NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = restoration_build_key
end

local current_key = restoration_build_key
local standard_str = 'NetworkMatchMakingSTEAM._BUILD_SEARCH_INTEREST_KEY = \"'

-- Invite-Link-on-Discord support

local function find_key(page, str)
	local page_str = tostring(page)
	local _, st = string.find(page_str, str, 1, true)

	if not st then
		return nil
	end

	local en = string.find(page_str, '"', st + 1, true)

	if not en then
		return nil
	end

	return string.sub(page_str, st + 1, en - 1)
end

local function setup_discord_link(gold_key)
	local is_gold = false

	if gold_key == current_key then
		is_gold = true
	end

	local user_resmod_version = ""

	if is_gold then
		user_resmod_version = "Gold"
	else
		user_resmod_version = "Dev"
	end

	DiscordLink:set_attributes({
		channel_id = "584795639309664375",
		channel_name = "looking-for-games",
		server_name = "Restoration Mod",
		version_identifier = user_resmod_version,
	})
end
if DiscordLink then
	dohttpreq("https://raw.githubusercontent.com/payday-restoration/restoration-mod/gold/lua/sc/network/base/networkmanager.lua", function(page)
		setup_discord_link(find_key(page, standard_str))
	end)
end