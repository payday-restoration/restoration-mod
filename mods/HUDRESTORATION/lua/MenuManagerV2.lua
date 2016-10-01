local on_stage_success_original = MenuCallbackHandler.on_stage_success

function MenuCallbackHandler:on_stage_success()
managers.loot:on_stage_success()
on_stage_success_original(self)
end