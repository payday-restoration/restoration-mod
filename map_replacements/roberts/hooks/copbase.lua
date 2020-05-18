Hooks:PostHook(CopBase,"init","csgobank_copbase_init",function(self)

function CopBase:_chk_spawn_gear()
	local tweak = tweak_data.narrative.jobs[managers.job:current_real_job_id()]

	if self._tweak_table == "spooc" and tweak and tweak.is_christmas_heist then
		local align_obj_name = Idstring("Head")
		local align_obj = self._unit:get_object(align_obj_name)
		self._headwear_unit = World:spawn_unit(Idstring("units/payday2/characters/ene_acc_spook_santa_hat/ene_acc_spook_santa_hat"), Vector3(), Rotation())

		self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
	end
end
	
	
end)