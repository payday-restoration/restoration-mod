--key is the global (_G) table value of the mod in question
--value is the localized name of that mod to display to the user
local warned_mods = {
    ["BB"] = "Better Bots",
    ["FullSpeedSwarm"] = "Full Speed Swarm",
    ["Iter"] = "Iter",
    ["SilentAssassin"] = "Silent Assassin",
    ["PD2THHSHIN"] = "Hyper Heisting",
    ["SGO"] = "Seamlink's Gameplay Overhaul",
    ["deathvox"] = "Crackdown"
}

Hooks:PostHook(MenuNodeGui,"_setup_item_rows","resmod_incompat_warn",function(self,node,...)
    local title = "RESTORATION MOD INCOMPATIBLIITY WARNING"
    local desc = "Caution! You have the following mods installed, which may conflict with Restoration Mod:\n"
    local has_any
    for key,mod_name in pairs(warned_mods) do 
        if rawget(_G,key) then 
            has_any = true
            desc = desc .. "\n" .. mod_name
        end
    end
    if has_any then 
        QuickMenu:new(
            title,
            desc,
            {
                {
                    text = "OK",
                    is_cancel_button = true
                }
            }
        ,true)
    end
end)