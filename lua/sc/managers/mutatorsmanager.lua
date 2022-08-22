local orig_init = MutatorsManager.init
function MutatorsManager:init()
	orig_init(self)
		
	table.insert(self._mutators, MutatorMinidozers:new(self))
	table.insert(self._mutators, MutatorMedicdozers:new(self))
	table.insert(self._mutators, MutatorFatRoll:new(self))
	table.insert(self._mutators, MutatorMememanOnly:new(self))
	table.insert(self._mutators, MutatorMoreDonutsPlus:new(self))
	table.insert(self._mutators, MutatorJungleInferno:new(self))
	table.insert(self._mutators, MutatorNoTitans:new(self))
	table.insert(self._mutators, MutatorSpawnMult:new(self))
	table.insert(self._mutators, MutatorBravosOnly:new(self))
	table.insert(self._mutators, MutatorBirthday:new(self))
	--table.insert(self._mutators, MutatorFactionsReplacer:new(self))
	--table.insert(self._mutators, MutatorZombieOutbreak:new(self))
	
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
				table.insert(self:active_mutators(), {
					mutator = mutator
				})
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

function MutatorsManager:categories()
	return {
		"all",
		"enemies",
		"gameplay",
		"holiday",
		"old_event"
	}
end
