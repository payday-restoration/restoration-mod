-- Remove position reservations on death
-- Improve reaction to ECM feedback by playing specific voicelines and pain sounds
if Network:is_server() then
	Hooks:PostHook(CopActionHurt, "init", "sh_init", function (self)
		if self._hurt_type == "death" then
			self._unit:brain():rem_all_pos_rsrv()
		elseif self._hurt_type == "hurt_sick" then
			local t = TimerManager:game():time()
			self._say_sick_t = t + math.rand((self._sick_time - t) * 0.5)
			self._say_hurt_t = t + math.rand(2, 5)
		end
	end)
end

-- Make sick update finish their hurt exit anims before expiring
Hooks:OverrideFunction(CopActionHurt, "_upd_sick", function (self, t)
	if self._sick_time then
		if self._say_sick_t and t > self._say_sick_t then
			managers.groupai:state():chk_say_enemy_chatter(self._unit, self._common_data.pos, "jammer")
			self._say_sick_t = nil
		elseif self._say_hurt_t and t > self._say_hurt_t and not self._unit:sound():speaking(t) then
			self._unit:sound():say("x01a_any_3p", true)
			self._say_hurt_t = t + math.rand(2, 5)
		end

		if t > self._sick_time then
			self._ext_movement:play_redirect("idle")
			self._sick_time = nil
		end
	elseif not self._ext_anim.hurt then
		self._expired = true
	end
end)

-- Prevent hurt and knockdown animations stacking, once one plays it needs to finish for another one to trigger
CopActionHurt.hurt_blocks = {
	heavy_hurt = true,
	hurt = true,
	hurt_sick = true,
	knock_down = true,
	poison_hurt = true,
	shield_knock = true,
	stagger = true
}

Hooks:OverrideFunction(CopActionHurt, "chk_block", function (self, action_type, t)
	if self._hurt_type == "death" then
		return true
	elseif self.hurt_blocks[action_type] and not self._ext_anim.hurt_exit then
		return true
	elseif action_type == "turn" then
		return true
	elseif action_type == "death" then
		return false
	end

	return CopActionAct.chk_block(self, action_type, t)
end)

-- Fix pseudo random number generator having very low entropy
function CopActionHurt:_pseudorandom(a, b)
	if CopActionHurt._host_peer == nil then
		CopActionHurt._host_peer = Network:is_client() and managers.network:session():peer(1) or false
	end

	local ht = managers.game_play_central:get_heist_timer()
	if CopActionHurt._host_peer then
		ht = ht + Network:qos(CopActionHurt._host_peer:rpc()).ping / 1000
	end

	-- Switch seed 4 times a second, switching too much would make the PRNG depend on client ping too much
	ht = math.round(ht * 4)

	-- Adapted from https://stackoverflow.com/a/35377265
	ht = ht * 3266489917 + 374761393;
	ht = bit.bor(bit.lshift(ht, 17), bit.rshift(ht, 15))
	ht = ht + self._unit:id() * 3266489917;
	ht = ht * 668265263;
	ht = bit.bxor(ht, bit.rshift(ht, 15)) * 2246822519;
	ht = bit.bxor(ht, bit.rshift(ht, 13)) * 3266489917;
	ht = bit.bxor(ht, bit.rshift(ht, 16));

	local val = bit.band(ht, 0xffffff) / 0x1000000
	if a and b then
		return math.floor(math.lerp(a, b + 1, val))
	elseif a then
		return math.floor(math.lerp(1, a + 1, val))
	else
		return val
	end
end