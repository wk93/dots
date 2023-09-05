local M = {}

-- keybinding
-- local mapping = { ["<leader><leader>"] = ":Lexplorer" }
-- map("n", mapping)
M.map = function(mode, mappings, opts)
  for k, v in pairs(mappings) do
    opts = opts or {}
    local default = {
      noremap = true,
      silent = true
    }

    opts = vim.tbl_deep_extend("force", default, opts)
    local value = v
    local desc = ""
    if type(v) == "table" then
      value, desc = v[1], v[2]
    end

    opts["desc"] = desc
    vim.keymap.set(mode, k, value, opts)
  end
end

return M
