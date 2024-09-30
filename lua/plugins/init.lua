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
	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = 'nvim-tree/nvim-web-devicons', 
		config = function() 
			require("bufferline").setup()
		end,
	},
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
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"windwp/nvim-ts-autotag",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"mattn/emmet-vim",
		},
		config = function()
			local lsp_zero = require('lsp-zero')

			lsp_zero.on_attach(function(client, bufnr)
				local opts = {buffer = bufnr, remap = false}

				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<leader>fws", function() vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>fd", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "<leader>fca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>frr", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>frn", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
			end)

			require('mason').setup({})
			require('mason-lspconfig').setup({
				ensure_installed = {'tsserver', 'rust_analyzer', 'emmet_ls'},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
					emmet_ls = function()
						require('lspconfig').emmet_ls.setup({
							filetypes = { 'html', 'css', 'typescriptreact', 'javascriptreact', 'javascript', 'typescript', 'blade', 'vue', 'svelte', 'xml' },
						})
					end,
				}
			})

			local cmp = require('cmp')
			local cmp_select = {behavior = cmp.SelectBehavior.Select}

			require('luasnip.loaders.from_vscode').lazy_load()

			cmp.setup({
				sources = {
					{name = 'path'},
					{name = 'nvim_lsp'},
					{name = 'nvim_lua'},
					{name = 'luasnip', keyword_length = 2},
					{name = 'buffer', keyword_length = 3},
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<enter>'] = cmp.mapping.confirm({ select = true }),
					['<C-Space>'] = cmp.mapping.complete(),
				}),
			})
		end,
	},
}

