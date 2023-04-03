return {
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		module = "neo-tree",
		cmd = "Neotree",
		dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.neo-tree")
		end,
	},
	-- Coloscheme
	{
		"arturgoms/moonbow.nvim",
	},
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
	},
	-- Whichkey
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins.configs.whichkey")
		end,
	},

	-- Tabs
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		config = function()
			require("plugins.configs.bufferline")
		end,
	},
	{ "moll/vim-bbye" },
	{
		"tiagovla/scope.nvim",
		config = true,
	},

	-- Maximize splits
	{ "szw/vim-maximizer" },

	-- Surround words with: "({[
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugins.configs.surround")
		end,
	},

	-- Comment stuff
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.configs.comment")
		end,
	},

	-- Icons
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.configs.nvim-webdev-icons")
		end,
	},

	-- Telescope, Fzfinder
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.configs.telescope")
		end,
	},
	{ "nvim-telescope/telescope-media-files.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("plugins.configs.project")
		end,
	},
	{ "ibhagwan/fzf-lua" },

	-- Dashboard Init
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.alpha")
		end,
	},

	-- Auto completions
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-emoji" },
	{ "hrsh7th/cmp-nvim-lua" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	},
	-- Shippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

	-- Manage and Install LSP servers
	{ "williamboman/mason-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.lsp.mason")
		end,
	},

	-- Config for LSP Servers
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("plugins.configs.lsp.lspsaga")
		end,
	},
	{ "onsails/lspkind.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	},

	-- Formatting
	{ "jayp0521/mason-null-ls.nvim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.configs.lsp.null-ls")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "p00f/nvim-ts-rainbow" },
	{ "nvim-treesitter/playground" },

	-- Auto closing
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.configs.autopairs")
		end,
	},
	{ "windwp/nvim-ts-autotag" },

	-- Git integration
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
	{
		"ruifm/gitlinker.nvim",
		config = function()
			require("plugins.configs.gitlinker")
		end,
	},
	{ "mattn/vim-gist" },
	{ "mattn/webapi-vim" },

	-- Color
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("plugins.configs.colorize")
		end,
	},

	-- Sessions TODO: Check the keybinds
	{
		"rmagatti/auto-session",
		config = function()
			require("plugins.configs.auto-session")
		end,
	},

	-- UI
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.configs.dressing")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("plugins.configs.navic")
		end,
		dependencies = { { "neovim/nvim-lspconfig" } },
	},
	{ "kshenoy/vim-signature" },

	-- Notification
	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins.configs.notify")
		end,
	},

	-- Smooth scroll
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("plugins.configs.neoscroll")
		end,
	},

	-- Match up blocks of code TODO: Check keybinds
	{
		"andymass/vim-matchup",
		config = function()
			require("plugins.configs.matchup")
		end,
	},

	-- Bookmarks
	{
		"MattesGroeger/vim-bookmarks",
		config = function()
			require("plugins.configs.bookmark")
		end,
	},

	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("plugins.configs.harpoon")
		end,
	},

	-- Todo Comment TODO: Check the keybinds
	{
		"folke/todo-comments.nvim",
		config = function()
			require("plugins.configs.todo-comments")
		end,
	},

	-- toggle Term TODO: Check the keybinds
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.configs.toggle-term")
		end,
	},

	-- Vista: Ctags vizualizer TODO: Check the keybinds
	{ "liuchengxu/vista.vim" },

	-- Impatient optimize the startup time
	{ "lewis6991/impatient.nvim" },

	-- Rust
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("plugins.configs.rust-tools")
		end,
	},
	{ "Saecki/crates.nvim" },

	-- Spectre: Better find and replace
	{
		"windwp/nvim-spectre",
		config = function()
			require("plugins.configs.spectre")
		end,
	},

	-- Diffview
	-- {
	-- 	"sindrets/diffview.nvim",
	-- 	config = true,
	-- },

	-- Tmux
	{
		"aserowy/tmux.nvim",
		config = true,
	},

	-- Golang
	{
		"ray-x/go.nvim",
		config = true,
	},
	{ "ray-x/guihua.lua" },

	-- Ui Noice
	-- experimental
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		presets = {
	-- 			command_palette = true,
	-- 		},
	-- 	},
	-- },

	-- local plugins need to be explicitly configured with dir
	-- { dir = "~/projects/personal/moonbow.nvim" },
}
