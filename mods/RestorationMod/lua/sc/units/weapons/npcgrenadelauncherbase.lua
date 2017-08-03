NPCGrenadeLauncherBase = NPCGrenadeLauncherBase or class(GrenadeLauncherBase)
function NPCGrenadeLauncherBase:init(...)
	NPCGrenadeLauncherBase.super.init(self, ...)
end
function NPCGrenadeLauncherBase:fire_blank(direction, impact)
	World:effect_manager():spawn(self._muzzle_effect_table)
	self:_sound_singleshot()
end
