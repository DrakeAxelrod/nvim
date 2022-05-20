return {
  flags = {
    debounce_text_changes = 150,
  },
	Lua = {
		runtime = {
			version = "LuaJIT",
		},
		diagnostics = {
			globals = {
				"vim",
				"use",
				"describe",
				"it",
				"assert",
				"before_each",
				"after_each",
			},
		},
		disable = {
			"lowercase-global",
			"undefined-global",
			"unused-local",
			"unused-function",
			"unused-vararg",
			"trailing-space",
		},
	},
}
