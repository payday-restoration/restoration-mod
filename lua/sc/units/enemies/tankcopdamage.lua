local ids_face_plate = Idstring("body_helmet_plate")
local ids_visor = Idstring("body_helmet_glass")

--Makes hit detection on dozers with shotguns less obnoxious
function TankCopDamage:is_head(body)
	return body and (body:name() == ids_face_plate or body:name() == ids_visor or TankCopDamage.super.is_head(self, body))
end

function TankCopDamage:enable_weapon_asu_laser()
	self._weapon_laser_on = true

	self._unit:inventory():equipped_unit():base():set_asu_laser_enabled(true)
	managers.enemy:_destroy_unit_gfx_lod_data(self._unit:key())
end

function TankCopDamage:enable_asu_laser()
	if self._is_server then
		if not self._active_laser then
			self._weapon_base:set_asu_laser_enabled(true)
			self._logic_data.internal_data.weapon_laser_on = true
			managers.enemy:_destroy_unit_gfx_lod_data(self._unit:key())
			self._active_laser = true
		end
	elseif not self._weapon_laser_on then
		self:enable_weapon_asu_laser()
	end
end

--Damage bonus on DS for Dozers when their visor breaks
function TankCopDamage:seq_clbk_vizor_shatter()
	if not self._unit:character_damage():dead() then
		
		if Global.game_settings.difficulty == "sm_wish" then
			self._unit:sound():say("visor_lost")
			self._unit:sound():play("clk_turn", nil, nil)
			self._unit:base():add_buff("base_damage", 10 * 0.01)
			self._unit:movement():play_redirect("use_syringe")
			self:enable_asu_laser()
		else
			self._unit:sound():say("visor_lost")
		end		
		managers.modifiers:run_func("OnTankVisorShatter", self._unit)
			
	end
end	