return {
	{
		"neanias/everforest-nvim",
		priority = 1000, -- Make sure it loads first
		config = function()
			require("everforest").setup({
				---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
				---Default is "medium".
				background = "medium",
			})
			---How much of the backgr
			vim.cmd.colorscheme("everforest")
		end,
	},
}
