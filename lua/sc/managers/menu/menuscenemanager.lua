local old_menu_scene = MenuSceneManager.init
function MenuSceneManager:init()
	old_menu_scene(self)

	self._global_poses.ray = {
		"husk_generic1",
		"husk_generic2",
		"husk_generic3",
		"husk_generic4"
	}

end