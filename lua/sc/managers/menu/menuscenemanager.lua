Month = os.date("%m")
Day = os.date("%d")	

Hooks:PostHook(MenuSceneManager, "init", "ResInit", function(self)
	self._forced_secondaries = {}
end)

Hooks:PostHook(MenuSceneManager, "_set_up_environments", "ResHalloweenColorGrade", function(self)
	if Month == "10" and restoration.Options:GetValue("OTHER/Holiday") then
		self._environments.standard.color_grading = "color_halloween"
	end
end)

-- Hooks:PostHook(MenuSceneManager, "_set_up_templates", "ResChallengesTemplate", function(self)
-- 	self._scene_templates.res_challenges = {
-- 		hide_menu_logo = true
-- 	}
-- end)


--[[

You shittin' me?

function MenuSceneManager:_setup_bg()
	local yaw = 180
	self._bg_unit = World:spawn_unit(Idstring("units/menu/menu_scene/menu_cylinder"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))

	World:spawn_unit(Idstring("units/menu/menu_scene/menu_cylinder_pattern"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	World:spawn_unit(Idstring("units/menu/menu_scene/menu_smokecylinder1"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	World:spawn_unit(Idstring("units/menu/menu_scene/menu_smokecylinder2"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))
	World:spawn_unit(Idstring("units/menu/menu_scene/menu_smokecylinder3"), Vector3(0, 0, 0), Rotation(yaw, 0, 0))

	self._menu_logo = World:spawn_unit(Idstring("units/menu/menu_scene/menu_logo"), Vector3(0, 10, 0), Rotation(yaw, 0, 0))

	self:set_character(managers.blackmarket:get_preferred_character())
		
	--Proof of concept, should add more later. 
	if Month == "12" and restoration.Options:GetValue("OTHER/Holiday") then
			
		local a = self._bg_unit:get_object(Idstring("a_reference"))
		self._xmas_tree = World:spawn_unit(Idstring("units/pd2_dlc2/props/com_props_christmas_tree_sc/com_prop_christmas_tree_sc"), a:position() + Vector3(-150, 250, -50), Rotation(-45 + (math.random(2) - 1) * 180, 0, 0))
		self._snow_pile = World:spawn_unit(Idstring("units/pd2_dlc_cane/props/cne_prop_snow_pile_01_sc/cne_prop_snow_pile_01_sc"), a:position() + Vector3(-35, 275, -75), Rotation(305, 0, 0))
		
		local e_money = self._bg_unit:effect_spawner(Idstring("e_money"))

		if e_money then
			e_money:set_enabled(false)
		end		
		
	end
		
	self:_setup_lobby_characters()
	self:_setup_henchmen_characters()
end

]]--

--Payday 2 Birthday
function MenuSceneManager:_setup_mm10_event_units()
	local positions = {
		Vector3(100, 100, -75),
		Vector3(100, 175, -75),
		Vector3(25, 125, -75),
		Vector3(125, 125, -125),
		Vector3(75, 200, -125),
		Vector3(50, 100, -125),
		Vector3(0, 150, -125),
		Vector3(-25, 75, -75),
		Vector3(0, 50, -125),
		Vector3(-50, 100, -125)
	}
	local unit_names = {
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_diamonds"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_diamonds"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_polkal"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_polkal"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_polkas"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_polkas"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_stars"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_stars"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_stripes"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_stripes"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_zigzag"),
		Idstring("units/pd2_dlc_a10th/props/a10th_gifts/a10th_gifts_zigzag")
	}
	if self._mm10_event_units then
		for _, unit in ipairs(self._mm10_event_units) do
			unit:set_slot(0)
		end
	end
	self._mm10_event_units = {}
	local rotation, unit_index = nil
	for i, position in ipairs(positions) do
		rotation = Rotation((math.random(2) - 1) * 25, 0, 0)
		unit_index = math.random(#unit_names)
		self._mm10_event_units[i] = World:spawn_unit(unit_names[unit_index], position, rotation)
		table.remove(unit_names, unit_index)
	end
	local e_money = self._bg_unit:effect_spawner(Idstring("e_money"))
	if e_money then
		e_money:set_enabled(false)
	end
	if self._confetti_effect then
		World:effect_manager():kill(self._confetti_effect)

		self._confetti_effect = nil
	end
	self._confetti_effect = World:effect_manager():spawn({
		effect = Idstring("effects/payday2/environment/confetti_menu"),
		position = Vector3(0, 0, 0),
		rotation = Rotation()
	})
end

Hooks:PostHook(MenuSceneManager, "_setup_bg", "ResSceneManagerHolidays", function(self)
	if restoration.Options:GetValue("OTHER/Holiday") then
		if Month == "08" and Day == "13" then
			self:_setup_mm10_event_units()
		end
	end
end)