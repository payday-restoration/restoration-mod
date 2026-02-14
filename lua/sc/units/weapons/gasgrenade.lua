--Grenades thrown by Grenadiers and Capt. Autumn
--Similar gameplay mechanics to QuickCSGrenader, but these are actually physical projectiles.
-- Ported from HEAT with code changes

GasGrenade = GasGrenade or class(FragGrenade)
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

function GasGrenade:init(unit)
	GasGrenade.super.init(self, unit)

	self._last_damage_tick = 0
	self._has_played_VO = false	
end

-- No idea if this needed 
function GasGrenade:_setup_server_data(...)
	QuickCsGrenade.super._setup_server_data(self, ...)

	self:_setup_from_tweak_data()
end

function GasGrenade:_setup_from_tweak_data()
	local grenade_entry = self._tweak_projectile_entry or "gas_grenade"
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._radius = self._tweak_data.radius or 300
	self._radius_blurzone_multiplier = self._tweak_data.radius_blurzone_multiplier or 1.3
	self._stamina_per_tick = self._tweak_data.stamina_per_tick or 2
	self._no_stamina_damage_mul = self._tweak_data.no_stamina_damage_mul or 2
	self._damage_per_tick = self._tweak_data.damage_per_tick or 0.6
	self._damage_tick_period = self._tweak_data.damage_tick_period or 0.2
	self._timer = self._tweak_data.timer or 1.5
	self._duration = self._tweak_data.duration or 7.5
	self._unit:sound_source():post_event("grenade_gas_npc_fire")	
end

function GasGrenade:_play_detonate_sound_and_effects()
--I have no idea why effects can execute multiple times. This prevent it
	if not self._smoke_effect then
		self:remove_trail_effect()
		World:effect_manager():spawn({
			effect = Idstring("effects/particles/explosions/explosion_smoke_grenade"),
			position = self._unit:position(),
			normal = self._unit:rotation():y()
		})
		self._unit:sound_source():post_event("grenade_gas_explode")
		
		if difficulty_index == 8 then
			self._smoke_effect = World:effect_manager():spawn({
				effect = Idstring("effects/particles/explosions/cs_grenade_smoke_ds_sc"),
				parent = self._unit:orientation_object()
			})
		else
			self._smoke_effect = World:effect_manager():spawn({
				effect = Idstring("effects/particles/explosions/cs_grenade_smoke_sc"),
				parent = self._unit:orientation_object()
			})		
		end

		local blurzone_radius = self._radius * self._radius_blurzone_multiplier

		managers.environment_controller:set_blurzone(self._unit:key(), 1, self._unit:position(), blurzone_radius, 0, true)
	end
end

function GasGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	self:_play_detonate_sound_and_effects()
	self._timer = nil
	self._remove_t = TimerManager:game():time() + self._duration

	--Set grenade to static to ensure no possible movement at all.
	for i = 1, self._unit:num_bodies() - 1 do
	    local body = self._unit:body(i)

	    if body:dynamic() then
	        body:set_keyframed()
	    end
	end
end

function GasGrenade:bullet_hit()
end

function GasGrenade:update(unit, t, dt)
	if self._remove_t and self._remove_t < t then
		self._unit:set_slot(0)
	end

	if self._timer then
		self._timer = self._timer - dt
		if self._timer <= 0 and mvector3.length(self._unit:body("static_body"):velocity()) < 1 then
			self._timer = nil
			self:_detonate()
		end
		
		ProjectileBase.update(self, unit, t, dt)
		if t > self._last_damage_tick + self._damage_tick_period then
			self._last_damage_tick = t
			self:_do_damage()
		end
	end
end

function GasGrenade:destroy()
	if self._smoke_effect then
		World:effect_manager():fade_kill(self._smoke_effect)
	end

	managers.environment_controller:set_blurzone(self._unit:key(), 0)
end

function GasGrenade:_do_damage()
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