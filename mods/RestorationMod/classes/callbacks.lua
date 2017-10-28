RestorationCoreCallbacks = RestorationCoreCallbacks or class()
--Save Force Restart
function RestorationCoreCallbacks:init(parent)
    self._parent = parent
end

function RestorationCoreCallbacks:Restart(key, value)

	DelayedCalls:Add( "DelayedCallsExample", 2, function()
		log("Game closing in 2 second[s]!")
		application:close()
	end )
end
