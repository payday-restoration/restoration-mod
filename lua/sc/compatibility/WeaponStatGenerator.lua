function WeaponTweakData:generate_custom_weapon_stats(weap)
	--Perform magic stat generation for unsupported custom weapons.
	--Pretty much just look at various features of the passed in weapon and set damage/acc/stab/concealment to reasonable-ish values.
	--Many of these values have been arbitrarily chosen and tweaked until most custom weapons from MWS give passable looking stats.
	weap.has_description = true
	weap.desc_id = "bm_auto_generated_sc_desc"
	weap.AMMO_PICKUP = self:_pickup_chance()
	--Near max baseline stats.
	local spread = 20
	local recoil = 25
	local concealment = 31
	local quietness = 0
	weap.kick = self.new_m4.kick

	--Apply category multipliers.
	for _, value in pairs(weap.categories) do
		if value == "lmg" then
			table.insert(weap.categories, "smg") --LMGs are treated like SMGs in resmod. Filter them out before anything else to avoid weird quirk
			spread = spread - 1
			concealment = concealment - 2
			recoil = recoil + 2
			weap.stats.damage = weap.stats.damage / 2 --Vanilla LMGs deal extreme damage compared to RM LMGs.
		elseif value == "shotgun" then
			quietness = quietness - 1
			spread = spread - 12
			recoil = recoil - 7
			weap.rays = 9
			weap.concealment = concealment - 2
			weap.kick = self.huntsman.kick
			weap.stats.damage = weap.stats.damage * 1.5 --Vanilla Shotguns deal less damage than RM shotguns (until falloff range).
		elseif value == "smg" then
			spread = spread - 1
			recoil = recoil + 1
		elseif value == "pistol" then
			recoil = recoil - 1
			concealment = concealment + 1
		elseif value == "snp" then
			spread = spread + 1
			recoil = recoil - 1
			concealment = concealment - 1
			weap.kick = self.huntsman.kick
		elseif value == "akimbo" then
			spread = spread - 2
			recoil = recoil - 10
		end
	end
	
	--The original weapon damage.
	local damage = weap.stats.damage * (weap.stats_modifiers and weap.stats_modifiers.damage or 1)
	--Approximate weapon damage tier and total ammo
	if damage <= 40 then
		weap.stats.damage = 18
		quietness = quietness + 10
		spread = spread + 1
		weap.AMMO_MAX = 200
	elseif damage <= 50 then
		weap.stats.damage = 20
		quietness = quietness + 9
		concealment = concealment - 2
		recoil = recoil - 1
		weap.AMMO_MAX = 180
	elseif damage <= 65 then
		weap.stats.damage = 24
		quietness = quietness + 8
		concealment = concealment - 4
		recoil = recoil - 2
		weap.AMMO_MAX = 150
	elseif damage <= 95 then
		weap.stats.damage = 30
		quietness = quietness + 7
		concealment = concealment - 7
		recoil = recoil - 3
		weap.AMMO_MAX = 120
	elseif damage <= 150 then
		weap.stats.damage = 45
		quietness = quietness + 6
		concealment = concealment - 9
		recoil = recoil - 5
		weap.AMMO_MAX = 80
	elseif damage <= 220 then
		weap.stats.damage = 60
		quietness = quietness + 5
		concealment = concealment - 11
		recoil = recoil - 6
		weap.AMMO_MAX = 60
	elseif damage <= 300 then
		weap.stats.damage = 90
		quietness = quietness + 4
		concealment = concealment - 13
		recoil = recoil - 7
		weap.AMMO_MAX = 40
	elseif damage <= 600 then
		weap.stats.damage = 120
		quietness = quietness + 3
		concealment = concealment - 15
		recoil = recoil - 8
		weap.AMMO_MAX = 30
	else
		weap.stats.damage = 180
		quietness = quietness + 2
		concealment = concealment - 18
		recoil = recoil - 9
		weap.AMMO_MAX = 20
	end
	--Adjust ammo count for secondaries.
	if weap.use_data.selection_index == 1 then
		weap.AMMO_MAX = weap.AMMO_MAX * 0.5
	end
	--Adjust accuracy based on reload ability.
	if weap.timers.reload_not_empty and weap.timers.reload_empty then
		local average_reload = (weap.timers.reload_not_empty + weap.timers.reload_empty) / 2
		local adjusted_mag_size = (weap.CLIP_AMMO_MAX + 30) / 2 --The formula would otherwise be too kind to revolvers and too mean to LMGs.
		local reload_quality = adjusted_mag_size / average_reload --How generally pleasant reloading the weapon is. Attempts to average out reload stuff to work with most cases.
		if reload_quality <= 5.5 then
			concealment = concealment + 2
			spread = spread + 2
		elseif reload_quality <= 6 then
			concealment = concealment + 2
			spread = spread + 1
		elseif reload_quality <= 7 then
			concealment = concealment + 2
		elseif reload_quality <= 7.5 then
			concealment = concealment + 1
			spread = spread - 1
		elseif reload_quality <= 8 then
			spread = spread - 2
		elseif reload_quality <= 9 then
			spread = spread - 3
		elseif reload_quality <= 10 then
			spread = spread - 4
		elseif reload_quality <= 12 then
			spread = spread - 5
		elseif reload_quality <= 15 then
			spread = spread - 6
		else
			spread = spread - 7
		end
		--Big mag concealment penalties.
		if weap.CLIP_AMMO_MAX > 120 then
			concealment = concealment - 5
		elseif weap.CLIP_AMMO_MAX > 90 then
			concealment = concealment - 3
		elseif weap.CLIP_AMMO_MAX > 60 then
			concealment = concealment - 2
		elseif weap.CLIP_AMMO_MAX > 30 then
			concealment = concealment - 1
		elseif weap.CLIP_AMMO_MAX <= 2 then
			spread = spread + 3
			concealment = concealment + 3
		end
	else --Certain custom shotguns fall under here.
		if weap.CLIP_AMMO_MAX > 10 then
			spread = spread - 2
			concealment = concealment - 2
		elseif weap.CLIP_AMMO_MAX > 8 then
			spread = spread - 1
			concealment = concealment - 2
		elseif weap.CLIP_AMMO_MAX > 6 then
			concealment = concealment -  1
		elseif weap.CLIP_AMMO_MAX > 4 then
			spread = spread + 1
			concealment = concealment + 1
		elseif weap.CLIP_AMMO_MAX <= 2 then
			spread = spread + 3
			concealment = concealment + 3
		end
	end
	--Adjust stats based on rate of fire.
	local rpm = 60 / weap.fire_mode_data.fire_rate --Rounds per minute.
	if not weap.auto then --Semi Auto Stuff
		--Recoil bonuses for awful rates of fire.
		if rpm <= 50 then
			recoil = recoil + 2
		elseif rpm <= 100 then
			recoil = recoil + 1
		end
		--Gives extra shitty pistols a boost.
		if weap.stats.damage <= 36 then
			concealment = concealment + 3
			spread = spread + 3
			recoil = recoil + 3
		elseif weap.stats.damage <= 40 then
			concealment = concealment + 2
			spread = spread + 2
			recoil = recoil + 2
		elseif weap.stats.damage <= 60 then
			concealment = concealment + 1
			spread = spread + 1
			recoil = recoil + 1
		end
		--Compensates for piercing. Would baseline into sniper, but some custom weapons might be in that category without piercing because reasons.
		if weap.can_shoot_through_shield and weap.can_shoot_through_shield == true then
			if weap.stats.damage <= 120 then
				spread = spread - 1
				concealment = concealment - 1
				recoil = recoil - 3
			else
				weap.can_shoot_through_titan_shield = true
				spread = spread - 2
				concealment = concealment - 2
				recoil = recoil - 9
			end
		end
	else --Full Auto Stuff
		recoil = recoil - math.min(math.max(rpm - 500, 0)/50, 12)
	end
	--Math.ceil prevents a stupid fucking crash because floats are fun.
	weap.stats.recoil = math.ceil(math.clamp(recoil, 1, #self.stats.recoil))
	weap.stats.spread = math.ceil(math.clamp(spread, 1, #self.stats.spread))
	weap.stats.concealment = math.ceil(math.clamp(concealment, 1, #self.stats.concealment))
	weap.stats.alert_size = math.ceil(math.clamp(quietness, 1, #self.stats.alert_size))
	weap.stats.suppression =  math.ceil(math.clamp(quietness, 1, #self.stats.suppression))
	weap.stats.extra_ammo = 101
	weap.stats.total_ammo_mod = 100
	weap.stats.zoom = weap.stats.zoom or 1
	weap.stats.value = weap.stats.value or 7
	weap.stats_modifiers = nil
end
