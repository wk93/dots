return {
	"mhartington/formatter.nvim",
	config = function()
		require("formatter").setup({
			logging = true,
			filetype = {
				javascriptreact = { require("formatter.defaults.denofmt") },
				javascript = { require("formatter.defaults.denofmt") },
				typescriptreact = { require("formatter.defaults.denofmt") },
				typescript = { require("formatter.defaults.denofmt") },
				json = { require("formatter.defaults.denofmt") },
				markdown = { require("formatter.defaults.denofmt") },
				lua = { require("formatter.filetypes.lua").stylua },
				rust = { require("formatter.filetypes.rust").rustfmt },
				svelte = { require("formatter.filetypes.svelte").prettier }
			},
		})
	end,
	keys = {
		{
			"<leader>f",
			function()
				vim.cmd("Format")
			end,
		},
	},
}
