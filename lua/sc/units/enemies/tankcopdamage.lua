TankCopDamage.IS_TANK = true

local bodies_tmp = {
	[Idstring("body_helmet_plate"):key()] = 1,
	[Idstring("body_helmet_plate_black"):key()] = 1,
	[Idstring("body_helmet_glass"):key()] = 1,
	[Idstring("body_helmet_glass_ben"):key()] = 1,
	[Idstring("body_helmet_glass_black"):key()] = 1,
	[Idstring("body_armor_chest"):key()] = 2,
	[Idstring("body_armor_stomache"):key()] = 2,
	[Idstring("body_armor_back"):key()] = 2,
	[Idstring("body_armor_throat"):key()] = 2,
	[Idstring("body_armor_neck"):key()] = 2
}
TankCopDamage._priority_bodies_ids = bodies_tmp

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
