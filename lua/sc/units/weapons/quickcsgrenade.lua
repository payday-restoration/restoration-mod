function QuickCsGrenade:_setup_from_tweak_data()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local grenade_entry = self._tweak_projectile_entry or "cs_grenade_quick"
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._radius = self._tweak_data.radius or 300
	self._radius_blurzone_multiplier = self._tweak_data.radius_blurzone_multiplier or 1.3
	self._damage_per_tick = 0.3
	self._stamina_per_tick = 0.0
	if difficulty_index <= 2 then
		self._damage_tick_period = 0.5
	elseif difficulty_index == 3 then
		self._damage_tick_period = 0.45
	elseif difficulty_index == 4 then
		self._damage_tick_period = 0.4
	elseif difficulty_index == 5 then
		self._damage_tick_period = 0.35
	elseif difficulty_index == 6 then
		self._damage_tick_period = 0.3
		self._damage_per_tick = 0.45
	elseif difficulty_index == 7 then
		self._damage_tick_period = 0.3
		self._damage_per_tick = 0.6			
	else
		self._damage_tick_period = 0.25
		self._stamina_per_tick = 2.5
		self._damage_per_tick = 0.75
	end
end


function QuickCsGrenade:_play_sound_and_effects()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)	
	if self._state == 1 then
		local sound_source = SoundDevice:create_source("grenade_fire_source")

		sound_source:set_position(self._shoot_position)
		sound_source:post_event("grenade_gas_npc_fire")
	elseif self._state == 2 then
		local sound_source = SoundDevice:create_source("grenade_bounce_source")

		sound_source:set_position(self._unit:position())
		sound_source:post_event("grenade_gas_bounce")
	elseif self._state == 3 then
		World:effect_manager():spawn({
			effect = Idstring("effects/particles/explosions/explosion_smoke_grenade"),
			position = self._unit:position(),
			normal = self._unit:rotation():y()
		})
		self._unit:sound_source():post_event("grenade_gas_explode")

		local parent = self._unit:orientation_object()
		if difficulty_index == 8 then
			self._smoke_effect = World:effect_manager():spawn({
				effect = Idstring("effects/particles/explosions/cs_grenade_smoke_ds_sc"),
				parent = parent
			})
		else
			self._smoke_effect = World:effect_manager():spawn({
				effect = Idstring("effects/particles/explosions/cs_grenade_smoke_sc"),
				parent = parent
			})			
		end
		local blurzone_radius = self._radius * self._radius_blurzone_multiplier

		managers.environment_controller:set_blurzone(self._unit:key(), 1, self._unit:position(), blurzone_radius, 0, true)
	end
end	

function QuickCsGrenade:_do_damage()
	local player_unit = managers.player:player_unit()

	if player_unit and mvector3.distance_sq(self._unit:position(), player_unit:position()) < self._tweak_data.radius * self._tweak_data.radius then
		local attack_data = {
			damage = self._damage_per_tick,
			col_ray = {
				ray = math.UP
			}
		}

		player_unit:character_damage():damage_killzone(attack_data)

		if self._stamina_per_tick > 0.0 then
			player_unit:movement():subtract_stamina(self._stamina_per_tick)
			player_unit:movement():_restart_stamina_regen_timer()
		end

		if not self._has_played_VO then
			PlayerStandard.say_line(player_unit:sound(), "g42x_any")

			self._has_played_VO = true
		end
	end
end