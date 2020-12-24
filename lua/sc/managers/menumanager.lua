restoration._cop_comment_cooldown_t = {}

--Fix for Grenade Cases on Pro Jobs
function MenuPrePlanningInitiator:set_locks_to_param(params, key, index)
	local data = tweak_data:get_raw_value("preplanning", key, index) or {}
	local enabled = params.enabled ~= false
	params.tooltip = params.tooltip or {}
	params.tooltip.errors = params.tooltip.errors or {}

	if data.dlc_lock and not Global.game_settings and Global.game_settings.one_down then
		local dlc_unlocked = managers.dlc:is_dlc_unlocked(data.dlc_lock)

		if not dlc_unlocked then
			local error_text_id = tweak_data:get_raw_value("lootdrop", "global_values", data.dlc_lock, "unlock_id")

			table.insert(params.tooltip.errors, managers.localization:to_upper_text(error_text_id))

			enabled = false
		end
	elseif data.upgrade_lock then
		local upgrade_unlocked = managers.player:has_category_upgrade(data.upgrade_lock.category, data.upgrade_lock.upgrade)

		if not upgrade_unlocked then
			table.insert(params.tooltip.errors, managers.localization:to_upper_text("menu_asset_lock_" .. data.upgrade_lock.upgrade))

			enabled = false
		end
	end

	params.enabled = enabled
	params.ignore_disabled = true
end

--Allow Chat in Crime.net Offline
function MenuManager:toggle_chatinput()
	if Application:editor() or SystemInfo:platform() ~= Idstring("WIN32") or self:active_menu() or not managers.network:session() then
		return
	end
	if managers.hud then
		managers.hud:toggle_chatinput()
		return true
	end
end	

function MenuJukeboxHeistTracks:modify_node(node, data)
	managers.menu_component:show_contract_character(false)
	node:clean_items()

	local track_list, track_locked = managers.music:jukebox_music_tracks()
	local option_data = {
		type = "MenuItemMultiChoiceWithIcon"
	}

	table.insert(option_data, {
		value = "all",
		text_id = "menu_jukebox_playlist_all",
		_meta = "option"
	})
	table.insert(option_data, {
		value = "playlist",
		text_id = "menu_jukebox_random_heist_playlist",
		_meta = "option"
	})

	for _, track_name in pairs(track_list) do
		if not track_locked[track_name] then
			table.insert(option_data, {
				_meta = "option",
				text_id = "menu_jukebox_" .. track_name,
				value = track_name
			})
		end
	end

	local track_list = {}
	local unique_jobs = {}

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local job_tweak = tweak_data.narrative:job_data(job_id)

		if self:_have_music(job_id) and not table.contains(unique_jobs, job_tweak.name_id) then
			local text_id, color_ranges = tweak_data.narrative:create_job_name(job_id, true)
			local days = #tweak_data.narrative:job_chain(job_id)

			table.insert(unique_jobs, job_tweak.name_id)

			if days > 1 then
				for i = 1, days, 1 do
					table.insert(track_list, {
						job_id = job_id,
						name_id = job_tweak.name_id,
						day = i,
						sort_id = text_id,
						text_id = text_id .. " - " .. managers.localization:text("menu_jukebox_heist_day", {
							day = i
						}),
						color_ranges = color_ranges
					})
				end
			else
				table.insert(track_list, {
					job_id = job_id,
					name_id = job_tweak.name_id,
					sort_id = text_id,
					text_id = text_id,
					color_ranges = color_ranges
				})
			end
		end
	end

	table.sort(track_list, function (x, y)
		return x.sort_id == y.sort_id and x.text_id < y.text_id or x.sort_id < y.sort_id
	end)
	table.insert(track_list, {
		name_id = "escape",
		job_id = "escape",
		text_id = managers.localization:text("menu_jukebox_heist_escape")
	})
	table.insert(track_list, {
		name_id = "ponr",
		job_id = "ponr",
		text_id = managers.localization:text("menu_jukebox_heist_ponr")
	})

	for _, track_data in pairs(track_list) do
		local heist_name = track_data.name_id .. (track_data.day and track_data.day or "")
		local params = {
			localize = "false",
			align = "left",
			callback = "jukebox_option_heist_tracks",
			text_offset = 100,
			name = heist_name,
			text_id = track_data.text_id,
			color_ranges = track_data.color_ranges,
			heist_job = track_data.job_id,
			heist_days = track_data.day,
			icon = tweak_data.hud_icons:get_icon_data("jukebox_playing_icon")
		}
		local item = node:create_item(option_data, params)

		item:set_value(managers.music:track_attachment(heist_name) or "all")
		node:add_item(item)
	end

	managers.menu:add_back_button(node)

	return node
end

function MenuCallbackHandler:jukebox_option_heist_tracks(item)
	local track = item:value()
	local job = item:parameters().heist_job

	if job == "escape" or job == "ponr" then
		managers.music:track_attachment_add(job, track)
	else
		local job_tweak = tweak_data.narrative.jobs[job]

		if not job_tweak then
			return
		end

		local day = item:parameters().heist_days and item:parameters().heist_days or ""

		managers.music:track_attachment_add(job_tweak.name_id .. day, track)
	end

	local item_list = managers.menu:active_menu().logic:selected_node():items()

	for _, item_data in ipairs(item_list) do
		if item_data.set_icon_visible then
			item_data:set_icon_visible(false)
		end
	end

	if track ~= "all" and track ~= "playlist" then
		managers.music:track_listen_start("music_heist_assault", track)
		item:set_icon_visible(true)
	else
		managers.music:track_listen_stop()
	end

	managers.savefile:setting_changed()
end

function restoration:_game_t()
	return TimerManager:game():time()
end

function restoration:start_inform_ene_cooldown(cooldown_t, msg_type)
	local t = self:_game_t()
	self._cop_comment_cooldown_t[msg_type] = self._cop_comment_cooldown_t[msg_type] or {}
	self._cop_comment_cooldown_t[msg_type]._cooldown_t = cooldown_t + t
	self._cooldown_delay_t = t + 5
end

function restoration:ene_inform_has_cooldown_met(msg_type)
	local t = TimerManager:game():time()
	
	if not self._cop_comment_cooldown_t[msg_type] then
		return true
	end
	
	if self._cooldown_delay_t and self._cooldown_delay_t > t then
		return false
	end
	
	if self._cop_comment_cooldown_t[msg_type]._cooldown_t < t then
		return true
	end
	
	return false
end


function restoration:_has_deployable_type(unit, deployable)
	local peer_id = managers.criminals:character_peer_id_by_unit(unit)
	if not peer_id then
		return false
	end
	
	local synced_deployable_equipment = managers.player:get_synced_deployable_equipment(peer_id)
	
	if synced_deployable_equipment then
	
		if not synced_deployable_equipment.deployable or synced_deployable_equipment.deployable ~= deployable then
			return false
		end
		
		--[[if synced_deployable_equipment.amount and synced_deployable_equipment.amount <= 0 then
			return false
		end]]--
		
		
		return true		
	end
	
	return false
end

function restoration:_next_to_cops(data, amount)
	local close_peers = {}
	local range = 5000
	amount = amount or 4
	for u_key, u_data in pairs(managers.enemy:all_enemies()) do
		if data.key ~= u_key then
			if u_data.unit and alive(u_data.unit) and not u_data.unit:character_damage():dead() then
				local anim_data = u_data.unit:anim_data()
				if not anim_data.surrender and not anim_data.hands_tied and not anim_data.hands_back then
					if mvector3.distance_sq(data.m_pos, u_data.m_pos) < range * range then
						table.insert(close_peers, u_data.unit)
					end
				end
			end
		end
	end
	return #close_peers >= amount
end

function restoration:inform_law_enforcements(data, debug_enemy)
	if managers.groupai:state()._special_unit_types[data.unit:base()._tweak_table] then
		return
	end
	if data.unit:in_slot(16) or not data.char_tweak.chatter then
		return
	end
	
	local sound_name, cooldown_t, msg_type
	local enemy_target = data.attention_obj
	
	if debug_enemy then
		enemy_target = {
			unit = debug_enemy,
			dis = 0,
			is_deployable = false
		}	
	end
	
	if enemy_target then
		if enemy_target.is_deployable then
			msg_type = "sentry_detected"
			sound_name = "ch2"
			cooldown_t = 30
		elseif enemy_target.unit:in_slot(managers.slot:get_mask("all_criminals")) then
			local weapon = enemy_target.unit.inventory and enemy_target.unit:inventory():equipped_unit()
			if weapon and weapon:base():is_category("saw") then
				msg_type = "saw_maniac"
				sound_name = "ch4"
				cooldown_t = 30
			elseif self:_has_deployable_type(enemy_target.unit, "doctor_bag") then
				msg_type = "doc_bag"
				sound_name = "med"
				cooldown_t = 30
				--log("they have a medic >:c")
			elseif self:_has_deployable_type(enemy_target.unit, "first_aid_kit") then
				msg_type = "first_aid_kit"
				sound_name = "med"
				cooldown_t = 30
				--log("they have a medic >:c")
			elseif self:_has_deployable_type(enemy_target.unit, "ammo_bag") then
				msg_type = "ammo_bag"
				sound_name = "amm"
				cooldown_t = 30
				--log("they have an ammy bag")
			elseif self:_has_deployable_type(enemy_target.unit, "trip_mine") then
				msg_type = "trip_mine"
				sound_name = "ch1"
				cooldown_t = 30
				--log("watch out for the trip mines")
			end
		end
	end
	
	if self:_next_to_cops(data) then
		return
	end
	
	if not enemy_target or enemy_target.dis > 100000 then
		return
	end
	
	if not msg_type or not self:ene_inform_has_cooldown_met(msg_type) then
		return
	end
	
	if data.unit then
		data.unit:sound():say(sound_name, true)
		self:start_inform_ene_cooldown(cooldown_t, msg_type)
	end
end

--[[
Hooks:Add("radialmenu_released_resutilitymenu","resmod_utility_menu_on_selected",function(item)
	if item == 1 then 
				
		local loss_rate = 0.0
		local placement_cost = 0.3
		local ammo_ratio_taken = 0
		local player = managers.player:local_player()
		if player and alive(player) then 
			for index, weapon in pairs(player:inventory():available_selections()) do
				local ammo_taken = weapon.unit:base():remove_ammo(1 - placement_cost)
				ammo_ratio_taken = ammo_ratio_taken + (ammo_taken / weapon.unit:base():get_ammo_max())
--					Log("ammo_ratio_taken: " .. ammo_ratio_taken)
			
				managers.hud:set_ammo_amount(index, weapon.unit:base():ammo_info())
				
			end
			local pos = player:position()
			
			local angle = player:movement():m_head_rot():y()
			local rot = Rotation(angle, angle, 0)
			
			local ammo_upgrade_lvl = 0 --managers.player:upgrade_level("ammo_bag", "ammo_increase")
			local bullet_storm_level = 0 -- managers.player:upgrade_level("player", "no_ammo_cost")

			local function concat(div,...) --yeah that's right i'm too good for table.concat
				local result
				for _,value in pairs({...}) do
					if result then 
						result = result .. div .. tostring(value)
					else
						result = tostring(value)
					end
				end
				return result
			end
			if Network:is_client() then
--						managers.network:session():send_to_host("place_ammo_bag", pos, rot, ammo_upgrade_lvl, bullet_storm_level)
				--use networking instead
				
				LuaNetworking:SendToPeer(1,"restoration_drop_ammo",concat(":",pos.x,pos.y,pos.z,rot:x(),rot:y(),rot:z(),ammo_ratio_taken))
			else
			
				local unit = AmmoBagBase.spawn(pos, rot, ammo_upgrade_lvl, managers.network:session():local_peer():id(), bullet_storm_level)
				unit:base()._ammo_amount = math.floor(math.min(ammo_ratio_taken,placement_cost) * (1 - loss_rate) * 100) / 100
				local current_amount = unit:base()._ammo_amount
				unit:base():_set_visual_stage()
				managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", unit, current_amount - ammo_ratio_taken)
--					Log("amount: " .. tostring(unit:base()._ammo_amount))
--					LuaNetworking:SendToPeer(1,"restoration_drop_ammo",concat(":",pos.x,pos.y,pos.z,rot:yaw(),rot:pitch(),rot:roll(),ammo_ratio_taken))
				
			end
		elseif item == 2 or item == 3 then 
			local equipped_deployable = managers.blackmarket:equipped_deployable()
			if equipped_deployable == "tripmines" then 
--					Log("Equipped tripmines")
			elseif equipped_deployable == "sentry_gun" then 
--					Log("Equipped sentrygun")
			end
		end
	end
end)
]]

-- if restoration.Options:GetValue("OTHER/PDTHChallenges") then

Hooks:PostHook(MenuManager, "do_clear_progress", "pdth_hud_reset_challenges", function(ply)
	managers.challenges_res:reset_challenges()
end)

-- end

function MenuCallbackHandler:accept_skirmish_contract(item)
    local node = item:parameters().gui_node.node

    managers.menu:active_menu().logic:navigate_back(true)
    managers.menu:active_menu().logic:navigate_back(true)

    local job_id = (node:parameters().menu_component_data or {}).job_id
    local job_data = {
        difficulty = "sm_wish",
        customize_contract = true,
        job_id = job_id or managers.skirmish:random_skirmish_job_id(),
        difficulty_id = tweak_data:difficulty_to_index("sm_wish")
    }

    managers.job:on_buy_job(job_data.job_id, job_data.difficulty_id)

    if Global.game_settings.single_player then
        MenuCallbackHandler:start_single_player_job(job_data)
    else
        MenuCallbackHandler:start_job(job_data)
    end
end

function MenuCallbackHandler:accept_skirmish_weekly_contract(item)
    managers.menu:active_menu().logic:navigate_back(true)
    managers.menu:active_menu().logic:navigate_back(true)

    local weekly_skirmish = managers.skirmish:active_weekly()
    local job_data = {
        difficulty = "sm_wish",
        weekly_skirmish = true,
        job_id = weekly_skirmish.id
    }

    if Global.game_settings.single_player then
        MenuCallbackHandler:start_single_player_job(job_data)
    else
        MenuCallbackHandler:start_job(job_data)
    end
end

function MenuCallbackHandler:choice_state_filter(item)
	local state_filter = item:value()
	if managers.network.matchmake:get_lobby_filter("state") == state_filter then
		return
	end
	managers.network.matchmake:add_lobby_filter("state", state_filter, "equal")
	managers.network.matchmake:search_lobby(managers.network.matchmake:search_friends_only())
end

function MenuSTEAMHostBrowser:add_filter(node)
	if node:item("server_filter") then
		return
	end
	
	local params = {
		name = "job_id_filter",
		text_id = "menu_job_id_filter",
		visible_callback = "is_multiplayer is_win32",
		callback = "choice_job_id_filter",
		filter = true
	}
	local data_node = {
		type = "MenuItemMultiChoice",
		{
			_meta = "option",
			text_id = "menu_any",
			value = -1
		}
	}
	for index, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		if not tweak_data.narrative.jobs[job_id].wrapped_to_job and tweak_data.narrative.jobs[job_id].contact ~= "wip" then
			local text_id, color_data = tweak_data.narrative:create_job_name(job_id)
			local params = {
				_meta = "option",
				text_id = text_id,
				value = index,
				localize = false
			}
			for count, color in ipairs(color_data) do
				params["color" .. count] = color.color
				params["color_start" .. count] = color.start
				params["color_stop" .. count] = color.stop
			end
			table.insert(data_node, params)
		end
	end
	local new_item = node:create_item(data_node, params)
	new_item:set_value(managers.network.matchmake:get_lobby_filter("job_id") or -1)
	node:add_item(new_item)
	
	local params = {
		name = "server_filter",
		text_id = "menu_dist_filter",
		help_id = "menu_dist_filter_help",
		callback = "choice_distance_filter",
		filter = true
	}
	local data_node = {
		type = "MenuItemMultiChoice",
		{
			_meta = "option",
			text_id = "menu_dist_filter_close",
			value = 1
		},
		{
			_meta = "option",
			text_id = "menu_dist_filter_far",
			value = 2
		},
		{
			_meta = "option",
			text_id = "menu_dist_filter_worldwide",
			value = 3
		}
	}
	local new_item = node:create_item(data_node, params)
	new_item:set_value(managers.network.matchmake:distance_filter())
	node:add_item(new_item)
	
	local params = {
		name = "difficulty_filter",
		text_id = "menu_diff_filter",
		help_id = "menu_diff_filter_help",
		callback = "choice_difficulty_filter",
		filter = true
	}
	local data_node = {
		type = "MenuItemMultiChoice",
		{
			_meta = "option",
			text_id = "menu_all",
			value = -1
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_normal",
			value = 2
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_hard",
			value = 3
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_very_hard",
			value = 4
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_overkill",
			value = 5
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_easy_wish",
			value = 6
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_apocalypse",
			value = 7
		},
		{
			_meta = "option",
			text_id = "menu_difficulty_sm_wish",
			value = 8
		}
	}
	local new_item = node:create_item(data_node, params)
	new_item:set_value(managers.network.matchmake:difficulty_filter())
	node:add_item(new_item)
	
	local params = {
		name = "max_lobbies_filter",
		text_id = "menu_max_lobbies_filter",
		help_id = "menu_max_lobbies_filter_help",
		callback = "choice_max_lobbies_filter",
		filter = true
	}
	local data_node = {
		type = "MenuItemMultiChoice",
		{
			_meta = "option",
			text_id = "30",
			value = 30,
			localize = false
		},
		{
			_meta = "option",
			text_id = "40",
			value = 40,
			localize = false
		},
		{
			_meta = "option",
			text_id = "50",
			value = 50,
			localize = false
		}
	}
	local new_item = node:create_item(data_node, params)
	new_item:set_value(managers.network.matchmake:get_lobby_return_count())
	node:add_item(new_item)
	
	local params = {
		name = "state_filter",
		text_id = "menu_state_filter",
		help_id = "menu_state_filter_help",
		callback = "choice_state_filter",
		filter = true
	}
	local data_node = {
		type = "MenuItemMultiChoice",
		
		{
			_meta = "option",
			text_id = "menu_all",
			value = -1
		},
		{
			_meta = "option",
			text_id = "menu_state_lobby",
			value = 1
		},
		{
			_meta = "option",
			text_id = "menu_state_loading",
			value = 2
		},
		{
			_meta = "option",
			text_id = "menu_state_ingame",
			value = 3
		}
	}
	local new_item = node:create_item(data_node, params)
	new_item:set_value(managers.network.matchmake:get_lobby_filter("state"))
	node:add_item(new_item)
	
	local params = {
		name = "job_plan_filter",
		text_id = "menu_preferred_plan",
		help_id = "menu_preferred_plan_help",
		callback = "choice_job_plan_filter",
		filter = true
	}
	local data_node = {
		type = "MenuItemMultiChoice",
		{
			_meta = "option",
			text_id = "menu_any",
			value = -1
		},
		{
			_meta = "option",
			text_id = "menu_plan_loud",
			value = 1
		},
		{
			_meta = "option",
			text_id = "menu_plan_stealth",
			value = 2
		}
	}
	local new_item = node:create_item(data_node, params)
	new_item:set_value(managers.network.matchmake:get_lobby_filter("job_plan"))
	node:add_item(new_item)
end

function MenuSTEAMHostBrowser:refresh_node(node, info, friends_only)
	local new_node = node
	if not friends_only then
		self:add_filter(new_node)
	end
	if not info then
		managers.menu:add_back_button(new_node)
		return new_node
	end
	local room_list = info.room_list
	local attribute_list = info.attribute_list
	local dead_list = {}
	for _, item in ipairs(node:items()) do
		if not item:parameters().back and not item:parameters().filter and not item:parameters().pd2_corner then
			dead_list[item:parameters().room_id] = true
		end
	end
	for i, room in ipairs(room_list) do
		local name_str = tostring(room.owner_name)
		local attributes_numbers = attribute_list[i].numbers
		if managers.network.matchmake:is_server_ok(friends_only, room.owner_id,  attribute_list[i]) then
			dead_list[room.room_id] = nil
			local host_name = name_str
			local level_id = tweak_data.levels:get_level_name_from_index(attributes_numbers[1] % 1000)
			local name_id = level_id and tweak_data.levels[level_id] and tweak_data.levels[level_id].name_id
			local level_name = name_id and managers.localization:text(name_id) or "LEVEL NAME ERROR"
			local job_id = tweak_data.narrative:get_job_name_from_index(math.floor(attributes_numbers[1] / 1000))
			local job_name = job_id and managers.localization:text(tweak_data.narrative.jobs[job_id].name_id) or "JOB NAME ERROR"
			local difficulties = {
				"easy",
				"normal",
				"hard",
				"very_hard",
				"overkill",
				"easy_wish",
				"apocalypse",
				"sm_wish"
			}
			local difficulty = difficulties[attributes_numbers[2]] or "error"
			local state_string_id = tweak_data:index_to_server_state(attributes_numbers[4])
			local state_name = state_string_id and managers.localization:text("menu_lobby_server_state_" .. state_string_id) or "blah"
			local state = attributes_numbers[4]
			local num_plrs = attributes_numbers[5]
			local new_name = job_name .. ((level_name ~= job_name) and " (" .. level_name .. ")" or "") 
			local item = new_node:item(room.room_id)
			if not item then
				print("ADD", name_str)
				local params = {
					name = room.room_id,
					text_id = name_str,
					room_id = room.room_id,
					columns = {
						utf8.to_upper(host_name),
						utf8.to_upper(new_name),
						utf8.to_upper(state_name),
						tostring(num_plrs) .. "/4 "
					},
					level_name = level_id,
					real_level_name = new_name,
					level_id = level_id,
					state_name = state_name,
					difficulty = difficulty,
					host_name = host_name,
					state = state,
					num_plrs = num_plrs,
					callback = "connect_to_lobby",
					localize = "false"
				}
				local new_item = new_node:create_item({
					type = "ItemServerColumn"
				}, params)
				new_node:add_item(new_item)
			else
				if item:parameters().real_level_name ~= new_name then
					item:parameters().columns[2] = utf8.to_upper(new_name)
					item:parameters().level_name = level_id
					item:parameters().level_id = level_id
					item:parameters().real_level_name = new_name
				end
				if item:parameters().state ~= state then
					item:parameters().columns[3] = state_name
					item:parameters().state = state
					item:parameters().state_name = state_name
				end
				if item:parameters().difficulty ~= difficulty then
					item:parameters().difficulty = difficulty
				end
				if item:parameters().room_id ~= room.room_id then
					item:parameters().room_id = room.room_id
				end
				if item:parameters().num_plrs ~= num_plrs then
					item:parameters().num_plrs = num_plrs
					item:parameters().columns[4] = tostring(num_plrs) .. "/4 "
				end
			end
		end
	end
	for name, _ in pairs(dead_list) do
		new_node:delete_item(name)
	end
	managers.menu:add_back_button(new_node)
	return new_node
end