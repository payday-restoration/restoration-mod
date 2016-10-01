if not HARPYEAGLE then
log("[RESTORATION] What is the best bird?")
if Restoration.options.restoration_hud_global == nil then 
Restoration.options.restoration_hud_global = true
end
--log("[RESTORATION]" .. Restoration.options.restoration_hud_global:value())
HARPYEAGLE = true
_G.Restoration:Save()
log("[RESTORATION] {HARPYEAGLE} Loaded options")
_G.Restoration:Load()
end