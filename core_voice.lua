if not _G.restorationvoice then
	_G.restorationvoice = {}
	_G.restorationvoice.ModPath = ModPath
	blt.xaudio.setup()
        log("DOING FRAMEWORK SETUP")
	if _G.voiceline_framework then
		local fuck2 =  Application:nice_path( "./" .. ModPath .. "assets/oggs/voiceover", true )
		for index3, directory2 in pairs(file.GetDirectories(fuck2)) do
			_G.voiceline_framework:register_unit(tostring(directory2))
			local fuck =  Application:nice_path( "./" .. ModPath .. "assets/oggs/voiceover/" .. tostring(directory2), true )
			for index, directory in pairs(file.GetDirectories(fuck)) do
				local ass = Application:nice_path( "./" .. ModPath .. "assets/oggs/voiceover/" .. tostring(directory2) .. "/" .. directory, true )
				_G.voiceline_framework.register_line_type("go fuck yourself lua", tostring(directory2), tostring(directory))
				for index2, filez in pairs(file.GetFiles(ass)) do
					_G.voiceline_framework:register_voiceline(tostring(directory2), tostring(directory), ModPath .. "assets/oggs/voiceover/" .. tostring(directory2) .. "/" .. tostring(directory) .. "/" .. tostring(filez))
				end
			end
		end
	else
		log("NO FRAMEWORK!!!")
	end
end