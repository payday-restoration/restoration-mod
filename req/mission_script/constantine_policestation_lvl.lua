local Winters = "units/pd2_dlc_vip/characters/ene_vip_1/ene_vip_1"
local ene_phalanx_1 = "units/pd2_dlc_vip/characters/ene_phalanx_1/ene_phalanx_1"

local Captain = {
	values = {
		enemy = Winters
    }
}

local Minion = {
	values = {
        enemy = ene_phalanx_1
    }
}

return {
--Captain Winters boss fight
    [100091] = Captain,
    [100061] = Minion,
    [100075] = Minion,
    [100079] = Minion,
    [100083] = Minion,
    [100095] = Minion,
    [100087] = Minion
}
