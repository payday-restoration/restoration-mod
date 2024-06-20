local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")

Month = os.date("%m")
local job = Global.level_data and Global.level_data.level_id

-- Reserved tables for Summers DR effect
local summers_dr_effect_table_host = nil
local summers_dr_effect_table_client = nil

-- LPF effect positions
local effect_usual = Vector3(0,0,0)
local effect_no_gear = Vector3(0,0,-3)
local effect_high = Vector3(1,8,-3)
local effect_low = Vector3(0,-3,0)
local effect_tank = Vector3(1,13,-5)
local effect_tank_titan = Vector3(1,11,-3)
-- Tables below need for LPF effect handling
local units_no_gear = { 
	"cop",
	"fbi",
	"hrt",
	"swat",
	-- for LPF mutator
	"hrt_titan",
	"fbi_vet",
	"security",
	"gensec_guard",
	"city_swat_guard"		
}

local omnia_tswat = { -- OMNIA T SWAT need higher effect position
	Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle"),
	Idstring("units/pd2_dlc_vip/characters/ene_titan_rifle/ene_titan_rifle_husk"),
	Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun"),
	Idstring("units/pd2_dlc_vip/characters/ene_titan_shotgun/ene_titan_shotgun_husk"),
	Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault"),
	Idstring("units/pd2_dlc_vip/characters/ene_phalanx_1_assault/ene_phalanx_1_assault_husk")	
}

local units_low = { -- Zeal heavies and grenadier need lower effect position
	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_grenadier_1/ene_grenadier_1_husk"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1"),
	Idstring("units/pd2_mod_halloween/characters/ene_grenadier_1/ene_grenadier_1_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc_husk")
}

local hrt_exclude_list = { -- for HRT enemies where usual effect position will be better
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4_husk"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
	Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4_husk"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"),
	Idstring("units/pd2_mod_halloween/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5_husk")
}

local murky_no_gear = { -- Majority of murky units looks better with "no_gear" effect position
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_1/ene_fbi_swat_1_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
	Idstring("units/pd2_mod_sharks/characters/ene_fbi_swat_2/ene_fbi_swat_2_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_city_swat_2/ene_city_swat_2_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_1/ene_zeal_city_1_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_2/ene_zeal_city_2_husk"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3"),
	Idstring("units/pd2_mod_sharks/characters/ene_zeal_city_3/ene_zeal_city_3_husk")
}

--Reset Summers effect stuff
function CopBase:reset_summers_dr_effect()
	summers_dr_effect_table_host = {"red","", "orange","","yellow"} -- CopDamage:die executing twice on host for some reason so this is temp solution
	summers_dr_effect_table_client = {"red", "orange","yellow"} 
	
	self._summers_dr_effect = World:effect_manager():spawn({
			effect = Idstring("effects/particles/character/glowing_eyes_"..summers_dr_effect_table_host[1].."_summers"),
			parent = self._unit:get_object(Idstring("Head"))
	})
end
--When player/bot kill Doc/Molly/Elektra -> find Summers and update his effect
function CopBase:find_summers(is_client)					
	local enemies = World:find_units_quick(self._unit, "sphere", self._unit:position(), 160000000, managers.slot:get_mask("enemies"))
	if enemies then
		for _, enemy in ipairs(enemies) do
			if enemy:base()._tweak_table == "summers" then
				enemy:base():update_summers_dr_effect(false, is_client)
			end
		end
	end
end
--Update Summers DR effect if someone from captain's crew is dead (or when Summers killed when he still has alive crew members)
function CopBase:update_summers_dr_effect(summers_death, is_client)
	if self._unit:base()._tweak_table == "summers" and summers_death then
		World:effect_manager():fade_kill(self._summers_dr_effect)
	else
		if self._summers_dr_effect then
			World:effect_manager():fade_kill(self._summers_dr_effect)
			local summers_dr_effect = nil
			if is_client then
				table.remove(summers_dr_effect_table_client, 1)
				summers_dr_effect = summers_dr_effect_table_client[1]
			else
				table.remove(summers_dr_effect_table_host, 1)
				summers_dr_effect = summers_dr_effect_table_host[1]
			end
			
			if summers_dr_effect ~= nil then
				self._summers_dr_effect = World:effect_manager():spawn({
					effect = Idstring("effects/particles/character/glowing_eyes_"..summers_dr_effect.."_summers"),
					parent = self._unit:get_object(Idstring("Head"))
				})
			end
		end
	end
end

function CopBase:converted_enemy_effect(state)
	if state then
		self._convert_effect = World:effect_manager():spawn({
			effect = Idstring("effects/particles/character/moneyburn"),
			parent = self._unit:get_object(Idstring("Spine2"))
		})
	else
		if self._convert_effect then
			World:effect_manager():fade_kill(self._convert_effect)
		end
	end
end

function CopBase:enable_lpf_buff(state)
	if self._overheal_unit then
		return
	end
	
	local align_obj_name = Idstring("Head")
	local align_obj = self._unit:get_object(align_obj_name)
	
	local effect_id = Idstring("effects/pd2_mod_omnia/particles/character/overkillpack/mega_alien_eyes")
	local effect_pos = effect_usual
 	
	local unit = self._unit:base()._tweak_table
	local unit_name = self._unit:name()

	if table.contains(units_no_gear, unit) and not table.contains(hrt_exclude_list, unit_name) then
		effect_pos = effect_no_gear
	end
	
	if table.contains(murky_no_gear, unit_name) then
		effect_pos = effect_no_gear
	end
	
	if table.contains(omnia_tswat, unit_name) then
		effect_pos = effect_high
	end
	
	if table.contains(units_low, unit_name) then
		effect_pos = effect_low
	end
	
	local faction = tweak_data.levels:get_ai_group_type()
	
	if unit == "taser_titan" and faction ~= "zombie" then
		effect_pos = effect_high
	end
		
	if string.match(unit, "tank") then
		effect_pos = effect_tank
		if unit == "tank_titan" then
			effect_pos = effect_tank_titan
		end
	end

	self._overheal_unit = World:effect_manager():spawn({
		effect = effect_id,
		parent = align_obj,
		position = effect_pos
	})
end

function CopBase:disable_lpf_buff(state)
	if self._overheal_unit then
		World:effect_manager():fade_kill(self._overheal_unit)
	end
end

function CopBase:lpf_heal_effect(overheal)
	local body_obj = Idstring("Spine2")
	local attach_to_body = self._unit:get_object(body_obj)
	if not attach_to_body then
		return
	end
	
	if overheal then
		World:effect_manager():spawn({
			effect = Idstring("effects/pd2_mod_omnia/particles/character/shadow_cloaker/smoke_trail/smoke_distorted_purple"),
			parent = attach_to_body
		})
	else
		World:effect_manager():spawn({
			effect = Idstring("effects/pd2_mod_omnia/particles/character/shadow_cloaker/smoke_trail/smoke_distorted_green"),
			parent = attach_to_body
		})
	end
end

function CopBase:enable_asu_laser(state)
	local weapon = self._unit:inventory():equipped_unit()
	if weapon then
		weapon:base():set_asu_laser_enabled(state)
	end
end

function CopBase:disable_asu_laser(state)
	local weapon = self._unit:inventory():equipped_unit()
	if weapon then
		weapon:base():set_asu_laser_enabled(false)
	end
end

Hooks:PostHook(CopBase, "post_init", "postinithooksex", function(self)
	self:random_mat_seq_initialization()

	if self._tweak_table == "spooc" then
		self._unit:damage():run_sequence_simple("turn_on_spook_lights")
	elseif self._tweak_table == "phalanx_vip" or self._tweak_table == "spring" or self._tweak_table == "summers" or self._tweak_table == "headless_hatman" or self._tweak_table == "autumn" then
		GroupAIStateBesiege:set_assault_endless(true)
		managers.hud:set_buff_enabled("vip", true)
		
		--managers.groupai:state():set_fake_assault_mode(true)
		--managers.groupai:state():set_wave_mode(besiege)
		--managers.groupai:state():set_assault_mode(true)			
		
		if managers.skirmish:is_skirmish() then
			managers.skirmish:set_captain_active()
		end
		
	end
	
	--Just in case Summers decides to spawn again, his DR is back
	if self._tweak_table == "summers" then
		managers.groupai:state():_reset_summers_dr()
		self._unit:base():reset_summers_dr_effect()
	end		

	self._unit:character_damage():add_listener("asu_laser_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_asu_laser"))	
	
	self._unit:character_damage():add_listener("lpf_buff_state" .. tostring(self._unit:key()), {
		"death"
	}, callback(self, self, "disable_lpf_buff"))	

	--Yufu Wang Hitbox fix
	if self._tweak_table == "triad_boss" then
		self._unit:body("head"--[[self._unit:character_damage()._head_body_name--]]):set_sphere_radius(16)
		self._unit:body("body"):set_sphere_radius(22)	

		self._unit:body("rag_LeftArm"):set_enabled(true)
		self._unit:body("rag_LeftForeArm"):set_enabled(true)

		self._unit:body("rag_RightArm"):set_enabled(true)
		self._unit:body("rag_RightForeArm"):set_enabled(true)

		self._unit:body("rag_LeftArm"):set_sphere_radius(11)
		self._unit:body("rag_LeftForeArm"):set_sphere_radius(7)
		self._unit:body("rag_RightArm"):set_sphere_radius(11)
		self._unit:body("rag_RightForeArm"):set_sphere_radius(7)

		self._unit:body("rag_LeftUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_LeftLeg"):set_sphere_radius(7)
		self._unit:body("rag_RightUpLeg"):set_sphere_radius(10)
		self._unit:body("rag_RightLeg"):set_sphere_radius(7)
	end
	
	if not self._char_tweak.big_head_mode and not self._unit:base():has_tag("tank") then
		local head = self._unit:character_damage()._head_body_name and self._unit:body(self._unit:character_damage()._head_body_name)
		if head then
			head:set_sphere_radius(16)
		end
	end	
	
	--Faction appropriate colors for Cloaker NVGs
	local faction = tweak_data.levels:get_ai_group_type()
    local lights = self._unit:get_objects_by_type(Idstring("light"))
	if faction == "russia" then
		if self._tweak_table == "spooc" or self._tweak_table == "spooc_titan" then
			for k, v in pairs(lights) do
				v:set_color(Color(hsv_to_rgb(200, 1, 1)))
			end
		end
	end
	
	if faction == "federales" then
		if self._tweak_table == "spooc_titan" then
			for k, v in pairs(lights) do
				v:set_color(Color(hsv_to_rgb(200, 1, 1)))
			end
		end
	end	
	
end)

local enemy_variations = {
	["units/payday2/characters/ene_swat_1_sc/ene_swat_1_sc"] = "swat_smg",
	["units/payday2/characters/ene_swat_2_sc/ene_swat_2_sc"] = "swat_sg",
	["units/payday2/characters/ene_swat_3/ene_swat_3"] = "swat_ar",
	["units/payday2/characters/ene_swat_heavy_1_sc/ene_swat_heavy_1_sc"] = "heavy_swat_ar",
	["units/payday2/characters/ene_swat_heavy_r870_sc/ene_swat_heavy_r870_sc"] = "heavy_swat_sg",
	["units/payday2/characters/ene_shield_2_sc/ene_shield_2_sc"] = "swat_shield",
	["units/payday2/characters/ene_sniper_1_sc/ene_sniper_1_sc"] = "swat_sniper",
	
	["units/payday2/characters/ene_fbi_swat_1_sc/ene_fbi_swat_1_sc"] = "swat_ar",
	["units/payday2/characters/ene_fbi_swat_2_sc/ene_fbi_swat_2_sc"] = "swat_sg",
	["units/payday2/characters/ene_fbi_swat_3/ene_fbi_swat_3"] = "swat_smg",	
	["units/payday2/characters/ene_fbi_heavy_1_sc/ene_fbi_heavy_1_sc"] = "heavy_swat_ar",
	["units/payday2/characters/ene_fbi_heavy_r870_sc/ene_fbi_heavy_r870_sc"] = "heavy_swat_sg",
	["units/payday2/characters/ene_shield_1_sc/ene_shield_1_sc"] = "swat_shield",
	["units/payday2/characters/ene_sniper_2_sc/ene_sniper_2_sc"] = "swat_sniper",
	
	["units/payday2/characters/ene_city_swat_1_sc/ene_city_swat_1_sc"] = "swat_ar",
	["units/payday2/characters/ene_city_swat_2_sc/ene_city_swat_2_sc"] = "swat_sg",
	["units/payday2/characters/ene_city_swat_3_sc/ene_city_swat_3_sc"] = "swat_smg",	
	["units/payday2/characters/ene_city_heavy_g36_sc/ene_city_heavy_g36_sc"] = "heavy_swat_ar",
	["units/payday2/characters/ene_city_heavy_r870_sc/ene_city_heavy_r870_sc"] = "heavy_swat_sg",
	["units/payday2/characters/ene_shield_gensec/ene_shield_gensec"] = "swat_shield",
	["units/payday2/characters/ene_sniper_3/ene_sniper_3"] = "swat_sniper",
	
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_1/ene_zeal_city_1"] = "swat_ar",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_2/ene_zeal_city_2"] = "swat_sg",
	["units/pd2_dlc_gitgud/characters/ene_zeal_city_3/ene_zeal_city_3"] = "swat_smg",	
	["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_sc/ene_zeal_swat_heavy_sc"] = "heavy_swat_ar",
	["units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy_r870_sc/ene_zeal_swat_heavy_r870_sc"] = "heavy_swat_sg",
	["units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield_sc/ene_zeal_swat_shield_sc"] = "swat_shield",
	["units/pd2_dlc_gitgud/characters/ene_zeal_sniper/ene_zeal_sniper"] = "swat_sniper",
	["units/pd2_dlc_gitgud/characters/ene_zeal_fbi_m4/ene_zeal_fbi_m4"] = "swat_ar",	
	["units/pd2_dlc_gitgud/characters/ene_zeal_fbi_mp5/ene_zeal_fbi_mp5"] = "swat_sg",
	

	["units/payday2/characters/ene_cop_1/ene_cop_1"] = "cop_pistol",
	["units/payday2/characters/ene_cop_2/ene_cop_2"] = "cop_revolver",
	["units/payday2/characters/ene_cop_1_forest/ene_cop_1_forest"] = "cop_pistol",
	["units/payday2/characters/ene_cop_2_forest/ene_cop_2_forest"] = "cop_revolver",
	["units/payday2/characters/ene_cop_3/ene_cop_3"] = "cop_smg",
	["units/payday2/characters/ene_cop_4/ene_cop_4"] = "cop_sg",
	
	["units/pd2_dlc_rvd/characters/ene_la_cop_1/ene_la_cop_1"] = "cop_pistol",
	["units/pd2_dlc_rvd/characters/ene_la_cop_2/ene_la_cop_2"] = "cop_revolver",
	["units/pd2_dlc_rvd/characters/ene_la_cop_3/ene_la_cop_3"] = "cop_smg",
	["units/pd2_dlc_rvd/characters/ene_la_cop_4/ene_la_cop_4"] = "cop_la_sg",	
	
	["units/payday2/characters/ene_fbi_1/ene_fbi_1"] = "fbi_1",
	["units/payday2/characters/ene_fbi_2/ene_fbi_2"] = "fbi_2",
	["units/payday2/characters/ene_fbi_3/ene_fbi_3"] = "fbi_3",
	
	["units/payday2/characters/ene_murkywater_1/ene_murkywater_1"] = "mrkwater_ump",
	["units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"] = "mrkwater_ump_nolight",
	["units/payday2/characters/ene_murkywater_2/ene_murkywater_2"] = "mrkwater_scar",
	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"] = "fbi_ump",
	["units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"] = "fbi_scar",
	
	["units/payday2/characters/ene_security_1/ene_security_1"] = "sec_pistol",
	["units/payday2/characters/ene_security_2/ene_security_2"] = "sec_smg",
	["units/payday2/characters/ene_security_3/ene_security_3"] = "sec_sg",
	["units/payday2/characters/ene_security_4/ene_security_4"] = "sec_4",
	["units/payday2/characters/ene_security_5/ene_security_5"] = "sec_5",
	["units/payday2/characters/ene_security_6/ene_security_6"] = "sec_6",
	["units/payday2/characters/ene_security_7/ene_security_7"] = "sec_7",
	
	["units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2"] = "sec_pistol",
	["units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2"] = "sec_pistol",	
	["units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1"] = "sec_smg",
	["units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"] = "sec_smg",
	["units/pd2_dlc1/characters/ene_security_gensec_3/ene_security_gensec_3"] = "sec_sg"
}

-- do not touch this.
local enemy_mapping = {}
for name, sequence in pairs(enemy_variations) do
	enemy_mapping[Idstring(name):key()] = sequence
	enemy_mapping[Idstring(name .. "_husk"):key()] = sequence
end

local function random_mat_seq_initialization(cop)
	local sequence = enemy_mapping[cop._unit:name():key()]
    local lvl_tweak_data = tweak_data.levels[job]
    local flashlights_on = lvl_tweak_data and lvl_tweak_data.flashlights_on

	if cop._unit:damage() and cop._unit:damage():has_sequence(sequence) then
		cop._unit:damage():run_sequence_simple(sequence)
	end
end

--Deleting dozer hats cause it blows people up, pls gib standalone that's always loaded
function CopBase:_chk_spawn_gear()
	local region = tweak_data.levels:get_ai_group_type()
	local difficulty_index = tweak_data:difficulty_to_index(Global and Global.game_settings and Global.game_settings.difficulty or "overkill")

	--Using this only so we can slap this on custom heists
	if restoration and restoration.Options:GetValue("OTHER/Holiday") then
		for _,x in pairs(restoration.christmas_heists) do
			if job == x or Month == "12" then
				if self:char_tweak().is_special and not self._char_tweak.no_xmas_hat then
					self._headwear_unit = safe_spawn_unit("units/payday2/characters/ene_acc_spook_santa_hat_sc/ene_acc_spook_santa_hat_sc", Vector3(), Rotation())					
				end

				if self._headwear_unit then
					local align_obj_name = Idstring("Head")
					local align_obj = self._unit:get_object(align_obj_name)

					self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
				end
			end
		end
	end
end

--Random Weapons For Enemies
local weapons_map = {
	--Secret Service Bois--
	[Idstring("units/payday2/characters/ene_secret_service_1/ene_secret_service_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_secret_service_2/ene_secret_service_2"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_vit/characters/ene_murkywater_secret_service/ene_murkywater_secret_service"):key()] = {"m1911_npc", "mp5", "m4"},

	--Biker Weapon Changes--
	[Idstring("units/payday2/characters/ene_biker_1/ene_biker_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_2/ene_biker_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_3/ene_biker_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_biker_4/ene_biker_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/payday2/characters/ene_guard_biker_1/ene_guard_biker_1"):key()] = {"c45", "m4", "r870"},
	
	--Female Bikers
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_1/ene_biker_female_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_2/ene_biker_female_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_born/characters/ene_biker_female_3/ene_biker_female_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	--Mendoza Weapon Changes
	[Idstring("units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	--Cobras Weapon Changes
	["man"] = {
		[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = "c45",
		[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = "raging_bull",
		[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = "c45",
		[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = "raging_bull",
	},
	[Idstring("units/payday2/characters/ene_gang_black_1/ene_gang_black_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_2/ene_gang_black_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_3/ene_gang_black_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_black_4/ene_gang_black_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	
	[Idstring("units/payday2/characters/ene_gang_black_enforcer/ene_gang_black_enforcer"):key()] = {"ak47", "r870"},

	--Russian Gangster Weapon Changes
	[Idstring("units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},

	-- colombians
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_1/ene_gang_colombian_1"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_2/ene_gang_colombian_2"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_3/ene_gang_colombian_3"):key()] = {"m1911_npc", "ak47", "r870", "raging_bull"},
	
	[Idstring("units/pd2_dlc_flat/characters/ene_gang_colombian_enforcer/ene_gang_colombian_enforcer"):key()] = {"ak47", "r870"},
	
	--Bolivian Weapons
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_01/ene_bolivian_thug_outdoor_01"):key()] = {"c45", "mac11", "mossberg", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_bolivian_thug_outdoor_02/ene_bolivian_thug_outdoor_02"):key()] = {"c45", "mac11", "mossberg", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_security_manager/ene_security_manager"):key()] = {"raging_bull", "mac11", "ak47"},
	
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_01/ene_thug_indoor_01"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_02/ene_thug_indoor_02"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_03/ene_thug_indoor_03"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_friend/characters/ene_thug_indoor_04/ene_thug_indoor_04"):key()] = {"c45", "mac11", "mp5", "r870", "ak47", "raging_bull"},
	
	--Border Crossing Guards
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_security_guard_3/ene_mex_security_guard_3"):key()] = {"c45", "mac11", "mossberg", "ak47", "raging_bull"},
	[Idstring("units/pd2_dlc_mex/characters/ene_mex_thug_outdoor_02/ene_mex_thug_outdoor_02"):key()] = {"m1911_npc", "mac11", "mossberg", "ak47", "raging_bull"},
	
	--Triads (Because why the fuck they carry only pistols)
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_1/ene_male_triad_gang_1"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_2/ene_male_triad_gang_2"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_3/ene_male_triad_gang_3"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_4/ene_male_triad_gang_4"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	[Idstring("units/pd2_dlc_chas/characters/ene_male_triad_gang_5/ene_male_triad_gang_5"):key()] = {"deagle_guard", "ak47", "mossberg", "c45"},
	
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_1/ene_triad_cruise_1"):key()] = {"m1911_npc", "mac11", "ak47"},
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_2/ene_triad_cruise_2"):key()] = {"m1911_npc", "mac11", "ak47"},
	[Idstring("units/pd2_dlc_chca/characters/ene_triad_cruise_3/ene_triad_cruise_3"):key()] = {"m1911_npc", "mac11", "ak47"},
	
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_1/ene_male_security_penthouse_1"):key()] = {"m1911_npc", "ak47", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_security_penthouse_2/ene_male_security_penthouse_2"):key()] = {"m1911_npc", "ak47", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_1/ene_male_triad_penthouse_1"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_2/ene_male_triad_penthouse_2"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_3/ene_male_triad_penthouse_3"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	[Idstring("units/pd2_dlc_pent/characters/ene_male_triad_penthouse_4/ene_male_triad_penthouse_4"):key()] = {"m1911_npc", "mac11", "ak47", "raging_bull", "r870"},
	
	--Midland Ranch Guards
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_1/ene_male_ranc_security_1"):key()] = {"c45", "raging_bull", "mac11", "m4", "r870"},
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranc_security_2/ene_male_ranc_security_2"):key()] = {"c45", "raging_bull", "mac11", "m4", "r870"},
	
	[Idstring("units/pd2_dlc_ranc/characters/ene_male_ranchmanager_1/ene_male_ranchmanager_1"):key()] = {"c45", "raging_bull", "mac11"},

	--Security Guards
	["trai"] = {
		[Idstring("units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5", "m4"},
		[Idstring("units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5", "m4"},
		[Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1"):key()] = {"deagle_guard", "ump", "g36"},
		[Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2"):key()] = {"deagle_guard", "ump", "g36"},
		[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = {"m1911_npc", "mp5", "g36"},
		[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = {"m1911_npc", "mp5", "g36"},
	},
	[Idstring("units/payday2/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5"},
	[Idstring("units/payday2/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5"},
	[Idstring("units/payday2/characters/ene_security_3/ene_security_3"):key()] = "r870",
	[Idstring("units/payday2/characters/ene_security_4/ene_security_4"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_5/ene_security_5"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_6/ene_security_6"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/payday2/characters/ene_security_7/ene_security_7"):key()] = "r870",
	[Idstring("units/payday2/characters/ene_security_8/ene_security_8"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/pd2_mod_bravo/characters/ene_bravo_guard_1/ene_bravo_guard_1"):key()] = {"bravo_rifle", "deagle_guard"},
	[Idstring("units/pd2_mod_bravo/characters/ene_bravo_guard_2/ene_bravo_guard_2"):key()] = {"bravo_shotgun", "deagle_guard"},
	[Idstring("units/pd2_mod_bravo/characters/ene_bravo_guard_3/ene_bravo_guard_3"):key()] = {"bravo_lmg", "deagle_guard"},
	
	["shoutout_raid"] = {
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"):key()] = "scar_npc",
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"):key()] = "benelli",
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"):key()] = "lmg_titan",
	},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_1/ene_murky_elite_guard_1"):key()] = {"scar_npc", "deagle_guard"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_2/ene_murky_elite_guard_2"):key()] = {"benelli", "deagle_guard"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_elite_guard_3/ene_murky_elite_guard_3"):key()] = {"lmg_titan", "deagle_guard"},
	
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_guard_1/ene_security_gensec_guard_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc1/characters/ene_security_gensec_guard_2/ene_security_gensec_guard_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/payday2/characters/ene_city_guard_1/ene_city_guard_1"):key()] = {"deagle_guard", "ump"},
	[Idstring("units/payday2/characters/ene_city_guard_2/ene_city_guard_2"):key()] = {"deagle_guard", "ump"},
	
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_1/ene_security_cruise_1"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_2/ene_security_cruise_2"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/pd2_dlc_chca/characters/ene_security_cruise_3/ene_security_cruise_3"):key()] = {"m1911_npc", "mp5", "m4"},
	
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_c45/ene_murky_security_c45"):key()] = {"c45", "mp5", "m4"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_mp5/ene_murky_security_mp5"):key()] = {"c45", "mp5", "m4"},
	[Idstring("units/pd2_mod_sharks/characters/ene_murky_security_raging_bull/ene_murky_security_raging_bull"):key()] = {"raging_bull", "mp5", "m4"},
	
	[Idstring("units/pd2_mod_reapers/characters/ene_security_1/ene_security_1"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	[Idstring("units/pd2_mod_reapers/characters/ene_security_2/ene_security_2"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	[Idstring("units/pd2_mod_reapers/characters/ene_security_4/ene_security_4"):key()] = {"streak", "raging_bull", "akmsu_smg", "ak47_ass"},
	
	[Idstring("units/pd2_dlc_casino/characters/ene_secret_service_1_casino/ene_secret_service_1_casino"):key()] = {"m1911_npc", "mp5", "m4"},
	
	["vit"] = {
		[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1"):key()] = {"scar_murky", "ump", "m4"},
		[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"):key()] = {"scar_murky", "ump", "m4"},
	},
	[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_1/ene_nypd_murky_1"):key()] = {"m1911_npc", "ump", "m4"},
	[Idstring("units/pd2_mod_nypd/characters/ene_nypd_murky_2/ene_nypd_murky_2"):key()] = {"m1911_npc", "ump", "m4"},
	
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_01/ene_bex_security_01"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_02/ene_bex_security_02"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_03/ene_bex_security_03"):key()] = {"m500"},
	
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_01/ene_bex_security_suit_01"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_02/ene_bex_security_suit_02"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_bex/characters/ene_bex_security_suit_03/ene_bex_security_suit_03"):key()] = {"m500"},
	
	[Idstring("units/pd2_mod_nypd/characters/ene_security_1/ene_security_1"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_2/ene_security_2"):key()] = {"c45", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_3/ene_security_3"):key()] = "r870",
	
	[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_1/ene_security_gensec_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_nypd/characters/ene_security_gensec_2/ene_security_gensec_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_1/ene_guard_security_heavy_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_dlc_arena/characters/ene_guard_security_heavy_2/ene_guard_security_heavy_2"):key()] = {"m1911_npc", "mp5"},
	
	[Idstring("units/payday2/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1"):key()] = {"m1911_npc", "mp5", "m4"},
	[Idstring("units/payday2/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"):key()] = {"m1911_npc", "mp5", "m4"},
	
	[Idstring("units/payday2/characters/ene_hoxton_breakout_responder_1/ene_hoxton_breakout_responder_1"):key()] = {"ump", "r870", "m416_npc"},
	[Idstring("units/payday2/characters/ene_hoxton_breakout_responder_2/ene_hoxton_breakout_responder_2"):key()] = {"ump", "r870", "m416_npc"},
	
	[Idstring("units/pd2_dlc_deep/characters/ene_deep_security_1/ene_deep_security_1"):key()] = {"m1911_npc", "deagle_guard", "mp5", "m4"},
	[Idstring("units/pd2_dlc_deep/characters/ene_deep_security_2/ene_deep_security_2"):key()] = {"m1911_npc", "deagle_guard", "mp5", "m4"},
	[Idstring("units/pd2_dlc_deep/characters/ene_deep_security_3/ene_deep_security_3"):key()] = "r870",
	
	[Idstring("units/pd2_mod_friday/characters/ene_security_fri_1/ene_security_fri_1"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_friday/characters/ene_security_fri_2/ene_security_fri_2"):key()] = {"m1911_npc", "mp5"},
	[Idstring("units/pd2_mod_friday/characters/ene_security_fri_3/ene_security_fri_3"):key()] = {"m1911_npc", "mp5"},
	
	--Vanilla Murkies with variety weapons
	[Idstring("units/payday2/characters/ene_murkywater_1/ene_murkywater_1"):key()] = {"ump", "r870", "scar_murky"},
	[Idstring("units/payday2/characters/ene_murkywater_2/ene_murkywater_2"):key()] = {"ump", "r870", "scar_murky"},
	[Idstring("units/pd2_dlc_berry/characters/ene_murkywater_no_light/ene_murkywater_no_light"):key()] = {"r870", "ump", "scar_murky"},
	
	--Commissar gets his precious RPK back from Russia
	[Idstring("units/payday2/characters/ene_gang_mobster_boss/ene_gang_mobster_boss"):key()] = "rpk_lmg",
	
	--FSB gets proper Russian Weapons
	--Security bois
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_1/ene_rus_security_1"):key()] = {"streak", "akmsu_smg"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_2/ene_rus_security_2"):key()] = {"streak", "akmsu_smg"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_security_3/ene_rus_security_3"):key()] = {"fort_500"}, --keeping the tradition of shotgun guards :)
	--Beat Cops
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_1/ene_rus_cop_1"):key()] = {"streak"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_2/ene_rus_cop_2"):key()] = {"raging_bull"}, --keeping the tradition of bronco cops :)
	--why there are 2 cop shotgunners?
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_3_r870/ene_rus_cop_3_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_r870/ene_rus_cop_4_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_cop_4_m4/ene_rus_cop_4_m4"):key()] = {"akmsu_smg"},
	--FSB
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_m4/ene_rus_fsb_m4"):key()] = {"ak47_ass"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_r870/ene_rus_fsb_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsb_heavy_m4/ene_rus_fsb_heavy_m4"):key()] = {"ak47_ass"},
	--FSB City but they are not City
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_g36/ene_rus_fsbcity_g36"):key()] = {"ak47_ass"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_r870/ene_rus_fsbcity_r870"):key()] = {"fort_500"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_fsbcity_heavy_g36/ene_rus_fsbcity_heavy_g36"):key()] = {"ak47_ass"},
	--FSB Shields
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_c45/ene_rus_shield_c45"):key()] = {"streak"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2/ene_rus_shield_sr2"):key()] = {"sr2_smg"},
	[Idstring("units/pd2_dlc_mad/characters/ene_rus_shield_sr2_city/ene_rus_shield_sr2_city"):key()] = {"sr2_smg"},

	--Giving Friendly AI silenced pistols
	[Idstring("units/pd2_dlc_spa/characters/npc_spa/npc_spa"):key()] = "beretta92",
	[Idstring("units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2"):key()] = "beretta92",
	[Idstring("units/pd2_dlc_berry/characters/npc_locke/npc_locke"):key()] = "beretta92",
}

local default_weapon_name_orig = CopBase.default_weapon_name
function CopBase:default_weapon_name(...)
	local job = Global.level_data and Global.level_data.level_id or ""
	local faction = tweak_data.levels:get_ai_group_type()
	local difficulty = tweak_data:difficulty_to_index(Global.game_settings and Global.game_settings.difficulty or "normal")
	local weapon_override = weapons_map[job] and weapons_map[job][self._unit:name():key()] or weapons_map[self._unit:name():key()]
	
	--For Jungle Inferno Mutator
	if not self._weapon_set and restoration and restoration.disco_inferno and not self._char_tweak.no_mutator_weapon_override then
		self._default_weapon_id = "flamethrower"
		self._weapon_set = true		
	end
	
	--Have White Titandozers use Grenade Launchers like their Reaper counterparts in Russia/Mexico heists (mostly for Holiday Effects and consistency with factions)
	if self._tweak_table == "tank_hw" and faction == "russia" or self._tweak_table == "tank_hw" and faction == "federales" then
		self._default_weapon_id = "m32_large"
		self._weapon_set = true
	end
	
	if not self._weapon_set and weapon_override then
		self._default_weapon_id = type(weapon_override) == "table" and table.random(weapon_override) or weapon_override
		self._weapon_set = true
	end

	return default_weapon_name_orig(self, ...)
end