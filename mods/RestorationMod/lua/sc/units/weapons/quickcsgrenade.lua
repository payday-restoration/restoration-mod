if SC and SC._data.sc_ai_toggle or restoration and restoration.Options:GetValue("SC/SC") then

function QuickCsGrenade:_setup_from_tweak_data()
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	local grenade_entry = self._tweak_projectile_entry or "cs_grenade_quick"
	self._tweak_data = tweak_data.projectiles[grenade_entry]
	self._radius = self._tweak_data.radius or 300
	self._radius_blurzone_multiplier = self._tweak_data.radius_blurzone_multiplier or 1.3
	if difficulty_index <= 2 then
		self._damage_tick_period = 0.55
	elseif difficulty_index == 3 then
		self._damage_tick_period = 0.5
	elseif difficulty_index == 4 then
		self._damage_tick_period = 0.45
	elseif difficulty_index == 5 then
		self._damage_tick_period = 0.4
	elseif difficulty_index == 6 then
		self._damage_tick_period = 0.35
	elseif difficulty_index == 7 then
		self._damage_tick_period = 0.35
	else
		self._damage_tick_period = 0.3
	end
	self._damage_per_tick = 0
end

end