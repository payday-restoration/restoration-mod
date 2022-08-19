function MenuComponentManager:make_color_text(text_object, resource_color)
	local text = text_object:text()
	local start_ci, end_ci, first_ci = nil

	if resource_color then
		local text_dissected = utf8.characters(text)
		local idsp = Idstring("#")
		start_ci = {}
		end_ci = {}
		first_ci = true

		for i, c in ipairs(text_dissected) do
			if Idstring(c) == idsp then
				local next_c = text_dissected[i + 1]

				if next_c and Idstring(next_c) == idsp then
					if first_ci then
						table.insert(start_ci, i)
					else
						table.insert(end_ci, i)
					end

					first_ci = not first_ci
				end
			end
		end

		if #start_ci == #end_ci then
			for i = 1, #start_ci do
				start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
				end_ci[i] = end_ci[i] - (i * 4 - 1)
			end
		end

		text = string.gsub(text, "##", "")
	end

	text_object:set_text(text)
	text_object:clear_range_color(1, utf8.len(text))

	if resource_color then
		text_object:clear_range_color(1, utf8.len(text))

		if #start_ci ~= #end_ci then
			Application:error("BlackMarketGui: Missing ##'s in :set_info_text() string!", id, new_string, #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				text_object:set_range_color(start_ci[i], end_ci[i], type(resource_color) == "table" and (resource_color[i] or tweak_data.screen_colors.skill_color) or (resource_color or tweak_data.screen_colors.skill_color))
			end
		end
	end
end