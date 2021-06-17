--Map Replacements (WIP)
RestorationMapFramework = RestorationMapFramework or class(MapFramework)

RestorationMapFramework._directory = ModPath .. "map_replacements"
RestorationMapFramework.type_name = "restoration"

RestorationMapFramework:new()
if not PackageManager:loaded("packages/scassets") then
	PackageManager:load("packages/scassets")
end
if not PackageManager:loaded("packages/outfitassets") then
	PackageManager:load("packages/outfitassets")
end	

-- Always load
if not PackageManager:loaded("packages/addhudmisc") then
	PackageManager:load("packages/addhudmisc")
end
