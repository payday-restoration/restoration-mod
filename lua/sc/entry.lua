local Net = _G.LuaNetworking

--Place grenade case
Hooks:Add("NetworkReceivedData", "PlaceGrenadeCrate", function(sender, id, data)
	if id == "PlaceGrenadeCrate" then

		--Put the data into an array
		local DataArray = {}
		for i in string.gmatch(data, "[^|]+") do
			table.insert(DataArray, i)
		end

		if Network:is_server() then
			if BaseNetworkHandler._verify_gamestate(BaseNetworkHandler._gamestate_filter.any_ingame) then
				if #DataArray == 3 then
					--Retrieve the values from string
					--Pos
					local TempDataArray = {}
					for i in string.gmatch(DataArray[1], "[^(,)]+") do
						table.insert(TempDataArray, tonumber(i))
					end
					local pos = Vector3(TempDataArray[1],TempDataArray[2],TempDataArray[3])

					--Rot
					local TempDataArray = {}
					for i in string.gmatch(DataArray[2], "[^(,)]+") do
						table.insert(TempDataArray, tonumber(i))
					end
					local rot = Rotation(TempDataArray[1],TempDataArray[2],TempDataArray[3])
					--Lvl
					local amount_upgrade_lvl = tonumber(DataArray[3])
					--Spawn Grenade Crate
					local unit = GrenadeCrateBase.spawn(pos, rot, amount_upgrade_lvl, managers.network:session():local_peer():id())

				end
			end
		end

	end
end)

--Hooks:Call("NetworkReceivedData",1,"environments_all",LuaNetworking:TableToString(restoration.Environment_Settings_Table))

--Sync Environment
Hooks:Add("NetworkReceivedData", "SyncEnv", function(sender, id, data)
	if id == "environments_all" then
		local env_data = data and (data ~= "") and LuaNetworking:StringToTable(data)
		if env_data then
			if sender == 1 then
				log("**********************************************************Received EnvironmentSync with results: ")
				Utils.PrintTable(env_data)
				log("**********************************************************End. HEY SOMEONE WHO ISN'T ME REMEMBER TO CALL THE THINGY THAT SWAPS OUT THE ENVIRONMENTS FROM HERE, entry.lua")

				for key,setting in pairs(env_data) do
					if restoration.Environment_Settings_Table[key] ~= nil then
						restoration.Environment_Settings_Table[key] = setting
					end
				end
			end
		end
	end
end)

tweak_data.upgrades.values.player.body_armor.armor[9] = 25
tweak_data.upgrades.values.player.body_armor.movement[9] = 0.5875
tweak_data.upgrades.values.player.body_armor.dodge[9] = -0.5
tweak_data.upgrades.values.player.body_armor.concealment[9] = -2
tweak_data.upgrades.values.player.body_armor.damage_shake[9] = 0.1
tweak_data.upgrades.values.player.body_armor.stamina[9] = 0.4
tweak_data.upgrades.values.player.body_armor.skill_ammo_mul[9] = 1.125
tweak_data.upgrades.values.player.body_armor.regen_delay[9] = 5.5
tweak_data.upgrades.values.player.body_armor.deflection[9] = 0.10
tweak_data.upgrades.values.player.body_armor.skill_max_health_store[9] = 4.0
tweak_data.upgrades.values.player.body_armor.skill_health_store_on_kill[9] = 0.0
tweak_data.upgrades.values.player.body_armor.skill_kill_change_regenerate_speed[9] = 1.01
tweak_data.upgrades.values.player.armor_grinding[1][9] = {5.8, 7.25}
tweak_data.upgrades.values.player.damage_to_armor[1][9] = {11.2, 5}

if GGWEPNENAME then
	local mod_ids = Idstring("Weapon Rename"):key()
	local bool1 = "F_"..Idstring("bool1::"..mod_ids):key()
	--Some fixes to the base mod
	function GGWEPNENAME:GetNewNameFromWeaponMods(data)
		data[bool1] = false
		local try_name = nil
		local G_BMC = Global.blackmarket_manager.crafted_items
		if type(G_BMC) == "table" and type(data) == "table" then
			--[[                                     V there was a small typo here that prevented this from working with secondaries]]
			if (data.category == "primaries" or data.category == "secondaries") and type(G_BMC[data.category]) == "table" and type(G_BMC[data.category][data.slot]) == "table" then
				local W_data = G_BMC[data.category][data.slot]
				if type(W_data.blueprint) == "table" then
					for _, func in pairs(GGWEPNENAME.Configs) do
						try_name = func(data, tostring(W_data.factory_id), W_data.blueprint, W_data)
						break
					end
					for i, part_id in pairs(W_data.blueprint) do
						if tweak_data.weapon.factory.parts[part_id] and tweak_data.weapon.factory.parts[part_id].weapon_rename_overwrite then
							try_name = managers.localization:text(tweak_data.weapon.factory.parts[part_id].weapon_rename_overwrite)
						end
					end
				end
			end
		end
		if tostring(data.name_localized) ~= tostring(try_name) then
			data[bool1] = true
			data.name_localized = managers.blackmarket:get_crafted_custom_name(data.category, data.slot, true) or try_name
		end
		return data
	end

	local weapon_names = restoration.Options:GetValue("OTHER/WepNames") or 1
	GGWEPNENAME:Add("GGWEPNENAME_Resmod", function(data, factory_id, blueprint, W_data)
		if weapon_names == 4 then
			return data.name_localized
		end
		if factory_id == "qwerty_nonsense" then
		--Just here so I can organize it without having to mess with the start of this big fuck-off if-else statement
		--Also unsure if there's a way to not YandereDev this given I'm dealing with actual string IDs and not odd/even values

		--[[     PISTOLS     ]]--
			elseif factory_id == "wpn_fps_pis_shrew" then
				if table.contains(blueprint, "wpn_fps_pis_shrew_body_light") then
					return managers.localization:text("bm_w_shrew_joshua")
				end

			elseif factory_id == "wpn_fps_pis_c96" then
				if table.contains(blueprint, "wpn_fps_pis_c96_nozzle") then
					return managers.localization:text("bm_w_c96_dl44")
				end
				if table.contains(blueprint, "wpn_fps_pis_c96_cnuy_satsuki") then
					return managers.localization:text("bm_w_c96_satsuki")
				end

			elseif factory_id == "wpn_fps_pis_2006m" then
				if table.contains(blueprint, "wpn_fps_upg_i_iw_hailstorm") then
					return managers.localization:text("bm_w_hailstorm_2006m")
				end

			elseif factory_id == "wpn_fps_pis_rsh12" then
				if table.contains(blueprint, "wpn_fps_upg_i_iw_hailstorm") then
					return managers.localization:text("bm_w_hailstorm_rsh12")
				end

		--[[     SMGs     ]]--
			elseif factory_id == "wpn_fps_smg_mp5" then
				if table.contains(blueprint, "wpn_fps_smg_mp5_fg_m5k") then
					if table.contains(blueprint, "wpn_fps_smg_mp5_s_ring") then
						return managers.localization:text("bm_w_mp5k")
					elseif table.contains(blueprint, "wpn_fps_smg_mp5_s_folding") then
						return managers.localization:text("bm_w_mp5k_pdw")
					end
				elseif table.contains(blueprint, "wpn_fps_smg_mp5_fg_mp5sd") then
					return managers.localization:text("bm_w_mp5sd")
				end

			elseif factory_id == "wpn_fps_smg_shepheard" then
				if table.contains(blueprint, "wpn_fps_smg_shepheard_cnuy_yuuka") then
					return managers.localization:text("bm_w_mpx_yuuka")
				end
			elseif factory_id == "wpn_fps_smg_x_shepheard" then
				if table.contains(blueprint, "wpn_fps_smg_shepheard_cnuy_yuuka") then
					return managers.localization:text("bm_w_x_mpx_yuuka")
				end


			elseif factory_id == "wpn_fps_smg_sterling" then
				if table.contains(blueprint, "wpn_fps_smg_sterling_b_e11") then
					return managers.localization:text("bm_w_sterling_e11")
				elseif table.contains(blueprint, "wpn_fps_smg_sterling_b_suppressed") then
					return managers.localization:text("bm_w_sterling_sd")
				elseif table.contains(blueprint, "wpn_fps_smg_sterling_b_short") and
				table.contains(blueprint, "wpn_fps_smg_sterling_s_nostock") then
					return managers.localization:text("bm_w_sterling_pistol")
				end

			--[[     CUSTOM SMGs     ]]--
				elseif factory_id == "wpn_fps_smg_m7caseless" then
					if table.contains(blueprint, "wpn_fps_smg_m7caseless_suppressor") then
						return managers.localization:text("bm_w_m7caseless_supp")
					end
				elseif factory_id == "wpn_fps_smg_x_m7caseless" then
					if table.contains(blueprint, "wpn_fps_smg_m7caseless_suppressor") then
						return managers.localization:text("bm_w_x_m7caseless_supp")
					end

		--[[     MGs     ]]--
			elseif factory_id == "wpn_fps_lmg_mg42" then
				if table.contains(blueprint, "wpn_fps_lmg_mg42_b_vg38") then
					return managers.localization:text("bm_w_mg42_dlt19")
				end
				if table.contains(blueprint, "wpn_fps_lmg_mg42_hina_cnuy") then
					return managers.localization:text("bm_w_mg42_hinature")
				end

			elseif factory_id == "wpn_fps_ass_tecci" then
				if table.contains(blueprint, "wpn_fps_ass_tecci_cnuy_ibuki") then
					return managers.localization:text("bm_w_tecci_ibuki")
				end

		--[[     SHOTGUNS     ]]--
			elseif factory_id == "wpn_fps_ass_amcar" then
				if table.contains(blueprint, "wpn_fps_upg_i_patriot") then
					return managers.localization:text("bm_wp_upg_i_patriot")
				end

		--[[     ARs     ]]--
			elseif factory_id == "wpn_fps_sho_ben" then
				if table.contains(blueprint, "wpn_fps_sho_ben_cnuy_hoshino") then
					return managers.localization:text("bm_w_ben_hoshino")
				end

			elseif factory_id == "wpn_fps_ass_m4" then
				if table.contains(blueprint, "wpn_fps_m4_uupg_fg_lr300") and
				table.contains(blueprint, "wpn_fps_m4_uupg_s_fold") then
					return managers.localization:text("bm_w_m4_lr300")
				elseif table.contains(blueprint, "wpn_fps_m4_upg_fg_mk12") then
					return managers.localization:text("bm_w_m4_mk12")
				end
				if table.contains(blueprint, "wpn_fps_ass_m4_azusa_cnuy") then
					return managers.localization:text("bm_w_m4_azusa")
				elseif table.contains(blueprint, "wpn_fps_ass_m4_cnuy_saori") then
					return managers.localization:text("bm_w_m4_saori")
				end
			elseif factory_id == "wpn_fps_ass_ak5" then
				if table.contains(blueprint, "wpn_fps_ass_ak5_fg_ak5c") and
				table.contains(blueprint, "wpn_fps_ass_ak5_s_ak5c") then
					return managers.localization:text("bm_w_ak5c")
				elseif table.contains(blueprint, "wpn_fps_ass_ak5_fg_ak5a") and
				table.contains(blueprint, "wpn_fps_ass_ak5_s_ak5b") then
					return managers.localization:text("bm_w_ak5b")
				--elseif table.contains(blueprint, "wpn_fps_ass_ak5_fg_fnc") then
					--return managers.localization:text("bm_w_ak5_fnc")
				end

			elseif factory_id == "wpn_fps_ass_g36" then
				if table.contains(blueprint, "wpn_fps_upg_g36_fg_long") then
					if table.contains(blueprint, "wpn_fps_ass_g36_o_vintage") then
						return managers.localization:text("bm_w_g36_long")
					else
						return managers.localization:text("bm_w_g36_v")
					end
				elseif table.contains(blueprint, "wpn_fps_ass_g36_fg_c") then
					return managers.localization:text("bm_w_g36_c")
				else
					if table.contains(blueprint, "wpn_fps_ass_g36_o_vintage") then
						return managers.localization:text("bm_w_g36_k")
					end
				end

			elseif factory_id == "wpn_fps_ass_aug" then
				if table.contains(blueprint, "wpn_fps_aug_body_f90") then
					return managers.localization:text("bm_w_aug_f90")
				else
					if table.contains(blueprint, "wpn_fps_aug_fg_a3") then
						return managers.localization:text("bm_w_aug_a3")
					end
				end

			elseif factory_id == "wpn_fps_ass_m16" then
				if table.contains(blueprint, "wpn_fps_m16_fg_vietnam") then
					return managers.localization:text("bm_w_m16a1")
				end

			elseif factory_id == "wpn_fps_ass_ar23" then
				if table.contains(blueprint, "wpn_fps_ass_ar23_ck_concussive") then
					return managers.localization:text("bm_w_ar23_concussive")
				elseif table.contains(blueprint, "wpn_fps_ass_ar23_ck_penetrator") then
					return managers.localization:text("bm_w_ar23_penetrator")
				elseif table.contains(blueprint, "wpn_fps_ass_ar23_ck_carbine") then
					return managers.localization:text("bm_w_ar23_carbine")
				end

		--[[     BRs     ]]--
			elseif factory_id == "wpn_fps_ass_scar" then
				if table.contains(blueprint, "wpn_fps_ass_scar_body_light") then
					return managers.localization:text("bm_w_scar_l")
				elseif table.contains(blueprint, "wpn_fps_ass_scar_body_hamr") then
					return managers.localization:text("bm_w_scar_hamr")
				end

			elseif factory_id == "wpn_fps_ass_contraband" then
				if table.contains(blueprint, "wpn_fps_ass_contraband_body_sayhello") then
					return managers.localization:text("bm_w_contraband_m16")
				elseif table.contains(blueprint, "wpn_fps_ass_contraband_body_mpx") then
					return managers.localization:text("bm_w_contraband_mpx")
				end

			elseif factory_id == "wpn_fps_ass_g3" then
				if table.contains(blueprint, "wpn_fps_upg_i_g3sg1") then
					if table.contains(blueprint, "wpn_fps_ass_g3_fg_psg") then
						if table.contains(blueprint, "wpn_fps_ass_g3_g_sniper") and
						table.contains(blueprint, "wpn_fps_ass_g3_m_psg") and
						table.contains(blueprint, "wpn_fps_ass_g3_s_sniper") then
							return managers.localization:text("bm_w_g3_psg")
						else
							return managers.localization:text("bm_w_g3_msg")
						end
					else
						return managers.localization:text("bm_w_g3_sg1")
					end
				elseif table.contains(blueprint, "wpn_fps_ass_g3_body_hk33") then
					if table.contains(blueprint, "wpn_fps_ass_g3_fg_retro") and
					table.contains(blueprint, "wpn_fps_ass_g3_s_wood") then
						return managers.localization:text("bm_w_g3_hk33_fo3")
					else
						return managers.localization:text("bm_w_g3_hk33")
					end
				end

			elseif factory_id == "wpn_fps_ass_fal" then
				if table.contains(blueprint, "wpn_fps_ass_fal_s_wood") then
					if table.contains(blueprint, "wpn_fps_ass_fal_fg_wood") and
					table.contains(blueprint, "wpn_fps_upg_i_singlefire") then
						return managers.localization:text("bm_w_fal_l1a1")
					elseif table.contains(blueprint, "wpn_fps_ass_fal_fg_03") then
						return managers.localization:text("bm_w_fal_idf")
					end
				elseif table.contains(blueprint, "wpn_fps_ass_fal_s_01") then
					if table.contains(blueprint, "wpn_fps_ass_fal_fg_01") then
						return managers.localization:text("bm_w_fal_sa58")
					end
				end

			elseif factory_id == "wpn_fps_ass_galil" then
				if table.contains(blueprint, "wpn_fps_ass_galil_body_intermediate") then
					if table.contains(blueprint, "wpn_fps_ass_galil_fg_mar") then
						return managers.localization:text("bm_w_galil_mar_556")
					else
						return managers.localization:text("bm_w_galil_556")
					end
				else
					if table.contains(blueprint, "wpn_fps_ass_galil_fg_sniper") and
					table.contains(blueprint, "wpn_fps_ass_galil_g_sniper") and
					(table.contains(blueprint, "wpn_fps_ass_galil_s_sniper") or table.contains(blueprint, "wpn_fps_ass_galil_s_light")) then
						return managers.localization:text("bm_w_galil_galatz")
					elseif table.contains(blueprint, "wpn_fps_ass_galil_fg_mar") then
						return managers.localization:text("bm_w_galil_mar")
					end
				end

		--[[     SNIPERS     ]]--
			elseif factory_id == "wpn_fps_snp_awp" then
				if table.contains(blueprint, "wpn_fps_snp_awp_conversion_dragonlore") then
					return managers.localization:text("bm_awp_cs_dragon")
				elseif table.contains(blueprint, "wpn_fps_snp_awp_conversion_dragonloreless") then
					return managers.localization:text("bm_awp_cs")
				end
			elseif factory_id == "wpn_fps_snp_m200" then
				if table.contains(blueprint, "wpn_fps_upg_i_iw_widowmaker") then
					return managers.localization:text("bm_w_m200_iw")
				end

		--[[     SPECIAL     ]]--
			elseif factory_id == "wpn_fps_bow_frankish" then
				if table.contains(blueprint, "avelyn") then
					return managers.localization:text("bm_w_frankish_avelyn")
				end

		end
		return data.name_localized
	end)
end

--This stuff needs to load late as to override the hooks from their respective mods
if SKSWeaponBase then
	function SKSWeaponBase:clbk_assembly_complete(...)
		SKSWeaponBase.super.clbk_assembly_complete(self, ...)
		if table.contains(self._blueprint, "wpn_fps_upg_sks_mag_detach10") or table.contains(self._blueprint, "wpn_fps_upg_sks_mag_detach20") then
			self:weapon_tweak_data().animations.reload_name_id = "sks_mag"
		else
			self:weapon_tweak_data().animations.reload_name_id = "sks"
		end
	end
end

if OWLFBullpupWeaponBase then
	function OWLFBullpupWeaponBase:clbk_assembly_complete(...)
		OWLFBullpupWeaponBase.super.clbk_assembly_complete(self, ...)
		if table.contains(self._blueprint, "wpn_fps_upg_owlfbullpup_mag_drum") then
			self:weapon_tweak_data().animations.reload_name_id = "owlfbullpup_drum"
		else
			self:weapon_tweak_data().animations.reload_name_id = "owlfbullpup"
		--[[
			self:weapon_tweak_data().timers.reload_empty = 4.8
			self:weapon_tweak_data().timers.reload_not_empty = 3.0
		--]]
		end
	end
end

if StalkerGaussWeaponBase then
	function StalkerGaussWeaponBase:fire(...)
		local ray_res = NewRaycastWeaponBase.super.fire(self, ...)
		if self._icws_extensions then
			--local ammo_max = self:get_ammo_max_per_clip()
			local ammo_current = self:get_ammo_remaining_in_clip()
			local fire_rate = self:weapon_fire_rate()
			
			for k,icws in pairs(self._icws_extensions) do 
				icws:animate_charge_meter(ammo_current,fire_rate)
			end
		end
		return ray_res
	end
end

if TF2SniperWeaponBase then
	function TF2SniperWeaponBase:get_sniper_charge_state()
		local can_headshot = false
		local dmg_mul = 1
		
		if self._sniper_charge_t then
			local t = self._unit:timer():time()
			local elapsed = t + -self._sniper_charge_t + -self._SNIPER_CHARGE_MIN
			
			if elapsed > 0 then
				can_headshot = true
				
				local lerp = math.clamp(elapsed / (self._SNIPER_CHARGE_MAX - self._SNIPER_CHARGE_MIN),0,1) --fix missing cap on charge
				
				dmg_mul = dmg_mul + lerp * self._SNIPER_CHARGE_DAMAGE_MUL
			end
		end
		
		return can_headshot,dmg_mul
	end

	function TF2SniperWeaponBase:fire(...)
		self._bullets_fired = 0 -- prevent normal fire sound
		
		local ray_res = TF2SniperWeaponBase.super.fire(self, ...)

		-- reset charge after firing
		self._sniper_charge_t = nil
		
		if self._fire_mode == ids_burst and self._bullets_fired > 1 and not self:weapon_tweak_data().sounds.fire_single then
			self:_fire_sound()
		end

		--cut the bit that's responsible for the descope on fire as res handles it elsewhere

		return ray_res
	end
end

--ABYSMAL DOGSHIT \o/ fix to keep both PocoHUD and the Mercenary Perk Deck happy
--PocoHUD explicitly needs the output data from the vanilla "_calc_x_damage" functions it hooks into to draw its directional damage indicators
--But PocoHUD localizes all its inner workings so intercepting its hooks into "_calc_x_damage" isn't going to work
--The Mercenary Perk Deck loads late and overrides Resmod's version of the "_calc_x_damage" funcs, breaking things; I am not shoving a good chunk of PlayerDamage in here just to get around that
--My initial fix was to just skirt around it with resmod-specific "_calc_x_damage" funcs but that broke PocoHUD's directional damage indicators
--That said the Mercenary Perk Deck doesn't load so late as to override the GOAT that is 'entry.lua' (This file)
--So you get this atrocity :^)
if PlayerDamage then 
	function PlayerDamage:_calc_armor_damage(attack_data, ...)
		return self:_res_calc_armor_damage(attack_data, ...)
	end
	function PlayerDamage:_calc_health_damage(attack_data, ...)
		return self:_res_calc_health_damage(attack_data, ...)
	end
end
