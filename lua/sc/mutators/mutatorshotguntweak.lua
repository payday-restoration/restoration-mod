MutatorShotgunTweak.reductions = {
	money = 0,
	exp = 0
}
MutatorShotgunTweak.disables_achievements = false

function MutatorShotgunTweak:setup(mutator_manager)
	--Actually enable Shotgun Push
	tweak_data.disable_shotgun_push = false

	mutator_manager:register_message(Message.OnShotgunPush, "ShotgunTweak", callback(self, self, "_on_shotgun_push"))

	self._sound_device = SoundDevice:create_source("MutatorShotgunTweak")
end