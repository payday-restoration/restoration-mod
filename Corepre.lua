--Map Replacements (WIP)
RestorationMapFramework = RestorationMapFramework or class(MapFramework)

RestorationMapFramework._directory = ModPath .. "map_replacements"
RestorationMapFramework.type_name = "restoration"

RestorationMapFramework:new()

-- Always load
-- if not PackageManager:loaded("packages/addhudmisc") then
-- 	PackageManager:load("packages/addhudmisc")
-- end
-- if not PackageManager:loaded("packages/uicosmetics") then
-- 	PackageManager:load("packages/uicosmetics")
-- end
-- if not PackageManager:loaded("packages/scassets") then
-- 	PackageManager:load("packages/scassets")
-- end
-- if not PackageManager:loaded("packages/outfitassets") then
-- 	PackageManager:load("packages/outfitassets")
-- end