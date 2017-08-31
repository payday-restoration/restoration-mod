if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

old_DLCTweakData_init = DLCTweakData.init
function DLCTweakData:init(...)
	old_DLCTweakData_init(self, ...)
	self.sc = {}
	self.sc.free = true
	self.sc.content = {}
	self.sc.content.loot_global_value = "sc"
	self.sc.content.loot_drops = {
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ammo_half_that",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ammo_mag_msr",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ammo_46custom",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_vg_ass_smg_verticalgrip",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_vg_ass_smg_stubby",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_vg_ass_smg_afg",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_m4_m_drum",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_upg_ak_m_drum",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_mp5_m_drum",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ammo_762_sterling",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_bonus_sc_none",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_upg_saiga_m_20rnd",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ammo_p",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_ammo_40sw",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_smg_p90_body_p90_tan",
			amount = 3
		},
		{
			type_items = "weapon_mods",
			item_entry = "wpn_fps_upg_extra_mp_unlock",
			amount = 3
		}
	}
end

end