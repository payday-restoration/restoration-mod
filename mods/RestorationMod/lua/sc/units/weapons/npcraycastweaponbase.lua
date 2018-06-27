if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

	
	local mvec_to = Vector3()
	local mvec_spread = Vector3()

	local init_original = NPCRaycastWeaponBase.init
	local setup_original = NPCRaycastWeaponBase.setup

	function NPCRaycastWeaponBase:init(...)
		init_original(self, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)
		
		local weapon_tweak = tweak_data.weapon[self._name_id]

		local trail = Idstring("effects/particles/weapons/weapon_trail")
		
		if weapon_tweak and weapon_tweak.sniper_trail then
			trail = Idstring("effects/particles/weapons/sniper_trail")
		end
		
		self._trail_effect_table = {
			effect = trail,
			position = Vector3(),
			normal = Vector3()
		}
	end

	function NPCRaycastWeaponBase:setup(...)
		setup_original(self, ...)
		self._bullet_slotmask = self._bullet_slotmask - World:make_slot_mask(22)
	end
	
	function NPCRaycastWeaponBase:_spawn_trail_effect(direction, col_ray)
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvector3.set(self._trail_effect_table.normal, direction)

		local trail = World:effect_manager():spawn(self._trail_effect_table)

		if col_ray then
			World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0, col_ray.distance))
		end
	end
	
end