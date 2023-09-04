return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
		require 'nvim-treesitter.configs'.setup {
		 ensure_installed = { "bash", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "http", "javascript", "jsdoc", "json", "lua", "regex", "rust", "tsx", "typescript", "vim", "vimdoc", "yaml", "query", "svelte", "css" },
		 highlight = {
			 enable = true,
			 additional_vim_regex_highlighting = false
		 },
		 incremental_selection = {
			 enable = true,
			 keymaps = {
				 init_selection = "gnn",
				 node_incremental = "grn",
				 scope_incremental = "grc",
				 node_decremental = "grm",
			 },
			 indent = {
				 enable = true
			 }
		 }
	 }
	end
}
