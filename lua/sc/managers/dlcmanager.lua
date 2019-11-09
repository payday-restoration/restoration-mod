if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

    function GenericDLCManager:give_missing_package()
        local name_converter = {
            colors = "color",
            materials = "material",
            textures = "pattern"
        }
        local entry, global_value, passed, has_item, name = nil

        for package_id, data in pairs(tweak_data.dlc) do
            if Global.dlc_save.packages[package_id] and self:is_dlc_unlocked(package_id) then
                for _, loot_drop in ipairs(data.content and data.content.loot_drops or {}) do
                    if #loot_drop == 0 then
                        if loot_drop.type_items == "armor_skins" then
                            entry = tweak_data.economy.armor_skins[loot_drop.item_entry]
                            has_item = managers.blackmarket:armor_skin_unlocked(loot_drop.item_entry)

                            if not entry.steam_economy and not has_item then
                                managers.blackmarket:on_aquired_armor_skin(loot_drop.item_entry)
                            end
                        else
                            entry = tweak_data.blackmarket[loot_drop.type_items][loot_drop.item_entry]
                            global_value = loot_drop.global_value or data.content.loot_global_value or package_id
                            passed = false

                            if (loot_drop.type_items == "weapon_mods" or loot_drop.type_items == "weapon_skins") and entry.is_a_unlockable then
                                has_item = managers.blackmarket:get_item_amount(global_value, loot_drop.type_items, loot_drop.item_entry, true) > 0
                                passed = not has_item
                            elseif entry == nil then
                                Global.blackmarket_manager.inventory.rest = nil
                                Global.blackmarket_manager.inventory.sc = nil
                            elseif loot_drop.type_items ~= "weapon_mods" and entry.value == 0 then
                                has_item = managers.blackmarket:get_item_amount(global_value, loot_drop.type_items, loot_drop.item_entry, true) > 0

                                if not has_item then
                                    if loot_drop.type_items == "masks" then
                                        for slot, crafted in pairs(Global.blackmarket_manager.crafted_items.masks) do
                                            if slot ~= 1 and crafted.mask_id == loot_drop.item_entry and crafted.global_value == global_value then
                                                has_item = true

                                                break
                                            end
                                        end
                                    elseif loot_drop.type_items == "materials" or loot_drop.type_items == "textures" or loot_drop.type_items == "colors" then
                                        for slot, crafted in pairs(Global.blackmarket_manager.crafted_items.masks) do
                                            if slot ~= 1 then
                                                name = name_converter[loot_drop.type_items]

                                                if crafted.blueprint[name].id == loot_drop.item_entry and crafted.blueprint[name].global_value == global_value then
                                                    has_item = true

                                                    break
                                                end
                                            end
                                        end
                                    end

                                    passed = not has_item
                                end
                            end

                            if passed then
                                print("[GenericDLCManager:give_missing_package] Found missing Item!", loot_drop.amount, global_value, loot_drop.type_items, loot_drop.item_entry)

                                for i = 1, loot_drop.amount or 1, 1 do
                                    managers.blackmarket:add_to_inventory(global_value, loot_drop.type_items, loot_drop.item_entry)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end