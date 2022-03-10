Hooks:PostHook(CivilianBase, "post_init", "res_post_init", function(self)
    self._allow_invisible = true
end)