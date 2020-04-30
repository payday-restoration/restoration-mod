Hooks:PostHook(SentryGunBase, "post_init", "sentrybase_postinit_repairsentries", function(self)
	self._is_repairing = false
end)

Hooks:PostHook(SentryGunBase, "update", "sentrybase_update_repairsentries", function(self,unit,t,dt)
	if Network:is_server() then --only runs for host anyway
		if self._unit:interaction() then
			self._unit:interaction():set_dirty(true) --allows refreshing repair % progress for host
		end
		if self._removed then return end
	--	if self._removed or not self:get_owner_id() then return end --kool kids only, no swat turrets allowed >:(

		--[[ if afflicted by autumn, extend completion time each frame (i opted for repair cancellation instead)
			self._repair_done_t = self._repair_done_t + dt
		--]]
	
		if self._is_repairing then 
			if self._repair_done_t <= Application:time() then
				self:finish_repairmode()
			end
		end
	end
end)

function SentryGunBase:unregister()
	if self._registered then
		self._registered = nil
	end
end

function SentryGunBase:register()
	self._registered = true
end

function SentryGunBase:is_repairmode()
	return self._is_repairing and true or false
end

function SentryGunBase:on_interaction(dead) --on interaction is the callback for both picking up and repairing sentries. interaction tweak data is set on death event/repair complete event.
--previously, player acquired 0 ammo from dead sentries. now, players must repair sentries before picking them up
	if Network:is_server() then
		if dead then 
			self:start_repairmode()
		else
			SentryGunBase.on_picked_up(self:get_type(), (dead and 0) or self._unit:weapon():ammo_ratio(), self._unit:id())
			self:remove()
		end
	else
		if dead then --send repair request to host; the interaction request itself is identical but i'll keep these separate just in case
			managers.network:session():send_to_host("picked_up_sentry_gun",self._unit)
		else --pick up sentry normally
			managers.network:session():send_to_host("picked_up_sentry_gun", self._unit)
		end
	end
end

function SentryGunBase:start_repairmode() --initiate cosmetic repairs

--	self._unit:interaction():set_dirty(true) --does nothing atm
	
	self._unit:contour():remove("deployable_active")
	self._unit:contour():remove("deployable_interactable")
	self._unit:contour():remove("deployable_selected")
	self._unit:contour():remove("deployable_disabled")
	
	if Network:is_server() then --send start repairmode to clients

		managers.network:session():send_to_peers_synched("sync_player_movement_state",self._unit,"start_repair_eq_sentry",99.99,"420.024")

		local char_damage = self._unit:character_damage()
		
		self._sim_health_init = char_damage:dead() and 0 or char_damage._health
		
		local hp_r = math.max(char_damage:health_ratio(),0.01)
		
		char_damage:update_shield_smoke_level(hp_r,true)
	end
	if self:get_owner_id() == managers.network:session():local_peer():id() then
		--	self._unit:interaction():set_active(false,false) -- normally would disable pickup/repair interaction completely, but i'm keeping it around to display repair progress
	--self._unit:weapon():remove_fire_mode_interaction() --removes firemode toggle interaction, but re-enabling it as client is buggy since this thing here deletes the unit itself
		self._unit:contour():add("highlight")
		self._unit:contour():flash("highlight",tweak_data.equipments.sentry_gun.repair_blink_interval)
		
	end
	self:_start_repairmode()
end
function SentryGunBase:_start_repairmode() --initiate functional repairs
	if not self._is_repairing then 

		self._is_repairing = true

		self._unit:brain():switch_off()

		local char_damage = self._unit:character_damage()
		
		self._sim_health_init = char_damage:dead() and 0 or char_damage._health
		
		local hp_r = math.max(char_damage:health_ratio(),0.01)
		local repair_done_t = math.max(tweak_data.equipments.sentry_gun.repair_time_init * (1-hp_r),tweak_data.equipments.sentry_gun.repair_time_min)
		self._repair_time_total = repair_done_t --only used for preview of repair progress
		self._repair_done_t = Application:time() + repair_done_t
	end
end

function SentryGunBase:finish_repairmode() --complete cosmetic repairs

	if Network:is_server() then --send finish repairmode to clients

		managers.network:session():send_to_peers_synched("sync_player_movement_state",self._unit,"finish_repair_eq_sentry",99.99,"420.024")
	end

	self._unit:contour():remove("deployable_disabled")
	self._unit:contour():remove("highlight")
	self._unit:contour():flash("highlight",false) --any arg2 that is not a positive float removes flash
	
	if self:get_owner_id() == managers.network:session():local_peer():id() then
	
	--local contour_standard = self._unit:contour():standard_contour_id()
	--local contour_ap = self._unit:contour():ap_contour_id()
		local prev_contour = self._unit:weapon()._use_armor_piercing and "deployable_interactable" or "deployable_active"
		self._unit:contour():add(prev_contour)
	end
	self._unit:interaction():set_tweak_data("sentry_gun")
	self._unit:interaction():set_dirty(true)
	
	self:_finish_repairmode()

end

function SentryGunBase:_finish_repairmode() --complete functional repairs

	self._unit:interaction():set_dirty(true)
	
	local char_damage = self._unit:character_damage()
	if char_damage._turret_destroyed_snd then  --this doesn't stop the noise
		char_damage._turret_destroyed_snd:stop()
		char_damage._turret_destroyed_snd = nil
	end
	if self._equip_broken_snd_loop then --this doesn't stop the noise either >:(
		self._equip_broken_snd_loop:stop()
		self._equip_broken_snd_loop = nil
	end
	
	char_damage:update_shield_smoke_level(0)
	char_damage._dead = false
	self._is_repairing = false
	self._repair_done_t = nil
	self._sim_health_init = nil

	if Network:is_server() then
		local armor_amount = tweak_data.upgrades.sentry_gun_base_armor * self._armor_multiplier --todo multiply by modpart hp bonus	
		
		char_damage:set_health(armor_amount or self._HEALTH_INIT,0)
	end
	self._unit:movement():set_active(true)
	self._unit:movement():switch_on()
	
	self._unit:brain():switch_off() --ai permanently "forget" about the sentry without this stuff
	self._unit:brain():switch_on()
	self._unit:brain():set_active(true)

	if self._place_snd_event then --new
		self._unit:sound_source():post_event(self._place_snd_event)
	end		
	
end