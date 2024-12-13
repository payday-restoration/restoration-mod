local russian = Idstring("russian"):key() == SystemInfo:language():key()
local english = Idstring("english"):key() == SystemInfo:language():key()
local schinese = Idstring("schinese"):key() == SystemInfo:language():key()
local korean = Idstring("korean"):key() == SystemInfo:language():key()
local spanish = Idstring("spanish"):key() == SystemInfo:language():key()

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
