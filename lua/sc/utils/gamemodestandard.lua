-- Allow state transition from tased to arrested
Hooks:PostHook(GamemodeStandard, "setup_gsm", "sh_setup_gsm", function(self, gsm)
	gsm:add_transition(gsm._states.ingame_electrified, gsm._states.ingame_arrested, gsm._transitions.ingame_electrified.ingame_standard)
end)
