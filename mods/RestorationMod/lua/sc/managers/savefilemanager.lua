--for the love of god dont edit this
if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	SavefileManager.PROGRESS_SLOT = SystemInfo:platform() == Idstring("WIN32") and 77
	SavefileManager.BACKUP_SLOT = SystemInfo:platform() == Idstring("WIN32") and 77
end
