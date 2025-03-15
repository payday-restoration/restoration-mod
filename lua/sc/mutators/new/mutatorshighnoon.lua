--No modern guns allowed! Also enables Marshals to spawn at all times. This town ain't big enough for all of us
MutatorHighNoon = MutatorHighNoon or class(BaseMutator)
MutatorHighNoon._type = "MutatorHighNoon"
MutatorHighNoon.name_id = "mutator_high_noon"
MutatorHighNoon.desc_id = "mutator_high_noon_desc"
MutatorHighNoon.reductions = {
	money = 0,
	exp = 0
}
MutatorHighNoon.disables_achievements = false
MutatorHighNoon.categories = {"old_event", "enemies"}
MutatorHighNoon.icon_coords = {
	5,
	5
}	
MutatorHighNoon.incompatibility_tags = {
	"replaces_gamemode"
}

function MutatorHighNoon:modify_value(id, value)
	if id == "HUDAssaultCorner:NewCaptainIcon" then
		local autumn = "guis/textures/pd2/hud_buff_spooc"
	
		return autumn
	end
	return value
end

function MutatorHighNoon:setup(data)

	if restoration then
		restoration.high_noon = true		
	end
	
	--Enemy changes	
	tweak_data.character.autumn.no_xmas_hat = false
	tweak_data.character.autumn.HEALTH_INIT = 120
	tweak_data.character.autumn.can_cloak = false
	tweak_data.character.autumn.can_deploy_tear_gas = false
	tweak_data.character.autumn.chance_use_gas = 0
	tweak_data.character.autumn.can_throw_frag = true	
	tweak_data.character.autumn.grenade_cooldown = 12
	tweak_data.character.autumn.grenade_toss_chance = 1	
	--To do: Make dynamite
	tweak_data.character.autumn.grenade_type = "cluster_fuck"

	local rootin_tootin = {
		"breech",
		"new_raging_bull",
		"chinchilla",
		"model3",
		"peacemaker",
		"coach",
		"m1911",
		"x_breech",
		"x_rage",
		"x_m1911",
		"x_chinchilla",
		"x_model3",
		"m1897",
		"boot",
		"huntsman",
		"b682",
		"winchester1874",
		"mosin",
		"bessy",
		"plainsrider",
		"frankish",
		"long",
		"arblast"
	}	
	for i, wep_id in ipairs(rootin_tootin) do
		tweak_data.weapon[wep_id].yeehaw = true
	end
	
	for id, weap in pairs(tweak_data.weapon) do
		if weap.categories and weap.stats and not weap.yeehaw then
			if weap.AMMO_MAX then
				weap.AMMO_MAX = 0
				weap.name_id = "bm_not_cowboy_sc"
				weap.desc_id = "bm_not_cowboy_sc_desc"
			end
		end
	end
end