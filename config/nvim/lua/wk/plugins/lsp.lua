return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neodev.nvim", opts = {} },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("neodev").setup({
				-- add any options here, or leave empty to use the default settings
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				single_file_support = false,
				root_dir = require("lspconfig.util").root_pattern("package.json"),
			})

			lspconfig.tailwindcss.setup({})
			lspconfig.denols.setup({
				single_file_support = false,
				root_dir = require("lspconfig.util").root_pattern("deno.json"),
				init_options = {
					lint = true,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
