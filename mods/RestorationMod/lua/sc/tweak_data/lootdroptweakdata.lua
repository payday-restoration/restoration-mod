local old_init = old_init or LootDropTweakData.init
 
function LootDropTweakData:init(tweak_data)
    old_init(self, tweak_data)
if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then
    for i = 10, 100, 10 do
        self.WEIGHTED_TYPE_CHANCE[i].weapon_mods = self.WEIGHTED_TYPE_CHANCE[i].weapon_mods + self.WEIGHTED_TYPE_CHANCE[i].cash + self.WEIGHTED_TYPE_CHANCE[i].xp
        self.WEIGHTED_TYPE_CHANCE[i].cash = 0
        self.WEIGHTED_TYPE_CHANCE[i].xp = 0
    end
    self.global_values.gage_pack_assault.value_multiplier = 0
    self.global_values.gage_pack_snp.value_multiplier = 0
end
    self.global_values.sc = {}
    self.global_values.sc.name_id = "loot_sc"
    self.global_values.sc.desc_id = "loot_sc_desc"
    self.global_values.sc.color = Color('FF69B4')
    self.global_values.sc.dlc = false
    self.global_values.sc.chance = 0.84
    self.global_values.sc.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "normal")
    self.global_values.sc.durability_multiplier = 1
    self.global_values.sc.drops = false
    self.global_values.sc.track = false
    self.global_values.sc.sort_number = 30
    self.global_values.sc.category = "sc"
end