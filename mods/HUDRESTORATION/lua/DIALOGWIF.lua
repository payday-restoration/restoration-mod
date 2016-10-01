local DialogQueue_old = DialogQueue_old or DialogManager.queue_dialog
function DialogManager:queue_dialog(id, params)
local map = managers.job:current_level_id()
    if map == "war_is_fantastic" then
        if id == "pln_fs1_01" then
                return
        elseif id == "pln_fs1_14" then
                return
        elseif id == "pln_fs1_13" then
                return
        elseif id == "pln_fs1_12" then
                return
        elseif id == "pln_fs1_09" then
                return
        end
    end
		
	if map == "turf_war1" then
		if id == "pln_fost_cs_01" then
			return
		elseif id == "pln_fost_cam_01" then
			return
		elseif id == "pln_fost_cam_02" then
			return
		elseif id == "pln_fost_cam_03" then
			return
	end
	
	if map == "turf_war1" then
		if id == "pln_fost_sfe_01" then
			id = "Play_pln_ukranian_stage1_47" end
		if id == "pln_fost_sfe_02" then
			id = "Play_pln_ukranian_stage1_47" end
		end
	end
	
	--[[if map == "greenharvest_stage1" then
		if id == "Play_pln_polin_01" then
			id = "Play_pln_branchbank_stage1_82" end
	end]]--
			
	
        DialogQueue_old(self, id, params)



end
local index = "indices/types/" .. tostring(file_type)
local file = DB:has("index", index) and DB:open("index", index) or nil
if file == nil then
return {}
else
local data = file:read()
file:close()
return string.split(data, "[\r\n]")
end
