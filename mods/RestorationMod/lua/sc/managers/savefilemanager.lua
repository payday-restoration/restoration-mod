--for the love of god dont edit this

--[[

Disabled these for now cause I'm fucking terrified of this and I'd rather not mess with it for now until we have a game plan. 
At least we know HOW to do this now. -SC

if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	SavefileManager.PROGRESS_SLOT = SystemInfo:platform() == Idstring("WIN32") and 77
	SavefileManager.BACKUP_SLOT = SystemInfo:platform() == Idstring("WIN32") and 77
end
]]--