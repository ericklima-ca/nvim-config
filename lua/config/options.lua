-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true
vim.opt.relativenumber = false

-- Editing: Allow cursor movement across lines with certain keys
vim.opt.whichwrap:append("<,>,[,],h,l")

-- Hyohens are keywords characters
vim.opt.iskeyword:append("-")
