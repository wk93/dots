return {
	"nvimdev/guard.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua")
		ft("typescript,javascript,typescriptreact"):fmt({
			cmd = "deno",
			args = { "fmt", "-" },
			stdin = true,
		})

		require("guard").setup({
			-- the only options for the setup function
			fmt_on_save = true,
			-- Use lsp if no formatter was defined for this filetype
			lsp_as_default_formatter = true,
		})
	end,
}
