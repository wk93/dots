local map = require("wk.core.utils").map

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim', {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = 'smart_case' },
      },
      vimgrep_argument = { 'rg', '--smart-case' }
    }

    telescope.load_extension('fzf')

    local builtin = require('telescope.builtin')

    map("n", {
      ["<leader>ff"] = { builtin.find_files, "find files" },
      ["<leader>fg"] = { builtin.live_grep, "grep files" },
      ["<leader>fb"] = { builtin.buffers, "list of buffers" }
    })
  end,
}
