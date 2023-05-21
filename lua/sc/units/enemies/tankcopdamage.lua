TankCopDamage.IS_TANK = true

--Damage bonus on DS for Dozers when their visor breaks
function TankCopDamage:seq_clbk_vizor_shatter()
	if not self._unit:character_damage():dead() then
		
		if Global.game_settings.difficulty == "sm_wish" then
			self._unit:sound():say("visor_lost")
			self._unit:sound():play("clk_turn", nil, nil)
			self._unit:base():add_buff("base_damage", 10 * 0.01)
			self._unit:movement():play_redirect("use_syringe")
			self._unit:base():enable_asu_laser(true)
		else
			self._unit:sound():say("visor_lost")
		end		
		managers.modifiers:run_func("OnTankVisorShatter", self._unit)
			
	end
end	
