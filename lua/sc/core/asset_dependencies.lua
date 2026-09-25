-- Source-only dependency discovery. Never execute sequence expressions.
-- Native unit loading retains responsibility for models, physics and materials.
local D = {}
D.__index = D
local readable = {unit=true, object=true, material_config=true, sequence_manager=true}
local dynamic = {unit=true, effect=true}
local declared_types = {unit=true, object=true, model=true, material_config=true,
    texture=true, effect=true, sequence_manager=true, animation_def=true,
    animation=true, animation_states=true, animation_state_machine=true,
    animation_subset=true, cooked_physics=true}

local function literal(value)
    if type(value) ~= "string" then return nil end
    return value:match("^%s*'([^']+)'%s*$") or value:match('^%s*"([^"]+)"%s*$')
end

function D.new(specs)
    local self = setmetatable({specs={}, nodes={}, plans={}, notes={}}, D)
    for _, spec in ipairs(specs) do
        self.specs[spec.extension .. "|" .. spec.dbpath] = spec
    end
    return self
end

function D:note(message)
    if not self.notes[message] then
        self.notes[message] = true
        log("[RestorationMod] Dependency audit: " .. message)
    end
end

function D:edges(ext, path)
    local key = ext .. "|" .. path
    if self.nodes[key] then return self.nodes[key] end
    local result = {}
    local spec = self.specs[key]
    if not spec or not readable[ext] then self.nodes[key] = result; return result end
    local source = spec.xml_convert and spec.xml_convert.path or spec.file
    local file, why = io.open(source, "rb")
    if not file then error("[RestorationMod] Cannot audit " .. key .. ": " .. tostring(why)) end
    local bytes = file:read("*a")
    file:close()
    assert(bytes, "[RestorationMod] Cannot read dependency source: " .. source)
    bytes = bytes:gsub("^\239\187\191", "")
    if not bytes:match("^%s*<") then
        self:note("Opaque source; engine resolves its dependencies: " .. key)
        self.nodes[key] = result
        return result
    end
    local root = assert(blt.parsexml(bytes), "[RestorationMod] Invalid dependency XML: " .. source)
    local seen = {}
    local function add(kind, name)
        if type(name) ~= "string" or name == "" then return end
        local depkey = kind .. "|" .. name
        if not seen[depkey] then
            seen[depkey] = true
            result[#result+1] = {name, kind, key}
        end
    end
    local function walk(node)
        local tag, p = node.name, node.params or {}
        if tag == "depends_on" then
            for kind, name in pairs(p) do
                if declared_types[kind] then add(kind, name)
                else self:note("Engine-managed dependency type " .. kind .. " in " .. key) end
            end
        elseif ext == "unit" then
            if tag == "object" and p.file then add("object", p.file)
            elseif tag == "var" and (p.name == "_head_gear" or p.name == "_head") then
                if p.value and p.value:match("^units/") then add("unit", p.value) end
            end
        elseif ext == "object" then
            if tag == "diesel" then
                add("model", p.file or path)
                add("material_config", p.materials)
            elseif tag == "sequence_manager" then add("sequence_manager", p.file)
            elseif tag == "animation_def" then add("animation_def", p.name) end
        elseif ext == "material_config" then
            if tag and tag:find("texture", 1, true) and p.file then add("texture", p.file) end
        elseif ext == "sequence_manager" then
            if tag == "spawn_unit" then
                local name = literal(p.name)
                if name then add("unit", name)
                else self:note("Computed spawn name needs explicit preload coverage in " .. key .. ": " .. tostring(p.name)) end
            elseif tag == "effect" then
                local name = literal(p.name)
                if name then add("effect", name) end
            end
        end
        for _, child in ipairs(node) do walk(child) end
    end
    walk(root)
    table.sort(result, function(a,b) return a[2] .. "|" .. a[1] < b[2] .. "|" .. b[1] end)
    self.nodes[key] = result
    return result
end

function D:plan(name, roots)
    local cached = self.plans[name]
    if cached then return cached end
    local plan = {loads={}, requirements={}}
    local visiting, visited, emitted, required = {}, {}, {}, {}
    local function visit(path, ext, is_root)
        local key = ext .. "|" .. path
        if visited[key] or visiting[key] then return end
        visiting[key] = true
        for _, edge in ipairs(self:edges(ext, path)) do
            local depkey = edge[2] .. "|" .. edge[1]
            if not required[depkey] then
                required[depkey] = true
                plan.requirements[#plan.requirements+1] = edge
            end
            visit(edge[1], edge[2], false)
        end
        visiting[key], visited[key] = nil, true
        if (is_root or dynamic[ext]) and not emitted[key] then
            emitted[key] = true
            plan.loads[#plan.loads+1] = {path, ext}
        end
    end
    for _, item in ipairs(roots) do
        visit(item[1], item[2], true)
        local key = item[2] .. "|" .. item[1]
        if not emitted[key] then
            emitted[key] = true
            plan.loads[#plan.loads+1] = {item[1], item[2]}
        end
    end
    self.plans[name] = plan
    log(string.format("[RestorationMod] Dependency plan '%s': %d roots, %d unique preload requests, %d referenced resources",
        name, #roots, #plan.loads, #plan.requirements))
    return plan
end

function D:validate(plan)
    for _, edge in ipairs(plan.requirements) do
        if not DB:has(Idstring(edge[2]), Idstring(edge[1])) then
            return false, "Missing dependency " .. edge[2] .. "|" .. edge[1] .. " referenced by " .. edge[3]
        end
    end
    return true
end

return D
