if restoration and restoration.Options:GetValue("SC/Save") then
	SavefileManager.PROGRESS_SLOT = SystemInfo:platform() == Idstring("WIN32") and 77
	SavefileManager.BACKUP_SLOT = SystemInfo:platform() == Idstring("WIN32") and 77
end