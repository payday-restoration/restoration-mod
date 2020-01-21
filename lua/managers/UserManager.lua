core:module("UserManager")
core:import("CoreEvent")
core:import("CoreTable")

local setup_setting_map_ori = GenericUserManager.setup_setting_map

function GenericUserManager:setup_setting_map()
    self:setup_setting(131, "environment_branch_bank", 2)

    return setup_setting_map_ori(self)
end