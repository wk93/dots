return {
	'nvim-telescope/telescope.nvim',
	config = function ()
		require 'telescope'.setup {
			extensions = {
				fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
				['ui-select'] = { require 'telescope.themes'.get_dropdown() }
			},
			vimgrep_argument = { 'rg', '--smart-case' }
		}
		require 'telescope'.load_extension 'fzf'
		require 'telescope'.load_extension 'ui-select'
	end,
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
		'nvim-telescope/telescope-ui-select.nvim'
	},
	ft = 'mason', 
	keys = {
		{ '<leader>ff', function () require 'telescope.builtin'.find_files() end },
		{ '<leader>fg', function () require 'telescope.builtin'.live_grep() end },
		{ '<leader>fb', function () require 'telescope.builtin'.buffers() end }
	}
}
