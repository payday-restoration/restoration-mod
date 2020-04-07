if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then
	function SentryGunDamage:_apply_damage(damage, dmg_shield, dmg_body, is_local)
		if dmg_shield and self._shield_health > 0 then
			local shield_dmg = damage == "death" and self._shield_health or damage

			if shield_dmg > 0 then
				if self._shield_health <= shield_dmg then
					if not dmg_body then
						damage = self._shield_health
					end

					self._shield_health = 0

					if self._shield_sparks_disable and self._enabled_sparks_on_shield and self._unit:damage():has_sequence(self._shield_sparks_disable) then
						self._unit:damage():run_sequence_simple(self._shield_sparks_disable)
						self._enabled_sparks_on_shield = nil
					end

					if self._shield_destroyed_sequence_name and self._unit:damage():has_sequence(self._shield_destroyed_sequence_name) then
						self._unit:damage():run_sequence_simple(self._shield_destroyed_sequence_name)
					end

					if self._shield_destroyed_snd_event then
						self._unit:sound_source():post_event(self._shield_destroyed_snd_event)
					end

					self:update_shield_smoke_level(self:shield_health_ratio())
				else
					self._shield_health = self._shield_health - shield_dmg

					if self._shield_sparks_enable and not self._enabled_sparks_on_shield and self:shield_health_ratio() < 0.25 and self._unit:damage():has_sequence(self._shield_sparks_enable) then
						self._unit:damage():run_sequence_simple(self._shield_sparks_enable)
						self._enabled_sparks_on_shield = true
					end

					self:update_shield_smoke_level(self:shield_health_ratio())
				end

				if not dmg_body then
					return damage
				end
			end
		end

		if dmg_body then
			local body_damage = damage == "death" and self._health or damage

			if body_damage == 0 then
				return 0
			end

			local previous_health_ratio = self:health_ratio()

			if self._health <= body_damage then
				damage = self._health

				self:die(attacker_unit, variant)
			else
				self._health = self._health - body_damage
			end

			if not self._dead and self._damaged_sequence_name then
				if previous_health_ratio >= 0.75 and self:health_ratio() < 0.75 and self._unit:damage():has_sequence(self._damaged_sequence_name) then
					self._unit:damage():run_sequence_simple(self._damaged_sequence_name)
				end
			end

			return damage
		end

		return 0
	end

	function SentryGunDamage:is_head(body)
		return body and (self._shield_body_name_ids and (body:name() == self._shield_body_name_ids) or self._bag_body_name_ids and (body:name() == self._bag_body_name_ids))
	end

	local orig_sentry_die = SentryGunDamage.die
	function SentryGunDamage:die(attacker_unit, variant, options)
	--this replacement function prevents some on_death sequences because they can glitch the repairs
		local owner = self._unit:base():get_owner_id()

		if owner then --no SWAT turrets allowed >:(
			--a sentry dying mid-repair cycle (eg from autumn's blackout) now cancels and resets the repair
			self._unit:base()._is_repairing = false
			self._repair_done_t = nil
			if self._unit:contour() then
				self._unit:contour():remove("highlight") --remove flash if repairing sentry is disabled by autumn
				self._unit:contour():flash("highlight",false)
			end

			self._health = 0
			self._dead = true

			self._unit:movement():switch_off()
			self._unit:brain():switch_off()
			self._unit:movement():set_active(false)
			self._unit:brain():set_active(false)

			self._shield_smoke_level = 0

			self._unit:contour():remove("deployable_active")
			if owner == managers.network:session():local_peer():id() then
				self._unit:interaction():set_tweak_data("start_sentrygun_repairmode")
				self._unit:contour():add("deployable_disabled")
			end
		else
			--called at game join since owner is not set at that point; can result in glitchy sentry repairs for late joins :(
			return orig_sentry_die(self,attacker_unit,variant,options)
		end
	end

	function SentryGunDamage:init(unit)
		self._unit = unit
		self._parent_unit = nil
		self._ext_movement = unit:movement()

		unit:base():post_init()
		unit:brain():post_init()
		unit:movement():post_init()

		self._HEALTH_INIT = 10000
		self._SHIELD_HEALTH_INIT = 10000

		if self._shield_body_name then
			self._shield_body_name_ids = Idstring(self._shield_body_name)
		end

		if self._bag_body_name then
			self._bag_body_name_ids = Idstring(self._bag_body_name)
		end

		if self._invulnerable_body_names then
			self._invulnerable_bodies = {}
			local names_split = string.split(self._invulnerable_body_names, " ")

			for _, name_ids in ipairs(names_split) do
				self._invulnerable_bodies[name_ids:key()] = true
			end
		end

		self._health = self._HEALTH_INIT
		self._shield_health = self._SHIELD_HEALTH_INIT
		self._shield_smoke_level = 0
		self._shield_smoke_levels = {}

		table.insert(self._shield_smoke_levels, self._shield_smoke_level_1)
		table.insert(self._shield_smoke_levels, self._shield_smoke_level_2)
		table.insert(self._shield_smoke_levels, self._shield_smoke_level_3)

		self._num_shield_smoke_levels = table.getn(self._shield_smoke_levels)

		self._HEALTH_INIT_PERCENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
		self._SHIELD_HEALTH_INIT_PERCENT = self._SHIELD_HEALTH_INIT / self._HEALTH_GRANULARITY
		self._char_tweak = tweak_data.weapon[self._unit:base():get_name_id()]
	end

	function SentryGunDamage:set_health(amount, shield_health_amount)
		self._health = amount
		self._HEALTH_INIT = amount
		self._HEALTH_INIT_PERCENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
		self._shield_health = shield_health_amount
		self._SHIELD_HEALTH_INIT = shield_health_amount
		self._SHIELD_HEALTH_INIT_PERCENT = self._SHIELD_HEALTH_INIT / self._HEALTH_GRANULARITY

		self._char_tweak = tweak_data.weapon[self._unit:base():get_name_id()]
	end

	function SentryGunDamage:sync_health(health_percent)
		local new_health = health_percent * self._HEALTH_INIT_PERCENT

		if new_health == 0 then
			self:die()
		else
			self._health = new_health
		end

		self._unit:event_listener():call("on_damage_received", self:health_ratio())
	end

	function SentryGunDamage:on_marked_state(state, bonus_distance_damage)
		if state then
			self._marked_dmg_mul = self._marked_dmg_mul or tweak_data.upgrades.values.player.marked_enemy_damage_mul
			self._marked_dmg_dist_mul = bonus_distance_damage
		else
			self._marked_dmg_mul = nil
			self._marked_dmg_dist_mul = nil
		end
	end

	function SentryGunDamage:damage_bullet(attack_data)
		if self._dead or self._invulnerable or PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
			return "friendly_fire"
		end

		local hit_body = attack_data.col_ray.body
		local hit_body_name = hit_body:name()

		if self._invulnerable_bodies and hit_body and self._invulnerable_bodies[hit_body_name:key()] then
			return
		end

		local hit_shield, hit_bag = nil

		if hit_body then
			if hit_body_name == self._shield_body_name_ids then
				hit_shield = true
			elseif hit_body_name == self._bag_body_name_ids then
				hit_bag = true
			end
		end

		local damage = attack_data.damage

		if self._marked_dmg_mul then
			damage = damage * self._marked_dmg_mul

			if self._marked_dmg_dist_mul then
				local dst = mvector3.distance(attack_data.origin, self._unit:movement():m_head_pos())
				local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

				if spott_dst[1] < dst then
					damage = damage * spott_dst[2]
				end
			end
		end

		local dmg_shield, damage_percent = nil

		if hit_shield and self._char_tweak.SHIELD_DMG_MUL then
			damage = damage * self._char_tweak.SHIELD_DMG_MUL
		end

		if hit_shield and self._shield_health > 0 then
			dmg_shield = true

			if self._char_tweak.SHIELD_DAMAGE_CLAMP then
				damage = math.min(damage, self._char_tweak.SHIELD_DAMAGE_CLAMP)
			end

			attack_data.raw_damage = damage

			damage = math.clamp(damage, 0, self._SHIELD_HEALTH_INIT)
			damage_percent = math.ceil(damage / self._SHIELD_HEALTH_INIT_PERCENT)
			damage = damage_percent * self._SHIELD_HEALTH_INIT_PERCENT
		else
			if hit_bag then
				if self._char_tweak.BAG_DMG_MUL then
					damage = damage * self._char_tweak.BAG_DMG_MUL
				end

				if self._bag_hit_snd_event then
					self._unit:sound_source():post_event(self._bag_hit_snd_event)
				end
			end

			if self._char_tweak.BODY_DAMAGE_CLAMP then
				damage = math.min(damage, self._char_tweak.BODY_DAMAGE_CLAMP)
			end

			attack_data.raw_damage = damage

			damage = math.clamp(damage, 0, self._HEALTH_INIT)
			damage_percent = math.ceil(damage / self._HEALTH_INIT_PERCENT)
			damage = damage_percent * self._HEALTH_INIT_PERCENT
		end

		local damage_post_apply = damage == 0 and 0 or self:_apply_damage(damage, dmg_shield, not dmg_shield, true, attack_data.attacker_unit, "bullet")
		attack_data.damage = damage_post_apply

		local result = {
			variant = "bullet",
			type = "dmg_rcv"
		}
		attack_data.result = result
		result.attack_data = attack_data

		if damage_post_apply == 0 then
			return result
		end

		if not self._ignore_client_damage and attack_data.attacker_unit == managers.player:player_unit() then
			managers.hud:on_hit_confirmed()
		end

		local attacker = attack_data.attacker_unit

		if not attacker or not alive(attacker) or attacker:id() == -1 then
			attacker = self._unit
		end

		local body_index = self._unit:get_body_index(hit_body_name)

		self._unit:network():send("damage_bullet", attacker, damage_percent, body_index, 0, 0, self._dead and true or false)

		if not self._dead then
			self._unit:brain():on_damage_received(attack_data.attacker_unit)
		end

		if not self._ignore_client_damage then
			local attacker_unit = attack_data and attack_data.attacker_unit

			if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
			end

			if attacker_unit == managers.player:player_unit() and attack_data then
				managers.player:on_damage_dealt(self._unit, attack_data)
			end

			managers.player:send_message(Message.OnEnemyShot, nil, self._unit, attack_data)
		end

		return result
	end

	function SentryGunDamage:stun_hit(attack_data)
		return nil
	end

	function SentryGunDamage:damage_fire(attack_data)
		if self._dead or self._invulnerable or attack_data.variant == "stun" then
			return
		end

		local attacker_unit = attack_data.attacker_unit
		local weapon_unit = attack_data.weapon_unit

		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			weapon_unit = attack_data.attacker_unit
		end

		if attacker_unit and PlayerDamage.is_friendly_fire(self, attacker_unit) then
			return "friendly_fire"
		end

		local damage = attack_data.damage

		if self._marked_dmg_mul then
			damage = damage * self._marked_dmg_mul

			if self._marked_dmg_dist_mul and alive(attacker_unit) then
				local dst = mvector3.distance(attacker_unit:position(), self._unit:movement():m_head_pos())
				local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

				if spott_dst[1] < dst then
					damage = damage * spott_dst[2]
				end
			end
		end

		if self._char_tweak.FIRE_DMG_MUL then
			damage = damage * self._char_tweak.FIRE_DMG_MUL
		end

		local dmg_shield, damage_percent = nil

		if self._shield_health > 0 then
			dmg_shield = true

			if self._char_tweak.SHIELD_DMG_MUL then
				damage = damage * self._char_tweak.SHIELD_DMG_MUL
			end

			if self._char_tweak.SHIELD_DAMAGE_CLAMP then
				damage = math.min(damage, self._char_tweak.SHIELD_DAMAGE_CLAMP)
			end

			attack_data.raw_damage = damage

			damage = math.clamp(damage, 0, self._SHIELD_HEALTH_INIT)
			damage_percent = math.ceil(damage / self._SHIELD_HEALTH_INIT_PERCENT)
			damage = damage_percent * self._SHIELD_HEALTH_INIT_PERCENT
		else
			if self._char_tweak.BODY_DAMAGE_CLAMP then
				damage = math.min(damage, self._char_tweak.BODY_DAMAGE_CLAMP)
			end

			attack_data.raw_damage = damage

			damage = math.clamp(damage, 0, self._HEALTH_INIT)
			damage_percent = math.ceil(damage / self._HEALTH_INIT_PERCENT)
			damage = damage_percent * self._HEALTH_INIT_PERCENT
		end

		local damage_post_apply = damage == 0 and 0 or self:_apply_damage(damage, dmg_shield, not dmg_shield, true, attacker_unit, "fire")
		attack_data.damage = damage_post_apply

		local result = {
			variant = "fire",
			type = "dmg_rcv"
		}
		attack_data.result = result
		result.attack_data = attack_data

		if damage_post_apply == 0 then
			return result
		end

		if not self._ignore_client_damage and attacker_unit == managers.player:player_unit() then
			if weapon_unit then
				local is_ground_fire = weapon_unit:base() and weapon_unit:base().get_name_id and weapon_unit:base():get_name_id() == "environment_fire"

				if not is_ground_fire then
					managers.hud:on_hit_confirmed()
				end
			end
		end

		local attacker = attack_data.attacker_unit

		if not attacker or not alive(attacker) or attacker:id() == -1 then
			attacker = self._unit
		end

		local send_hit_shield = false

		if dmg_shield then
			send_hit_shield = true
		end

		self._unit:network():send("damage_fire", attacker, damage_percent, send_hit_shield, self._dead and true or false, Vector3(), nil, nil, false)

		if not self._dead then
			self._unit:brain():on_damage_received(attack_data.attacker_unit)
		end
		
		if not self._ignore_client_damage then
			local attacker_unit = attack_data and attack_data.attacker_unit

			if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
			end

			if attacker_unit == managers.player:player_unit() and attack_data then
				managers.player:on_damage_dealt(self._unit, attack_data)
			end
		end

		return result
	end

	function SentryGunDamage:damage_explosion(attack_data)
		if self._dead or self._invulnerable or attack_data.variant == "stun" then
			return
		end

		local attacker_unit = attack_data.attacker_unit

		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
		end

		if attacker_unit and PlayerDamage.is_friendly_fire(self, attacker_unit) then
			return "friendly_fire"
		end

		local damage = attack_data.damage

		if self._marked_dmg_mul then
			damage = damage * self._marked_dmg_mul

			if self._marked_dmg_dist_mul and alive(attacker_unit) then
				local dst = mvector3.distance(attacker_unit:position(), self._unit:movement():m_head_pos())
				local spott_dst = tweak_data.upgrades.values.player.marked_inc_dmg_distance[self._marked_dmg_dist_mul]

				if spott_dst[1] < dst then
					damage = damage * spott_dst[2]
				end
			end
		end

		if self._char_tweak.EXPLOSION_DMG_MUL then
			damage = damage * self._char_tweak.EXPLOSION_DMG_MUL
		end

		local dmg_shield, damage_percent = nil

		if self._shield_health > 0 then
			dmg_shield = true

			if self._char_tweak.SHIELD_DMG_MUL then
				damage = damage * self._char_tweak.SHIELD_DMG_MUL
			end

			if self._char_tweak.SHIELD_DAMAGE_CLAMP then
				damage = math.min(damage, self._char_tweak.SHIELD_DAMAGE_CLAMP)
			end

			attack_data.raw_damage = damage

			damage = math.clamp(damage, 0, self._SHIELD_HEALTH_INIT)
			damage_percent = math.ceil(damage / self._SHIELD_HEALTH_INIT_PERCENT)
			damage = damage_percent * self._SHIELD_HEALTH_INIT_PERCENT
		else
			if self._char_tweak.BODY_DAMAGE_CLAMP then
				damage = math.min(damage, self._char_tweak.BODY_DAMAGE_CLAMP)
			end

			attack_data.raw_damage = damage

			damage = math.clamp(damage, 0, self._HEALTH_INIT)
			damage_percent = math.ceil(damage / self._HEALTH_INIT_PERCENT)
			damage = damage_percent * self._HEALTH_INIT_PERCENT
		end

		local damage_post_apply = damage == 0 and 0 or self:_apply_damage(damage, dmg_shield, not dmg_shield, true, attacker_unit, "explosion")
		attack_data.damage = damage_post_apply

		local result = {
			variant = "explosion",
			type = "dmg_rcv"
		}
		attack_data.result = result
		result.attack_data = attack_data

		if damage_post_apply == 0 then
			return result
		end

		if not self._ignore_client_damage and attacker_unit == managers.player:player_unit() then
			managers.hud:on_hit_confirmed()
		end

		local attacker = attack_data.attacker_unit

		if not attacker or not alive(attacker) or attacker:id() == -1 then
			attacker = self._unit
		end

		local send_hit_type = 1

		if dmg_shield then
			send_hit_type = 2
		end

		self._unit:network():send("damage_explosion_fire", attacker, damage_percent, send_hit_type, self._dead and true or false, Vector3(), self._unit)

		if not self._dead then
			self._unit:brain():on_damage_received(attacker_unit)
		end

		if not self._ignore_client_damage then
			local attacker_unit = attack_data and attack_data.attacker_unit

			if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().thrower_unit then
				attacker_unit = attacker_unit:base():thrower_unit()
			end

			if attacker_unit == managers.player:player_unit() and attack_data then
				managers.player:on_damage_dealt(self._unit, attack_data)
			end
		end

		return result
	end

	function SentryGunDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, variant, death)
		if self._dead then
			return
		end

		local hit_body = self._unit:body(i_body)
		local dmg_shield, dmg_body, damage = nil

		if death then
			damage = "death"

			if self._bag_hit_snd_event and hit_body:name() == self._bag_body_name_ids then
				self._unit:sound_source():post_event(self._bag_hit_snd_event)
			end

			dmg_shield = true
			dmg_body = true
		else
			local dmg_shield = hit_body:name() == self._shield_body_name_ids

			if dmg_shield then
				damage = damage_percent * self._SHIELD_HEALTH_INIT_PERCENT
			else
				if self._bag_hit_snd_event and hit_body:name() == self._bag_body_name_ids then
					self._unit:sound_source():post_event(self._bag_hit_snd_event)
				end

				damage = damage_percent * self._HEALTH_INIT_PERCENT
				dmg_body = true
			end
		end

		self:_apply_damage(damage, dmg_shield, dmg_body, false, attacker_unit, "bullet")

		if not self._dead then
			self._unit:brain():on_damage_received(attacker_unit)
		end
	end

	function SentryGunDamage:sync_damage_fire(attacker_unit, damage_percent, hit_shield, death)
		if self._dead then
			return
		end

		local attacker = attacker_unit

		if attacker and attacker:base() and attacker:base().thrower_unit then
			attacker = attacker:base():thrower_unit()
		end

		local dmg_shield, dmg_body, damage = nil

		if death then
			damage = "death"

			dmg_shield = true
			dmg_body = true
		else
			if hit_shield then
				dmg_shield = true
				damage = damage_percent * self._SHIELD_HEALTH_INIT_PERCENT
			else
				damage = damage_percent * self._HEALTH_INIT_PERCENT
				dmg_body = true
			end
		end

		self:_apply_damage(damage, dmg_shield, dmg_body, false, attacker, "fire")

		if not self._dead then
			self._unit:brain():on_damage_received(attacker)
		end
	end

	function SentryGunDamage:sync_damage_explosion(attacker_unit, damage_percent, hit_type, death)
		if self._dead then
			return
		end

		local attacker = attacker_unit

		if attacker and attacker:base() and attacker:base().thrower_unit then
			attacker = attacker:base():thrower_unit()
		end

		if not self._ignore_client_damage and attacker == managers.player:player_unit() and alive(attacker) then
			managers.hud:on_hit_confirmed()
		end

		local dmg_shield, dmg_body, damage = nil

		if death then
			damage = "death"

			dmg_shield = true
			dmg_body = true
		else
			if hit_type == 2 then
				dmg_shield = true
				damage = damage_percent * self._SHIELD_HEALTH_INIT_PERCENT
			else
				damage = damage_percent * self._HEALTH_INIT_PERCENT
				dmg_body = true
			end
		end

		self:_apply_damage(damage, dmg_shield, dmg_body, false, attacker, "explosion")

		if not self._dead then
			self._unit:brain():on_damage_received(attacker)
		end
	end

	function SentryGunDamage:save(save_data)
		local my_save_data = {}
		save_data.char_damage = my_save_data
		my_save_data.ignore_client_damage = self._ignore_client_damage
		my_save_data.health = self._health
		my_save_data.shield_health = self._shield_health
		my_save_data.HEALTH_INIT = self._HEALTH_INIT
		my_save_data.SHIELD_HEALTH_INIT = self._SHIELD_HEALTH_INIT
		my_save_data.shield_smoke_level = self._shield_smoke_level
		my_save_data.char_tweak = tweak_data.weapon[self._unit:base():get_name_id()]
	end

	function SentryGunDamage:load(save_data)
		if not save_data or not save_data.char_damage then
			return
		end

		local my_save_data = save_data.char_damage
		self._ignore_client_damage = my_save_data.ignore_client_damage
		self._health = my_save_data.health
		self._shield_health = my_save_data.shield_health
		self._shield_smoke_level = my_save_data.shield_smoke_level
		self._HEALTH_INIT = my_save_data.HEALTH_INIT
		self._SHIELD_HEALTH_INIT = my_save_data.SHIELD_HEALTH_INIT
		self._HEALTH_INIT_PERCENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
		self._SHIELD_HEALTH_INIT_PERCENT = self._SHIELD_HEALTH_INIT / self._HEALTH_GRANULARITY
		self._char_tweak = my_save_data.char_tweak

		if self._health == 0 then
			self:die()
		end

		if self._shield_smoke_level > 0 then
			self:_make_shield_smoke()
		end
	end

	function SentryGunDamage:melee_hit_sfx()
		return "hit_gen"
	end
end
