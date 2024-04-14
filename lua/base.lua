vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.mousehide = true
vim.opt.wrap = false
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
--vim.cmd('colorscheme tokyonight-night')
vim.cmd('colorscheme kanagawa')
vim.opt.laststatus = 2
vim.loader.enable()
--vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
