local ids_face_plate = Idstring("body_helmet_plate")
local ids_visor = Idstring("body_helmet_glass")

--Makes hit detection on dozers with shotguns less obnoxious
function TankCopDamage:is_head(body)
	return body and (body:name() == ids_face_plate or body:name() == ids_visor or TankCopDamage.super.is_head(self, body))
end

--Damage bonus on DS for Dozers when their visor breaks
function TankCopDamage:seq_clbk_vizor_shatter()
	if not self._unit:character_damage():dead() then
		
		if Global.game_settings.difficulty == "sm_wish" then
			self._unit:sound():say("visor_lost")
			self._unit:sound():play("clk_turn", nil, nil)
			self._unit:base():add_buff("base_damage", 10 * 0.01)
			self._unit:movement():play_redirect("use_syringe")
		else
			self._unit:sound():say("visor_lost")
		end		
		managers.modifiers:run_func("OnTankVisorShatter", self._unit)
			
	end
end	