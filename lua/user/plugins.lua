local fn = vim.fn

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- INFO: Still not supported
--
-- vim.cmd([[
--   augroup lazy_reload
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | Lazy sync
--   augroup end
-- ]])
--
-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

if status_ok then
	lazy.setup({
		-- File explorer
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			module = "neo-tree",
			cmd = "Neotree",
			dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-lua/plenary.nvim" },
			config = function()
				require("configs.neo-tree")
			end,
		},
		-- Coloscheme
		{
			"Shatur/neovim-ayu",
		},
		{
			"ellisonleao/gruvbox.nvim",
		},
		-- Whichkey
		{
			"folke/which-key.nvim",
			config = function()
				require("configs.whichkey")
			end,
		},

		-- Tabs
		{
			"akinsho/bufferline.nvim",
			lazy = false,
			priority = 1000,
			init = function()
				require("configs.bufferline")
			end,
			config = true,
		},
		-- {
		-- 	"romgrk/barbar.nvim",
		-- 	config = function()
		-- 		require("configs.barbar")
		-- 	end,
		-- },
		{ "moll/vim-bbye" },
		{
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup()
			end,
		},

		-- Maximize splits
		{ "szw/vim-maximizer" },

		-- Surround words with: "({[
		{
			"kylechui/nvim-surround",
			config = function()
				require("configs.surround")
			end,
		},

		-- Comment stuff
		{
			"numToStr/Comment.nvim",
			config = function()
				require("configs.comment")
			end,
		},

		-- Icons
		{
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("configs.nvim-webdev-icons")
			end,
		},

		-- Telescope, Fzfinder
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				require("configs.telescope")
			end,
		},
		{ "nvim-telescope/telescope-media-files.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim" },
		{
			"ahmedkhalf/project.nvim",
			config = function()
				require("configs.project")
			end,
		},
		{ "ibhagwan/fzf-lua" },

		-- Dashboard Init
		{
			"goolord/alpha-nvim",
			config = function()
				require("configs.alpha")
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
				require("configs.cmp")
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
				require("configs.lsp.mason")
			end,
		},

		-- Config for LSP Servers
		{
			"glepnir/lspsaga.nvim",
			config = function()
				require("configs.lsp.lspsaga")
			end,
		},
		{ "onsails/lspkind.nvim" },
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("configs.lsp.lspconfig")
			end,
		},

		-- Formatting
		{ "jayp0521/mason-null-ls.nvim" },
		{
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("configs.lsp.null-ls")
			end,
		},

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("configs.treesitter")
			end,
		},
		{ "JoosepAlviste/nvim-ts-context-commentstring" },
		{ "p00f/nvim-ts-rainbow" },
		{ "nvim-treesitter/playground" },

		-- Auto closing
		{
			"windwp/nvim-autopairs",
			config = function()
				require("configs.autopairs")
			end,
		},
		{ "windwp/nvim-ts-autotag" },

		-- Git integration
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("configs.gitsigns")
			end,
		},
		{
			"f-person/git-blame.nvim",
			config = function()
				require("configs.git-blame")
			end,
		},
		{
			"ruifm/gitlinker.nvim",
			config = function()
				require("configs.gitlinker")
			end,
		},
		{ "mattn/vim-gist" },
		{ "mattn/webapi-vim" },

		-- Color
		{
			"NvChad/nvim-colorizer.lua",
			config = function()
				require("configs.colorize")
			end,
		},

		-- Sessions TODO: Check the keybinds
		{
			"rmagatti/auto-session",
			config = function()
				require("configs.auto-session")
			end,
		},

		-- UI
		{
			"stevearc/dressing.nvim",
			config = function()
				require("configs.dressing")
			end,
		},
		{
			"SmiteshP/nvim-navic",
			config = function()
				require("configs.navic")
			end,
			dependencies = { { "neovim/nvim-lspconfig" } },
		},
		{ "kshenoy/vim-signature" },

		-- Notification
		{
			"rcarriga/nvim-notify",
			config = function()
				require("configs.notify")
			end,
		},

		-- Smooth scroll
		{
			"karb94/neoscroll.nvim",
			config = function()
				require("configs.neoscroll")
			end,
		},

		-- Match up blocks of code TODO: Check keybinds
		{
			"andymass/vim-matchup",
			config = function()
				require("configs.matchup")
			end,
		},

		-- Bookmarks
		{
			"MattesGroeger/vim-bookmarks",
			config = function()
				require("configs.bookmark")
			end,
		},

		-- Harpoon
		{
			"ThePrimeagen/harpoon",
			config = function()
				require("configs.harpoon")
			end,
		},

		-- Todo Comment TODO: Check the keybinds
		{
			"folke/todo-comments.nvim",
			config = function()
				require("configs.todo-comments")
			end,
		},

		-- toggle Term TODO: Check the keybinds
		{
			"akinsho/toggleterm.nvim",
			config = function()
				require("configs.toggle-term")
			end,
		},

		-- Vista: Ctags vizualizer TODO: Check the keybinds
		{ "liuchengxu/vista.vim" },

		-- Impatient optimize the startup time
		{ "lewis6991/impatient.nvim" },

		-- Rust
		{
			"simrat39/rust-tools.nvim",
		},
		{ "Saecki/crates.nvim" },

		-- Spectre: Better find and replace
		{
			"windwp/nvim-spectre",
			config = function()
				require("configs.spectre")
			end,
		},

		-- Diffview
		{
			"sindrets/diffview.nvim",
			config = function()
				require("diffview").setup()
			end,
		},

		-- Tmux
		{
			"aserowy/tmux.nvim",
			config = function()
				require("tmux").setup()
			end,
		},

		-- Golang
		{
			"ray-x/go.nvim",
			config = function()
				require("go").setup()
			end,
		},
		{ "ray-x/guihua.lua" },
	}, {
		defaults = {
			lazy = false, -- should plugins be lazy-loaded?
		},
		checker = {
			-- automatically check for plugin updates
			enabled = true,
			concurrency = 5, ---@type number? set to 1 to check for updates very slowly
			notify = true, -- get a notification when new updates are found
			frequency = 3600, -- check for updates every hour
		},
		install = {
			-- install missing plugins on startup. This doesn't increase startup time.
			missing = true,
			-- try to load one of these colorschemes when starting an installation during startup
			colorscheme = { "ayu" },
		},
	})
end
