CopActionAct._act_redirects.script = {
	"attached_collar_enter",
	"suppressed_reaction",
	"surprised",
	"hands_up",
	"hands_back",
	"tied",
	"stand_tied",
	"tied_all_in_one",
	"drop",
	"panic",
	"idle",
	"halt",
	"stand",
	"crouch",
	"revive",
	"untie",
	"arrest",
	"arrest_call",
	"gesture_stop",
	"sabotage_device_low",
	"sabotage_device_mid",
	"sabotage_device_high",
	"so_civ_dummy_act_loop",
	"dizzy",
	"cmd_get_up",
	"cmd_stop",
	"cmd_down",
	"cmd_gogo",
	"cmd_point"
}

local _play_anim_orig = CopActionAct._play_anim
function CopActionAct:_play_anim()
	local result = _play_anim_orig(self)
	-- act actions disable the flashlight if it needs to be done from idle, which generally means specialobjectives
	if result and self._action_desc.needs_full_blend and self._unit:inventory():equipped_unit() then
		self._flashlight_disabled = true
		self._unit:inventory():equipped_unit():base():set_flashlight_enabled(false)
	end

	return result
end

Hooks:PostHook(CopActionAct, "on_exit", "res_on_exit", function(self)
	if self._flashlight_disabled and self._unit:inventory():equipped_unit() and not self._unit:movement():cool() then
		self._unit:inventory():equipped_unit():base():set_flashlight_enabled(true)
	end
end)

-- Fix enemies that were in panic state getting stuck
local need_upd_original = CopActionAct.need_upd
function CopActionAct:need_upd(...)
	return self._ext_anim.fumble or need_upd_original(self, ...)
end