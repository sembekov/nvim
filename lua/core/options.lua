vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mousehide = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.o.autoread = true
vim.opt.background = 'dark'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.syntax = 'on'
vim.opt.clipboard:append('unnamedplus')
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.o.termguicolors = true
vim.opt.signcolumn = 'no'
vim.o.shortmess = vim.o.shortmess .. "c"
--vim.cmd('colorscheme tokyonight-night')
vim.cmd('colorscheme kanagawa')
--vim.cmd('colorscheme kanagawa-dragon')
--vim.cmd("colorscheme carbonfox")
vim.opt.laststatus = 2
vim.loader.enable()
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.jumpoptions:append('stack')
require 'colorizer'.setup()
