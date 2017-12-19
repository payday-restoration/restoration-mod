RestorationCoreCallbacks = RestorationCoreCallbacks or class()
--Save Force Restart
function RestorationCoreCallbacks:init(parent)
    self._parent = parent
end

function RestorationCoreCallbacks:Restart(key, value)

	DelayedCalls:Add( "SCRestartGame", 1, function()
		log("Game closing in 1 second[s]!")
		application:close()
	end )
end
