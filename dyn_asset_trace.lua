-- TEMPORARY DIAGNOSTIC - delete this file and its dofile() line in Corepre.lua
-- once the crashing asset has a name.
--
-- BeardLib hands every load="true" entry to DynamicResourceManager one file at a
-- time. When one of them faults, the stack shows dynamicresourcemanager.lua:151
-- and nothing else - it never says WHICH file. BeardLib's own DevLog would say,
-- but it is hard-disabled upstream ("if false and self.log").
--
-- So: write the path out and flush it BEFORE handing it over. After a crash the
-- last line of mods/logs/dyn_asset_trace.txt is the asset that killed it.

local fm = BeardLib and BeardLib.Managers and BeardLib.Managers.File

if fm and not fm._resmod_asset_trace then
	fm._resmod_asset_trace = true

	local trace = io.open("mods/logs/dyn_asset_trace.txt", "w")
	if trace then
		trace:write("-- BeardLib -> dyn_resource load trace. Last line = last thing handed over.\n")
		trace:flush()
	end

	local orig_load = fm._LoadAsset
	function fm:_LoadAsset(load, ...)
		if trace then
			local name = load.file_path
			if not name then
				name = tostring(load.b) .. "." .. tostring(load.a)
			end
			trace:write(tostring(name) .. "\n")
			trace:flush()
		end
		return orig_load(self, load, ...)
	end

	-- LoadAsset silently drops anything missing from the DB, and its warning has
	-- no format arguments upstream, so the log never names it. Name it here.
	local orig_add = fm.LoadAsset
	function fm:LoadAsset(ext, path, file_path, ...)
		if trace and not DB:has(ext, path) and not self:Has(ext, path) then
			trace:write("SKIPPED (not in DB): " .. tostring(file_path) .. "\n")
			trace:flush()
		end
		return orig_add(self, ext, path, file_path, ...)
	end

	log("[RestorationMod] dyn_asset_trace armed -> mods/logs/dyn_asset_trace.txt")
else
	log("[RestorationMod] dyn_asset_trace: BeardLib.Managers.File not available yet")
end
