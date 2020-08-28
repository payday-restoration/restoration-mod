function WeaponTweakData:generate_custom_weapon_stats(weap)
	log("Generating stats for: " .. weap.name_id)

	--Perform magic stat generation for unsupported custom weapons.
	weap.has_description = true
	weap.desc_id = "bm_auto_generated_sc_desc"

	--Set some stuff that's generic to all weapons.
	weap.AMMO_PICKUP = self:_pickup_chance()
	weap.kick = self.new_m4.kick
	local apply_akimbo_penalties = nil
	local add_to_smgs = nil
	local stats = {}

	--Apply weapons stats based on category. Usually just one of these with akimbo maybe added on top.
	for _, value in pairs(weap.categories) do
		if value == "lmg" then
			stats = self:generate_lmg(weap)
			add_to_smgs = true
		elseif value == "shotgun" then
			weap.kick = self.huntsman.kick
			weap.rays = 9
			--stats = self:generate_shotgun(weap)
		elseif value == "smg" then
			stats = self:generate_smg(weap)
		elseif value == "pistol" then
			--stats = self:generate_pistol(weap)
		elseif value == "snp" then
			weap.kick = self.huntsman.kick
			--stats = self:generate_snp(weap)
		elseif value == "assault_rifle" then
			log("Assault Rifle Found")
			stats = self:generate_assault_rifle(weap)
		elseif value == "akimbo" then
			apply_akimbo_penalties = true
		end
	end
	
	--If stats were generated. Uses last category.
	if stats.spread then
		--Akimbo weapons get shittier handling.
		if apply_akimbo_penalties then
			stats.recoil = stats.recoil - 10
			stats.spread = stats.spread - 2
		end

		if add_to_smgs then
			table.insert(weap.categories, "smg") --LMGs in resmod are treated like SMGs for skill related stuff.
		end

		--Adjust ammo on secondaries.
		if weap.use_data.selection_index == 1 then
			stats.AMMO_MAX = stats.AMMO_MAX * 0.5
		end

		--Apply stats table to weapon tweakdata.
		weap.stats.damage = stats.damage
		weap.AMMO_MAX = stats.AMMO_MAX
		weap.stats.recoil = stats.recoil
		weap.stats.spread = stats.spread
		weap.stats.concealment = stats.concealment
		weap.stats.alert_size = stats.quietness
		weap.stats.suppression = stats.quietness
		weap.stats.extra_ammo = 101
		weap.stats.total_ammo_mod = 100
		weap.stats.zoom = weap.stats.zoom or 1
		weap.stats.value = weap.stats.value or 7
		weap.swap_speed_multiplier = stats.swap_speed_multiplier
		weap.stats_modifiers = nil
	end
	return weap
end

--Returns a value from results that corresponds to the first value in inputs >= stat.
function WeaponTweakData:generate_stat_from_table(results, inputs, stat)
	for i, value in pairs(inputs) do
		if value >= stat then
			return results[i]
		end
	end
	return results[#results]
end

--Removes any potential floating point errors from weapon stats. Leaving any in results in crashes.
function WeaponTweakData:clean_stats(stats)
	stats.recoil = math.ceil(math.clamp(stats.recoil, 1, #self.stats.recoil))
	stats.spread = math.ceil(math.clamp(stats.spread, 1, #self.stats.spread))
	stats.concealment = math.ceil(math.clamp(stats.concealment, 1, #self.stats.concealment))
	stats.quietness = math.ceil(math.clamp(stats.quietness, 1, #self.stats.suppression))
	return stats
end

function WeaponTweakData:generate_assault_rifle(weap)
	local stats = {
		damage = 0,
		AMMO_MAX = 0,
		spread = 0,
		recoil = 0,
		concealment = 0,
		quietness = 0,
		swap_speed_multiplier = 1
	}

	--How generally pleasant the weapon is to reload.
	local reload_quality = math.clamp(weap.CLIP_AMMO_MAX, 10, 50) / ((weap.timers.reload_not_empty + weap.timers.reload_empty) / 2)
	log(weap.name_id .. ":" .. tostring(weap.CLIP_AMMO_MAX) .. "/" ..  tostring((weap.timers.reload_not_empty + weap.timers.reload_empty) / 2) .. "=" .. tostring(reload_quality))
	--Rounds per minute.
	local rpm = 60 / weap.fire_mode_data.fire_rate

	--Give bullpups -4 stab, +1 concealment.
	local is_bullpup = nil
	for _, value in pairs(weap.categories) do
		if value == "bullpup" then
			is_bullpup = true
		end
	end

	--The original weapon damage.
	local damage = weap.stats.damage * (weap.stats_modifiers and weap.stats_modifiers.damage or 1)
	if damage <= 35 then
		stats.damage = 18
		stats.AMMO_MAX = 200
		stats.quietness = 10
		stats.recoil = 22 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{20,19,18,17,16,15,14},
			{8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{32,30,29,29,27,25},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 40 then
		stats.damage = 20
		stats.AMMO_MAX = 180
		stats.quietness = 9
		stats.recoil = 21 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{20,19,18,17,16,15,14},
			{8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{31,29,28,27,25,23},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 65 then
		stats.damage = 24
		stats.AMMO_MAX = 150
		stats.quietness = 8
		stats.recoil = 20 - math.floor((rpm - 700)/50)
		stats.spread = self:generate_stat_from_table(
			{20,19,18,17,16,15,14,13},
			{7.5,8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{29,27,26,25,23,21},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 80 then
		stats.damage = 30
		stats.AMMO_MAX = 120
		stats.quietness = 7
		stats.recoil = 19 - math.floor((rpm - 700)/50)
		stats.spread = self:generate_stat_from_table(
			{19,18,17,16,15,14,13,12},
			{7.5,8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{27,25,24,23,21,19},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 90 then
		stats.damage = 45
		stats.AMMO_MAX = 80
		stats.quietness = 6
		stats.recoil = 18 - math.floor((rpm - 700)/50)
		stats.spread = self:generate_stat_from_table(
			{20,19,18,17,16,15,14,13,12,11},
			{6,7,7.5,8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{24,22,21,20,18,16},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	else
		stats.damage = 60
		stats.AMMO_MAX = 60
		stats.quietness = 5
		stats.recoil = 14 - math.floor((rpm - 700)/50)
		stats.spread = self:generate_stat_from_table(
			{21,20,19,18,17,16,15,14,13,12},
			{6,7,7.5,8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{22,20,19,18,16,14},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	end

	--Additional stat modifiers
	if not weap.auto then --Give buffs to guns that lack automatic fire.
		log("Semi-Auto")
		stats.spread = stats.spread + self:generate_stat_from_table(
			{3,2,0},
			{24,30,45},
			stats.damage)
		stats.recoil = stats.recoil + 1
		stats.concealment = stats.concealment + self:generate_stat_from_table(
			{2,1,0},
			{24,30,45},
			stats.damage)
		stats.swap_speed_multiplier = self:generate_stat_from_table(
			{1.2,1.1,1.05,1},
			{24,30,45},
			stats.damage)
	end

	if is_bullpup then
		log("Bullpup!")
		stats.spread = stats.spread - 1
		stats.concealment = stats.concealment + 1
	end

	if weap.timers.reload_empty < 2.5 then
		stats.concealment = stats.concealment - 1
	elseif weap.timers.reload_empty > 4 then
		stats.spread = stats.spread + 1
	end

	return self:clean_stats(stats)
end

function WeaponTweakData:generate_smg(weap)
	local stats = {
		damage = 0,
		AMMO_MAX = 0,
		spread = 0,
		recoil = 0,
		concealment = 0,
		quietness = 0,
		swap_speed_multiplier = 1
	}

	--How generally pleasant the weapon is to reload.
	local reload_quality = math.clamp(weap.CLIP_AMMO_MAX, 10, 50) / ((weap.timers.reload_not_empty + weap.timers.reload_empty) / 2)
	
	--Rounds per minute.
	local rpm = 60 / weap.fire_mode_data.fire_rate

	--Give bullpups -4 stab, +1 concealment.
	local is_bullpup = nil
	for _, value in pairs(weap.categories) do
		if value == "bullpup" then
			is_bullpup = true
		end
	end

	--The original weapon damage.
	--The original weapon damage.
	local damage = weap.stats.damage * (weap.stats_modifiers and weap.stats_modifiers.damage or 1)
	if damage <= 50 then --36 damage Carbine Tier
		stats.damage = 18
		stats.AMMO_MAX = 200
		stats.quietness = 10
		stats.recoil = 23 - math.floor((rpm - 900)/50)
		stats.spread = self:generate_stat_from_table(
			{19,18,17,16,15,14,13},
			{8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{32,30,29,29,27,25},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 60 then
		stats.damage = 20
		stats.AMMO_MAX = 180
		stats.quietness = 9
		stats.recoil = 23 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{19,18,17,16,15,14,13},
			{8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{31,29,28,27,25,23},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 80 then
		stats.damage = 24
		stats.AMMO_MAX = 150
		stats.quietness = 8
		stats.recoil = 19 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{19,18,17,16,15,14,13,12},
			{7.5,8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{29,27,26,25,23,21},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	else
		stats.damage = 30
		stats.AMMO_MAX = 120
		stats.quietness = 7
		stats.recoil = 23 - math.floor((rpm - 600)/50)
		stats.spread = self:generate_stat_from_table(
			{18,17,16,15,14,13,12,11},
			{7.5,8,8.5,10,12,15,20},
			reload_quality)
		stats.concealment = self:generate_stat_from_table(
			{27,25,24,23,21,19},
			{10,20,30,40,60},
			weap.CLIP_AMMO_MAX)
	end

	--Additional stat modifiers
	if not weap.auto then --Give buffs to guns that lack automatic fire.
		stats.spread = stats.spread + self:generate_stat_from_table(
			{3,2},
			{24,30},
			stats.damage)
		stats.recoil = stats.recoil + 1
		stats.concealment = stats.concealment + self:generate_stat_from_table(
			{2,1},
			{24,30},
			stats.damage)
		stats.swap_speed_multiplier = self:generate_stat_from_table(
			{1.2,1.1},
			{24,30},
			stats.damage)
	end

	if is_bullpup then
		stats.spread = stats.spread - 1
		stats.concealment = stats.concealment + 1
	end

	if weap.timers.reload_empty < 2.5 then
		stats.concealment = stats.concealment - 1
	elseif weap.timers.reload_empty > 4 then
		stats.spread = stats.spread + 1
	end

	return self:clean_stats(stats)
end

function WeaponTweakData:generate_lmg(weap)
	local stats = {
		damage = 0,
		AMMO_MAX = 0,
		spread = 0,
		recoil = 0,
		concealment = 0,
		quietness = 0,
		swap_speed_multiplier = 1
	}

	--How generally pleasant the weapon is to reload.
	local reload_time = (weap.timers.reload_not_empty + weap.timers.reload_empty) / 2
	
	--Rounds per minute.
	local rpm = 60 / weap.fire_mode_data.fire_rate

	--The original weapon damage.
	local damage = weap.stats.damage * (weap.stats_modifiers and weap.stats_modifiers.damage or 1)
	if damage <= 60 then
		log("1")
		stats.damage = 18
		stats.AMMO_MAX = 200
		stats.quietness = 10
		stats.recoil = 23 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{12,13,14,15,16,17},
			{4.5,5.0,5.5,6.0,6.5},
			reload_time)
		stats.spread = stats.spread + self:generate_stat_from_table(
			{4,3,2,1,0},
			{50,75,100,150},
			weap.CLIP_AMMO_MAX)
		stats.concealment = self:generate_stat_from_table(
			{29,28,27,25,23,21},
			{40,50,75,100,150},
			weap.CLIP_AMMO_MAX)
	elseif damage <= 80 then
		log("2")
		stats.damage = 20
		stats.AMMO_MAX = 180
		stats.quietness = 9
		stats.recoil = 23 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{12,13,14,15,16,17},
			{4.5,5.0,5.5,6.0,6.5},
			reload_time)
		stats.spread = stats.spread + self:generate_stat_from_table(
			{4,3,2,1,0},
			{50,75,100,150},
			weap.CLIP_AMMO_MAX)
		stats.concealment = self:generate_stat_from_table(
			{26,25,24,22,20,18},
			{40,50,75,100,150},
			weap.CLIP_AMMO_MAX)
	else
		log("3")
		stats.damage = 24
		stats.AMMO_MAX = 150
		stats.quietness = 8
		stats.recoil = 21 - math.floor((rpm - 800)/50)
		stats.spread = self:generate_stat_from_table(
			{12,13,14,15,16,17},
			{4.5,5.0,5.5,6.0,6.5},
			reload_time)
		stats.spread = stats.spread + self:generate_stat_from_table(
			{4,3,2,1,0},
			{50,75,100,150},
			weap.CLIP_AMMO_MAX)
		stats.concealment = self:generate_stat_from_table(
			{26,25,24,22,20,18},
			{40,50,75,100,150},
			weap.CLIP_AMMO_MAX)
	end

	return self:clean_stats(stats)
end

--[[--Adjust ammo count for secondaries.
	
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
	return stats
end]]--
