local _setup_original = LootManager._setup
local get_distribute_original = LootManager.get_distribute
local on_retry_job_stage_original = LootManager.on_retry_job_stage
local get_secured_bonus_bags_amount_original = LootManager.get_secured_bonus_bags_amount
local get_secured_bonus_bags_value_original = LootManager.get_secured_bonus_bags_value
local sync_load_original = LootManager.sync_load
 
-- Vanilla globals:
-- secured = secured bags right now. (mandatory + bonus)
-- saved_secured = the secured bags from the last day. (only used to reset "secured" on non-pro restarts)
-- distribute = the bags which SOME maps are spawning. (we be cleared until its empty, IF the map spawns them)
-- mandatory = count and type of bags needed for mission (will be subtracted from secured for calculation)
 
-- Our Main Problem:
-- The vanilla game has 3 types of levels, regarding old loot.
-- Type 1 is our main problem, because they are "forgetting" the secured bags.
 
-- 1. Any Single Day / Day 1 level
--      behaviour: not handling the bags from "distribute" at all, which results in a total loss of them.
-- 2. (The spawners) Escapes, framing frame day 2, rats day 2, watchdogs day 2
--      behaviour: the bags from "distribute" will be spawned near the van, so the player has to re-secure them.
-- 3. (The securers) All other day 2 or 3 levels
--      behaviour: putting the bags from "distribute" directly to "secured". (BTW: looks like they're actually spawning them too, but on top or inside of a silent secure-zone :D)
 
-- Thoughts and follow up problems:
-- We need to move the bags which are left in "distribute" to secured, whenever they are not empty AFTER the map is completely loaded.
-- If we would do that on start, we would bypass Type3 (no problem). But we would create duplicates on Type2.
-- Creating the duplicates could be avoided by also removing them from "distribute", but that would break the spawning of Type2.
-- Anyways, we need to do this late, but not too late, because then we could not see them in the Tabs-Screen.
-- And we can not put them directly into "secured", because that would mess with "mandatory" and following Type2 levels.
-- So they need an own array, which is added to the result of getter-functions for the count and value of secured bags, to feed the tab-stats and ending-screen.
 
-- Next problem:
-- Because of the increased count of bags (compared to the bags we can have in vanilla heists), we are messing alot with the triggers of Type2 levels.
-- Escape zones wont let you finish without all bags, and the gang in rats isnt accepting weapons and gold.
 
-- Solution:
-- To keep the escapes happy, we will default to: Move all bags from "campaign" to "distribute" on start.
-- Later we just swap it back, IF there was something left in distribute.
-- You need to define "disable_distribute" in Type2 days which arent escapes, to get around this.
-- Also you need to define a list of allowed bag types in "filter_distribute", to only allow specific types of bags to spawn.
 
local DEBUG_ME = false
 
function LootManager:_setup(...)
    local old_campaign_bags = nil
    if Global.loot_manager then
        old_campaign_bags = Global.loot_manager.campaign_bags
    end
    _setup_original(self, ...)
    self._global.campaign_bags = old_campaign_bags or {}
    self._global.saved_campaign_bags = deep_clone(self._global.campaign_bags)
end
 
function LootManager:get_distribute(...)
    self:prepare_distribute_list()
    local result = get_distribute_original(self, ...)
    if result and tweak_data.levels[managers.job:current_level_id()].filter_distribute and
            not tweak_data.levels[managers.job:current_level_id()].filter_distribute[result.carry_id] then
        if DEBUG_ME and result then log("filtering: " .. json.encode(result)) end
        table.insert(self._global.campaign_bags, result)
        return
    end
    if DEBUG_ME and result then log("distributing: " .. json.encode(result)) end
    return result
end
 
function LootManager:prepare_distribute_list()
    if managers.job and not self.prepared then
        if not tweak_data.levels[managers.job:current_level_id()].disable_distribute then
            while #self._global.campaign_bags > 0 do
                local data = table.remove(self._global.campaign_bags, 1)
                if DEBUG_ME then log("moving from campaign bags to distribute bags:" .. json.encode(data)) end
                table.insert(self._global.distribute, data)
            end
        end
        self.prepared = true
    end
end
 
function LootManager:on_stage_success()
    while #self._global.distribute > 0 do
        local data = table.remove(self._global.distribute, 1)
        if DEBUG_ME then log("moving from distribute bags to campaign bags:" .. json.encode(data)) end
        table.insert(self._global.campaign_bags, data)
    end
end
 
function LootManager:on_retry_job_stage(...)
    on_retry_job_stage_original(self, ...)
    self._global.campaign_bags = self._global.saved_campaign_bags
end
 
function LootManager:get_secured_bonus_bags_amount(is_vehicle, ...)
    local amount = get_secured_bonus_bags_amount_original(self, is_vehicle, ...)
    for _,data in ipairs(self._global.distribute) do
        if tweak_data.carry[data.carry_id].is_vehicle == is_vehicle then
            amount = amount + 1
        end
    end
    for _,data in ipairs(self._global.campaign_bags) do
        if tweak_data.carry[data.carry_id].is_vehicle == is_vehicle then
            amount = amount + 1
        end
    end
    return amount
end
 
function LootManager:get_secured_bonus_bags_value(level_id, is_vehicle, ...)
    local value = get_secured_bonus_bags_value_original(self, level_id, is_vehicle, ...)
    for _,data in ipairs(self._global.distribute) do
        if tweak_data.carry[data.carry_id].is_vehicle == is_vehicle then
            value = value + managers.money:get_bag_value(data.carry_id, data.multiplier)
        end
    end
    for _,data in ipairs(self._global.campaign_bags) do
        if tweak_data.carry[data.carry_id].is_vehicle == is_vehicle then
            value = value + managers.money:get_bag_value(data.carry_id, data.multiplier)
        end
    end
    return value
end
 
function LootManager:sync_load(data, ...)
    sync_load_original(self, data, ...)
    self._global.campaign_bags = self._global.campaign_bags or {}
end