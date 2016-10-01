--THIS IS VERY CLEVER THANK YOU BUSHY
--WE ROUTE ALL FILES THROUGH CORE HERE.  BE SURE TO DEFINE FILES AND/OR CODE HERE
if not _G.Restoration then
	_G.Restoration = {}
	Restoration.mod_path = ModPath
	Restoration._data_path = SavePath .. "restoration.txt"
	--Restoration._data = {}
	Restoration.options = {}
	Restoration.main_menu = "restoration_menu"
end

function Restoration:Save()
	local file = io.open( self._data_path, "w+" )
	if file then
		file:write( json.encode( self.options ) )
		file:close()
	end
end

function Restoration:Load()
	local file = io.open( self._data_path, "r" )
	--if file == nil then
	--	log("[RESTORATION] No settings file found, initiating first launch...")
	--	Restoration:FirstLaunch()
	--	return
	--end
	if file then
		self.options = json.decode( file:read("*all") )
		file:close()
	end
end


--[[function Restoration:FirstLaunch()
	local option = Restoration.options
	if Restoration.options.restoration_hud_global == nil then
		Restoration.options.restoration_hud_global = true
	end
	option.restoration_assault_global = true
	Restoration:Save()
end]]

Restoration.dofiles = {

}

--Our hook files.  Make sure all hooks in the mod.txt link to this Core.lua.
--If a feature isn't working, just comment it out before pushing a version.  Include a comment of what's broken, if possible.
Restoration.hook_files = {
	["lib/managers/hud/hudobjectives"] = "lua/HUDObjectivesNew.lua",
	["lib/managers/hud/hudpresenter"] = "lua/HUDPresenterNew.lua",
	["lib/managers/hud/hudheisttimer"] = "lua/HUDHeistTimerNEW.lua",
	["lib/managers/hud/hudblackscreen"] = "lua/HUDBlackscreenNEW.lua",
	["lib/managers/hud/hudinteraction"] = "lua/HUDInteractionNew.lua",
	["lib/managers/hud/hudmissionbriefing"] = "lua/HUDmissionbriefingNew.lua",
	["lib/managers/hud/hudtemp"] = "lua/HUDTempNew.lua",
	--["lib/managers/hud/hudstatsscreen"] = "lua/HUDStatsScreenNew.lua",  --it's broke as shit son
	["lib/managers/hud/hudassaultcorner"] = "lua/HUDAssaultCornerNew.lua",
	["lib/managers/menu/menubackdropgui"] = "lua/MenuBackdropGUINew.lua",
	["lib/managers/menu/missionbriefinggui"] = "lua/MissionBriefingGUINew.lua",
	["lib/managers/menu/skilltreegui"] = "lua/SkillTreeGuiNew.lua",  --wait what the fuck were we using THIS for?
	["lib/managers/crimenetmanager"] = "lua/CrimeNetManagerNew.lua",
	["lib/managers/hudmanagerpd2"] = "lua/HUDManagerPD2New.lua",
	["lib/managers/hud/hudteammate"] = "lua/HUDTeammateNew.lua",
	["lib/managers/hud/hudsuspicion"] = "lua/HUDSuspicionNew.lua",
	["lib/managers/hudmanager"] = "lua/HUDManagerNew.lua",
	["lib/managers/hud/hudhint"] = "lua/HUDHintNew.lua",
	--["lib/managers/menu/menuscenemanager"] = "lua/MenuSceneManagerNew.lua", --we don't need this right now
	["lib/tweak_data/levelstweakdata"] = "lua/LevelsTweakDataNew.lua",
	["lib/managers/menu/menupauserenderer"] = "lua/MenuPauseRendererNew.lua",
	["lib/managers/menu/menurenderer"] = "lua/MenuRendererNew.lua",
	["lib/managers/menu/newsfeedgui"] = "lua/NewsFeedGUINew.lua",
	["lib/managers/menu/menunodegui"] = "lua/MenuNodeGUINew.lua",
	["lib/managers/menu/renderers/menunodecrimenetgui"] = "lua/MenuNodeCrimeNetGUINew.lua",
	["lib/tweak_data/tweakdata"] = "lua/WARISFANTASTIC.lua",
	["lib/states/menutitlescreenstate"] = "lua/MenuTitleScreenStateNew.lua",
	["lib/managers/hud/hudchat"] = "lua/HUDChat.lua",
	["lib/managers/hud/hudplayerdowned"] = "lua/HUDPlayerDownedNew.lua",
	["lib/managers/menu/playerprofileguiobject"] = "lua/PlayerProfileGUIObjectNew.lua",
	--["lib/managers/menu/coresoundenvironmentmanager"] = "lua/CoreSoundEnvironmentManagerNew.lua", --broken, deprecate, fix later
	["lib/managers/hud/hudstageendscreen"] = "lua/HUDStageEndScreenNew.lua",
	["lib/managers/dialogmanager"] = "lua/DIALOGWIF.lua",
	["lib/managers/menu/contractboxgui"] = "lua/ContractBoxGUINew.lua",
	["lib/managers/menu/crimenetcontractgui"] = "lua/CrimeNetContractGUINew.lua",
	["core/lib/managers/coresequencemanager"] = "CoreLevel.lua",
	["lib/tweak_data/groupaitweakdata"] = "lua/GROUPAITWEAKDATAHEISTS.lua",
	["lib/tweak_data/charactertweakdata"] = "lua/CHARACTERTWEAKDATAHEISTS.lua"
	--["lib/managers/lootmanager"] = "lua/LootManagerV2.lua",
	--["lib/managers/menumanager"] = "lua/MenuManagerV2.lua"
}

if not Restoration.setup then
	Restoration:Load()
	if Restoration.options.restoration_assault_global == nil then
		Restoration.options.restoration_assault_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_stamina_global == nil then
		Restoration.options.restoration_stamina_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_bagpanel_global == nil then
		Restoration.options.restoration_bagpanel_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_hud_global == nil then
		Restoration.options.restoration_hud_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_suspicion_global == nil then
		Restoration.options.restoration_suspicion_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_objectives_global == nil then
		Restoration.options.restoration_objectives_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_presenter_global == nil then
		Restoration.options.restoration_presenter_global = true
		Restoration:Save()
	end
	if Restoration.options.restoration_bag_lower == nil then
		Restoration.options.restoration_bag_lower = false
		Restoration:Save()
	end

	if Restoration.options.restoration_bag_style == nil then
		Restoration.options.restoration_bag_style = 1
		Restoration:Save()
	end
	if Restoration.options.restoration_assault_style == nil then
		Restoration.options.restoration_assault_style = 1
		Restoration:Save()
	end
	if Restoration.options.restoration_loadouts == nil then
		Restoration.options.restoration_loadouts = true
		Restoration:Save()
	end
	if Restoration.options.restoration_mrender == nil then
		Restoration.options.restoration_mrender = false
		Restoration:Save()
	end
	if Restoration.options.veritas_tod == nil then
		Restoration.options.veritas_tod = true
		Restoration:Save()
	end
	if Restoration.options.restoration_bgtext == nil then
		Restoration.options.restoration_bgtext = true
		Restoration:Save()
	end
	if Restoration.options.crimenet == nil then
		Restoration.options.crimenet = false
		Restoration:Save()
	end
	if Restoration.options.restoration_casing == nil then
		Restoration.options.restoration_casing = true
		Restoration:Save()
	end
	if Restoration.options.restoration_difficultymarker == nil then
		Restoration.options.restoration_difficultymarker = true
		Restoration:Save()
	end
	Restoration:Load()
	for p, d in pairs(Restoration.dofiles) do
		dofile(ModPath .. d)
	end
	Restoration.setup = true
	log("[RESTORATION] Loaded options")
end



if RequiredScript then
	local requiredScript = RequiredScript:lower()
	if Restoration.hook_files[requiredScript] then
		dofile( ModPath .. Restoration.hook_files[requiredScript] )
	end
end

--We pass PackageManager stuff through here.  Only use this to grab sounds since other assets will break stuff REALLY bad.
if PackageManager then
--is it better to load this all at once instead of each of them in their own "if not packagemanager etc."?
--check overhead usage between the two
		PackageManager:load("levels/narratives/h_watchdogs/stage_1/world_sounds")
end





local assault_style = {
    "restoration_assault_style_tape",
    "restoration_assault_style_corner"
}

local bag_style = {
    "restoration_bag_style_beta",
    "restoration_bag_style_alpha"
}

if Hooks then
--[[
	Load our localization keys for our menu, and menu items.
]]
	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit_Restoration", function( loc )
		loc:load_localization_file( Restoration.mod_path .. "loc/en.txt")
	end)

--[[
	Setup our menu callbacks, load our saved data, and build the menu from our json file.
]]
	Hooks:Add("MenuManagerSetupCustomMenus", "MenuManagerSetupCustomMenusRestoration", function( menu_manager, nodes )
		MenuHelper:NewMenu( Restoration.main_menu )
	end)

	Hooks:Add("MenuManagerPopulateCustomMenus", "MenuManagerPopulateCustomMenusRestoration", function( menu_manager, nodes )

		MenuCallbackHandler.restoration_assault_global = function(self, item)
			Restoration.options.restoration_assault_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Assault Panel is now " .. item:value())
		end

		MenuCallbackHandler.restoration_stamina_global = function(self, item)
			Restoration.options.restoration_stamina_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Stamina Meter is now " .. item:value())
		end

		MenuCallbackHandler.restoration_bagpanel_global = function(self, item)
			Restoration.options.restoration_bagpanel_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Bag Panel is now " .. item:value())
		end
		MenuCallbackHandler.restoration_hud_global = function(self, item)
			Restoration.options.restoration_hud_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Main HUD functions are now " .. item:value())
		end
		MenuCallbackHandler.restoration_suspicion_global = function(self, item)
			Restoration.options.restoration_suspicion_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Suspicion meter is now " .. item:value())
		end
		MenuCallbackHandler.restoration_objectives_global = function(self, item)
			Restoration.options.restoration_objectives_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Objectives panel is now " .. item:value())
		end
		MenuCallbackHandler.restoration_presenter_global = function(self, item)
			Restoration.options.restoration_presenter_global = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Objective presenter is now " .. item:value())
		end
		MenuCallbackHandler.restoration_bag_lower = function(self, item)
			Restoration.options.restoration_bag_lower = item:value() == "on" and true or false
			Restoration:Save()
			--log("[RESTORATION] Objective presenter is now " .. item:value())
		end
		MenuCallbackHandler.restoration_pause = function(self, item)
			Restoration.options.restoration_pause = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Pause renderer is now " .. item:value())
		end
		MenuCallbackHandler.restoration_loadouts = function(self, item)
			Restoration.options.restoration_loadouts = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Loadouts changes are now " .. item:value())
		end
		MenuCallbackHandler.restoration_mrender = function(self, item)
			Restoration.options.restoration_mrender = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] Menu changes are now " .. item:value())
		end
		MenuCallbackHandler.veritas_tod = function(self, item)
			Restoration.options.veritas_tod = item:value() == "on" and true or false
			Restoration:Save()
			log("[VERITAS] TIME OF DAY CHANGES ARE NOW  " .. item:value())
		end
		MenuCallbackHandler.crimenet = function(self, item)
			Restoration.options.crimenet = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] CRIME.NET Changes are now  " .. item:value())
		end
		MenuCallbackHandler.restoration_bgtext = function(self, item)
			Restoration.options.restoration_bgtext = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] BGTEXT Changes are now  " .. item:value())
		end
		MenuCallbackHandler.restoration_casing = function(self, item)
			Restoration.options.restoration_casing = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] CASING IS NOW  " .. item:value())
		end
		MenuCallbackHandler.restoration_difficultymarker = function(self, item)
			Restoration.options.restoration_difficultymarker = item:value() == "on" and true or false
			Restoration:Save()
			log("[RESTORATION] DIFFICULTY RATING MARKERS ARE NOW  " .. item:value())
		end
		MenuHelper:AddToggle({
			id = "restoration_assault_global",
			title = "restoration_assault_global_title",
			desc = "restoration_assault_global_desc",
			callback = "restoration_assault_global",
			--default_value = true, --- Does not work, don't even try to use this! - D.A.
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_assault_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_stamina_global",
			title = "restoration_stamina_title",
			desc = "restoration_stamina_desc",
			callback = "restoration_stamina_global",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_stamina_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_bagpanel_global",
			title = "restoration_bagpanel_title",
			desc = "restoration_bagpanel_desc",
			callback = "restoration_bagpanel_global",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_bagpanel_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_hud_global",
			title = "restoration_hud_title",
			desc = "restoration_hud_desc",
			callback = "restoration_hud_global",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_hud_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_suspicion_global",
			title = "restoration_suspicion_title",
			desc = "restoration_suspicion_desc",
			callback = "restoration_suspicion_global",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_suspicion_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_objectives_global",
			title = "restoration_objectives_title",
			desc = "restoration_objectives_desc",
			callback = "restoration_objectives_global",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_objectives_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_presenter_global",
			title = "restoration_presenter_title",
			desc = "restoration_presenter_desc",
			callback = "restoration_presenter_global",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_presenter_global,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_bag_lower",
			title = "restoration_bag_lower_title",
			desc = "restoration_bag_lower_desc",
			callback = "restoration_bag_lower",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_bag_lower,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_loadouts",
			title = "restoration_loadouts_title",
			desc = "restoration_loadouts_desc",
			callback = "restoration_loadouts",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_loadouts,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_mrender",
			title = "restoration_mrender_title",
			desc = "restoration_mrender_desc",
			callback = "restoration_mrender",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_mrender,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "veritas_tod",
			title = "veritas_tod_title",
			desc = "veritas_tod_desc",
			callback = "veritas_tod",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.veritas_tod,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_bgtext",
			title = "restoration_bgtext_title",
			desc = "restoration_bgtext_desc",
			callback = "restoration_bgtext",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_bgtext,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "crimenet",
			title = "crimenet_title",
			desc = "crimenet_desc",
			callback = "crimenet",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.crimenet,
			--priority = 0
		})
		MenuHelper:AddToggle({
			id = "restoration_casing",
			title = "restoration_casing_title",
			desc = "restoration_casing_desc",
			callback = "restoration_casing",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_casing,
		})
		MenuHelper:AddToggle({
			id = "restoration_difficultymarker",
			title = "restoration_difficultymarker_title",
			desc = "restoration_difficultymarker_desc",
			callback = "restoration_difficultymarker",
			icon_by_text = false,
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_difficultymarker,
		})
		MenuCallbackHandler.restoration_assault_style = function(self, item)
			Restoration.options.restoration_assault_style = item:value()
			Restoration:Save()
			log("[RESTORATION] Assault Style set to " .. item:value())
		end
		MenuCallbackHandler.restoration_bag_style = function(self, item)
			Restoration.options.restoration_bag_style = item:value()
			Restoration:Save()
			log("[RESTORATION] Bag Style set to " .. item:value())
		end

		MenuHelper:AddMultipleChoice({
			id = "restoration_assault_style",
			title = "restoration_assault_style_title",
			desc = "restoration_assault_style_desc",
			callback = "restoration_assault_style",
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_assault_style,
			items = assault_style
			--priority = 1005
		})
		MenuHelper:AddMultipleChoice({
			id = "restoration_bag_style",
			title = "restoration_bag_style_title",
			desc = "restoration_bag_style_desc",
			callback = "restoration_bag_style",
			menu_id = Restoration.main_menu,
			value = Restoration.options.restoration_bag_style,
			items = bag_style
			--priority = 1005
		})

	end)

	Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusRestoration", function(menu_manager, nodes)
		nodes[Restoration.main_menu] = MenuHelper:BuildMenu( Restoration.main_menu )
		MenuHelper:AddMenuItem( MenuHelper.menus.lua_mod_options_menu, Restoration.main_menu, "restoration_menu_title", "restoration_menu_desc", 1 )
	end)
end
