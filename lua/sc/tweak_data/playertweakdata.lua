function PlayerTweakData:_set_easy()
	self.damage.automatic_respawn_time = 120
	self.damage.MIN_DAMAGE_INTERVAL = 0.55
	self.suspicion.max_value = 6
	self.suspicion.range_mul = 0.8
	self.suspicion.buildup_mul = 0.8
end

function PlayerTweakData:_set_normal()
	self.damage.automatic_respawn_time = 175
	self.damage.MIN_DAMAGE_INTERVAL = 0.5
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1	
end

function PlayerTweakData:_set_hard()
	self.damage.automatic_respawn_time = 220
	self.damage.MIN_DAMAGE_INTERVAL = 0.45
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1	
end

function PlayerTweakData:_set_overkill()
	self.damage.MIN_DAMAGE_INTERVAL = 0.4
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1
	self.damage.custody_ammo_kept  = 0.5
	self.damage.DOWNED_TIME_DEC = 5
end

function PlayerTweakData:_set_overkill_145()
	self.damage.MIN_DAMAGE_INTERVAL = 0.35
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1
	self.damage.custody_ammo_kept  = 0.5
	self.damage.DOWNED_TIME_DEC = 5
	self.damage.REVIVE_HEALTH_STEPS = {
		0.70,
		0.60,
		0.50,
		0.40,
		0.30
	}
	self.damage.REVIVE_HEALTH_STEPS_W_SKILL = {
		0.95,
		0.85,
		0.75,
		0.65,
		0.55
	}
end

function PlayerTweakData:_set_easy_wish()
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1	
	self.damage.MIN_DAMAGE_INTERVAL = 0.3
	self.damage.custody_ammo_kept  = 0.25
	self.damage.DOWNED_TIME_DEC = 5
	self.damage.REVIVE_HEALTH_STEPS = {
		0.70,
		0.60,
		0.50,
		0.40,
		0.30
	}
	self.damage.REVIVE_HEALTH_STEPS_W_SKILL = {
		0.95,
		0.85,
		0.75,
		0.65,
		0.55
	}
end

function PlayerTweakData:_set_overkill_290()
	self.suspicion.max_value = 9
	self.suspicion.range_mul = 1.1
	self.suspicion.buildup_mul = 1.1
	self.damage.MIN_DAMAGE_INTERVAL = 0.3
	self.damage.REVIVE_HEALTH_STEPS = {
		0.30
	}
	self.damage.REVIVE_HEALTH_STEPS_W_SKILL = {
		0.55
	}
	self.damage.STUN_TIME = 1.25
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{4.5, 4.5},
			{4.5, 4.5}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			0
		}
	}
	self.damage.custody_ammo_kept  = 0.25
	self.damage.DOWNED_TIME_DEC = 10
end

function PlayerTweakData:_set_sm_wish()
	self.suspicion.max_value = 10
	self.suspicion.range_mul = 1.2
	self.suspicion.buildup_mul = 1.2
	self.damage.MIN_DAMAGE_INTERVAL = 0.25
	self.damage.REVIVE_HEALTH_STEPS = {
		0.3
	}
	self.damage.REVIVE_HEALTH_STEPS_W_SKILL = {
		0.55
	}		
	self.damage.TASED_TIME = 5
	self.damage.STUN_TIME = 1.5
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{3, 3},
			{3, 3}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			0
		}
	}
	self.damage.custody_ammo_kept  = 0.25
	self.damage.DOWNED_TIME_DEC = 10
end

function PlayerTweakData:_set_singleplayer()
	self.max_nr_following_hostages = 4
end

function PlayerTweakData:_set_multiplayer()
end

function PlayerTweakData:init()
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	local is_vr = false
	is_vr = _G.IS_VR
	self.arrest = {arrest_timeout = 240, aggression_timeout = 60}
	self.put_on_mask_time = 0
	self.gravity = -982
	self.terminal_velocity = -5500
	self.damage = {}
	self.damage.ARMOR_INIT = 2
	self.damage.DODGE_INIT = 0
	self.damage.HEALTH_REGEN = 0
	self.damage.ARMOR_STEPS = 1
	self.damage.ARMOR_DAMAGE_REDUCTION = 0
	self.damage.ARMOR_DAMAGE_REDUCTION_STEPS = {
		1,
		0.6,
		0.7,
		0.8,
		0.9,
		0.95,
		0.96,
		0.97,
		0.98,
		0.99
	}
	self.damage.HEALTH_INIT = 20
	self.damage.LIVES_INIT = 6
	self.damage.REGENERATE_TIME = 3
	self.damage.REVIVE_HEALTH_STEPS = {
		1.00,
		0.75,
		0.60,
		0.45,
		0.30
	}
	self.damage.REVIVE_HEALTH_STEPS_W_SKILL = {
		1.00,
		1.00,
		0.85,
		0.70,
		0.55
	}
	self.damage.CUSTODY_LIVES = 3 --Number of downs left when leaving damage.
	self.damage.custody_ammo_kept = 1 --% of remaining ammo kept when leaving damage.
	self.damage.BLEED_OT_TIME = 40
	self.damage.TASED_TIME = 10
	self.damage.STUN_TIME = 1
	self.damage.TASED_RECOVER_TIME = 1
	self.damage.BLEED_OUT_HEALTH_INIT = 20
	self.damage.DOWNED_TIME = 30
	self.damage.DOWNED_TIME_DEC = 0
	self.damage.DOWNED_TIME_MIN = 10
	self.damage.ARRESTED_TIME = 60
	self.damage.INCAPACITATED_TIME = 30
	self.damage.MIN_DAMAGE_INTERVAL = 0.3
	self.damage.respawn_time_penalty = 30
	self.damage.base_respawn_time_penalty = 5
	self.damage.automatic_assault_ai_trade_time = 360
	self.damage.automatic_assault_ai_trade_time_max = 420
	self.fall_health_damage = 3
	self.fall_damage_alert_size = 250
	self.SUSPICION_OFFSET_LERP = 0.75
	self.long_dis_interaction = {
		intimidate_strength = 0.5,
		highlight_range = 3000,
		intimidate_range_enemies = 1000,
		intimidate_range_civilians = 1000,
		intimidate_range_teammates = 100000
	}
	self.suppression = {
		max_value = 60,
		decay_start_delay = 0.1,
		receive_mul = 1,
		spread_mul = 1,
		autohit_chance_mul = 1,
		tolerance = 0
	}	
	self.suspicion = {
		max_value = 8,
		range_mul = 1,
		buildup_mul = 1
	}
	self.alarm_pager = {
		first_call_delay = {2, 4},
		call_duration = {
			{6, 6},
			{6, 6}
		},
		nr_of_calls = {2, 2},
		bluff_success_chance = {
			1,
			1,
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			1,
			0
		}
	}
	self.max_nr_following_hostages = 1
	self.TRANSITION_DURATION = 0.23
	self.stances = {
		default = {
			standard = {
				head = {},
				shoulders = {},
				vel_overshot = {}
			},
			crouched = {
				head = {},
				shoulders = {},
				vel_overshot = {}
			},
			steelsight = {
				shoulders = {},
				vel_overshot = {}
			}
		}
	}
	self.stances.default.standard.head.translation = Vector3(0, 0, 145)
	self.stances.default.standard.head.rotation = Rotation()
	self.stances.default.standard.shakers = {}
	self.stances.default.standard.shakers.breathing = {}
	self.stances.default.standard.shakers.breathing.amplitude = 0.3
	self.stances.default.crouched.shakers = {}
	self.stances.default.crouched.shakers.breathing = {}
	self.stances.default.crouched.shakers.breathing.amplitude = 0.25
	self.stances.default.steelsight.shakers = {}
	self.stances.default.steelsight.shakers.breathing = {}
	self.stances.default.steelsight.shakers.breathing.amplitude = 0.025
	self.stances.default.mask_off = deep_clone(self.stances.default.standard)
	self.stances.default.mask_off.head.translation = Vector3(0, 0, 160)
	self.stances.default.clean = deep_clone(self.stances.default.mask_off)
	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	local pivot_shoulder_translation = Vector3()
	local pivot_shoulder_rotation = Rotation()
	self.stances.default.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.default.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.default.standard.vel_overshot.yaw_neg = 6
	self.stances.default.standard.vel_overshot.yaw_pos = -6
	self.stances.default.standard.vel_overshot.pitch_neg = -10
	self.stances.default.standard.vel_overshot.pitch_pos = 10
	self.stances.default.standard.vel_overshot.pivot = Vector3(0, 0, 0)
	self.stances.default.standard.FOV = 65
	self.stances.default.crouched.head.translation = Vector3(0, 0, 75)
	self.stances.default.crouched.head.rotation = Rotation()
	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	self.stances.default.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.default.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.default.crouched.vel_overshot.yaw_neg = 6
	self.stances.default.crouched.vel_overshot.yaw_pos = -6
	self.stances.default.crouched.vel_overshot.pitch_neg = -10
	self.stances.default.crouched.vel_overshot.pitch_pos = 10
	self.stances.default.crouched.vel_overshot.pivot = Vector3(0, 0, 0)
	self.stances.default.crouched.FOV = self.stances.default.standard.FOV
	local pivot_head_translation = Vector3(0, 0, 0)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.default.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.default.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.default.steelsight.vel_overshot.yaw_neg = 4
	self.stances.default.steelsight.vel_overshot.yaw_pos = -4
	self.stances.default.steelsight.vel_overshot.pitch_neg = -2
	self.stances.default.steelsight.vel_overshot.pitch_pos = 2
	self.stances.default.steelsight.vel_overshot.pivot = pivot_shoulder_translation
	self.stances.default.steelsight.zoom_fov = true
	self.stances.default.steelsight.FOV = self.stances.default.standard.FOV
	self.stances.jowi = deep_clone(self.stances.default)
	local pivot_shoulder_translation = Vector3(11.391, 45.0507, -3.38766)
	local pivot_shoulder_rotation = Rotation(-0.326422, 0.247368, -0.0156885)
	local pivot_head_translation = Vector3(10.95, 30, -4)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.jowi.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.jowi.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -86, 0)
	local pivot_head_translation = Vector3(10.95, 42, -3)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.jowi.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.jowi.steelsight.zoom_fov = false
	self.stances.jowi.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -36, 0)
	self.stances.jowi.steelsight.vel_overshot.yaw_neg = 5
	self.stances.jowi.steelsight.vel_overshot.yaw_pos = -5
	self.stances.jowi.steelsight.vel_overshot.pitch_neg = -12
	self.stances.jowi.steelsight.vel_overshot.pitch_pos = 12
	local pivot_head_translation = Vector3(10.95, 32, -3)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.jowi.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.jowi.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.jowi.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -36, 0)
	self:_init_new_stances()
	self.movement_state = {}
	self.movement_state.standard = {}
	self.movement_state.standard.movement = {
		speed = {},
		jump_velocity = {
			xy = {}
		},
		multiplier = {}
	}
	self.movement_state.standard.movement.speed.STANDARD_MAX = 350
	self.movement_state.standard.movement.speed.RUNNING_MAX = 575
	self.movement_state.standard.movement.speed.CROUCHING_MAX = 225
	self.movement_state.standard.movement.speed.STEELSIGHT_MAX = 185
	self.movement_state.standard.movement.speed.INAIR_MAX = 185
	self.movement_state.standard.movement.speed.CLIMBING_MAX = 200
	self.movement_state.standard.movement.jump_velocity.z = 470
	self.movement_state.standard.movement.jump_velocity.xy.run = self.movement_state.standard.movement.speed.RUNNING_MAX * 1
	self.movement_state.standard.movement.jump_velocity.xy.walk = self.movement_state.standard.movement.speed.STANDARD_MAX * 1.2
	
	if is_vr then
		self.movement_state.standard.movement.multiplier.run = 1
		self.movement_state.standard.movement.multiplier.walk = 1
		self.movement_state.standard.movement.multiplier.crouch = 1
		self.movement_state.standard.movement.multiplier.climb = 1
	end
	
	self.movement_state.interaction_delay = 1.5
	self.movement_state.stamina = {}

	if is_vr then
		self.movement_state.stamina.STAMINA_INIT = 50
	else
		self.movement_state.stamina.STAMINA_INIT = 50
	end

	self.movement_state.stamina.STAMINA_REGEN_RATE = 3
	self.movement_state.stamina.STAMINA_DRAIN_RATE = 2
	self.movement_state.stamina.STAMINA_DRAIN_RATE_WARP = 3
	self.movement_state.stamina.REGENERATE_TIME = 1
	self.movement_state.stamina.MIN_STAMINA_THRESHOLD = 4
	self.movement_state.stamina.JUMP_STAMINA_DRAIN = 0
	
	self.camera = {}
	self.camera.MIN_SENSITIVITY = 0.3
	self.camera.MAX_SENSITIVITY = 1.7
	self.omniscience = {}
	self.omniscience.start_t = 3.5
	self.omniscience.interval_t = 0
	self.omniscience.sense_radius = 1000
	self.omniscience.target_resense_t = 3.5
	self:_init_parachute()
end

local default_init_hk21 = PlayerTweakData._init_hk21
function PlayerTweakData:_init_hk21()
	default_init_hk21(self)
	local pivot_shoulder_translation = Vector3(8.59464, 11.3996, -3.26142)
	local pivot_shoulder_rotation = Rotation(7.08051E-6, 0.00559065, 3.07211E-4)    
	local pivot_head_translation = Vector3(0, 10, 0) -- 8, 10, -1
	local pivot_head_rotation = Rotation(0, 0, 0) -- 0.2, 0.2, -8
	self.stances.hk21.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk21.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.hk21.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk21.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.hk21.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.hk21.bipod.vel_overshot.yaw_neg = 0
	self.stances.hk21.bipod.vel_overshot.yaw_pos = 0
	self.stances.hk21.bipod.vel_overshot.pitch_neg = 0
	self.stances.hk21.bipod.vel_overshot.pitch_pos = 0
	self.stances.hk21.bipod.shakers = {breathing = {amplitude = 0}}		
end
 
-- KSP
local default_init_m249 = PlayerTweakData._init_m249
function PlayerTweakData:_init_m249()
	default_init_m249(self)
	local pivot_shoulder_translation = Vector3(10.716, 4, -0.55)
	local pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
	local pivot_head_translation = Vector3(0, 12, 0) -- 10, 12, -2
	local pivot_head_rotation = Rotation(0, 0, 0) -- 0, 0, -5
	self.stances.m249.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m249.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.m249.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m249.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.m249.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.m249.bipod.vel_overshot.yaw_neg = 0
	self.stances.m249.bipod.vel_overshot.yaw_pos = 0
	self.stances.m249.bipod.vel_overshot.pitch_neg = 0
	self.stances.m249.bipod.vel_overshot.pitch_pos = 0
	self.stances.m249.bipod.shakers = {breathing = {amplitude = 0}}		
end
 
 
-- RPK
local default_init_rpk = PlayerTweakData._init_rpk
function PlayerTweakData:_init_rpk()
	default_init_rpk(self)
	local pivot_shoulder_translation = Vector3(10.6725, 27.7166, -4.93564)
	local pivot_shoulder_rotation = Rotation(0.1067, -0.0850111, 0.629008)
	local pivot_head_translation = Vector3(0, 28, 0)  -- 6, 30, -1
	local pivot_head_rotation = Rotation(0, 0, 0)  -- 0, 0, -5
	self.stances.rpk.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.rpk.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.rpk.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.rpk.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.rpk.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.rpk.bipod.vel_overshot.yaw_neg = 0
	self.stances.rpk.bipod.vel_overshot.yaw_pos = 0
	self.stances.rpk.bipod.vel_overshot.pitch_neg = 0
	self.stances.rpk.bipod.vel_overshot.pitch_pos = 0
	self.stances.rpk.bipod.shakers = {breathing = {amplitude = 0}}		
end
 
 
-- BUZZSAW
local default_init_mg42 = PlayerTweakData._init_mg42
function PlayerTweakData:_init_mg42()
	default_init_mg42(self)
	local pivot_shoulder_translation = Vector3(10.713, 47.8277, 0.873785)
	local pivot_shoulder_rotation = Rotation(0.10662, -0.0844545, 0.629209)
	local pivot_head_translation = Vector3(0, 40, 0)  -- default = 3,40,-2
	local pivot_head_rotation = Rotation(0, 0, 0)      -- default = 0, 0, -2
	self.stances.mg42.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.mg42.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.mg42.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.mg42.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.mg42.bipod.vel_overshot.yaw_neg = 0
	self.stances.mg42.bipod.vel_overshot.yaw_pos = 0
	self.stances.mg42.bipod.vel_overshot.pitch_neg = 0
	self.stances.mg42.bipod.vel_overshot.pitch_pos = 0
	self.stances.mg42.bipod.shakers = {breathing = {amplitude = 0}}		
end
 
local default_init_par = PlayerTweakData._init_par
function PlayerTweakData:_init_par()
	default_init_par(self)
	local pivot_shoulder_translation = Vector3(10, 4, -4)
	local pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
	local pivot_head_translation = Vector3(0, 12, 0) -- 10, 12, -2
	local pivot_head_rotation = Rotation(0, 0, 0) -- 0, 0, -5
	self.stances.par.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.par.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.par.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.par.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.par.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.par.bipod.vel_overshot.yaw_neg = 0
	self.stances.par.bipod.vel_overshot.yaw_pos = 0
	self.stances.par.bipod.vel_overshot.pitch_neg = 0
	self.stances.par.bipod.vel_overshot.pitch_pos = 0
	self.stances.par.bipod.shakers = {breathing = {amplitude = 0}}		
end