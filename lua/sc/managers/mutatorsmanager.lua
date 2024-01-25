function MutatorsManager:init()
	self:ProfileLoad()

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
		MutatorMediDozer:new(self),
		MutatorCloakerEffect:new(self),
		MutatorShieldDozers:new(self),
		MutatorTitandozers:new(self),
		MutatorPiggyBank:new(self),
		MutatorCG22:new(self),
		MutatorPiggyRevenge:new(self),
		--Custom mutators below
		MutatorMinidozers:new(self),
		MutatorMedicdozers:new(self),
		MutatorFatRoll:new(self),
		MutatorMememanOnly:new(self),
		MutatorMoreDonutsPlus:new(self),
		MutatorJungleInferno:new(self),
		MutatorNoTitans:new(self),
		MutatorSpawnMult:new(self),
		MutatorBravosOnly:new(self),
		MutatorKaboom:new(self),		
		MutatorFartSmella:new(self),
		MutatorCloakerFlashbang:new(self),
		MutatorCloakerCuff:new(self),
		MutatorFastResponse:new(self),
		MutatorFullAutoInBuilding:new(self),
		MutatorQuickScope360:new(self),
		MutatorCrazyTaser:new(self),
		MutatorMasterDodger:new(self),
		MutatorGoldfarbDozers:new(self),
		MutatorOverheal:new(self),
		MutatorASUBuff:new(self),
		MutatorBoFlashbang:new(self),
		MutatorGrenadeMayhem:new(self),
		MutatorNoOutlines:new(self),
		MutatorCaptainReplacer:new(self),
		MutatorSpoocSquad:new(self),
		--MutatorFactionsReplacer:new(self),
		MutatorBirthday:new(self)
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
		"crime_spree",
		"holiday",
		"old_event"
	}
end

--No more disabling achievos/progress
function MutatorsManager:are_achievements_disabled()
	return false
end

function MutatorsManager:should_disable_statistics()
	return false
end

Hooks:PostHook(MutatorsManager, "set_enabled", "res_set_enabled", function(self)
	self:ProfileSave()
end)

function MutatorsManager:ProfileLoad()
	local file = io.open(SavePath .. "ResMutatorsSave.json", "r")
	
	if not file then 
		return false 
	end
	
	local fileT= file:read("*all"):gsub("%[%],","{},") 
	file : close()
	
	if string.len(fileT) < 10 or fileT == "[]" then 
		return 
	end
	
	Global.mutators = Global.mutators or { mutator_values = {}, active_on_load = {} }
	Global.mutators.mutator_values = json.decode(fileT)
end

function MutatorsManager:ProfileSave()
	local file = io.open(SavePath .. "ResMutatorsSave.json", "w+")
	if not file then 
		return false 
	end
	
	file:write(json.encode(Global.mutators.mutator_values))
	file:close()
end