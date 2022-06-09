function HUDHitConfirm:init(hud)
	self._hud_panel = hud.panel

	if self._hud_panel:child("hit_confirm") then
		self._hud_panel:remove(self._hud_panel:child("hit_confirm"))
	end

	if self._hud_panel:child("headshot_confirm") then
		self._hud_panel:remove(self._hud_panel:child("headshot_confirm"))
	end

	if self._hud_panel:child("crit_confirm") then
		self._hud_panel:remove(self._hud_panel:child("crit_confirm"))
	end
	
	if self._hud_panel:child("ineffective_hit_confirmed") then
		self._hud_panel:remove(self._hud_panel:child("ineffective_hit_confirmed"))
	end	
	
	if self._hud_panel:child("effective_hit_confirmed") then
		self._hud_panel:remove(self._hud_panel:child("effective_hit_confirmed"))
	end		

	self._hit_confirm = self._hud_panel:bitmap({
		texture = "guis/textures/pd2/hitconfirm",
		name = "hit_confirm",
		halign = "center",
		visible = false,
		layer = 0,
		blend_mode = "add",
		valign = "center",
		color = Color.white
	})

	self._hit_confirm:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)

	self._crit_confirm = self._hud_panel:bitmap({
		texture = "guis/textures/pd2/hitconfirm_crit",
		name = "crit_confirm",
		halign = "center",
		visible = false,
		layer = 0,
		blend_mode = "add",
		valign = "center",
		color = Color.white
	})

	self._crit_confirm:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)
	
	self._ineffective_hit_confirm = self._hud_panel:bitmap({
		texture = "guis/textures/pd2/hitconfirm_ineffective",
		name = "ineffective_hit_confirmed",
		halign = "center",
		visible = false,
		layer = 0,
		blend_mode = "add",
		valign = "center",
		color = Color.white
	})

	self._ineffective_hit_confirm:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)
	
	self._effective_hit_confirm = self._hud_panel:bitmap({
		texture = "guis/textures/pd2/hitconfirm_effective",
		name = "effective_hit_confirmed",
		halign = "center",
		visible = false,
		layer = 0,
		blend_mode = "add",
		valign = "center",
		color = Color.white
	})

	self._effective_hit_confirm:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)	
	
end

function HUDHitConfirm:on_ineffective_hit_confirmed(damage_scale)
	self._ineffective_hit_confirm:stop()
	self._ineffective_hit_confirm:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25, damage_scale)
end

function HUDHitConfirm:on_effective_hit_confirmed(damage_scale)
	self._effective_hit_confirm:stop()
	self._effective_hit_confirm:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25, damage_scale)
end