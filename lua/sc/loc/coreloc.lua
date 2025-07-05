local russian = Idstring("russian"):key() == SystemInfo:language():key()
local english = Idstring("english"):key() == SystemInfo:language():key()
local schinese = Idstring("schinese"):key() == SystemInfo:language():key()
local korean = Idstring("korean"):key() == SystemInfo:language():key()
local spanish = Idstring("spanish"):key() == SystemInfo:language():key()

-- I'm sorry to do these bullshit, but this is because "Always load english loc" would result in a weird incompatible issue with my(LR_Daring) mod for Resmod, while I can't do nothing in my side
if ChinStringFixes and ChinStringFixes.settings and ChinStringFixes.settings.Mod_Support and ChinStringFixes.settings.Mod_Support.Resmod and ChinStringFixes.settings.Mod_Support.Resmod.Resmod_Compat and ChinStringFixes.settings.Mod_Support.Resmod.Resmod_Compat ~= 1 and ChinStringFixes.settings.Enable_String then 

    if english then   
        dofile(ModPath .. "lua/sc/loc/loc.lua")
    elseif russian then
        dofile(ModPath .. "lua/sc/loc/locru.lua")
    elseif schinese then
        dofile(ModPath .. "lua/sc/loc/loczh.lua")
    elseif korean then
        dofile(ModPath .. "lua/sc/loc/locko.lua")
    elseif spanish then
        dofile(ModPath .. "lua/sc/loc/loces.lua")
    else
        dofile(ModPath .. "lua/sc/loc/loc.lua")
    end
    
else

    -- Always load english loc to avoid missing strings in other loc files
    dofile(ModPath .. "lua/sc/loc/loc.lua")

    if russian then
        dofile(ModPath .. "lua/sc/loc/locru.lua")
    elseif schinese then
        dofile(ModPath .. "lua/sc/loc/loczh.lua")
    elseif korean then
        dofile(ModPath .. "lua/sc/loc/locko.lua")
    elseif spanish then
        dofile(ModPath .. "lua/sc/loc/loces.lua")
    end

end
