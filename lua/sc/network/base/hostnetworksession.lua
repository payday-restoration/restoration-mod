local chk_server_joinable_state_actual = HostNetworkSession.chk_server_joinable_state
function HostNetworkSession:chk_server_joinable_state(...)
	chk_server_joinable_state_actual(self, ...)

	if Global.load_start_menu_lobby and MenuCallbackHandler ~= nil then
		MenuCallbackHandler:update_matchmake_attributes()
		MenuCallbackHandler:_on_host_setting_updated()
	end
end

-- Integrated host sequence authority. Uses the existing overhaul hook registration.
do
 local authority = rawget(_G, "RestorationSequenceAuthority")
 if not authority then
  local root = restoration and restoration._mod_path
  if not root then
   local source = debug.getinfo(1, "S").source:gsub("^@", ""):gsub("\\", "/")
   root = source:match("^(.-)/lua/")
  end
  assert(root, "[SequenceAuthority] Cannot resolve overhaul root")
  -- The game loader need not propagate the Lua chunk return value.
  dofile(root:gsub("[/\\]+$", "") .. "/lua/sc/core/sequence_authority.lua")
  authority = rawget(_G, "RestorationSequenceAuthority")
 end
 assert(type(authority) == "table" and type(authority.install) == "function",
  "[SequenceAuthority] sequence_authority.lua did not initialize; verify the complete integrated lua folder is installed")
 authority:install()
end -- Restoration authority bootstrap
