if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
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
					"Warning! You are using Spawn Faster or Harder Difficulty (and possibly some other mods) which are known to have some incompatibilities with SC's Mod! If you are experiencing issues, please disable Spawn Faster/Harder Difficulty or SC's Mod before reporting anything to BRAND0 or Restoration.",
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
    if SystemFS:exists("mods/Iter/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are using Iter (and possibly some other mods) which is known to have some incompatibilities with SC's Mod! If you are experiencing issues, please disable iter or SC's Mod before reporting anything to TDLQ or Restoration.",
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
    if SystemFS:exists("mods/Full Speed Swarm/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are using Full Speed Swarm (and possibly some other mods) which is known to have some incompatibilities with SC's Mod! If you are experiencing issues, please disable Full Speed Swarm or SC's Mod before reporting anything to TDLQ or Restoration.",
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
    if SystemFS:exists("mods/Better Bots/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are using Better Bots, which can negatively impact the overhaul's balance by making it easier than intended. Disabling it while playing the overhaul is highly recommended.",
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
    if not SystemFS:exists("mods/voiceline-framework-master/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are missing Voiceline Framework, which is required for the mod to function correctly. Neglecting to install Voiceline Framework will result in the game crashing frequently.",
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
    --[[if SystemFS:exists("mods/Monkeepers/mod.txt") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Warning! You are using Monkeepers (and possibly some other mods) which is known to have some incompatibilities with SC's Mod! If you are experiencing issues, please disable Monkeepers or SC's Mod before reporting anything to TDLQ or Restoration.",
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
	end]]--   
	if SystemFS:exists("assets/mod_overrides/improved medic") then
		local _setup_item_rows_original = MenuNodeGui._setup_item_rows
		function MenuNodeGui:_setup_item_rows(node, ...)
			_setup_item_rows_original(self, node, ...)
			if not Global._friendsonly_warning_shown then
				Global._friendsonly_warning_shown = true
				QuickMenu:new(
					"SC's Mod",
					"Oh cool, an improved medic! Wait, that's not an improvement! Jesus H. fucking Christ! What the FUCK is wrong with you!?",
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
