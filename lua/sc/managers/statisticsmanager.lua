StatisticsManager.special_unit_ids = {
	"shield",
	"spooc",
	"spooc_gangster",
	"tank",
	"tank_biker",
	"tank_hw",
	"tank_green",
	"tank_black",
	"tank_skull",
	"taser",
	"boom",
	"boom_summers",
	"taser_summers",
	"medic_summers",
	"medic",
	"sniper",
	"phalanx_minion",
	"phalanx_vip",
	"heavy_swat_sniper",
	"weekend_dmr",
	"weekend_lmg",
	"tank_titan",
	"tank_titan_assault",
	"enforcer",
	"enforcer_assault",
	"spring",
	"headless_hatman",
	"summers",
	"omnia_lpf",
	"phalanx_vip_break",
	"hrt_titan",
	"fbi_vet",
	"city_swat_titan",
	"city_swat_titan_assault",
	"swat_turret",
	"biker_boss",
	"chavez_boss",
	"mobster_boss",
	"hector_boss",
	"hector_boss_no_armor",
	"tank_medic",
	"tank_mini",
	"phalanx_minion_assault",
	"spooc_titan",
	"taser_titan",
	"taser_titan_reaper",
	"autumn",
	"marshal_marksman",
	"marshal_shield",
	"snowman_boss",
	"meme_man",
	"meme_man_shield"
}

local old_stats = StatisticsManager.init
function StatisticsManager:init()
	old_stats(self)
	self._defaults.killed.omnia_lpf = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.taser_summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.boom_summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.medic_summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.boom = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_titan_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_black = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_skull = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.tank_medic = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_mini = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.spring = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.headless_hatman = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.summers = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.fbi_vet = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.fbi_swat_vet = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.hrt = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.hrt_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.fbi_female = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.city_swat_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.city_swat_titan_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}				
	self._defaults.killed.heavy_swat_sniper = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.tank_biker = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.biker_guard = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.phalanx_minion_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.spooc_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.taser_titan = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.taser_titan_reaper = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}			
	self._defaults.killed.autumn = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.phalanx_vip_break = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.city_swat_guard = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.gensec_guard = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.spooc_gangster = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.enforcer = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.enforcer_assault = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	--Meme Faction
	self._defaults.killed.meme_man = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
	self._defaults.killed.meme_man_shield = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.dave = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.vetlod = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	--Weekend	
	self._defaults.killed.weekend_dmr = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.weekend = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.weekend_lmg = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}		
	self._defaults.killed.weekend_guard = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	self._defaults.killed.weekend_elite_guard = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}	
		
end

-- if restoration.Options:GetValue("OTHER/PDTHChallenges") then

Hooks:PostHook(StatisticsManager, "stop_session", "PDTHHudstop_session", function(self, data)
    local success = data and data.success
	managers.challenges_res:session_stopped({success = success, from_beginning = self._start_session_from_beginning, drop_in = self._start_session_drop_in, last_session = self._global.last_session})
	managers.challenges_res:reset("session")
end)

Hooks:RegisterHook("StatisticsManagerKilledByAnyone")
Hooks:PostHook(StatisticsManager, "killed_by_anyone", "PDTHHudkilled_by_anyone", function(self, data)
    Hooks:Call("StatisticsManagerKilledByAnyone", self, data)
end)

Hooks:PostHook(StatisticsManager, "killed", "PDTHHudkilled", function(self, data)
    local success, err = pcall(function()
		local by_bullet = data.variant == "bullet"
		local by_melee = data.variant == "melee"
		local by_explosion = data.variant == "explosion"
		if by_bullet then
			local name_id, throwable_id = self:_get_name_id_and_throwable_id(data.weapon_unit)
			self:_bullet_challenges( data )
			--[[if name_id == "sentry_gun" then
				managers.challenges_res:count_up( "sentry_gun_law_row_kills" )
				
				if game_state_machine:last_queued_state_name() == "ingame_waiting_for_respawn" then
					managers.challenges_res:count_up( "grim_reaper" )
				end
			else
				managers.challenges_res:reset_counter( "sentry_gun_law_row_kills" )
			end]]--
		elseif by_melee then
			self:_melee_challenges(data)
			--managers.challenges_res:reset_counter( "sentry_gun_law_row_kills" )
		elseif by_explosion then
			self:_explosion_challenges( data )
            self:_bullet_challenges( data )
			--managers.challenges_res:reset_counter( "sentry_gun_law_row_kills" )
		end
		--[[if self:session_total_law_enforcer_kills() >= 100 then
			managers.challenges_res:set_flag( "civil_disobedience" )
		end
		if data.name == "fbi" then
			self._fbi_kills = self._fbi_kills and self._fbi_kills + 1 or 1
			
			if self._fbi_kills >= 25 then
				managers.challenges_res:set_flag( "federal_crime" )
			end
		else
			self._fbi_kills = 0
		end]]--
	end)
	if not success then
		log("[Error] L92 " .. tostring(err))
	end
end)

function StatisticsManager:_bullet_challenges( data )
	local success, err = pcall(function()
		managers.challenges_res:count_up( data.type )
		managers.challenges_res:count_up( data.name )
		if data.type then
			if data.head_shot then
				managers.challenges_res:count_up( data.type.."_head_shot" )
			else
				managers.challenges_res:count_up( data.type.."_body_shot" )
			end
		end
		--[[if data.attacker_state then
			if data.attacker_state == "bleed_out" then
				local weapon_name_id = data.weapon_unit:base():get_name_id()
				if weapon_name_id ~= "sentry_gun" then
					managers.challenges_res:count_up( "bleed_out_kill" )
					managers.challenges_res:count_up( "bleed_out_multikill" ) -- During one bleed out session
				end
			end
		end]]--
		local name_id
		if data.weapon_unit then
			if data.weapon_unit:base() and data.weapon_unit:base().projectile_entry then
				name_id = tweak_data.blackmarket.projectiles[data.weapon_unit:base():projectile_entry()].weapon_id
			else
				name_id = data.weapon_unit and data.weapon_unit:base().get_name_id and data.weapon_unit:base():get_name_id()
			end
		end

		local weapon_tweak_data
		if data.weapon_unit and data.weapon_unit:base().weapon_tweak_data and data.weapon_unit:base():weapon_tweak_data() then
			weapon_tweak_data = data.weapon_unit:base():weapon_tweak_data()
		else
			weapon_tweak_data = tweak_data.weapon[name_id]
		end

        if name_id then
            managers.challenges_res:count_up( name_id .."_"..data.name.."_kill" )
			managers.challenges_res:count_up( name_id .."_"..data.type.."_kill" )
			if data.head_shot then
				managers.challenges_res:count_up( name_id .."_"..data.type.."_head_shot" )
				managers.challenges_res:count_up( name_id .."_"..data.name.."_head_shot" )
			else
				managers.challenges_res:count_up( name_id .."_"..data.type.."_body_shot" )
				managers.challenges_res:count_up( name_id .."_"..data.name.."_body_shot" )
			end	
        end 
        
		if weapon_tweak_data and weapon_tweak_data.category then
            local category = tweak_data.gui.buy_weapon_category_aliases[weapon_tweak_data.category] and tweak_data.gui.buy_weapon_category_aliases[weapon_tweak_data.category] or weapon_tweak_data.category
			managers.challenges_res:count_up( category .."_"..data.name.."_kill" )
			managers.challenges_res:count_up( category .."_"..data.type.."_kill" )
			if data.head_shot then
				managers.challenges_res:count_up( category .."_"..data.type.."_head_shot" )
				managers.challenges_res:count_up( category .."_"..data.name.."_head_shot" )
			else
				managers.challenges_res:count_up( category .."_"..data.type.."_body_shot" )
				managers.challenges_res:count_up( category .."_"..data.name.."_body_shot" )
			end	
		end
	end)
	if not success then
		log("[Error] L162 " .. tostring(err))
	end
end

function StatisticsManager:_melee_challenges( data )
	if data.type == "law" then
		managers.challenges_res:count_up( "melee_law_kill" )
	end
end


function StatisticsManager:_explosion_challenges(data)
	local success, err = pcall(function()
		--[[if game_state_machine:last_queued_state_name() == "ingame_waiting_for_respawn" then
			managers.challenges_res:count_up("grim_reaper")
		end
		local weapon_id = data.weapon_unit and data.weapon_unit:base().get_name_id and data.weapon_unit:base():get_name_id()
		if weapon_id == "gre_m79" then
			managers.challenges_res:count_up("m79_law_simultaneous_kills")
			if data.name == "shield" or data.name == "spooc" or data.name == "tank" or data.name == "taser" then
				managers.challenges_res:count_up("m79_simultaneous_specials")
			end
		elseif weapon_id == "trip_mine" then
			if data.type == "law" then
				managers.challenges_res:count_up("trip_mine_law_kill")
			end
		end]]--
	end)
	if not success then
		log("[Error] L191 " .. tostring(err))
	end
end

Hooks:PostHook(StatisticsManager, "tied", "PDTHHudtied", function(self, data)
    --[[if data.name == "heavy_swat" then
		managers.challenges_res:set_flag( "intimidating" )
	end
	local type = tweak_data.character[ data.name ] and tweak_data.character[ data.name ].challenges.type
	if type then
		managers.challenges_res:count_up( "tiedown_"..type )
	end
	managers.challenges_res:count_up( "tiedown_"..data.name )]]--
end)

Hooks:PostHook(StatisticsManager, "revived", "PDTHHudrevived", function(self, data)
    --managers.challenges_res:count_up( "revive" )
end)

Hooks:PostHook(StatisticsManager, "downed", "PDTHHuddowned", function(self, data)
    --[[if data.bleed_out then
		managers.challenges_res:reset( "bleed_out" )
	end]]--
end)

function StatisticsManager:session_total_law_enforcer_kills()
	return self._global.session.killed.total.count - self._global.session.killed.civilian.count - self._global.session.killed.civilian_female.count - self._global.session.killed.gangster.count - self._global.session.killed.other.count
end

Hooks:PostHook(StatisticsManager, "use_trip_mine", "PDTHHuduse_trip_mine", function(self)
    managers.challenges_res:count_up("plant_tripmine")
end)

Hooks:PostHook(StatisticsManager, "use_ammo_bag", "PDTHHuduse_ammo_bag", function(self)
    managers.challenges_res:count_up("deploy_ammobag")
end)

Hooks:PostHook(StatisticsManager, "use_doctor_bag", "PDTHHuduse_doctor_bag", function(self)
    managers.challenges_res:count_up("deploy_medicbag")
end)

Hooks:PostHook(StatisticsManager, "use_ecm_jammer", "PDTHHuduse_ecm_jammer", function(self)
    managers.challenges_res:count_up("deploy_ecm")
end)

Hooks:PostHook(StatisticsManager, "use_sentry_gun", "PDTHHuduse_sentry_gun", function(self)
    managers.challenges_res:count_up("deploy_sentry")
end)

Hooks:PostHook(StatisticsManager, "use_first_aid", "PDTHHuduse_first_aid", function(self)
    managers.challenges_res:count_up("deploy_fak")
end)

-- end