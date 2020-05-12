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