ModifierFriendlyFire = ModifierFriendlyFire or class(BaseModifier)
ModifierFriendlyFire._type = "ModifierFriendlyFire"
ModifierFriendlyFire.name_id = "none"
ModifierFriendlyFire.desc_id = "menu_cs_modifier_friendlyfire"

function ModifierFriendlyFire:modify_value(id, value)
	if id == "HuskPlayerDamage:FriendlyFireDamageCSEnabled" then
		return true
	elseif id == "PlayerDamage:FriendlyFire" then
		return false
	elseif id == "HuskPlayerDamage:FriendlyFireDamageCS" then
		local dmg_mult = 1 --replace with scaling multiplier or whatever

		return value * dmg_mult
	elseif id == "ProjectileBase:create_sweep_data:slot_mask" or id == "PlayerStandard:init:melee_slot_mask" or id == "RaycastWeaponBase:setup:weapon_slot_mask" then
		return value + 3
	end

	return value
end
