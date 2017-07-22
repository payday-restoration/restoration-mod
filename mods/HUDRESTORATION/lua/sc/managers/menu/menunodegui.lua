if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	if not SystemFS:exists("assets/mod_overrides/RestorationMod/add.xml") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You do not have the mod overrides installed. The game will crash in all heists if this is not fixed!",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	end
	if SystemFS:exists("mods/Seamlink Gameplay Overhaul/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are using Seamlink's overhaul (and possibly some other mods) which is known to have some incompatibilities with SC's Mod! If you are experiencing issues, please disable Seamlink's overhaul or SC's Mod before reporting anything to Seamlink or Restoration.",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	end
	if SystemFS:exists("mods/Harder Difficulty/mod.txt") or SystemFS:exists("mods/Spawn Faster (Normal)/mod.txt") or SystemFS:exists("mods/Spawn Faster (Advanced)/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are using Spawn Faster or Harder Difficulty (and possibly some other mods) which is known to have some incompatibilities with SC's Mod! If you are experiencing issues, please disable Spawn Faster/Harder Difficulty or SC's Mod before reporting anything to BRAND0 or Restoration.",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	end
end

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	if io.file_is_readable("mods/saves/SCSkillTree.json") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"SC's Mod is currently ON.\n \nYour saved SC's Skill Trees have been LOADED and your vanilla skills SAVED.",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	else
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"WARNING!\n \nNo SC's skill tree save file was detected, a new one will be made.\n \nYour VANILLA skills have been SAVED and will be re-enabled when you turn off the re-balance.",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	end
else
	if io.file_is_readable("mods/saves/VanillaSkillTree.json") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"SC's Mod is currently OFF.\n \nYour saved Vanilla Skill Trees have been LOADED and your SC skills SAVED.",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	else
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"WARNING!\n \nNo vanilla skill tree save file was detected, a new one will be made.\n \nYour SC skills have been SAVED and will be re-enabled when you turn on the re-balance again.",
					{
						{
							text = "ok",
							is_cancel_button = true
						}
					},
					true
				)
			end
		end
	end
end
