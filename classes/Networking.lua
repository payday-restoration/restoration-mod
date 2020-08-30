-- Sending
local network_id = "RaidWW2MinigameSync"
Hooks:Add("NetworkPeerSend", "RaidWW2MiniGameSend", function(self, func_name, params)
    if self ~= managers.network:session():local_peer() and func_name == "lobby_info" then
        LuaNetworking:SendToPeer(self:id(), network_id, "0")
    end
end)

-- Receiving
-- Hooks:Add("NetworkReceivedData", "RaidWW2MiniGameSendReceive", function(sender, id, data)
--     if sender == 1 and id == network_id then
--         data = string.split(data, "|")
--         if tonumber(data[1]) == 1 then
--             tweak_data.interaction.corpse_alarm_pager.special_interaction = "raid"
--         end
--     end
-- end)