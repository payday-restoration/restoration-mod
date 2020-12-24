--key is the global (_G) table value of the mod in question
--value is the localized name of that mod to display to the user
local warned_mods = {
    ["BB"] = "Better Bots",
    ["FullSpeedSwarm"] = "Full Speed Swarm",
    ["Iter"] = "Iter",
    ["SilentAssassin"] = "Silent Assassin",
    ["PD2THHSHIN"] = "Hyper Heisting",
    ["IreNFist"] = "IreNFist",
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

local _layout_legends_original = MenuNodeGui._create_legends
function MenuNodeGui:_create_legends(node)
	_layout_legends_original(self, node)
	local is_pc = managers.menu:is_pc_controller()
	local has_pc_legend = false
	local visible_callback_name, visible_callback
	local t_text = ""
	for i, legend in pairs(node:legends()) do
		visible_callback_name = legend.visible_callback
		visible_callback = nil
		if visible_callback_name then
			visible_callback = callback(node.callback_handler, node.callback_handler, visible_callback_name)
		end
		if (not is_pc or legend.pc) and (not visible_callback or visible_callback(self)) then
			has_pc_legend = has_pc_legend or legend.pc
			local spacing = i > 1 and "  |  " or ""
			t_text = t_text .. spacing .. utf8.to_upper(managers.localization:text(legend.string_id, {
				BTN_UPDATE = managers.localization:btn_macro("menu_update") or managers.localization:get_default_macro("BTN_Y"),
				BTN_BACK = managers.localization:btn_macro("back")
			}))
		end
	end
	local text = self._legends_panel:child(0)
	text:set_text(t_text)
	local _, _, w, h = text:text_rect()
	text:set_size(w, h)
	self:_layout_legends()
end