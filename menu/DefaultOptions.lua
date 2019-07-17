if not HARPYEAGLE then
restoration.log_shit("[RESTORATION] What is the best bird?")
if Restoration.options.restoration_hud_global == nil then 
Restoration.options.restoration_hud_global = true
end
--restoration.log_shit("[RESTORATION]" .. Restoration.options.restoration_hud_global:value())
HARPYEAGLE = true
_G.Restoration:Save()
restoration.log_shit("[RESTORATION] {HARPYEAGLE} Loaded options")
_G.Restoration:Load()
end