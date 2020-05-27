ModifierBravos = ModifierBravos or class(BaseModifier)
ModifierBravos._type = "ModifierBravos"
ModifierBravos.name_id = "none"
ModifierBravos.desc_id = "menu_cs_modifier_bravos"
ModifierBravos.default_value = "spawn_chance"

--thanks hoxi for cleaning this up
function ModifierBravos:modify_value(id, value)
    if id == "GroupAIStateBesiege:SpawningUnit" then
        local unit_name = tostring(value)
        local replacement = managers.modifiers._unit_table[unit_name] --dont make the same table twice!! just pull it from modifiersmanager

        if replacement then
            local replacement_chance = self:value()

            if math.random(0,100) < replacement_chance then
                --log("replaced!! replacement unit is " .. tostring(replacement) .. ".")

                return replacement
            end
        end
    end

    return value
end