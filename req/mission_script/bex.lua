return {
	-- restores some unused sniper spawns with their SOs
	[100372] = {
		values = {
			enabled = true
		}
	},
	[100402] = {
		values = {
			enabled = true
		}
	},
	[100392] = {
		values = {
			enabled = true
		}
	},
	[100412] = {
		values = {
			enabled = true
		}
	},
	[100377] = {
		values = {
			enabled = true
		}
	},
	[100407] = {
		values = {
			enabled = true
		}
	},
	[100397] = {
		values = {
			enabled = true
		}
	},
	[100417] = {
		values = {
			enabled = true
		}
	},
	--disables the weird roof navlink
	[102554] = {
		values = {
			enabled = false
		}
	},
	--fixes Locke repeating the same dialogue causing PONR timer to be reset, fix this OVK
	[103317] = {
		values = {
			dialogue = "Play_loc_bex_109"
		}
	}
}