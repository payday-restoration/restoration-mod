--Map Replacements (WIP)

RestorationMapFramework = RestorationMapFramework or class(MapFramework)
RestorationMapFramework._directory = ModPath .. "map_replacements"
RestorationMapFramework.type_name = "restoration"

RestorationMapFramework:new()
