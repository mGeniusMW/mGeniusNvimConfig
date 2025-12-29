vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('n','<C-n>',':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n','<C-b>',':Neotree close', {})
