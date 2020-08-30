MiniGameInteraction = MiniGameInteraction or class(IngamePlayerBaseState)
MiniGameInteraction.FAILED_COOLDOWN = 1

function MiniGameInteraction:init(game_state_machine)
	MiniGameInteraction.super.init(self, "ingame_special_interaction", game_state_machine)
	self._current_stage = 1
end

function MiniGameInteraction:_setup_controller()
	managers.menu:get_controller():disable()

	self._controller = managers.controller:create_controller("ingame_special_interaction", managers.controller:get_default_wrapper_index(), false)
	self._leave_cb = callback(self, self, "cb_leave")
	self._interact_cb = callback(self, self, "cb_interact")

	self._controller:add_trigger("jump", self._leave_cb)
	self._controller:add_trigger("interact", self._interact_cb)
	self._controller:set_enabled(true)
end

function MiniGameInteraction:controller()
	return self._controller
end

function MiniGameInteraction:_clear_controller()
	local menu_controller = managers.menu:get_controller()

	if menu_controller then
		menu_controller:enable()
	end

	if self._controller then
		self._controller:remove_trigger("jump", self._leave_cb)
		self._controller:remove_trigger("interact", self._interact_cb)
		self._controller:set_enabled(false)
		self._controller:destroy()

		self._controller = nil
	end
end

function MiniGameInteraction:set_controller_enabled(enabled)
	if self._controller then
		self._controller:set_enabled(enabled)
	end
end

function MiniGameInteraction:cb_leave(success)
	local player = managers.player:player_unit()
	if player then
		local movement = player:movement():current_state()
		if movement._interupt_action_interact then
			movement._interact_expire_t = 0
			if success == true then
				movement:_end_action_interact()
			else
				movement:interupt_interact()
			end
		end
	end

    game_state_machine:change_state_by_name(self._old_state)
end

function MiniGameInteraction:cb_interact()
	self._interaction:interact()
end

function MiniGameInteraction:on_destroyed()
end

function MiniGameInteraction:update(t, dt)
	if self._interaction then
		self._interaction:update(t, dt)
	end
end

function MiniGameInteraction:update_player_stamina(t, dt)
	local player = managers.player:player_unit()

	if player and player:movement() then
		player:movement():update_stamina(t, dt, true)
	end
end

function MiniGameInteraction:_player_damage(info)
end

function MiniGameInteraction:at_enter(old_state, params)
	local player = managers.player:player_unit()

	if player then
		player:movement():current_state():interrupt_all_actions()
		player:base():set_enabled(true)
		player:character_damage():add_listener("MiniGameInteraction", {"hurt", "death"}, callback(self, self, "_player_damage"))
		managers.dialog:queue_dialog("player_gen_picking_lock", {
			skip_idle_check = true,
			instigator = managers.player:local_player()
		})
		SoundDevice:set_rtpc("stamina", 100)
	end

	self._sound_source = self._sound_source or SoundDevice:create_source("ingame_special_interaction")
	self._sound_source:set_position(player:position())

	self._old_state = old_state:name()

	managers.hud:remove_interact()
	player:camera():set_shaker_parameter("headbob", "amplitude", 0)

	self:_setup_controller()

	self._interaction = RaidWW2MiniGame:new(self, params.object)

	managers.hud:show(PlayerBase.PLAYER_INFO_HUD)
	managers.hud:show(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN)
end

function MiniGameInteraction:at_exit()
	self._sound_source:stop()
	self:_clear_controller()

	local player = managers.player:player_unit()

	if player then
		player:base():set_enabled(true)
		player:base():set_visible(true)
		player:base().skip_update_one_frame = true
		player:character_damage():remove_listener("MiniGameInteraction")
	end

	if self._interaction then
		self._interaction:destroy()
		self._interaction = nil
	end

	managers.hud:hide(PlayerBase.PLAYER_INFO_HUD)
	managers.hud:hide(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN)
end

function MiniGameInteraction:_play_sound(event, no_stop)
	if event then
		if not no_stop then
			self._sound_source:stop()
		end

		self._sound_source:post_event(event)
	end
end

--I hate this class with the bane of my existence
Hooks:PostHook(GameStateMachine, "init", "RaidMinigameGameStateInit", function(self)
    Gamemode.STATES.ingame_special_interaction = 'ingame_special_interaction'

    local ingame_special_interaction = MiniGameInteraction:new(self)
    local ingame_special_interaction_func = callback(nil, ingame_special_interaction, "default_transition")
    for _, state in pairs(self._states) do
        self:add_transition(state, ingame_special_interaction, callback(nil, state, "default_transition"))
        self:add_transition(ingame_special_interaction, state, ingame_special_interaction_func)
    end
end)