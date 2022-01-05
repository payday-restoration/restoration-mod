--Map Replacements (WIP)
RestorationMapFramework = RestorationMapFramework or class(MapFramework)

RestorationMapFramework._directory = ModPath .. "map_replacements"
RestorationMapFramework.type_name = "restoration"

RestorationMapFramework:init()
RestorationMapFramework:InitMods()
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
-- Needed to prenent a crash when the game language is set to another language
if not PackageManager:loaded("core/packages/language_schinese") then
	PackageManager:load("core/packages/language_schinese")
end
