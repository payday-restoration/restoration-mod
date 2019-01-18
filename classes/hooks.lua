RestorationCoreHooks = RestorationCoreHooks or {}
function RestorationCoreHooks:Post(clss, func, after_orig)
	Hooks:PostHook(clss, func, "Restoration."..func, after_orig)
end

function RestorationCoreHooks:Pre(clss, func, before_orig)
	Hooks:PreHook(clss, func, "Restoration.Pre."..func, before_orig)
end