function MutatorsManager:init()
	managers.mutators = self
	self._message_system = MessageSystem:new()
	self._lobby_delay = -1

	if not Global.mutators then
		Global.mutators = {
			mutator_values = {},
			active_on_load = {}
		}
	end

	self._mutators = {
		MutatorEnemyHealth:new(self),
		MutatorEnemyDamage:new(self),
		MutatorFriendlyFire:new(self),
		MutatorShotgunTweak:new(self),
		MutatorExplodingEnemies:new(self),
		MutatorHydra:new(self),
		MutatorEnemyReplacer:new(self),
		MutatorMedicdozers:new(self),
		MutatorCloakerEffect:new(self),
		MutatorShieldDozers:new(self),
		MutatorTitandozers:new(self),
		MutatorMinidozers:new(self),
		MutatorFatRoll:new(self),
		MutatorMememanOnly:new(self),	
		MutatorMoreDonutsPlus:new(self),
		MutatorJungleInferno:new(self),
		MutatorNoTitans:new(self),
		--MutatorFactionsReplacer:new(self),
		--MutatorZombieOutbreak:new(self)
	}
	self._active_mutators = {}
	local activate = Global.mutators and Global.mutators.active_on_load

	if not self:can_mutators_be_active() then
		activate = false
	end

	if activate then
		for id, data in pairs(Global.mutators.active_on_load) do
			cat_print("jamwil", "[Mutators] Attempting to activate mutator: ", id)

			local mutator = self:get_mutator_from_id(id)

			if mutator then
				table.insert(self:active_mutators(), {mutator = mutator})
				cat_print("jamwil", "[Mutators] Activated mutator: ", id)
			else
				cat_print("jamwil", "[Mutators] No mutator with id: ", id)
			end

			for key, value in pairs(data) do
				if Network:is_client() then
					mutator:set_host_value(key, value)
				end
			end
		end
	end

	local setup_mutators = {}

	for _, active_mutator in pairs(self:active_mutators()) do
		table.insert(setup_mutators, active_mutator.mutator)
	end

	table.sort(setup_mutators, function (a, b)
		return b.load_priority < a.load_priority
	end)

	for _, mutator in pairs(setup_mutators) do
		cat_print("jamwil", "[Mutators] Setting up active mutator: ", mutator:id())
		mutator:setup(self)
	end
end