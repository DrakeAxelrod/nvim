return function()
	return {
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	}
end
