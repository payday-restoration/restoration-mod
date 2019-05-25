--Map Replacements (WIP)
if restoration and restoration.Options:GetValue("SC/SC") then
RestorationMapFramework = RestorationMapFramework or class(MapFramework)
RestorationMapFramework._directory = ModPath .. "map_replacements"
RestorationMapFramework.type_name = "restoration"

RestorationMapFramework:new()
end
