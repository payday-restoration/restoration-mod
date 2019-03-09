local old_menu_scene = MenuSceneManager.init
function MenuSceneManager:init()
	old_menu_scene(self)

	if SC and SC._data.sc_player_weapon_toggle or restoration and restoration.Options:GetValue("SC/SCWeapon") then

	self._global_poses.ray = {
		"husk_generic1",
		"husk_generic2",
		"husk_generic3",
		"husk_generic4"
	}

	end
end