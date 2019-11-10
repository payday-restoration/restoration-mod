if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    function GenericDLCManager:has_sc()
        return self:is_dlc_unlocked("sc")
    end
end