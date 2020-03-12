--[[if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	local origfunc = AnimatedVehicleBase.spawn_module
	function AnimatedVehicleBase:spawn_module(module_unit_name, align_obj_name, ...)
		if self._unit:get_object(Idstring(align_obj_name)) then
			origfunc(self, module_unit_name, align_obj_name, ...)
		end
	end

end]]--
