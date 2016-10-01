--Controls CRIME.NET ambience noise.
CrimeNetGui.oinit = CrimeNetGui.init

function CrimeNetGui:init(...)
	
		CrimeNetGui:oinit(...)
	self._crimenet_ambience = managers.menu_component:post_event( "crimenet_ambience" )
end