RestorationCoreCallbacks = RestorationCoreCallbacks or class()
--Save Force Restart
function RestorationCoreCallbacks:init(parent)
    self._parent = parent
end

function RestorationCoreCallbacks:Restart(value)
	application:close()
end
