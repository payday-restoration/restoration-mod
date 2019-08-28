if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
    BaseNetworkSession.CONNECTION_TIMEOUT = 20
    BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = SystemInfo:platform() == Idstring("WIN32") and 40
    BaseNetworkSession._LOAD_WAIT_TIME = 10
end