--Making it only work in stealth so it doesn't just *destroy* dodge builds
local old_modify_value = ModifierLessConcealment.modify_value

function ModifierLessConcealment:modify_value(id, value)
	if managers.groupai and managers.groupai:state():whisper_mode() then
		return old_modify_value(self, id, value)
	end

	return value
end