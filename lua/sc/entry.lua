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