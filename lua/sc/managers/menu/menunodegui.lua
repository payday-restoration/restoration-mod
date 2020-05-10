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

Hooks:PostHook(MenuNodeGui,"_setup_item_rows","res_mod_conflict_notif",function(self,node,...)
    local title = "RESTORATION MOD INCOMPATIBLIITY WARNING"
    local desc = "Caution! You have the following mods installed, which may conflict with Restoration Mod:\n"
    
    for key,mod_name in pairs(warned_mods) do 
        if rawget(_G,key) then 
            desc = desc .. "\n" .. mod_name
        end
    end
    
    QuickMenu:new(
        title,
        desc,
        {
            {
                text = "Okay",
                is_cancel_button = true
            }
        }
    ,true)
end)
