local old_death = HuskCopDamage.die
function HuskCopDamage:die(attack_data)
	old_death(self, attack_data)

	if self._unit:base():char_tweak().ends_assault_on_death then
		managers.hud:set_buff_enabled("vip", false)
	end

	if self._unit:contour() then
		self._unit:contour():remove("omnia_heal", false)
		self._unit:contour():remove("medic_show", false)
		self._unit:contour():remove("medic_buff", false)
	end
	
	if self._unit:base() then
		self._unit:base():disable_lpf_buff(true)
		self._unit:base():disable_asu_laser(true)
	end	

	if self._unit:base():has_tag("tank_titan") or self._unit:base():has_tag("shield_titan") or self._unit:base():has_tag("captain") or self._unit:base():has_tag("lpf") then
		self._unit:sound():play(self._unit:base():char_tweak().die_sound_event_2, nil, nil)
	end

	if self._unit:base():char_tweak().die_sound_event then
		self._unit:sound():play(self._unit:base():char_tweak().die_sound_event, nil, nil)
	else
		restoration.Voicelines:say(self._unit, "death")
	end

	if self._char_tweak.do_autumn_blackout then --clear all equipment and re-enable them when autumn dies
		managers.groupai:state():unregister_blackout_source(self._unit)
	end
	
	if self._char_tweak.failure_on_death then
		managers.groupai:state():set_point_of_no_return_timer(5, 0)
	end	

	--client sided boomboom
	if self._unit:base()._tweak_table == "boom" then
		local boom_boom = false
		boom_boom = managers.modifiers:modify_value("CopDamage:CanBoomBoom", boom_boom)
		boom_boom = managers.mutators:modify_value("CopDamage:CanBoomBoom", boom_boom)
		if boom_boom then
			CopDamage:kamikaze_bag_explode()
		end
	end
	
	if self._char_tweak.reduce_summers_dr_on_death then
		managers.groupai:state():_reduce_summers_dr(0.15)
	end		
end

function HuskCopDamage:heal_unit(...)
	return CopDamage.heal_unit(self, ...)
end

function CopDamage:can_attach_projectiles()
	return not self._char_tweak.cannot_attach_projectiles
end