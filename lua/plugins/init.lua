return {
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "EdenEast/nightfox.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		sync_install = false,
		auto_install = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "python", "rust", "java", "bash", "lua", "javascript", "html", "css", "typescript", "markdown", "markdown_inline" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
		lazy = false
	},
	{ 
		"ggandor/leap.nvim" ,
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{ 
		"nvim-tree/nvim-tree.lua", 
		cmd = "NvimTreeToggle",
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
		lazy = false
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
			})
		end,
	},
	--{
	--	'akinsho/bufferline.nvim', 
	--	version = "*", 
	--	dependencies = 'nvim-tree/nvim-web-devicons', 
	--	config = function() 
	--		require("bufferline").setup()
	--	end,
	--},
	{ "norcalli/nvim-colorizer.lua" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end,
	},
	{ "mhinz/vim-startify" },
	{ "ThePrimeagen/vim-be-good" },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "vijaymarupudi/nvim-fzf" },
		config = function()
			require("fzf-lua").setup {}
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('telescope').setup {
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					}
				}
			}
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require('telescope').load_extension('fzf')
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					visual = "<leader>s",
				}
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require('nvim-ts-autotag').setup()
		end,
		dependencies = {"nvim-treesitter/nvim-treesitter"},
	},
	{
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim", 
		opts = {
			snippetDir = "../snippets",
		} 
	},
}
