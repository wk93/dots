return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("neodev").setup({
        -- add any options here, or leave empty to use the default settings
      })

      local lspconfig = require('lspconfig')

      -- example to setup lua_ls and enable call snippets
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            },
            workspace = {
              checkThirdParty = false
            }
          }
        }
      })
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
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
