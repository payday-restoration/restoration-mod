local give_missing_package_original = GenericDLCManager.give_missing_package
function GenericDLCManager:give_missing_package()
	if entry then
		return give_missing_package_original(self)
	end
end

function GenericDLCManager:has_cce_beta()
	return self:is_dlc_unlocked("preorder")
end
