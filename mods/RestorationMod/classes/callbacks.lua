RestorationCoreCallbacks = RestorationCoreCallbacks or class()
--Save Force Restart
function RestorationCoreCallbacks:init(parent)
    self._parent = parent
end

function RestorationCoreCallbacks:Restart(key, value)

	DelayedCalls:Add( "SCRestartGame", 3, function()
		log("Game closing in 3 second[s]!")
		application:close()
	end )
end
