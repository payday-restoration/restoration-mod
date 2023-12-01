--Lets mollies use the "mass_look_up_modifier" stat
function MolotovGrenade:_setup_from_tweak_data()
	local tweak_entry = MolotovGrenade.super._setup_from_tweak_data(self)
	self._dot_data = tweak_entry.dot_data_name and tweak_data.dot:get_dot_data(tweak_entry.dot_data_name)
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
end

--Prevent grenades from being detonated by being shot.
--TODO: Implement the ability to set whether this function should fire via tweakdata, and allow clients to trigger it without desyncing.
function MolotovGrenade:bullet_hit()
end
