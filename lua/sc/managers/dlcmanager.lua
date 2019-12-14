if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    local give_missing_package_original = GenericDLCManager.give_missing_package
    function GenericDLCManager:give_missing_package()
        if entry then
            return give_missing_package_original(self)
        end
    end
end