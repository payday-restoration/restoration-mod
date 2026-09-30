--Map Replacements (WIP)
RestorationMapFramework = RestorationMapFramework or class(MapFramework)

RestorationMapFramework._directory = ModPath .. "map_replacements"
RestorationMapFramework.type_name = "restoration"

RestorationMapFramework:init()
RestorationMapFramework:InitMods()

-- Asset registration. These packages only create DB entries - no unit is handed
-- to dyn_resource from here - so loading them this early is cheap and is what
-- makes the mod's files win over the base game's. The dyn_resource hand-off
-- lives in packages/res_load_* and runs from GameSetup:load_packages instead.
local restoration_registration_packages = {
	"packages/res_factions_america",
	"packages/res_factions_fbi",
	"packages/res_factions_federales",
	"packages/res_factions_lapd",
	"packages/res_factions_murkywater",
	"packages/res_factions_nypd",
	"packages/res_factions_russia",
	"packages/res_factions_zombie",
	"packages/res_misc_america_misc",
	"packages/res_misc_miscassets",
	"packages/res_misc_miscmutators",
	"packages/res_misc_omnia_misc",
	"packages/res_misc_outfits",
	"packages/res_misc_rex_gold",
	"packages/res_misc_scassets",
	"packages/res_misc_npcfixes",
}

for _, package in ipairs(restoration_registration_packages) do
	if not PackageManager:package_exists(package) then
		log("[RestorationMod] registration package missing from main.xml: " .. package)
	elseif not PackageManager:loaded(package) then
		PackageManager:load(package)
	end
end

-- Keep SuperBLT's XML-Tweaker off everything the mod just replaced.
--
-- The retired SuperBLT asset loader did this for every one of its declarations
-- (blt.ignoretweak right before BLT.AssetManager:CreateEntry). BeardLib never
-- calls it, so without this the tweaker reads OUR file where it expects the
-- bundle's, fails in convert_scriptdata, and takes the process with it.
--
-- Global.fm.added_files is keyed by extension key, not by the Idstring itself,
-- so walk the extensions the packages actually declare and match on the key.
local restoration_tweak_exempt_extensions = {
	"unit", "model", "object", "material_config", "cooked_physics", "texture",
	"sequence_manager", "animation", "effect", "environment", "continent",
	"mission", "nav_data", "scene",
}

-- added_files is global: every BeardLib mod is in there, and exempting another
-- mod's asset would silently kill a tweak that is not ours to disable. Only take
-- entries whose file actually lives under this mod.
local restoration_file_prefix = (ModPath or "mods/restoration-mod/"):lower()

if blt and blt.ignoretweak and Global.fm and Global.fm.added_files then
	local exempt, foreign = 0, 0
	for _, extension in ipairs(restoration_tweak_exempt_extensions) do
		local ext = Idstring(extension)
		local bucket = Global.fm.added_files[ext:key()]
		if bucket then
			for _, entry in pairs(bucket) do
				if entry.path and entry.file then
					if tostring(entry.file):lower():find(restoration_file_prefix, 1, true) == 1 then
						-- never let a signature change here stop the mod from loading
						local ok = pcall(blt.ignoretweak, entry.path, ext)
						if ok then exempt = exempt + 1 end
					else
						foreign = foreign + 1
					end
				end
			end
		end
	end
	log("[RestorationMod] XML-Tweaker exemptions applied: " .. tostring(exempt) ..
		"; left alone because they belong to another mod: " .. tostring(foreign))
else
	log("[RestorationMod] blt.ignoretweak is unavailable - SuperBLT may tweak replaced assets")
end

if not PackageManager:loaded("packages/scenvlevels") then
	PackageManager:load("packages/scenvlevels")
end
if not PackageManager:loaded("packages/outfitassets") then
	PackageManager:load("packages/outfitassets")
end	

-- Always load
if not PackageManager:loaded("packages/addhudmisc") then
	PackageManager:load("packages/addhudmisc")
end
if not PackageManager:loaded("packages/envcore") then
	PackageManager:load("packages/envcore")
end

-- Needed to prevent a crash when the game language is set to another language
if not PackageManager:loaded("core/packages/language_schinese") then
	PackageManager:load("core/packages/language_schinese")
end
if not PackageManager:loaded("core/packages/language_korean") then
	PackageManager:load("core/packages/language_korean")
end
