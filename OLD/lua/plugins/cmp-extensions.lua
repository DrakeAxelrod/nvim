return function()
	return {
		-- Snippet completion source
		{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		-- Lsp completion source
		{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
		-- Buffer completion source
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		-- Path completion source
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		-- Nvim api completion source
		{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
		-- Signature completion source
		{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
		{ "zbirenbaum/copilot-cmp", after = { "nvim-cmp", "copilot.lua" }, requires = { "zbirenbaum/copilot.lua" } },
	}
end
