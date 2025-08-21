local disabled = {
	values = {
		enabled = false,
	},
}
return {
 	-- don't remove civs or enemies for no reason
	[101207] = disabled,
	[102047] = disabled,
	[103245] = disabled,
}