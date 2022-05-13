--Lets mollies use the "mass_look_up_modifier" stat
function IncendiaryGrenade:_setup_from_tweak_data()
	local grenade_entry = self._tweak_projectile_entry or "molotov"
	local tweak_entry = tweak_data.projectiles[grenade_entry]

	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	
	--No reason to set anything else other than mass_look_up_modifier so no return
	--return tweak_entry
end

function IncendiaryGrenade:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = tweak_data.env_effect:incendiary_fire()
	local tweak = tweak_data.projectiles[self._tweak_projectile_entry] or {}
	-- Why did OVK opt to make separate grenade base for the XM25's incendiaries when they could just do this????
	-- Only added what was needed
	data.damage = tweak.damage or data.damage or 6
	data.player_damage = tweak.player_damage or data.player_damage or 3
	data.burn_duration = tweak.burn_duration or data.burn_duration or 10
	data.sound_event_impact_duration = tweak.sound_event_impact_duration or data.sound_event_impact_duration or 1

	EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, 0, 1)
	self._unit:set_visible(false)

	if Network:is_server() then
		self.burn_stop_time = TimerManager:game():time() + data.burn_duration + data.fire_dot_data.dot_length + 1
	end
end


--fixes for trails
Hooks:PostHook(IncendiaryGrenade, "_detonate", "trailfix", function(self)
	self._unit:body("static_body"):set_fixed()
	self:remove_trail_effect()
end)