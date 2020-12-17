Month = os.date("%m")
Day = os.date("%d")	

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
