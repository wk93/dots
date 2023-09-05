vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

local function map(mode, shortcut, command)
	vim.keymap.set(mode, shortcut, command, {noremap=true})
end

local function nmap(shortuct, command)
	map('n', shortuct, command)
end

nmap('<leader><leader>', ':Lexplore<CR>')

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
require("lazy").setup(plugins, opts)
