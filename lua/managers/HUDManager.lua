local _setup_player_info_hud_pd2_original = HUDManager._setup_player_info_hud_pd2

HUDManager = HUDManager or class()
HUDManager.WAITING_SAFERECT = Idstring("guis/waiting_saferect")
HUDManager.STATS_SCREEN_SAFERECT = Idstring("guis/stats_screen/stats_screen_saferect_pd2")
HUDManager.STATS_SCREEN_FULLSCREEN = Idstring("guis/stats_screen/stats_screen_fullscreen")
HUDManager.WAITING_FOR_PLAYERS_SAFERECT = Idstring("guis/waiting_saferect")
HUDManager.ASSAULT_DIALOGS = {
	"b01a",
	"b01b",
	"b02a",
	"b02b",
	"b02c",
	"b03x",
	"b04x",
	"b05x",
	"b10",
	"b11",
	"b12"
}
HUDManager.ASSAULTS_MAX = 1024

core:import("CoreEvent")
function HUDManager:_setup_player_info_hud_pd2(...)
	self:_create_level_suspicion_hud(managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2))
	_setup_player_info_hud_pd2_original(self,...)
	self._dodge_meter = HUDDodgeMeter:new((managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)))
	self._skill_list = HUDSkill:new((managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)))
	self._effect_screen = HUDEffectScreen:new((managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)))
		--managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2).panel
		--[[
--setup radial mouse menu
	local ammo_texture,ammo_rect = tweak_data.hud_icons:get_icon_data("equipment_ammo_bag")
	local sentry_texture,sentry_rect = tweak_data.hud_icons:get_icon_data("equipment_sentry")
	local tripmine_texture,tripmine_rect = tweak_data.hud_icons:get_icon_data("equipment_trip_mine")
	local utility_params = {
		name = "resutilitymenu",
		deadzone = 10,
		items = {
			{
				text = "Drop Excess Ammo",
				icon = {
					name = "ammo",
					texture = ammo_texture,
					texture_rect = ammo_rect
				}
			},
			{
				text = "Deployable Control",
					icon = {
					name = "sentrygun",
					texture = sentry_texture,
					texture_rect = sentry_rect
				}
			},
			{
				text = "Deployable Control 2",
				icon = {
					name = "tripmine",
					texture = tripmine_texture,
					texture_rect = tripmine_rect
				}
			}
		}
	}
	restoration._utilitymenu = RadialMouseMenu:new(utility_params)	
	]]
end


local NUM_SUSPICION_EFFECT_GHOSTS = 3

function HUDManager:_upd_animate_level_suspicion(t,amount,amount_max,amount_interpolated,is_whisper_mode)
	--got me thinking, do we want a noise indicator? one that plays when you perform an action that makes noise, whether by main hud item or by waypoint
	if not (amount and amount_max) then
		return
	end
	local panel = self._level_suspicion_panel
	if not panel then 
		return
	end
	if not (panel:visible() or is_whisper_mode) then 
		return
	end
	if is_whisper_mode then 
		if not panel:visible() then 
			panel:show()
		end 
		if panel:alpha() < 1 then 
			panel:set_alpha(math.min(math.abs(panel:alpha()) * 1.1,1))
		end
	else
		panel:set_alpha(panel:alpha() * 0.9)
		if panel:alpha() <= 0.01 then 
			panel:hide()
		end
	end
	
	local function interp_colors(one,two,percent) --interpolates colors based on a percentage
	--percent is [0,1]
		percent = math.clamp(percent,0,1)
		
	--color 1
		local r1 = one.red
		local g1 = one.green
		local b1 = one.blue
		
	--color 2
		local r2 = two.red
		local g2 = two.green
		local b2 = two.blue

	--delta
		local r3 = r2 - r1
		local g3 = g2 - g1
		local b3 = b2 - b1
		
		return Color(r1 + (r3 * percent),g1 + (g3 * percent), b1 + (b3 * percent))	
	end
	
	local base_icon_alpha = 0.5
	local ratio = math.min(1,amount/amount_max)
	local ratio_color = interp_colors(Color("45B5FF"),Color("FF6138"),ratio) --blue to red
	local suspicion_icon = panel:child("suspicion_icon")
	suspicion_icon:set_color(ratio == 0 and Color(0.5,0.5,0.5) or ratio_color)
	panel:child("suspicion_interp"):set_color(Color(amount_interpolated/amount_max,0,0))
	suspicion_icon:set_alpha(ratio + base_icon_alpha)
	panel:child("suspicion_circle"):set_color(Color(ratio,0,0)) --progress radial
	local alert_on = amount >= amount_max
	
	if alert_on then
		--not limited to a maximum of 1
		suspicion_icon:set_image("guis/textures/restoration/crimewar_skull_2")
		local interval = 2
		local time_scale = 1
		local icon_size = 32
		for i=1,NUM_SUSPICION_EFFECT_GHOSTS,1 do 
			local ghost = panel:child("suspicion_ghost_" .. tostring(i))
			if ghost then 
				local t_adjusted = time_scale * (t + (i / (NUM_SUSPICION_EFFECT_GHOSTS * interval)))
				local progress = 1 - (math.cos((90 * (t_adjusted % 1))))

				--raw equation: let a=2,b=0.5; y = 1/a - (cosine(modulo(x*b,1)*pi)/a)

				local new_w = icon_size * (progress + 1)
				local new_h = icon_size * (progress + 1)
				ghost:set_image("guis/textures/restoration/crimewar_skull_2")
				ghost:set_w(new_w)
				ghost:set_h(new_h)
				ghost:set_color(ratio_color)
				ghost:set_alpha(1 - progress)
				ghost:set_center(panel:center())
			end
		end
	end
	if ratio > 0 then 
		panel:child("suspicion_bg"):set_alpha(0.5)
	end
end

function HUDManager:_create_level_suspicion_hud(hud)
	local hud_panel = hud.panel
	local level_suspicion_panel = hud_panel:panel({
		name = "level_suspicion_panel",
		y = -(hud_panel:parent():h() / 6),
		alpha = Network:is_server() and 0.0001 or 1,
		visible = not Network:is_server()
	}) 
	--yeah i can't seem to change the size of this thing from its parent's without breaking its center() and its children's set_center()
	local icon_texture = "guis/textures/restoration/crimewar_skull" -- or "guis/textures/pd2/cn_minighost" or "guis/textures/pd2/hud_stealth_alarm01" or "guis/textures/pd2/hud_stealth_eye"
	local radial_texture = "guis/textures/pd2/hud_rip"
	local icon_size = 32
	local radial_size = 128
	
	self._level_suspicion_panel = level_suspicion_panel
	local suspicion_circle = level_suspicion_panel:bitmap({ --circle outline progress; set instantly
		name = "suspicion_circle",
		render_template = "VertexColorTexturedRadial",
		texture = radial_texture, -- "guis/dlcs/coco/textures/pd2/hud_absorb_shield", --for soft blue outline instead
		color = Color.black, --starts out invisible
		alpha = 0.5,
		layer = 3,
		w = radial_size,
		h = radial_size
	})
	local suspicion_interp = level_suspicion_panel:bitmap({ --circle outline progress.
		name = "suspicion_interp",
		render_template = "VertexColorTexturedRadial",
		texture = radial_texture,
		color = Color.black,
		alpha = 1,
		layer = 2,
		w = radial_size,
		h = radial_size
	})
	local suspicion_bg = level_suspicion_panel:bitmap({ --circle outline bg
		name = "suspicion_bg",
		texture = radial_texture,
		color = Color.black,
		alpha = 0.25,
		layer = 1,
		w = radial_size,
		h = radial_size
	})
	
	local suspicion_icon = level_suspicion_panel:bitmap({
		name = "suspicion_icon",
		texture = icon_texture,
		color = Color.white,
		alpha = 0, --set dynamically
		layer = 4,
		x = (level_suspicion_panel:w() - icon_size) / 2,
		y = (level_suspicion_panel:h() - icon_size) / 2,
		w = icon_size,
		h = icon_size
	})
	if restoration:all_enabled("HUD/MainHUD", "HUD/Stealth") then 
		if restoration.Options:GetValue("HUD/Extra/StealthOrigPos") then 
			--level_suspicion_panel:move(21,30)
		else
			--level_suspicion_panel:set_center(hud_panel:parent():w() / 2, hud_panel:parent():h() / 6)
		end
	end
	local center_x,center_y = level_suspicion_panel:center()
	suspicion_circle:set_center(center_x,center_y)
	suspicion_interp:set_center(center_x,center_y)
	suspicion_bg:set_center(center_x,center_y)
	suspicion_icon:set_center(center_x,center_y)
	for i=1,NUM_SUSPICION_EFFECT_GHOSTS,1 do 
		local suspicion_ghost = level_suspicion_panel:bitmap({
			name = "suspicion_ghost_" .. tostring(i),
			texture = icon_texture,
			color = Color.white,
			blend_mode = "add",
			alpha = 0, --set dynamically
			layer = 4 + i,
			w = icon_size,
			h = icon_size
		})
		suspicion_ghost:set_center(center_x,center_y)
	end
	
end

--Just in case
function HUDManager:check_anticipation_voice(t)
	if not self._anticipation_dialogs or self._anticipation_dialogs and not self._anticipation_dialogs[1] then
		return
	end

	if self._anticipation_dialogs and t < self._anticipation_dialogs[1].time then
		local data = table.remove(self._anticipation_dialogs, 1)

		self:sync_assault_dialog(data.dialog)
		managers.network:session():send_to_peers_synched("sync_assault_dialog", data.dialog)
	end
end

function HUDManager:set_dodge_value(value)
	--Sends current dodge meter level and players dodge stat to the dodge panel in HUDtemp.lua
	self._dodge_meter:set_dodge_value(value)
end

function HUDManager:unhide_dodge_panel(dodge_points)
	self._dodge_meter:unhide_dodge_panel(dodge_points)
end

function HUDManager:activate_effect_screen(duration, color, use_alt)
	--Apply the effect screen with a color over a duration.
	if use_alt then
		self._effect_screen:do_effect_screen_alt(duration, color)
	else
		self._effect_screen:do_effect_screen(duration, color)
	end
end

--Functions to interface with the buff tracker.
function HUDManager:add_skill(name)
	if restoration.Options:GetValue("HUD/INFOHUD/Info_Hud") and name and restoration.Options:GetValue("HUD/INFOHUD/Info_" .. name) then
		self._skill_list:add_skill(name)
	end
end

function HUDManager:remove_skill(name)
	self._skill_list:destroy(name)
end

function HUDManager:clear_skills()
	self._skill_list:destroy(nil)
end

function HUDManager:start_cooldown(name, duration)
	self._skill_list:trigger_cooldown(name, duration)
end

function HUDManager:change_cooldown(name, amount)
	self._skill_list:change_start_time(name, amount)
end

function HUDManager:start_buff(name, duration)
	if restoration.Options:GetValue("HUD/INFOHUD/Info_Hud") and name and restoration.Options:GetValue("HUD/INFOHUD/Info_" .. name) then
		self._skill_list:trigger_buff(name, duration)
	end
end

function HUDManager:set_stacks(name, stacks)
	if restoration.Options:GetValue("HUD/INFOHUD/Info_Hud") and name and restoration.Options:GetValue("HUD/INFOHUD/Info_" .. name) then
		self._skill_list:set_stacks(name, stacks)
	end
end

function HUDManager:add_stack(name)
	if restoration.Options:GetValue("HUD/INFOHUD/Info_Hud") and name and restoration.Options:GetValue("HUD/INFOHUD/Info_" .. name) then
		self._skill_list:add_stack(name)
	end
end

function HUDManager:remove_stack(name)
	self._skill_list:remove_stack(name)
end

if not restoration.Options:GetValue("HUD/MainHUD") then
	return
end

RestorationCoreHooks:Pre(HUDManager, "_setup_player_info_hud_pd2", function(self)
	RestorationCoreCallbacks:AddValueChangedFunc(callback(self, self, "RestorationValueChanged"))
	self:RestorationValueChanged()
end)

function HUDManager:RestorationValueChanged()
	managers.gui_data:layout_scaled_fullscreen_workspace(self._saferect, restoration.Options:GetValue("HUD/Extra/Scale"), restoration.Options:GetValue("HUD/Extra/SizeOnScreen"))
end

if restoration.Options:GetValue("HUD/NameLabels") then
	function HUDManager:_add_name_label(data)
		local hud = managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN_PD2)
		local last_id = self._hud.name_labels[#self._hud.name_labels] and self._hud.name_labels[#self._hud.name_labels].id or 0
		local id = last_id + 1
		local character_name = data.name
		local rank = 0
		local peer_id
		local is_husk_player = data.unit:base().is_husk_player
		if is_husk_player then
			peer_id = data.unit:network():peer():id()
			local level = data.unit:network():peer():level()
			rank = data.unit:network():peer():rank()
			if level then
				local color_range_offset = utf8.len(data.name) + 2
				local experience, color_ranges = managers.experience:gui_string(level, rank, color_range_offset)
				data.name_color_ranges = color_ranges
				data.name = data.name .. " [" .. experience .. "]"
			end
		end
		local panel = hud.panel:panel({
			name = "name_label" .. id
		})
		local radius = 24
		local interact = CircleBitmapGuiObject:new(panel, {
			use_bg = true,
			radius = radius,
			blend_mode = "add",
			color = Color.white,
			layer = 0
		})
		interact:set_visible(false)
		local tabs_texture = "guis/textures/pd2/hud_tabs"
		local bag_rect = {
			2,
			34,
			20,
			17
		}
		local color_id = managers.criminals:character_color_id_by_unit(data.unit)
		local crim_color = tweak_data.chat_colors[color_id]
		local text = panel:text({
			name = "text",
			text = utf8.to_upper(data.name),
			font = tweak_data.menu.medium_font,
			font_size = 28,
			color = crim_color,
			align = "left",
			vertical = "top",
			layer = -1,
			w = 256,
			h = 18
		})
		local bag = panel:bitmap({
			name = "bag",
			texture = tabs_texture,
			texture_rect = bag_rect,
			visible = false,
			layer = 0,
			color = crim_color:with_alpha(1),
			x = 1,
			y = 1
		})
		panel:text({
			name = "cheater",
			text = utf8.to_upper(managers.localization:text("menu_hud_cheater")),
			font = tweak_data.menu.medium_font,
			font_size = 28,
			color = tweak_data.screen_colors.pro_color,
			align = "center",
			visible = false,
			layer = -1,
			w = 256,
			h = 18
		})
		panel:text({
			name = "action",
			rotation = 360,
			visible = false,
			text = utf8.to_upper("Fixing"),
			font = tweak_data.menu.medium_font,
			font_size = 28,
			color = crim_color:with_alpha(1),
			align = "left",
			vertical = "bottom",
			layer = -1,
			w = 256,
			h = 18
		})
		if rank > 0 then
			local texture, texture_rect = managers.experience:rank_icon_data(rank)
			panel:bitmap({
				name = "infamy",
				layer = 0,
				h = 16,
				w = 16,
				texture = texture,
				texture_rect = texture_rect,
				color = crim_color
			})
		end

		for _, color_range in ipairs(data.name_color_ranges or {}) do
			text:set_range_color(color_range.start, color_range.stop, color_range.color)
		end

		self:align_teammate_name_label(panel, interact)
		table.insert(self._hud.name_labels, {
			movement = data.unit:movement(),
			panel = panel,
			text = text,
			id = id,
			peer_id = peer_id,
			character_name = character_name,
			interact = interact,
			bag = bag
		})
		return id
	end
end

if restoration.Options:GetValue("HUD/Waypoints") then
	--fix format here
	function HUDManager:add_waypoint( id, data )
		if self._hud.waypoints[ id ] then
			self:remove_waypoint( id )
		end
		
		local hud = managers.hud:script( PlayerBase.PLAYER_INFO_HUD_PD2 )
		if not hud then
			self._hud.stored_waypoints[ id ] = data
			return
		end
		
		local waypoint_panel = hud.panel -- hud.waypoint_panel
		local icon = data.icon or "wp_standard"
		local text = data.text or ""
		local icon, texture_rect = tweak_data.hud_icons:get_icon_data( icon, {0, 0, 32, 32} )
		local bitmap = waypoint_panel:bitmap( { name = "bitmap"..id, texture = icon, texture_rect = texture_rect, layer = 0, w = texture_rect[3], h = texture_rect[4], blend_mode = data.blend_mode } ) --or w = PxSize etc
		local arrow_icon, arrow_texture_rect = tweak_data.hud_icons:get_icon_data( "wp_arrow" )
		local arrow = waypoint_panel:bitmap( { name = "arrow"..id, texture = arrow_icon, texture_rect = arrow_texture_rect, color = (data.color or Color.white):with_alpha(0.75), visible = false, layer = 0, w = arrow_texture_rect[3], h = arrow_texture_rect[4], blend_mode = data.blend_mode } )
		
		local distance
		if data.distance then
			distance = waypoint_panel:text({
				name = "distance" .. id,
				text = "16.5",
				color = data.color or tweak_data.hud.prime_color,
				font = tweak_data.menu.medium_font,
				font_size = 32,
				align = "center",
				vertical = "center",
				w = 128,
				h = 24,
				layer = 0,
				blend_mode = data.blend_mode,
				rotation = 360
			})
			distance:set_visible( false )
		end
		
		local timer = data.timer and waypoint_panel:text( { name = "timer"..id, text = (math.round(data.timer) < 10 and "0" or "")..math.round(data.timer), font = tweak_data.hud.medium_font, font_size = 20, align = "center", vertical = "center", w = 128, h = 24, layer = 2} )
		--[[if data.timer then
			timer = hud.panel:text( { name = "timer"..id, text = "00", font = tweak_data.hud.medium_font, font_size = 20, align = "center", vertical = "center", w = 128, h = 24, layer = 2} )
			timer:set_visible(false)
		end]]--
		
		text = waypoint_panel:text( { name = "text"..id, text = utf8.to_upper( " "..text ), font = tweak_data.hud.small_font, font_size = tweak_data.hud.small_font_size, align = "center", vertical = "center", w = 512, h = 24, layer = 0} )
		local _,_,w,_ = text:text_rect()
		text:set_w( w )
		local w, h = bitmap:size()
		
		self._hud.waypoints[ id ] = {
			init_data		= data,
			state			= "present",
			present_timer 	= managers.groupai:state():whisper_mode() and data.present_timer or 2, 
			bitmap 			= bitmap,
			arrow			= arrow,
			size			= Vector3( w, h, 0 ),
			text			= text,
			distance		= distance,
			timer_gui		= timer,
			timer			= data.timer,
			pause_timer = not data.pause_timer and data.timer and 0,
			position		= data.position,
			unit			= data.unit,
			no_sync			= data.no_sync,
			move_speed		= 1,
			radius			= data.radius or 160
		}
		self._hud.waypoints[ id ].init_data.position = data.position or data.unit:position() -- Stupid drop in fix
		
		-- The code below is not easy to follow, what it does is calculates where the waypoint should be presented if there are other being presented at the same time
		local slot = 1
		local t = {}
		for _,data in pairs( self._hud.waypoints ) do
			if data.slot then
				t[ data.slot ] = data.text:w()
			end
		end
		for i = 1, 10 do
			if not t[ i ] then
				self._hud.waypoints[ id ].slot = i
				break
			end
		end
		self._hud.waypoints[ id ].slot_x = 0
		if self._hud.waypoints[ id ].slot == 2 then
			self._hud.waypoints[ id ].slot_x = t[ 1 ]/2 + self._hud.waypoints[ id ].text:w()/2 + 10 * 1
		elseif self._hud.waypoints[ id ].slot == 3 then
			self._hud.waypoints[ id ].slot_x = -t[ 1 ]/2 - self._hud.waypoints[ id ].text:w()/2 - 10 * 1
		elseif self._hud.waypoints[ id ].slot == 4 then
			self._hud.waypoints[ id ].slot_x = t[ 1 ]/2 + t[ 2 ] + self._hud.waypoints[ id ].text:w()/2 + 10 * 2
		elseif self._hud.waypoints[ id ].slot == 5 then
			self._hud.waypoints[ id ].slot_x = -t[ 1 ]/2 - t[ 3 ] - self._hud.waypoints[ id ].text:w()/2 - 10 * 2
		end
	end
end

if restoration:all_enabled("HUD/MainHUD", "HUD/Teammate") then
	if _G.IS_VR then
		return
	end
	function HUDManager:_create_teammates_panel(hud)
		HUDManager.PLAYER_PANEL = _G.BigLobbyGlobals and BigLobbyGlobals:num_player_slots() or 4
		hud = hud or managers.hud:script(PlayerBase.PLAYER_INFO_HUD_PD2)
		self._hud.teammate_panels_data = self._hud.teammate_panels_data or {}
		self._teammate_panels = {}
		if hud.panel:child("teammates_panel") then
			hud.panel:remove(hud.panel:child("teammates_panel"))
		end
		local h = 152
		local teammates_panel = hud.panel:panel({
			name = "teammates_panel",
			h = h,
			y = hud.panel:h() - h,
			halign = "grow",
			valign = "bottom"
		})
		local teammate_w = 204
		local player_gap = 240
		local small_gap = (teammates_panel:w() - player_gap - teammate_w * HUDManager.PLAYER_PANEL) / (HUDManager.PLAYER_PANEL - 1)
		for i = 1, HUDManager.PLAYER_PANEL do
			local is_player = i == HUDManager.PLAYER_PANEL
			self._hud.teammate_panels_data[i] = {
				taken = false and is_player,
				special_equipments = {}
			}
			local pw = teammate_w
			local teammate = HUDTeammate:new(i, teammates_panel, is_player, pw)
			local x = math.floor((pw + small_gap) * (i - 1) + (i == HUDManager.PLAYER_PANEL and player_gap or 0))
			teammate._panel:set_x(math.floor(x))
			table.insert(self._teammate_panels, teammate)
			if is_player then
				teammate:add_panel()
			end
		end
	end

	function HUDManager:teammate_progress(peer_id, type_index, enabled, tweak_data_id, timer, success)
		local name_label = self:_name_label_by_peer_id(peer_id)
		if name_label then
			name_label.interact:set_visible(enabled)
			name_label.panel:child("action"):set_visible(enabled)
			local action_text = ""
			if type_index == 1 then
				action_text = managers.localization:text(tweak_data.interaction[tweak_data_id].action_text_id or "hud_action_generic")
				--action_text = managers.localization:text("hud_action_generic")
			elseif type_index == 2 then
				if enabled then
					local equipment_name = managers.localization:text(tweak_data.equipments[tweak_data_id].text_id)
					local deploying_text = tweak_data.equipments[tweak_data_id].deploying_text_id and managers.localization:text(tweak_data.equipments[tweak_data_id].deploying_text_id) or false
					action_text = deploying_text or managers.localization:text("hud_deploying_equipment", {EQUIPMENT = equipment_name})
				end
			elseif type_index == 3 then
				action_text = managers.localization:text("hud_starting_heist")
			end
			name_label.panel:child("action"):set_text(utf8.to_upper(action_text))
			name_label.panel:stop()
			if enabled then
				name_label.panel:animate(callback(self, self, "_animate_label_interact"), name_label.interact, timer)
			elseif success then
				local panel = name_label.panel
				local bitmap = panel:bitmap({
					rotation = 360,
					texture = "guis/textures/restoration/hud_progress_active",
					blend_mode = "add",
					align = "center",
					valign = "center",
					layer = 2
				})
				bitmap:set_size(name_label.interact:size())
				bitmap:set_position(name_label.interact:position())
				local radius = name_label.interact:radius()
				local circle = CircleBitmapGuiObject:new(panel, {
					rotation = 360,
					radius = radius,
					color = Color.white:with_alpha(1),
					blend_mode = "normal",
					layer = 3
				})
				circle:set_position(name_label.interact:position())
				bitmap:animate(callback(HUDInteraction, HUDInteraction, "_animate_interaction_complete"), circle)
			end
		end
		local character_data = managers.criminals:character_data_by_peer_id(peer_id)
		if character_data then
			self._teammate_panels[character_data.panel_id]:teammate_progress(enabled, tweak_data_id, timer, success)
		end
	end

	function HUDManager:hide_player_gear(panel_id)
		if self._teammate_panels[panel_id] and self._teammate_panels[panel_id]:panel() and self._teammate_panels[panel_id]:panel():child("player") then
			local player_panel = self._teammate_panels[panel_id]:panel():child("player")
			player_panel:child("weapons_panel"):set_visible(false)
			player_panel:child("deployable_equipment_panel"):set_visible(false)
			player_panel:child("cable_ties_panel"):set_visible(false)
			if player_panel:child("grenades_panel") then
					player_panel:child("grenades_panel"):set_visible(false)
			end
		end
	end
	function HUDManager:show_player_gear(panel_id)
		if self._teammate_panels[panel_id] and self._teammate_panels[panel_id]:panel() and self._teammate_panels[panel_id]:panel():child("player") then
			local player_panel = self._teammate_panels[panel_id]:panel():child("player")
			player_panel:child("weapons_panel"):set_visible(true)
			player_panel:child("deployable_equipment_panel"):set_visible(true)
			player_panel:child("cable_ties_panel"):set_visible(true)
			if player_panel:child("grenades_panel") then
					player_panel:child("grenades_panel"):set_visible(true)
			end
		end
	end
end