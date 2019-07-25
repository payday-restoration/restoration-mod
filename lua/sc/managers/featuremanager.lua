if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    
    function FeatureManager:short_heist()
        return false
    end

    function FeatureManager:crimenet_welcome()
        return false
    end
    
    function FeatureManager:dlc_gage_pack_jobs()
        return false
    end

    function FeatureManager:short_heists_available()
        return false
    end
end