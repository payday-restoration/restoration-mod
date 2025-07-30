-- Option 1: Hook CoreSetup:init (earliest possible)
Hooks:PostHook(CoreSetup, "init", "OverridePickFunction", function(self)
	-- Store original pick function
	if not _G._original_pick then -- Only do this once
		_G._original_pick = pick
		
		-- Override pick function to use unit-based seeding for consistent client sync
		function pick(...)
			local args = {...}
			local current_unit = nil
			
			-- Get current unit from sequence environment
			if SequenceEnvironment and SequenceEnvironment.self and SequenceEnvironment.self.dest_unit then
				current_unit = SequenceEnvironment.self.dest_unit
			end
			
			-- If we have a unit and we're in a networked session
			if current_unit and alive(current_unit) and managers and managers.network and managers.network:session() then
				-- Use unit hash as consistent seed across all clients
				local unit_hash = tostring(current_unit:name())
				local seed = 0
				
				-- Convert hash string to number for seeding
				for i = 1, #unit_hash do
					seed = seed + string.byte(unit_hash, i) * i
				end
				
				-- Add sequence context for additional uniqueness per pick call
				if SequenceEnvironment.self.sequence_name then
					local seq_hash = tostring(SequenceEnvironment.self.sequence_name)
					for i = 1, #seq_hash do
						seed = seed + string.byte(seq_hash, i) * (i + 100)
					end
				end
				
				-- Temporarily override math.random with seeded version
				math.randomseed(seed)
				
				-- Call original pick with seeded randomization
				local result = args[math.random(1, #args)]
				
				-- Restore original random state
				math.randomseed(os.time())
				
				return result
			else
				-- Fallback to original pick if no unit context or no network
				return _G._original_pick(...)
			end
		end
		
	end
end)