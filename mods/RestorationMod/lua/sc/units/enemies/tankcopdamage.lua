if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	local ids_face_plate = Idstring("body_helmet_plate")
	local ids_visor = Idstring("body_helmet_glass")

	function TankCopDamage:is_head(body)
		return body and (body:name() == ids_face_plate or body:name() == ids_visor or TankCopDamage.super.is_head(self, body))
	end
	
	function TankCopDamage:seq_clbk_vizor_shatter()
		if not self._unit:character_damage():dead() then
			
			if Global.game_settings.difficulty == "sm_wish" then
				self._unit:sound():say("g90")
				--Could probably play a spooky noise to go with this. Gotta find a fitting sound ID tho
				--self._unit:sound():play("swatturret_alert", nil, nil)
				self._unit:base():add_buff("base_damage", 15 * 0.01)
				--To-do Find a fitting animation for this
				--self._unit:movement():play_redirect("throw_grenade")
			else
				self._unit:sound():say("visor_lost")
			end		
			managers.crime_spree:run_func("OnTankVisorShatter", self._unit)
				
		end
	end	

end