MutatorFriendlyFire.reductions = {money = 0, exp = 0}
MutatorFriendlyFire.disables_achievements = false

function MutatorFriendlyFire:setup(mutator_manager)
	MutatorFriendlyFire.super.setup(mutator_manager)

	--this results in anything that uses this slotmask to hit player husks, which is NOT good
	--managers.slot._masks.bullet_impact_targets = managers.slot._masks.bullet_impact_targets_ff
end

function MutatorFriendlyFire:modify_value(id, value)
	if id == "PlayerDamage:FriendlyFire" then
		return false
	elseif id == "HuskPlayerDamage:FriendlyFireDamage" then
		return value * self:get_friendly_fire_damage_multiplier()
	elseif id == "ProjectileBase:create_sweep_data:slot_mask" or id == "PlayerStandard:init:melee_slot_mask" or id == "RaycastWeaponBase:setup:weapon_slot_mask" then
		return value + 3
	end
end

--No Damage grace--

--Why--
MutatorFatRoll = MutatorFatRoll or class(BaseMutator)
MutatorFatRoll._type = "MutatorFatRoll"
MutatorFatRoll.name_id = "mutator_fatroll"
MutatorFatRoll.desc_id = "mutator_fatroll_desc"
MutatorFatRoll.reductions = {
	money = 0,
	exp = 0
}
MutatorFatRoll.disables_achievements = false
MutatorFatRoll.categories = {"gameplay"}
MutatorFatRoll.icon_coords = {
	5,
	1
}

function MutatorFatRoll:setup(data)
	tweak_data.player.damage.MIN_DAMAGE_INTERVAL = 0
	tweak_data.character.presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0
end
