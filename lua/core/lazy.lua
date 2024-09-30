-- Bootstrap lazy.nvim (existing snippet)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up mapleader before loading Lazy.nvim
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Load plugins using Lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }, -- Import your plugins from the 'plugins' directory
  },
  install = { colorscheme = { "tokyonight-night", "kanagawa", "carbonfox" } },
  checker = { enabled = true, notify = false },
})

