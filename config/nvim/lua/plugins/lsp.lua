return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		lazy = true,
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require('lsp-zero.settings').preset({})
		end
	},
	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require('lsp-zero.cmp').extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')

			cmp.setup({
				mapping = {
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = false }),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item()
				}
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'jose-elias-alvarez/null-ls.nvim' },
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require('lsp-zero')
			local null_ls = require('null-ls')
			null_opts = lsp.build_options('null-ls', {
				on_attach = function(client, bufnr)
					---
					-- this function is optional
					---
				end
			})

			null_ls.setup({
				on_attach = null_opts.on_attach,
				sources = {
					---
					-- do what you have to do...
					---
				}
			})

			lsp.on_attach(function(_, bufnr)
				lsp.default_keymaps({ buffer = bufnr })

				local opts = { buffer = bufnr }
				local bind = vim.keymap.set
			end)


			lsp.configure('tsserver', {
				single_file_support = false,
				root_dir = require('lspconfig.util').root_pattern('package.json')
			})

			lsp.configure('denols', {
				single_file_support = false,
				root_dir = require('lspconfig.util').root_pattern("deno.json"),
				init_options = {
					lint = true,
				},
			})

			-- (Optional) Configure lua language server for neovim
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


			lsp.setup()
		end
	}
}
