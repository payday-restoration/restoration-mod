local math_random = math.random

local mvec_1 = Vector3()
local mvec_2 = Vector3()
local ids_func = Idstring
local table_contains = table.contains

local enemies_visor = {
	ids_func("units/payday2/characters/ene_city_guard_3/ene_city_guard_3"),
	ids_func("units/payday2/characters/ene_city_guard_3/ene_city_guard_3_husk"),
	ids_func("units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"),
	ids_func("units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc_husk"),
	ids_func("units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"),
	ids_func("units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc_husk"),
	ids_func("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),    
	ids_func("units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc_husk"),    
	ids_func("units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"),
	ids_func("units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc_husk"),
	ids_func("units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"),
	ids_func("units/pd2_mod_halloween/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc_husk"),
	ids_func("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"),
	ids_func("units/pd2_mod_halloween/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc_husk"),
	ids_func("units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"),
	ids_func("units/pd2_mod_halloween/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc_husk"),
	ids_func("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1"),
	ids_func("units/pd2_mod_halloween/characters/ene_tazer_1/ene_tazer_1_husk"),     
	ids_func("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2"),
	ids_func("units/pd2_mod_halloween/characters/ene_shield_2/ene_shield_2_husk"),     	
	ids_func("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	ids_func("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),                 	
	ids_func("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer"),
	ids_func("units/pd2_mod_halloween/characters/ene_zeal_tazer/ene_zeal_tazer_husk"),                 	
	ids_func("units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
	ids_func("units/pd2_mod_halloween/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk"),                 	
	ids_func("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"),
	ids_func("units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc_husk"),
	ids_func("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc"),
	ids_func("units/payday2/characters/ene_tazer_1_sc/ene_tazer_1_sc_husk"),     
	ids_func("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1"),
	ids_func("units/pd2_dlc_bex/characters/ene_tazer_1/ene_tazer_1_husk"),                 
	ids_func("units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	ids_func("units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),                 
	ids_func("units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
	ids_func("units/pd2_dlc_bex/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk"),                 
	ids_func("units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
	ids_func("units/pd2_dlc_bex/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk"),                 
	ids_func("units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
	ids_func("units/pd2_dlc_bex/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk"),                 
	ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc"),
	ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_tazer_sc/ene_zeal_tazer_sc_husk"),                 
	ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),
	ids_func("units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
	ids_func("units/pd2_mod_reapers/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk"),
	ids_func("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2"),
	ids_func("units/pd2_mod_reapers/characters/ene_shield_2/ene_shield_2_husk"),
	ids_func("units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
	ids_func("units/pd2_mod_reapers/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy_husk"),	
	ids_func("units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"),
	ids_func("units/pd2_mod_reapers/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870_husk"),	
	ids_func("units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
	ids_func("units/pd2_mod_reapers/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk"),	
	ids_func("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
	ids_func("units/pd2_mod_lapd/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk"),                 
	ids_func("units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2"),
	ids_func("units/pd2_mod_lapd/characters/ene_shield_2/ene_shield_2_husk"),                 
	ids_func("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
	ids_func("units/pd2_mod_lapd/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk"),                 
	ids_func("units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	ids_func("units/pd2_mod_lapd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),                             
	ids_func("units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
	ids_func("units/pd2_mod_lapd/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk"),
	ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),                 
	ids_func("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer"),
	ids_func("units/pd2_mod_sharks/characters/ene_murky_tazer/ene_murky_tazer_husk"),                 
	ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1"),                 
	ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_1/ene_swat_heavy_1_husk"),               
	ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),                 
	ids_func("units/pd2_mod_sharks/characters/ene_swat_heavy_r870/ene_swat_heavy_r870_husk"),
	ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow"),
	ids_func("units/pd2_mod_sharks/characters/ene_murky_shield_yellow/ene_murky_shield_yellow_husk"),
	ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
	ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy_husk"),
	ids_func("units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	ids_func("units/pd2_mod_nypd/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),
	ids_func("units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
	ids_func("units/pd2_mod_nypd/characters/ene_city_heavy_g36/ene_city_heavy_g36_husk"),  
	ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy"),
	ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy/ene_omnia_heavy_husk"),	
	ids_func("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1"),
	ids_func("units/pd2_mod_omnia/characters/ene_grenadier_1/ene_grenadier_1_husk"),                 	
	ids_func("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
	ids_func("units/pd2_mod_nypd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc_husk"),                 	
	ids_func("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4"),
	ids_func("units/pd2_mod_nypd/characters/ene_nypd_heavy_m4/ene_nypd_heavy_m4_husk"),                 
	ids_func("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870"),
	ids_func("units/pd2_mod_nypd/characters/ene_nypd_heavy_r870/ene_nypd_heavy_r870_husk"),                 	
}

local enemies_plink = {
	ids_func("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
	ids_func("units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc_husk"),
	ids_func("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
	ids_func("units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc_husk"),
	  
	ids_func("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"),
	ids_func("units/pd2_mod_lapd/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc_husk"),                     
	ids_func("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
	ids_func("units/pd2_mod_lapd/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc_husk"),
	
	ids_func("units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
	ids_func("units/pd2_mod_nypd/characters/ene_city_heavy_r870/ene_city_heavy_r870_husk"),   
	
	ids_func("units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
	ids_func("units/pd2_mod_reapers/characters/ene_city_heavy_r870/ene_city_heavy_r870_husk"),   
	
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk"),   
	
	ids_func("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1"),
	ids_func("units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1_husk"),   
	
	ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870"),
	ids_func("units/pd2_mod_omnia/characters/ene_omnia_heavy_r870/ene_omnia_heavy_r870_husk"),
	
	ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
	ids_func("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk"),     
	
	ids_func("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat"),
	ids_func("units/pd2_mod_halloween/characters/ene_skele_swat/ene_skele_swat_husk"),
	ids_func("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2"),
	ids_func("units/pd2_mod_halloween/characters/ene_skele_swat_2/ene_skele_swat_2_husk"),
	ids_func("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
	ids_func("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk"),                 	
	ids_func("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"),
	ids_func("units/pd2_mod_halloween/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc_husk"),
	
	ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
	ids_func("units/pd2_mod_sharks/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk"),   	
	ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"),
	ids_func("units/pd2_mod_sharks/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870_husk"),
	
	ids_func("units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	ids_func("units/pd2_dlc_bex/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),
	ids_func("units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
	ids_func("units/pd2_dlc_bex/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk"),
	ids_func("units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
	ids_func("units/pd2_dlc_bex/characters/ene_city_heavy_r870/ene_city_heavy_r870_husk"),
	ids_func("units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870"),
	ids_func("units/pd2_dlc_bex/characters/ene_zeal_swat_heavy_r870/ene_zeal_swat_heavy_r870_husk"),

	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_1/ene_fbi_heavy_1_husk"),
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
	ids_func("units/pd2_mod_reapers/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870_husk"),
	
}

local grenadier_smash = {
	ids_func("units/payday2/characters/ene_grenadier_1/ene_grenadier_1"),
	ids_func("units/payday2/characters/ene_grenadier_1/ene_grenadier_1_husk"),
	ids_func("units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser"),
	ids_func("units/pd2_mod_reapers/characters/ene_titan_taser/ene_titan_taser_husk"),
	ids_func("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1"),
	ids_func("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1_husk"),     	
	ids_func("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1"),
	ids_func("units/pd2_dlc_bex/characters/ene_grenadier_1/ene_grenadier_1_husk"),   
	ids_func("units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1"),
	ids_func("units/pd2_mod_nypd/characters/ene_grenadier_1/ene_grenadier_1_husk"),
	ids_func("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1"),
	ids_func("units/pd2_mod_sharks/characters/ene_grenadier_1/ene_grenadier_1_husk")    	
}

local armour = {
	-- Tans
	[Idstring("body_plate"):key()] = true,
	-- Dozer
	[Idstring("body_helmet"):key()] = true,
	[Idstring("body_helmet_plate"):key()] = true,
	[Idstring("body_helmet_glass"):key()] = true,
	[Idstring("body_armor_chest"):key()] = true,
	[Idstring("body_armor_stomache"):key()] = true,
	[Idstring("body_armor_back"):key()] = true,
	[Idstring("body_armor_throat"):key()] = true,
	[Idstring("body_armor_neck"):key()] = true,
	-- Sosa
	[Idstring("body_vest"):key()] = true,
	[Idstring("body_ammo"):key()] = true,
}

local head_hitboxes = {
    [Idstring("glass_shield"):key()] = true,
    [Idstring("glass_swat"):key()] = true,
    [Idstring("glass_c"):key()] = true,
    [Idstring("glass_altyn"):key()] = true,
    [Idstring("visor"):key()] = true
}

Hooks:PostHook(CopDamage, "init", "res_init", function(self, unit)
	self._player_damage_ratio = 0 --Damage dealt to this enemy by players that contributed to the kill.

	
	-- i don't want to sift through every single .object file in the game to do this so
	if self._head_gear_decal_mesh then
		local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)

		self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("helmet"))
	end	
end)

function CopDamage:_spawn_head_gadget(params)
	local unit_name = self._unit:name()
	local my_unit = self._unit

	if not self._head_gear then
		return
	end

	if self._head_gear_object then
		if self._nr_head_gear_objects then
			for i = 1, self._nr_head_gear_objects do
				local head_gear_obj_name = self._head_gear_object .. tostring(i)

				self._unit:get_object(Idstring(head_gear_obj_name)):set_visibility(false)
			end
		else
			self._unit:get_object(Idstring(self._head_gear_object)):set_visibility(false)
		end

		if self._head_gear_decal_mesh then
			local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)

			self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("flesh"))
		end
	end

	local unit = World:spawn_unit(Idstring(self._head_gear), params.position, params.rotation)

	if not params.skip_push then
		local true_dir = params.dir
		local spread = math.random(6, 9)
		mvector3.spread(true_dir, spread)
		local dir = math.UP + true_dir
		local body = unit:body(0)

		body:push_at(body:mass(), dir * math.lerp(450, 650, math.random()), unit:position() + Vector3(math.rand(1), math.rand(1), math.rand(1)))
	end
	
    local smashablefuckers = table_contains(enemies_visor, unit_name)
    local smashablefuckers_hsg = table_contains(enemies_plink, unit_name)
	
 	local head_obj = ids_func("Head")
	local head_object_get = my_unit:get_object(head_obj)
	
	if not head_object_get then
		return
	end
	
	local world_g = World		
	local sound_ext = my_unit:sound()	
      
	if smashablefuckers then
		world_g:effect_manager():spawn({
			effect = ids_func("effects/particles/bullet_hit/glass_breakable/bullet_hit_glass_breakable"),
			parent = head_object_get		
		})
		sound_ext:play("swat_heavy_visor_shatter", nil, nil)
		sound_ext:play("swat_heavy_visor_shatter", nil, nil)
	elseif smashablefuckers_hsg then
		world_g:effect_manager():spawn({
			effect = ids_func("effects/payday2/particles/impacts/metal_impact_pd2"),
			parent = head_object_get		
		})
		sound_ext:play("swatturret_weakspot_hit", nil, nil)
	end

	self._head_gear = false
end


function CopDamage:damage_fire(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	
	if self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end	
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end

	local attacker_unit = attack_data.attacker_unit
	local weap_unit = attack_data.weapon_unit

	if attacker_unit and alive(attacker_unit) then
		if attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			weap_unit = attack_data.attacker_unit
		end

		if self:is_friendly_fire(attacker_unit) then
			return "friendly_fire"
		end
	end

	if not self._unit:movement():cloaked() and math_random() < 0.75 then
		self._unit:movement():set_cloaked(true, true)
	end

	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	local head = attack_data.variant ~= "stun" and self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name or attack_data.variant ~= "stun" and self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name and head_hitboxes[attack_data.col_ray.body:name():key()]

	if head and weap_unit and alive(weap_unit) and weap_unit:base() and not weap_unit:base().thrower_unit and attack_data.col_ray and attack_data.col_ray.ray and self._unit:base():has_tag("tank") then
		mvector3.set(mvec_1, attack_data.col_ray.ray)
		mrotation.z(self._unit:movement():m_head_rot(), mvec_2)

		local not_from_the_front = mvector3.dot(mvec_1, mvec_2) >= 0

		if not_from_the_front then
			head = false
		end
	end

	local headshot_multiplier = 1
	local damage = attack_data.damage
	local distance = 1000
	local hit_pos = attack_data.col_ray.hit_position
	local is_player = attack_data.attacker_unit == managers.player:player_unit()
	local damage_clamp = self._char_tweak.DAMAGE_CLAMP_FIRE

	if is_player then
		if self._char_tweak.priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end

		if head then
			headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
			managers.player:on_headshot_dealt(self._unit, attack_data)
		end
	end

	if head and not self._damage_reduction_multiplier then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end

	--Allows seperate damage mults for fire pools and fire damage.
	if alive(weap_unit) then
		local weap_base = weap_unit:base()
		if weap_base.thrower_unit or weap_base.get_name_id and weap_base:get_name_id() == "environment_fire" then
			attack_data.is_fire_pool_damage = true
			if self._char_tweak.damage.fire_pool_damage_mul then
				damage = damage * self._char_tweak.damage.fire_pool_damage_mul
			end	
		else
			if self._char_tweak.damage.fire_damage_mul then
				damage = damage * self._char_tweak.damage.fire_damage_mul
			end	
		end	
	end
		
	if self._marked_dmg_mul then
		damage = damage * self._marked_dmg_mul

		if not attack_data.is_fire_dot_damage and self._marked_dmg_dist_mul and alive(attacker_unit) then
			local dst = mvector3.distance(attacker_unit:position(), self._unit:position())
			local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

			if spott_dst[1] < dst then
				damage = damage * spott_dst[2]
			end
		end
	end

	damage = self:_apply_damage_reduction(damage)

	if damage_clamp then
		damage = math.min(damage, damage_clamp)
	end

	if is_player then
		if hit_pos then
			distance = mvector3.distance(hit_pos, attack_data.attacker_unit:position())
		end

		if weap_unit and alive(weap_unit) and attack_data.variant ~= "stun" then
			local weap_base = weap_unit:base()
			local is_grenade_or_ground_fire = nil

			if weap_base then
				if weap_base.thrower_unit or weap_base.get_name_id and weap_base:get_name_id() == "environment_fire" then
					is_grenade_or_ground_fire = true
				end
			end

			if is_grenade_or_ground_fire then
				if attack_data.is_fire_dot_damage and self._char_tweak.priority_shout then
					damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
				end
			else
				local critical_hit, crit_damage = self:roll_critical_hit(attack_data, damage, damage_clamp)

				if critical_hit then
					damage = crit_damage
				end

				local damage_scale = nil
				if weap_base.near_falloff_distance and weap_base.far_falloff_distance then
					damage_scale = distance >= weap_base.far_falloff_distance + weap_base.near_falloff_distance and 0 or distance >= weap_base.near_falloff_distance and 0.5 or 1
				end		

				if not attack_data.is_fire_dot_damage and damage > 0 then
					if critical_hit then
						managers.hud:on_crit_confirmed(damage_scale)
					else
						managers.hud:on_hit_confirmed(damage_scale)
					end
				end
			end
		end
	end

	attack_data.raw_damage = damage

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	local result = nil

	if self._health <= damage then
		attack_data.damage = self._health

		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
			self._player_damage_ratio = 0
		else
			result = {
				type = "death",
				variant = attack_data.variant
			}

			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "fire", head, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())
		end
	else
		attack_data.damage = damage

		local result_type = "dmg_rcv"

		if not attack_data.is_fire_dot_damage then
			result_type = self:get_damage_type(damage_percent, "fire")
		end

		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	if result.type == "death" then
		if attack_data.variant ~= "stun" then
			if table_contains(grenadier_smash, self._unit:name()) then
				self._unit:damage():run_sequence_simple("grenadier_glass_break")
			elseif self._head_body_name then
				local body = self._unit:body(self._head_body_name)

				self:_spawn_head_gadget({
					skip_push = true,
					position = body:position(),
					rotation = body:rotation()
				})
			end
		end

		if Network:is_server() and self._char_tweak.gas_on_death then
			managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)
		end
		
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = weap_unit,
			variant = attack_data.variant,
			is_molotov = attack_data.is_molotov
		}

		managers.statistics:killed_by_anyone(data)

		local weap_base = weap_unit and weap_unit:base()
		local close_range = weap_base and ((weap_base.is_category and weap_base:is_category("saw")) or (distance <= (weap_base.near_falloff_distance or 100)))
		if weap_base and not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attacker_unit == managers.player:player_unit() and alive(attack_data.weapon_unit) and not weap_base.thrower_unit and close_range and weap_base.is_category and weap_base:is_category("shotgun", "saw") then
			managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
		end

		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if is_civilian then
				managers.money:civilian_killed()
			end

			self:_check_damage_achievements(attack_data, false)
		else
			if attacker_unit and alive(attacker_unit) and managers.groupai:state():is_unit_team_AI(attacker_unit) then
				self:_AI_comment_death(attacker_unit, self._unit)
			end
		end
	end

	local weapon_unit = weap_unit
	local weap_base = nil
	
	if alive(weapon_unit) and weapon_unit.base then
		weap_base = weapon_unit:base() 
		if weap_base and weap_base.add_damage_result then
			weapon_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
		end
	end

	if not attack_data.is_fire_dot_damage and attack_data.fire_dot_data and result.type ~= "death" then --DoT never triggers an animation so it shouldn't constantly micro-stun enemies that are vulnerable to fire
		local fire_dot_data = attack_data.fire_dot_data
		local flammable, start_dot_dance_antimation = nil

		if self._char_tweak.flammable == nil then
			flammable = true
		else
			flammable = self._char_tweak.flammable
		end

		if flammable then
			local fire_dot_max_distance = weap_base and weap_base.far_falloff_distance and weap_base.far_falloff_distance + weap_base.near_falloff_distance or tonumber(fire_dot_data.dot_trigger_max_distance) or 3000
			local fire_dot_panic_max_distance = weap_base and weap_base.near_falloff_distance or 500

			if distance < fire_dot_max_distance then
				local start_dot_damage_roll = math.random(1, 100)
				local fire_dot_trigger_chance = tonumber(fire_dot_data.dot_trigger_chance) or 30

				--Dragon's breath trigger chance scales with range.
				if weap_base and weap_base.far_falloff_distance then
					fire_dot_trigger_chance = (1 - math.min(1, math.max(0, distance - weap_base.near_falloff_distance) / weap_base.far_falloff_distance)) * fire_dot_trigger_chance
				end

				if start_dot_damage_roll <= fire_dot_trigger_chance then
					local dot_damage = fire_dot_data.dot_damage or 25
					local t = TimerManager:game():time()

					managers.fire:add_doted_enemy(self._unit, t, weap_unit, fire_dot_data.dot_length, dot_damage, attacker_unit, attack_data.is_molotov)

					local use_animation_on_fire_damage = nil

					if self._char_tweak.use_animation_on_fire_damage == nil then
						use_animation_on_fire_damage = true
					else
						use_animation_on_fire_damage = self._char_tweak.use_animation_on_fire_damage
					end
					
					if not (attack_data.is_fire_pool_damage or attack_data.is_molotov) and distance > fire_dot_panic_max_distance then
						use_animation_on_fire_damage = nil
					end

					if use_animation_on_fire_damage then
						if self.get_last_time_unit_got_fire_damage then
							local last_time_received = self:get_last_time_unit_got_fire_damage()

							if last_time_received == nil or t - last_time_received > 2 then
								start_dot_dance_antimation = true
							end
						else
							start_dot_dance_antimation = true
						end
					end
				end
			end

			fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
			attack_data.fire_dot_data = fire_dot_data
		end

		if not start_dot_dance_antimation then --prevent fire_hurt from micro-stunning enemies when the dance animation isn't proced
			result.type = "dmg_rcv"
			attack_data.result.type = "dmg_rcv"
		else
			result.type = "fire_hurt"
			attack_data.result.type = "fire_hurt"
		end
	end

	local attacker = attack_data.attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attacker = self._unit
	end

	self:_send_fire_attack_result(attack_data, attacker, damage_percent, attack_data.is_fire_dot_damage, attack_data.col_ray.ray, attack_data.result.type == "healed")
	self:_on_damage_received(attack_data)

	if not attack_data.is_fire_dot_damage and not is_civilian and attacker_unit and alive(attacker_unit) then
		managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
	end

	return result
end


function CopDamage:sync_damage_fire(attacker_unit, damage_percent, start_dot_dance_antimation, death, direction, weapon_type, weapon_id, healed)
	if self._dead then
		return
	end

	local variant = "fire"
	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit
	}

	local attacker = attack_data.attacker_unit
	local weapon_unit = nil

	if attacker and attacker:base() and attacker:base().thrower_unit then
		attacker = attacker:base():thrower_unit()
		weapon_unit = attack_data.attacker_unit
	end

	if not weapon_unit and weapon_id ~= "molotov" then
		weapon_unit = attacker_unit and attacker_unit:inventory() and alive(attacker_unit:inventory():equipped_unit()) and attacker_unit:inventory():equipped_unit()
		attack_data.is_fire_pool_damage = true
	end

	local hit_pos = mvector3.copy(self._unit:position())
	mvector3.set_z(hit_pos, hit_pos.z + 100)

	local attack_dir, result = nil

	if direction then
		attack_dir = direction
	elseif attacker_unit then
		local from_pos = nil

		if attacker_unit:movement() then
			if attacker_unit:movement().m_detect_pos then
				from_pos = attacker_unit:movement():m_detect_pos()
			elseif attacker_unit:movement().m_head_pos then
				from_pos = attacker_unit:movement():m_head_pos()
			else
				from_pos = attacker_unit:position()
			end
		else
			from_pos = attacker_unit:position()
		end

		attack_dir = hit_pos - from_pos
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end

	attack_data.attack_dir = attack_dir
	hit_pos = hit_pos - attack_dir * 5
	attack_data.pos = hit_pos

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	attack_data.damage = damage

	if death then
		attack_data.damage = self._health

		if table_contains(grenadier_smash, self._unit:name()) then
			self._unit:damage():run_sequence_simple("grenadier_glass_break")
		elseif self._head_body_name then
			local body = self._unit:body(self._head_body_name)

			self:_spawn_head_gadget({
				skip_push = true,
				position = body:position(),
				rotation = body:rotation()
			})
		end

		if Network:is_server() and self._char_tweak.gas_on_death then
			managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)
		end

		result = {
			type = "death",
			variant = variant
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, "fire", false, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())

		local data = {
			variant = variant,
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			weapon_unit = weapon_unit,
			is_molotov = weapon_id == "molotov"
		}

		managers.statistics:killed_by_anyone(data)

		if attacker == managers.player:player_unit() then
			if alive(attacker) then
				self:_comment_death(attacker, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end

			self:_check_damage_achievements(attack_data, false)
		end
	else
		local result_type = "dmg_rcv"

		if healed then
			result_type = "healed"

			attack_data.damage = self._health
		else
			self:_apply_damage_to_health(damage)
		end

		result = {
			type = result_type,
			variant = variant
		}
	end

	attack_data.result = result
	attack_data.is_synced = true
	weapon_unit = attack_data.weapon_unit or weapon_unit

	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end

	self:_on_damage_received(attack_data)
end

function CopDamage:damage_bullet(attack_data)
	if self._dead or self._invulnerable then
		return
	end

	if self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end

	if self._char_tweak.bullet_damage_only_from_front then
		mvector3.set(mvec_1, attack_data.col_ray.ray)
		mvector3.set_z(mvec_1, 0)
		mrotation.y(self._unit:rotation(), mvec_2)
		mvector3.set_z(mvec_2, 0)

		local not_from_the_front = mvector3.dot(mvec_1, mvec_2) > 0.3

		if not_from_the_front then
			return
		end
	end	

	if alive(attack_data.attacker_unit) and attack_data.attacker_unit:in_slot(16) then
		local has_surrendered = self._unit:brain().surrendered and self._unit:brain():surrendered() or self._unit:anim_data().surrender or self._unit:anim_data().hands_back or self._unit:anim_data().hands_tied

		if has_surrendered then
			return
		end
	end

	local weap_base = attack_data.weapon_unit:base()
	if self._char_tweak.damage.bullet_dodge_chance then
		local dodge_chance = self._char_tweak.damage.bullet_dodge_chance
		if weap_base.thrower_unit or weap_base.is_category and weap_base:is_category("saw") then
			dodge_chance = 0
		end

		if dodge_chance > 0 then
			local roll = math.rand(1, 100)

			if roll <= dodge_chance then
				self._unit:sound():play("bullet_whizby_medium", nil, nil)

				return
			end
		end
	end

	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	local damage = attack_data.damage
	
	local ignore = self._unit:base()._tweak_table == "spring" or self._unit:base()._tweak_table == "tank_titan"	or self._unit:base()._tweak_table == "headless_hatman" or self._unit:base()._tweak_table == "tank_titan_assault"	
	
	local hit_body = attack_data.col_ray.body
	if armour[hit_body:name():key()] and not ignore then -- dozer armour negates damage
		local pierce_armor = nil
		
		--Just as a fallback, ugly as sin but whatever
		if attack_data.attacker_unit:base() and not attack_data.attacker_unit:base().sentry_gun and not weap_base.thrower_unit then
			if attack_data.weapon_unit:base():armor_piercing_chance() and attack_data.weapon_unit:base():armor_piercing_chance() > 0 then
				pierce_armor = true
				damage = damage * attack_data.weapon_unit:base():armor_piercing_chance() or 1
			end
		end		

		if attack_data.armor_piercing or weap_base.thrower_unit then
			pierce_armor = true
		end

		if pierce_armor then
			World:effect_manager():spawn({
				effect = Idstring("effects/payday2/particles/impacts/blood/blood_impact_a"),
				position = attack_data.col_ray.position,
				normal = attack_data.col_ray.ray
			})
		else
			if attack_data.attacker_unit == managers.player:player_unit() and hit_body:extension() and hit_body:extension().damage then
				managers.hud:on_hit_confirmed() -- no damage to the unit, but it did damage the body
			end

			World:effect_manager():spawn({
				effect = Idstring("effects/payday2/particles/impacts/steel_no_decal_impact_pd2"),
				position = attack_data.col_ray.position,
				normal = attack_data.col_ray.ray
			})			
			--new sound below
			self._unit:sound():play("knuckles_hit_gen", nil, nil)
			self._unit:sound():play("knife_equip", nil, nil)
		
			return
		end
	end
	
	if not self._unit:movement():cloaked() and math_random() < 0.75 then
		self._unit:movement():set_cloaked(true, true)
	end

	local result = nil
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and not self._unit:in_slot(16) and not self._char_tweak.ignore_headshot and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name or head_hitboxes[hit_body:name():key()]

	if head and not weap_base.thrower_unit and self._unit:base():has_tag("tank") then
		mvector3.set(mvec_1, attack_data.col_ray.ray)
		mrotation.z(self._unit:movement():m_head_rot(), mvec_2)

		local not_from_the_front = mvector3.dot(mvec_1, mvec_2) >= 0

		if not_from_the_front then
			head = false
		end
	end

	attack_data.headshot = head

	local headshot_by_player = false
	local headshot_multiplier = 1
	local distance = attack_data.col_ray and attack_data.col_ray.distance or mvector3.distance(attack_data.origin, self._unit:position()) or 0

	if self._char_tweak.damage.bullet_damage_mul then
		damage = damage * self._char_tweak.damage.bullet_damage_mul
	end	
	
	local damage_type = "normal"
	local ineffective_damage = false
	local effective_damage = false
	local is_player = attack_data.attacker_unit == managers.player:player_unit() and true
	local damage_clamp = self._char_tweak.DAMAGE_CLAMP_BULLET
	
	if is_player then
		if  self._char_tweak.priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
			
			if attack_data.weapon_unit:base().weapon_tweak_data then
				damage = damage * (attack_data.weapon_unit:base():weapon_tweak_data().special_damage_multiplier or 1)
			end			
		end
	
		if head then
			managers.player:on_headshot_dealt(self._unit, attack_data)
			headshot_by_player = true
			headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		end
	end

	if not weap_base.thrower_unit then
		--Sentries should do machine gun damage
		if attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
			damage_type = "machine_gun"
		else 
			damage_type = attack_data.weapon_unit:base():get_damage_type() 
		end
			
		--Damage multipliers for specific damage types come into play *after* the base damage type multiplier above
		if self._char_tweak.damage_resistance and damage_type then
			damage = damage * (self._char_tweak.damage_resistance[damage_type] or 1)
			
			--Let the player know to try something different
			if self._char_tweak.damage_resistance[damage_type] and self._char_tweak.damage_resistance[damage_type] < 1 then
				ineffective_damage = true
			elseif self._char_tweak.damage_resistance[damage_type] and self._char_tweak.damage_resistance[damage_type] > 1 then
				effective_damage = true
			end		
		end		
	end	

	if not self._damage_reduction_multiplier and head then
		local weapon_hs_mult = attack_data.weapon_unit:base()._hs_mult or 1
		local weapon_ene_hs_mult = attack_data.weapon_unit:base()._ene_hs_mult or 1
		local is_captain = weapon_hs_mult > 1 and self._char_tweak.ends_assault_on_death
		if self._char_tweak.headshot_dmg_mul then
			damage = math.max( damage, damage * ((((self._char_tweak.headshot_dmg_mul - 1) * weapon_ene_hs_mult) + 1) * headshot_multiplier) * ((not is_captain and weapon_hs_mult) or 1) )
		else
			damage = self._health * 10
		end
	end
		
	if self._marked_dmg_mul then
		damage = damage * self._marked_dmg_mul

		if self._marked_dmg_dist_mul then
			local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

			if spott_dst[1] < distance then
				damage = damage * spott_dst[2]
			end
		end
	end

	if not head and attack_data.attacker_unit == managers.player:player_unit() and not self._char_tweak.must_headshot and not self._char_tweak.priority_shout and self._char_tweak.headshot_dmg_mul then
		if (weap_base.fire_mode and weap_base:fire_mode() == "auto") and weap_base.is_category and (weap_base:is_category("smg", "lmg", "minigun") and managers.player:has_category_upgrade("weapon", "automatic_head_shot_add") or managers.player:has_category_upgrade("player", "universal_body_expertise")) then
			attack_data.add_head_shot_mul = managers.player:upgrade_value("weapon", "automatic_head_shot_add", nil)
		end

		if attack_data.add_head_shot_mul then
			local tweak_headshot_mul = math.max(0, self._char_tweak.headshot_dmg_mul - 1)
			local mul = tweak_headshot_mul * attack_data.add_head_shot_mul + 1
			damage = damage * mul
		end
	end

	damage = self:_apply_damage_reduction(damage)

	--Saw+Throwables ignore clamps
	if damage_clamp then
		if weap_base.thrower_unit or weap_base.is_category and weap_base:is_category("saw") then
			damage_clamp = nil
		else
			damage = math.min(damage, damage_clamp)
			--Cease
			ineffective_damage = true			
		end
	end	

	--Crits need to be the last calcuation to alter damage else Pocohud's crit damage pop-ups print wrong
	if is_player then
		attack_data.backstab = self:check_backstab(attack_data)

		if attack_data.backstab == true and weap_base._autograph_multiplier then
			damage = damage * weap_base._autograph_multiplier
		end

		local damage_scale = nil

		if weap_base.near_falloff_distance and weap_base.far_falloff_distance then
			damage_scale = distance >= weap_base.far_falloff_distance + weap_base.near_falloff_distance and 0 or distance >= weap_base.near_falloff_distance and 0.5 or 1
		end		
		
		local critical_hit, crit_damage = self:roll_critical_hit(attack_data, damage, damage_clamp)

		if critical_hit then
			damage = crit_damage
			attack_data.critical_hit = true

			if damage > 0 then
				managers.hud:on_crit_confirmed(damage_scale)
			end
		elseif ineffective_damage then
			if damage > 0 then
				managers.hud:on_ineffective_hit_confirmed(damage_scale)
			end		
		elseif effective_damage then
			if damage > 0 then
				managers.hud:on_effective_hit_confirmed(damage_scale)
			end				
		else
			if damage > 0 then
				managers.hud:on_hit_confirmed(damage_scale)
			end
		end

	end

	attack_data.raw_damage = damage

	if attack_data.weapon_unit and weap_base.is_category and weap_base:is_category("saw") then
		managers.groupai:state():_voice_saw() --THAT MADMAN HAS A FUCKIN' SAW
	end

	if attack_data.attacker_unit:base().sentry_gun and not self:is_friendly_fire(attack_data.attacker_unit) then
		managers.groupai:state():_voice_sentry() --FUCKING SCI-FI ROBOT GUNS
	end
	
	local summers_dr = managers.groupai:state():_get_summers_dr()
	if self._unit:base()._tweak_table == "summers" then
		damage = damage * summers_dr
	end

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	if self._health <= damage then
		attack_data.damage = self._health
		
		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
			self._player_damage_ratio = 0
		else
			if head then
				managers.player:on_lethal_headshot_dealt(attack_data.attacker_unit, attack_data)
				
				if table_contains(grenadier_smash, self._unit:name()) then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				else
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
				end
			
				local my_unit = self._unit	
				local sound_ext = my_unit:sound()	
				sound_ext:play("expl_gen_head", nil, nil)	

				local head_obj = ids_func("Head")
				local head_object_get = my_unit:get_object(head_obj)

				local is_spring = my_unit:base()._tweak_table == "spring"
				local accelerated_training_program = self._char_tweak.yellow_blood

				if head_object_get and not is_spring then
					local world_g = World
					if accelerated_training_program then
						world_g:effect_manager():spawn({
							effect = ids_func("effects/payday2/particles/impacts/blood/yellow/explosions/yellow_mist"), --need yellow brains
							parent = head_object_get		
						})
						if damage_type and damage_type == "sniper" or damage_type == "anti_materiel" or damage_type == "heavy_pistol" then
							world_g:effect_manager():spawn({
								effect = ids_func("effects/payday2/particles/impacts/blood/yellow/explosions/yellow_mist"),
								parent = head_object_get		
							})
							world_g:effect_manager():spawn({
								effect = ids_func("effects/payday2/particles/impacts/blood/yellow/explosions/yellow_mist"),
								parent = head_object_get		
							})
						end

					else
						world_g:effect_manager():spawn({
							effect = ids_func("effects/payday2/particles/impacts/blood/brain_splat"),
							parent = head_object_get		
						})
						if damage_type and damage_type == "sniper" or damage_type == "anti_materiel" or damage_type == "heavy_pistol" then
							world_g:effect_manager():spawn({
								effect = ids_func("effects/payday2/particles/explosions/red_mist"),
								parent = head_object_get		
							})
							world_g:effect_manager():spawn({
								effect = ids_func("effects/payday2/particles/explosions/red_mist"),
								parent = head_object_get		
							})
						end
					end
				end
			elseif Network:is_server() and self._char_tweak.gas_on_death then
				managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)			
			end


			result = {
				type = "death",
				variant = attack_data.variant
			}
			
			if is_player and (attack_data.backstab or head) then
				managers.player:add_backstab_dodge(attack_data.backstab, head)
			end
			
			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "bullet", headshot_by_player, attack_data.weapon_unit:base():get_name_id())
		end
	else
		attack_data.damage = damage

		local result_type = nil

		if not self._char_tweak.immune_to_knock_down then
			if attack_data.knock_down then
				result_type = "knock_down"
			elseif attack_data.stagger and not self._has_been_staggered then
				result_type = "stagger"
				self._has_been_staggered = true
			end
		end

		if not result_type then
			result_type = self:get_damage_type(damage_percent, "bullet")
		end

		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}		

		managers.statistics:killed_by_anyone(data)

		if attack_data.attacker_unit == managers.player:player_unit() then
			local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)

			self:_comment_death(attack_data.attacker_unit, self._unit, special_comment)
			self:_show_death_hint(self._unit:base()._tweak_table)

			local attacker_state = managers.player:current_state()
			data.attacker_state = attacker_state

			managers.statistics:killed(data)
			self:_check_damage_achievements(attack_data, head)


			local close_range = weap_base and ((weap_base.is_category and weap_base:is_category("saw")) or (distance <= (weap_base.near_falloff_distance or 100)))
			if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and not weap_base.thrower_unit and close_range and weap_base:is_category("shotgun", "saw") then
				managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
			end

			if is_civilian then
				managers.money:civilian_killed()
			end
		elseif attack_data.attacker_unit:base().sentry_gun then
			if Network:is_server() then
				local server_info = weap_base:server_information()

				if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
					local owner_peer = managers.network:session():peer(server_info.owner_peer_id)

					if owner_peer then
						owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant, data.stats_name)
					end
				else
					data.attacker_state = managers.player:current_state()

					managers.statistics:killed(data)
				end
			end

			local sentry_attack_data = deep_clone(attack_data)
			sentry_attack_data.attacker_unit = attack_data.attacker_unit:base():get_owner()

			if sentry_attack_data.attacker_unit == managers.player:player_unit() then
				self:_check_damage_achievements(sentry_attack_data, head)
			else
				self._unit:network():send("sync_damage_achievements", sentry_attack_data.weapon_unit, sentry_attack_data.attacker_unit, sentry_attack_data.damage, sentry_attack_data.col_ray and sentry_attack_data.col_ray.distance, head)
			end
		else
			if managers.groupai:state():is_unit_team_AI(attack_data.attacker_unit) then
				local special_comment = self:_check_special_death_conditions(attack_data.variant, attack_data.col_ray.body, attack_data.attacker_unit, attack_data.weapon_unit)

				self:_AI_comment_death(attack_data.attacker_unit, self._unit, special_comment)
			end
		end
	end

	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:position().z, 0, 300)
	local attacker = attack_data.attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attacker = self._unit
	end

	if weap_base.add_damage_result then
		weap_base:add_damage_result(self._unit, result.type == "death", attacker, damage_percent) --add bow and arrow base checks
	end

	local i_result = nil

	if result.type == "healed" then
		i_result = 1
	else
		i_result = 0
	end

	self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height, i_result)
	self:_on_damage_received(attack_data)

	if not is_civilian then
		managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
	end

	result.attack_data = attack_data

	return result
end

function CopDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, i_result, death)
	if self._dead then
		return
	end

	local attack_data = {
		variant = "bullet",
		attacker_unit = attacker_unit
	}

	local from_pos, attack_dir, result = nil
	local body = self._unit:body(i_body)
	local hit_body = attack_data.col_ray.body
	local head = self._head_body_name and not self._unit:in_slot(16) and not self._char_tweak.ignore_headshot and body and body:name() == self._ids_head_body_name or head_hitboxes[hit_body:name():key()]
	local hit_pos = mvector3.copy(body:position())
	attack_data.pos = hit_pos
	attack_data.headshot = head
	attack_data.weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit()	

	if attacker_unit then
		from_pos = attacker_unit:movement().m_detect_pos and attacker_unit:movement():m_detect_pos() or attacker_unit:movement():m_head_pos()

		attack_dir = hit_pos - from_pos
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end

	attack_data.attack_dir = attack_dir

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	attack_data.damage = damage

	if death then
		attack_data.damage = self._health

		if head then
			if table_contains(grenadier_smash, self._unit:name()) then
				self._unit:damage():run_sequence_simple("grenadier_glass_break")
			else
				self:_spawn_head_gadget({
					position = body:position(),
					rotation = body:rotation(),
					dir = attack_dir
				})
			end
			
			local my_unit = self._unit	
			local sound_ext = my_unit:sound()	
			sound_ext:play("expl_gen_head", nil, nil)	

			local head_obj = ids_func("Head")
			local head_object_get = my_unit:get_object(head_obj)

			local is_spring = my_unit:base()._tweak_table == "spring"
			local accelerated_training_program = self._char_tweak.yellow_blood

			local damage_type = (alive(attack_data.weapon_unit) and attack_data.weapon_unit.base and attack_data.weapon_unit:base():get_damage_type()) or "normal"
			if head_object_get and not is_spring then
				local world_g = World
				if accelerated_training_program then
					world_g:effect_manager():spawn({
						effect = ids_func("effects/payday2/particles/impacts/blood/yellow/explosions/yellow_mist"), --need yellow brains
						parent = head_object_get		
					})
					if damage_type and damage_type == "sniper" or damage_type == "anti_materiel" or damage_type == "heavy_pistol" then
						world_g:effect_manager():spawn({
							effect = ids_func("effects/payday2/particles/impacts/blood/yellow/explosions/yellow_mist"),
							parent = head_object_get		
						})
						world_g:effect_manager():spawn({
							effect = ids_func("effects/payday2/particles/impacts/blood/yellow/explosions/yellow_mist"),
							parent = head_object_get		
						})
					end

				else
					world_g:effect_manager():spawn({
						effect = ids_func("effects/payday2/particles/impacts/blood/brain_splat"),
						parent = head_object_get		
					})
					if damage_type and damage_type == "sniper" or damage_type == "anti_materiel" or damage_type == "heavy_pistol" then
						world_g:effect_manager():spawn({
							effect = ids_func("effects/payday2/particles/explosions/red_mist"),
							parent = head_object_get		
						})
						world_g:effect_manager():spawn({
							effect = ids_func("effects/payday2/particles/explosions/red_mist"),
							parent = head_object_get		
						})
					end
				end
			end
		elseif Network:is_server() and self._char_tweak.gas_on_death then
			managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)		
		end

		result = {
			variant = "bullet",
			type = "death"
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, "bullet", head, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())

		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}

		if data.weapon_unit then
			self:_check_special_death_conditions("bullet", body, attacker_unit, data.weapon_unit)
			managers.statistics:killed_by_anyone(data)
		end
	else
		local result_type = "dmg_rcv"

		if i_result == 1 then
			result_type = "healed"

			attack_data.damage = self._health
		else
			self:_apply_damage_to_health(damage)
		end

		result = {
			variant = "bullet",
			type = result_type
		}
	end

	attack_data.result = result
	attack_data.is_synced = true

	if not self._no_blood and damage > 0 then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end

	self:_on_damage_received(attack_data)
end

function CopDamage:damage_melee(attack_data)
	if self._dead or self._invulnerable then
		return
	end

	if self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end	

	if alive(attack_data.attacker_unit) and attack_data.attacker_unit:in_slot(16) then
		local has_surrendered = self._unit:brain().surrendered and self._unit:brain():surrendered() or self._unit:anim_data().surrender or self._unit:anim_data().hands_back or self._unit:anim_data().hands_tied

		if has_surrendered then
			return
		end
	end

	local result = nil
	local is_civlian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	local is_gangster = CopDamage.is_gangster(self._unit:base()._tweak_table)
	local is_cop = not is_civlian and not is_gangster
	local hit_body = attack_data.col_ray.body
	local head = self._head_body_name and not self._unit:in_slot(16) and not self._char_tweak.ignore_headshot and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name or head_hitboxes[hit_body:name():key()]
	local headshot_multiplier = attack_data.headshot_multiplier or 1
	local damage = attack_data.damage
	local damage_effect = attack_data.damage_effect or attack_data.damage
	local is_player = attack_data.attacker_unit == managers.player:player_unit() and true
	local damage_clamp = self._char_tweak.DAMAGE_CLAMP_MELEE

	if is_player then
		if self._char_tweak.priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end

		if head then
			headshot_multiplier = headshot_multiplier * managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
			managers.player:on_headshot_dealt(self._unit, attack_data)
		end

		attack_data.backstab = self:check_backstab(attack_data)

		if attack_data.backstab and attack_data.backstab_multiplier then
			damage = damage * attack_data.backstab_multiplier
			damage_effect = damage_effect * attack_data.backstab_multiplier
		end
	end

	if self._char_tweak.damage.melee_damage_mul then
		damage = damage * self._char_tweak.damage.melee_damage_mul
	end		

	if self._marked_dmg_mul then
		damage = damage * self._marked_dmg_mul
		damage_effect = damage_effect * self._marked_dmg_mul
	end

	if head and not self._damage_reduction_multiplier then
		if self._char_tweak.headshot_dmg_mul then
			--Use math.max to cover edge cases (mostly Capt. Summers) where cleaver type weapons would deal *less* damage on a headshot than a bodyshot.
			headshot_multiplier = math.max(self._char_tweak.headshot_dmg_mul * headshot_multiplier, 1)
			damage = damage * headshot_multiplier
			damage_effect = damage_effect * headshot_multiplier
		else
			damage = self._health * 10
			damage_effect = self._health * 10
		end
	end

	local melee_tweak_data = tweak_data.blackmarket.melee_weapons[attack_data.name_id]
	local ineffective_damage = false
	local effective_damage = false
	local damage_type = melee_tweak_data and melee_tweak_data.stats.weapon_type or "blunt"
	
	--Damage multipliers for specific damage types come into play *after* the base damage type multiplier above
	if self._char_tweak.damage_resistance and damage_type then
		damage = damage * (self._char_tweak.damage_resistance[damage_type] or 1)
		
		--Let the player know to try something different
		if self._char_tweak.damage_resistance[damage_type] and self._char_tweak.damage_resistance[damage_type] < 1 then
			ineffective_damage = true
		elseif self._char_tweak.damage_resistance[damage_type] and self._char_tweak.damage_resistance[damage_type] > 1 then
			effective_damage = true
		end		
	end		

	damage = self:_apply_damage_reduction(damage)
	damage_effect = self:_apply_damage_reduction(damage_effect)

	if damage_clamp then
		damage = math.min(damage, damage_clamp)
		damage_effect = math.min(damage_effect, damage_clamp)
	end
	
	if is_player then
		local critical_hit, crit_damage = self:roll_critical_hit(attack_data, damage, damage_clamp)
		
		if critical_hit then
			damage = crit_damage

			local critical_hits = self._char_tweak.critical_hits or {}
			local critical_damage_mul = critical_hits.damage_mul or self._char_tweak.headshot_dmg_mul

			if critical_damage_mul then
				damage_effect = damage_effect * critical_damage_mul				
			else
				damage_effect = self._health * 10
			end

			attack_data.critical_hit = true

			if damage > 0 then
				managers.hud:on_crit_confirmed()
			end
		elseif ineffective_damage then
			if damage > 0 then
				managers.hud:on_ineffective_hit_confirmed(damage_scale)
			end		
		elseif effective_damage then
			if damage > 0 then
				managers.hud:on_effective_hit_confirmed(damage_scale)
			end					
		else
			if damage > 0 then
				managers.hud:on_hit_confirmed()
			end
		end

		if tweak_data.achievement.cavity.melee_type == attack_data.name_id and not is_civilian then
			managers.achievment:award(tweak_data.achievement.cavity.award)
		end
	end

	local summers_dr = managers.groupai:state():_get_summers_dr()
	if self._unit:base()._tweak_table == "summers" then
		damage = damage * summers_dr
	end

	attack_data.raw_damage = damage

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	damage_effect = math.clamp(damage_effect, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	local damage_effect_percent = math.ceil(damage_effect / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
	damage_effect, damage_effect_percent = self:_apply_min_health_limit(damage_effect, damage_effect_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
		damage_effect = math.min(damage_effect, self._health - 1)
	end

	if self._health <= damage then
		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = "melee"
			}
		else
			damage_effect_percent = 1
			attack_data.damage = self._health
			attack_data.damage_effect = self._health

			if head then
				if table_contains(grenadier_smash, self._unit:name()) then
					self._unit:damage():run_sequence_simple("grenadier_glass_break")
				else
					self:_spawn_head_gadget({
						position = attack_data.col_ray.body:position(),
						rotation = attack_data.col_ray.body:rotation(),
						dir = attack_data.col_ray.ray
					})
				end
			end

			result = {
				type = "death",
				variant = attack_data.variant
			}

			if is_player and (attack_data.backstab or head) then
				managers.player:add_backstab_dodge(attack_data.backstab, head)
			end

			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, "melee", false, attack_data.name_id)
		end
	else
		attack_data.damage = damage
		attack_data.damage_effect = damage_effect
		damage_effect = math.clamp(damage_effect, self._HEALTH_INIT_PRECENT, self._HEALTH_INIT)
		damage_effect_percent = math.ceil(damage_effect / self._HEALTH_INIT_PRECENT)
		damage_effect_percent = math.clamp(damage_effect_percent, 1, self._HEALTH_GRANULARITY)
		local result_type = attack_data.shield_knock and self._char_tweak.damage.shield_knocked and "shield_knock" or attack_data.variant == "counter_tased" and "counter_tased" or attack_data.variant == "taser_tased" and "taser_tased" or attack_data.variant == "counter_spooc" and "expl_hurt" or self:get_damage_type(damage_effect_percent, "melee") or "fire_hurt"
		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	local dismember_victim = false
	local snatch_pager, from_behind = nil

	if result.type == "death" then
		if self:_dismember_condition(attack_data) then
			self:_dismember_body_part(attack_data)

			dismember_victim = true
		end

		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			name_id = attack_data.name_id,
			variant = attack_data.variant
		}

		managers.statistics:killed_by_anyone(data)

		if attack_data.attacker_unit == managers.player:player_unit() then
			local special_comment = self:_check_special_death_conditions("melee", attack_data.col_ray.body, attack_data.attacker_unit, attack_data.name_id)

			self:_comment_death(attack_data.attacker_unit, self._unit, special_comment)
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if not is_civlian and managers.groupai:state():whisper_mode() and managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.cant_hear_you_scream.mask then
				managers.achievment:award_progress(tweak_data.achievement.cant_hear_you_scream.stat)
			end

			mvector3.set(mvec_1, self._unit:position())
			mvector3.subtract(mvec_1, attack_data.attacker_unit:position())
			mvector3.normalize(mvec_1)
			mvector3.set(mvec_2, self._unit:rotation():y())

			local from_behind = mvector3.dot(mvec_1, mvec_2) >= 0

			if is_cop and Global.game_settings.level_id == "nightclub" and attack_data.name_id and attack_data.name_id == "fists" then
				managers.achievment:award_progress(tweak_data.achievement.final_rule.stat)
			end

			if is_civilian then
				managers.money:civilian_killed()
			else
				local job = Global.level_data and Global.level_data.level_id

				if job == "short1_stage1" or job == "short1_stage2" then
					--Just in case, cause otherwise it apparently screws everything up
					snatch_pager = false
				else
					if managers.player:upgrade_value("player", "melee_kill_snatch_pager_chance", 0) > math.rand(1) then
						if self._unit:movement():cool() then
							snatch_pager = true
							self._unit:unit_data().has_alarm_pager = false
						else
							local not_cool_t = self._unit:movement().not_cool_t and self._unit:movement():not_cool_t()
							local t = TimerManager:game():time()

							if not not_cool_t or t - not_cool_t < 0.75 then
								snatch_pager = true
								self._unit:unit_data().has_alarm_pager = false
							end
						end
					end
				end
			end


		elseif managers.groupai:state():is_unit_team_AI(attack_data.attacker_unit) then
			local special_comment = self:_check_special_death_conditions("melee", attack_data.col_ray.body, attack_data.attacker_unit, attack_data.name_id)

			self:_AI_comment_death(attack_data.attacker_unit, self._unit, special_comment)
		end
	end

	if is_player then
		self:_check_melee_achievements(attack_data)
	end

	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local variant = nil

	if result.type == "shield_knock" then
		variant = 1
	elseif result.type == "counter_tased" then
		variant = 2
	elseif result.type == "expl_hurt" then
		variant = 4
	elseif snatch_pager then
		variant = 3
	elseif result.type == "taser_tased" then
		variant = 5
	elseif dismember_victim then
		variant = 6
	elseif result.type == "healed" then
		variant = 7
	else
		variant = 0
	end
	
	if attack_data.charge_lerp_value then
		result.charge_lerp_value = attack_data.charge_lerp_value
	end

	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())

	self:_send_melee_attack_result(attack_data, damage_percent, damage_effect_percent, hit_offset_height, variant, body_index)
	self:_on_damage_received(attack_data)

	return result
end

function CopDamage:sync_damage_melee(attacker_unit, damage_percent, damage_effect_percent, i_body, hit_offset_height, variant, death)
	local attack_data = {
		variant = "melee",
		attacker_unit = attacker_unit
	}
	local body = self._unit:body(i_body)
	local hit_body = attack_data.col_ray.body
	local head = self._head_body_name and not self._unit:in_slot(16) and not self._char_tweak.ignore_headshot and body and body:name() == self._ids_head_body_name or head_hitboxes[hit_body:name():key()]
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local damage_effect = damage_effect_percent * self._HEALTH_INIT_PRECENT
	local result = nil

	local attack_dir = nil

	if attacker_unit then --attack_dir needs to be defined before "if death"
		attack_dir = self._unit:position() - attacker_unit:position()

		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir

	if death then
		--[[
		if self:_sync_dismember(attacker_unit) and variant == 6 then
			attack_data.body_name = body:name()

			self:_dismember_body_part(attack_data)
		end
		]]

		if head then
			if table_contains(grenadier_smash, self._unit:name()) then
				self._unit:damage():run_sequence_simple("grenadier_glass_break")
			else
				self:_spawn_head_gadget({
					position = body:position(),
					rotation = body:rotation(),
					dir = attack_dir
				})
			end
		end

		result = {
			variant = "melee",
			type = "death"
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, "melee", false, nil)

		local data = {
			variant = "melee",
			head_shot = false,
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name
		}

		managers.statistics:killed_by_anyone(data)
	else
		local result_type = variant == 1 and "shield_knock" or variant == 2 and "counter_tased" or variant == 5 and "taser_tased" or variant == 4 and "expl_hurt" or self:get_damage_type(damage_effect_percent, "bullet") or "fire_hurt"
		result = {
			variant = "melee",
			type = result_type
		}

		self:_apply_damage_to_health(damage)

		attack_data.variant = result_type
	end

	attack_data.result = result
	attack_data.damage = damage
	attack_data.damage_effect = self._health
	attack_data.is_synced = true
	attack_data.name_id = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():get_melee_weapon_id()

	if variant == 3 then
		self._unit:unit_data().has_alarm_pager = false
	end

	attack_data.pos = self._unit:position()

	mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)

	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(self._unit:movement():m_pos() + Vector3(0, 0, hit_offset_height), attack_dir)
	end

	self:_send_sync_melee_attack_result(attack_data, hit_offset_height)
	self:_on_damage_received(attack_data)
end

local old_death = CopDamage.die
function CopDamage:die(attack_data)
	local job = Global.level_data and Global.level_data.level_id
	--Increment skirmish kill counter.
	if managers.skirmish:is_skirmish() then
		managers.skirmish:do_kill()
	end

	if not self._char_tweak.always_drop and self._pickup == "ammo" then
		local attacker_unit = attack_data.attacker_unit

		if attacker_unit and alive(attacker_unit) then
			if attacker_unit:in_slot(16) then
				local roll = math.random()
				local ammo_chance = 0.2 + self._player_damage_ratio --Enemy bot ammo drop chance increases based on the amount of damage dealy by a player.
				--80% of health damage leading to kill dealt by a player == 100% chance to drop ammo.
				--0% of health damage leading to kill dealt by a player == 20% chance to drop ammo.

				if roll >= ammo_chance then
					self:set_pickup()
				end
			end
		end
	end

	old_death(self, attack_data)

	if self._unit:interaction().tweak_data == "hostage_convert" then
		self._unit:interaction():set_active(false, true, false)
	end

	if self._char_tweak.ends_assault_on_death then
		if job == "crojob3" or job == "crojob3_night" then
			--No assault end, as they're not the assaulting force
		else
			managers.groupai:state():force_end_assault_phase()
		end
		managers.hud:set_buff_enabled("vip", false)
	end

	if self._unit:contour() then
		self._unit:contour():remove("omnia_heal", false)
		self._unit:contour():remove("medic_show", false)
		self._unit:contour():remove("medic_buff", false)
	end

	if self._unit:base()._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("kill_spook_lights")
	end

	if self._char_tweak.failure_on_death then
		managers.groupai:state():set_point_of_no_return_timer(5, 0)
	end

	if self._char_tweak.do_autumn_blackout then
		managers.groupai:state():unregister_blackout_source(self._unit)
	end

	if self._char_tweak.die_sound_event_2 then
		self._unit:sound():play(self._char_tweak.die_sound_event_2, nil, true)
	end

	if self._unit:base()._tweak_table == "boom" then
		local boom_boom = false
		boom_boom = managers.modifiers:modify_value("CopDamage:CanBoomBoom", boom_boom)
		boom_boom = managers.mutators:modify_value("CopDamage:CanBoomBoom", boom_boom)
		if boom_boom then
			MutatorExplodingEnemies._detonate(MutatorExplodingEnemies, self, attack_data, true, 60, 500)
		end
	end
	
	if self._char_tweak.reduce_summers_dr_on_death then
		managers.groupai:state():_reduce_summers_dr(0.15)
	end	
end

function CopDamage:stun_hit(attack_data)
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end

	if self._dead or self._invulnerable or self._unit:in_slot(16, 21, 22) then
		return
	else
		local anim_data = self._unit:anim_data()

		if anim_data and anim_data.act then
			return
		else
			if self._unit:brain().surrendered and self._unit:brain():surrendered() then
				return
			elseif anim_data then
				if anim_data.surrender or anim_data.hands_back or anim_data.hands_tied then
					return
				end
			end
		end
	end

	local attacker_unit = attack_data.attacker_unit

	if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
		attacker_unit = attacker_unit:base():thrower_unit()
	end

	if self:is_friendly_fire(attacker_unit) then
		return "friendly_fire"
	end

	local attacker = attack_data.attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attacker = self._unit
	end

	local result_type = "concussion"

	if self._char_tweak.tank_concussion then
		result_type = "expl_hurt"
	end

	local result = {
		type = result_type,
		variant = attack_data.variant
	}
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	self:_send_stun_attack_result(attacker, 0, self:_get_attack_variant_index(attack_data.variant), attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)
	self:_create_stun_exit_clbk()

	return result
end

function CopDamage:sync_damage_stun(attacker_unit, damage_percent, i_attack_variant, death, direction)
	if self._dead then
		return
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit
	}

	local hit_pos = mvector3.copy(self._unit:position())
	mvector3.set_z(hit_pos, hit_pos.z + 100)

	local attack_dir = nil

	if direction then
		attack_dir = direction
	elseif attacker_unit then
		attack_dir = self._unit:position() - attacker_unit:position()
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end

	attack_data.attack_dir = attack_dir
	hit_pos = hit_pos - attack_dir * 5
	attack_data.pos = hit_pos

	local result = {
		type = "concussion",
		variant = variant
	}
	attack_data.result = result
	attack_data.is_synced = true

	self:_on_damage_received(attack_data)
	self:_create_stun_exit_clbk()
end

function CopDamage:damage_explosion(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end	

	if attack_data.weapon_unit and alive(attack_data.weapon_unit) then
		if attack_data.weapon_unit:base() and attack_data.weapon_unit:base()._variant == "explosion" and not attack_data.weapon_unit:base()._thrower_unit then
			-- no friendly fire >:(
			return
		end
	end

	local attacker_unit = attack_data.attacker_unit
	local weap_unit = attack_data.weapon_unit

	if attacker_unit and alive(attacker_unit) then
		if attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			weap_unit = attack_data.attacker_unit
		end

		if self:is_friendly_fire(attacker_unit) then
			return "friendly_fire"
		end
	end

	if not self._unit:movement():cloaked() and math_random() < 0.75 then
		self._unit:movement():set_cloaked(true, true)
	end

	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	local result = nil
	local damage = attack_data.damage
		
	--Use a different damage resistance when being hit by a rocket	
	if alive(weap_unit) then
		local weap_base = weap_unit:base()
		if weap_base.thrower_unit or weap_base.get_name_id and weap_base:get_name_id() == "rocket_ray_frag" or weap_base:get_name_id() == "rocket_frag" then
			if self._char_tweak.damage.rocket_damage_mul then
				damage = damage * self._char_tweak.damage.rocket_damage_mul
			end	
		else
			if self._char_tweak.damage.explosion_damage_mul then
				damage = damage * self._char_tweak.damage.explosion_damage_mul
			end	
		end	
	end	

	if self._marked_dmg_mul then
		damage = damage * self._marked_dmg_mul

		if self._marked_dmg_dist_mul and alive(attacker_unit) then
			local dst = mvector3.distance(attacker_unit:position(), self._unit:position())
			local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

			if spott_dst[1] < dst then
				damage = damage * spott_dst[2]
			end
		end
	end

	damage = managers.modifiers:modify_value("CopDamage:DamageExplosion", damage, self._unit)
	damage = self:_apply_damage_reduction(damage)

	if attacker_unit == managers.player:player_unit() and damage > 0 and attack_data.variant ~= "stun" then
		managers.hud:on_hit_confirmed()
	end

	if self._char_tweak.DAMAGE_CLAMP_EXPLOSION then
		damage = math.min(damage, self._char_tweak.DAMAGE_CLAMP_EXPLOSION)
	end

	attack_data.raw_damage = damage

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	if self._health <= damage then
		attack_data.damage = self._health

		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
			self._player_damage_ratio = 0
		else
			result = {
				type = "death",
				variant = attack_data.variant
			}

			self:die(attack_data)
		end
	else
		attack_data.damage = damage

		local result_type = attack_data.variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "explosion")

		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	result.ignite_character = attack_data.ignite_character

	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = weap_unit,
			variant = attack_data.variant
		}

		managers.statistics:killed_by_anyone(data)

		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end

		if attack_data.variant ~= "stun" then
			if table_contains(grenadier_smash, self._unit:name()) then
				self._unit:damage():run_sequence_simple("grenadier_glass_break")
			elseif self._head_body_name then
				local body = self._unit:body(self._head_body_name)

				self:_spawn_head_gadget({
					skip_push = true,
					position = body:position(),
					rotation = body:rotation()
				})
			end
		end

		if Network:is_server() and self._char_tweak.gas_on_death then
			managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)
		end
		--[[
		if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attacker_unit == managers.player:player_unit() and attack_data.weapon_unit and attack_data.weapon_unit:base().weapon_tweak_data and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
			managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
		end
		]]

		self:chk_killshot(attacker_unit, "explosion", false, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())

		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if is_civilian then
				managers.money:civilian_killed()
			end

			self:_check_damage_achievements(attack_data, false)
		else
			if attacker_unit and alive(attacker_unit) and managers.groupai:state():is_unit_team_AI(attacker_unit) then
				self:_AI_comment_death(attacker_unit, self._unit)
			end
		end
	end

	if alive(weap_unit) and weap_unit:base() and weap_unit:base().add_damage_result then
		weap_unit:base():add_damage_result(self._unit, result.type == "death", attacker_unit, damage_percent)
	end

	if attack_data.variant ~= "stun" and not self._no_blood and damage > 0 then
		managers.game_play_central:sync_play_impact_flesh(attack_data.pos, attack_data.col_ray.ray)
	end

	local attacker = attack_data.attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attacker = self._unit
	end

	local sync_attack_variant = attack_data.variant

	if result.type == "healed" then
		sync_attack_variant = "healed"
	end

	self:_send_explosion_attack_result(attack_data, attacker, damage_percent, self:_get_attack_variant_index(sync_attack_variant), attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)

	if not is_civilian and attacker_unit and alive(attacker_unit) then
		managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
	end

	return result
end

function CopDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, direction, weapon_unit)
	if self._dead then
		return
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	local was_healed = nil

	if variant == "healed" then
		variant = "explosion"
		was_healed = true
	end

	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit,
		weapon_unit = weapon_unit or attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit()
	}

	local attacker = attack_data.attacker_unit
	local weapon_unit = weapon_unit

	if attacker and attacker:base() and attacker:base().thrower_unit then
		attacker = attacker:base():thrower_unit()
		weapon_unit = attack_data.attacker_unit
	end

	if not weapon_unit then
		weapon_unit = attacker_unit and attacker_unit:inventory() and alive(attacker_unit:inventory():equipped_unit()) and attacker_unit:inventory():equipped_unit()
	end

	local hit_pos = mvector3.copy(self._unit:position())
	mvector3.set_z(hit_pos, hit_pos.z + 100)

	local attack_dir, result = nil

	if direction then
		attack_dir = direction
	elseif attacker_unit then
		local from_pos = nil

		if attacker_unit:movement() then
			if attacker_unit:movement().m_detect_pos then
				from_pos = attacker_unit:movement():m_detect_pos()
			elseif attacker_unit:movement().m_head_pos then
				from_pos = attacker_unit:movement():m_head_pos()
			else
				from_pos = attacker_unit:position()
			end
		else
			from_pos = attacker_unit:position()
		end

		attack_dir = hit_pos - from_pos
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end

	attack_data.attack_dir = attack_dir
	hit_pos = hit_pos - attack_dir * 5
	attack_data.pos = hit_pos

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	attack_data.damage = damage

	if death then
		attack_data.damage = self._health

		if variant ~= "stun" then
			if table_contains(grenadier_smash, self._unit:name()) then
				self._unit:damage():run_sequence_simple("grenadier_glass_break")
			elseif self._head_body_name then
				local body = self._unit:body(self._head_body_name)

				self:_spawn_head_gadget({
					skip_push = true,
					position = body:position(),
					rotation = body:rotation()
				})
			end
		end

		if Network:is_server() and self._char_tweak.gas_on_death then
			managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)
		end

		result = {
			type = "death",
			variant = variant
		}

		self:die(attack_data)

		local data = {
			variant = "explosion",
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			weapon_unit = weapon_unit
		}

		managers.statistics:killed_by_anyone(data)

		self:chk_killshot(attacker, "explosion", false, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())
		
		if attacker == managers.player:player_unit() then
			if alive(attacker) then
				self:_comment_death(attacker, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end

			self:_check_damage_achievements(attack_data, false)
		end
	else
		local result_type = "dmg_rcv"

		if was_healed then
			result_type = "healed"

			attack_data.damage = self._health
		else
			self:_apply_damage_to_health(damage)
		end

		result = {
			type = result_type,
			variant = variant
		}
	end

	attack_data.result = result
	attack_data.is_synced = true
	weapon_unit = attack_data.weapon_unit or weapon_unit

	if damage > 0 and variant ~= "stun" and attacker == managers.player:player_unit() and alive(attacker) then
		managers.hud:on_hit_confirmed()
		managers.statistics:shot_fired({
			hit = true,
			weapon_unit = attack_data.weapon_unit
		})
	end

	if alive(weapon_unit) and weapon_unit:base() and weapon_unit:base().add_damage_result then
		weapon_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end

	if variant ~= "stun" and not self._no_blood and damage > 0 then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end

	self:_on_damage_received(attack_data)
end

function CopDamage:damage_simple(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end	

	if self._unit:in_slot(16, 21, 22) then
		return
	end

	local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)
	local result = nil
	local damage = attack_data.damage

	damage = self:_apply_damage_reduction(damage)

	if self._char_tweak.DAMAGE_CLAMP_SHOCK then
		damage = math.min(damage, self._char_tweak.DAMAGE_CLAMP_SHOCK)
	elseif self._char_tweak.DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._char_tweak.DAMAGE_CLAMP_BULLET)
	end

	attack_data.raw_damage = damage

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	if self._health <= damage then
		attack_data.damage = self._health

		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
			self._player_damage_ratio = 0
		else
			result = {
				type = "death",
				variant = attack_data.variant
			}

			self:die(attack_data)
		end
	else
		attack_data.damage = damage

		local result_type = nil

		if not self._char_tweak.immune_to_knock_down then
			local weapon_base = attack_data.attacker_unit and attack_data.attacker_unit:inventory() and attack_data.attacker_unit:inventory():equipped_unit() and attack_data.attacker_unit:inventory():equipped_unit():base()

			if weapon_base then
				local knock_down = weapon_base._knock_down and weapon_base._knock_down > 0 and math.random() < weapon_base._knock_down

				if knock_down then
					result_type = "knock_down"
				else
					local stagger = weapon_base._stagger and not self._has_been_staggered

					if stagger then
						result_type = "stagger"
						self._has_been_staggered = true
					end
				end
			end
		end

		if not result_type then
			result_type = self:get_damage_type(damage_percent)
		end

		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result

	local attacker_unit = attack_data.attacker_unit

	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}

		managers.statistics:killed_by_anyone(data)

		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end

		--[[
		if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attacker_unit == managers.player:player_unit() and attack_data.weapon_unit and attack_data.weapon_unit:base().weapon_tweak_data and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
			managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
		end
		]]

		self:chk_killshot(attacker_unit, "shock", false, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())

		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if is_civilian then
				managers.money:civilian_killed()
			end

			self:_check_damage_achievements(attack_data, false)
		else
			if attacker_unit and alive(attacker_unit) and managers.groupai:state():is_unit_team_AI(attacker_unit) then
				self:_AI_comment_death(attacker_unit, self._unit)
			end
		end
	end

	local attacker = attack_data.attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attacker = self._unit
	end

	if not self._no_blood and damage > 0 then
		managers.game_play_central:sync_play_impact_flesh(attack_data.pos, attack_data.attack_dir)
	end

	local i_result = nil

	if result.type == "healed" then
		i_result = 1
	else
		i_result = 0
	end

	self:_send_simple_attack_result(attacker, damage_percent, self:_get_attack_variant_index(attack_data.variant), i_result)
	self:_on_damage_received(attack_data)

	if not is_civilian and attacker_unit and alive(attacker_unit) then
		managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
	end

	return result
end

function CopDamage:sync_damage_simple(attacker_unit, damage_percent, i_attack_variant, i_result, death)
	if self._dead then
		return
	end

	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	local attack_data = {
		variant = variant,
		attacker_unit = attacker_unit
	}

	local hit_pos = mvector3.copy(self._unit:position())
	mvector3.set_z(hit_pos, hit_pos.z + 100)

	local attack_dir, result = nil

	if attacker_unit then
		local from_pos = nil

		if attacker_unit:movement() then
			if attacker_unit:movement().m_detect_pos then
				from_pos = attacker_unit:movement():m_detect_pos()
			elseif attacker_unit:movement().m_head_pos then
				from_pos = attacker_unit:movement():m_head_pos()
			else
				from_pos = attacker_unit:position()
			end
		else
			from_pos = attacker_unit:position()
		end

		attack_dir = hit_pos - from_pos
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end

	attack_data.attack_dir = attack_dir
	hit_pos = hit_pos - attack_dir * 5
	attack_data.pos = hit_pos

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	attack_data.damage = damage

	if death then
		attack_data.damage = self._health

		result = {
			type = "death",
			variant = variant
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, variant, false, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())

		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = variant
		}

		local attacker = attacker_unit

		if attacker and attacker:base() and attacker:base().thrower_unit then
			data.weapon_unit = attacker_unit
		end

		if data.weapon_unit then
			managers.statistics:killed_by_anyone(data)
		end
	else
		local result_type = "dmg_rcv"

		if i_result == 1 then
			result_type = "healed"

			attack_data.damage = self._health
		else
			self:_apply_damage_to_health(damage)
		end

		result = {
			type = result_type,
			variant = variant
		}
	end

	attack_data.result = result
	attack_data.is_synced = true

	if not self._no_blood and damage > 0 then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end

	self:_on_damage_received(attack_data)
end

function CopDamage:damage_dot(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end	

	if attack_data.attacker_unit and alive(attack_data.attacker_unit) and self:is_friendly_fire(attack_data.attacker_unit) then
		return "friendly_fire"
	end

	local damage = attack_data.damage

	if self._char_tweak.damage.dot_damage_mul then
		damage = damage * self._char_tweak.damage.dot_damage_mul
	end

	if self._marked_dmg_mul then
		damage = damage * self._marked_dmg_mul
	end

	damage = self:_apply_damage_reduction(damage)

	if self._char_tweak.DAMAGE_CLAMP_DOT then
		damage = math.min(damage, self._char_tweak.DAMAGE_CLAMP_DOT)
	end

	attack_data.raw_damage = damage

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	if not attack_data.variant then
		attack_data.variant = "dot"
	end

	local result = nil

	if self._health <= damage then
		attack_data.damage = self._health

		if self:check_medic_heal() then
			result = {
				type = "healed",
				variant = attack_data.variant
			}
			self._player_damage_ratio = 0
		else
			result = {
				type = "death",
				variant = attack_data.variant
			}

			self:die(attack_data)
			self:chk_killshot(attack_data.attacker_unit, attack_data.variant, nil, attack_data.weapon_id)
		end
	else
		attack_data.damage = damage

		local result_type = attack_data.hurt_animation and self:get_damage_type(damage_percent, attack_data.variant) or "dmg_rcv"

		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	if result.type == "death" then
		local variant = attack_data.weapon_id and tweak_data.blackmarket and tweak_data.blackmarket.melee_weapons and tweak_data.blackmarket.melee_weapons[attack_data.weapon_id] and "melee" or attack_data.variant
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = variant,
			name_id = attack_data.weapon_id
		}

		managers.statistics:killed_by_anyone(data)

		if attack_data.attacker_unit == managers.player:player_unit() then
			if alive(attack_data.attacker_unit) then
				self:_comment_death(attack_data.attacker_unit, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			local is_civilian = CopDamage.is_civilian(self._unit:base()._tweak_table)

			if is_civilian then
				managers.money:civilian_killed()
			end

			--[[
			if not is_civilian and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") and attack_data.weapon_unit and attack_data.weapon_unit:base().weapon_tweak_data and not attack_data.weapon_unit:base().thrower_unit and attack_data.weapon_unit:base():is_category("shotgun", "saw") then
				managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
			end
			--]]

			if attack_data and attack_data.weapon_id and not attack_data.weapon_unit then
				attack_data.name_id = attack_data.weapon_id

				self:_check_melee_achievements(attack_data)
			else
				self:_check_damage_achievements(attack_data, false)
			end
		end
	end

	if attack_data.hurt_animation and result.type ~= "poison_hurt" then
		attack_data.hurt_animation = false
	end

	local attacker = attack_data.attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attacker = self._unit
	end

	local sync_attack_variant = attack_data.variant

	if result.type == "healed" then
		if attack_data.variant == "poison" then
			sync_attack_variant = "poison_healed"
		else
			sync_attack_variant = "dot_healed"
		end
	end

	self:_send_dot_attack_result(attack_data, attacker, damage_percent, sync_attack_variant)
	self:_on_damage_received(attack_data)

	result.attack_data = attack_data
	result.damage_percent = damage_percent
	result.damage = damage
	
	return result
end

function CopDamage:sync_damage_dot(attacker_unit, damage_percent, death, variant, hurt_animation, weapon_id)
	if self._dead then
		return
	end

	local attack_variant, was_healed, result = nil

	if variant == "poison_healed" then
		attack_variant = "poison"
		was_healed = true
	elseif variant == "dot_healed" then
		attack_variant = "dot"
		was_healed = true
	else
		attack_variant = variant
	end

	local attack_data = {
		variant = attack_variant,
		attacker_unit = attacker_unit
	}
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	attack_data.damage = damage

	if death then
		attack_data.damage = self._health

		result = {
			type = "death",
			variant = attack_variant
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, attack_variant or "dot", false, weapon_id)

		local real_variant = weapon_id and tweak_data.blackmarket and tweak_data.blackmarket.melee_weapons and tweak_data.blackmarket.melee_weapons[weapon_id] and "melee" or attack_data.variant
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			weapon_unit = not weapon_id and attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = real_variant,
			name_id = weapon_id
		}

		if data.weapon_unit or data.name_id then
			managers.statistics:killed_by_anyone(data)
		end
	else
		local result_type = "dmg_rcv"

		if was_healed then
			result_type = "healed"

			attack_data.damage = self._health
		else
			self:_apply_damage_to_health(damage)
		end

		result = {
			variant = attack_variant,
			type = result_type
		}
	end

	attack_data.result = result
	attack_data.weapon_id = weapon_id
	attack_data.is_synced = true

	self:_on_damage_received(attack_data)
end

function CopDamage:damage_tase(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	
	if self:chk_immune_to_attacker(attack_data.attacker_unit) then
		return
	end	

	local attacker_unit = attack_data.attacker_unit
	local weap_unit = attack_data.weapon_unit

	if attacker_unit and alive(attacker_unit) and self:is_friendly_fire(attacker_unit) then
		return "friendly_fire"
	end

	local result = nil
	local damage = attack_data.damage

	damage = self:_apply_damage_reduction(damage)
	attack_data.raw_damage = damage

	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)

	if self._immortal then
		damage = math.min(damage, self._health - 1)
	end

	local tase_variant = nil

	if self._health <= damage then
		attack_data.damage = self._health
		attack_data.variant = "bullet"

		result = {
			variant = "bullet",
			type = "death"
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, "tase", false, attack_data.weapon_unit and attack_data.weapon_unit:base():get_name_id())
	else
		attack_data.damage = damage

		local result_type = "dmg_rcv"

		if self._char_tweak.damage.hurt_severity.tase == nil or self._char_tweak.damage.hurt_severity.tase then
			if attacker_unit == managers.player:player_unit() then
				if weap_unit then
					managers.hud:on_hit_confirmed()
				end
			end

			result_type = "taser_tased"

			if self._char_tweak.damage and self._char_tweak.damage.tased_response then
				if attack_data.variant == "heavy" and self._char_tweak.damage.tased_response.heavy then
					self._tased_time = self._char_tweak.damage.tased_response.heavy.tased_time
					self._tased_down_time = self._char_tweak.damage.tased_response.heavy.down_time
					tase_variant = "heavy"
				elseif self._char_tweak.damage.tased_response.light then
					self._tased_time = self._char_tweak.damage.tased_response.light.tased_time
					self._tased_down_time = self._char_tweak.damage.tased_response.light.down_time
					tase_variant = "light"
				else
					self._tased_time = 5
					self._tased_down_time = 10
				end
			end
		end

		attack_data.variant = "bullet"

		result = {
			type = result_type,
			variant = attack_data.variant
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position

	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = weap_unit,
			variant = "bullet"
		}

		managers.statistics:killed_by_anyone(data)

		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit)
			end

			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)

			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end

			self:_check_damage_achievements(attack_data, false)
		else
			if attacker_unit and alive(attacker_unit) and managers.groupai:state():is_unit_team_AI(attacker_unit) then
				self:_AI_comment_death(attacker_unit, self._unit)
			end
		end
	end

	local attacker = attacker_unit

	if not attacker or not alive(attacker) or attacker:id() == -1 then
		attack_data.attacker_unit = self._unit
	end

	local i_result = nil

	if result.type == "taser_tased" then
		if tase_variant == "heavy" then
			i_result = 1
		elseif tase_variant == "light" then
			i_result = 2
		else
			i_result = 3
		end
	else
		i_result = 0
	end

	self:_send_tase_attack_result(attack_data, damage_percent, i_result)
	self:_on_damage_received(attack_data)

	return result
end

function CopDamage:sync_damage_tase(attacker_unit, damage_percent, i_result, death)
	if self._dead then
		return
	end

	local attack_data = {
		attacker_unit = attacker_unit,
		variant = "bullet"
	}

	local hit_pos = mvector3.copy(self._unit:position())
	mvector3.set_z(hit_pos, hit_pos.z + 100)

	local attack_dir, result = nil

	if attacker_unit then
		local from_pos = nil

		if attacker_unit:movement() then
			if attacker_unit:movement().m_detect_pos then
				from_pos = attacker_unit:movement():m_detect_pos()
			elseif attacker_unit:movement().m_head_pos then
				from_pos = attacker_unit:movement():m_head_pos()
			else
				from_pos = attacker_unit:position()
			end
		else
			from_pos = attacker_unit:position()
		end

		attack_dir = hit_pos - from_pos
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end

	attack_data.attack_dir = attack_dir
	hit_pos = hit_pos - attack_dir * 5
	attack_data.pos = hit_pos

	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	attack_data.damage = damage

	if death then
		attack_data.damage = self._health

		result = {
			variant = "bullet",
			type = "death"
		}

		self:die(attack_data)
		self:chk_killshot(attacker_unit, "tase", false, attack_data.weapon_unit)

		local data = {
			variant = "bullet",
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
		}

		managers.statistics:killed_by_anyone(data)
	else
		local result_type = "dmg_rcv"

		if i_result == 1 then
			result_type = "taser_tased"
			self._tased_time = self._char_tweak.damage.tased_response.heavy.tased_time
			self._tased_down_time = self._char_tweak.damage.tased_response.heavy.down_time
		elseif i_result == 2 then
			result_type = "taser_tased"
			self._tased_time = self._char_tweak.damage.tased_response.light.tased_time
			self._tased_down_time = self._char_tweak.damage.tased_response.light.down_time
		elseif i_result == 3 then
			result_type = "taser_tased"
			self._tased_time = 5
			self._tased_down_time = 10
		end

		result = {
			type = result_type,
			variant = "bullet"
		}

		self:_apply_damage_to_health(damage)
	end

	attack_data.result = result
	attack_data.is_synced = true

	self:_on_damage_received(attack_data)
end

function CopDamage:_on_damage_received(damage_info)
	self:chk_health_sequences()
	self:_call_listeners(damage_info)
	CopDamage._notify_listeners("on_damage", damage_info)

	if damage_info.result.type == "death" then
		managers.enemy:on_enemy_died(self._unit, damage_info)
		self:chk_disable_aoe_damage()
	end
	
	if not self._dead then
		self:_chk_unique_death_requirements(damage_info, false)
	end	

	local attacker_unit = damage_info and damage_info.attacker_unit

	if alive(attacker_unit) then
		local attacker_base = attacker_unit:base()

		if attacker_base then
			if attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
				attacker_base = alive(attacker_unit) and attacker_unit:base()
			elseif attacker_unit:base().sentry_gun then
				attacker_unit = attacker_unit:base():get_owner()
				attacker_base = alive(attacker_unit) and attacker_unit:base()
			end
		end

		if attacker_base then
			if attacker_base.is_husk_player then
				self._player_damage_ratio = self._player_damage_ratio + ((damage_info.damage or 0) / self._HEALTH_INIT)
			elseif attacker_base.is_local_player then
				managers.player:on_damage_dealt(self._unit, damage_info)
				self._player_damage_ratio = self._player_damage_ratio + ((damage_info.damage or 0) / self._HEALTH_INIT)
			end
		end
	end

	--should prevent countering and shield knock from counting towards this
	if damage_info.variant == "melee" and type(damage_info.damage) == "number" and damage_info.damage > 0 then
		managers.statistics:register_melee_hit()
	end

	self:_update_debug_ws(damage_info) --debug watersports??????????

	if not self._dead and not self._unit:base():has_tag("special") and self._health > 0 then
		local t = TimerManager:game():time()
		if not self._next_allowed_hurt_t or self._next_allowed_hurt_t and self._next_allowed_hurt_t < t then
			if damage_info.damage and damage_info.damage > 0.01 and self._health > damage_info.damage then
				if not damage_info.result_type or damage_info.result_type ~= "healed" or damage_info.variant == "hurt_sick" and damage_info.result_type ~= "death" then
					if damage_info.is_fire_dot_damage or damage_info.variant == "fire" then
						if self._next_allowed_burnhurt_t and self._next_allowed_burnhurt_t < t or not self._next_allowed_burnhurt_t then
							self._unit:sound():say("burnhurt", nil, nil, nil, nil)
							self._next_allowed_burnhurt_t = t + 8
							self._next_allowed_hurt_t = t + math.random(1, 1.28)
						end
					else
						self._unit:sound():say("x01a_any_3p", nil, nil, nil, nil)
					end
				end
			end
		end
	end
	
	--[[if not self._dead and self._unit:base():has_tag("tank") and self._health > 0 then
	    self._unit:sound():play("fist_hit_gen", nil, nil)
	else	
	    self._unit:sound():play("fist_hit_body", nil, nil)
	end]]--
	
end

function CopDamage:damage_mission(attack_data)
	if self._dead then
		return
	elseif self._invulnerable or self._immortal then
		if not attack_data.forced then
			return
		end
	end

	if self.immortal and self.is_escort then
		if attack_data.backup_so then
			attack_data.backup_so:on_executed(self._unit)
		end

		return
	end

	if self._char_tweak.no_damage_mission then
		return
	end

	local result = nil
	local damage_percent = self._HEALTH_GRANULARITY
	attack_data.damage = self._health
	result = {
		type = "death",
		variant = attack_data.variant
	}

	self:die(attack_data)

	attack_data.result = result
	attack_data.attack_dir = -self._unit:rotation():y()
	attack_data.pos = self._unit:position()

	if attack_data.attacker_unit == managers.player:local_player() then
		if CopDamage.is_civilian(self._unit:base()._tweak_table) then
			managers.money:civilian_killed()
		elseif Network:is_server() and self._char_tweak.gas_on_death then
			managers.groupai:state():detonate_cs_grenade(self._unit:movement():m_pos() + math.UP * 10, mvector3.copy(self._unit:movement():m_head_pos()), 7.5)
		end
	end

	self:_send_explosion_attack_result(attack_data, self._unit, damage_percent, self:_get_attack_variant_index("explosion"), attack_data.col_ray and attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)

	return result
end

function CopDamage:_apply_min_health_limit(damage, damage_percent)
	local lower_health_percentage_limit = self._unit:base():char_tweak().LOWER_HEALTH_PERCENTAGE_LIMIT

	if lower_health_percentage_limit then
		local real_damage_percent = damage_percent / self._HEALTH_GRANULARITY
		local new_health_ratio = self._health_ratio - real_damage_percent

		if lower_health_percentage_limit > new_health_ratio then
			real_damage_percent = self._health_ratio - lower_health_percentage_limit
			damage_percent = real_damage_percent * self._HEALTH_GRANULARITY
			damage = damage_percent * self._HEALTH_INIT_PRECENT
		end
	end

	return damage, damage_percent
end

function CopDamage:build_suppression(amount, panic_chance)
	if self._dead or self._invulnerable or self._unit:in_slot(16) or not self._char_tweak.suppression then
		return
	end

	local t = TimerManager:game():time()
	local sup_tweak = self._char_tweak.suppression

	if panic_chance then
		if panic_chance == -1 or panic_chance > 0 and sup_tweak.panic_chance_mul > 0 and math.random() < panic_chance * sup_tweak.panic_chance_mul then
			amount = "panic"
		end
	end

	local amount_val = nil

	if amount == "max" or amount == "panic" then
		local value = sup_tweak.brown_point or sup_tweak.react_point

		amount_val = value[2]
	elseif Network:is_server() and self._suppression_hardness_t and t < self._suppression_hardness_t then
		amount_val = amount * 0.5
	else
		amount_val = amount
	end

	if not Network:is_server() then
		local sync_amount = nil

		if amount == "panic" then
			sync_amount = 16
		elseif amount == "max" then
			sync_amount = 15
		else
			local sync_amount_ratio = nil

			if sup_tweak.brown_point then
				if sup_tweak.brown_point[2] <= 0 then
					sync_amount_ratio = 1
				else
					sync_amount_ratio = amount_val / sup_tweak.brown_point[2]
				end
			elseif sup_tweak.react_point[2] <= 0 then
				sync_amount_ratio = 1
			else
				sync_amount_ratio = amount_val / sup_tweak.react_point[2]
			end

			sync_amount = math.clamp(math.ceil(sync_amount_ratio * 15), 1, 15)
		end

		managers.network:session():send_to_host("suppression", self._unit, sync_amount)

		return
	end

	if self._suppression_data then
		self._suppression_data.value = math.min(self._suppression_data.brown_point or self._suppression_data.react_point, self._suppression_data.value + amount_val)
		self._suppression_data.last_build_t = t
		self._suppression_data.decay_t = t + self._suppression_data.duration

		managers.enemy:reschedule_delayed_clbk(self._suppression_data.decay_clbk_id, self._suppression_data.decay_t)
	else
		local duration = math.lerp(sup_tweak.duration[1], sup_tweak.duration[2], math.random())
		local decay_t = t + duration
		self._suppression_data = {
			value = amount_val,
			last_build_t = t,
			decay_t = decay_t,
			duration = duration,
			react_point = sup_tweak.react_point and math.lerp(sup_tweak.react_point[1], sup_tweak.react_point[2], math.random()),
			brown_point = sup_tweak.brown_point and math.lerp(sup_tweak.brown_point[1], sup_tweak.brown_point[2], math.random()),
			decay_clbk_id = "CopDamage_suppression" .. tostring(self._unit:key())
		}

		managers.enemy:add_delayed_clbk(self._suppression_data.decay_clbk_id, callback(self, self, "clbk_suppression_decay"), decay_t)
	end

	if not self._suppression_data.brown_zone and self._suppression_data.brown_point and self._suppression_data.brown_point <= self._suppression_data.value then
		self._suppression_data.brown_zone = true

		local state = amount == "panic" and "panic" or true

		self._unit:brain():on_suppressed(state)
	elseif amount == "panic" then
		self._unit:brain():on_suppressed("panic")
	end

	if not self._suppression_data.react_zone and self._suppression_data.react_point and self._suppression_data.react_point <= self._suppression_data.value then
		self._suppression_data.react_zone = true

		local state = amount == "panic" and "panic" or true

		self._unit:movement():on_suppressed(state)
	elseif amount == "panic" then
		self._unit:movement():on_suppressed("panic")
	end
end

function CopDamage:_comment_death(attacker, killed_unit, special_comment)
	local victim_base = killed_unit:base()

	if special_comment then
		PlayerStandard.say_line(attacker:sound(), special_comment)
	elseif victim_base:has_tag("tank") then
		PlayerStandard.say_line(attacker:sound(), "g30x_any")
	elseif victim_base:has_tag("spooc") then
		PlayerStandard.say_line(attacker:sound(), "g33x_any")
	elseif victim_base:has_tag("taser") then
		PlayerStandard.say_line(attacker:sound(), "g32x_any")
	elseif victim_base:has_tag("shield") then
		PlayerStandard.say_line(attacker:sound(), "g31x_any")
	elseif victim_base:has_tag("sniper") then
		PlayerStandard.say_line(attacker:sound(), "g35x_any")
	elseif victim_base:has_tag("medic") or victim_base:has_tag("lpf") then
		PlayerStandard.say_line(attacker:sound(), "g36x_any")
	elseif victim_base:has_tag("custom") then
		local delay = TimerManager:game():time() + 1
		managers.enemy:add_delayed_clbk(clbk_id, callback(self, self, "_comment_custom_death", attacker), delay)
	end
end

function CopDamage:_comment_custom_death(attacker)
	if alive(attacker) then
		PlayerStandard.say_line(attacker:sound(), "g92")
	end
end

function CopDamage:_AI_comment_death(unit, killed_unit, special_comment)
	local victim_base = killed_unit:base()

	if special_comment then
		unit:sound():say(special_comment, true)
	elseif victim_base:has_tag("tank") then
		unit:sound():say("g30x_any", true)
	elseif victim_base:has_tag("spooc") then
		unit:sound():say("g33x_any", true)
	elseif victim_base:has_tag("taser") then
		unit:sound():say("g32x_any", true)
	elseif victim_base:has_tag("shield") then
		unit:sound():say("g31x_any", true)
	elseif victim_base:has_tag("sniper") then
		unit:sound():say("g35x_any", true)
	elseif victim_base:has_tag("medic") or victim_base:has_tag("lpf") then
		unit:sound():say("g36x_any", true)
	elseif victim_base:has_tag("custom") then
		local delay = TimerManager:game():time() + 1
		managers.enemy:add_delayed_clbk(clbk_id, callback(self, self, "_comment_ai_custom_death", unit), delay)		
	end
end

function CopDamage:_comment_ai_custom_death(unit)
	if alive(unit) then
		unit:sound():say("g92", true)
	end
end

function CopDamage:_on_death(variant)
	--Remove Ex-Pres
	managers.player:chk_wild_kill_counter(self._unit, variant)

	if self._char_tweak and self._char_tweak.do_autumn_blackout then --clear all equipment and re-enable them when autumn dies
		managers.enemy:end_autumn_blackout()
	end

	if self._unit:unit_data().is_convert and SC._converts then
		for i, unit in pairs(SC._converts) do
			if unit == self._unit then
				table.remove(SC._converts, i)
			end
		end
	end
end

function CopDamage.is_hrt(type)
	return type == "swat" or type == "fbi" or type == "cop" or type == "security"
end

function CopDamage:roll_critical_hit(attack_data, damage, damage_clamp)
	local damage = damage or attack_data.damage
	if not self:can_be_critical(attack_data) then
		return false, damage
	end
	
	local critical_hits = self._char_tweak.critical_hits or {}
	local critical_hit = false
	local critical_value = critical_hits.base_chance or 0
	local critical_hit_chance_multiplier = critical_hits.player_chance_multiplier or 1
	critical_value = critical_value + managers.player:critical_hit_chance() * critical_hit_chance_multiplier

	if attack_data.backstab then
		critical_value = critical_value + managers.player:upgrade_value("player", "backstab_crits", 0)
	end

	if critical_value > 0 then
		local critical_roll = math.rand(1)
		critical_hit = critical_roll < critical_value
	end

	if critical_hit then
		local critical_damage_mul = critical_hits.damage_mul or self._char_tweak.headshot_dmg_mul

		if critical_damage_mul then
			damage = damage * critical_damage_mul
		else
			damage = self._health * 10
		end
	end

	if damage_clamp then
		damage = math.min(damage, damage_clamp)
	end
	
	return critical_hit, damage
end

function CopDamage:check_backstab(attack_data)
	if self._unit.movement and self._unit:movement().m_rot then
		local fwd_vec = mvector3.dot(self._unit:movement():m_rot():y(), managers.player:player_unit():movement():m_head_rot():y())

		--# degrees of leeway == (1-(2*number fwd_vec > than))pi radians
		if fwd_vec > 0.15 then
			return true
		end
	end

	return false
end

function CopDamage:bag_explode()	
	local pos = self._unit:get_object(Idstring("Spine2")):position()

	local range = 400
	local damage = 800
	local ply_damage = damage * 0.5
	local normal = math.UP
	local slot_mask = managers.slot:get_mask("explosion_targets")
	local curve_pow = 4
	
	--Kill this dude if he isn't already
	self._unit:character_damage():damage_mission({damage = 9999999})

	--BOOM
	local damage_params = {
		no_raycast_check_characters = false,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = curve_pow,
		damage = damage,
		player_damage = ply_damage,
		ignore_unit = self._unit,
		user = nil
	}
	local effect_params = {
		sound_event = "grenade_explode",
		effect = "effects/payday2/particles/explosions/grenade_explosion",
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		feedback_range = range * 2
	}

	managers.explosion:give_local_player_dmg(pos, range, ply_damage)
	managers.explosion:play_sound_and_effects(pos, normal, range, effect_params)
	managers.explosion:detect_and_give_dmg(damage_params)
	managers.network:session():send_to_peers_synched("sync_explosion_to_client", nil, pos, normal, ply_damage, range, curve_pow)	

	--Spawn some fire afterwards too
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = {
		damage = 6,
		player_damage = 3,
		fire_dot_data = {
			dot_damage = 1,
			dot_trigger_max_distance = 3000,
			dot_trigger_chance = 50,
			dot_length = 3.1,
			dot_tick_period = 0.5
		},
		range = 75,
		burn_duration = 12,
		burn_tick_period = 0.5,
		curve_pow = 3,
		sound_event = "white_explosion",
		sound_event_burning = "burn_loop_gen",
		sound_event_impact_duration = 4,
		alert_radius = 15000,
		fire_alert_radius = 15000,
		effect_name = "effects/payday2/particles/explosions/grenade_incendiary_explosion_sc"
	}

	EnvironmentFire.spawn(position, rotation, data, math.UP, nil, 0, 1)			
end

function CopDamage:taser_bag_explode()    
	local pos = self._unit:get_object(Idstring("Spine2")):position()

	local range = 750
	local damage = 300
	local ply_damage = 0
	local normal = math.UP
	local slot_mask = managers.slot:get_mask("explosion_targets")
	local curve_pow = 4
	local custom_params = {
		camera_shake_max_mul = 4,
		effect = "effects/particles/explosions/electric_grenade",
		sound_event = "grenade_electric_explode",
		feedback_range = range * 2
	}
		
	managers.explosion:play_sound_and_effects(pos, normal, range, custom_params)

	--Taser BOOM
	local hit_units, splinters = managers.explosion:detect_and_tase({
		player_damage = ply_damage,
		tase_strength = "heavy",
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = 4,
		damage = 3,
		ignore_unit = self._unit,
		alert_radius = 1
	})
	
	managers.network:session():send_to_peers_synched("sync_explosion_to_client", nil, pos, normal, ply_damage, range, curve_pow)		
end

function CopDamage:grenadier_bag_explode()    
	local pos = self._unit:get_object(Idstring("Spine2")):position()

	local range = 750
	local damage = 0
	local ply_damage = 0
	local normal = math.UP
	local slot_mask = managers.slot:get_mask("explosion_targets")
	local curve_pow = 4
	local custom_params = {
		camera_shake_max_mul = 4,
		effect = "effects/payday2/particles/explosions/grenade_explosion",
		sound_event = "grenade_explode",
		feedback_range = range * 2
	}
	local tweak_entry = {
		damage = 0,
		player_damage = 0,
		curve_pow = 0,
		range = 0,
		name_id = "bm_poison_gas_grenade",
		poison_gas_range = 600,
		poison_gas_duration = 12,
		poison_gas_fade_time = 0.1,
		poison_gas_tick_time = 0.3,
		poison_gas_dot_data = {
			hurt_animation_chance = 1,
			dot_damage = 1.5,
			dot_length = 10.15,
			dot_tick_period = 0.5
		}
	}
	
	--Do a shit ton of damage to this dude
	self._unit:character_damage():damage_mission({damage = 40})
	
	managers.explosion:play_sound_and_effects(pos, normal, range, custom_params)

	--Gas explosion
	managers.player:spawn_poison_gas(pos, normal, tweak_entry, nil)
	
	managers.network:session():send_to_peers_synched("sync_explosion_to_client", nil, pos, normal, ply_damage, range, curve_pow)		
end

function CopDamage:_apply_damage_reduction(damage)
	local damage_reduction = self._unit:movement():team().damage_reduction or 0

	if damage_reduction > 0 then
		damage = damage * (1 - damage_reduction)
	end

	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	end
	
	if managers.mutators:is_mutator_active(MutatorCG22) then
		local cg22_mutator = managers.mutators:get_mutator(MutatorCG22)

		if cg22_mutator:can_enemy_be_affected_by_buff("blue", self._unit) then
			damage = damage * cg22_mutator:get_enemy_blue_multiplier()
		end
	end

	return damage
end

function CopDamage:can_attach_projectiles()
	return not self._char_tweak.cannot_attach_projectiles
end