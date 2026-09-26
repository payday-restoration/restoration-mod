-- Restoration ENEMY sequence authority: revision 4.2, wire protocol 4.
-- Install on HOST and all clients; restart. Includes 4.1 join lifecycle fixes.
-- Full hidden-chat messages are capped at 255 bytes, including JSON escaping.
-- Scope: enemy appearance selections and bound appearance children.
-- Physics, effects, gameplay callbacks and their owning sequences execute natively.
-- Civilians, team AI, doors and world props use native sequence execution.
-- Heist environment-profile selection remains host controlled.
-- Install into lua/sc/core/sequence_authority.lua; all peers must update and restart.
-- Host records resolved operations. Clients never run an independent random stream.
local existing = rawget(_G, 'RestorationSequenceAuthority')
if existing then
 assert(type(existing)=='table' and type(existing.install)=='function', '[SequenceAuthority] Existing authority module is incomplete; restart with the complete integrated build')
 return existing
end
local A = {VERSION=4, REVISION='4.2', HANDSHAKE_TIMEOUT=45, MAX_PARTS=4096, CHUNK=600, MAX_WIRE=524288, MAX_HISTORY=8192, RETRY=1}
local unpack=unpack
local function pack(...) return {n=select('#',...),...} end
local function weak() return setmetatable({},{__mode='k'}) end
local function alive_unit(u) return u and alive(u) end
local function sess() return managers and managers.network and managers.network:session() end
local function is_client() return sess() and Network:is_client() end
local function clock() return TimerManager:wall():time() end
local function random_expr(v)
 if type(v)~='string' then return false end
 local i=1
 while i<=#v do
  local c=v:sub(i,i)
  if c=='"' or c=="'" then
   local quote=c;i=i+1
   while i<=#v do
    local x=v:sub(i,i);i=i+1
    if x=='\\' then i=i+1 elseif x==quote then break end
   end
  elseif v:sub(i,i+1)=='--' then
   i=v:find('\n',i+2,true) or (#v+1)
  elseif c=='[' and v:sub(i):match('^%[=*%[') then
   local equals=v:sub(i):match('^%[(=*)%[')
   local finish=v:find(']'..equals..']',i+2+#equals,true)
   i=finish and (finish+2+#equals) or (#v+1)
  elseif c:match('[%a_]') then
   local word=v:sub(i):match('^[%w_]+');i=i+#word
   if word=='pick' or word=='rand' or word=='random' then
    local rest=v:sub(i):match('^%s*(.)')
    if rest=='(' or rest=='{' or rest=='"' or rest=="'" then return true end
   end
  else i=i+1 end
 end
 return false
end
local function hash(s,h)
 h=h or 104729
 for i=1,#s do h=(h*131+s:byte(i))%2147483647 end
 return h
end
local function clean_copy(t) local r={};for k,v in pairs(t or {}) do r[k]=v end;return r end
local function attempt(fn,...)
 local args,result=pack(...)
 local ok,err=pcall(function() result=pack(fn(unpack(args,1,args.n))) end)
 return ok,ok and result or err
end
function A:log(key,message)
 if self.warnings[key] then return end
 self.warnings[key]=true
 if log then log('[SequenceAuthority] '..message) end
end
function A:reset_world()
 self.units,self.nodes,self.default_nodes,self.warnings=weak(),weak(),weak(),{}
 self.registry,self.parts,self.outgoing,self.waiting={},{},{},{}
 self.queued={}
 self.out_head,self.out_tail=1,0
 self.loading_assets={}
 self.global_serial=0
 self.capture,self.replaying,self.spawning=nil,nil,nil
 self.serial=(self.serial or 0)+100000
end
A:reset_world()
A.wrapped=weak()
function A:wrap(c,name,factory)
 if not c or type(c[name])~='function' then return end
 local map=self.wrapped[c] or {};self.wrapped[c]=map
 if map[name]==c[name] then return end
 local f=factory(c[name]);map[name],c[name]=f,f
end
function A:profile() return Global and Global.restoration_sequence_authority end
function A:epoch() local p=self:profile();return p and p.epoch end
-- Native loading closes menus: complete the handshake before that transition.
function A:close_load_dialog()
 if managers and managers.system_menu then managers.system_menu:close('restoration_authority_join') end
end
function A:check_session()
 local session=sess()
 if self.transport_session~=session then
  if self.transport_session then
   self:close_load_dialog()
   self.waiting_load,self.load_permit,self.failed_load_session=nil,nil,nil
   self.pending_intro,self.pending_dropins,self.compatible=nil,nil,nil
   self.parts,self.outgoing,self.queued={},{},{}
   self.out_head,self.out_tail=1,0
  end
  self.transport_session=session
  if session and session._restoration_authority_epoch==self:epoch() then self.compatible=session._restoration_authority_compatible end
 end
end
function A:leave_failed_join(session)
 if sess()~=session then return end
 self.waiting_load,self.load_permit=nil,nil
 self.failed_load_session=session
 self:close_load_dialog()
 if MenuCallbackHandler and MenuCallbackHandler._dialog_leave_lobby_yes then MenuCallbackHandler:_dialog_leave_lobby_yes() end
end
function A:fail_load(reason)
 local w=self.waiting_load
 if not w then return end
 self.waiting_load,self.load_permit=nil,nil
 self.failed_load_session=w.session
 self:close_load_dialog()
 self:log('load-failed:'..w.token,reason..' No client reroll.')
 if managers and managers.system_menu then
  managers.system_menu:show({id='restoration_authority_join',title='Unable to synchronize heist',
   text=reason..'\n\nInstall authority 4.2 on the HOST and every client, then fully restart PAYDAY 2.',
   button_list={{text='Return to menu',callback_func=function() A:leave_failed_join(w.session) end}}})
 end
end
function A:begin_load(session,level,counter,kind,run)
 self:check_session()
 if self.failed_load_session==session then return end
 local old=self.waiting_load
 if old and old.session==session and old.level==level and old.requested_counter==counter and old.kind==kind then return end
 self:close_load_dialog()
 self.serial=self.serial+1
 self.waiting_load={session=session,host=session:server_peer(),token=tostring(self.serial),
  level=level,counter=counter,requested_counter=counter,kind=kind,run=run,started=clock(),retry=0,
  stage='No reply received from host.'}
 self:log('load-gate:'..self.serial,'Authority 4.2: waiting for host environment; counter='..tostring(counter))
 if managers and managers.system_menu then
  managers.system_menu:show({id='restoration_authority_join',title='Synchronizing heist',text='Waiting for host environment choices.',
   button_list={{text='Cancel',callback_func=function() A:leave_failed_join(session) end}}})
 end
end
function A:valid_profile(p,level,counter,epoch)
 if type(p)~='table' or p.level~=level or p.counter~=counter or p.epoch~=epoch or type(epoch)~='string'
  or type(p.enabled)~='boolean' or type(p.settings)~='table' or type(p.rolls)~='table' then return false end
 for i,limit in ipairs({3,2,4,5})do local r=p.rolls[i];if type(r)~='number' or r%1~=0 or r<1 or r>limit then return false end end
 return type(counter)=='number' and counter%1==0
end

function A:state(u)
 local s=self.units[u]
 if not s then
  self.serial=self.serial+1
  s={unit=u,rev=0,applied=0,events={},persistent={},generation=tostring(self.serial),next_request=0}
  self.units[u]=s
  if self.spawning and u~=self.spawning.parent and self:managed(self.spawning.parent) then s.parent,s.slot,s.managed=self.spawning.parent,self.spawning.slot,true end
 end
 return s
end
function A:key(u,depth)
 if not alive_unit(u) or (depth or 0)>12 then return end
 local s=self.units[u]
 if s and s.parent then
  local parent=self:key(s.parent,(depth or 0)+1)
  return parent and (parent..'/child/'..s.slot)
 end
 local ed=u.editor_id and u:editor_id()
 if type(ed)=='number' and ed>0 then return 'e:'..tostring(ed) end
 local ud=u.unit_data and u:unit_data()
 if ud and type(ud.unit_id)=='number' and ud.unit_id>0 then return 'e:'..tostring(ud.unit_id) end
 local id=u.id and u:id()
 if type(id)=='number' and id>0 then return 'n:'..tostring(id) end
end
function A:find(key)
 local u=self.registry[key]
 if alive_unit(u) and self:key(u)==key then return u end
 for unit in pairs(self.units) do
  if alive_unit(unit) and self:key(unit)==key then self.registry[key]=unit;return unit end
 end
 local ed=type(key)=='string' and key:match('^e:(%d+)$')
 local wd=managers and managers.worlddefinition
 if ed and wd and wd._all_units then
  u=wd._all_units[tonumber(ed)]
  if alive_unit(u) then self:state(u);self.registry[key]=u;return u end
 end
end
function A:element(u)
 local d=u.damage and u:damage()
 return d and d._unit_element
end
-- Class ancestry works for modded enemy subclasses without guessing asset paths.
local function derives(base, class)
 if not base or not class then return false end
 local current=getmetatable(base)
 for _=1,32 do
  if current==class then return true end
  if type(current)~='table' then return false end
  current=rawget(current,'super')
 end
 return false
end
function A:is_enemy(u)
 if not alive_unit(u) then return false end
 local base=u.base and u:base()
 if not base then return false end
 for _,name in ipairs({'CivilianBase','HuskCivilianBase','TeamAIBase','HuskTeamAIBase'})do
  if derives(base,rawget(_G,name)) then return false end
 end
 return derives(base,CopBase) or derives(base,HuskCopBase)
end
function A:managed(u,element,depth)
 if not alive_unit(u) or (depth or 0)>12 then return false end
 local s=self.units[u]
 local selected=(s and s.enemy) or self:is_enemy(u)
 if not selected and s and s.parent then selected=self:managed(s.parent,nil,(depth or 0)+1) end
 if selected then self:state(u).managed=true end
 return not not selected
end
function A:stop(u,why)
 if alive_unit(u) then
  local s=self:state(u);s.blocked=why
  self:log('blocked:'..tostring(u:key()),'BLOCKED '..tostring(self:key(u) or u:name())..': '..why..'. Appearance sync paused; native gameplay continues. No client appearance reroll.')
 end
end
function A:index(node,path)
 if type(node)~='table' then return false,0 end
 self.nodes[node]=path
 local randomized,keys,h=false,{},104729
 for k,v in pairs(node) do
  if type(k)=='string' and type(v)~='table' and type(v)~='function' then keys[#keys+1]=k end
  randomized=randomized or random_expr(v) or false
 end
 table.sort(keys)
 for _,k in ipairs(keys) do h=hash(k..'='..tostring(node[k])..'\n',h) end
 for i,v in ipairs(node) do
  local r,ch=self:index(v,path..'/'..i)
  randomized=randomized or r;h=hash(tostring(ch),h)
 end
 return randomized,h
end
-- Explicit tagged values; no loadstring, evaluation of network data, or raw handles.
function A:encode(v,depth,seen)
 depth=depth or 0;seen=seen or {}
 if depth>20 then error('value nesting exceeds protocol limit') end
 local kind=type(v)
 if v==nil then return {t='nil'} end
 if kind=='boolean' or kind=='string' then return {t=kind,v=v} end
 if kind=='number' then
  if v~=v or v==math.huge or v==-math.huge then error('non-finite value') end
  return {t='number',v=v}
 end
 local mt=getmetatable(v)
 if mt==Vector3 then return {t='vector',v={v.x,v.y,v.z}} end
 if mt==Rotation then return {t='rotation',v={v:yaw(),v:pitch(),v:roll()}} end
 if kind=='userdata' then
  local name=v.type_name
  if name=='Vector3' then return {t='vector',v={v.x,v.y,v.z}} end
  if name=='Rotation' then return {t='rotation',v={v:yaw(),v:pitch(),v:roll()}} end
  if name=='Idstring' then return {t='id',v=v:t(),key=tostring(v:key())} end
  if name=='Unit' or (v.id and v.damage) then
   local key=self:key(v);if not key then error('unit reference has no shared identity') end
   return {t='unit',v=key}
  end
  error('unsupported engine value '..tostring(name))
 end
 if kind=='table' then
  -- Also supports the engine-free test units. Engine units are userdata above.
  if v.id and v.damage then
   local key=self:key(v);if not key then error('unit reference has no shared identity') end
   return {t='unit',v=key}
  end
  if seen[v] then error('cyclic value') end
  seen[v]=true
  local entries={}
  for k,x in pairs(v) do entries[#entries+1]={self:encode(k,depth+1,seen),self:encode(x,depth+1,seen)} end
  seen[v]=nil
  return {t='table',v=entries}
 end
 error('unsupported sequence value '..kind)
end
function A:decode(x,depth)
 if type(x)~='table' or (depth or 0)>20 then error('invalid encoded value') end
 if x.t=='nil' then return nil end
 if x.t=='number' or x.t=='string' or x.t=='boolean' then
  if type(x.v)~=x.t then error('invalid scalar') end
  if x.t=='number' and (x.v~=x.v or x.v==math.huge or x.v==-math.huge) then error('non-finite scalar') end
  return x.v
 end
 if x.t=='vector' or x.t=='rotation' then
  if type(x.v)~='table' or #x.v~=3 then error('invalid vector/rotation') end
  for _,v in ipairs(x.v) do if type(v)~='number' or v~=v or math.abs(v)==math.huge then error('invalid component') end end
  return x.t=='vector' and Vector3(unpack(x.v)) or Rotation(unpack(x.v))
 end
 if x.t=='id' then
  local id=Idstring(x.v)
  if tostring(id:key())~=x.key then error('Idstring cannot be reconstructed exactly') end
  return id
 end
 if x.t=='unit' then
  local u=self:find(x.v);if not alive_unit(u) then error('WAIT unit reference '..tostring(x.v)) end
  return u
 end
 if x.t=='table' then
  local out={}
  for _,pair in ipairs(x.v or {}) do
   local k=self:decode(pair[1],(depth or 0)+1)
   if k==nil then error('nil table key') end
   out[k]=self:decode(pair[2],(depth or 0)+1)
  end
  return out
 end
 error('unknown encoded value')
end
-- Only appearance operations belong in the authority stream. In particular,
-- engine effect parents, physics handles and ragdoll state never enter snapshots.
local appearance={object=true,decal_mesh=true,graphic_group=true,light=true,
 material_config=true,material=true,morph_expression=true,morph_expression_movie=true,
 set_variable=true,set_variables=true,set_global_variable=true,set_global_variables=true}
local function literal(value)
 if type(value)~='string' then return end
 return value:match("^%s*'([^'\\]*)'%s*$") or value:match('^%s*"([^"\\]*)"%s*$')
end
-- Enumerate ordinary appearance selectors without executing Lua or consuming RNG.
-- Uninspectable selectors remain native rather than hiding physics behind a call.
local function selector_names(value)
 if type(value)~='string' then return end
 local pos,depth=1,0
 local function space()local _,last=value:find('^%s*',pos);pos=(last or pos-1)+1 end
 local expression
 local function atom()
  space();local quote=value:sub(pos,pos)
  if quote=="'" or quote=='"' then
   local finish=value:find(quote,pos+1,true)
   if not finish then return end
   local text=value:sub(pos+1,finish-1)
   if text:find('\\',1,true) then return end
   pos=finish+1;return {text}
  end
  local number=value:match('^%-?%d+',pos)
  if number then pos=pos+#number;return {number} end
  local call=value:match('^([%a_][%w_%.]*)%s*%(',pos)
  if call=='rand' or call=='random' or call=='math.random' then
   local opening=value:find('(',pos,true);local closing=value:find(')',opening+1,true)
   if not closing then return end
   local args=value:sub(opening+1,closing-1)
   local lo,hi=args:match('^%s*(%-?%d+)%s*,%s*(%-?%d+)%s*$')
   if not lo then hi=args:match('^%s*(%d+)%s*$');lo='1' end
   lo,hi=tonumber(lo),tonumber(hi)
   if not lo or not hi or hi<lo or hi-lo>511 then return end
   local choices={};for n=lo,hi do choices[#choices+1]=tostring(n) end
   pos=closing+1;return choices
  end
  if value:sub(pos,pos+3)=='pick' then
   pos=pos+4;space();if value:sub(pos,pos)~='(' then return end
   pos=pos+1;local choices={}
   while true do
    local options=expression();if not options then return end
    for _,name in ipairs(options)do choices[#choices+1]=name;if #choices>512 then return end end
    space();local next_char=value:sub(pos,pos);pos=pos+1
    if next_char==')' then return choices end
    if next_char~=',' then return end
   end
  end
 end
 expression=function()
  depth=depth+1;if depth>20 then return end
  local choices=atom();if not choices then return end
  while true do
   space();if value:sub(pos,pos+1)~='..' then break end
   pos=pos+2;local right=atom();if not right then return end
   local merged={}
   for _,left in ipairs(choices)do for _,suffix in ipairs(right)do
    merged[#merged+1]=left..suffix;if #merged>512 then return end
   end end
   choices=merged
  end
  depth=depth-1;return choices
 end
 local names=expression();space()
 if pos>#value then return names end
end
function A:physics_body(root,name)
 -- Core hitboxes are changed by Lua as well as sequence files.
 if name=='body' or name=='head' or name=='mover_blocker' then return true end
 if name and name:match('^rag_') then return true end
 if root and root._authority_physics_bodies and root._authority_physics_bodies[name] then return true end
 for _,source in ipairs(root and root._authority_sources or {})do
  if source._authority_physics_bodies and source._authority_physics_bodies[name] then return true end
 end
 return false
end
function A:native_sequence(sequence,seen)
 if sequence._authority_native~=nil then return sequence._authority_native end
 seen=seen or {};if seen[sequence] then return true end
 seen[sequence]=true
 local native=false
 for _,child in ipairs(sequence._elements or {})do
  local kind=child.NAME;local params=child._parameters or {}
  if kind=='run_sequence' then
   local names=selector_names(params.name)
   if not names then native=true;break end
   for _,name in ipairs(names)do
    local target=child._unit_element:get_sequence_element(name)
    if not target or self:native_sequence(target,seen) then native=true;break end
   end
   if native then break end
  elseif kind=='body' then
   local name=literal(params.name)
   if not name or self:physics_body(child._unit_element,name) then native=true;break end
   for key in pairs(params)do
    if key~='name' and key~='enabled' and not CoreSequenceManager.BaseElement.BASE_ATTRIBUTE_MAP[key] then native=true;break end
   end
  elseif kind=='object' and (params.position or params.rotation) then
   native=true;break
  elseif not appearance[kind] then native=true;break end
 end
 seen[sequence]=nil
 sequence._authority_native=native
 return native
end
function A:native_element(element)
 local owner=element and element._authority_owner
 -- Body damage/endurance/trigger callbacks outside an appearance sequence
 -- retain their local context and the game's own networking behaviour.
 return not owner or self:native_sequence(owner)
end
function A:appearance_once(u)
 local result={};local root=self:element(u)
 for name,value in pairs(u:damage()._runned_sequences or {})do
  local sequence=root and root:get_sequence_element(name)
  if sequence and not self:native_sequence(sequence) then result[name]=value end
 end
 return result
end
local flow={run_sequence=true,remove_start_time=true,trigger=true}
local server_only={area_damage=true,alert=true,attention=true,enemy_killed=true,set_damage=true,reset_damage=true,set_inflict=true,set_proximity=true,set_water=true}
local persistent=clean_copy(appearance);persistent.body=true
local replayable=clean_copy(persistent)
function A:first(record,name)
 local list=record.values[name..'#1']
 return list and self:decode(list[1])
end
function A:commit(u,record)
 if not self:managed(u) then return end
 if record.kind~='link' then
  local element=self:resolve_element(self:element(u),record.path)
  if not replayable[record.kind] or self:native_element(element) then return end
 end
 local s=self:state(u);s.managed=true
 s.rev=s.rev+1;record.rev=s.rev;s.events[#s.events+1]=record
 if record.kind=='link' then s.persistent['link:'..record.slot]=record
 elseif persistent[record.kind] and record.kind~='animation_redirect' then
  local target=record.values and record.values['name#1']
  local key=record.path..'|'..(target and json.encode(target[1]) or '')
  s.persistent[key]=record
 end
 if record.problem then self:stop(u,record.problem) end
end
function A:record_callback(element,original,env,...)
 local u=env.dest_unit
 local unit_element=element._unit_element
 if not alive_unit(u) or not self:managed(u,unit_element) or self:native_element(element) then return original(element,env,...) end
 if is_client() then return end
 local s=self:state(u)
 if s.blocked then return end
 if #s.events>=self.MAX_HISTORY then self:stop(u,'unacknowledged operation history is full');return end
 if not element.NAME or flow[element.NAME] or server_only[element.NAME] then return original(element,env,...) end
 if element.NAME=='slot' and element._frustum_delay then
  self:stop(u,'camera-dependent slot/frustum operations require a dedicated adapter');return
 end
 local record={kind=element.NAME,path=element._authority_path,values={}}
 if record.kind=='spawn_unit' then
  local source=env.src_unit==u and 'self' or env.src_unit
  local ok_context,context=pcall(self.encode,self,{damage_type=env.damage_type,damage=env.damage,pos=env.pos,dir=env.dir,velocity=env.velocity,dest_normal=env.dest_normal,params=env.params,source=source,body=env.dest_body and env.dest_body:name():t()})
  if ok_context then record.context=context else self:stop(u,'cannot encode event context: '..tostring(context));return end
 end
 if record.kind=='spawn_unit' then s.spawn_serial=(s.spawn_serial or 0)+1;record.spawn_slot='sequence:'..element._authority_path..':'..s.spawn_serial end
 local old_spawn=self.spawning
 if not replayable[record.kind] then self:stop(u,'no audited replay adapter for '..record.kind);return end
 local old=self.capture
 self.capture={record=record,element=element}
 local ok,result=attempt(original,element,env,...)
 self.capture=old;self.spawning=old_spawn
 if not ok then error(result,0) end
 if record.kind=='animation_group' then
  local name=self:first(record,'name')
  local state=u:damage()._state
  record.animation=state and state.animation_group and clean_copy(state.animation_group[name])
  record.animation_name=name
  record.animation_time=name and u:anim_time(Idstring(name))
 end
 if record.kind=='physic_effect' then
  local variable=self:first(record,'store_id_var') or 'last_physic_effect_id'
  s.physics=s.physics or {};s.physics[env.vars[variable]]=s.rev+1
 elseif record.kind=='stop_physic_effect' then
  local id=self:first(record,'id');record.handle=s.physics and s.physics[id]
  if not record.handle then record.problem='unmapped host physics handle' end
 end
 self:commit(u,record)
 return unpack(result,1,result.n)
end
function A:lift_defaults(source)
 if not source then return source end
 local node=clean_copy(source);local local_values,global_values,names={},{},{}
 local _,source_hash=self:index(source,'u')
 for i,child in ipairs(source) do
  if child._meta=='sequence' then names[child.name]=true end
  if child._meta=='variables' or child._meta=='global_variables' then
   local replacement=clean_copy(child);node[i]=replacement
   for j,var in ipairs(child) do
    if random_expr(var.value) then
     replacement[j]=clean_copy(var);replacement[j].value='nil'
     local values=child._meta=='variables' and local_values or global_values
     values[var._meta]=var.value
    end
   end
  end
 end
 local function add(values,tag,kind)
  if not next(values) then return nil end
  local name='__rsa4_'..tag..'_'..tostring(source_hash)
  while names["'"..name.."'"] do name=name..'_' end
  values._meta=kind;self.default_nodes[values]=true
  node[#node+1]={_meta='sequence',name="'"..name.."'",once='true',values}
  return name
 end
 return node,add(local_values,'defaults','set_variables'),add(global_values,'global_defaults','set_global_variables')
end
function A:resolve_element(root,path)
 local element=root and root._authority_elements[path]
 if element then return element end
 for _,source in ipairs(root and root._authority_sources or {}) do
  element=source._authority_elements[path];if element then return element end
 end
end
function A:initialize_defaults(u,ignored,env)
 local s=self:state(u);local root=self:element(u)
 if s.defaults_done or not root then return end
 s.defaults_done=true
 local sources={}
 for _,source in ipairs(root._authority_sources or {})do sources[#sources+1]=source end
 sources[#sources+1]=root
 root._authority_global_done=root._authority_global_done or {}
 for _,source in ipairs(sources)do
  if source._authority_global_defaults and not root._authority_global_done[source] then
   root._authority_global_done[source]=true
   root._global_vars=root._global_vars or {};env.g_vars=root._global_vars
   source:get_sequence_element(source._authority_global_defaults):activate(env)
  end
  if source._authority_defaults then source:get_sequence_element(source._authority_defaults):activate(env) end
 end
end
function A:native_defaults(root)
 if root._authority_native_ready then return end
 root._authority_native_ready=true
 local C=CoreSequenceManager
 for _,source in ipairs(root._authority_sources or {})do
  self:native_defaults(source)
  for name,value in pairs(source._authority_native_local_values or {})do
   root._set_variables=root._set_variables or {}
   if root._set_variables[name]==nil then root._set_variables[name]=value end
  end
  for name,value in pairs(source._authority_native_global_values or {})do
   root._global_vars=root._global_vars or {}
   root._set_global_vars=root._set_global_vars or {}
   if root._global_vars[name]==nil then root._global_vars[name]=value end
   if root._set_global_vars[name]==nil then root._set_global_vars[name]=value end
  end
 end
 for _,item in ipairs(root._authority_native_defaults or {})do
  local parsed=root:get_static('native_default_'..item.name,item.value)
  local value=parsed and parsed(C.SequenceEnvironment)
  if item.global then
   root._global_vars=root._global_vars or {};root._global_vars[item.name]=value
   root._set_global_vars=root._set_global_vars or {};root._set_global_vars[item.name]=value
   root._authority_native_global_values=root._authority_native_global_values or {}
   root._authority_native_global_values[item.name]=value
  else
   root._set_variables=root._set_variables or {};root._set_variables[item.name]=value
   root._authority_native_local_values=root._authority_native_local_values or {}
   root._authority_native_local_values[item.name]=value
  end
 end
end
function A:global_versions(element)
 if element._authority_global_epoch~=self:epoch() then
  element._authority_global_epoch=self:epoch();element._authority_global_versions={}
 end
 element._authority_global_versions=element._authority_global_versions or {}
 return element._authority_global_versions
end
function A:install_sequences()
 local C=CoreSequenceManager;if not C then return end
 for _,class in ipairs({C.SetGlobalVariableElement,C.SetGlobalVariablesElement})do
  self:wrap(class,'set_variable',function(original)
   return function(element,env,name,value)
    local root=A:element(env.dest_unit) or element._unit_element
    local frame=A.replaying or A.capture
    if not frame or not A:managed(env.dest_unit) or A:native_element(element) then return original(element,env,name,value) end
    local versions=frame.record.global_versions or {};frame.record.global_versions=versions
    local revision=versions[name]
    if not A.replaying then A.global_serial=A.global_serial+1;revision=A.global_serial;versions[name]=revision end
    if not revision then error('missing global variable revision') end
    local root_versions=A:global_versions(root)
    if revision>=(root_versions[name] or -1) then
     root._global_vars=root._global_vars or {};root._global_vars[name]=value
     env.g_vars[name]=value;root_versions[name]=revision
    end
    local source=element._unit_element;local source_versions=A:global_versions(source)
    if revision>=(source_versions[name] or -1) then
     source._global_vars=source._global_vars or {};source._global_vars[name]=value;source_versions[name]=revision
    end
   end
  end)
 end
 self:wrap(C.UnitElement,'init',function(original)
  return function(element,node,...)
   local native_defaults={}
   for _,group in ipairs(node or {})do
    if group._meta=='variables' or group._meta=='global_variables' then
     for _,var in ipairs(group)do
      if random_expr(var.value) then native_defaults[#native_defaults+1]={name=var._meta,value=var.value,global=group._meta=='global_variables'} end
     end
    end
   end
   element._authority_native_defaults=native_defaults
   element._authority_physics_bodies={}
   local function scan(data)
    if type(data)~='table' then return end
    if data._meta=='body' and (data.motion or data.interpolate or data.mover) then
     local name=literal(data.name);if name then element._authority_physics_bodies[name]=true end
    end
    for _,child in ipairs(data)do scan(child) end
   end
   scan(node)
   node,element._authority_defaults,element._authority_global_defaults=A:lift_defaults(node)
   element._authority_random,element._authority_schema=A:index(node,'u')
   element._authority_namespace=tostring(element._authority_schema)
   element._authority_elements={}
   local result=pack(original(element,node,...))
   element._authority_sources={}
   local manager=managers and managers.sequence
   if manager then
    for _,getter in ipairs({'get_global_core_unit_element','get_global_unit_element'})do
     local source=manager[getter] and manager[getter](manager)
     if source and source~=element then
      element._authority_sources[#element._authority_sources+1]=source
      element._authority_random=element._authority_random or source._authority_random
      element._authority_schema=hash(tostring(source._authority_schema),element._authority_schema)
     end
    end
   end
   local function own(child,owner)
    child._authority_owner=owner
    for _,nested in ipairs(child._elements or {})do own(nested,owner) end
   end
   for _,sequence in pairs(element._sequence_elements or {})do own(sequence,sequence) end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(C.BaseElement,'init',function(original)
  return function(element,node,unit_element,...)
   element._authority_path=(unit_element and unit_element._authority_namespace or '?')..':'..(A.nodes[node] or 'external')
   element._authority_is_default=A.default_nodes[node]
   local result=pack(original(element,node,unit_element,...))
   if unit_element and unit_element._authority_elements then unit_element._authority_elements[element._authority_path]=element end
   local callback=element.activate_callback
   if callback and not element._authority_callback then
    element._authority_callback=callback
    element.activate_callback=function(obj,env,...) return A:record_callback(obj,callback,env,...) end
   end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(C.BaseElement,'get_static',function(original)
  return function(element,name,value,setter,node)
   local parsed=original(element,name,value,nil,node)
   if not parsed then return parsed end
   element._authority_declarations=element._authority_declarations or {}
   local index=(element._authority_declarations[name] or 0)+1;element._authority_declarations[name]=index
   local id=tostring(name)..'#'..index
   return function(env,...)
    local replay=A.replaying
    if env and env.dest_unit and (not A:managed(env.dest_unit) or A:native_element(element)) then
     local result=parsed(env,...)
     if setter then return setter(element,env,result,...) end
     return result
    end
    local result
    if replay and env and env.dest_unit==replay.unit then
     local list=replay.record.values[id]
     local index=(replay.used[id] or 0)+1;replay.used[id]=index
     if replay.element~=element or not list or list[index]==nil then error('unrecorded client expression '..id) end
     result=A:decode(list[index])
    else
     if is_client() and env and A:managed(env.dest_unit) and random_expr(tostring(value)) then
      error('[SequenceAuthority] Random expression outside a host replay: '..element._authority_path..'/'..id..'. Move parse-time random defaults into a startup sequence.',0)
     end
     local cache=element._authority_default_cache
     if element._authority_is_default and cache and cache[id] then result=cache[id].value
     else
      result=parsed(setmetatable({math=math,random=math.random},{__index=env,__newindex=env}),...)
      if element._authority_is_default then
       element._authority_default_cache=element._authority_default_cache or {}
       element._authority_default_cache[id]={value=result}
      end
     end
     local frame=A.capture
     if frame and frame.element==element and frame.record.kind=='spawn_unit' and name=='name' and type(result)=='string' then
      if PackageManager:has(Idstring('unit'),Idstring(result)) then
       local mode=PackageManager:unit_data(Idstring(result)):network_sync()
       frame.record.local_spawn=(mode=='none' or mode=='client')
       if frame.record.local_spawn then A.spawning={parent=env.dest_unit,slot=frame.record.spawn_slot} end
      else frame.record.problem='spawn asset is not resident on the host: '..result end
     end
     if frame and frame.element==element then
      local ok,encoded=pcall(A.encode,A,result)
      if ok then
       local list=frame.record.values[id] or {};frame.record.values[id]=list;list[#list+1]=encoded
      else frame.record.problem='cannot encode '..id..': '..tostring(encoded) end
     end
    end
    if setter then return setter(element,env,result,...) end
    return result
   end
  end
 end)
 for _,method in ipairs({'activate','start_time_callback'}) do
  self:wrap(C.BaseElement,method,function(original)
   return function(element,env,...)
    local u=env and env.dest_unit
    if alive_unit(u) and not A:managed(u,element._unit_element) then
     local root=A:element(u)
     if root then
      A:native_defaults(root)
      local d=u:damage();d._variables=d._variables or {};env.vars=env.vars or d._variables
      local state=A:state(u)
      if not state.native_defaults_done then
       state.native_defaults_done=true
       for name,value in pairs(root._set_variables or {})do if env.vars[name]==nil then env.vars[name]=value end end
      end
      if env.g_vars==nil then env.g_vars=root._global_vars end
     end
    elseif alive_unit(u) and A:managed(u,element._unit_element) then
     local s=A:state(u);s.managed=true
     if A:native_element(element) then
      -- Appearance quarantine must never suspend damage, physics or death.
      if not is_client() and not s.blocked then A:initialize_defaults(u,element._unit_element,env) end
      return original(element,env,...)
     end
     if is_client() then return end
     if s.blocked then return end
     A:initialize_defaults(u,element._unit_element,env)
    end
    return original(element,env,...)
   end
  end)
 end
end
-- Native resources are requested asynchronously and replay waits for residency.
function A:asset(name,resource_type)
 if type(name)~='string' or name=='' then return false,'invalid asset name' end
 resource_type=resource_type or 'unit'
 local ids_type,ids_name=Idstring(resource_type),Idstring(name)
 if not DB:has(ids_type,ids_name) then return false,'missing '..resource_type..' asset '..name end
 if PackageManager:has(ids_type,ids_name) then return true end
 self.loading_assets=self.loading_assets or {}
 local key=resource_type..':'..name
 if not self.loading_assets[key] and managers.dyn_resource then
  self.loading_assets[key]=true
  managers.dyn_resource:load(ids_type,ids_name,managers.dyn_resource.DYN_RESOURCES_PACKAGE,function() end)
 end
 return false,'WAIT asset '..name
end
function A:preflight(u,record,element)
 if record.problem then return false,record.problem end
 if record.kind=='animation_group' and record.animation then
  local allowed={anim_play_loop=true,anim_play_to=true,anim_play=true,anim_stop=true}
  if not allowed[record.animation[1]] or type(record.animation_name)~='string' then return false,'invalid animation operation' end
 end
 if record.kind=='link' then
  local sm=u.spawn_manager and u:spawn_manager()
  if not sm or not sm[record.joint] then return false,'missing spawn manager/joint table' end
  for _,joint in ipairs(sm[record.joint]) do if not u:get_object(Idstring(joint)) then return false,'missing parent joint '..joint end end
  return self:asset(record.asset)
 end
 if not element or self:native_element(element) or element.NAME~=record.kind or not replayable[record.kind] then return false,'unknown replay operation '..tostring(record.kind) end
 if record.context then self:decode(record.context) end
 for _,values in pairs(record.values or {}) do for _,value in ipairs(values) do self:decode(value) end end
 local name=self:first(record,'name')
 if record.kind=='object' and (type(name)~='string' or not u:get_object(Idstring(name))) then return false,'missing object '..tostring(name) end
 if record.kind=='body' and (name==nil or not u:body(name)) then return false,'missing body '..tostring(name) end
 if record.kind=='decal_mesh' and not u:decal_surface() then return false,'missing decal surface' end
 if record.kind=='effect' then
  if type(name)~='string' or not DB:has(Idstring('effect'),Idstring(name)) then return false,'missing effect '..tostring(name) end
  local parent=self:first(record,'parent')
  if type(parent)=='string' and not u:get_object(Idstring(parent)) then return false,'missing effect parent '..parent end
 end
 if record.kind=='material' and (type(name)~='string' or not u:material(Idstring(name))) then return false,'missing material '..tostring(name) end
 if record.kind=='set_extension_var' and (type(name)~='string' or type(u[name])~='function' or not u[name](u)) then return false,'missing extension '..tostring(name) end
 if record.kind=='spawn_unit' then return self:asset(name) end
 if record.kind=='material_config' then return self:asset(name,'material_config') end
 return true
end
function A:bind(parent,slot,child)
 if not alive_unit(child) or child==parent or not self:managed(parent) then return end
 local s=self:state(child);s.parent,s.slot,s.managed=parent,tostring(slot),true
 local key=self:key(child);if key then self.registry[key]=child end
end
function A:apply_record(u,record)
 if record.kind=='animation_group' and record.animation then
  local a=record.animation
  u[a[1]](u,Idstring(record.animation_name),a[2],a[3],a[4])
  if record.animation_time then u:anim_set_time(Idstring(record.animation_name),record.animation_time) end
  return
 end
 if record.kind=='stop_physic_effect' then
  local handle=self:state(u).physics and self:state(u).physics[record.handle]
  if handle then World:stop_physic_effect(handle) end
  return
 end
 if record.kind=='link' then
  local sm=u:spawn_manager();local child=sm:get_unit(record.slot)
  if not alive_unit(child) then
   local old=self.spawning;self.spawning={parent=u,slot=record.slot}
   local ok,result=attempt(sm.spawn_and_link_unit,sm,record.joint,record.slot,record.asset)
   self.spawning=old
   if not ok then error(result,0) end
   child=sm:get_unit(record.slot)
  end
  if not alive_unit(child) then error('linked child did not spawn') end
  self:bind(u,record.slot,child)
  local base=u.base and u:base()
  if base and record.slot=='cop_head' then
   base._head_unit=child
   if child.set_enabled and u.enabled then child:set_enabled(u:enabled()) end
  end
  return
 end
 local unit_element=self:element(u)
 local element=self:resolve_element(unit_element,record.path)
 local C=CoreSequenceManager
 if record.kind=='set_global_variable' or record.kind=='set_global_variables' then unit_element._global_vars=unit_element._global_vars or {} end
 local context=record.context and self:decode(record.context) or {}
 local source=context.source=='self' and u or context.source
 local body=context.body and u:body(context.body)
 local env=C.SequenceEnvironment:new(context.damage_type or '',source,u,body,context.dest_normal,context.pos,context.dir,context.damage or 0,context.velocity,context.params or {},unit_element)
 local previous=self.replaying
 local old_env,old_element=C.SequenceEnvironment.self,C.SequenceEnvironment.element
 local old_spawn=self.spawning
 if record.kind=='spawn_unit' and record.local_spawn then self.spawning={parent=u,slot=record.spawn_slot} end
 self.replaying={record=record,element=element,unit=u,used={}}
 C.SequenceEnvironment.self,C.SequenceEnvironment.element=env,element
 local ok,result=attempt(element._authority_callback,element,env)
 C.SequenceEnvironment.self,C.SequenceEnvironment.element=old_env,old_element
 self.replaying=previous;self.spawning=old_spawn
 if not ok then error(result,0) end
 if record.kind=='physic_effect' then
  local variable=self:first(record,'store_id_var') or 'last_physic_effect_id'
  local s=self:state(u);s.physics=s.physics or {};s.physics[record.rev]=env.vars[variable]
 end
end
function A:apply_pending(u)
 local s=self:state(u);local batch=s.pending
 if not self:managed(u) or not batch or s.blocked then return end
 local element=self:element(u)
 if not element or element._authority_schema~=batch.schema then self:stop(u,'host/client sequence definitions differ');return end
 if s.remote_generation and s.remote_generation~=batch.generation then self:stop(u,'unit generation changed before local unit replacement');return end
 if batch.globals then
  local valid,value=pcall(self.decode,self,batch.globals)
  if not valid then self:stop(u,'invalid global state: '..tostring(value));return end
 end
 -- Validate the complete batch before making any native changes.
 for _,record in ipairs(batch.ops) do
  local ok,result=attempt(self.preflight,self,u,record,self:resolve_element(element,record.path))
  local allowed,why=ok and result[1],ok and result[2] or result
  if not allowed then
   if tostring(why):find('WAIT ',1,true) then self:log('resource-wait:'..tostring(u:key()),tostring(why)..'; replay waits without changing the host selection.');return end
   self:stop(u,tostring(why));return
  end
 end
 for _,record in ipairs(batch.ops) do
  if not alive_unit(u) then break end
  local ok,why=pcall(self.apply_record,self,u,record)
  if not ok then self:stop(u,'replay failed: '..tostring(why));return end
 end
 if batch.snapshot and batch.globals then
  local globals=self:decode(batch.globals) or {};local versions=self:global_versions(element)
  local incoming=clean_copy(batch.global_versions)
  for name in pairs(globals)do incoming[name]=incoming[name] or 0 end
  element._global_vars=element._global_vars or {}
  for name,revision in pairs(incoming)do
   if revision>=(versions[name] or -1) then element._global_vars[name]=globals[name];versions[name]=revision end
  end
 end
 local damage=alive_unit(u) and u:damage()
 if damage then
  -- Never import or erase once flags belonging to local death/effect sequences.
  damage._runned_sequences=damage._runned_sequences or {}
  for name in pairs(self:appearance_once(u))do damage._runned_sequences[name]=nil end
  for name,value in pairs(batch.once or {})do
   local sequence=element:get_sequence_element(name)
   if sequence and not self:native_sequence(sequence) then damage._runned_sequences[name]=value end
  end
 end
 s.applied,s.remote_generation,s.pending=batch.to,batch.generation,nil
 s.next_request=s.token and (clock()+10) or 0
 local host=sess() and sess():server_peer()
 if host and s.token then self:send(host:id(),{type='unit_ack',key=self:key(u),token=s.token,cursor=s.applied,generation=s.remote_generation}) end
 s.initialized=true
 self:log('active','Host-authored operations are being applied; clients have no independent sequence rolls.')
end
function A:snapshot(u)
 local s=self:state(u);local ops={}
 for _,record in pairs(s.persistent) do
  if record.kind=='animation_group' and record.animation_name then
   record=clean_copy(record);record.animation_time=u:anim_time(Idstring(record.animation_name))
  end
  ops[#ops+1]=record
 end
 table.sort(ops,function(a,b)return a.rev<b.rev end)
 local element=self:element(u)
 local versions=element and clean_copy(self:global_versions(element)) or {}
 local globals={}
 for name in pairs(versions)do globals[name]=element._global_vars and element._global_vars[name] end
 return {snapshot=true,ops=ops,to=s.rev,generation=s.generation,once=self:appearance_once(u),globals=self:encode(globals),global_versions=versions}
end
function A:response(u,request)
 local s=self:state(u);local element=self:element(u)
 if s.blocked then return {error=s.blocked} end
 local batch
 if request.initial then batch=self:snapshot(u)
 else
  if request.generation~=s.generation then return {error='unit generation mismatch'} end
  if request.cursor<(s.first_revision or 1)-1 then return {error='required event history is unavailable'} end
  batch={ops={},to=request.cursor,generation=s.generation,once=self:appearance_once(u)}
  for _,record in ipairs(s.events) do
   if record.rev>request.cursor then batch.ops[#batch.ops+1]=record;batch.to=record.rev;if #batch.ops>=64 then break end end
  end
 end
 batch.schema=element and element._authority_schema
 batch.key,batch.token,batch.base=request.key,request.token,request.cursor
 return batch
end
-- Chunked, retried request/response transport. No event is executed twice.
-- Budget the entire hidden-chat message, including JSON escaping and GNAP/RSA4/.
function A:send(peer,message)
 local queue_key=tostring(peer)..':'..tostring(message.type)..':'..tostring(message.key or message.token or '')
 if self.queued[queue_key] then return true end
 self.serial=self.serial+1
 message.version=self.VERSION;message.epoch=message.epoch or self:epoch()
 local wire=json.encode(message)
 if #wire>self.MAX_WIRE then self:log('oversize','Outbound record exceeds protocol size limit');return false end
 local limit=math.min(255,tonumber(LuaNetworking and LuaNetworking._max_message_len) or 255)
 local budget=limit-#'GNAP/RSA4/'
 local id=tostring(self.serial)
 local parts,offset={},1
 while offset<=#wire do
  if #parts>=self.MAX_PARTS then self:log('oversize-parts','Outbound record exceeds fragment limit');return false end
  local lo,hi,best=1,math.min(160,#wire-offset+1),0
  while lo<=hi do
   local size=math.floor((lo+hi)/2)
   local frame=json.encode({id=id,index=#parts+1,count=self.MAX_PARTS,data=wire:sub(offset,offset+size-1)})
   if #frame<=budget then best=size;lo=size+1 else hi=size-1 end
  end
  if best==0 then self:log('wire-budget','Hidden-chat packet budget is too small');return false end
  parts[#parts+1]=wire:sub(offset,offset+best-1);offset=offset+best
 end
 if self.out_tail-self.out_head+1+#parts>4096 then self:log('outbox-full','Transport queue is full; requests will retry.');return false end
 local frames={}
 for i,data in ipairs(parts)do
  local frame=json.encode({id=id,index=i,count=#parts,data=data})
  if #frame>budget then self:log('wire-overflow','Refused oversized hidden-chat frame');return false end
  frames[i]=frame
 end
 for i,frame in ipairs(frames)do
  self.out_tail=self.out_tail+1
  self.outgoing[self.out_tail]={peer=peer,release=i==#frames and queue_key or nil,wire=frame}
 end
 self.queued[queue_key]=true
 return true
end

function A:request_unit(u)
 local s=self:state(u)
 if not self:managed(u) or s.blocked or s.pending or clock()<s.next_request then return end
 local key=self:key(u);local p=self:profile();local host=sess() and sess():server_peer()
 if not key or not p or not host then
  self:log('waiting:'..tostring(u:key()),'Waiting for host/shared identity for '..tostring(u:name())..'; no fallback roll.')
  return
 end
 if not s.token then self.serial=self.serial+1;s.token=tostring(self.serial);self.waiting[s.token]=u end
 s.next_request=clock()+self.RETRY
 self:send(host:id(),{type='unit_request',key=key,token=s.token,cursor=s.applied,initial=not s.initialized,generation=s.remote_generation})
end
function A:dispatch(sender,message)
 if type(message)~='table' then return end
 self:check_session()
 if message.version~=self.VERSION then
  if self.waiting_load then self.waiting_load.stage='Host replied with a different authority protocol.' end
  return
 end
 local session=sess();if not session then return end
 if is_client() then
  local host=session:server_peer();if not host or host:id()~=tonumber(sender) then return end
  if message.type=='environment' then
   local waiting=self.waiting_load
   if not waiting or waiting.session~=session or waiting.host~=host or message.token~=waiting.token or message.level~=waiting.level then return end
   if waiting.counter~=nil and message.counter~=waiting.counter then waiting.stage='Host replied with a different heist load counter.';return end
   if not self:valid_profile(message.profile,waiting.level,message.counter,message.epoch) then waiting.stage='Host environment profile was incomplete or invalid.';return end
   Global.restoration_sequence_authority=message.profile
   waiting.counter=message.counter;waiting.received=true;waiting.epoch=message.epoch;waiting.stage='Environment received; final host confirmation is missing.'
   self:send(host:id(),{type='environment_ack',epoch=message.epoch,token=waiting.token});return
  end
  if message.type=='environment_confirm' then
   local waiting=self.waiting_load
   if waiting and waiting.session==session and waiting.host==host and waiting.received and message.epoch==waiting.epoch and message.token==waiting.token then waiting.ready=true end
   return
  end
  if message.epoch~=self:epoch() or message.type~='unit_result' then return end
  local u=self.waiting[message.token];local s=u and self.units[u]
  if not alive_unit(u) or not self:managed(u) or not s or s.token~=message.token or self:key(u)~=message.key then return end
  if message.error then self:stop(u,message.error);return end
  if message.base~=s.applied or type(message.ops)~='table' or type(message.to)~='number' then return end
  if s.pending then return end
  if not message.snapshot then
   local expected=s.applied
   for _,op in ipairs(message.ops) do expected=expected+1;if op.rev~=expected then self:stop(u,'out-of-order operation batch');return end end
   if expected~=message.to then self:stop(u,'invalid batch revision');return end
  end
  s.pending=message
 else
  if not session:peer(tonumber(sender)) then return end
  if message.type=='environment_request' then
   local p=self:profile()
   local counter=session._load_counter
   if p and p.level==message.level and type(counter)=='number' and (message.counter==nil or counter==message.counter) then
    p.counter=counter -- bind existing choices; never reroll a running heist
    self:send(tonumber(sender),{type='environment',token=message.token,level=p.level,counter=p.counter,profile=p})
   end
   return
  end
  if message.type=='environment_ack' and message.epoch==self:epoch() then
   self.compatible=self.compatible or {};self.compatible[tonumber(sender)]=message.epoch
   session._restoration_authority_epoch=message.epoch;session._restoration_authority_compatible=self.compatible
   self:send(tonumber(sender),{type='environment_confirm',token=message.token});return
  end
  if message.epoch~=self:epoch() then return end
  if message.type=='unit_ack' then
   local u=self:find(message.key);local s=u and self.units[u]
   local sub=s and s.subscribers and s.subscribers[tonumber(sender)]
   if sub and sub.token==message.token and message.generation==s.generation and type(message.cursor)=='number' and message.cursor>=sub.cursor and message.cursor<=s.rev then
    sub.cursor,sub.initial,sub.awaiting=message.cursor,false,false
    s.acks[tonumber(sender)]=message.cursor
   end
   return
  end
  if message.type~='unit_request' then return end
  if type(message.key)~='string' or #message.key>512 or type(message.cursor)~='number' then return end
  local u=self:find(message.key)
  if alive_unit(u) and self:managed(u) then
   local s=self:state(u)
   s.acks=s.acks or {};s.acks[tonumber(sender)]=message.cursor
   s.subscribers=s.subscribers or {}
   local sub={token=message.token,cursor=message.cursor,initial=message.initial,awaiting=true,sent_at=clock()}
   s.subscribers[tonumber(sender)]=sub
   local result=self:response(u,message)
   result.type,result.key,result.token='unit_result',message.key,message.token
   sub.awaiting=self:send(tonumber(sender),result)
  end
 end
end
function A:receive(sender,id,payload)
 if id~='RSA4' or type(payload)~='string' or #payload>4096 or not sess() then return end
 if is_client() then local host=sess():server_peer();if not host or host:id()~=tonumber(sender) then return end
 elseif not sess():peer(tonumber(sender)) then return end
 local ok,chunk=pcall(json.decode,payload)
 if not ok or type(chunk)~='table' or type(chunk.id)~='string' or #chunk.id>32 or type(chunk.data)~='string' or #chunk.data>self.CHUNK then return end
 local i,n=chunk.index,chunk.count
 if type(i)~='number' or type(n)~='number' or i%1~=0 or n%1~=0 or i<1 or i>n or n>self.MAX_PARTS then return end
 local key=tostring(sender)..':'..chunk.id;local partial=self.parts[key]
 if not partial then
  local count=0;for _ in pairs(self.parts)do count=count+1 end
  if count>=32 then return end
  partial={n=n,parts={},got=0,bytes=0,time=clock()};self.parts[key]=partial
 end
 if partial.n~=n then return end
 if not partial.parts[i] then
  partial.bytes=partial.bytes+#chunk.data
  if partial.bytes>self.MAX_WIRE then self.parts[key]=nil;return end
  partial.parts[i]=chunk.data;partial.got=partial.got+1
 end
 if self.waiting_load and not self.waiting_load.received then
  self.waiting_load.stage='Host fragments received: '..partial.got..'/'..n..'; awaiting a complete profile.'
 end
 if partial.got==n then
  self.parts[key]=nil
  local good,message=pcall(json.decode,table.concat(partial.parts))
  if good then local valid,why=pcall(self.dispatch,self,sender,message);if not valid then self:log('protocol-error','Rejected invalid message: '..tostring(why)) end end
 end
end
function A:update()
 self:check_session()
 if not is_client() and self.pending_intro and sess() then
  local ready=true
  for id in pairs(sess():peers())do if not self.compatible or self.compatible[id]~=self:epoch() then ready=false end end
  if ready then local run=self.pending_intro;self.pending_intro=nil;run() end
 end
 if not is_client() and self.pending_dropins then
  for id,run in pairs(self.pending_dropins)do
   if not sess() or not sess():peer(id) then self.pending_dropins[id]=nil
   elseif self.compatible and self.compatible[id]==self:epoch() then self.pending_dropins[id]=nil;run() end
  end
 end
 if self.waiting_load then
  local w=self.waiting_load
  local session=sess()
  if not session or w.session~=session or session._closing or session:server_peer()~=w.host then
   self:fail_load('The host connection changed during synchronization.')
  elseif w.ready then
   self.waiting_load=nil;self:close_load_dialog()
   self.load_permit={session=session,level=w.level,counter=w.counter,epoch=w.epoch}
   if w.kind=='direct' then session._load_counter=w.counter end
   w.run();self.load_permit=nil
  elseif clock()-w.started>=self.HANDSHAKE_TIMEOUT then
   self:fail_load('Synchronization timed out. '..w.stage)
  elseif clock()>=(w.retry or 0) then
   local host=sess() and sess():server_peer()
   if host then
    if w.received then self:send(host:id(),{type='environment_ack',epoch=w.epoch,token=w.token})
    else self:send(host:id(),{type='environment_request',token=w.token,level=w.level,counter=w.counter}) end
   end
   w.retry=clock()+self.RETRY
  end
 end
 for u,s in pairs(self.units) do
  if not alive_unit(u) then
   if s.token then self.waiting[s.token]=nil end
   self.units[u]=nil
  else
   local key=self:key(u);if key then self.registry[key]=u end
   if is_client() and self:managed(u) then self:apply_pending(u);self:request_unit(u) end
   if not is_client() and self:managed(u) and s.subscribers and not s.blocked then
    for peer,sub in pairs(s.subscribers)do
     if not sess() or not sess():peer(peer) then s.subscribers[peer]=nil
     elseif s.rev>sub.cursor and (not sub.awaiting or clock()-sub.sent_at>=2) and clock()>=(sub.next_send or 0) then
      local response=self:response(u,{key=key,token=sub.token,cursor=sub.cursor,initial=sub.initial,generation=s.generation})
      response.type,response.key,response.token='unit_result',key,sub.token
      sub.awaiting=self:send(peer,response);sub.sent_at=clock();sub.next_send=clock()+0.2
     end
    end
   end
   if not is_client() and s.acks and #s.events>256 then
    local min=s.rev
    for peer in pairs(sess() and sess():peers() or {}) do min=math.min(min,s.acks[peer] or 0) end
    local keep={};for _,event in ipairs(s.events)do if event.rev>min then keep[#keep+1]=event end end
    s.events=keep;s.first_revision=#keep>0 and keep[1].rev or s.rev+1
   end
  end
 end
 for key,part in pairs(self.parts) do if clock()-part.time>15 then self.parts[key]=nil end end
 for key,u in pairs(self.registry)do if not alive_unit(u) or self:key(u)~=key then self.registry[key]=nil end end
 if LuaNetworking then
  for _=1,16 do
   local item=self.outgoing[self.out_head];if not item then break end
   local peer=sess() and sess():peer(item.peer)
   if peer and not peer:ip_verified() then
    if self.waiting_load then self.waiting_load.stage='Host connection is not verified; requests have not been sent.' end
    break -- retain the packet; SuperBLT otherwise silently discards it
   end
   self.outgoing[self.out_head]=nil;self.out_head=self.out_head+1
   if peer then LuaNetworking:SendToPeer(item.peer,'RSA4',item.wire) end
   if item.release then self.queued[item.release]=nil end
  end
  if self.out_head>self.out_tail then self.out_head,self.out_tail=1,0 end
 end
end
function A:install_units()
 self:wrap(ManageSpawnedUnits,'_link_joints',function(original)
  return function(sm,slot,joints,...)
   if is_client() and A:managed(sm._unit,A:element(sm._unit)) then
    local entry=sm._spawned_units[slot];local child=entry and entry.unit
    if not alive_unit(child) or not sm[joints] then error('missing child/joint table before linking') end
    for i,name in ipairs(sm[joints])do
     if i>1 and (not sm._unit:get_object(Idstring(name)) or not child:get_object(Idstring(name))) then error('missing skeleton joint '..name) end
    end
   end
   return original(sm,slot,joints,...)
  end
 end)
 local D=CoreUnitDamage and (CoreUnitDamage.CoreUnitDamage or CoreUnitDamage)
 self:wrap(D,'init',function(original)
  return function(d,u,...)
   -- Bind a child at construction time, before its randomized defaults parse.
   A:state(u)
   local managed=A:managed(u)
   local native_prepared=false
   if not managed and managers and managers.sequence and managers.sequence.get then
    local element=managers.sequence:get(u:name(),false,true)
    if element then A:native_defaults(element);native_prepared=true end
   end
   local result=pack(original(d,u,...))
   if native_prepared then A:state(u).native_defaults_done=true end
   if A:managed(u) then A:state(u).managed=true end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(D,'save',function(original)
  return function(d,data,...)
   local result=pack(original(d,data,...));local s=A.units[d._unit]
   if s and A:managed(d._unit) and not is_client() then
    local snap=A:snapshot(d._unit);snap.schema=d._unit_element._authority_schema;snap.version=A.VERSION
    data.RestorationSequenceAuthority=snap
   end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(D,'load',function(original)
  return function(d,data,...)
   local result=pack(original(d,data,...));local snap=data.RestorationSequenceAuthority
   if is_client() and A:managed(d._unit) and snap and snap.version==A.VERSION then
    local s=A:state(d._unit);s.managed=true;s.pending=snap
   end
   return unpack(result,1,result.n)
  end
 end)
 for _,class in pairs({CopBase,HuskCopBase}) do
  self:wrap(class,'init',function(original)
   return function(base,u,...)
    -- base may not yet be exposed by u:base() while its init is running.
    local excluded=false
    for _,name in ipairs({'CivilianBase','HuskCivilianBase','TeamAIBase','HuskTeamAIBase'})do
     if derives(base,rawget(_G,name)) then excluded=true end
    end
    if not excluded then local s=A:state(u);s.enemy=true;s.managed=true end
    return original(base,u,...)
   end
  end)
  self:wrap(class,'_run_unit_sequences',function(original)
   return function(base,...)
    if not A:managed(base._unit) then return original(base,...) end
    local s=A:state(base._unit);s.managed=true
    if is_client() then return end
    return original(base,...)
   end
  end)
 end
 self:wrap(ManageSpawnedUnits,'spawn_unit',function(original)
  return function(sm,slot,align,unit,...)
   local old=A.spawning;A.spawning=A:managed(sm._unit) and {parent=sm._unit,slot=tostring(slot)} or nil
   local ok,result=attempt(original,sm,slot,align,unit,...);A.spawning=old
   if not ok then error(result,0)end
   local child=sm:get_unit(slot)
   if alive_unit(child) and (sm.local_only or child:id()==-1) then A:bind(sm._unit,slot,child) end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(ManageSpawnedUnits,'spawn_and_link_unit',function(original)
  return function(sm,joint,slot,unit,...)
   local result=pack(original(sm,joint,slot,unit,...))
   local child=sm:get_unit(slot)
   if not is_client() and A:managed(sm._unit) and alive_unit(child) and type(unit)=='string' and (sm.local_only or child:id()==-1) then
    A:bind(sm._unit,slot,child)
    A:commit(sm._unit,{kind='link',joint=joint,slot=tostring(slot),asset=unit})
   end
   return unpack(result,1,result.n)
  end
 end)
end
A.ENVIRONMENT_KEYS={'OTHER/Env_Alex3','OTHER/Env_Banks','OTHER/Env_Big','OTHER/Env_CJ2','OTHER/Env_FRIEND','OTHER/Env_FS','OTHER/Env_FSD1','OTHER/Env_FSD3','OTHER/Env_Kosugi','OTHER/Env_MallCrasher','OTHER/Env_Mia_1','OTHER/Env_PBR2','OTHER/Env_Peta','OTHER/Env_RVD1','OTHER/Env_Ukra','OTHER/Env_UnderPass','OTHER/Env_WDD1D','OTHER/Env_WDD1N','OTHER/Env_WDD2D'}
function A:make_profile(level,counter)
 local settings={}
 for _,key in ipairs(self.ENVIRONMENT_KEYS or {}) do settings[key]=restoration:get_env_setting(key) end
 settings['OTHER/Env_RVD2']=restoration.Options:GetValue('OTHER/Env_RVD2')
 local profile={level=level,counter=counter,epoch=tostring(os.time())..':'..tostring(math.random(1,2147483646)),enabled=not not restoration.Options:GetValue('OTHER/TimeOfDay'),rolls={math.random(3),math.random(2),math.random(4),math.random(5)},settings=settings}
 Global.restoration_sequence_authority=profile
 return profile
end
function A:install_network()
 self:wrap(BaseNetworkSession,'save',function(original)
  return function(session,data,...)
   local result=pack(original(session,data,...))
   if not is_client() and sess()==session and A:epoch() then data.restoration_authority={epoch=A:epoch(),compatible=clean_copy(A.compatible)} end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(BaseNetworkSession,'load',function(original)
  return function(session,data,...)
   local result=pack(original(session,data,...));local saved=data.restoration_authority
   if type(saved)=='table' and saved.epoch==A:epoch() and type(saved.compatible)=='table' then
    local peers={}
    for id,epoch in pairs(saved.compatible)do if epoch==saved.epoch and session:peer(id) then peers[id]=epoch end end
    session._restoration_authority_epoch=saved.epoch;session._restoration_authority_compatible=peers
    if sess()==session then A.compatible=peers end
   end
   return unpack(result,1,result.n)
  end
 end)
 self:wrap(BaseNetworkSession,'remove_peer',function(original)
  return function(session,peer,id,...)
   if A.compatible then A.compatible[id]=nil end
   if A.pending_dropins then A.pending_dropins[id]=nil end
   for _,state in pairs(A.units)do
    if state.subscribers then state.subscribers[id]=nil end
    if state.acks then state.acks[id]=nil end
   end
   return original(session,peer,id,...)
  end
 end)
 self:wrap(BaseNetworkSession,'check_start_game_intro',function(original)
  return function(session,...)
   if not is_client() and A:profile() then
    for id in pairs(session:peers())do
     if not A.compatible or A.compatible[id]~=A:epoch() then
      local args=pack(...);A.pending_intro=function()original(session,unpack(args,1,args.n))end
      A:log('compat:'..id,'Mission entry waits for peer '..id..' to confirm authority protocol 4.');return
     end
    end
   end
   return original(session,...)
  end
 end)
 self:wrap(HostNetworkSession,'chk_initiate_dropin_pause',function(original)
  return function(session,peer,...)
   if A:profile() and (not A.compatible or A.compatible[peer:id()]~=A:epoch()) then
    A:log('dropin:'..peer:id(),'Drop-in waits for compatible authority handshake from peer '..peer:id())
    A.pending_dropins=A.pending_dropins or {};local args=pack(...)
    A.pending_dropins[peer:id()]=function() original(session,peer,unpack(args,1,args.n)) end
    return
   end
   return original(session,peer,...)
  end
 end)
 self:wrap(HostNetworkSession,'load_level',function(original)
  return function(session,level,mission,world,level_class,level_id,...)
   local counter=(session._load_counter or 0)+1
   if session._LOAD_COUNTER_LIMITS and session._load_counter==session._LOAD_COUNTER_LIMITS[2] then counter=session._LOAD_COUNTER_LIMITS[1] end
   A:make_profile(level_id or Global.game_settings.level_id,counter)
   return original(session,level,mission,world,level_class,level_id,...)
  end
 end)
 self:wrap(ClientNetworkSession,'load_level',function(original)
  return function(session,...)
   local args=pack(...);local level=args[5] or Global.game_settings.level_id;local permit=A.load_permit
   if permit and permit.session==session and permit.level==level and permit.counter==session._load_counter and permit.epoch==A:epoch() then
    A.load_permit=nil;return original(session,unpack(args,1,args.n))
   end
   A:begin_load(session,level,session._load_counter,'direct',function()original(session,unpack(args,1,args.n))end)
  end
 end)
 self:wrap(ClientNetworkSession,'ok_to_load_level',function(original)
  return function(session,counter,...)
   if session._closing or session._received_ok_to_load_level or session._load_counter==counter then return end
   local args=pack(...)
   A:begin_load(session,Global.game_settings.level_id,counter,'native_ok',function()original(session,counter,unpack(args,1,args.n))end)
  end
 end)
 self:wrap(BaseNetworkSession,'update',function(original)
  return function(session,...)
   local result=pack(original(session,...));A:update();return unpack(result,1,result.n)
  end
 end)
end
function A:install()
 assert(not RestorationSequenceSync,'[SequenceAuthority] Remove the previous Restoration_Sequence_Sync companion mod and restart; it conflicts with integrated authority.')
 self:install_sequences();self:install_units();self:install_network()
end
Hooks:Add('NetworkReceivedData','RestorationSequenceAuthority',function(...)A:receive(...)end)
-- Publish only after initialization has completed; callers use this shared table.
rawset(_G, 'RestorationSequenceAuthority', A)
return A
