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
end
