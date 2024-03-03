require('packer').startup(function(use)
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'ggandor/leap.nvim'
	use 'NLKNguyen/papercolor-theme'
	use 'folke/tokyonight.nvim'
	use 'rebelot/kanagawa.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'christoomey/vim-tmux-navigator'
	use 'norcalli/nvim-colorizer.lua'
	use 'nvim-tree/nvim-tree.lua'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-tree/nvim-web-devicons' 
	use 'nvim-lualine/lualine.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'romgrk/barbar.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'windwp/nvim-autopairs'
	use 'mhinz/vim-startify'
	use 'ThePrimeagen/vim-be-good'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({
			})
		end
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
			{ "rafamadriz/friendly-snippets" },
		}
	}
end)
