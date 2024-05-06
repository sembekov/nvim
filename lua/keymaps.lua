local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.mapleader = ','

vim.keymap.set("n", "<leader>fz", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
map('n', '<leader>ne', '<cmd>NvimTreeFindFileToggle<CR>zz', opts)
map('n', ',<space>', '<cmd>nohlsearch<CR>', opts)
map('n', '<leader>v', '<cmd>:vsplit<CR>', opts)
map('n', '<leader>h', '<cmd>:split<CR>', opts)
map('n', '<C-u>', '<C-u>zz', { noremap = true })
map('n', '<C-d>', '<C-d>zz', { noremap = true })
map('n', '<leader>md', '<cmd>MarkdownPreviewToggle<CR>', opts)
map('n', '<bs>', '<C-6>', opts)
map('n', '<A-,>', '<cmd>bprevious<CR>', opts)
map('n', '<A-.>', '<cmd>bnext<CR>', opts)
map('n', '<F2>', '@@', opts)


local tmux_vi = {}
tmux_vi.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  }
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})


local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
