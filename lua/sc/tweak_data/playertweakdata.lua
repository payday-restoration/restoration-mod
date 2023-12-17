local pro_job = Global.game_settings and Global.game_settings.one_down
function PlayerTweakData:_set_easy()
	self.damage.automatic_respawn_time = 120
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.4
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.45
	end
	self.suspicion.max_value = 6
	self.suspicion.range_mul = 0.8
	self.suspicion.buildup_mul = 0.8
end

function PlayerTweakData:_set_normal()
	self.damage.automatic_respawn_time = 175
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.4
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.45
	end
	self.suspicion.max_value = 7
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1	
end

function PlayerTweakData:_set_hard()
	self.damage.automatic_respawn_time = 220
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.4
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.45
	end
	self.suspicion.max_value = 7
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1	
end

function PlayerTweakData:_set_overkill()
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.4
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.45
	end
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1
	self.damage.custody_ammo_drained  = 0.5
end

function PlayerTweakData:_set_overkill_145()
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.4
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.45
	end
	self.suspicion.max_value = 8
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1
	self.damage.custody_ammo_drained  = 0.5
	self.damage.REVIVE_HEALTH_STEPS = {
		0.70,
		0.60,
		0.50,
		0.40,
		0.30
	}
end

function PlayerTweakData:_set_easy_wish()
	self.suspicion.max_value = 9
	self.suspicion.range_mul = 1
	self.suspicion.buildup_mul = 1
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.3
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.35
	end
	self.damage.custody_ammo_drained  = 0.75
	self.damage.REVIVE_HEALTH_STEPS = {
		0.70,
		0.60,
		0.50,
		0.40,
		0.30
	}
end

function PlayerTweakData:_set_overkill_290()
	self.suspicion.max_value = 9
	self.suspicion.range_mul = 1.1
	self.suspicion.buildup_mul = 1.1
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.3
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.35
	end
	self.damage.REVIVE_HEALTH_STEPS = {
		0.30
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
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			0
		}
	}
	self.damage.custody_ammo_drained = 0.75
end

function PlayerTweakData:_set_sm_wish()
	self.suspicion.max_value = 10
	self.suspicion.range_mul = 1.2
	self.suspicion.buildup_mul = 1.2
	if pro_job then
		self.damage.MIN_DAMAGE_INTERVAL = 0.2
	else
		self.damage.MIN_DAMAGE_INTERVAL = 0.25
	end
	self.damage.REVIVE_HEALTH_STEPS = {
		0.3
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
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			0
		}
	}
	self.damage.custody_ammo_drained  = 0.75
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
	self.terminal_velocity = -7000 --these numbers are never used afaik, but just to be safe...
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
	self.damage.LIVES_INIT = 4
	self.damage.REGENERATE_TIME = 3
	self.damage.REVIVE_HEALTH_STEPS = {
		1.00,
		0.75,
		0.60,
		0.45,
		0.30
	}
	self.damage.CUSTODY_LIVES = 2 --Number of lives left when leaving custody. (downs = lives - 1)
	self.damage.custody_ammo_drained = 0 --% of ammo confiscated when leaving custody.
	self.damage.BLEED_OT_TIME = 40
	self.damage.TASED_TIME = 10
	self.damage.STUN_TIME = 1
	self.damage.TASED_RECOVER_TIME = 1
	self.damage.BLEED_OUT_HEALTH_INIT = 20
	self.damage.DOWNED_TIME = 30
	--Used to determine penalties for down timer when returning from custody
	self.damage.DOWNED_TIME_DEC = 0
	self.damage.DOWNED_TIME_MIN = 10
	self.damage.ARRESTED_TIME = 30
	self.damage.INCAPACITATED_TIME = 30
	self.damage.MIN_DAMAGE_INTERVAL = 0.3
	self.damage.respawn_time_penalty = 30
	self.damage.base_respawn_time_penalty = 5
	self.damage.automatic_assault_ai_trade_time = 240
	self.damage.automatic_assault_ai_trade_time_max = 300
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
	self.TRANSITION_DURATION = 0.2
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
	self.stances.default.standard.head.translation = Vector3(0, 0, 153)
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
	self.stances.default.mask_off.head.translation = Vector3(0, 0, 169)
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
	self.stances.default.player_turret = deep_clone(self.stances.default.standard)
	self.stances.default.player_turret.head.translation = Vector3(0, 0, 161)
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
	self.movement_state.standard.gravity = 982 --used in the calculation in playerstandard for applying correct damping, does not actually change gravity
	self.movement_state.standard.terminal_velocity = 7000 --used in the calculation in playerstandard for proper falling, change as you will it
	self.movement_state.standard.movement.speed.STANDARD_MAX = 350
	self.movement_state.standard.movement.speed.RUNNING_MAX = 575
	self.movement_state.standard.movement.speed.CROUCHING_MAX = 225
	self.movement_state.standard.movement.speed.STEELSIGHT_MAX = 185 --Isn't used anymore since ADS speed is now a speed mult applied to w/e state you're in now
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
	self.movement_state.stamina.JUMP_STAMINA_DRAIN = 2 --Unused for vanilla movement mechanics
	self.movement_state.stamina.SPRINT_JUMP_STAMINA_DRAIN = 0
	
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


local pivot_shoulder_translation
local pivot_shoulder_rotation
local pivot_head_translation
local pivot_head_rotation

local default_new_stances = PlayerTweakData._init_new_stances
function PlayerTweakData:_init_new_stances()
	default_new_stances(self)
	self:_init_bessy()
	--Ak5
	pivot_shoulder_translation = Vector3(10.6877, 15.6166, -2.8033)
	pivot_shoulder_rotation = Rotation(0.106298, -0.085067, 0.62852)
	pivot_head_translation = Vector3(-0.005, 8, 0)
	pivot_head_rotation = Rotation(0.023, 0, 0)
	self.stances.ak5.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.ak5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

function PlayerTweakData:_init_bessy()
	self.stances.bessy = deep_clone(self.stances.default)
	local pivot_shoulder_translation = Vector3(8.65829, 40.5137, -4.02908)
	local pivot_shoulder_rotation = Rotation(0.106703, -0.0851106, 0.628477)
	local pivot_head_translation = Vector3(8, 40, -4)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.bessy.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.bessy.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.bessy.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -50, 0)
	self.stances.bessy.standard.vel_overshot.yaw_neg = 15
	self.stances.bessy.standard.vel_overshot.yaw_pos = -15
	self.stances.bessy.standard.vel_overshot.pitch_neg = -15
	self.stances.bessy.standard.vel_overshot.pitch_pos = 15
	local pivot_head_translation = Vector3(0, 35, 2)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.bessy.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.bessy.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.bessy.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -50, 0)
	self.stances.bessy.steelsight.vel_overshot.yaw_neg = 0
	self.stances.bessy.steelsight.vel_overshot.yaw_pos = -0
	self.stances.bessy.steelsight.vel_overshot.pitch_neg = -0
	self.stances.bessy.steelsight.vel_overshot.pitch_pos = 0
	local pivot_head_translation = Vector3(8, 36, -3)
	local pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.bessy.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.bessy.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.bessy.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, -30, 0)
end

-- MP7
local default_init_mp7 = PlayerTweakData._init_mp7
function PlayerTweakData:_init_mp7()
	default_init_mp7(self)
	pivot_shoulder_translation = Vector3(10.6576, 18.2065, -5.75727)
	pivot_shoulder_rotation = Rotation(0.106663, -0.0849503, 0.628575)
	pivot_head_translation = Vector3(-0.02, 14, -0.1)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.mp7.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.mp7.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

local default_init_hk21 = PlayerTweakData._init_hk21
function PlayerTweakData:_init_hk21()
	default_init_hk21(self)
	pivot_shoulder_translation = Vector3(8.545, 11.3934, -3.33201)
	pivot_shoulder_rotation = Rotation(4.78916e-05, 0.00548037, -0.00110991)
	pivot_head_translation = Vector3(8, 6, -4)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.hk21.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk21.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()

	pivot_shoulder_translation = Vector3(8.59464, 11.3996, -3.26142)
	pivot_shoulder_rotation = Rotation(7.08051E-6, 0.00559065, 3.07211E-4)    
	pivot_head_translation = Vector3(0.03, 15, 0.1) -- 8, 10, -1
	pivot_head_rotation = Rotation(0.05, 0.2, 0) -- 0.2, 0.2, -8
	self.stances.hk21.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk21.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 18, -4)
	pivot_head_rotation = Rotation(0, 0, 0)
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
	pivot_shoulder_translation = Vector3(10.716, 4, -0.55)
	pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
	pivot_head_translation = Vector3(0, 12, 0) -- 10, 12, -2
	pivot_head_rotation = Rotation(0, 0, 0) -- 0, 0, -5
	self.stances.m249.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m249.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 19, -5)
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
	pivot_shoulder_translation = Vector3(10.6725, 27.7166, -4.93564)
	pivot_shoulder_rotation = Rotation(0.1067, -0.0850111, 0.629008)
	pivot_head_translation = Vector3(0, 28, 0)  -- 6, 30, -1
	pivot_head_rotation = Rotation(0, 0, 0)  -- 0, 0, -5
	self.stances.rpk.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.rpk.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 40, -5)
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
	pivot_shoulder_translation = Vector3(10.713, 47.8277, 0.873785)
	pivot_shoulder_rotation = Rotation(0.10662, -0.0844545, 0.629209)
	pivot_head_translation = Vector3(0, 40, 0)  -- default = 3,40,-2
	pivot_head_rotation = Rotation(0, 0, 0)      -- default = 0, 0, -2
	self.stances.mg42.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 62, -6)
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
	pivot_shoulder_translation = Vector3(10, 4, -4)
	pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
	pivot_head_translation = Vector3(-0.0125, 12, -0.07) -- 10, 12, -2
	pivot_head_rotation = Rotation(0.1, 0, 0.5) -- 0, 0, -5
	self.stances.par.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.par.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 15, -8)
	self.stances.par.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.par.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.par.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.par.bipod.vel_overshot.yaw_neg = 0
	self.stances.par.bipod.vel_overshot.yaw_pos = 0
	self.stances.par.bipod.vel_overshot.pitch_neg = 0
	self.stances.par.bipod.vel_overshot.pitch_pos = 0
	self.stances.par.bipod.shakers = {breathing = {amplitude = 0}}		
end

-- M60
local default_init_m60 = PlayerTweakData._init_m60
function PlayerTweakData:_init_m60()
	default_init_m60(self)
	pivot_shoulder_translation = Vector3(10.716, 4, -0.1)
	pivot_shoulder_rotation = Rotation(0.106596, -0.0844502, 0.629187)    
	pivot_head_translation = Vector3(0, -2, 0)
	pivot_head_rotation = Rotation(-0.13, 0, 0)
	self.stances.m60.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m60.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(0, 18, -5.5)
	self.stances.m60.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.m60.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	self.stances.m60.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, 0)
	self.stances.m60.bipod.vel_overshot.yaw_neg = 0
	self.stances.m60.bipod.vel_overshot.yaw_pos = 0
	self.stances.m60.bipod.vel_overshot.pitch_neg = 0
	self.stances.m60.bipod.vel_overshot.pitch_pos = 0
	self.stances.m60.bipod.shakers = {breathing = {amplitude = 0}}		
end

-- M202
local default_init_ray = PlayerTweakData._init_ray
function PlayerTweakData:_init_ray()
	default_init_ray(self)
	pivot_shoulder_translation = Vector3(2.48815, 7.60753, -5.20907)
	pivot_shoulder_rotation = Rotation(0.106386, -0.085203, 0.628541)
	pivot_head_translation = Vector3(0, 10, 0)
	pivot_head_rotation = Rotation(0.11, -0.25, 0)
	self.stances.ray.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.ray.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end


local default_init_x_sr2 = PlayerTweakData._init_x_sr2
function PlayerTweakData:_init_x_sr2()
	default_init_x_sr2(self)
	pivot_shoulder_translation = Vector3(10.9257, 47.3309, -0.659333)
	pivot_shoulder_rotation = Rotation(-7.3371e-08, -8.32429e-06, -1.70755e-06)
	pivot_head_translation = Vector3(10.5, 48, -5)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.x_sr2.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.x_sr2.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(10.5, 66, -2)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.x_sr2.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.x_sr2.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(10.5, 45, -3)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.x_sr2.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.x_sr2.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- CZ92
local default_init_czech = PlayerTweakData._init_czech
function PlayerTweakData:_init_czech()
	default_init_czech(self)
	pivot_shoulder_translation = Vector3(8.66723, 30.1231, -3.12016)
	pivot_shoulder_rotation = Rotation(3.37549e-05, 0.000953238, -0.000301382)
	pivot_head_translation = Vector3(0, 34, 0)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.czech.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.czech.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- HK51b
local default_init_hk51b = PlayerTweakData._init_hk51b
function PlayerTweakData:_init_hk51b()
	default_init_hk51b(self)
	pivot_shoulder_translation = Vector3(8.545, 11.3934, -3.33201)
	pivot_shoulder_rotation = Rotation(4.78916e-05, 0.00548037, -0.00110991)
	pivot_head_translation = Vector3(-2.15, 5, -0)
	pivot_head_rotation = Rotation(-0.1, 0.2, 0)
	self.stances.hk51b.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.hk51b.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- AA12
local default_init_aa12 = PlayerTweakData._init_aa12
function PlayerTweakData:_init_aa12()
	default_init_aa12(self)	
	pivot_shoulder_translation = Vector3(11.2307, 17.5519, -1.27527)
	pivot_shoulder_rotation = Rotation(6.51011e-06, -0.000117821, -8.70849e-05)
	pivot_head_translation = Vector3(10, 20, -2)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.aa12.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.aa12.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(9, 18, -2)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.aa12.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.aa12.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- G26
local default_init_g26 = PlayerTweakData._init_g26
function PlayerTweakData:_init_g26()
	default_init_g26(self)
	pivot_shoulder_translation = Vector3(8.49051, 38.6474, -5.09399)
	pivot_shoulder_rotation = Rotation(0.0999949, -0.687702, 0.630304)
	pivot_head_translation = Vector3(0, 37, 0.4)
	pivot_head_rotation = Rotation(0, 0, 0)
	self.stances.g26.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.g26.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- P08
local default_init_breech = PlayerTweakData._init_breech
function PlayerTweakData:_init_breech()
	default_init_breech(self)
	pivot_shoulder_translation = Vector3(8.14622, 27.4494, -3.81421)
	pivot_shoulder_rotation = Rotation(0.160076, -0.075191, -0.10197)
	pivot_head_translation = Vector3(0, 33, -0.08)
	pivot_head_rotation = Rotation(0.025, 0.4, 0)
	self.stances.breech.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.breech.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
end

-- ChainSAW
local default_init_kacchainsaw = PlayerTweakData._init_kacchainsaw
function PlayerTweakData:_init_kacchainsaw()
	default_init_kacchainsaw(self)	
	pivot_shoulder_translation = Vector3(10.7056, 4.38842, -0.747177)
	pivot_shoulder_rotation = Rotation(0.106618, -0.084954, 0.62858)
	pivot_head_translation = Vector3(11, 9, -3.5)
	pivot_head_rotation = Rotation(-0.9, -3.4, 0)
	self.stances.kacchainsaw.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.kacchainsaw.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(10, 5, -4.5)
	pivot_head_rotation = Rotation(-0.9, -3.4, -5)
	self.stances.kacchainsaw.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.kacchainsaw.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	pivot_head_translation = Vector3(7.5, 6, -2)
	pivot_head_rotation = Rotation(-1, -3.4, -5)
	self.stances.kacchainsaw.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.kacchainsaw.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- Supernova
local default_init_supernova = PlayerTweakData._init_supernova
function PlayerTweakData:_init_supernova()
	default_init_supernova(self)	
	pivot_shoulder_translation = Vector3(7.5, 16.5, -3.5)
	pivot_shoulder_rotation = Rotation(0, 0, 0.35)
	pivot_head_translation = Vector3(-0.84, 18, 1.392)
	pivot_head_rotation = Rotation(-0.43, 0.21, 0)
	self.stances.supernova.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.supernova.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end

-- AWP
local default_init_awp = PlayerTweakData._init_awp
function PlayerTweakData:_init_awp()
	default_init_awp(self)	
	pivot_shoulder_translation = Vector3(8.66059, 40.8349, -3.2711)
	pivot_shoulder_rotation = Rotation(0.106694, -0.0848914, -3)
	pivot_head_translation = Vector3(-1.525, 3, -2.255)
	pivot_head_rotation = Rotation(0.12, -0.07, 0)
	self.stances.awp.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
	self.stances.awp.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
end



if SystemFS:exists("assets/mod_overrides/AR15 Overhaul") then
	Hooks:PostHook(PlayerTweakData, "_init_new_stances", "fnuxar15overhaul_fix", function(self)	
		local pivot_shoulder_translation
		local pivot_shoulder_rotation
		local pivot_head_translation
		local pivot_head_rotation
		pivot_shoulder_translation = Vector3(8.3958, 23.0133, -1.675)
		pivot_shoulder_rotation = Rotation(0.106673, -0.0849742, 0)
		pivot_head_translation = Vector3(-0.02, 14, 0)
		pivot_head_rotation = Rotation(0.11, -0.075, 0)
		self.stances.amcar.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.amcar.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_shoulder_translation = Vector3(8.4212, 23.0133, -2.1573)
		pivot_shoulder_rotation = Rotation(0, 0, 0)
		pivot_head_translation = Vector3(0.01, 10.01, 0)
		pivot_head_rotation = Rotation(0.01, 0.01, 0)
		self.stances.new_m4.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.new_m4.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_shoulder_translation = Vector3(8.3958, 23.0133, -1.675)
		pivot_shoulder_rotation = Rotation(0.107116, -0.0847403, 0)
		pivot_head_translation = Vector3(-0.02, 14, 0)
		pivot_head_rotation = Rotation(0.12, -0.05, 0)
		self.stances.m16.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.m16.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		self.stances.olympic.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.olympic.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_shoulder_translation = Vector3(8.3653, 15.6166, -3.0008)
		pivot_shoulder_rotation = Rotation(0.106298, -0.085067, 0)
		pivot_head_translation = Vector3(-0.04, 18, -0.02)
		pivot_head_rotation = Rotation(0.1, -0.05, 0)
		self.stances.ak5.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.ak5.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		pivot_shoulder_translation = Vector3(8.3653, 19.971, -3.3989)
		pivot_shoulder_rotation = Rotation(0.10658, -0.0846555, 0)
		pivot_head_translation = Vector3(-0.05, 15, -0.15)
		pivot_head_rotation = Rotation(0.1, 0, 0)
		self.stances.vityaz.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.vityaz.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
		--SCAR is aligned as far as I can tell, no changes needed
	end)
end

if SystemFS:exists("assets/mod_overrides/Patchett Proper Hold Reload Animations") then
	Hooks:PostHook(PlayerTweakData, "_init_new_stances", "jamview_fix", function(self)
	
		local pivot_shoulder_translation = Vector3(10.704, 1.084, -6.406)
		local pivot_shoulder_rotation = Rotation(0.1355, -0.14, 0.5)     
		local pivot_head_translation = Vector3(0, 10, 0)
		local pivot_head_rotation = Rotation(0, 0, 0)
		self.stances.sterling.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation:rotate_with(pivot_shoulder_rotation:inverse()):rotate_with(pivot_head_rotation)
		self.stances.sterling.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation:inverse()
	
	end )
end

local static_aim = restoration.Options:GetValue("OTHER/WeaponHandling/StaticAim")
local vm_move = restoration.Options:GetValue("OTHER/WeaponHandling/ViewmodelMovement") or 2
Hooks:PostHook(PlayerTweakData, "_init_new_stances", "resmodviwemodeldrag", function(self)
	for wep_id, i in pairs(self.stances) do
		if self.stances[ wep_id ] then
			if vm_move ~= 1 then
				for stance_id, v in pairs(self.stances[ wep_id ]) do
					if stance_id == "standard" or stance_id == "crouched" or stance_id == "steelsight" then
						self.stances[ wep_id ][ stance_id ].vel_overshot.yaw_neg = (vm_move == 2 and -9) or (vm_move == 3 and 9) or (vm_move == 4 and 0)
						self.stances[ wep_id ][ stance_id ].vel_overshot.yaw_pos = (vm_move == 2 and 9) or (vm_move == 3 and -9) or (vm_move == 4 and 0)
						self.stances[ wep_id ][ stance_id ].vel_overshot.pitch_neg = (vm_move == 2 and 9 / 1.5) or (vm_move == 3 and -9 / 1.5) or (vm_move == 4 and 0)
						self.stances[ wep_id ][ stance_id ].vel_overshot.pitch_pos = (vm_move == 2 and -9) or (vm_move == 3 and 9) or (vm_move == 4 and 0)
					end
				end
			end
			if static_aim then
				if self.stances[ wep_id ].steelsight then
					self.stances[ wep_id ].steelsight.shakers.breathing.amplitude = 0
					self.stances[ wep_id ].steelsight.vel_overshot.yaw_neg = 0
					self.stances[ wep_id ].steelsight.vel_overshot.yaw_pos = 0
					self.stances[ wep_id ].steelsight.vel_overshot.pitch_neg = 0
					self.stances[ wep_id ].steelsight.vel_overshot.pitch_pos = 0
				end
			end
		end
	end
end)


if SystemFS:exists("assets/mod_overrides/Crosskill Fixed Scale") then
	Hooks:PostHook(PlayerTweakData, "_init_new_stances", "crosskillscalefix", function(self)
		self.stances.colt_1911.steelsight.shoulders.translation = Vector3(-8.61721, -8.12715, 4.09579)
	end)
end	