local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.sidescrolloff = 8

vim.g.mapleader = " "

-- Navi between windows
local opts = { noremap = true }
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize windows with arrows
vim.keymap.set("n", "<S-j>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<S-k>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<S-h>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-l>", ":vertical resize +2<CR>", opts)

require("lazy").setup("plugins")
