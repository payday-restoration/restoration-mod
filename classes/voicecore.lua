local C = blt_class()
VoicelineFramework = C
VoicelineFramework.BufferedSounds = {}

function C:register_unit(unit_name)
	--log("VF: Registering Unit, " .. unit_name)
	if _G.voiceline_framework then
		_G.voiceline_framework.BufferedSounds[unit_name] = {}
	end
end

function C:register_line_type(unit_name, line_type)
	if _G.voiceline_framework then
		if _G.voiceline_framework.BufferedSounds[unit_name] then
			--log("VF: Registering Type, " .. line_type .. " for Unit " .. unit_name)
			local fuck = _G.voiceline_framework.BufferedSounds[unit_name]
			fuck[line_type] = {}
		end
	end
end

function C:register_voiceline(unit_name, line_type, path)
	if _G.voiceline_framework then
		if _G.voiceline_framework.BufferedSounds[unit_name] then
			local fuck = _G.voiceline_framework.BufferedSounds[unit_name]
			if fuck[line_type] then
				--log("VF: Registering Path, " .. path .. " for Unit " .. unit_name)
				table.insert(fuck[line_type], XAudio.Buffer:new(path))
			end
		end
	end
end

if not _G.voiceline_framework then
	blt.xaudio.setup()
	_G.voiceline_framework = VoicelineFramework:new()
end