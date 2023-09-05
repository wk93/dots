require("wk.core")

local opts = {
  defaults = {
    lazy = true
  },
  colorscheme = { "tokyonight" },
}

require("lazy").setup("wk.plugins", opts)
