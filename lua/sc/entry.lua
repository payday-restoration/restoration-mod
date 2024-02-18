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
				PrintTable(env_data)
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

		--[[     ARs     ]]--
			elseif factory_id == "wpn_fps_ass_amcar" then
				if table.contains(blueprint, "wpn_fps_upg_i_patriot") then
					return managers.localization:text("bm_wp_upg_i_patriot")
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

		--[[     BRs     ]]--
			elseif factory_id == "wpn_fps_ass_scar" then
				if table.contains(blueprint, "wpn_fps_ass_scar_body_light") then
					return managers.localization:text("bm_w_scar_l")
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